@implementation AKCDPFactory

+ (id)contextForAltDSID:(id)a3
{
  id v3;
  void *CDPContextClass;
  void *v5;

  v3 = a3;
  CDPContextClass = (void *)CoreCDPLibraryCore();
  if (CDPContextClass)
    CDPContextClass = getCDPContextClass();
  objc_msgSend(CDPContextClass, "contextForAccountWithAltDSID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contextWithAuthResults:(id)a3
{
  id v3;
  objc_class *CDPContextClass;
  void *v5;

  v3 = a3;
  CDPContextClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPContextClass)
    CDPContextClass = (objc_class *)getCDPContextClass();
  v5 = (void *)objc_msgSend([CDPContextClass alloc], "initWithAuthenticationResults:", v3);

  return v5;
}

+ (id)stateControllerWithContext:(id)a3
{
  id v3;
  objc_class *CDPStateControllerClass;
  void *v5;

  v3 = a3;
  CDPStateControllerClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPStateControllerClass)
    CDPStateControllerClass = (objc_class *)getCDPStateControllerClass();
  v5 = (void *)objc_msgSend([CDPStateControllerClass alloc], "initWithContext:", v3);

  return v5;
}

+ (id)recoveryControllerWithContext:(id)a3
{
  id v3;
  objc_class *CDPContextClass;
  id v5;
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
  objc_class *CDPRecoveryControllerClass;
  void *v18;

  v3 = a3;
  CDPContextClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPContextClass)
    CDPContextClass = (objc_class *)getCDPContextClass();
  v5 = objc_alloc_init(CDPContextClass);
  objc_msgSend(v3, "authContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAltDSID:", v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "authContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "DSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v10, "longLongValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDsid:", v11);

  objc_msgSend(v3, "authContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppleID:", v13);

  objc_msgSend(v3, "decodedRecoveryPETString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPasswordEquivToken:", v14);

  objc_msgSend(v5, "setIdmsMasterKeyRecovery:", objc_msgSend(v3, "supportsMasterKeyRecovery"));
  objc_msgSend(v5, "setMandatesRecoveryKey:", objc_msgSend(v3, "mandatesRecoveryKey"));
  objc_msgSend(v5, "setIdmsRecovery:", objc_msgSend(v5, "idmsMasterKeyRecovery") ^ 1);
  objc_msgSend(v5, "setGuestMode:", 1);
  objc_msgSend(v3, "authContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "telemetryFlowID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTelemetryFlowID:", v16);

  CDPRecoveryControllerClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPRecoveryControllerClass)
    CDPRecoveryControllerClass = (objc_class *)getCDPRecoveryControllerClass();
  v18 = (void *)objc_msgSend([CDPRecoveryControllerClass alloc], "initWithContext:", v5);

  return v18;
}

+ (id)followUpRepairContext
{
  void *CDPFollowUpContextClass;

  CDPFollowUpContextClass = (void *)CoreCDPLibraryCore();
  if (CDPFollowUpContextClass)
    CDPFollowUpContextClass = getCDPFollowUpContextClass();
  return (id)objc_msgSend(CDPFollowUpContextClass, "contextForStateRepair");
}

+ (id)followUpController
{
  objc_class *CDPFollowUpControllerClass;

  CDPFollowUpControllerClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPFollowUpControllerClass)
    CDPFollowUpControllerClass = (objc_class *)getCDPFollowUpControllerClass();
  return objc_alloc_init(CDPFollowUpControllerClass);
}

+ (BOOL)cdpAccountIsICDPEnabledForDSID:(id)a3
{
  id v3;
  void *CDPAccountClass;
  char v5;

  v3 = a3;
  CDPAccountClass = (void *)CoreCDPLibraryCore();
  if (CDPAccountClass)
    CDPAccountClass = getCDPAccountClass();
  v5 = objc_msgSend(CDPAccountClass, "isICDPEnabledForDSID:", v3);

  return v5;
}

+ (BOOL)cdpAccountIsHSA2EnabledForAltDSID:(id)a3
{
  id v3;
  void *CDPAccountClass;
  char v5;

  v3 = a3;
  CDPAccountClass = (void *)CoreCDPLibraryCore();
  if (CDPAccountClass)
    CDPAccountClass = getCDPAccountClass();
  v5 = objc_msgSend(CDPAccountClass, "isHSA2Enabled:", v3);

  return v5;
}

+ (BOOL)cdpAccountIsOTEnabledForAltDSID:(id)a3
{
  id v3;
  void *CDPAccountClass;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = a3;
  CDPAccountClass = (void *)CoreCDPLibraryCore();
  if (CDPAccountClass)
    CDPAccountClass = getCDPAccountClass();
  objc_msgSend(CDPAccountClass, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    +[AKCDPFactory contextForAltDSID:](AKCDPFactory, "contextForAltDSID:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)CoreCDPLibraryCore();
      if (v8)
        v8 = getCDPAccountClass();
      objc_msgSend(v8, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isOTEnabledForContext:", v7);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)cdpErrorDomain
{
  void *v2;

  v2 = (void *)CoreCDPLibraryCore();
  if (v2)
  {
    getCDPStateErrorDomain();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (unint64_t)walrusStatus
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  unint64_t v6;
  id v8;

  if (walrusStatus_once != -1)
    dispatch_once(&walrusStatus_once, &__block_literal_global_38);
  v8 = 0;
  v2 = objc_msgSend((id)walrusStatus_stateController, "walrusStatus:", &v8);
  v3 = v8;
  if (v3)
  {
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[AKCDPFactory walrusStatus].cold.1(v3);

  }
  v5 = 1;
  if (v2 == 2)
    v5 = 2;
  if (v2)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

void __28__AKCDPFactory_walrusStatus__block_invoke()
{
  objc_class *CDPWalrusStateControllerClass;
  id v1;
  void *v2;

  CDPWalrusStateControllerClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPWalrusStateControllerClass)
    CDPWalrusStateControllerClass = (objc_class *)getCDPWalrusStateControllerClass();
  v1 = objc_alloc_init(CDPWalrusStateControllerClass);
  v2 = (void *)walrusStatus_stateController;
  walrusStatus_stateController = (uint64_t)v1;

}

+ (id)walrusStatusLiveValue
{
  if (walrusStatusLiveValue_once != -1)
    dispatch_once(&walrusStatusLiveValue_once, &__block_literal_global_40);
  return (id)walrusStatusLiveValue_value;
}

void __37__AKCDPFactory_walrusStatusLiveValue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  if (CoreCDPLibraryCore()
    && (getCDPWalrusStateChangeNotification(), v0 = (void *)objc_claimAutoreleasedReturnValue(), v0, v0))
  {
    +[AKLiveValue liveValueWithSyncProducer:](AKLiveValue, "liveValueWithSyncProducer:", &__block_literal_global_44);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)walrusStatusLiveValue_value;
    walrusStatusLiveValue_value = v1;

    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__12;
    v29 = __Block_byref_object_dispose__12;
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CoreCDPLibraryCore();
    if (v4)
    {
      getCDPWalrusStateChangeNotification();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_46;
    v24[3] = &unk_1E2E61110;
    v24[4] = &v25;
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, 0, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)

    v16 = (void *)walrusStatusLiveValue_value;
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_48;
    v21[3] = &unk_1E2E61138;
    v17 = v3;
    v22 = v17;
    v18 = v15;
    v23 = v18;
    objc_msgSend(v16, "newTriggerWithCleanup:", v21);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v26[5];
    v26[5] = v19;

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

uint64_t __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_42()
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[AKCDPFactory walrusStatus](AKCDPFactory, "walrusStatus"));
}

void __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "Received walrus state change notification, triggering value value update: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

uint64_t __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)isWalrusEnabled
{
  return objc_msgSend(a1, "walrusStatus") == 1;
}

+ (unint64_t)webAccessStatus
{
  void *v2;
  objc_class *CDPWebAccessStateControllerClass;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t v10;
  id v12;

  v2 = (void *)webAccessStatus_stateController;
  if (!webAccessStatus_stateController)
  {
    CDPWebAccessStateControllerClass = (objc_class *)CoreCDPLibraryCore();
    if (CDPWebAccessStateControllerClass)
      CDPWebAccessStateControllerClass = (objc_class *)getCDPWebAccessStateControllerClass();
    v4 = objc_alloc_init(CDPWebAccessStateControllerClass);
    v5 = (void *)webAccessStatus_stateController;
    webAccessStatus_stateController = (uint64_t)v4;

    v2 = (void *)webAccessStatus_stateController;
  }
  v12 = 0;
  v6 = objc_msgSend(v2, "webAccessStatus:", &v12);
  v7 = v12;
  if (v7)
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[AKCDPFactory webAccessStatus].cold.1(v7);

  }
  v9 = 1;
  if (v6 == 2)
    v9 = 2;
  if (v6)
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

+ (id)webAccessStatusLiveValue
{
  if (webAccessStatusLiveValue_once != -1)
    dispatch_once(&webAccessStatusLiveValue_once, &__block_literal_global_50);
  return (id)webAccessStatusLiveValue_value;
}

void __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  if (CoreCDPLibraryCore()
    && (getCDPWebAccessStateChangeNotification(), v0 = (void *)objc_claimAutoreleasedReturnValue(), v0, v0))
  {
    +[AKLiveValue liveValueWithSyncProducer:](AKLiveValue, "liveValueWithSyncProducer:", &__block_literal_global_52);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)webAccessStatusLiveValue_value;
    webAccessStatusLiveValue_value = v1;

    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__12;
    v29 = __Block_byref_object_dispose__12;
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CoreCDPLibraryCore();
    if (v4)
    {
      getCDPWebAccessStateChangeNotification();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_2;
    v24[3] = &unk_1E2E61110;
    v24[4] = &v25;
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, 0, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)

    v16 = (void *)webAccessStatusLiveValue_value;
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_53;
    v21[3] = &unk_1E2E61138;
    v17 = v3;
    v22 = v17;
    v18 = v15;
    v23 = v18;
    objc_msgSend(v16, "newTriggerWithCleanup:", v21);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v26[5];
    v26[5] = v19;

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

uint64_t __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_51()
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[AKCDPFactory webAccessStatus](AKCDPFactory, "webAccessStatus"));
}

void __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "Received web access state change notification, triggering value value update: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

uint64_t __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_53(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)isWebAccessEnabled
{
  return objc_msgSend(a1, "webAccessStatus") == 1;
}

+ (BOOL)isEligibleToArmDeviceForPCSAuth
{
  int v3;

  v3 = objc_msgSend(a1, "isWalrusEnabled");
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "isWebAccessEnabled");
  return v3;
}

+ (id)webAccessChangeControllerForTargetStatus:(unint64_t)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  switch(a3)
  {
    case 2uLL:
      v11 = (void *)CoreCDPUILibraryCore();
      if (v11)
        v11 = getCDPUIStatusChangeControllerClass();
      v12 = 2;
      goto LABEL_15;
    case 1uLL:
      v11 = (void *)CoreCDPUILibraryCore();
      if (v11)
        v11 = getCDPUIStatusChangeControllerClass();
      v12 = 1;
      goto LABEL_15;
    case 0uLL:
      _AKLogSystem();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        +[AKCDPFactory webAccessChangeControllerForTargetStatus:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

      v11 = (void *)CoreCDPUILibraryCore();
      if (v11)
        v11 = getCDPUIStatusChangeControllerClass();
      v12 = 0;
LABEL_15:
      objc_msgSend(v11, "controllerWithTargetWebAccessStatus:", v12);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return a1;
}

+ (id)cdpIDMSRecordMIDKey
{
  void *v2;

  v2 = (void *)CoreCDPLibraryCore();
  if (v2)
  {
    getCDPIDMSRecordMIDKey();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (id)cdpIDMSRecordPRKKey
{
  void *v2;

  v2 = (void *)CoreCDPLibraryCore();
  if (v2)
  {
    getCDPIDMSPasswordResetKey();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (id)accountRecoveryControllerWithPresentingViewController:(id)a3
{
  id v3;
  objc_class *CDPUIAccountRecoveryControllerClass;
  void *v5;

  v3 = a3;
  CDPUIAccountRecoveryControllerClass = (objc_class *)CoreCDPUILibraryCore();
  if (CDPUIAccountRecoveryControllerClass)
    CDPUIAccountRecoveryControllerClass = (objc_class *)getCDPUIAccountRecoveryControllerClass();
  v5 = (void *)objc_msgSend([CDPUIAccountRecoveryControllerClass alloc], "initWithPresentingViewController:", v3);

  return v5;
}

+ (id)cdpStateUIController
{
  return 0;
}

+ (id)cdpUIControllerWithPresentingViewController:(id)a3
{
  id v3;
  objc_class *CDPUIControllerClass;
  void *v5;

  v3 = a3;
  CDPUIControllerClass = (objc_class *)CoreCDPUILibraryCore();
  if (CDPUIControllerClass)
    CDPUIControllerClass = (objc_class *)getCDPUIControllerClass();
  v5 = (void *)objc_msgSend([CDPUIControllerClass alloc], "initWithPresentingViewController:", v3);

  return v5;
}

- (BOOL)isUserVisibleKeychainSyncEnabled
{
  void *CDPKeychainSyncClass;

  CDPKeychainSyncClass = (void *)CoreCDPLibraryCore();
  if (CDPKeychainSyncClass)
    CDPKeychainSyncClass = getCDPKeychainSyncClass();
  return objc_msgSend(CDPKeychainSyncClass, "isUserVisibleKeychainSyncEnabled");
}

- (BOOL)isCDPEnabledForDSID:(id)a3
{
  return +[AKCDPFactory cdpAccountIsICDPEnabledForDSID:](AKCDPFactory, "cdpAccountIsICDPEnabledForDSID:", a3);
}

- (BOOL)isManateeAvailable
{
  objc_class *CDPStateControllerClass;
  id v3;
  char v4;
  id v5;
  NSObject *v6;
  id v8;

  CDPStateControllerClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPStateControllerClass)
    CDPStateControllerClass = (objc_class *)getCDPStateControllerClass();
  v3 = objc_alloc_init(CDPStateControllerClass);
  v8 = 0;
  v4 = objc_msgSend(v3, "isManateeAvailable:", &v8);
  v5 = v8;
  if (v5)
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AKCDPFactory isManateeAvailable].cold.1((uint64_t)v5, v6);

  }
  return v4;
}

- (BOOL)isHSA2EnabledForAltDSID:(id)a3
{
  return +[AKCDPFactory cdpAccountIsHSA2EnabledForAltDSID:](AKCDPFactory, "cdpAccountIsHSA2EnabledForAltDSID:", a3);
}

+ (void)walrusStatus
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Failed to fetch walrus status with error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

void __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "CDPWalrusStateChangeNotification constant is nil, CoreCDP framework link not available", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

+ (void)webAccessStatus
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Failed to fetch web access status with error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

void __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "CDPWebAccessStateChangeNotification constant is nil, CoreCDP framework link not available", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

+ (void)webAccessChangeControllerForTargetStatus:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Web access change UI requested for unknown status", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)isManateeAvailable
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Keychain sync is not enabled. Failed with error %{private}@", (uint8_t *)&v2, 0xCu);
}

@end
