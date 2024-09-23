@implementation CDPDStateMachine

- (CDPDStateMachine)initWithContext:(id)a3 uiProvider:(id)a4
{
  id v7;
  id v8;
  CDPDStateMachine *v9;
  CDPDStateMachine *v10;
  NSObject *v11;
  NSObject *v12;
  CDPInheritanceTrustController *v13;
  CDPInheritanceTrustController *inheritanceTrustController;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *cdpdStatemachineDefaultQueue;

  v7 = a3;
  v8 = a4;
  v9 = -[CDPDStateMachine init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_uiProvider, a4);
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CDPDStateMachine initWithContext:uiProvider:].cold.2();

    -[CDPDStateMachine _initDependenciesWithContext:](v10, "_initDependenciesWithContext:", v7);
    if (CFPreferencesGetAppBooleanValue(CFSTR("FakeDepletedRecords"), CFSTR("com.apple.corecdp"), 0))
    {
      _CDPLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CDPDStateMachine initWithContext:uiProvider:].cold.1();

      -[CDPDSecureBackupControl setFakeNearlyDepletedRecords:](v10->_secureBackupController, "setFakeNearlyDepletedRecords:", 1);
    }
    v13 = (CDPInheritanceTrustController *)objc_alloc_init(MEMORY[0x24BE1A438]);
    inheritanceTrustController = v10->_inheritanceTrustController;
    v10->_inheritanceTrustController = v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_DEFAULT, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("com.apple.cdpd.statemachineDefaultQueue", v16);
    cdpdStatemachineDefaultQueue = v10->_cdpdStatemachineDefaultQueue;
    v10->_cdpdStatemachineDefaultQueue = (OS_dispatch_queue *)v17;

  }
  return v10;
}

- (CDPDStateMachine)initWithContext:(id)a3 uiProvider:(id)a4 connection:(id)a5
{
  id v9;
  CDPDStateMachine *v10;
  CDPDStateMachine *v11;

  v9 = a5;
  v10 = -[CDPDStateMachine initWithContext:uiProvider:](self, "initWithContext:uiProvider:", a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_connection, a5);

  return v11;
}

- (CDPDStateMachine)initWithContext:(id)a3 connection:(id)a4
{
  id v7;
  CDPDStateMachine *v8;
  CDPDStateMachine *v9;

  v7 = a4;
  v8 = -[CDPDStateMachine initWithContext:uiProvider:](self, "initWithContext:uiProvider:", a3, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_connection, a4);

  return v9;
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
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"CDPDStateMachine %p deallocated\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleCloudDataProtectionStateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, _QWORD);
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  CDPDLockAssertion *v19;
  id v20;
  CDPDLockAssertion *lockAssertion;
  int v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[5];
  void (**v30)(id, uint64_t, uint64_t, _QWORD);
  uint64_t v31;
  char v32;
  id v33;
  uint8_t buf[4];
  CDPDStateMachine *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, uint64_t, _QWORD))a3;
  v5 = -[CDPContext isSharediPad](self->_context, "isSharediPad");
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CDPDStateMachine handleCloudDataProtectionStateWithCompletion:].cold.2((uint64_t)&self->_context, v7, v9, v10, v11, v12, v13, v14);

    if (-[CDPDStateMachine _isInSOSCircle](self, "_isInSOSCircle"))
    {
      v4[2](v4, 1, 1, 0);
      goto LABEL_25;
    }
    -[CDPDStateMachine reportCDPEntryEventWithContext:](self, "reportCDPEntryEventWithContext:", self->_context);
    v15 = _os_feature_enabled_impl();
    if (v15)
    {
      if (handleCloudDataProtectionStateWithCompletion__once != -1)
        dispatch_once(&handleCloudDataProtectionStateWithCompletion__once, &__block_literal_global_9);
      v16 = handleCloudDataProtectionStateWithCompletion__stateMachineSemaphore;
      v17 = dispatch_time(0, 300000000000);
      dispatch_semaphore_wait(v16, v17);
    }
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = self;
      _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, "\"State machine %@ is starting...\", buf, 0xCu);
    }

    -[CDPDStateMachine _updateSOSCompatibilityMode](self, "_updateSOSCompatibilityMode");
    v33 = 0;
    +[CDPDLockAssertion lockWithError:](CDPDLockAssertion, "lockWithError:", &v33);
    v19 = (CDPDLockAssertion *)objc_claimAutoreleasedReturnValue();
    v20 = v33;
    lockAssertion = self->_lockAssertion;
    self->_lockAssertion = v19;

    v22 = -[CDPContext _ignoreLockAssertErrors](self->_context, "_ignoreLockAssertErrors");
    if (v22)
    {
      _CDPLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v23, OS_LOG_TYPE_DEFAULT, "\"Ignoring lock assert errors\", buf, 2u);
      }

    }
    if (!self->_lockAssertion)
    {
      objc_msgSend(v20, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BDD1128]) && objc_msgSend(v20, "code") == 16)
      {

      }
      else
      {

        if (!v22)
        {
          if (v15)
            dispatch_semaphore_signal((dispatch_semaphore_t)handleCloudDataProtectionStateWithCompletion__stateMachineSemaphore);
          _CDPLogSystem();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[CDPDStateMachine handleCloudDataProtectionStateWithCompletion:].cold.1();

          if (v4)
          {
            _CDPStateError();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(id, uint64_t, uint64_t, void *))v4)[2](v4, 0, 0, v28);

          }
          goto LABEL_24;
        }
      }
    }
    _CDPLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v24, OS_LOG_TYPE_DEFAULT, "\"Successfully took device lock assertion or assertion already taken, proceeding with state machine\", buf, 2u);
    }

    v25 = -[CDPDCircleControl circleStatus](self->_circleController, "circleStatus");
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_28;
    v29[3] = &unk_24C81D8F8;
    v29[4] = self;
    v31 = v25;
    v32 = v15;
    v30 = v4;
    -[CDPDStateMachine _handleCloudDataProtectionStateWithCompletion:](self, "_handleCloudDataProtectionStateWithCompletion:", v29);

LABEL_24:
    goto LABEL_25;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"CDP is not supported on MAID accounts on shared iPads\", buf, 2u);
  }

  if (v4)
  {
    _CDPStateError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, uint64_t, void *))v4)[2](v4, 1, 0, v8);

  }
LABEL_25:

}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)handleCloudDataProtectionStateWithCompletion__stateMachineSemaphore;
  handleCloudDataProtectionStateWithCompletion__stateMachineSemaphore = (uint64_t)v0;

}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  int v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  dispatch_time_t v54;
  id v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD block[5];
  id v70;
  uint8_t buf[4];
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "cliqueStatus");
  objc_msgSend(*(id *)(a1 + 32), "_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_makeICSCCreationMissingWhenExpectedEventWithContext:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendEvent:", v6);

  }
  if (objc_msgSend(v3, "shouldCompleteSignIn")
    && objc_msgSend(v3, "cloudDataProtectionEnabled")
    && *(_QWORD *)(a1 + 48) != 1)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Successfully enabled iCDP and landed in circle. Updating keychain status and notifying clients.\", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "circleController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "circleProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x24BE1A488]);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithContext:", v12);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDPDKeychainSync keyChainSyncWithProxy:sosCircleProxy:context:](CDPDKeychainSync, "keyChainSyncWithProxy:sosCircleProxy:context:", v10, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "updateKeychainSyncStateIfNeededWithCompletion:", &__block_literal_global_34);
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:userInfo:deliverImmediately:", *MEMORY[0x24BE1A300], 0, 0, 1);

  }
  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *MEMORY[0x24BE1A5E0], *MEMORY[0x24BE1A860]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "shouldCompleteSignIn"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE1A7C8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE1A620]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "circleSyncingStatus"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE1A610]);

  v21 = objc_msgSend(v3, "shouldCompleteSignIn");
  v22 = (uint64_t *)MEMORY[0x24BE1A640];
  if (v21 && objc_msgSend(v3, "cloudDataProtectionEnabled"))
  {
    _CDPLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v23, OS_LOG_TYPE_DEFAULT, "\"Reporting success to circle proxy\", buf, 2u);
    }

    v24 = *v22;
    objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *v22);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "circleProxy");
    v25 = objc_claimAutoreleasedReturnValue();
    -[NSObject reportSuccess](v25, "reportSuccess");
    v26 = 0;
    goto LABEL_28;
  }
  _CDPLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v72 = v28;
    _os_log_impl(&dword_20DB2C000, v27, OS_LOG_TYPE_DEFAULT, "\"Reporting error to circle proxy %@\", buf, 0xCu);

  }
  v24 = *v22;
  objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *v22);
  objc_msgSend(v3, "error");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "domain");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BE1A368]);

  if (v31)
  {
    objc_msgSend(v3, "error");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v3, "error");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "cdp_errorWithCode:underlyingError:", -2, v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v17, "populateUnderlyingErrorsStartingWithRootError:", v26);
  v34 = (void *)MEMORY[0x24BE1A3F8];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v35 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v34, "isSubsetOfContextTypeSignIn:", -[NSObject type](v35, "type"))
    || !objc_msgSend(MEMORY[0x24BE1A4A0], "isAudioAccessory"))
  {
    goto LABEL_24;
  }
  objc_msgSend(v3, "error");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "domain");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x24BE0AB28]);

  if (v38)
  {
    _CDPLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_28_cold_2(v3);
LABEL_24:

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "circleProxy");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "reportFailure:", v40);

  objc_msgSend(v3, "error");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
    goto LABEL_29;
  _CDPLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_28_cold_1();
LABEL_28:

LABEL_29:
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "keychainSyncSystem") == 1)
  {
    v42 = MEMORY[0x24BDBD1C0];
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "circleSyncingStatus"))
      v43 = v42;
    else
      v43 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v43, v24);
  }
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sendEvent:", v17);

  v45 = objc_msgSend(v3, "shouldCompleteSignIn");
  objc_msgSend(v3, "error");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v46)
  {
    if (!(_DWORD)v45)
      goto LABEL_46;
    objc_msgSend(MEMORY[0x24BE1A428], "contextForStateRepair");
    v49 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "altDSID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAltDSID:](v49, "setAltDSID:", v50);

    +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "clearFollowUpWithContext:error:", v49, 0);

    goto LABEL_39;
  }
  objc_msgSend(v3, "error");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v47, "cdp_isCDPErrorWithCode:", -5307) & 1) != 0)
  {
    v48 = 1;
  }
  else
  {
    objc_msgSend(v3, "error");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v52, "cdp_isCDPErrorWithCode:", 5906);

  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("TreatAllErrorsAsFatal"), CFSTR("com.apple.corecdp"), 0)
    || objc_msgSend(MEMORY[0x24BE1A4A0], "isAudioAccessory"))
  {
    _CDPLogSystem();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v49, OS_LOG_TYPE_DEFAULT, "\"Detected a pref to require all failures to be fatal or platform is HomePod, failing out...\", buf, 2u);
    }
    goto LABEL_45;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "failSignInOnError") & 1) == 0 && !v48)
  {
    _CDPLogSystem();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "error");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v72 = v62;
      _os_log_impl(&dword_20DB2C000, v61, OS_LOG_TYPE_DEFAULT, "\"Detected a non-fatal error %@, allowing user to continue sign in, posting a CFU\", buf, 0xCu);

    }
    v63 = (void *)MEMORY[0x24BE1A3D0];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dsid");
    v49 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringValue](v49, "stringValue");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v63, "isICDPEnabledForDSID:", v64))
    {
      v65 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "keychainSyncSystem");

      if (v65)
      {
        v26 = 0;
        v45 = 1;
        goto LABEL_46;
      }
      objc_msgSend(MEMORY[0x24BE1A428], "contextForStateRepair");
      v49 = objc_claimAutoreleasedReturnValue();
      -[NSObject setRepairType:](v49, "setRepairType:", 2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "altDSID");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setAltDSID:](v49, "setAltDSID:", v66);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "telemetryFlowID");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setTelemetryFlowID:](v49, "setTelemetryFlowID:", v67);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "telemetryDeviceSessionID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setTelemetryDeviceSessionID:](v49, "setTelemetryDeviceSessionID:", v68);

      +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "postFollowUpItemForContext:error:", v49, 0);
    }

    v26 = 0;
LABEL_39:
    v45 = 1;
LABEL_45:

  }
LABEL_46:
  v53 = (void *)os_transaction_create();
  v54 = dispatch_time(0, 30000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_47;
  block[3] = &unk_24C81D8B0;
  block[4] = *(_QWORD *)(a1 + 32);
  v55 = v53;
  v70 = v55;
  dispatch_after(v54, MEMORY[0x24BDAC9B8], block);
  if (*(_BYTE *)(a1 + 56))
    dispatch_semaphore_signal((dispatch_semaphore_t)handleCloudDataProtectionStateWithCompletion__stateMachineSemaphore);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = dispatch_queue_create("CDPRecoveryKeyCache-Queue", v56);

  dispatch_async(v57, &__block_literal_global_50);
  if (objc_msgSend(v3, "cloudDataProtectionEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "_joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired");
  _CDPLogSystem();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v59 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v72 = v59;
    _os_log_impl(&dword_20DB2C000, v58, OS_LOG_TYPE_DEFAULT, "\"State machine %@ finished\", buf, 0xCu);
  }

  v60 = *(_QWORD *)(a1 + 40);
  if (v60)
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v60 + 16))(v60, v45, objc_msgSend(v3, "cloudDataProtectionEnabled"), v26);

}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_32(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Updated keychain sync with success: %{BOOL}d, error: %{public}@\", (uint8_t *)v6, 0x12u);
  }

}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_47(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DB2C000, v2, OS_LOG_TYPE_DEFAULT, "\"Uncaching all secrets after 30 seconds, fail safe...\", v4, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "secureBackupProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uncacheAllSecrets");

}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_49()
{
  id v0;

  +[CDPRecoveryKeyCache sharedInstance](CDPRecoveryKeyCache, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "deleteCache");

}

- (id)_errorForICSCCreationNotAttemptedWithResult:(id)a3 cliqueStatus:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;

  v6 = a3;
  if (!objc_msgSend(MEMORY[0x24BE1A4A0], "isInternalBuild")
    || !CFPreferencesGetAppBooleanValue(CFSTR("ForceICSCMissingEvent"), CFSTR("com.apple.corecdp"), 0))
  {
    -[CDPDStateMachine context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "keychainSyncSystem");

    if (v10)
    {
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.8();
    }
    else
    {
      -[CDPDStateMachine context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isBeneficiaryAccount");

      if (v13)
      {
        _CDPLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.1();
      }
      else
      {
        if (!a4)
        {
          if ((objc_msgSend(MEMORY[0x24BE1A448], "hasLocalSecret") & 1) == 0)
          {
            _CDPLogSystem();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.6();
            goto LABEL_28;
          }
          -[CDPDStateMachine context](self, "context");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "disableAsyncModeRequested");

          -[CDPDStateMachine context](self, "context");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v16)
          {
            v19 = objc_msgSend(v17, "didAttemptSecureBackupEnablement");

            _CDPLogSystem();
            v20 = objc_claimAutoreleasedReturnValue();
            v11 = v20;
            if (v19)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.2();
              goto LABEL_28;
            }
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.3();

            v24 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(v6, "error");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v24;
            v27 = -7300;
          }
          else
          {
            v21 = objc_msgSend(v17, "willAttemptAsyncSecureBackupEnablement");

            _CDPLogSystem();
            v22 = objc_claimAutoreleasedReturnValue();
            v11 = v22;
            if (v21)
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.4();
              goto LABEL_28;
            }
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.5();

            v28 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(v6, "error");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v28;
            v27 = -7301;
          }
          objc_msgSend(v26, "cdp_errorWithCode:underlyingError:", v27, v25);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_29;
        }
        _CDPLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.7();
      }
    }
LABEL_28:

    v14 = 0;
    goto LABEL_29;
  }
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CDPDStateMachine _errorForICSCCreationNotAttemptedWithResult:cliqueStatus:].cold.9();

  objc_msgSend(v6, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "error");
  else
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v14;
}

- (id)_makeICSCCreationMissingWhenExpectedEventWithContext:(id)a3 error:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDFC2A0];
  v6 = *MEMORY[0x24BE1A670];
  v7 = *MEMORY[0x24BE1A860];
  v8 = a4;
  objc_msgSend(v5, "analyticsEventWithContext:eventName:category:", a3, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "populateUnderlyingErrorsStartingWithRootError:", v8);

  return v9;
}

- (id)_makeCDPEntryEventWithContext:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSXPCConnection *connection;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CDPDAccount *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v4 = (void *)MEMORY[0x24BDFC2A0];
  v5 = *MEMORY[0x24BE1A690];
  v6 = *MEMORY[0x24BE1A860];
  v7 = a3;
  objc_msgSend(v4, "analyticsEventWithContext:eventName:category:", v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection aaf_processName](connection, "aaf_processName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE1A830]);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CDPDCircleControl cliqueStatus](self->_circleController, "cliqueStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE1A620]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[CDPDCircleControl circleSyncingStatus](self->_circleController, "circleSyncingStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE1A610]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "isPiggybackingRecovery"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE1A6F0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "isTTSURecovery"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE1A6F8]);

  v15 = objc_alloc_init(CDPDAccount);
  objc_msgSend(v7, "dsid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CDPDAccount isICDPEnabledForDSID:checkWithServer:](v15, "isICDPEnabledForDSID:checkWithServer:", v17, 0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE1A600]);

  objc_msgSend(MEMORY[0x24BDFC2D0], "localSecretType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE1A6D0]);

  v21 = (void *)MEMORY[0x24BDD16E0];
  v22 = objc_msgSend(v7, "keychainSyncSystem");

  objc_msgSend(v21, "numberWithInteger:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BE1A6C0]);

  return v8;
}

- (void)reportCDPEntryEventWithContext:(id)a3
{
  void *v3;
  id v4;

  -[CDPDStateMachine _makeCDPEntryEventWithContext:](self, "_makeCDPEntryEventWithContext:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendEvent:", v4);

}

- (void)_handleCloudDataProtectionStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  CDPContext *context;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CDPContext appleID](self->_context, "appleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 141558274;
    v21 = 1752392040;
    v22 = 2112;
    v23 = (uint64_t)v6;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Starting preflight of account for %{mask.hash}@\", buf, 0x16u);

  }
  -[CDPContext beneficiaryIdentifier](self->_context, "beneficiaryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[CDPContext appleID](self->_context, "appleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPContext beneficiaryIdentifier](self->_context, "beneficiaryIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = (uint64_t)v9;
      v22 = 2160;
      v23 = 1752392040;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Skipping account preflight for %@ due to presence of beneficiary identifier: %{mask.hash}@\", buf, 0x20u);

    }
    -[CDPDStateMachine _handleBeneficiaryTrustWithCompletion:](self, "_handleBeneficiaryTrustWithCompletion:", v4);
  }
  else
  {
    -[CDPDStateMachine context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isFederatedAccount");

    -[CDPDStateMachine context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "managedAccountsAllowedInCDP");

    if (!v12 || (v14 & 1) != 0)
    {
      context = self->_context;
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke;
      v18[3] = &unk_24C81C558;
      v18[4] = self;
      v19 = v4;
      -[CDPDStateMachine _preflightAccountStateWithContext:completion:](self, "_preflightAccountStateWithContext:completion:", context, v18);

    }
    else
    {
      _CDPLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CDPDStateMachine _handleCloudDataProtectionStateWithCompletion:].cold.1(self, v12, v15);

      _CDPStateError();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDStateMachine _handlePreflightError:completion:](self, "_handlePreflightError:completion:", v16, v4);

    }
  }

}

void __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v23 = a2;
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Preflight finished with shouldProceed=%i error=%@\", buf, 0x12u);
  }

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handlePreflightError:completion:", v5, *(_QWORD *)(a1 + 40));
    goto LABEL_21;
  }
  v7 = objc_msgSend(MEMORY[0x24BE1A4A0], "isAudioAccessory");
  v8 = *(id **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v8, "_enrollOrDisableCDPAfterEnabledStateVerified:", *(_QWORD *)(a1 + 40));
    goto LABEL_21;
  }
  if (objc_msgSend(v8[1], "isiCDPEligible")
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "password"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Credential was provided, attempting to register...\", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "circleProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "tryRegisteringCredentials");

    if ((v12 & 1) != 0)
      goto LABEL_18;
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "circleProxy");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject registerCredentials](v14, "registerCredentials");
  }
  else
  {
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"Credential was not provided or we are not HSA2/MAID... moving on!\", buf, 2u);
    }
  }

LABEL_18:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "circleProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "waitForUpdate");

  _CDPLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"Checking iCDP status...\", buf, 2u);
  }

  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(a1 + 40);
  v19 = *(void **)(v17 + 24);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke_58;
  v20[3] = &unk_24C81C558;
  v20[4] = v17;
  v21 = v18;
  objc_msgSend(v19, "checkiCDPStatusNetwork:withCompletion:", 1, v20);

LABEL_21:
}

void __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke_58(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Finished checking iCDP status with isEnabled=%i error=%@\", buf, 0x12u);
  }

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_enrollOrDisableCDPAfterEnabledStateVerified:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_handleiCDPStatusCheckError:completion:", v5, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke_59;
      v8[3] = &unk_24C81D920;
      v9 = *(id *)(a1 + 40);
      objc_msgSend(v7, "_attemptCDPEnable:", v8);

    }
  }

}

uint64_t __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke_59(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_handleiCDPStatusCheckError:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t);
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  if (!objc_msgSend(v8, "isAuthKitUnableToPromptError"))
  {
    if (!v5)
      goto LABEL_8;
LABEL_6:
    +[CDPStateHandlerResult resultWithError:](CDPStateHandlerResult, "resultWithError:", v8);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isAuthKitUnableToPromptDueToNetworkError"))
    goto LABEL_6;
  if (v5)
  {
    +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", 0, 1, v8);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v6;
    v5[2](v5, v6);

  }
LABEL_8:

}

- (void)_handleBeneficiaryTrustWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  CDPStateUIProviderInternal *uiProvider;
  CDPContext *context;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t *v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  CDPDStateMachine *v17;

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Prompting for access key for beneficiary trust.\", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v13 = buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = self;
  context = v17->_context;
  uiProvider = v17->_uiProvider;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__CDPDStateMachine__handleBeneficiaryTrustWithCompletion___block_invoke;
  v9[3] = &unk_24C81D970;
  v9[4] = v17;
  v11 = buf;
  v8 = v4;
  v10 = v8;
  -[CDPStateUIProviderInternal cdpContext:promptForBeneficiaryAccessKeyWithCompletion:](uiProvider, "cdpContext:promptForBeneficiaryAccessKeyWithCompletion:", context, v9);

  _Block_object_dispose(buf, 8);
}

void __58__CDPDStateMachine__handleBeneficiaryTrustWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Successfully obtained access code. Trying to recover trust...\", buf, 2u);
    }

    v12 = v5;
    v13 = *(id *)(a1 + 40);
    cdp_dispatch_async_with_qos();

    v9 = v12;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__CDPDStateMachine__handleBeneficiaryTrustWithCompletion___block_invoke_cold_1();

    +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", 0, 1, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

  }
}

void __58__CDPDStateMachine__handleBeneficiaryTrustWithCompletion___block_invoke_61(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "_attemptBeneficiaryTrustWithInheritanceKey:retryCount:completion:", a1[4], 0, a1[5]);
  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)_attemptBeneficiaryTrustWithInheritanceKey:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  CDPInheritanceTrustController *inheritanceTrustController;
  CDPContext *context;
  void *v15;
  NSObject *v16;
  void *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = a4;
    _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Checking for circle status in order to put beneficiary account in trust, attempt #%lu.\", buf, 0xCu);
  }

  -[CDPDStateMachine circleController](self, "circleController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "circleStatus");

  if (v12 == 4 || v12 == 2)
  {
    inheritanceTrustController = self->_inheritanceTrustController;
    context = self->_context;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __85__CDPDStateMachine__attemptBeneficiaryTrustWithInheritanceKey_retryCount_completion___block_invoke;
    v27[3] = &unk_24C81C0D0;
    v28 = v9;
    -[CDPInheritanceTrustController recoverOctagonWithContext:inheritanceKey:completion:](inheritanceTrustController, "recoverOctagonWithContext:inheritanceKey:completion:", context, v8, v27);
    v15 = v28;
LABEL_6:

    goto LABEL_7;
  }
  if (a4 <= 4 && v12 == 5)
  {
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[CDPDStateMachine _attemptBeneficiaryTrustWithInheritanceKey:retryCount:completion:].cold.1(a4 ^ 2);

    _CDPSignpostLogSystem();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = _CDPSignpostCreate();

    _CDPSignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20DB2C000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "NoCKAccountBackOffRetry", " enableTelemetry=YES ", buf, 2u);
    }

    _CDPSignpostLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v30 = v18;
      _os_log_impl(&dword_20DB2C000, v21, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: NoCKAccountBackOffRetry  enableTelemetry=YES ", buf, 0xCu);
    }

    dispatch_time(0, 1000000000 * (a4 ^ 2));
    v25 = v8;
    v26 = v9;
    cdp_dispatch_after_with_qos();

    v15 = v25;
    goto LABEL_6;
  }
  _CDPLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[CDPDStateMachine _attemptBeneficiaryTrustWithInheritanceKey:retryCount:completion:].cold.2();

  _CDPStateError();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", 0, 1, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    (*((void (**)(id, void *))v9 + 2))(v9, v24);

LABEL_7:
}

void __85__CDPDStateMachine__attemptBeneficiaryTrustWithInheritanceKey_retryCount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  NSObject *v6;
  __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("failure");
    if (!v3)
      v5 = CFSTR("success");
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Beneficiary trust recovery was a %@.\", (uint8_t *)&v10, 0xCu);
  }

  if (v3)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __85__CDPDStateMachine__attemptBeneficiaryTrustWithInheritanceKey_retryCount_completion___block_invoke_cold_1();

    +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", 0, 1, v3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!*(_QWORD *)(a1 + 32))
      goto LABEL_16;
    +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", 1, 1, 0);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Completing the beneficiary trust with results: %@\", (uint8_t *)&v10, 0xCu);
    }

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, __CFString *))(v9 + 16))(v9, v7);

LABEL_16:
}

uint64_t __85__CDPDStateMachine__attemptBeneficiaryTrustWithInheritanceKey_retryCount_completion___block_invoke_68(uint64_t a1)
{
  uint64_t Nanoseconds;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  double v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 72);
    v10 = 67240192;
    LODWORD(v11) = v6;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v4, OS_SIGNPOST_INTERVAL_END, v5, "NoCKAccountBackOffRetry", " NextRetryInterval=%{public,signpost.telemetry:number1,name=NextRetryInterval}d ", (uint8_t *)&v10, 8u);
  }

  _CDPSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218496;
    v8 = *(_QWORD *)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 56);
    v12 = 2048;
    v13 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v14 = 1026;
    v15 = v8;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: NoCKAccountBackOffRetry  NextRetryInterval=%{public,signpost.telemetry:number1,name=NextRetryInterval}d ", (uint8_t *)&v10, 0x1Cu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_attemptBeneficiaryTrustWithInheritanceKey:retryCount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48));
}

- (void)_enrollOrDisableCDPAfterEnabledStateVerified:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  CDPDCircleControl *circleController;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  if (-[CDPContext isiCDPEligible](self->_context, "isiCDPEligible"))
  {
    v5 = -[CDPContext _forceReset](self->_context, "_forceReset");
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"CDP Reset has been requested... hold on to your hats...\", buf, 2u);
      }

      -[CDPDStateMachine resetAccountCDPStateWithCompletion:](self, "resetAccountCDPStateWithCompletion:", v4);
    }
    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"iCDP is enabled on HSA2/MAID account, attempting to join circle...\", buf, 2u);
      }

      circleController = self->_circleController;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke;
      v11[3] = &unk_24C81D9E8;
      v11[4] = self;
      v12 = v4;
      -[CDPDCircleControl joinCircleWithCompletion:](circleController, "joinCircleWithCompletion:", v11);

    }
  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"iCDP is enabled, but the account is not HSA2 enabled or an allowed managed account. Used to roll back iCDP enrollment previously, but these days we don't...\", buf, 2u);
    }

    +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", 1, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      (*((void (**)(id, void *))v4 + 2))(v4, v9);

  }
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "didJoin"))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "keychainSyncSystem");

    if (v8 == 1)
    {
      _CDPLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_cold_1();

      v10 = *(_QWORD *)(a1 + 40);
      +[CDPStateHandlerResult successResult](CDPStateHandlerResult, "successResult");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    objc_msgSend(*(id *)(a1 + 32), "_enableSecureBackupWithJoinResult:completion:", v5, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v12 = objc_msgSend(v5, "needsBackupRecovery");
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"Attempting to RECOVER backup\", buf, 2u);
      }

      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_69;
      v17[3] = &unk_24C81D600;
      v15 = *(void **)(a1 + 40);
      v18 = *(id *)(a1 + 32);
      v19 = v15;
      objc_msgSend(v18, "_recoverSecureBackupWithCircleJoinResult:completion:", v5, v17);

    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_cold_2();

      v10 = *(_QWORD *)(a1 + 40);
      if (v10)
      {
        +[CDPStateHandlerResult resultWithError:](CDPStateHandlerResult, "resultWithError:", v6);
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v16 = (void *)v11;
        (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v11);

      }
    }
  }

}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_69(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v20 = a2;
    v21 = 1024;
    v22 = a3;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Finished recovering backup with didRecover=%i didRequestReset=%i error=%@\", buf, 0x18u);
  }

  if (a3)
  {
    if (objc_msgSend(MEMORY[0x24BE1A3F8], "isSubsetOfContextTypeSignIn:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "type")))
    {
      _CDPLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_69_cold_1();

      v10 = *(_QWORD *)(a1 + 40);
      if (v10)
      {
        _CDPStateError();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[CDPStateHandlerResult resultWithError:](CDPStateHandlerResult, "resultWithError:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

      }
    }
    else
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_70;
      v16[3] = &unk_24C81D9C0;
      v15 = *(void **)(a1 + 40);
      v17 = *(id *)(a1 + 32);
      v18 = v15;
      objc_msgSend(v17, "resetAccountCDPStateWithCompletion:", v16);

    }
  }
  else
  {
    +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", a2, a2, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v13);

  }
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Will show RPD completed alert\", buf, 2u);
  }

  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v7;
      _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Error while performing RPD: %@\", buf, 0xCu);

    }
    v8 = (id)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
    CDPLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD0FC8]);

    CDPLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD0FD8]);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD0FE8]);

    objc_msgSend(v3, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDD1398]);

    _CDPStateError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v19 = *(_QWORD *)(v16 + 8);
    v18 = *(void **)(v16 + 16);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_79;
    v28[3] = &unk_24C81C900;
    v29 = v3;
    v30 = v17;
    v20 = v3;
    objc_msgSend(v18, "cdpContext:showError:withCompletion:", v19, v15, v28);

  }
  else
  {
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(a1 + 40);
    v24 = *(_QWORD *)(v21 + 8);
    v23 = *(void **)(v21 + 16);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_2;
    v25[3] = &unk_24C81C870;
    v26 = v3;
    v27 = v22;
    v8 = v3;
    objc_msgSend(v23, "cdpContext:showResetCompletedAlertWithCompletion:", v24, v25);

    v15 = v27;
  }

}

uint64_t __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_79(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    if (a2 != 1)
      goto LABEL_9;
  }
  else
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Reset completed confirmation alert was not shown due to: %@\", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 32));
LABEL_9:

}

- (void)_disableRecoveryKeyWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  CDPDSecureBackupDisableCapable *secureBackupDisableController;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  secureBackupDisableController = self->_secureBackupDisableController;
  if (secureBackupDisableController)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__CDPDStateMachine__disableRecoveryKeyWithCompletion___block_invoke;
    v8[3] = &unk_24C81C0D0;
    v9 = v4;
    -[CDPDSecureBackupDisableCapable disableRecoveryKeyWithCompletion:](secureBackupDisableController, "disableRecoveryKeyWithCompletion:", v8);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5004);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v7);

  }
}

void __54__CDPDStateMachine__disableRecoveryKeyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __54__CDPDStateMachine__disableRecoveryKeyWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Successfully disabled recovery key!\", v7, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)resetAccountCDPStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  CDPDRPDExecutor *v10;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[4];
  id v14;
  CDPDStateMachine *v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_context, *MEMORY[0x24BE1A780], *MEMORY[0x24BE1A860]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81CDE8;
  v7 = v5;
  v14 = v7;
  v15 = self;
  v8 = v4;
  v16 = v8;
  v9 = _Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "shouldCentralizeRPDFlow"))
  {
    v10 = -[CDPDRPDExecutor initWithSbDeleter:ledger:resetter:]([CDPDRPDExecutor alloc], "initWithSbDeleter:ledger:resetter:", self->_secureBackupDisableController, self->_ledger, self->_circleController);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_87;
    v11[3] = &unk_24C81C0D0;
    v12 = v9;
    -[CDPDRPDExecutor performRPDWithCompletionHandler:](v10, "performRPDWithCompletionHandler:", v11);

  }
  else
  {
    -[CDPDStateMachine _resetAccountCDPStateWithCompletion:](self, "_resetAccountCDPStateWithCompletion:", v9);
  }

}

void __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE1A640]);

  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"CDP reset succeeded, attempting to join/create the circle again\", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendEvent:", *(_QWORD *)(a1 + 32));

    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v12 = *(void **)(v10 + 32);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_84;
    v16[3] = &unk_24C81D9E8;
    v16[4] = v10;
    v17 = v11;
    objc_msgSend(v12, "joinCircleIgnoringBackups:completion:", 1, v16);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v5);
    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendEvent:", *(_QWORD *)(a1 + 32));

    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      +[CDPStateHandlerResult resultWithError:](CDPStateHandlerResult, "resultWithError:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

    }
  }

}

void __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "didJoin"))
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (!v13)
      goto LABEL_15;
    +[CDPStateHandlerResult resultWithError:](CDPStateHandlerResult, "resultWithError:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v15 = (void *)v14;
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v14);

    goto LABEL_15;
  }
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Joined circle after CDP reset. Attempting to disable RK...\", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_disableRecoveryKeyWithCompletion:", 0);
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasLocalSecret");

  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Joined circle after CDP reset. Enabling secure backup...\", buf, 2u);
    }

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_85;
    v16[3] = &unk_24C81C580;
    v12 = *(void **)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v12, "_enableSecureBackupWithCircleJoinResult:completion:", v5, v16);

    goto LABEL_15;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Joined circle after CDP reset. Skipping secure backup because we don't have a secret\", buf, 2u);
  }

  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    +[CDPStateHandlerResult successResult](CDPStateHandlerResult, "successResult");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_15:

}

void __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_85(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
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
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Finished enabling secure backup after CDP reset with didEnable=%i error=%@...\", (uint8_t *)v8, 0x12u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", a2, a2, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_87(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

- (void)_enableSecureBackupWithJoinResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  CDPDSecureBackupControl *secureBackupController;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[8];
  _QWORD aBlock[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke;
  aBlock[3] = &unk_24C81D210;
  v9 = v7;
  v20 = v9;
  aBlock[4] = self;
  v10 = v6;
  v19 = v10;
  v11 = _Block_copy(aBlock);
  if (objc_msgSend(v10, "requiresEscrowRecordsFetch"))
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"Checking for existing records before enabling secure backup...\", buf, 2u);
    }

    secureBackupController = self->_secureBackupController;
    -[CDPDStateMachine _predicateForRecordUpgradeCheckIgnoringBottled](self, "_predicateForRecordUpgradeCheckIgnoringBottled");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke_89;
    v15[3] = &unk_24C81D1E8;
    v15[4] = self;
    v16 = v11;
    -[CDPDSecureBackupControl checkForExistingRecordMatchingPredicate:forceFetch:completion:](secureBackupController, "checkForExistingRecordMatchingPredicate:forceFetch:completion:", v14, 0, v15);

  }
  else
  {
    (*((void (**)(void *, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
  }

}

void __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke_cold_1();

    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      +[CDPStateHandlerResult resultWithError:](CDPStateHandlerResult, "resultWithError:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v14 = (void *)v8;
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v8);
LABEL_16:

    }
  }
  else
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasLocalSecret");

      if (v10)
      {
        _CDPLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Enabling secure backup...\", buf, 2u);
        }

        v12 = *(void **)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke_88;
        v16[3] = &unk_24C81CF50;
        v18 = *(id *)(a1 + 48);
        v17 = *(id *)(a1 + 40);
        objc_msgSend(v12, "_enableSecureBackupWithCircleJoinResult:completion:", v13, v16);

        v14 = v18;
        goto LABEL_16;
      }
    }
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v15, OS_LOG_TYPE_DEFAULT, "\"Device is in circle but has no local secret or already has a secure backup enabled, skipping secure backup enable\", buf, 2u);
    }

    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      +[CDPStateHandlerResult successResult](CDPStateHandlerResult, "successResult");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }

}

void __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke_88(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
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
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Finished enabling secure backup with didEnable=%i error=%@...\", (uint8_t *)v8, 0x12u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:peeriCloudKeychainState:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:peeriCloudKeychainState:error:", a2, a2, objc_msgSend(*(id *)(a1 + 32), "remotePeeriCKState"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_alwaysCreateEscrowRecord");

    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

- (void)_handlePreflightError:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  _BOOL4 v8;
  int v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = (-[CDPContext isiCDPEligible](self->_context, "isiCDPEligible") & 1) != 0
    || -[CDPContext type](self->_context, "type") == 2;
  v9 = -[CDPContext isFederatedAccount](self->_context, "isFederatedAccount");
  -[CDPDStateMachine context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "managedAccountsAllowedInCDP");

  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8 && v9 ^ 1 | v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CDPDStateMachine _handlePreflightError:completion:].cold.1();

    if (v7)
    {
      +[CDPStateHandlerResult resultWithError:](CDPStateHandlerResult, "resultWithError:", v6);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v14);
LABEL_17:

    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Account preflight failed with error, continuing state machine - %@\", (uint8_t *)&v16, 0xCu);
    }

    if (v7)
    {
      if (objc_msgSend(MEMORY[0x24BE1A4A0], "isAudioAccessory"))
        v14 = v6;
      else
        v14 = 0;
      +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", 0, 1, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v15);

      goto LABEL_17;
    }
  }

}

- (void)_updateCDPEnableEventWithError:(id)a3 error:(id)a4 didEnable:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a5;
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a4;
  v14 = a3;
  objc_msgSend(v8, "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE1A640]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE1A600]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CDPDCircleControl cliqueStatus](self->_circleController, "cliqueStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE1A620]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[CDPDCircleControl circleSyncingStatus](self->_circleController, "circleSyncingStatus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE1A610]);

  objc_msgSend(v14, "populateUnderlyingErrorsStartingWithRootError:", v9);
}

- (void)_attemptCDPEnable:(id)a3
{
  id v4;
  CDPContext *context;
  int v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  context = self->_context;
  v14 = 0;
  v6 = -[CDPContext isiCDPEligibleWithError:](context, "isiCDPEligibleWithError:", &v14);
  v7 = v14;
  if (v6)
  {
    if (!self->_attemptedCDPEnable)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __38__CDPDStateMachine__attemptCDPEnable___block_invoke;
      v12[3] = &unk_24C81C558;
      v12[4] = self;
      v13 = v4;
      -[CDPDStateMachine _confirmCDPEligibilityWithCompletion:](self, "_confirmCDPEligibilityWithCompletion:", v12);

      goto LABEL_13;
    }
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPDStateMachine _attemptCDPEnable:].cold.1();

    if (v4)
    {
      _CDPStateError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CDPStateHandlerResult resultWithError:](CDPStateHandlerResult, "resultWithError:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      (*((void (**)(id, void *))v4 + 2))(v4, v10);

    }
  }
  else
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CDPDStateMachine _attemptCDPEnable:].cold.2();

    if (v4)
    {
      +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", 0, 1, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
LABEL_13:

}

void __38__CDPDStateMachine__attemptCDPEnable___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[16];

  v5 = a3;
  if (a2)
  {
    v6 = objc_alloc(MEMORY[0x24BDFC2A0]);
    v7 = (void *)objc_msgSend(v6, "initWithEventName:eventCategory:initData:", *MEMORY[0x24BE1A5D8], *MEMORY[0x24BE1A860], 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "telemetryFlowID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "telemetryFlowID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDFC340]);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "telemetryDeviceSessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "telemetryDeviceSessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDFC318]);

    }
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"Attempting to enable iCDP...\", buf, 2u);
    }

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v15 = *(void **)(v13 + 24);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __38__CDPDStateMachine__attemptCDPEnable___block_invoke_91;
    v18[3] = &unk_24C81CDE8;
    v18[4] = v13;
    v19 = v7;
    v20 = v14;
    v16 = v7;
    objc_msgSend(v15, "enableCDPWithCompletion:", v18);

    goto LABEL_13;
  }
  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    __38__CDPDStateMachine__attemptCDPEnable___block_invoke_cold_1();

  if (*(_QWORD *)(a1 + 40))
  {
    +[CDPStateHandlerResult resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:](CDPStateHandlerResult, "resultWithCloudDataProtectionEnabled:shouldCompleteSignIn:error:", 0, 1, v5);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_13:

  }
}

void __38__CDPDStateMachine__attemptCDPEnable___block_invoke_91(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
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
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Finished enabling iCDP with didEnable=%i error=%@\", (uint8_t *)v10, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateCDPEnableEventWithError:error:didEnable:", *(_QWORD *)(a1 + 40), v5, a2);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendEvent:", *(_QWORD *)(a1 + 40));

  if ((_DWORD)a2)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_handleCloudDataProtectionStateWithCompletion:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      +[CDPStateHandlerResult resultWithError:](CDPStateHandlerResult, "resultWithError:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    }
  }

}

- (void)_updateSOSCompatibilityMode
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  -[CDPDStateMachine context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isSOSNeeded") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[CDPDStateMachine context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isSOSCompatibilityOptInNeeded");

  }
  -[CDPDStateMachine context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = +[CDPCompatibilityModeUpdater setSOSCompatibilityMode:context:error:](CDPCompatibilityModeUpdater, "setSOSCompatibilityMode:context:error:", v4, v6, &v11);
  v8 = v11;

  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDStateMachine _makeSOSCompatibilityModeEnableEvent:error:](self, "_makeSOSCompatibilityModeEnableEvent:error:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendEvent:", v10);

  }
}

- (id)_makeSOSCompatibilityModeEnableEvent:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v5;
  CDPContext *context;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDFC2A0];
  context = self->_context;
  v7 = *MEMORY[0x24BE1A788];
  v8 = *MEMORY[0x24BE1A860];
  v9 = a4;
  objc_msgSend(v5, "analyticsEventWithContext:eventName:category:", context, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE1A640]);

  objc_msgSend(v10, "populateUnderlyingErrorsStartingWithRootError:", v9);
  return v10;
}

- (void)_initDependenciesWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  CDPDSOSCircleController *v10;
  CDPDCircleControl *circleController;
  CDPDSOSSecureBackupController *v12;
  CDPDSecureBackupControl *secureBackupController;
  CDPDCircleController *v14;
  CDPStateUIProviderInternal *uiProvider;
  CDPDOctagonTrustProxyImpl *v16;
  CDPDCircleControl *v17;
  CDPDCircleControl *v18;
  CDPDSecureBackupController *v19;
  CDPDPCSController *v20;
  id v21;
  CDPDPCSController *v22;
  CDPDPCSController *pcsController;

  v4 = a3;
  v5 = objc_msgSend(v4, "keychainSyncSystem");
  v6 = CFSTR("SOS");
  if (!v5)
    v6 = CFSTR("Octagon");
  v7 = v6;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDStateMachine _initDependenciesWithContext:].cold.1();

  if (objc_msgSend(v4, "keychainSyncSystem") == 1)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A488]), "initWithContext:", v4);
    v10 = -[CDPDSOSCircleController initWithUiProvider:delegate:circleProxy:octagonTrustProxy:]([CDPDSOSCircleController alloc], "initWithUiProvider:delegate:circleProxy:octagonTrustProxy:", self->_uiProvider, self, v9, 0);
    circleController = self->_circleController;
    self->_circleController = (CDPDCircleControl *)v10;

    v12 = -[CDPDSOSSecureBackupController initWithContext:uiProvider:delegate:]([CDPDSOSSecureBackupController alloc], "initWithContext:uiProvider:delegate:", v4, self->_uiProvider, self);
    secureBackupController = self->_secureBackupController;
    self->_secureBackupController = (CDPDSecureBackupControl *)v12;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3E8]), "initWithContext:", v4);
    v14 = [CDPDCircleController alloc];
    uiProvider = self->_uiProvider;
    v16 = -[CDPDOctagonTrustProxyImpl initWithContext:]([CDPDOctagonTrustProxyImpl alloc], "initWithContext:", v4);
    v17 = -[CDPDCircleController initWithUiProvider:delegate:circleProxy:octagonTrustProxy:](v14, "initWithUiProvider:delegate:circleProxy:octagonTrustProxy:", uiProvider, self, v9, v16);
    v18 = self->_circleController;
    self->_circleController = v17;

    v19 = -[CDPDSecureBackupController initWithContext:uiProvider:delegate:]([CDPDSecureBackupController alloc], "initWithContext:uiProvider:delegate:", v4, self->_uiProvider, self);
    objc_storeStrong((id *)&self->_secureBackupController, v19);
    objc_storeStrong((id *)&self->_secureBackupEnableController, v19);
    secureBackupController = self->_secureBackupDisableController;
    self->_secureBackupDisableController = (CDPDSecureBackupDisableCapable *)v19;
  }

  v20 = [CDPDPCSController alloc];
  v21 = objc_alloc_init(MEMORY[0x24BE1A470]);
  v22 = -[CDPDPCSController initWithContext:pcsProxy:](v20, "initWithContext:pcsProxy:", v4, v21);
  pcsController = self->_pcsController;
  self->_pcsController = v22;

}

- (void)_shouldPerformAuthenticatedRepairWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  CDPContext *v8;
  CDPContext *context;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  void (**v26)(id, uint64_t, _QWORD);
  BOOL v27;
  uint8_t buf[16];

  v4 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (v6)
  {
    if (self->_context)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contextForPrimaryAccount");
    v8 = (CDPContext *)objc_claimAutoreleasedReturnValue();
    context = self->_context;
    self->_context = v8;

    if (self->_context)
    {
LABEL_19:
      if (CFPreferencesGetAppBooleanValue(CFSTR("FakeRepairStateRequired"), CFSTR("com.apple.corecdp"), 0))
      {
        _CDPLogSystem();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[CDPDStateMachine _shouldPerformAuthenticatedRepairWithOptionForceFetch:completion:].cold.2();

        v6[2](v6, 1, 0);
      }
      else
      {
        -[CDPDCircleControl circleProxy](self->_circleController, "circleProxy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "waitForUpdate");

        -[CDPContext passwordEquivToken](self->_context, "passwordEquivToken");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[CDPDStateMachine _continueShouldPerformRepairWithOptionForceFetch:completion:](self, "_continueShouldPerformRepairWithOptionForceFetch:completion:", v4, v6);
        }
        else
        {
          _CDPLogSystem();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_DEFAULT, "\"Missing PET, starting to re-authenticate\", buf, 2u);
          }

          -[NSXPCConnection processName](self->_connection, "processName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSXPCConnection bundleID](self->_connection, "bundleID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __85__CDPDStateMachine__shouldPerformAuthenticatedRepairWithOptionForceFetch_completion___block_invoke;
          v25[3] = &unk_24C81DA10;
          v25[4] = self;
          v27 = v4;
          v26 = v6;
          +[CDPAuthenticationHelper silentAuthenticationForPrimaryAccountWithClientAppName:clientAppBundleId:withCompletion:](CDPAuthenticationHelper, "silentAuthenticationForPrimaryAccountWithClientAppName:clientAppBundleId:withCompletion:", v23, v24, v25);

        }
      }
    }
    else
    {
      _CDPLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CDPDStateMachine _shouldPerformAuthenticatedRepairWithOptionForceFetch:completion:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5102);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v21);

    }
  }

}

void __85__CDPDStateMachine__shouldPerformAuthenticatedRepairWithOptionForceFetch_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __85__CDPDStateMachine__shouldPerformAuthenticatedRepairWithOptionForceFetch_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3F8]), "initWithAuthenticationResults:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_refreshAndAuthenticateWithContext:", v8);
    objc_msgSend(*(id *)(a1 + 32), "_continueShouldPerformRepairWithOptionForceFetch:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

- (void)shouldPerformRepairWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t, _QWORD);
  CDPContext *v7;
  CDPContext *context;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (!v6)
    goto LABEL_13;
  if (self->_context)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
  v7 = (CDPContext *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  self->_context = v7;

  if (self->_context)
  {
    -[CDPDStateMachine _initDependenciesWithContext:](self, "_initDependenciesWithContext:");
LABEL_5:
    if (CFPreferencesGetAppBooleanValue(CFSTR("FakeRepairStateRequired"), CFSTR("com.apple.corecdp"), 0))
    {
      _CDPLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[CDPDStateMachine _shouldPerformAuthenticatedRepairWithOptionForceFetch:completion:].cold.2();

      v6[2](v6, 1, 0);
    }
    else
    {
      -[CDPDCircleControl circleProxy](self->_circleController, "circleProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "waitForUpdate");

      -[CDPDStateMachine _continueShouldPerformRepairWithOptionForceFetch:completion:](self, "_continueShouldPerformRepairWithOptionForceFetch:completion:", v4, v6);
    }
    goto LABEL_13;
  }
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CDPDStateMachine shouldPerformRepairWithOptionForceFetch:completion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5102);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v19);

LABEL_13:
}

- (void)_continueShouldPerformRepairWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t, void *);
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  void (**v21)(id, uint64_t, void *);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  CDPDStateMachine *v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, void *))a4;
  if ((-[CDPContext isiCDPEligible](self->_context, "isiCDPEligible") & 1) != 0)
  {
    -[CDPDCircleControl circleProxy](self->_circleController, "circleProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v8 = objc_msgSend(v7, "combinedCircleStatus:", &v22);
    v9 = v22;

    if (v8 != 1)
    {
      _CDPLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = (uint64_t)v14;
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"HSA2/MAID account that is not in circle, suggesting repair needed: %@, %@\", buf, 0x16u);

      }
      if (!v6)
        goto LABEL_33;
      _CDPStateErrorWithUnderlying();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 1, v15);
      goto LABEL_32;
    }
    if (-[CDPContext isBeneficiaryAccount](self->_context, "isBeneficiaryAccount"))
    {
      _CDPLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v11 = "\"Local account is a beneficiary alias and is already in circle, repair not needed\";
      goto LABEL_24;
    }
    if (!-[CDPDStateMachine _localDeviceHasLocalSecret](self, "_localDeviceHasLocalSecret"))
    {
      _CDPLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v11 = "\"Local device does not have local secret and is already in circle, repair not needed\";
LABEL_24:
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
LABEL_25:

      if (v6)
        v6[2](v6, 0, 0);
      goto LABEL_33;
    }
    -[CDPDStateMachine _makeEscrowRecordControllerWithCurrentContext](self, "_makeEscrowRecordControllerWithCurrentContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (v4)
        v16 = 2;
      else
        v16 = 0;
      _CDPLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v24 = v16;
        v25 = 2112;
        v26 = v15;
        v27 = 2112;
        v28 = self;
        _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Using fetchSource (%lu) for escrow record controller (%@) in state machine (%@)\", buf, 0x20u);
      }

      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __80__CDPDStateMachine__continueShouldPerformRepairWithOptionForceFetch_completion___block_invoke;
      v20[3] = &unk_24C81DA38;
      v21 = v6;
      objc_msgSend(v15, "generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource:withCompletion:", v16, v20);
      v18 = v21;
    }
    else
    {
      _CDPLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CDPDStateMachine _continueShouldPerformRepairWithOptionForceFetch:completion:].cold.1();

      if (!v6)
        goto LABEL_32;
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v18);
    }

LABEL_32:
LABEL_33:

    goto LABEL_34;
  }
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"non-HSA2/allowed MAID account detected, skipping validation\", buf, 2u);
  }

  if (v6)
    v6[2](v6, 0, 0);
LABEL_34:

}

void __80__CDPDStateMachine__continueShouldPerformRepairWithOptionForceFetch_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  int v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "deviceViability");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "recordViability");

    if (v11 == 1)
    {
      objc_msgSend(v5, "deviceViability");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hasMachineId");

      if ((v13 & 1) != 0)
      {
        v14 = objc_msgSend(MEMORY[0x24BE1A4A0], "shouldValidatePasscodeGenerations");
        objc_msgSend(v5, "deviceViability");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "localSecretViability");

        _CDPLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (!v14 || v16 != 3)
        {
          if (v18)
          {
            LOWORD(v25) = 0;
            _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Local device record is viable. No need for repair.\", (uint8_t *)&v25, 2u);
          }

          v24 = *(_QWORD *)(a1 + 32);
          if (v24)
            (*(void (**)(uint64_t, _QWORD, _QWORD))(v24 + 16))(v24, 0, 0);
          goto LABEL_24;
        }
        if (v18)
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Passcode generation associated with the escrow record does not appear to match the local one.\", (uint8_t *)&v25, 2u);
        }

        v19 = *(_QWORD *)(a1 + 32);
        if (!v19)
          goto LABEL_24;
        v20 = (void *)MEMORY[0x24BDD1540];
        v21 = -5322;
      }
      else
      {
        _CDPLogSystem();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_20DB2C000, v23, OS_LOG_TYPE_DEFAULT, "\"Device does not have a machine ID.\", (uint8_t *)&v25, 2u);
        }

        v19 = *(_QWORD *)(a1 + 32);
        if (!v19)
          goto LABEL_24;
        v20 = (void *)MEMORY[0x24BDD1540];
        v21 = -5312;
      }
    }
    else
    {
      _CDPLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_DEFAULT, "\"Escrow record for current device is not viable\", (uint8_t *)&v25, 2u);
      }

      v19 = *(_QWORD *)(a1 + 32);
      if (!v19)
        goto LABEL_24;
      v20 = (void *)MEMORY[0x24BDD1540];
      v21 = -5305;
    }
    objc_msgSend(v20, "cdp_errorWithCode:", v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v19 + 16))(v19, 1, v9);
    goto LABEL_23;
  }
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v6;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Found error while attempting to generate escrow status report: %@\", (uint8_t *)&v25, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:underlyingError:", -5311, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);
LABEL_23:

  }
LABEL_24:

}

- (id)_makeEscrowRecordControllerWithCurrentContext
{
  return -[CDPDEscrowRecordController initWithContext:]([CDPDEscrowRecordController alloc], "initWithContext:", self->_context);
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

- (id)_predicateForRepair
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CDPDCircleControl peerID](self->_circleController, "peerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDD1758];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __39__CDPDStateMachine__predicateForRepair__block_invoke;
    v7[3] = &unk_24C81C058;
    v8 = v2;
    objc_msgSend(v4, "predicateWithBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __39__CDPDStateMachine__predicateForRepair__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_predicateForRecordUpgradeCheckIgnoringBottled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CDPDCircleControl peerID](self->_circleController, "peerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDD1758];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __66__CDPDStateMachine__predicateForRecordUpgradeCheckIgnoringBottled__block_invoke;
    v7[3] = &unk_24C81C058;
    v8 = v2;
    objc_msgSend(v4, "predicateWithBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __66__CDPDStateMachine__predicateForRecordUpgradeCheckIgnoringBottled__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "machineID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_predicateForRecordUpgradeCheck
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[CDPDCircleControl peerID](self->_circleController, "peerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDD1758];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__CDPDStateMachine__predicateForRecordUpgradeCheck__block_invoke;
    v7[3] = &unk_24C81C058;
    v8 = v2;
    objc_msgSend(v4, "predicateWithBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __51__CDPDStateMachine__predicateForRecordUpgradeCheck__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "machineID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "simplePublicKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_fetchUserInfo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"piggybackingApprovalEligible is not available in caches...fetching from server\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __34__CDPDStateMachine__fetchUserInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __34__CDPDStateMachine__fetchUserInfo__block_invoke_cold_1();

}

- (void)repairCloudDataProtectionStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];
  _QWORD aBlock[5];
  id v19;

  v4 = a3;
  -[CDPDStateMachine _updateSOSCompatibilityMode](self, "_updateSOSCompatibilityMode");
  -[CDPDStateMachine _fetchUserInfo](self, "_fetchUserInfo");
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDStateMachine repairCloudDataProtectionStateWithCompletion:].cold.1(self, v5);

  if (!-[CDPDStateMachine _isInSOSCircle](self, "_isInSOSCircle"))
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke;
    aBlock[3] = &unk_24C81C558;
    aBlock[4] = self;
    v6 = v4;
    v19 = v6;
    v7 = _Block_copy(aBlock);
    if (-[CDPDCircleControl circleStatus](self->_circleController, "circleStatus") == 1)
    {
      if (objc_msgSend(MEMORY[0x24BE1A4A0], "isAudioAccessory"))
      {
        _CDPLogSystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"[HomePod only] We are already in circle, ignoring repair request and calling completion(true, nil)\", v17, 2u);
        }

        if (v6)
          (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 1, 0);
        goto LABEL_24;
      }
LABEL_23:
      -[CDPDStateMachine _performSilentlyAuthenticatedRepair:](self, "_performSilentlyAuthenticatedRepair:", v7);
      goto LABEL_24;
    }
    -[CDPContext password](self->_context, "password");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "primaryAccountStashedPRK");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

LABEL_15:
        -[CDPDCircleControl circleProxy](self->_circleController, "circleProxy");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "registerCredentials");

        -[CDPDStateMachine _authenticatedRepairCloudDataProtectionStateWithCompletion:](self, "_authenticatedRepairCloudDataProtectionStateWithCompletion:", v7);
LABEL_24:

        goto LABEL_25;
      }
      v14 = -[CDPDStateMachine _eligibleToSkipAuth](self, "_eligibleToSkipAuth");

      if (v14)
        goto LABEL_15;
    }
    else if (-[CDPDStateMachine _eligibleToSkipAuth](self, "_eligibleToSkipAuth"))
    {
      goto LABEL_15;
    }
    -[CDPContext password](self->_context, "password");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {

    }
    else if (!-[CDPDStateMachine _eligibleForSilentAuthenticatedRepair](self, "_eligibleForSilentAuthenticatedRepair"))
    {
      -[CDPDStateMachine _performInteractivelyAuthenticatedRepair:](self, "_performInteractivelyAuthenticatedRepair:", v7);
      goto LABEL_24;
    }
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"Attempt silent authentication as we do not have stashed PRK and we do have password.\", v17, 2u);
    }

    goto LABEL_23;
  }
  (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
LABEL_25:

}

void __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "circleProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    objc_msgSend(v6, "reportSuccess");

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_2;
    v9[3] = &unk_24C81DAA0;
    v8 = *(void **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = 1;
    v10 = v5;
    objc_msgSend(v8, "_joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion:", v9);

  }
  else
  {
    objc_msgSend(v6, "reportFailure:", v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __65__CDPDStateMachine_repairCloudDataProtectionStateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (BOOL)_eligibleToSkipAuth
{
  void *v3;
  BOOL v4;

  -[CDPContext passwordEquivToken](self->_context, "passwordEquivToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[CDPDStateMachine _eligibleForSilentAuthenticatedRepair](self, "_eligibleForSilentAuthenticatedRepair");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_eligibleForSilentAuthenticatedRepair
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  _BOOL4 v7;
  int v8;
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = +[CDPDOctagonTrustProxyImpl octagonIsSOSFeatureEnabled](CDPDOctagonTrustProxyImpl, "octagonIsSOSFeatureEnabled");
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      -[CDPDStateMachine _eligibleForSilentAuthenticatedRepair].cold.1();

    v6 = -[CDPContext keychainSyncSystem](self->_context, "keychainSyncSystem");
    v7 = -[CDPDStateMachine _needsSOSRepair](self, "_needsSOSRepair");
    if (v6)
      v8 = 0;
    else
      v8 = !v7;
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v10[0] = 67109632;
      v10[1] = v6 == 0;
      v11 = 1024;
      v12 = v7;
      v13 = 1024;
      v14 = v8;
      _os_log_debug_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEBUG, "\"Determined silent auth eligibility (isOT:%i, needsSOSRepair:%i): %i\", (uint8_t *)v10, 0x14u);
    }
  }
  else
  {
    if (v5)
      -[CDPDStateMachine _eligibleForSilentAuthenticatedRepair].cold.2();
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)_needsSOSRepair
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[CDPContext isSOSCompatibilityOptInNeeded](self->_context, "isSOSCompatibilityOptInNeeded"))
    return 0;
  v3 = (void *)MEMORY[0x24BE1A488];
  -[CDPContext altDSID](self->_context, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "syncingStatusForAltDSID:", v4) != 1;

  return v5;
}

- (void)_performSilentlyAuthenticatedRepair:(id)a3
{
  id v4;
  NSObject *v5;
  CDPContext *context;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Starting silent authentication for repair\", buf, 2u);
  }

  context = self->_context;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__CDPDStateMachine__performSilentlyAuthenticatedRepair___block_invoke;
  v8[3] = &unk_24C81BFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  +[CDPAuthenticationHelper silentAuthenticationForContext:withCompletion:](CDPAuthenticationHelper, "silentAuthenticationForContext:withCompletion:", context, v8);

}

void __56__CDPDStateMachine__performSilentlyAuthenticatedRepair___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3F8]), "initWithAuthenticationResults:", v5);
    objc_msgSend(v7, "set_alwaysCreateEscrowRecord:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_alwaysCreateEscrowRecord"));
    objc_msgSend(v7, "setType:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "type"));
    objc_msgSend(v7, "setSosCompatibilityType:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sosCompatibilityType"));
    objc_msgSend(v7, "setKeychainSyncSystem:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "keychainSyncSystem"));
    objc_msgSend(v7, "setIsSOSCFUFlow:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isSOSCFUFlow"));
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = objc_msgSend(v7, "type");
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"_performSilentlyAuthenticatedRepair: set refreshedContext type to %ld\", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "password");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPassword:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cachedLocalSecret");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCachedLocalSecret:", v10);

    objc_msgSend(v7, "setCachedLocalSecretType:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cachedLocalSecretType"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sharingChannel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSharingChannel:", v11);

    objc_msgSend(*(id *)(a1 + 32), "_refreshAndAuthenticateWithContext:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_authenticatedRepairCloudDataProtectionStateWithCompletion:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __56__CDPDStateMachine__performSilentlyAuthenticatedRepair___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_performInteractivelyAuthenticatedRepair:", *(_QWORD *)(a1 + 40));
  }

}

- (void)_performInteractivelyAuthenticatedRepair:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  CDPStateUIProviderInternal *uiProvider;
  void *v8;
  _QWORD v9[5];
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (self->_uiProvider)
  {
    objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uiProvider = self->_uiProvider;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__CDPDStateMachine__performInteractivelyAuthenticatedRepair___block_invoke;
    v9[3] = &unk_24C81BFC8;
    v9[4] = self;
    v10 = v5;
    -[CDPStateUIProviderInternal cdpContext:promptForInteractiveAuthenticationWithCompletion:](uiProvider, "cdpContext:promptForInteractiveAuthenticationWithCompletion:", v6, v9);

  }
  else if (v4)
  {
    _CDPStateError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v8);

  }
}

void __61__CDPDStateMachine__performInteractivelyAuthenticatedRepair___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3F8]), "initWithAuthenticationResults:", v5);
    objc_msgSend(v7, "set_alwaysCreateEscrowRecord:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_alwaysCreateEscrowRecord"));
    objc_msgSend(v7, "setSosCompatibilityType:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sosCompatibilityType"));
    objc_msgSend(v7, "setKeychainSyncSystem:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "keychainSyncSystem"));
    objc_msgSend(v7, "setIsSOSCFUFlow:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isSOSCFUFlow"));
    objc_msgSend(v7, "setType:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "type"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cachedLocalSecret");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCachedLocalSecret:", v8);

    objc_msgSend(v7, "setCachedLocalSecretType:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cachedLocalSecretType"));
    objc_msgSend(*(id *)(a1 + 32), "_refreshAndAuthenticateWithContext:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_authenticatedRepairCloudDataProtectionStateWithCompletion:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __61__CDPDStateMachine__performInteractivelyAuthenticatedRepair___block_invoke_cold_1();

    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v6);
  }

}

- (void)_refreshAndAuthenticateWithContext:(id)a3
{
  id v5;
  NSObject *v6;
  CDPContext **p_context;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  CDPDPCSController *v13;
  CDPContext *context;
  id v15;
  CDPDPCSController *v16;
  CDPDPCSController *pcsController;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Refreshing with context\", (uint8_t *)&v19, 2u);
  }

  p_context = &self->_context;
  objc_storeStrong((id *)&self->_context, a3);
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[CDPContext type](*p_context, "type");
    -[CDPContext appleID](*p_context, "appleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext dsid](*p_context, "dsid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext altDSID](*p_context, "altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 134219522;
    v20 = v9;
    v21 = 2160;
    v22 = 1752392040;
    v23 = 2112;
    v24 = v10;
    v25 = 2160;
    v26 = 1752392040;
    v27 = 2112;
    v28 = v11;
    v29 = 2160;
    v30 = 1752392040;
    v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"_refreshAndAuthenticateWithContext: context type: %ld, appleID: %{mask.hash}@, dsid: %{mask.hash}@, adsid: %{mask.hash}@\", (uint8_t *)&v19, 0x48u);

  }
  -[CDPDStateMachine _initDependenciesWithContext:](self, "_initDependenciesWithContext:", v5);
  v13 = [CDPDPCSController alloc];
  context = self->_context;
  v15 = objc_alloc_init(MEMORY[0x24BE1A470]);
  v16 = -[CDPDPCSController initWithContext:pcsProxy:](v13, "initWithContext:pcsProxy:", context, v15);
  pcsController = self->_pcsController;
  self->_pcsController = v16;

  -[CDPDCircleControl circleProxy](self->_circleController, "circleProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerCredentials");

}

- (void)_authenticatedRepairCloudDataProtectionStateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__CDPDStateMachine__authenticatedRepairCloudDataProtectionStateWithCompletion___block_invoke;
  v6[3] = &unk_24C81D5D8;
  v7 = v4;
  v5 = v4;
  -[CDPDStateMachine handleCloudDataProtectionStateWithCompletion:](self, "handleCloudDataProtectionStateWithCompletion:", v6);

}

uint64_t __79__CDPDStateMachine__authenticatedRepairCloudDataProtectionStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  return result;
}

- (BOOL)shouldAllowCDPEnrollment
{
  return 1;
}

- (void)_preflightAccountStateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aa_primaryAppleAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "accountProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("personID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_6;
    objc_msgSend(v6, "dsid");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_6;
    v14 = (void *)v13;
    objc_msgSend(v6, "dsid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v12, "isEqualToString:", v16);

    if (v17)
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __65__CDPDStateMachine__preflightAccountStateWithContext_completion___block_invoke;
      v21[3] = &unk_24C81C580;
      v22 = v7;
      -[CDPDStateMachine _enableKVSForAccount:store:completion:](self, "_enableKVSForAccount:store:completion:", v10, v8, v21);
      v18 = v22;
    }
    else
    {
LABEL_6:
      _CDPLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CDPDStateMachine _preflightAccountStateWithContext:completion:].cold.2((uint64_t)v12, v6, v19);

      if (!v7)
        goto LABEL_15;
      _CDPStateError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v18);
    }

LABEL_15:
    goto LABEL_16;
  }
  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[CDPDStateMachine _preflightAccountStateWithContext:completion:].cold.1();

  if (v7)
  {
    _CDPStateError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);
    goto LABEL_15;
  }
LABEL_16:

}

void __65__CDPDStateMachine__preflightAccountStateWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(void);
  NSObject *v8;
  uint64_t v9;

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_8:
      v7();
    }
  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __65__CDPDStateMachine__preflightAccountStateWithContext_completion___block_invoke_cold_1();

    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v7 = *(void (**)(void))(v9 + 16);
      goto LABEL_8;
    }
  }

}

- (void)_enableKVSForAccount:(id)a3 store:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  NSObject *v10;
  void *v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  _BOOL4 v15;
  _QWORD v16[4];
  void (**v17)(id, uint64_t, _QWORD);
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CDPDStateMachine _enableKVSForAccount:store:completion:].cold.1();

  objc_msgSend(v7, "enabledDataclasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDB45D0];
  v13 = objc_msgSend(v11, "containsObject:", *MEMORY[0x24BDB45D0]);

  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) != 0)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"KVS is already enabled!\", buf, 2u);
    }

    if (v9)
      v9[2](v9, 1, 0);
  }
  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"Enabling KVS...\", buf, 2u);
    }

    objc_msgSend(v7, "setEnabled:forDataclass:", 1, v12);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __58__CDPDStateMachine__enableKVSForAccount_store_completion___block_invoke;
    v16[3] = &unk_24C81C580;
    v17 = v9;
    objc_msgSend(v8, "saveAccount:withCompletionHandler:", v7, v16);

  }
}

void __58__CDPDStateMachine__enableKVSForAccount_store_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v13 = a2;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Finished enabling KVS with success=%i error=%{public}@\", buf, 0x12u);
  }

  if ((a2 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    if (v5)
    {
      v10 = *MEMORY[0x24BDD1398];
      v11 = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    _CDPStateError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, a2, v7);

}

- (void)_confirmCDPEligibilityWithCompletion:(id)a3
{
  id v4;
  CDPDSecureBackupControl *secureBackupController;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (-[CDPDStateMachine shouldAllowCDPEnrollment](self, "shouldAllowCDPEnrollment"))
  {
    secureBackupController = self->_secureBackupController;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __57__CDPDStateMachine__confirmCDPEligibilityWithCompletion___block_invoke;
    v8[3] = &unk_24C81C580;
    v9 = v4;
    -[CDPDSecureBackupControl isEligibleForCDPWithCompletion:](secureBackupController, "isEligibleForCDPWithCompletion:", v8);

  }
  else
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Enabling iCDP on sign-in is disabled\", v7, 2u);
    }

    if (v4)
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

uint64_t __57__CDPDStateMachine__confirmCDPEligibilityWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_checkSecureBackupCachedSecretValue
{
  return objc_msgSend(MEMORY[0x24BE1A4A0], "useCDPContextSecretInsteadOfSBDSecretFeatureEnabled") ^ 1;
}

- (void)_recoverSecureBackupWithCircleJoinResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[CDPDStateMachine context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLocalSecretCached");

  if (v9)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Attempting to recover backup using the cached local secret...\", buf, 2u);
    }

    -[CDPContext cachedLocalSecret](self->_context, "cachedLocalSecret");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CDPContext cachedLocalSecretType](self->_context, "cachedLocalSecretType");
    -[CDPDStateMachine context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_useSecureBackupCachedPassphrase");
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __72__CDPDStateMachine__recoverSecureBackupWithCircleJoinResult_completion___block_invoke;
    v20[3] = &unk_24C81D5D8;
    v21 = v7;
    -[CDPDStateMachine _attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:](self, "_attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:", v11, v12, v14, v6, v20);

    v15 = v21;
    goto LABEL_11;
  }
  if (-[CDPContext keychainSyncSystem](self->_context, "keychainSyncSystem") == 1)
  {
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"Attempting to recover backup without using local secret for SOS Compatibility Mode\", buf, 2u);
    }

    -[CDPDStateMachine _attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:localSecretType:useSecureBackupCachedSecret:circleJoinResult:completion:](self, "_attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:localSecretType:useSecureBackupCachedSecret:circleJoinResult:completion:", 0, 0, 0, v6, v7);
  }
  else
  {
    if (self->_uiProvider)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __72__CDPDStateMachine__recoverSecureBackupWithCircleJoinResult_completion___block_invoke_121;
      v18[3] = &unk_24C81D5D8;
      v19 = v7;
      -[CDPDStateMachine _handleInteractiveRecoveryFlowWithCircleJoinResult:completion:](self, "_handleInteractiveRecoveryFlowWithCircleJoinResult:completion:", v6, v18);
      v15 = v19;
LABEL_11:

      goto LABEL_12;
    }
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CDPDStateMachine _recoverSecureBackupWithCircleJoinResult:completion:].cold.1();

    if (v7)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
  }
LABEL_12:

}

void __72__CDPDStateMachine__recoverSecureBackupWithCircleJoinResult_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = a2;
    v11 = 1024;
    v12 = a3;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Finished recovery attempt using the cached local secret with didRecover=%i didRequestReset=%i error=%@\", (uint8_t *)v10, 0x18u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v9 + 16))(v9, a2, a3, v7);

}

void __72__CDPDStateMachine__recoverSecureBackupWithCircleJoinResult_completion___block_invoke_121(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = a2;
    v11 = 1024;
    v12 = a3;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Finished recovery attempt using the secret provided by user. didRecover=%i didRequestReset=%i error=%@\", (uint8_t *)v10, 0x18u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v9 + 16))(v9, a2, a3, v7);

}

- (void)_handleInteractiveRecoveryFlowWithCircleJoinResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[8];
  _QWORD aBlock[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasLocalSecret");

  if (v9)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke;
    aBlock[3] = &unk_24C81DAC8;
    aBlock[4] = self;
    v20 = v6;
    v21 = v7;
    v10 = v7;
    v11 = _Block_copy(aBlock);
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"Prompting for local secret before recovering backup\", buf, 2u);
    }

    -[CDPStateUIProviderInternal cdpContext:promptForLocalSecretWithCompletion:](self->_uiProvider, "cdpContext:promptForLocalSecretWithCompletion:", self->_context, v11);
    v13 = v20;
  }
  else
  {
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"Proceeding with backup recovery attempt without a local device secret\", buf, 2u);
    }

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_124;
    v16[3] = &unk_24C81D5D8;
    v17 = v7;
    v15 = v7;
    -[CDPDStateMachine _attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:](self, "_attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:", 0, 0, 0, v6, v16);
    v13 = v17;
  }

}

void __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Proceeding with backup recovery attempt now that the local secret is known...\", buf, 2u);
    }

    objc_msgSend(v5, "validatedSecret");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setCachedLocalSecret:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setCachedLocalSecretType:", objc_msgSend(v5, "secretType"));
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v5, "validatedSecret");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "secretType");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_122;
    v15[3] = &unk_24C81D5D8;
    v13 = *(_QWORD *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v10, "_attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:", v11, v12, 0, v13, v15);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_cold_1();

    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v14 + 16))(v14, 0, 0, v6);
  }

}

void __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_122(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;

  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_122_cold_1(a2, (uint64_t)v7, v8);

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v9 + 16))(v9, a2, a3, v7);

}

void __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_124(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Finished backup recovery attempt without local secret with didRecover=%i error=%@\", (uint8_t *)v10, 0x12u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v9 + 16))(v9, a2, a3, v7);

}

- (void)_attemptBackupRecoveryWithLocalSecret:(id)a3 type:(unint64_t)a4 useSecureBackupCachedSecret:(BOOL)a5 circleJoinResult:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  _BOOL4 v26;
  const __CFString *v27;
  CDPDSecureBackupContext *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  void *v37;
  CDPDSecureBackupControl *secureBackupController;
  id v39;
  CDPDSecureBackupContext *v40;
  id v41;
  id v42;
  _QWORD v43[5];
  CDPDSecureBackupContext *v44;
  id v45;
  id v46;
  id v47;
  _QWORD aBlock[5];
  id v49;
  id v50;
  id v51;
  unint64_t v52;
  BOOL v53;
  id v54;
  uint8_t buf[4];
  const __CFString *v56;
  uint64_t v57;

  v9 = a5;
  v57 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v42 = a7;
  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[CDPDStateMachine _attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:].cold.3();

  -[CDPDStateMachine secureBackupController](self, "secureBackupController");
  v15 = objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v22 = 0;
    v41 = 0;
LABEL_13:

    goto LABEL_14;
  }
  -[CDPDStateMachine secureBackupController](self, "secureBackupController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  v17 = objc_msgSend(v16, "supportsRecoveryKeyWithError:", &v54);
  v41 = v54;

  if (v17)
  {
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[CDPDStateMachine _attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:].cold.2();

    +[CDPRecoveryKeyCache sharedInstance](CDPRecoveryKeyCache, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDStateMachine context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "altDSID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fetchRecoveryKeyFromCacheForAltDSID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  if (v41)
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CDPDStateMachine _attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:].cold.1();
    goto LABEL_13;
  }
  v41 = 0;
LABEL_14:
  if (v12)
    v23 = 1;
  else
    v23 = v9;
  if (v22)
    v24 = 1;
  else
    v24 = v23;
  _CDPLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    if (v26)
    {
      v27 = CFSTR("recovery key...");
      if (!v22)
        v27 = CFSTR("local secret...");
      *(_DWORD *)buf = 138412290;
      v56 = v27;
      _os_log_impl(&dword_20DB2C000, v25, OS_LOG_TYPE_DEFAULT, "\"Attempting SILENT recovery with the %@\", buf, 0xCu);
    }

    v28 = objc_alloc_init(CDPDSecureBackupContext);
    -[CDPDSecureBackupContext setLocalSecret:](v28, "setLocalSecret:", v12);
    -[CDPDSecureBackupContext setRecoverySecret:](v28, "setRecoverySecret:", v12);
    -[CDPDSecureBackupContext setUsePreviouslyCachedSecret:](v28, "setUsePreviouslyCachedSecret:", v9);
    -[CDPDSecureBackupContext setSilentRecovery:](v28, "setSilentRecovery:", 1);
    -[CDPDSecureBackupContext setLocalSecretType:](v28, "setLocalSecretType:", a4);
    -[CDPDSecureBackupContext setCircleJoinResult:](v28, "setCircleJoinResult:", v13);
    -[CDPDSecureBackupContext recoveryKey](v28, "recoveryKey");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v29)
      v31 = (void *)v29;
    else
      v31 = v22;
    -[CDPDSecureBackupContext setRecoveryKey:](v28, "setRecoveryKey:", v31, v41);

    if (objc_msgSend(MEMORY[0x24BE1A4A0], "isSilentBurnInMiniBuddyEnabled"))
    {
      -[CDPDStateMachine context](self, "context");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "type") == 10;

      if (v33)
      {
        _CDPLogSystem();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DB2C000, v34, OS_LOG_TYPE_DEFAULT, "\"Adding non-viable throttle header in silent burn in mini-buddy flow\", buf, 2u);
        }

        -[CDPDSecureBackupContext setNonViableRequiresRepair:](v28, "setNonViableRequiresRepair:", 1);
      }
    }
    -[CDPDCircleControl prepareCircleStateForRecovery](self->_circleController, "prepareCircleStateForRecovery");
    v35 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke;
    aBlock[3] = &unk_24C81DAF0;
    aBlock[4] = self;
    v49 = v12;
    v52 = a4;
    v53 = v9;
    v50 = v13;
    v36 = v42;
    v51 = v36;
    v37 = _Block_copy(aBlock);
    objc_initWeak((id *)buf, self);
    secureBackupController = self->_secureBackupController;
    v43[0] = v35;
    v43[1] = 3221225472;
    v43[2] = __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_132;
    v43[3] = &unk_24C81DB18;
    objc_copyWeak(&v47, (id *)buf);
    v39 = v37;
    v45 = v39;
    v43[4] = self;
    v40 = v28;
    v44 = v40;
    v46 = v36;
    -[CDPDSecureBackupControl performEscrowRecoveryWithRecoveryContext:completion:](secureBackupController, "performEscrowRecoveryWithRecoveryContext:completion:", v40, v43);

    objc_destroyWeak(&v47);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v25, OS_LOG_TYPE_DEFAULT, "\"Local secret is not present, proceeding to recovery by prompting for remote secret\", buf, 2u);
    }

    -[CDPDStateMachine _attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:localSecretType:useSecureBackupCachedSecret:circleJoinResult:completion:](self, "_attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:localSecretType:useSecureBackupCachedSecret:circleJoinResult:completion:", 0, 0, 0, v13, v42);
  }

}

void __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Silent recovery failed, attempting to recover by prompting for remote secret. error=%@\", (uint8_t *)&v5, 0xCu);
  }

  if (objc_msgSend(v3, "isMissingCachedPassphraseError"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setCachedPassphraseMissing:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:localSecretType:useSecureBackupCachedSecret:circleJoinResult:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      objc_msgSend(v5, "recoveredClique");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "circleProxy");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "recoveredClique");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "didJoinCircleAfterRecovery:", v10);

        _CDPLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Attempting to enable secure backup after successful SILENT recovery\", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "setNonViableRequiresRepair:", 0);
        v12 = *(_QWORD *)(a1 + 40);
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_133;
        v18[3] = &unk_24C81C580;
        v19 = *(id *)(a1 + 56);
        objc_msgSend(WeakRetained, "_postRecoveryEnableSecureBackupWithContext:completion:", v12, v18);
        v13 = v19;
      }
      else
      {
        _CDPLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"Attempting joinAfterRestore SILENT recovery for SOS only flow\", buf, 2u);
        }

        objc_msgSend(WeakRetained, "circleController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_134;
        v16[3] = &unk_24C81C580;
        v17 = *(id *)(a1 + 56);
        objc_msgSend(v15, "joinCircleAfterRecoveryWithCompletion:", v16);

        v13 = v17;
      }

    }
  }

}

void __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_133(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Finished enabling secure backup after successful SILENT recovery with didEnable=%i error=%@\", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v7 + 16))(v7, a2, 0, v5);

}

void __119__CDPDStateMachine__attemptBackupRecoveryWithLocalSecret_type_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_134(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Finished joining circle with didJoin=%i error=%@\", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v7 + 16))(v7, a2, 0, v5);

}

- (void)_attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:(id)a3 localSecretType:(unint64_t)a4 useSecureBackupCachedSecret:(BOOL)a5 circleJoinResult:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  CDPDStateMachine *v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  BOOL v30;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  _CDPLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[CDPDStateMachine _attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:localSecretType:useSecureBackupCachedSecret:circleJoinResult:completion:].cold.1();

  v16 = objc_alloc_init(MEMORY[0x24BE1A480]);
  -[CDPDStateMachine _enableCustodianRecoveryIfAvailableForContext:](self, "_enableCustodianRecoveryIfAvailableForContext:", self->_context);
  objc_msgSend(v16, "setContext:", self->_context);
  objc_msgSend(v16, "setHasPeersForRemoteApproval:", objc_msgSend(v13, "hasPeersForRemoteApproval"));
  objc_msgSend(v16, "setIsWalrusEnabled:", -[CDPContext walrusStatus](self->_context, "walrusStatus") == 1);
  -[CDPDStateMachine context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDStateMachine _recoveryFlowControllerForKeychainSyncSystem:recoveryContext:](self, "_recoveryFlowControllerForKeychainSyncSystem:recoveryContext:", objc_msgSend(v17, "keychainSyncSystem"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __156__CDPDStateMachine__attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret_localSecretType_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke;
  v23[3] = &unk_24C81DB40;
  v24 = v12;
  v25 = self;
  v30 = a5;
  v28 = v14;
  v29 = a4;
  v26 = v13;
  v27 = v16;
  v19 = v16;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  objc_msgSend(v18, "beginRecovery:", v23);

}

void __156__CDPDStateMachine__attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret_localSecretType_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  CDPDSecureBackupContext *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void (*v13)(void);
  NSObject *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CDPEscapeOffersLedger *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "validSecret");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || objc_msgSend(v5, "secretType") == 4 || objc_msgSend(v5, "secretType") == 6)
  {

LABEL_5:
    if (*(_QWORD *)(a1 + 32)
      || objc_msgSend(*(id *)(a1 + 40), "_checkSecureBackupCachedSecretValue") && *(_BYTE *)(a1 + 80))
    {
      v8 = objc_alloc_init(CDPDSecureBackupContext);
      -[CDPDSecureBackupContext setLocalSecretType:](v8, "setLocalSecretType:", *(_QWORD *)(a1 + 72));
      -[CDPDSecureBackupContext setLocalSecret:](v8, "setLocalSecret:", *(_QWORD *)(a1 + 32));
      -[CDPDSecureBackupContext setUsePreviouslyCachedSecret:](v8, "setUsePreviouslyCachedSecret:", *(unsigned __int8 *)(a1 + 80));
      -[CDPDSecureBackupContext setCircleJoinResult:](v8, "setCircleJoinResult:", *(_QWORD *)(a1 + 48));
      _CDPLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"Attempting to enable secure backup after successful INTERACTIVE recovery with multiple-ICSC already in use\", buf, 2u);
      }

      v10 = *(void **)(a1 + 40);
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __156__CDPDStateMachine__attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret_localSecretType_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_137;
      v30[3] = &unk_24C81C580;
      v31 = *(id *)(a1 + 64);
      objc_msgSend(v10, "_postRecoveryEnableSecureBackupWithContext:completion:", v8, v30);

    }
    else
    {
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Skipping enable of SecureBackup after successful INTERACTIVE recovery due to no local secret being present\", buf, 2u);
      }

      v12 = *(_QWORD *)(a1 + 64);
      if (v12)
      {
        v13 = *(void (**)(void))(v12 + 16);
LABEL_15:
        v13();
        goto LABEL_16;
      }
    }
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "secretType") == 7)
    goto LABEL_5;
  if (objc_msgSend(v5, "userDidCancel"))
  {
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"User cancelled remote device secret entry\", buf, 2u);
    }
LABEL_30:

    v29 = *(_QWORD *)(a1 + 64);
    if (!v29)
      goto LABEL_16;
    v13 = *(void (**)(void))(v29 + 16);
    goto LABEL_15;
  }
  v15 = objc_msgSend(v5, "userDidReset");
  _CDPLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v14 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __156__CDPDStateMachine__attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret_localSecretType_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_cold_1();
    goto LABEL_30;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"User requested reset of their CDP state!\", buf, 2u);
  }

  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(v5, "cachedSecretForReenrollment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v5, "cachedSecretForReenrollment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "validatedSecret");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setCachedLocalSecret:", v19);

      objc_msgSend(v5, "cachedSecretForReenrollment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setCachedLocalSecretType:", objc_msgSend(v20, "secretType"));

    }
    v21 = [CDPEscapeOffersLedger alloc];
    v22 = objc_msgSend(v5, "requiredEscapeOffers");
    v23 = *(_QWORD *)(a1 + 56);
    v24 = objc_msgSend(MEMORY[0x24BE1A448], "hasLocalSecret");
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[CDPEscapeOffersLedger initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:](v21, "initWithExpectedEscapeOffers:recoveryFlowContext:deviceHasPasscode:probationChecker:deviceIsVM:", v22, v23, v24, v25, objc_msgSend(MEMORY[0x24BE1A4A0], "isVirtualMachine"));
    v27 = *(_QWORD *)(a1 + 40);
    v28 = *(void **)(v27 + 80);
    *(_QWORD *)(v27 + 80) = v26;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "insert:", objc_msgSend(v5, "escapeOffersPresentedMask"));
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_15;
  }
LABEL_16:

}

void __156__CDPDStateMachine__attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret_localSecretType_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_137(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Finished enabling secure backup after successful INTERACTIVE recovery with didEnable=%i error=%@\", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v7 + 16))(v7, a2, 0, v5);

}

- (id)_recoveryFlowControllerForKeychainSyncSystem:(int64_t)a3 recoveryContext:(id)a4
{
  __objc2_class *v6;
  id v7;
  id v8;
  CDPStateUIProviderInternal *uiProvider;
  CDPDSecureBackupControl *secureBackupController;
  void *v11;
  void *v12;

  if (a3 == 1)
    v6 = CDPDSOSRecoveryValidatedJoinFlowController;
  else
    v6 = CDPDRecoveryValidatedJoinFlowController;
  v7 = a4;
  v8 = [v6 alloc];
  uiProvider = self->_uiProvider;
  secureBackupController = self->_secureBackupController;
  -[CDPDStateMachine circleController](self, "circleController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithContext:uiProvider:secureBackupController:circleController:", v7, uiProvider, secureBackupController, v11);

  return v12;
}

- (void)_enableCustodianRecoveryIfAvailableForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authKitAccountWithAltDSID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v4, "custodianEnabledForAccount:", v6);
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CDPDStateMachine _enableCustodianRecoveryIfAvailableForContext:].cold.1(v7, v8);

    v9 = v3;
    v10 = v7;
  }
  else
  {
    v9 = v3;
    v10 = 0;
  }
  objc_msgSend(v9, "set_supportsCustodianRecovery:", v10);

}

- (void)_postRecoveryEnableSecureBackupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  CDPDSecureBackupEnableCapable *secureBackupEnableController;
  _QWORD v16[5];
  void (**v17)(id, uint64_t, _QWORD);
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  CDPDStateMachine *v23;
  id v24;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDStateMachine _postRecoveryEnableSecureBackupWithContext:completion:].cold.3();

  if (self->_secureBackupEnableController)
  {
    objc_msgSend(v6, "circleJoinResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "hasPeersWithCDPBackupRecords"))
    {
      v10 = -[CDPContext disableAsyncModeRequested](self->_context, "disableAsyncModeRequested");

      if (!v10)
      {
        -[CDPContext setWillAttemptAsyncSecureBackupEnablement:](self->_context, "setWillAttemptAsyncSecureBackupEnablement:", 1);
        _CDPLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[CDPDStateMachine _postRecoveryEnableSecureBackupWithContext:completion:].cold.2();

        v12 = (void *)os_transaction_create();
        v18 = MEMORY[0x24BDAC760];
        v19 = 3221225472;
        v20 = __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke;
        v21 = &unk_24C81DB68;
        v22 = v6;
        v23 = self;
        v24 = v12;
        v13 = v12;
        cdp_dispatch_async_with_qos();
        if (v7)
          v7[2](v7, 1, 0);

        goto LABEL_13;
      }
    }
    else
    {

    }
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[CDPDStateMachine _postRecoveryEnableSecureBackupWithContext:completion:].cold.1();

    secureBackupEnableController = self->_secureBackupEnableController;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke_143;
    v16[3] = &unk_24C81C558;
    v16[4] = self;
    v17 = v7;
    -[CDPDSecureBackupEnableCapable upgradeICSCRecordsThenEnableSecureBackupWithContext:completion:](secureBackupEnableController, "upgradeICSCRecordsThenEnableSecureBackupWithContext:completion:", v6, v16);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5004);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v13);
LABEL_13:

  }
}

void __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v2, OS_LOG_TYPE_DEFAULT, "\"We don't want to back up the recovery key after silently recovering with the recovery key. Removing from backup context\", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setRecoveryKey:", 0);
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v3 + 48);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke_142;
  v6[3] = &unk_24C81D628;
  v6[4] = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v5, "checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:completion:", v4, v6);

}

void __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke_142(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[8];
  uint64_t v9;
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Finished asynchronous enabling Secure Backup\", buf, 2u);
  }

  if (objc_msgSend(v4, "cdp_isCDPErrorWithCode:", -5501))
  {
    objc_msgSend(*(id *)(a1 + 32), "_postFollowUpForSecureBackupCacheInvalidationError");
  }
  else if (v4)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke_142_cold_1();

  }
  v9 = 0;
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "deferSOSFromSignIn")
    && SOSCCFetchCompatibilityMode())
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Skipping uncaching, letting async'd SOS state machine do the job\", v8, 2u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "unlock");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "secureBackupProxy");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject uncacheAllSecrets](v7, "uncacheAllSecrets");
  }

}

void __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke_143(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "secureBackupProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uncacheAllSecrets");

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "unlock");

}

- (void)_postFollowUpForSecureBackupCacheInvalidationError
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Secure backup thinks there is no cached passphrase, but there is a local secret. Due to the asynchronous nature of this code path, we can't prompt for the passcode and must instead post a CFU.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_enableSecureBackupWithCircleJoinResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  CDPDSecureBackupContext *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  CDPDSecureBackupEnableCapable *secureBackupEnableController;
  CDPDSecureBackupContext *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  _QWORD aBlock[4];
  CDPDSecureBackupContext *v25;
  CDPDStateMachine *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  _QWORD v28[5];
  CDPDSecureBackupContext *v29;
  uint8_t buf[8];
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  CDPDStateMachine *v35;
  CDPDSecureBackupContext *v36;
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (self->_secureBackupEnableController)
  {
    v9 = objc_alloc_init(CDPDSecureBackupContext);
    -[CDPContext cachedLocalSecret](self->_context, "cachedLocalSecret");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDSecureBackupContext setLocalSecret:](v9, "setLocalSecret:", v10);

    -[CDPDSecureBackupContext setLocalSecretType:](v9, "setLocalSecretType:", -[CDPContext cachedLocalSecretType](self->_context, "cachedLocalSecretType"));
    -[CDPDSecureBackupContext setUsePreviouslyCachedSecret:](v9, "setUsePreviouslyCachedSecret:", -[CDPContext _useSecureBackupCachedPassphrase](self->_context, "_useSecureBackupCachedPassphrase"));
    -[CDPDSecureBackupContext setCircleJoinResult:](v9, "setCircleJoinResult:", v6);
    -[CDPContext telemetryDeviceSessionID](self->_context, "telemetryDeviceSessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDSecureBackupContext setTelemetryDeviceSessionID:](v9, "setTelemetryDeviceSessionID:", v11);

    -[CDPContext telemetryFlowID](self->_context, "telemetryFlowID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDSecureBackupContext setTelemetryFlowID:](v9, "setTelemetryFlowID:", v12);

    if (objc_msgSend(v6, "hasPeersWithCDPBackupRecords")
      && !-[CDPContext disableAsyncModeRequested](self->_context, "disableAsyncModeRequested"))
    {
      -[CDPContext setWillAttemptAsyncSecureBackupEnablement:](self->_context, "setWillAttemptAsyncSecureBackupEnablement:", 1);
      v21 = (void *)os_transaction_create();
      v31 = MEMORY[0x24BDAC760];
      v32 = 3221225472;
      v33 = __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke;
      v34 = &unk_24C81DB68;
      v35 = self;
      v36 = v9;
      v37 = v21;
      v22 = v21;
      cdp_dispatch_async_with_qos();
      if (v8)
        v8[2](v8, 1, 0);

      goto LABEL_18;
    }
    -[CDPDStateMachine context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isLocalSecretCached");

    if (v14)
    {
      _CDPLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v15, OS_LOG_TYPE_DEFAULT, "\"Attempting to enable secure backup using the cached secret\", buf, 2u);
      }

      secureBackupEnableController = self->_secureBackupEnableController;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_145;
      v28[3] = &unk_24C81C558;
      v28[4] = self;
      v29 = v8;
      -[CDPDSecureBackupEnableCapable upgradeICSCRecordsThenEnableSecureBackupWithContext:completion:](secureBackupEnableController, "upgradeICSCRecordsThenEnableSecureBackupWithContext:completion:", v9, v28);
      v17 = v29;
    }
    else
    {
      if (!self->_uiProvider)
      {
        _CDPLogSystem();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[CDPDStateMachine _enableSecureBackupWithCircleJoinResult:completion:].cold.1();

        if (v8)
          v8[2](v8, 0, 0);
        goto LABEL_18;
      }
      -[CDPDSecureBackupControl secureBackupProxy](self->_secureBackupController, "secureBackupProxy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uncacheAllSecrets");

      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_146;
      aBlock[3] = &unk_24C81DAC8;
      v25 = v9;
      v26 = self;
      v27 = v8;
      v19 = _Block_copy(aBlock);
      _CDPLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v20, OS_LOG_TYPE_DEFAULT, "\"Asking the UI provider to prompt for the local device secret\", buf, 2u);
      }

      -[CDPStateUIProviderInternal cdpContext:promptForLocalSecretWithCompletion:](self->_uiProvider, "cdpContext:promptForLocalSecretWithCompletion:", self->_context, v19);
      v17 = v25;
    }

LABEL_18:
    goto LABEL_19;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5004);
    v9 = (CDPDSecureBackupContext *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, CDPDSecureBackupContext *))v8)[2](v8, 0, v9);
    goto LABEL_18;
  }
LABEL_19:

}

void __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_2;
  v4[3] = &unk_24C81D628;
  v4[4] = v1;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "enableSecureBackupWithContext:completion:", v2, v4);

}

uint64_t __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DB2C000, v2, OS_LOG_TYPE_DEFAULT, "\"Finished asynchronous enabling Secure Backup\", v5, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "secureBackupProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uncacheAllSecrets");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "unlock");
}

void __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_145(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "secureBackupProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uncacheAllSecrets");

  }
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Finished enabling secure backup using the cached secret with didEnable=%i error=%@\", (uint8_t *)v9, 0x12u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "unlock");

}

void __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLocalSecretType:", objc_msgSend(v5, "secretType"));
    objc_msgSend(v5, "validatedSecret");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLocalSecret:", v8);

    objc_msgSend(*(id *)(a1 + 32), "setUsePreviouslyCachedSecret:", 0);
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"Got a valid local secret, attempting to enable secure backup\", buf, 2u);
    }

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_147;
    v16[3] = &unk_24C81C580;
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v11, "upgradeICSCRecordsThenEnableSecureBackupWithContext:completion:", v10, v16);

  }
  else
  {
    v12 = objc_msgSend(v6, "code");
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 == -5307)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"User cancelled local device secret entry\", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_146_cold_1();
    }

    v15 = *(_QWORD *)(a1 + 48);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v7);
  }

}

uint64_t __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_147(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_isInSOSCircle
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL result;

  result = 0;
  if (-[CDPContext keychainSyncSystem](self->_context, "keychainSyncSystem") == 1)
  {
    v3 = (void *)MEMORY[0x24BE1A488];
    -[CDPContext altDSID](self->_context, "altDSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "syncingStatusForAltDSID:", v4);

    if (v5)
    {
      if (v5 == 1
        || (-[CDPContext isSOSCompatibilityOptInNeeded](self->_context, "isSOSCompatibilityOptInNeeded") & 1) == 0)
      {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)_isEligibleForSOSJoin
{
  int v3;
  _BOOL4 v4;
  BOOL v5;

  v3 = objc_msgSend(MEMORY[0x24BE1A4A0], "deferSOSFromSignIn");
  v4 = +[CDPDOctagonTrustProxyImpl octagonIsSOSFeatureEnabled](CDPDOctagonTrustProxyImpl, "octagonIsSOSFeatureEnabled");
  if (v3)
    v5 = !v4;
  else
    v5 = 1;
  return !v5
      && (-[CDPContext sosCompatibilityType](self->_context, "sosCompatibilityType") & 1) != 0
      && -[CDPContext keychainSyncSystem](self->_context, "keychainSyncSystem") == 0;
}

- (void)_joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired
{
  void *v3;
  CDPDStateMachine *v4;
  void *v5;
  NSObject *v6;
  id v7;
  CDPDStateMachine *v8;
  _QWORD block[4];
  CDPDStateMachine *v10;
  CDPDStateMachine *v11;
  id v12;

  if (-[CDPDStateMachine _isEligibleForSOSJoin](self, "_isEligibleForSOSJoin"))
  {
    if (objc_msgSend(MEMORY[0x24BE1A3F8], "isSubsetOfContextTypeSignIn:", -[CDPContext type](self->_context, "type")))
    {
      v3 = (void *)-[CDPContext copy](self->_context, "copy");
      objc_msgSend(v3, "setKeychainSyncSystem:", 1);
      v4 = -[CDPDStateMachine initWithContext:uiProvider:]([CDPDStateMachine alloc], "initWithContext:uiProvider:", v3, 0);
      v5 = (void *)os_transaction_create();
      dispatch_get_global_queue(0, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke;
      block[3] = &unk_24C81DB68;
      v10 = v4;
      v11 = self;
      v12 = v5;
      v7 = v5;
      v8 = v4;
      dispatch_async(v6, block);

    }
  }
}

void __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2;
  v6[3] = &unk_24C81DB90;
  v3 = v2;
  v4 = a1[5];
  v5 = (void *)a1[6];
  v7 = v3;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "handleCloudDataProtectionStateWithCompletion:", v6);

}

void __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v25 = a2;
    v26 = 1024;
    v27 = a3;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Finished SOS join with: shouldCompleteSOSSignIn = %d, sosEnabled = %d, sosError = %@\", buf, 0x18u);
  }

  objc_msgSend(MEMORY[0x24BE1A428], "contextForSOSCompatibilityMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAltDSID:", v11);

  v12 = objc_alloc_init(MEMORY[0x24BE1A430]);
  if (v7 || (a3 & 1) == 0)
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_3();

    objc_msgSend(*(id *)(a1 + 32), "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "telemetryFlowID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTelemetryFlowID:", v17);

    objc_msgSend(*(id *)(a1 + 32), "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "telemetryDeviceSessionID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTelemetryDeviceSessionID:", v19);

    v23 = 0;
    objc_msgSend(v12, "postFollowUpWithContext:error:", v9, &v23);
    v13 = v23;
    if (v13)
    {
      _CDPLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_2();
      goto LABEL_13;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_enableSOSViews");
    v22 = 0;
    objc_msgSend(v12, "clearFollowUpWithContext:error:", v9, &v22);
    v13 = v22;
    if (v13)
    {
      _CDPLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_1();
LABEL_13:

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "secureBackupController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "secureBackupProxy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "uncacheAllSecrets");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "unlock");
}

- (void)_joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  uint8_t v6[16];
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[CDPDStateMachine _isEligibleForSOSJoin](self, "_isEligibleForSOSJoin"))
  {
    -[CDPContext setKeychainSyncSystem:](self->_context, "setKeychainSyncSystem:", 1);
    -[CDPDStateMachine _initDependenciesWithContext:](self, "_initDependenciesWithContext:", self->_context);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __82__CDPDStateMachine__joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion___block_invoke;
    v7[3] = &unk_24C81C558;
    v7[4] = self;
    v8 = v4;
    -[CDPDStateMachine repairCloudDataProtectionStateWithCompletion:](self, "repairCloudDataProtectionStateWithCompletion:", v7);

  }
  else
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"repairCloudDataProtection: Not running SOS state machine\", v6, 2u);
    }

    if (v4)
      v4[2](v4);
  }

}

void __82__CDPDStateMachine__joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v20 = a2;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"repairCloudDataProtection: Finished SOS repair with: didRepairSOS = %d, sosRepairError = %@\", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BE1A428], "contextForSOSCompatibilityMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAltDSID:", v8);

  v9 = objc_alloc_init(MEMORY[0x24BE1A430]);
  if (!v5 && (a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_enableSOSViews");
    v17 = 0;
    objc_msgSend(v9, "clearFollowUpWithContext:error:", v7, &v17);
    v10 = v17;
    if (!v10)
      goto LABEL_14;
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_1();
    goto LABEL_13;
  }
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __82__CDPDStateMachine__joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion___block_invoke_cold_3();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "telemetryFlowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTelemetryFlowID:", v13);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "telemetryDeviceSessionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTelemetryDeviceSessionID:", v14);

  v18 = 0;
  objc_msgSend(v9, "postFollowUpWithContext:error:", v7, &v18);
  v10 = v18;
  if (v10)
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_2();
LABEL_13:

  }
LABEL_14:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "secureBackupProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uncacheAllSecrets");

  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(void))(v16 + 16))();

}

- (void)_enableSOSViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  NSObject *v18;
  uint32_t v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDE84B0]);
  -[CDPDStateMachine context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cliqueConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithContextData:", v5);

  v22 = 0;
  LODWORD(v5) = objc_msgSend(v6, "fetchUserControllableViewsSyncingEnabled:", &v22);
  v7 = v22;
  if ((_DWORD)v5)
  {
    -[CDPDCircleControl circleProxy](self->_circleController, "circleProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v9 = objc_msgSend(v8, "setUserControllableViewsSyncStatus:error:", 1, &v21);
    v10 = v21;

    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        v13 = "\"repairCloudDataProtection: Successfully enabled SOS views\";
LABEL_15:
        v18 = v11;
        v19 = 2;
LABEL_19:
        _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, v13, buf, v19);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    if (!v12)
      goto LABEL_20;
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    v13 = "\"repairCloudDataProtection: Failed to enable SOS views: %@\";
    goto LABEL_18;
  }
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"repairCloudDataProtection: Octagon reports user controllable views are not enabled! disabling for SOS\", buf, 2u);
    }

    -[CDPDCircleControl circleProxy](self->_circleController, "circleProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v16 = objc_msgSend(v15, "setUserControllableViewsSyncStatus:error:", 0, &v20);
    v10 = v20;

    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v17)
      {
        *(_WORD *)buf = 0;
        v13 = "\"repairCloudDataProtection: Successfully disabled SOS views\";
        goto LABEL_15;
      }
LABEL_20:

      goto LABEL_21;
    }
    if (!v17)
      goto LABEL_20;
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    v13 = "\"repairCloudDataProtection: Failed to disable SOS views: %@\";
LABEL_18:
    v18 = v11;
    v19 = 12;
    goto LABEL_19;
  }
  if (v14)
  {
    *(_DWORD *)buf = 138412290;
    v24 = v7;
    _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"repairCloudDataProtection: Failed to fetch user controllable views from clique, error: %@\", buf, 0xCu);
  }
LABEL_21:

}

- (void)_resetAccountCDPStateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  CDPDSecureBackupDisableCapable *secureBackupDisableController;
  _QWORD v12[5];
  void (**v13)(id, _QWORD, void *);
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD, void *))a3;
  if ((-[CDPContext _forceReset](self->_context, "_forceReset") & 1) == 0
    && (objc_msgSend(MEMORY[0x24BE1A3F8], "isSubsetOfContextTypeSignIn:", -[CDPContext type](self->_context, "type")) & 1) != 0
    || !self->_secureBackupDisableController)
  {
    if (objc_msgSend(MEMORY[0x24BE1A3F8], "isSubsetOfContextTypeSignIn:", -[CDPContext type](self->_context, "type")))
    {
      _CDPLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[CDPDStateMachine _resetAccountCDPStateWithCompletion:].cold.1();

    }
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BE0AD68], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isVirtualMachine");

  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[CDPDStateMachine _resetAccountCDPStateWithCompletion:].cold.2();

LABEL_12:
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5004);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v10);

    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Hold on to your hats. User has requested a CDP reset.\", buf, 2u);
  }

  secureBackupDisableController = self->_secureBackupDisableController;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__CDPDStateMachine__resetAccountCDPStateWithCompletion___block_invoke;
  v12[3] = &unk_24C81C558;
  v12[4] = self;
  v13 = v4;
  -[CDPDSecureBackupDisableCapable deleteAllBackupRecordsWithCompletion:](secureBackupDisableController, "deleteAllBackupRecordsWithCompletion:", v12);

LABEL_17:
}

void __56__CDPDStateMachine__resetAccountCDPStateWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __56__CDPDStateMachine__resetAccountCDPStateWithCompletion___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resetCircleIncludingCloudKitData:cloudKitResetReasonDescription:withCompletion:", 1, CFSTR("CoreCDP-user-elected"), *(_QWORD *)(a1 + 40));

}

- (id)circlePeerIDForSecureBackupController:(id)a3
{
  return (id)-[CDPDCircleControl peerID](self->_circleController, "peerID", a3);
}

- (BOOL)synchronizeCircleViewsForSecureBackupContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  NSObject *v10;
  uint8_t v12[16];

  v4 = a3;
  objc_msgSend(v4, "circleJoinResult");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "circleJoinResult"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "requiresInitialSync"),
        v7,
        v6,
        !v8))
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Initial sync not required, skipping...\", v12, 2u);
    }

    v9 = 1;
  }
  else
  {
    v9 = -[CDPDCircleControl synchronizeCircleViews](self->_circleController, "synchronizeCircleViews");
  }

  return v9;
}

- (void)promptForAdoptionOfMultipleICSCWithCompletion:(id)a3
{
  -[CDPStateUIProviderInternal cdpContext:promptForAdoptionOfMultipleICSC:](self->_uiProvider, "cdpContext:promptForAdoptionOfMultipleICSC:", self->_context, a3);
}

- (void)promptForLocalSecretWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDStateMachine promptForLocalSecretWithCompletion:].cold.1((uint64_t)self, v5, v6);

  -[CDPStateUIProviderInternal cdpContext:promptForLocalSecretWithCompletion:](self->_uiProvider, "cdpContext:promptForLocalSecretWithCompletion:", self->_context, v4);
}

- (void)circleController:(id)a3 secureBackupRecordsArePresentWithCompletion:(id)a4
{
  -[CDPDSecureBackupControl backupRecordsArePresentWithCompletion:](self->_secureBackupController, "backupRecordsArePresentWithCompletion:", a4);
}

- (id)contextForController:(id)a3
{
  return self->_context;
}

- (id)secureChannelContextForController:(id)a3
{
  id v4;
  CDPDSecureChannelContext *v5;
  CDPContext *context;
  void *v7;
  CDPDSecureChannelContext *v8;

  v4 = a3;
  if ((-[CDPContext isPiggybackingRecovery](self->_context, "isPiggybackingRecovery") & 1) != 0
    || -[CDPContext isTTSURecovery](self->_context, "isTTSURecovery"))
  {
    v5 = [CDPDSecureChannelContext alloc];
    context = self->_context;
    objc_msgSend(v4, "circleProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CDPDSecureChannelContext initWithContext:circleProxy:](v5, "initWithContext:circleProxy:", context, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CDPDSecureBackupControl)secureBackupController
{
  return self->_secureBackupController;
}

- (void)setSecureBackupController:(id)a3
{
  objc_storeStrong((id *)&self->_secureBackupController, a3);
}

- (CDPDSecureBackupEnableCapable)secureBackupEnableController
{
  return self->_secureBackupEnableController;
}

- (void)setSecureBackupEnableController:(id)a3
{
  objc_storeStrong((id *)&self->_secureBackupEnableController, a3);
}

- (CDPDCircleControl)circleController
{
  return self->_circleController;
}

- (void)setCircleController:(id)a3
{
  objc_storeStrong((id *)&self->_circleController, a3);
}

- (CDPDPCSController)pcsController
{
  return self->_pcsController;
}

- (void)setPcsController:(id)a3
{
  objc_storeStrong((id *)&self->_pcsController, a3);
}

- (CDPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
  objc_storeStrong((id *)&self->_uiProvider, a3);
}

- (BOOL)attemptedCDPEnable
{
  return self->_attemptedCDPEnable;
}

- (void)setAttemptedCDPEnable:(BOOL)a3
{
  self->_attemptedCDPEnable = a3;
}

- (CDPDLockAssertion)lockAssertion
{
  return self->_lockAssertion;
}

- (void)setLockAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_lockAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockAssertion, 0);
  objc_storeStrong((id *)&self->_cdpdStatemachineDefaultQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_ledger, 0);
  objc_storeStrong((id *)&self->_inheritanceTrustController, 0);
  objc_storeStrong((id *)&self->_secureBackupDisableController, 0);
  objc_storeStrong((id *)&self->_secureBackupEnableController, 0);
  objc_storeStrong((id *)&self->_secureBackupController, 0);
  objc_storeStrong((id *)&self->_circleController, 0);
  objc_storeStrong((id *)&self->_pcsController, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithContext:uiProvider:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"**** DEBUG **** Fake nearly depleted records mode is ENABLED\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithContext:uiProvider:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"UI Provider is %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleCloudDataProtectionStateWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Make sure device is unlocked before calling handleCloudDataProtectionStateWithCompletion:\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)handleCloudDataProtectionStateWithCompletion:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a2, a3, "\"State machine context: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_28_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0(&dword_20DB2C000, v0, v1, "\"CDP State Machine failed without error... investigate lack of error\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __65__CDPDStateMachine_handleCloudDataProtectionStateWithCompletion___block_invoke_28_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_11_1(&dword_20DB2C000, v2, v3, "\"HomePod failed CDP join with AuthKit error: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10_3();
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"iCSC creation is not needed if this is a beneficiary\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"In sync mode & we did attempt secure backup enablement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"In sync mode, we should have attempted secure backup enablement but we did not.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"In async mode & we did schedule iCSC creation on an async queue.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"In async mode, we should have scheduled iCSC creation on the async queue but we did not.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"iCSC creation will not be attempted if the user does not have a local secret\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Must be in Octagon Clique to create an iCSC\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"iCSC creation will not be attempted if the keychain sync system is anything other than Octagon\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_errorForICSCCreationNotAttemptedWithResult:cliqueStatus:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Detected a pref to behave as if iCSC creation was not attempted when expected.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_handleCloudDataProtectionStateWithCompletion:(NSObject *)a3 .cold.1(void *a1, int a2, NSObject *a3)
{
  void *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109890;
  v7[1] = a2;
  v8 = 1024;
  v9 = 0;
  v10 = 2160;
  v11 = 1752392040;
  v12 = 2112;
  v13 = v6;
  _os_log_error_impl(&dword_20DB2C000, a3, OS_LOG_TYPE_ERROR, "\"Account not allowed in CDP due to being federated (%{BOOL}d) and MAIDinCDP is (%{BOOL}d): %{mask.hash}@\", (uint8_t *)v7, 0x22u);

}

void __66__CDPDStateMachine__handleCloudDataProtectionStateWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Failed to register credentials with Security, lets try again...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __58__CDPDStateMachine__handleBeneficiaryTrustWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to get the beneficiary access key. %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_attemptBeneficiaryTrustWithInheritanceKey:(uint64_t)a1 retryCount:completion:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_11_1(&dword_20DB2C000, v2, v3, "\"Scheduling to join beneficiary trust after %@ seconds as security says there isn't a CK account yet.\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10_3();
}

- (void)_attemptBeneficiaryTrustWithInheritanceKey:retryCount:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Circle status is unexpected for beneficiary trust. Failing…\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __85__CDPDStateMachine__attemptBeneficiaryTrustWithInheritanceKey_retryCount_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to recover octagon with beneficiary access key. %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "@\"We are in SOS only mode, calling callback with success\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to join circle and recovery is not needed, aborting (error as %@)\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __65__CDPDStateMachine__enrollOrDisableCDPAfterEnabledStateVerified___block_invoke_69_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0(&dword_20DB2C000, v0, v1, "\"Resetting during sign in flow is illegal, operation will not be performed.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __54__CDPDStateMachine__disableRecoveryKeyWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to disable recovery key with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __55__CDPDStateMachine_resetAccountCDPStateWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"CDP reset failed, can not proceed: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __65__CDPDStateMachine__enableSecureBackupWithJoinResult_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to check for existing records before enabling secure backup with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_handlePreflightError:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Account preflight failed with error, aborting CDP state machine - %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_attemptCDPEnable:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Enabling iCDP has already been attempted, but checking the status reports iCDP is still not enabled. Aborting.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_attemptCDPEnable:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"iCDP is not enabled, and the account is not HSA2 enabled or an allowed MAID account\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __38__CDPDStateMachine__attemptCDPEnable___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Not eligible for iCDP - %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_initDependenciesWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Attempting to enable CDP for sync system %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_shouldPerformAuthenticatedRepairWithOptionForceFetch:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a1, a3, "\"Context passed into %s was nil, and context for primary account is also nil. Aborting.\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_shouldPerformAuthenticatedRepairWithOptionForceFetch:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"**** DEBUG **** Fake that we must repair\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __85__CDPDStateMachine__shouldPerformAuthenticatedRepairWithOptionForceFetch_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to refresh context: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)shouldPerformRepairWithOptionForceFetch:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a1, a3, "\"Context passed into %s was nil, and context for primary account is also nil. Aborting.\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_continueShouldPerformRepairWithOptionForceFetch:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Will not be able to fetch escrow record status report because escrow record is nil. Aborting.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __34__CDPDStateMachine__fetchUserInfo__block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_7(&dword_20DB2C000, v1, (uint64_t)v1, "\"Fetched user info %@ from server with error = %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)repairCloudDataProtectionStateWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"State machine repairing CDP with context: %@\", v4, 0xCu);

  OUTLINED_FUNCTION_10_3();
}

- (void)_eligibleForSilentAuthenticatedRepair
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"SOS feature is disabled on this device, eligible for silent authenticated repair\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __56__CDPDStateMachine__performSilentlyAuthenticatedRepair___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to perform silent authentication for repair with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __61__CDPDStateMachine__performInteractivelyAuthenticatedRepair___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"UI provider failed to perform interactive authentication for repair with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_preflightAccountStateWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Account preflight failed - No primary account is present\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_preflightAccountStateWithContext:(NSObject *)a3 completion:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 141558786;
  v7 = 1752392040;
  v8 = 2112;
  v9 = a1;
  v10 = 2160;
  v11 = 1752392040;
  v12 = 2112;
  v13 = v5;
  _os_log_error_impl(&dword_20DB2C000, a3, OS_LOG_TYPE_ERROR, "\"Account preflight failed - Primary account DSID (%{mask.hash}@) does not match the DSID specified in the context (%{mask.hash}@)\", (uint8_t *)&v6, 0x2Au);

}

void __65__CDPDStateMachine__preflightAccountStateWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to enable KVS with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_enableKVSForAccount:store:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Found primary account\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_recoverSecureBackupWithCircleJoinResult:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Failed to recover SecureBackup because no UI provider is present to request the local and/or remote device secrets\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to get a local device secret from the UI provider with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __82__CDPDStateMachine__handleInteractiveRecoveryFlowWithCircleJoinResult_completion___block_invoke_122_cold_1(char a1, uint64_t a2, os_log_t log)
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
  _os_log_debug_impl(&dword_20DB2C000, log, OS_LOG_TYPE_DEBUG, "\"Finished backup recovery attempt with the user-provided local secret with didRecover=%i error=%@\", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_4();
}

- (void)_attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"_attemptBackupRecoveryWithLocalSecret: Encountered error while checking RK support: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"_attemptBackupRecoveryWithLocalSecret: fetching RK from the keychain\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_attemptBackupRecoveryWithLocalSecret:type:useSecureBackupCachedSecret:circleJoinResult:completion:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_12(&dword_20DB2C000, v0, v1, "\"%s: useSecureBackupCachedSecret=%{BOOL}d, circleJoinResult=%@\", v2);
  OUTLINED_FUNCTION_10_3();
}

- (void)_attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret:localSecretType:useSecureBackupCachedSecret:circleJoinResult:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_12(&dword_20DB2C000, v0, v1, "\"%s: useSecureBackupCachedSecret=%{BOOL}d, circleJoinResult=%@\", v2);
  OUTLINED_FUNCTION_10_3();
}

void __156__CDPDStateMachine__attemptBackupRecoveryByPromptingForRemoteSecretWithLocalSecret_localSecretType_useSecureBackupCachedSecret_circleJoinResult_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Error prompting user for remote device secret - %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_enableCustodianRecoveryIfAvailableForContext:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "@\"_enableCustodianRecoveryIfAvailableForContext: returning %i\", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_postRecoveryEnableSecureBackupWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Calling upgradeICSCRecordsThenEnableSecureBackupWithContext\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_postRecoveryEnableSecureBackupWithContext:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Context hasPeersWithCDPBackupRecords and async mode is enabled.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_postRecoveryEnableSecureBackupWithContext:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"_postRecoveryEnableSecureBackupWithContext called.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __74__CDPDStateMachine__postRecoveryEnableSecureBackupWithContext_completion___block_invoke_142_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Experienced error while enabling secure backup: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_enableSecureBackupWithCircleJoinResult:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Failed to enable SecureBackup because no UI provider is present to request the local device secret\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __71__CDPDStateMachine__enableSecureBackupWithCircleJoinResult_completion___block_invoke_146_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Error prompting user for local device secret - %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"repairCloudDataProtection: failed to clear sosCompatibilityCFU with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"repairCloudDataProtection: failed to post sosCompatibilityCFU with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __81__CDPDStateMachine__joinSOSAsynchronouslyFromHandleCloudDataProtectionIfRequired__block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"SOS only state machine run failed: %@. Posting follow up...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __82__CDPDStateMachine__joinSOSFromRepairCloudDataProtectionIfRequiredWithCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"repairCloudDataProtection: SOS only state repair failed: %@. Posting follow up...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_resetAccountCDPStateWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0(&dword_20DB2C000, v0, v1, "\"We dont support RPD during signin flow\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_resetAccountCDPStateWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0(&dword_20DB2C000, v0, v1, "\"Reset data is not supported on virtual machines.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __56__CDPDStateMachine__resetAccountCDPStateWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to delete all backup records with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)promptForLocalSecretWithCompletion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_7(&dword_20DB2C000, a2, a3, "\"Prompting for local secret using uiProvider=(%@) and context=(%@)\", (uint8_t *)&v5);
  OUTLINED_FUNCTION_4();
}

@end
