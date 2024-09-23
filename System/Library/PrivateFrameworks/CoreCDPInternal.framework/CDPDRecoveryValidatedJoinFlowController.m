@implementation CDPDRecoveryValidatedJoinFlowController

- (id)recoveryValidatorWithDevices:(id)a3 forMultipleICSC:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  CDPDRecoveryValidatedJoinFlowController *v10;
  CDPDRemoteDeviceSecretValidator *v11;
  void *v12;
  void *v13;
  CDPDRemoteDeviceSecretValidator *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  CDPDRecoveryValidatedJoinFlowController *v24;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__0;
  v23[4] = __Block_byref_object_dispose__0;
  v10 = self;
  v24 = v10;
  v11 = [CDPDRemoteDeviceSecretValidator alloc];
  -[CDPDRecoveryFlowController recoveryContext](v10, "recoveryContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CDPDDeviceSecretValidator initWithContext:delegate:](v11, "initWithContext:delegate:", v13, v10);

  -[CDPDDeviceSecretValidator setIsUsingMultipleICSC:](v14, "setIsUsingMultipleICSC:", v6);
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __110__CDPDRecoveryValidatedJoinFlowController_recoveryValidatorWithDevices_forMultipleICSC_withCompletionHandler___block_invoke;
  v20 = &unk_24C81C0A8;
  v15 = v9;
  v21 = v15;
  v22 = v23;
  -[CDPDRemoteDeviceSecretValidator setValidSecretHandler:](v14, "setValidSecretHandler:", &v17);
  -[CDPDDeviceSecretValidator setSupportedEscapeOfferMask:](v14, "setSupportedEscapeOfferMask:", -[CDPDRecoveryValidatedJoinFlowController _escapeOfferForDevices:remoteApproval:forMultipleICSC:](v10, "_escapeOfferForDevices:remoteApproval:forMultipleICSC:", v8, 0, v6, v17, v18, v19, v20));

  _Block_object_dispose(v23, 8);
  return v14;
}

void __110__CDPDRecoveryValidatedJoinFlowController_recoveryValidatorWithDevices_forMultipleICSC_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (BOOL)shouldOfferPiggybackingBasedRecovery
{
  NSObject *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _DWORD v18[2];
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isInternalBuild")
    && CFPreferencesGetAppBooleanValue(CFSTR("offerPiggybackingForCDPRepair"), CFSTR("com.apple.corecdp"), 0))
  {
    _CDPLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[CDPDRecoveryValidatedJoinFlowController shouldOfferPiggybackingBasedRecovery].cold.1();
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authKitAccountWithAltDSID:", v8);
    v3 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "piggybackingApprovalEligible:", v3);

    v11 = objc_msgSend(MEMORY[0x24BE1A4A0], "isCDPRepairWithProximityBasedPiggybackingEnabled");
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = 67109632;
      v18[1] = v11;
      v19 = 2048;
      v20 = objc_msgSend(v17, "type");
      v21 = 1024;
      v22 = v10;
      _os_log_debug_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEBUG, "\"piggybackingBasedCDPRecoveryFeatureEnabled = %d CDPRepairContext = %ld piggybackingApprovalEligible = %d\", (uint8_t *)v18, 0x18u);

    }
    if (v11)
    {
      -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "type") == 2)
        v4 = v10;
      else
        v4 = 0;

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (unint64_t)_escapeOfferForDevices:(id)a3 remoteApproval:(BOOL)a4 forMultipleICSC:(BOOL)a5
{
  id v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  uint8_t buf[16];

  v7 = a3;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryValidatedJoinFlowController _escapeOfferForDevices:remoteApproval:forMultipleICSC:].cold.2(self, v8);

  v9 = objc_msgSend(v7, "count");
  if (v9 < 2)
  {
    v11 = 1;
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Escape available: other devices\", buf, 2u);
    }

    v11 = 3;
  }
  if ((objc_msgSend(MEMORY[0x24BE1A4A0], "isVirtualMachine") & 1) == 0)
  {
    -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");

    if (v14 == 2 || !a5)
    {
      _CDPLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v15, OS_LOG_TYPE_DEFAULT, "\"Escape available: account reset\", buf, 2u);
      }

      v11 |= 8uLL;
    }
  }
  v16 = (void *)MEMORY[0x24BE1A3F8];
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v16, "isSubsetOfContextTypeSignIn:", objc_msgSend(v18, "type"));

  if ((_DWORD)v16)
  {
    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_DEFAULT, "\"Escape available: skip flow\", buf, 2u);
    }

    v11 |= 0x10uLL;
  }
  -[CDPDRecoveryFlowController secureBackupController](self, "secureBackupController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v21 = objc_msgSend(v20, "supportsRecoveryKeyWithError:", &v31);
  v22 = v31;

  if (v21)
  {
    _CDPLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v23, OS_LOG_TYPE_DEFAULT, "\"Escape available: recovery key\", buf, 2u);
    }

    v11 |= 0x20uLL;
  }
  if (v22)
  {
    _CDPLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CDPDRecoveryValidatedJoinFlowController _escapeOfferForDevices:remoteApproval:forMultipleICSC:].cold.1();

  }
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "_supportsCustodianRecovery");

  if (v27)
  {
    _CDPLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v28, OS_LOG_TYPE_DEFAULT, "\"Escape available: Custodian Recovery\", buf, 2u);
    }

    v11 |= 0x40uLL;
  }
  if (-[CDPDRecoveryValidatedJoinFlowController shouldOfferPiggybackingBasedRecovery](self, "shouldOfferPiggybackingBasedRecovery"))
  {
    _CDPLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v29, OS_LOG_TYPE_DEFAULT, "\"Escape available: Piggybacking\", buf, 2u);
    }

    v11 |= 0x80uLL;
  }

  return v11;
}

- (void)beginInteractiveRecoveryForDevices:(id)a3 isUsingMultipleICSC:(BOOL)a4 usingValidator:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  objc_super v19;
  uint8_t buf[16];

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(v10, "supportedEscapeOfferMask");
  if ((v11 & 0x20) != 0)
  {
    v15 = 0;
  }
  else
  {
    -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_recoveryMethodAvailable");

    v15 = v14 ^ 1;
  }
  objc_storeStrong((id *)&self->_cdpDevices, a3);
  v16 = objc_msgSend(v9, "count");
  if ((v11 & 0xC0) != 0 || v16 || !v15)
  {
    v19.receiver = self;
    v19.super_class = (Class)CDPDRecoveryValidatedJoinFlowController;
    -[CDPDRecoveryFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:](&v19, sel_beginInteractiveRecoveryForDevices_isUsingMultipleICSC_usingValidator_, v9, v6, v10);
  }
  else if ((v11 & 8) != 0)
  {
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, "\"User attempted to sign in after burning out all recovery options, present hard limits\", buf, 2u);
    }

    -[CDPDRecoveryValidatedJoinFlowController _handleNoRecoveryFactorsWithMask:validator:](self, "_handleNoRecoveryFactorsWithMask:validator:", v11, v10);
  }
  else
  {
    _CDPStateError();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancelValidationWithError:", v17);

  }
}

- (void)remoteSecretValidator:(id)a3 applyToJoinCircleWithJoinHandler:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a4;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryValidatedJoinFlowController remoteSecretValidator:applyToJoinCircleWithJoinHandler:].cold.1();

  -[CDPDRecoveryFlowController circleController](self, "circleController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyToJoinCircleWithJoinHandler:", v5);

}

- (void)cancelRemoteSecretValidatorApplicationToJoinCircle:(id)a3
{
  NSObject *v4;
  void *v5;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryValidatedJoinFlowController cancelRemoteSecretValidatorApplicationToJoinCircle:].cold.1();

  -[CDPDRecoveryFlowController circleController](self, "circleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelApplicationToJoinCircle");

}

- (void)remoteSecretValidator:(id)a3 attemptCustodianRecoveryWithInfo:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a4;
  -[CDPDRecoveryFlowController circleController](self, "circleController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "circleProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __109__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCustodianRecoveryWithInfo_completion___block_invoke;
  v12[3] = &unk_24C81C0D0;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "recoverOctagonUsingCustodianInfo:completion:", v8, v12);

}

void __109__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCustodianRecoveryWithInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);

  v3 = a2;
  if (v3)
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __109__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCustodianRecoveryWithInfo_completion___block_invoke_cold_1();

    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v5();

}

- (void)remoteSecretValidator:(id)a3 attemptCircleJoinWithPiggybackingContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a5;
  v8 = a4;
  -[CDPDRecoveryFlowController circleController](self, "circleController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __117__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCircleJoinWithPiggybackingContext_completion___block_invoke;
  v11[3] = &unk_24C81C0F8;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "joinCircleWithContext:completion:", v8, v11);

}

void __117__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCircleJoinWithPiggybackingContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;

  v5 = a3;
  v6 = objc_msgSend(a2, "didJoin");
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if ((v6 & 1) != 0)
  {
    if (v8)
      __117__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCircleJoinWithPiggybackingContext_completion___block_invoke_cold_1();
  }
  else if (v8)
  {
    __117__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCircleJoinWithPiggybackingContext_completion___block_invoke_cold_2();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)secretValidatorWillAttemptRecovery
{
  id v2;

  -[CDPDRecoveryFlowController circleController](self, "circleController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareCircleStateForRecovery");

}

- (BOOL)secretValidator:(id)a3 shouldAcceptRecoveryError:(id *)a4
{
  return 1;
}

- (void)secretValidator:(id)a3 recoverSecureBackupWithContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"Attempting to recover a record with context: %@\", buf, 0xCu);
  }

  -[CDPDRecoveryFlowController secureBackupController](self, "secureBackupController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __101__CDPDRecoveryValidatedJoinFlowController_secretValidator_recoverSecureBackupWithContext_completion___block_invoke;
  v12[3] = &unk_24C81C120;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "performEscrowRecoveryWithRecoveryContext:completion:", v7, v12);

}

void __101__CDPDRecoveryValidatedJoinFlowController_secretValidator_recoverSecureBackupWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void (*v11)(void);
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "recoveredClique");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "recoveredClique");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"Recovered a clique: %@\", (uint8_t *)&v12, 0xCu);

    }
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __101__CDPDRecoveryValidatedJoinFlowController_secretValidator_recoverSecureBackupWithContext_completion___block_invoke_cold_1();

    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v11();

}

- (void)secretValidator:(id)a3 didFailRecovery:(id)a4 withError:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  uint64_t v15;
  NSObject *v16;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
    -[CDPDRecoveryValidatedJoinFlowController secretValidator:didFailRecovery:withError:completion:].cold.1();
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))v13;
  if (objc_msgSend(v12, "isLoginHardLimit"))
  {
    -[CDPDRecoveryValidatedJoinFlowController _handleHardLimitErrorForCurrentContextWithDevice:completion:](self, "_handleHardLimitErrorForCurrentContextWithDevice:completion:", v11, v14);
  }
  else if (objc_msgSend(v12, "isLoginSoftLimit"))
  {
    -[CDPDRecoveryValidatedJoinFlowController _handleSoftLimitErrorForCurrentContextWithDevice:completion:](self, "_handleSoftLimitErrorForCurrentContextWithDevice:completion:", v11, v14);
  }
  else
  {
    v15 = objc_msgSend(v12, "cdp_isCDPErrorWithCode:", -5206) ^ 1;
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 67109120;
      v17[1] = v15;
      _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"Non-terminating error detected, with retry option: %{BOOL}d\", (uint8_t *)v17, 8u);
    }

    ((void (**)(_QWORD, uint64_t, id))v14)[2](v14, v15, v12);
  }

}

- (void)_handleHardLimitErrorForCurrentContextWithDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  v7 = a3;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Starting handling hard limit error...\", v9, 2u);
  }

  -[CDPDRecoveryValidatedJoinFlowController _handleLimit:forDevice:completion:](self, "_handleLimit:forDevice:completion:", 2, v7, v6);
}

- (void)_handleSoftLimitErrorForCurrentContextWithDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  v7 = a3;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Starting handling soft limit error...\", v9, 2u);
  }

  -[CDPDRecoveryValidatedJoinFlowController _handleLimit:forDevice:completion:](self, "_handleLimit:forDevice:completion:", 1, v7, v6);
}

- (void)_handleLimit:(unint64_t)a3 forDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  CDPDRecoveryValidatedJoinFlowController *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  _QWORD v73[5];
  id v74;
  id v75;
  unint64_t v76;
  _QWORD v77[5];
  id v78;
  id v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v66 = v8;
  -[CDPDRecoveryValidatedJoinFlowController _userInfoForLimit:withDevice:](self, "_userInfoForLimit:withDevice:", a3, v8);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  v10 = (void *)MEMORY[0x24BDFC2A0];
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_QWORD *)MEMORY[0x24BE1A7E8];
  if (a3 != 1)
    v13 = (_QWORD *)MEMORY[0x24BE1A6A0];
  objc_msgSend(v10, "analyticsEventWithContext:eventName:category:", v12, *v13, *MEMORY[0x24BE1A860]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDPDRecoveryValidatedJoinFlowController _fallbackRecoveryOptionsWithCompletion:](self, "_fallbackRecoveryOptionsWithCompletion:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryValidatedJoinFlowController _cancelRecoveryOptionWithCompletion:](self, "_cancelRecoveryOptionWithCompletion:", v9);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v9;
  -[CDPDRecoveryValidatedJoinFlowController _tryAgainLaterOptionWithCompletion:](self, "_tryAgainLaterOptionWithCompletion:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v65 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v72 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v82 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        if (v23)
        {
          objc_msgSend(v23, "telemetryRecoveryOption");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
    }
    while (v20);
  }

  if (v71)
    objc_msgSend(v68, "addObject:", v71);
  if (v16)
    objc_msgSend(v72, "addObject:", v16);
  -[CDPDRecoveryFlowController validator](self, "validator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "supportedEscapeOfferMask");

  if ((v26 & 0x82) != 0)
  {
    -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v70, v69, v18);
    -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v70, v69, v72);
    v27 = v16;
    if (!v16)
      goto LABEL_62;
    goto LABEL_32;
  }
  if ((v26 & 0x60) != 0)
  {
    -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v70, v69, v18);
    if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
      v28 = v72;
    else
      v28 = v68;
    -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v70, v69, v28);
    v29 = objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled");
    if (v16 && v29)
    {
      v27 = v16;
    }
    else
    {
      if (!v71)
        goto LABEL_62;
      v27 = v71;
    }
LABEL_32:
    objc_msgSend(v27, "telemetryRecoveryOption");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v31);
LABEL_33:

    goto LABEL_62;
  }
  v30 = objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled");
  if ((v26 & 8) == 0)
  {
    if (!v30)
    {
      -[CDPDRecoveryValidatedJoinFlowController _skipSignInRecoveryOptionWithCompletion:](self, "_skipSignInRecoveryOptionWithCompletion:", v67);
      v36 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v36;
      if (v36)
      {
        v85 = v36;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v70, v69, v37);

      }
      objc_msgSend(v31, "telemetryRecoveryOption");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v38);

      goto LABEL_33;
    }
    -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v70, v69, v72);
    if (!v16)
      goto LABEL_62;
    v27 = v16;
    goto LABEL_32;
  }
  if (!v30)
  {
    v73[0] = MEMORY[0x24BDAC760];
    v73[1] = 3221225472;
    v73[2] = __77__CDPDRecoveryValidatedJoinFlowController__handleLimit_forDevice_completion___block_invoke_2;
    v73[3] = &unk_24C81C148;
    v75 = v67;
    v76 = a3;
    v73[4] = self;
    v74 = v66;
    -[CDPDRecoveryValidatedJoinFlowController _accountResetRecoveryOptionWithCompletion:](self, "_accountResetRecoveryOptionWithCompletion:", v73);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v65, "addObject:", v39);
      if (a3 == 2)
      {
        if (!objc_msgSend(v18, "count"))
        {
          v40 = self;
          v42 = v69;
          v41 = v70;
          v43 = v65;
LABEL_52:
          -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](v40, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v41, v42, v43);
LABEL_55:
          objc_msgSend(v39, "telemetryRecoveryOption");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v46);

          v31 = v75;
          goto LABEL_33;
        }
LABEL_51:
        -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v70, v69, v18);
        v40 = self;
        v41 = v70;
        v42 = v69;
        v43 = v68;
        goto LABEL_52;
      }
    }
    else if (a3 == 2)
    {
      goto LABEL_51;
    }
    -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v70, v69, v72);
    if (v16)
    {
      objc_msgSend(v16, "telemetryRecoveryOption");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v45);

    }
    goto LABEL_55;
  }
  if (a3 == 2)
  {
    v32 = (void *)MEMORY[0x24BE1A3F8];
    -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "context");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = objc_msgSend(v32, "isSubsetOfContextTypeSignIn:", objc_msgSend(v34, "type"));

    if (!(_DWORD)v32)
    {
      v77[0] = MEMORY[0x24BDAC760];
      v77[1] = 3221225472;
      v77[2] = __77__CDPDRecoveryValidatedJoinFlowController__handleLimit_forDevice_completion___block_invoke;
      v77[3] = &unk_24C81C148;
      v77[4] = self;
      v79 = v67;
      v80 = 2;
      v78 = v66;
      -[CDPDRecoveryValidatedJoinFlowController _accountResetRecoveryOptionWithCompletion:](self, "_accountResetRecoveryOptionWithCompletion:", v77);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v47)
        objc_msgSend(v65, "addObject:", v47);
      -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v70, v69, v65);
      objc_msgSend(v47, "telemetryRecoveryOption");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v48);

      -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v70, v69, v68);
      if (v71)
      {
        objc_msgSend(v71, "telemetryRecoveryOption");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v49);

      }
      v35 = v79;
      goto LABEL_61;
    }
    -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v70, v69, v72);
    if (v16)
    {
      objc_msgSend(v16, "telemetryRecoveryOption");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v35);
LABEL_61:

    }
  }
  else if (a3 == 1)
  {
    -[CDPDRecoveryValidatedJoinFlowController _populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:](self, "_populateUserInfo:recoveryIndexHandlers:withRecoveryOptions:", v70, v69, v72);
    if (v16)
    {
      objc_msgSend(v16, "telemetryRecoveryOption");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v44);

    }
  }
LABEL_62:
  _CDPStateError();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "aaf_arrayAsCommaSeperatedString");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v51, *MEMORY[0x24BE1A648]);

  v52 = (void *)MEMORY[0x24BDD16E0];
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "context");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "numberWithInteger:", objc_msgSend(v54, "totalEscrowDeviceCount"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v55, *MEMORY[0x24BE1A7F8]);

  v56 = (void *)MEMORY[0x24BDD16E0];
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "context");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "numberWithInteger:", objc_msgSend(v58, "validEscrowDeviceCount"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v59, *MEMORY[0x24BE1A800]);

  v60 = (void *)MEMORY[0x24BDD16E0];
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "context");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "numberWithInteger:", objc_msgSend(v62, "totalRecoveryAttempts"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v63, *MEMORY[0x24BE1A6D8]);

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "sendEvent:", v14);

  -[CDPDRecoveryValidatedJoinFlowController _showEntryLimitError:withRecoveryOptionHandlers:defaultIndex:completion:](self, "_showEntryLimitError:withRecoveryOptionHandlers:defaultIndex:completion:", v50, v69, 0, v67);
}

void __77__CDPDRecoveryValidatedJoinFlowController__handleLimit_forDevice_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 48);
    _CDPStateError();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleLimit:forDevice:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

void __77__CDPDRecoveryValidatedJoinFlowController__handleLimit_forDevice_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 48);
    _CDPStateError();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleLimit:forDevice:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

- (void)_populateUserInfo:(id)a3 recoveryIndexHandlers:(id)a4 withRecoveryOptions:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    v12 = *MEMORY[0x24BDD0FE8];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (v14)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v16, "mutableCopy");

          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v14, "localizedRecoveryOption");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v18);

          objc_msgSend(v14, "recoveryHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = _Block_copy(v19);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v21);

          objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v12);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

}

- (id)_userInfoForLimit:(unint64_t)a3 withDevice:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (a3 == 2)
  {
    if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
    {
      -[CDPDRecoveryValidatedJoinFlowController _hardLimitErrorBodyWithDevice:](self, "_hardLimitErrorBodyWithDevice:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = (void *)v8;
      goto LABEL_8;
    }
LABEL_6:
    -[CDPDRecoveryValidatedJoinFlowController _softLimitErrorBodyForDevice:](self, "_softLimitErrorBodyForDevice:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a3 == 1)
    goto LABEL_6;
  v7 = 0;
LABEL_8:
  -[CDPDRecoveryValidatedJoinFlowController _entryLimitTitleForDevice:](self, "_entryLimitTitleForDevice:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryValidatedJoinFlowController _infoDictionaryWithTitle:andBody:](self, "_infoDictionaryWithTitle:andBody:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_fallbackRecoveryOptionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Attempting to fallback recovery options...\", buf, 2u);
  }

  -[CDPDRecoveryFlowController validator](self, "validator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportedEscapeOfferMask");

  if ((v8 & 2) != 0)
  {
    -[CDPDRecoveryValidatedJoinFlowController _deviceSelectionRecoveryOptionWithCompletion:](self, "_deviceSelectionRecoveryOptionWithCompletion:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if ((v8 & 0x80) != 0)
  {
    -[CDPDRecoveryValidatedJoinFlowController _piggybackingRecoveryOptionWithCompletion:](self, "_piggybackingRecoveryOptionWithCompletion:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if ((~v8 & 0x60) == 0)
  {
    if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
    {
      -[CDPDRecoveryValidatedJoinFlowController _recoveryMethodRecoveryOptionWithCompletion:](self, "_recoveryMethodRecoveryOptionWithCompletion:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    -[CDPDRecoveryValidatedJoinFlowController _recoveryKeyRecoveryOptionWithCompletion:](self, "_recoveryKeyRecoveryOptionWithCompletion:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if ((v8 & 0x20) != 0)
    goto LABEL_13;
  if ((v8 & 0x40) == 0)
    goto LABEL_15;
  -[CDPDRecoveryValidatedJoinFlowController _custodianRecoveryOptionWithCompletion:](self, "_custodianRecoveryOptionWithCompletion:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v10 = (void *)v9;
  objc_msgSend(v5, "addObject:", v9);

LABEL_15:
  if (!objc_msgSend(v5, "count"))
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"No fallback available\", v13, 2u);
    }

  }
  return v5;
}

- (id)_skipSignInRecoveryOptionWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  CDPDRecoveryOption *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Creating recovery option: Skip\", buf, 2u);
  }

  v5 = objc_alloc_init(CDPDRecoveryOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_BUTTON_OK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryOption setLocalizedRecoveryOption:](v5, "setLocalizedRecoveryOption:", v7);

  -[CDPDRecoveryOption setTelemetryRecoveryOption:](v5, "setTelemetryRecoveryOption:", *MEMORY[0x24BE1A888]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__CDPDRecoveryValidatedJoinFlowController__skipSignInRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_24C81C170;
  v11 = v3;
  v8 = v3;
  -[CDPDRecoveryOption setRecoveryHandler:](v5, "setRecoveryHandler:", v10);

  return v5;
}

void __83__CDPDRecoveryValidatedJoinFlowController__skipSignInRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)_accountResetRecoveryOptionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  CDPDRecoveryOption *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Creating recovery option: Reset\", buf, 2u);
  }

  v6 = objc_alloc_init(CDPDRecoveryOption);
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_ALERT_BUTTON_TITLE_DELETE_ICLOUD_DATA"), CFSTR("Localizable-Walrus"));
  else
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_BUTTON_RESET"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryOption setLocalizedRecoveryOption:](v6, "setLocalizedRecoveryOption:", v8);

  -[CDPDRecoveryOption setTelemetryRecoveryOption:](v6, "setTelemetryRecoveryOption:", *MEMORY[0x24BE1A948]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __85__CDPDRecoveryValidatedJoinFlowController__accountResetRecoveryOptionWithCompletion___block_invoke;
  v11[3] = &unk_24C81C1E8;
  v11[4] = self;
  v12 = v4;
  v9 = v4;
  -[CDPDRecoveryOption setRecoveryHandler:](v6, "setRecoveryHandler:", v11);

  return v6;
}

void __85__CDPDRecoveryValidatedJoinFlowController__accountResetRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  uint8_t buf[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v2, OS_LOG_TYPE_DEFAULT, "\"User elected to Reset Encrypted Data, confirming...\", buf, 2u);
  }

  v3 = objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __85__CDPDRecoveryValidatedJoinFlowController__accountResetRecoveryOptionWithCompletion___block_invoke_46;
    v7[3] = &unk_24C81C198;
    v7[4] = v4;
    objc_msgSend(v4, "_showQuotaScreenWithCompletion:", v7);
  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __85__CDPDRecoveryValidatedJoinFlowController__accountResetRecoveryOptionWithCompletion___block_invoke_2;
    v5[3] = &unk_24C81C1C0;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "_showAccountResetConfirmationWithCompletion:", v5);

  }
}

void __85__CDPDRecoveryValidatedJoinFlowController__accountResetRecoveryOptionWithCompletion___block_invoke_46(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "validator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_handleResetOptionWithResetRequested:localSecret:validator:", a2, v5, v6);

}

uint64_t __85__CDPDRecoveryValidatedJoinFlowController__accountResetRecoveryOptionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleResetOptionWithResetRequested:(BOOL)a3 localSecret:(id)a4 validator:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (!v6)
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CDPDRecoveryValidatedJoinFlowController _handleResetOptionWithResetRequested:localSecret:validator:].cold.4();
    goto LABEL_14;
  }
  -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (!v10)
  {
    if (v12)
      -[CDPDRecoveryValidatedJoinFlowController _handleResetOptionWithResetRequested:localSecret:validator:].cold.1(v11, v13, v14, v15, v16, v17, v18, v19);
LABEL_14:

    -[CDPDRecoveryFlowController validator](self, "validator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPStateError();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "cancelValidationWithError:", v29);

    goto LABEL_15;
  }
  if (v12)
    -[CDPDRecoveryValidatedJoinFlowController _handleResetOptionWithResetRequested:localSecret:validator:].cold.3(v11, v13, v14, v15, v16, v17, v18, v19);

  if (!v8)
  {
    -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "context");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __102__CDPDRecoveryValidatedJoinFlowController__handleResetOptionWithResetRequested_localSecret_validator___block_invoke;
    v33[3] = &unk_24C81C210;
    v33[4] = self;
    v34 = v9;
    objc_msgSend(v30, "cdpContext:createLocalSecretWithCompletion:", v32, v33);

    goto LABEL_16;
  }
  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryValidatedJoinFlowController _handleResetOptionWithResetRequested:localSecret:validator:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);

  -[CDPDRecoveryFlowController validator](self, "validator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "resetAccountCDPStateWithEscapeOptionsOffered:andSetSecret:", 1, v8);
LABEL_15:

LABEL_16:
}

void __102__CDPDRecoveryValidatedJoinFlowController__handleResetOptionWithResetRequested_localSecret_validator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || objc_msgSend(v6, "code") == -5502)
  {
    objc_msgSend(*(id *)(a1 + 32), "validator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetAccountCDPStateWithEscapeOptionsOffered:andSetSecret:", 1, v5);

  }
  else
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __102__CDPDRecoveryValidatedJoinFlowController__handleResetOptionWithResetRequested_localSecret_validator___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "cancelValidationWithError:", v7);
  }

}

- (id)_cancelRecoveryOptionWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  CDPDRecoveryOption *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Creating recovery option: Cancel\", buf, 2u);
  }

  v5 = objc_alloc_init(CDPDRecoveryOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_CANCEL_BUTTON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryOption setLocalizedRecoveryOption:](v5, "setLocalizedRecoveryOption:", v7);

  -[CDPDRecoveryOption setTelemetryRecoveryOption:](v5, "setTelemetryRecoveryOption:", *MEMORY[0x24BE1A888]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__CDPDRecoveryValidatedJoinFlowController__cancelRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_24C81C170;
  v11 = v3;
  v8 = v3;
  -[CDPDRecoveryOption setRecoveryHandler:](v5, "setRecoveryHandler:", v10);

  return v5;
}

void __79__CDPDRecoveryValidatedJoinFlowController__cancelRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)_tryAgainLaterOptionWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  CDPDRecoveryOption *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Creating recovery option: Try Again\", buf, 2u);
  }

  v5 = objc_alloc_init(CDPDRecoveryOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_CUSTODIAN_TRY_LATER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryOption setLocalizedRecoveryOption:](v5, "setLocalizedRecoveryOption:", v7);

  -[CDPDRecoveryOption setTelemetryRecoveryOption:](v5, "setTelemetryRecoveryOption:", *MEMORY[0x24BE1A970]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__CDPDRecoveryValidatedJoinFlowController__tryAgainLaterOptionWithCompletion___block_invoke;
  v10[3] = &unk_24C81C170;
  v11 = v3;
  v8 = v3;
  -[CDPDRecoveryOption setRecoveryHandler:](v5, "setRecoveryHandler:", v10);

  return v5;
}

void __78__CDPDRecoveryValidatedJoinFlowController__tryAgainLaterOptionWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __78__CDPDRecoveryValidatedJoinFlowController__tryAgainLaterOptionWithCompletion___block_invoke_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    _CDPStateError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

- (id)_deviceSelectionRecoveryOptionWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  CDPDRecoveryOption *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Creating recovery option: Choose Another Device\", buf, 2u);
  }

  v5 = objc_alloc_init(CDPDRecoveryOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_BUTTON_CHOOSE_ANOTHER_DEVICE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryOption setLocalizedRecoveryOption:](v5, "setLocalizedRecoveryOption:", v7);

  -[CDPDRecoveryOption setTelemetryRecoveryOption:](v5, "setTelemetryRecoveryOption:", *MEMORY[0x24BE1A8C0]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __88__CDPDRecoveryValidatedJoinFlowController__deviceSelectionRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_24C81C170;
  v11 = v3;
  v8 = v3;
  -[CDPDRecoveryOption setRecoveryHandler:](v5, "setRecoveryHandler:", v10);

  return v5;
}

void __88__CDPDRecoveryValidatedJoinFlowController__deviceSelectionRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __88__CDPDRecoveryValidatedJoinFlowController__deviceSelectionRecoveryOptionWithCompletion___block_invoke_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    _CDPStateError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

- (id)_piggybackingRecoveryOptionWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  CDPDRecoveryOption *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Creating recovery option: Send Code to My Devices\", buf, 2u);
  }

  v5 = objc_alloc_init(CDPDRecoveryOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_BUTTON_PIGGYBACKING"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryOption setLocalizedRecoveryOption:](v5, "setLocalizedRecoveryOption:", v7);

  -[CDPDRecoveryOption setTelemetryRecoveryOption:](v5, "setTelemetryRecoveryOption:", *MEMORY[0x24BE1A8E0]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__CDPDRecoveryValidatedJoinFlowController__piggybackingRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_24C81C170;
  v11 = v3;
  v8 = v3;
  -[CDPDRecoveryOption setRecoveryHandler:](v5, "setRecoveryHandler:", v10);

  return v5;
}

void __85__CDPDRecoveryValidatedJoinFlowController__piggybackingRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __85__CDPDRecoveryValidatedJoinFlowController__piggybackingRecoveryOptionWithCompletion___block_invoke_cold_1();

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    _CDPStateError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

- (id)_recoveryKeyRecoveryOptionWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  CDPDRecoveryOption *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Creating recovery option: Recovery Key\", buf, 2u);
  }

  v5 = objc_alloc_init(CDPDRecoveryOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_RK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryOption setLocalizedRecoveryOption:](v5, "setLocalizedRecoveryOption:", v7);

  -[CDPDRecoveryOption setTelemetryRecoveryOption:](v5, "setTelemetryRecoveryOption:", *MEMORY[0x24BE1A940]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __84__CDPDRecoveryValidatedJoinFlowController__recoveryKeyRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_24C81C170;
  v11 = v3;
  v8 = v3;
  -[CDPDRecoveryOption setRecoveryHandler:](v5, "setRecoveryHandler:", v10);

  return v5;
}

void __84__CDPDRecoveryValidatedJoinFlowController__recoveryKeyRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)_custodianRecoveryOptionWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  CDPDRecoveryOption *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Creating recovery option: Custodian\", buf, 2u);
  }

  v5 = objc_alloc_init(CDPDRecoveryOption);
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
    v6 = CFSTR("REMOTE_SECRET_ENTRY_ALERT_USE_RECOVERY_CONTACT");
  else
    v6 = CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_CUSTODIAN");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryOption setLocalizedRecoveryOption:](v5, "setLocalizedRecoveryOption:", v8);

  -[CDPDRecoveryOption setTelemetryRecoveryOption:](v5, "setTelemetryRecoveryOption:", *MEMORY[0x24BE1A920]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__CDPDRecoveryValidatedJoinFlowController__custodianRecoveryOptionWithCompletion___block_invoke;
  v11[3] = &unk_24C81C170;
  v12 = v3;
  v9 = v3;
  -[CDPDRecoveryOption setRecoveryHandler:](v5, "setRecoveryHandler:", v11);

  return v5;
}

void __82__CDPDRecoveryValidatedJoinFlowController__custodianRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)_recoveryMethodRecoveryOptionWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  CDPDRecoveryOption *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Creating recovery option: Recovery Method\", buf, 2u);
  }

  v5 = objc_alloc_init(CDPDRecoveryOption);
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_ALERT_USE_RECOVERY_METHOD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryOption setLocalizedRecoveryOption:](v5, "setLocalizedRecoveryOption:", v7);

  -[CDPDRecoveryOption setTelemetryRecoveryOption:](v5, "setTelemetryRecoveryOption:", *MEMORY[0x24BE1A940]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__CDPDRecoveryValidatedJoinFlowController__recoveryMethodRecoveryOptionWithCompletion___block_invoke;
  v10[3] = &unk_24C81C170;
  v11 = v3;
  v8 = v3;
  -[CDPDRecoveryOption setRecoveryHandler:](v5, "setRecoveryHandler:", v10);

  return v5;
}

void __87__CDPDRecoveryValidatedJoinFlowController__recoveryMethodRecoveryOptionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)_showEntryLimitError:(id)a3 withRecoveryOptionHandlers:(id)a4 defaultIndex:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v14;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Attempting to preset alert (using: %@) for error: %@\", buf, 0x16u);

  }
  -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __115__CDPDRecoveryValidatedJoinFlowController__showEntryLimitError_withRecoveryOptionHandlers_defaultIndex_completion___block_invoke;
    v19[3] = &unk_24C81C238;
    v20 = v11;
    v22 = v12;
    v21 = v10;
    objc_msgSend(v16, "cdpContext:showError:withDefaultIndex:withCompletion:", v18, v21, a5, v19);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v10);
  }

}

void __115__CDPDRecoveryValidatedJoinFlowController__showEntryLimitError_withRecoveryOptionHandlers_defaultIndex_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"User responded to presented alert with option: %@\", (uint8_t *)&v11, 0xCu);

  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v8[2](v8);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    _CDPStateErrorWithUnderlying();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

- (id)_hardLimitErrorBodyWithDevice:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  -[CDPDRecoveryFlowController validator](self, "validator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportedEscapeOfferMask");

  if ((v6 & 2) != 0)
  {
    -[CDPDRecoveryValidatedJoinFlowController _entryHardLimitDeviceSelectionAvailableBodyForDevice:](self, "_entryHardLimitDeviceSelectionAvailableBodyForDevice:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (v6 < 0)
  {
    -[CDPDRecoveryValidatedJoinFlowController _entryHardLimitPiggybackingAvailableBodyForDevice:](self, "_entryHardLimitPiggybackingAvailableBodyForDevice:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((v6 & 0x20) != 0)
    {
      if ((v6 & 0x40) != 0)
        -[CDPDRecoveryValidatedJoinFlowController _entryHardLimitRecoveryKeyAndCustodianRecoveryAvailableBodyForDevice:](self, "_entryHardLimitRecoveryKeyAndCustodianRecoveryAvailableBodyForDevice:", v4);
      else
        -[CDPDRecoveryValidatedJoinFlowController _entryHardLimitRecoveryKeyAvailableBodyForDevice:](self, "_entryHardLimitRecoveryKeyAvailableBodyForDevice:", v4);
    }
    else
    {
      if ((v6 & 0x40) != 0)
      {
        -[CDPDRecoveryValidatedJoinFlowController _entryHardLimitCustodianRecoveryAvailableBodyForDevice:](self, "_entryHardLimitCustodianRecoveryAvailableBodyForDevice:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      v7 = (void *)MEMORY[0x24BE1A3F8];
      -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v7, "isSubsetOfContextTypeSignIn:", objc_msgSend(v9, "type"));

      if ((_DWORD)v7)
        -[CDPDRecoveryValidatedJoinFlowController _entryHardLimitNoResetForSignInForDevice:](self, "_entryHardLimitNoResetForSignInForDevice:", v4);
      else
        -[CDPDRecoveryValidatedJoinFlowController _entryHardLimitRepairBodyForDevice:](self, "_entryHardLimitRepairBodyForDevice:", v4);
    }
    v10 = objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  v11 = (void *)v10;

  return v11;
}

- (id)_softLimitErrorBodyForDevice:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  -[CDPDRecoveryFlowController validator](self, "validator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportedEscapeOfferMask");

  if ((v6 & 2) != 0)
  {
    -[CDPDRecoveryValidatedJoinFlowController _entryLimitDeviceSelectionAvailableBodyForDevice:](self, "_entryLimitDeviceSelectionAvailableBodyForDevice:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (v6 < 0)
  {
    -[CDPDRecoveryValidatedJoinFlowController _entryLimitPiggybackingAvailableBodyForDevice:](self, "_entryLimitPiggybackingAvailableBodyForDevice:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if ((v6 & 0x20) != 0)
  {
    if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled") && (v6 & 0x40) != 0)
    {
      -[CDPDRecoveryValidatedJoinFlowController _entryLimitRecoveryKeyAndCustodianRecoveryAvailableBodyForDevice:](self, "_entryLimitRecoveryKeyAndCustodianRecoveryAvailableBodyForDevice:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CDPDRecoveryValidatedJoinFlowController _entryLimitRecoveryKeyAvailableBodyForDevice:](self, "_entryLimitRecoveryKeyAvailableBodyForDevice:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    -[CDPDRecoveryValidatedJoinFlowController _entryLimitCustodianRecoveryAvailableBodyForDevice:](self, "_entryLimitCustodianRecoveryAvailableBodyForDevice:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
  {
    -[CDPDRecoveryValidatedJoinFlowController _entryLimitNoResetForDevice:](self, "_entryLimitNoResetForDevice:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "type");

    if (v10 == 2)
      -[CDPDRecoveryValidatedJoinFlowController _entryLimitNoResetForRepairForDevice:](self, "_entryLimitNoResetForRepairForDevice:", v4);
    else
      -[CDPDRecoveryValidatedJoinFlowController _entryLimitSignInBodyForDevice:](self, "_entryLimitSignInBodyForDevice:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v7;

  return v11;
}

- (id)_entryLimitRecoveryKeyAndCustodianRecoveryAvailableBodyForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "idmsRecovery");

  v8 = (void *)MEMORY[0x24BDD17C8];
  if (v7)
    v9 = CFSTR("RECOVERY_REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_RK_AND_RC");
  else
    v9 = CFSTR("REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_RK_AND_RC");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_entryHardLimitRecoveryKeyAndCustodianRecoveryAvailableBodyForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "idmsRecovery");

  v8 = (void *)MEMORY[0x24BDD17C8];
  if (v7)
    v9 = CFSTR("RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK_AND_RC");
  else
    v9 = CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK_AND_RC");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_entryHardLimitPiggybackingAvailableBodyForDevice:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BE1A458];
  v5 = a3;
  objc_msgSend(v4, "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_TRUSTED_DEVICES"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_entryHardLimitRecoveryKeyAvailableBodyForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "idmsRecovery");

  v8 = (void *)MEMORY[0x24BDD17C8];
  if (v7)
    v9 = CFSTR("RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK");
  else
    v9 = CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RK");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_entryHardLimitCustodianRecoveryAvailableBodyForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "idmsRecovery");

  v8 = (void *)MEMORY[0x24BDD17C8];
  if (v7)
    v9 = CFSTR("RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RC");
  else
    v9 = CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_RC");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_entryHardLimitNoResetForSignInForDevice:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BE1A458];
  v5 = a3;
  objc_msgSend(v4, "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_NO_RECOVERY_METHOD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_entryHardLimitRepairBodyForDevice:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BE1A458];
  v5 = a3;
  objc_msgSend(v4, "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_NO_RECOVERY_RPD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_entryHardLimitDeviceSelectionAvailableBodyForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "idmsRecovery");

  v8 = (void *)MEMORY[0x24BDD17C8];
  if (v7)
    v9 = CFSTR("RECOVERY_REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_OTHER_ICSC");
  else
    v9 = CFSTR("REMOTE_SECRET_ENTRY_HARD_LIMIT_ALERT_SUBTITLE_OTHER_ICSC");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_entryLimitNoResetForDevice:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BE1A458];
  v5 = a3;
  objc_msgSend(v4, "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_NO_RECOVERY_METHOD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_entryLimitTitleForDevice:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BE1A458];
  v4 = a3;
  objc_msgSend(v3, "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "localSecretType");

  objc_msgSend(v5, "addSecretType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_entryLimitSignInBodyForDevice:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BE1A458];
  v5 = a3;
  objc_msgSend(v4, "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_MESSAGE_SIGNIN"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_entryLimitNoResetForRepairForDevice:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BE1A458];
  v5 = a3;
  objc_msgSend(v4, "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_MESSAGE_NO_RESET"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_entryLimitResetAvailableBodyForDevice:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BE1A458];
  v5 = a3;
  objc_msgSend(v4, "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_MULTIPLE_INCORRECT_MESSAGE_RESET"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSecretType:", objc_msgSend(v5, "localSecretType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_entryLimitRecoveryKeyAvailableBodyForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
  {
    -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "idmsRecovery");

    v8 = (void *)MEMORY[0x24BDD17C8];
    if (v7)
      v9 = CFSTR("RECOVERY_REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_RK");
    else
      v9 = CFSTR("REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_RK");
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_GLOBAL_LIMIT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelClass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addDeviceClass:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@%@"), 0, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (id)_entryLimitCustodianRecoveryAvailableBodyForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled"))
  {
    -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "idmsRecovery");

    v8 = (void *)MEMORY[0x24BDD17C8];
    if (v7)
      v9 = CFSTR("RECOVERY_REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_RC");
    else
      v9 = CFSTR("REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_RC");
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CUSTODIAN_RECOVERY_HELP_PROMPT_MESSAGE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@%@"), 0, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)_entryLimitDeviceSelectionAvailableBodyForDevice:(id)a3
{
  NSArray *cdpDevices;
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  cdpDevices = self->_cdpDevices;
  v4 = a3;
  v5 = -[NSArray prevailingLocalSecretType](cdpDevices, "prevailingLocalSecretType");
  v6 = objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled");
  v7 = (void *)MEMORY[0x24BDD17C8];
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_OTHER_ICSC"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_ANOTHER_DEVICE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSecretType:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)_entryLimitPiggybackingAvailableBodyForDevice:(id)a3
{
  void *v3;
  id v4;
  int v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BE1A4A0];
  v4 = a3;
  v5 = objc_msgSend(v3, "isICSCHarmonizationEnabled");
  v6 = (void *)MEMORY[0x24BDD17C8];
  if (v5)
    v7 = CFSTR("REMOTE_SECRET_ENTRY_SOFT_LIMIT_ALERT_SUBTITLE_TRUSTED_DEVICES");
  else
    v7 = CFSTR("PIGGYBACKING_RECOVERY_HELP_PROMPT_MESSAGE");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@%@"), 0, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_infoDictionaryWithTitle:(id)a3 andBody:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD0FC8]);
  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0FD8]);

  return v8;
}

- (void)_showQuotaScreenWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;

  v4 = a3;
  -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentQuotaScreenWithCompletion:", v4);

  }
  else
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CDPDRecoveryValidatedJoinFlowController _showQuotaScreenWithCompletion:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
}

- (void)_showAccountResetConfirmationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Prompting user for Reset confirmation\", buf, 2u);
  }

  v6 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  -[CDPDRecoveryValidatedJoinFlowController _resetDataErrorForCurrentContextWithRecoveryIndexMap:](self, "_resetDataErrorForCurrentContextWithRecoveryIndexMap:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __87__CDPDRecoveryValidatedJoinFlowController__showAccountResetConfirmationWithCompletion___block_invoke;
    v12[3] = &unk_24C81C260;
    v13 = v6;
    v14 = v4;
    objc_msgSend(v9, "cdpContext:showError:withDefaultIndex:withCompletion:", v11, v7, 1, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

uint64_t __87__CDPDRecoveryValidatedJoinFlowController__showAccountResetConfirmationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Reset confirmation prompt came back with: %@\", (uint8_t *)&v10, 0xCu);

  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "BOOLValue");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_resetDataErrorForCurrentContextWithRecoveryIndexMap:(id)a3
{
  id v4;
  _BOOL4 v5;
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
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[2];
  uint8_t buf[4];
  id v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[CDPDRecoveryValidatedJoinFlowController _isWalrusEnabled](self, "_isWalrusEnabled");
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("RPD_CONFIRMATION_STEP_2_TITLE"), CFSTR("Localizable-Walrus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD0FC8]);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("RPD_CONFIRMATION_STEP_2_MESSAGE"), CFSTR("Localizable-Walrus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD0FD8]);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("WALRUS_STORAGE_LIST_UNAVAILABLE_CONFIRMATION_DELETE_BUTTON_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v12;
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_CANCEL_BUTTON"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD0FE8]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], &unk_24C836668);
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v4;
      v17 = "\"Showing RPD error alert for Walrus user. RecoveryMap is %@\";
LABEL_6:
      _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("RESET_CONFIRMATION_DIALOG_TITLE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDD0FC8]);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("RESET_CONFIRMATION_DIALOG_MESSAGE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BDD0FD8]);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("RESET_CONFIRMATION_DIALOG_BUTTON_RESET"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_CANCEL_BUTTON"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BDD0FE8]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], &unk_24C836668);
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v4;
      v17 = "\"Showing RPD error alert for non-Walrus user. RecoveryMap is %@\";
      goto LABEL_6;
    }
  }

  _CDPStateError();
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_resetProtectedDataErrorUnrecoverable
{
  _BOOL4 v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v22[8];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v2 = -[CDPDRecoveryValidatedJoinFlowController _isWalrusEnabled](self, "_isWalrusEnabled");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Showing RPD unrecoverable error alert for Walrus user\", v22, 2u);
    }

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("RPD_CONFIRMATION_STEP_2_TITLE"), CFSTR("Localizable-Walrus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD0FC8]);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("RPD_CONFIRMATION_STEP_2_MESSAGE"), CFSTR("Localizable-Walrus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD0FD8]);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_CANCEL_BUTTON"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:inTable:", CFSTR("WALRUS_ALERT_BUTTON_TITLE_DELETE_ICLOUD_DATA"), CFSTR("Localizable-Walrus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v13;
    v14 = v24;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Showing RPD unrecoverable error alert for non-Walrus user\", v22, 2u);
    }

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("RESET_CONFIRMATION_DIALOG_TITLE_NO_RECOVERY"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDD0FC8]);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("RESET_CONFIRMATION_DIALOG_MESSAGE_NO_RECOVERY"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BDD0FD8]);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_CANCEL_BUTTON"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v11;
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("RESET_CONFIRMATION_DIALOG_BUTTON_RESET_NO_RECOVERY"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v13;
    v14 = v23;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDD0FE8]);

  _CDPStateError();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_skipErrorUnrecoverable
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v13[16];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[CDPDRecoveryValidatedJoinFlowController _isWalrusEnabled](self, "_isWalrusEnabled");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_20DB2C000, v3, OS_LOG_TYPE_DEFAULT, "\"Showing RPD skip error alert for non-Walrus user\", v13, 2u);
  }

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SKIP_CONFIRMATION_DIALOG_TITLE_NO_RECOVERY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD0FC8]);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SKIP_CONFIRMATION_DIALOG_MESSAGE_NO_RECOVERY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD0FD8]);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DATA_RECOVERY_ESCAPE_OPTION_SKIP"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD0FE8]);

  _CDPStateError();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_isProbationActive
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rpdProbationDuration");
  v6 = v5;
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "rpdProbationIsInEffectForDuration:context:", v8, v6);

  return v9;
}

- (void)_handleNoRecoveryFactorsWithMask:(unint64_t)a3 validator:(id)a4
{
  id v6;
  void *v7;
  CDPEscapeOffersLedger *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CDPEscapeOffersLedger *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  char v22;

  v6 = a4;
  -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(MEMORY[0x24BE1A4A0], "shouldCentralizeRPDFlow"))
    {
      v8 = [CDPEscapeOffersLedger alloc];
      -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasLocalSecret");
      objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CDPEscapeOffersLedger initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:](v8, "initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:", a3, v9, v11, v12, objc_msgSend(MEMORY[0x24BE1A4A0], "isVirtualMachine"));

      LOBYTE(v8) = -[CDPEscapeOffersLedger canOfferRPD](v13, "canOfferRPD");
      if ((v8 & 1) == 0)
      {
LABEL_4:
        -[CDPDRecoveryValidatedJoinFlowController _skipErrorUnrecoverable](self, "_skipErrorUnrecoverable");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
LABEL_10:
        -[CDPDRecoveryFlowController uiProvider](self, "uiProvider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "context");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke;
        v20[3] = &unk_24C81C2B0;
        v22 = v15;
        v20[4] = self;
        v21 = v6;
        objc_msgSend(v17, "cdpContext:showError:withDefaultIndex:withCompletion:", v19, v14, 1, v20);

        goto LABEL_11;
      }
    }
    else if (!-[CDPDRecoveryValidatedJoinFlowController _isProbationActive](self, "_isProbationActive"))
    {
      goto LABEL_4;
    }
    -[CDPDRecoveryValidatedJoinFlowController _resetProtectedDataErrorUnrecoverable](self, "_resetProtectedDataErrorUnrecoverable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 1;
    goto LABEL_10;
  }
  _CDPLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryValidatedJoinFlowController _handleNoRecoveryFactorsWithMask:validator:].cold.1();

  -[CDPDRecoveryValidatedJoinFlowController _handleResetOptionWithResetRequested:localSecret:validator:](self, "_handleResetOptionWithResetRequested:localSecret:validator:", 0, 0, v6);
LABEL_11:

}

void __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Reset confirmation prompt came back with: %@\", buf, 0xCu);

  }
  if (*(_BYTE *)(a1 + 48))
  {
    if (a2 == 1)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke_156;
      v8[3] = &unk_24C81C288;
      v6 = *(void **)(a1 + 40);
      v9 = *(id *)(a1 + 32);
      v10 = v6;
      objc_msgSend(v9, "_showQuotaScreenWithCompletion:", v8);

      return;
    }
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke_cold_2();
  }
  else
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 32), "_handleResetOptionWithResetRequested:localSecret:validator:", 0, 0, *(_QWORD *)(a1 + 40));
}

uint64_t __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke_156(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleResetOptionWithResetRequested:localSecret:validator:", a2, a3, *(_QWORD *)(a1 + 40));
}

- (BOOL)_isWalrusEnabled
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134217984;
    v11 = objc_msgSend(v5, "walrusStatus");
    _os_log_impl(&dword_20DB2C000, v3, OS_LOG_TYPE_DEFAULT, "\"Walrus status on recovery context is %ld\", (uint8_t *)&v10, 0xCu);

  }
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "walrusStatus") == 1;

  return v8;
}

- (NSArray)cdpDevices
{
  return self->_cdpDevices;
}

- (void)setCdpDevices:(id)a3
{
  objc_storeStrong((id *)&self->_cdpDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpDevices, 0);
}

- (void)shouldOfferPiggybackingBasedRecovery
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Overriding shouldOfferPiggybackingBasedRecovery to offer Piggybacking for CDPRepair \", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_escapeOfferForDevices:remoteApproval:forMultipleICSC:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"_escapeOfferForDevices: Encountered error while checking RK support: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_escapeOfferForDevices:(void *)a1 remoteApproval:(NSObject *)a2 forMultipleICSC:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "recoveryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v5, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"Context Type: %@\", v7, 0xCu);

}

- (void)remoteSecretValidator:applyToJoinCircleWithJoinHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"CDPDRemoteDeviceSecretValidatorDelegate applying to join circle\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)cancelRemoteSecretValidatorApplicationToJoinCircle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"CDPDRemoteDeviceSecretValidatorDelegate cancelling application to join circle\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __109__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCustodianRecoveryWithInfo_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to recovery Octagon using custodian info with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __117__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCircleJoinWithPiggybackingContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Joined circle with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __117__CDPDRecoveryValidatedJoinFlowController_remoteSecretValidator_attemptCircleJoinWithPiggybackingContext_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to join circle with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __101__CDPDRecoveryValidatedJoinFlowController_secretValidator_recoverSecureBackupWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"clique recovery failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)secretValidator:didFailRecovery:withError:completion:.cold.1()
{
  __assert_rtn("-[CDPDRecoveryValidatedJoinFlowController secretValidator:didFailRecovery:withError:completion:]", "CDPDRecoveryValidatedJoinFlowController.m", 220, "completion");
}

- (void)_handleResetOptionWithResetRequested:(uint64_t)a3 localSecret:(uint64_t)a4 validator:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a1, a3, "\"uiProvider is nil. Cancelling flow. %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_handleResetOptionWithResetRequested:(uint64_t)a3 localSecret:(uint64_t)a4 validator:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a1, a3, "\"Gathered local secret from hard limits, continuing with reset. %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_handleResetOptionWithResetRequested:(uint64_t)a3 localSecret:(uint64_t)a4 validator:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a1, a3, "\"Attempting to create local secret. %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_handleResetOptionWithResetRequested:localSecret:validator:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"CDPDRecoveryValidatedJoinFlowController: UI Provider is nil, only option is to cancel flow\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __102__CDPDRecoveryValidatedJoinFlowController__handleResetOptionWithResetRequested_localSecret_validator___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Failed to create local secret, cancelling flow. Error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __78__CDPDRecoveryValidatedJoinFlowController__tryAgainLaterOptionWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"User elected to: Try Again\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __88__CDPDRecoveryValidatedJoinFlowController__deviceSelectionRecoveryOptionWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"User elected to: Select Device\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __85__CDPDRecoveryValidatedJoinFlowController__piggybackingRecoveryOptionWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"User elected to: Send Code to My Devices\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_showQuotaScreenWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"uiProvider is nil, cannot present Quota Screen\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_handleNoRecoveryFactorsWithMask:validator:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"UI Provider is nil, only option is to cancel flow\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Currently in probation, only option is to try again later\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __86__CDPDRecoveryValidatedJoinFlowController__handleNoRecoveryFactorsWithMask_validator___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"User opted to try again later, dismissing flow\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

@end
