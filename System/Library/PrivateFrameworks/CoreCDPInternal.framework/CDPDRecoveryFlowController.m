@implementation CDPDRecoveryFlowController

- (CDPDRecoveryFlowController)initWithContext:(id)a3 uiProvider:(id)a4 secureBackupController:(id)a5 circleProxy:(id)a6 octagonProxy:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CDPDRecoveryFlowController *v18;
  CDPDRecoveryFlowController *v19;
  CDPDCircleController *v20;
  CDPDCircleControl *circleController;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CDPDRecoveryFlowController;
  v18 = -[CDPDRecoveryFlowController init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_recoveryContext, a3);
    objc_storeStrong((id *)&v19->_uiProvider, a4);
    objc_storeStrong((id *)&v19->_secureBackupController, a5);
    v20 = -[CDPDCircleController initWithUiProvider:delegate:circleProxy:octagonTrustProxy:]([CDPDCircleController alloc], "initWithUiProvider:delegate:circleProxy:octagonTrustProxy:", v14, 0, v16, v17);
    circleController = v19->_circleController;
    v19->_circleController = (CDPDCircleControl *)v20;

  }
  return v19;
}

- (CDPDRecoveryFlowController)initWithContext:(id)a3 uiProvider:(id)a4 secureBackupController:(id)a5 circleController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CDPDRecoveryFlowController *v15;
  CDPDRecoveryFlowController *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CDPDRecoveryFlowController;
  v15 = -[CDPDRecoveryFlowController init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_recoveryContext, a3);
    objc_storeStrong((id *)&v16->_uiProvider, a4);
    objc_storeStrong((id *)&v16->_secureBackupController, a5);
    objc_storeStrong((id *)&v16->_circleController, a6);
  }

  return v16;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"CDPDRecoveryFlowController deallocated\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)_updateEventWithDevices:(id)a3 withDevices:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v10 += objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "remainingAttempts");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE1A800]);

  v14 = (void *)MEMORY[0x24BDD16E0];
  -[CDPDRecoveryFlowController recoveryContext](self, "recoveryContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v16, "totalEscrowDeviceCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE1A7F8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE1A6D8]);

}

- (void)_updateInteractiveRecoverStartEvent:(id)a3 withDevices:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CDPDAccount *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v6 = a3;
  -[CDPDRecoveryFlowController _updateEventWithDevices:withDevices:](self, "_updateEventWithDevices:withDevices:", v6, a4);
  -[CDPDRecoveryFlowController secureBackupController](self, "secureBackupController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CDPDRecoveryFlowController secureBackupController](self, "secureBackupController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v10 = objc_msgSend(v9, "supportsRecoveryKeyWithError:", &v28);
    v11 = v28;

  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE1A748]);

  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "supportsSecureBackupRecovery"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE1A7F0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CDPDCircleControl cliqueStatus](self->_circleController, "cliqueStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE1A620]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[CDPDCircleControl circleSyncingStatus](self->_circleController, "circleSyncingStatus"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE1A610]);

  v18 = objc_alloc_init(CDPDAccount);
  -[CDPRecoveryFlowContext context](self->_recoveryContext, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dsid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[CDPDAccount isICDPEnabledForDSID:checkWithServer:](v18, "isICDPEnabledForDSID:checkWithServer:", v21, 0);

  v23 = (void *)MEMORY[0x24BDD16E0];
  -[CDPRecoveryFlowContext context](self->_recoveryContext, "context");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "altDSID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithUnsignedInteger:", -[CDPDAccount recoveryContactCountForAltDSID:](v18, "recoveryContactCountForAltDSID:", v25));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, *MEMORY[0x24BE1A600]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE1A6E0]);
}

- (void)beginRecovery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDFC2A0];
  -[CDPRecoveryFlowContext context](self->_recoveryContext, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "analyticsEventWithContext:eventName:category:", v6, *MEMORY[0x24BE1A6B0], *MEMORY[0x24BE1A860]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__CDPDRecoveryFlowController_beginRecovery___block_invoke;
  v10[3] = &unk_24C81BED0;
  v10[4] = self;
  v11 = v7;
  v12 = v4;
  v8 = v4;
  v9 = v7;
  -[CDPDRecoveryFlowController retrieveInflatedDevices:](self, "retrieveInflatedDevices:", v10);

}

void __44__CDPDRecoveryFlowController_beginRecovery___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_updateInteractiveRecoverStartEvent:withDevices:", *(_QWORD *)(a1 + 40), v7);
  if (v8)
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __44__CDPDRecoveryFlowController_beginRecovery___block_invoke_cold_2((uint64_t)v8, v9, v10);

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE1A640]);
    objc_msgSend(*(id *)(a1 + 40), "populateUnderlyingErrorsStartingWithRootError:", v8);
    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendEvent:", *(_QWORD *)(a1 + 40));

    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v8);
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
      v13 = MEMORY[0x24BDBD1C8];
    else
      v13 = MEMORY[0x24BDBD1C0];
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE1A640]);
    v14 = *(_QWORD **)(a1 + 32);
    if (v14[5])
    {
      objc_msgSend(v14, "recoveryValidatorWithDevices:forMultipleICSC:withCompletionHandler:", v7, a2, *(_QWORD *)(a1 + 48));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 8);
      *(_QWORD *)(v16 + 8) = v15;

      objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sendEvent:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:", v7, a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    }
    else
    {
      _CDPLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __44__CDPDRecoveryFlowController_beginRecovery___block_invoke_cold_1(v19);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "keychainSyncSystem");

      v21 = *(void **)(a1 + 40);
      _CDPStateError();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "populateUnderlyingErrorsStartingWithRootError:", v22);

      objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sendEvent:", *(_QWORD *)(a1 + 40));

      v24 = *(_QWORD *)(a1 + 48);
      _CDPStateError();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v25);

    }
  }

}

- (id)recoveryValidatorWithDevices:(id)a3 forMultipleICSC:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CDPDDeviceSecretValidator *v10;
  void *v11;
  CDPDDeviceSecretValidator *v12;
  unint64_t v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = [CDPDDeviceSecretValidator alloc];
  -[CDPRecoveryFlowContext context](self->_recoveryContext, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CDPDDeviceSecretValidator initWithContext:delegate:](v10, "initWithContext:delegate:", v11, self);

  -[CDPDDeviceSecretValidator setIsUsingMultipleICSC:](v12, "setIsUsingMultipleICSC:", v5);
  -[CDPDDeviceSecretValidator setValidSecretHandler:](v12, "setValidSecretHandler:", v8);

  v13 = -[CDPDRecoveryFlowController _escapeOfferForDevices:](self, "_escapeOfferForDevices:", v9);
  -[CDPDDeviceSecretValidator setSupportedEscapeOfferMask:](v12, "setSupportedEscapeOfferMask:", v13);
  return v12;
}

- (unint64_t)_escapeOfferForDevices:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryFlowController _escapeOfferForDevices:].cold.1(self, v5);

  v6 = objc_msgSend(v4, "count");
  if (v6 < 2)
    return 16;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[CDPDRecoveryFlowController _escapeOfferForDevices:]";
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"%s Escape available: other devices\", (uint8_t *)&v9, 0xCu);
  }

  return 18;
}

- (void)beginInteractiveRecoveryForDevices:(id)a3 isUsingMultipleICSC:(BOOL)a4 usingValidator:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  CDPStateUIProviderInternal *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  CDPStateUIProviderInternal *uiProvider;
  void *v23;
  void *v24;
  uint8_t v25[16];
  uint8_t buf[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CDPDRecoveryFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:].cold.2(v8, (uint64_t)self);

    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CDPDRecoveryFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:].cold.1((uint64_t)self, v11);

    -[CDPRecoveryFlowContext context](self->_recoveryContext, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "walrusStatus");

    if (v13 == 1)
    {
      -[CDPRecoveryFlowContext setIsWalrusEnabled:](self->_recoveryContext, "setIsWalrusEnabled:", 1);
      -[CDPRecoveryFlowContext setRpdProbationDuration:](self->_recoveryContext, "setRpdProbationDuration:", 1209600.0);
      _CDPLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"Invoking cdpRecoveryFlowContext:promptForRemoteSecretWithDevices in CDPDRecoveryFlowController\", buf, 2u);
      }

      -[CDPStateUIProviderInternal cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:](self->_uiProvider, "cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:", self->_recoveryContext, v8, v9);
    }
    else
    {
      _CDPLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_20DB2C000, v21, OS_LOG_TYPE_DEFAULT, "\"Invoking cdpContext:promptForRemoteSecretWithDevices in CDPDRecoveryFlowController\", v25, 2u);
      }

      uiProvider = self->_uiProvider;
      -[CDPRecoveryFlowContext context](self->_recoveryContext, "context");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v8, "copy");
      -[CDPStateUIProviderInternal cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:](uiProvider, "cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:", v23, v24, -[CDPRecoveryFlowContext hasPeersForRemoteApproval](self->_recoveryContext, "hasPeersForRemoteApproval"), v9);

    }
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[CDPDRecoveryFlowController beginInteractiveRecoveryForDevices:isUsingMultipleICSC:usingValidator:].cold.3(v15);

    v17 = self->_uiProvider;
    -[CDPRecoveryFlowContext context](self->_recoveryContext, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "hasNumericSecret");
    objc_msgSend(v15, "numericSecretLength");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPStateUIProviderInternal cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:](v17, "cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:", v18, v19, v20, objc_msgSend(v15, "hasRandomSecret"), v9);

  }
}

- (void)retrieveInflatedDevices:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CDPDSecureBackupController *secureBackupController;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryFlowController retrieveInflatedDevices:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[CDPDSecureBackupController clearAccountInfoCache](self->_secureBackupController, "clearAccountInfoCache");
  secureBackupController = self->_secureBackupController;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__CDPDRecoveryFlowController_retrieveInflatedDevices___block_invoke;
  v15[3] = &unk_24C81BEF8;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  -[CDPDSecureBackupController getBackupRecordDevicesWithOptionForceFetch:completion:](secureBackupController, "getBackupRecordDevicesWithOptionForceFetch:completion:", 0, v15);

}

void __54__CDPDRecoveryFlowController_retrieveInflatedDevices___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __54__CDPDRecoveryFlowController_retrieveInflatedDevices___block_invoke_cold_1((uint64_t)v6, v8, v9);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "useCircleInfoToUpdateNameForDevices:", a3);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)secretValidator:(id)a3 recoverSecureBackupWithContext:(id)a4 completion:(id)a5
{
  -[CDPDSecureBackupController recoverSecureBackupWithContext:completion:](self->_secureBackupController, "recoverSecureBackupWithContext:completion:", a4, a5);
}

- (BOOL)secretValidator:(id)a3 shouldContinueValidationAfterError:(id)a4
{
  return 1;
}

- (CDPRemoteDeviceSecretValidatorProtocol)validator
{
  return self->_validator;
}

- (void)setValidator:(id)a3
{
  objc_storeStrong((id *)&self->_validator, a3);
}

- (CDPRecoveryFlowContext)recoveryContext
{
  return self->_recoveryContext;
}

- (void)setRecoveryContext:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryContext, a3);
}

- (CDPDCircleControl)circleController
{
  return self->_circleController;
}

- (void)setCircleController:(id)a3
{
  objc_storeStrong((id *)&self->_circleController, a3);
}

- (CDPDSecureBackupController)secureBackupController
{
  return self->_secureBackupController;
}

- (void)setSecureBackupController:(id)a3
{
  objc_storeStrong((id *)&self->_secureBackupController, a3);
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
  objc_storeStrong((id *)&self->_uiProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_secureBackupController, 0);
  objc_storeStrong((id *)&self->_circleController, 0);
  objc_storeStrong((id *)&self->_recoveryContext, 0);
  objc_storeStrong((id *)&self->_validator, 0);
}

void __44__CDPDRecoveryFlowController_beginRecovery___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "\"We are unable to show UI as the UI provider is missing.\", v1, 2u);
  OUTLINED_FUNCTION_4_0();
}

void __44__CDPDRecoveryFlowController_beginRecovery___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a2, a3, "\"Recovery flow failed due to device inflation error. %@\", (uint8_t *)&v3);
}

- (void)_escapeOfferForDevices:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "recoveryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v5, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315394;
  v8 = "-[CDPDRecoveryFlowController _escapeOfferForDevices:]";
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"%s Context Type: %@\", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_3_0();
}

- (void)beginInteractiveRecoveryForDevices:(uint64_t)a1 isUsingMultipleICSC:(NSObject *)a2 usingValidator:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 16), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134217984;
  v6 = objc_msgSend(v3, "walrusStatus");
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a2, v4, "\"Interactive recovery with walrus status - %lu\", (uint8_t *)&v5);

}

- (void)beginInteractiveRecoveryForDevices:(void *)a1 isUsingMultipleICSC:(uint64_t)a2 usingValidator:.cold.2(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "count");
  objc_msgSend(*(id *)(a2 + 16), "hasPeersForRemoteApproval");
  OUTLINED_FUNCTION_2_0(&dword_20DB2C000, v3, v4, "\"Requesting UI provider prompt for a remote device secret from one of %lu devices (offeringRemoteApproval=%i)\", v5, v6, v7, v8, 0);
  OUTLINED_FUNCTION_3_0();
}

- (void)beginInteractiveRecoveryForDevices:(void *)a1 isUsingMultipleICSC:usingValidator:.cold.3(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "hasNumericSecret");
  objc_msgSend(a1, "numericSecretLength");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_20DB2C000, v2, v3, "\"Requesting UI provider prompt for an ICSC isNumeric=%i numericLength=%@\", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)retrieveInflatedDevices:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"Fetching backup record devices\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

void __54__CDPDRecoveryFlowController_retrieveInflatedDevices___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a2, a3, "\"Failed to fetch backup record devices: %@\", (uint8_t *)&v3);
}

@end
