@implementation CDPDLocalSecretController

- (CDPDLocalSecretController)initWithContext:(id)a3
{
  id v4;
  CDPDLocalSecretController *v5;
  NSObject *v6;
  void *v7;
  CDPDLocalSecretFollowUpProviderImpl *v8;
  void *v9;
  uint64_t v10;
  CDPLocalSecretFollowUpProvider *followUpProvider;
  CDPDLocalSecretFollowUpProviderImpl *v12;
  CDPLocalSecretFollowUpProvider *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[CDPDLocalSecretController init](self, "init");
  if (v5)
  {
    if (objc_msgSend(MEMORY[0x24BE1A4A0], "canEnableMultiUserManatee"))
    {
      _CDPLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "altDSID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 141558274;
        v16 = 1752392040;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"MUM: CDPDLocalSecretFollowUpProviderImpl init'ed with altDSID %{mask.hash}@\", (uint8_t *)&v15, 0x16u);

      }
      v8 = [CDPDLocalSecretFollowUpProviderImpl alloc];
      objc_msgSend(v4, "altDSID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CDPDLocalSecretFollowUpProviderImpl initWithAltDSID:](v8, "initWithAltDSID:", v9);
      followUpProvider = v5->_followUpProvider;
      v5->_followUpProvider = (CDPLocalSecretFollowUpProvider *)v10;

    }
    else
    {
      v12 = objc_alloc_init(CDPDLocalSecretFollowUpProviderImpl);
      v13 = v5->_followUpProvider;
      v5->_followUpProvider = (CDPLocalSecretFollowUpProvider *)v12;

    }
    -[CDPDLocalSecretController setContext:](v5, "setContext:", v4);
  }

  return v5;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"CDPDLocalSecretController dealloc\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)setContext:(id)a3
{
  id v5;
  NSObject *v6;
  CDPContext **p_context;
  NSObject *v8;
  uint64_t v9;
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
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  CDPDSecureBackupController *v27;
  CDPDSecureBackupController *secureBackupController;
  CDPDCircleController *v29;
  void *v30;
  CDPDOctagonTrustProxyImpl *v31;
  CDPDCircleController *v32;
  CDPDCircleController *circleController;
  int v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v34) = 0;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Updating context for local secret change\", (uint8_t *)&v34, 2u);
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
    v34 = 134219522;
    v35 = v9;
    v36 = 2160;
    v37 = 1752392040;
    v38 = 2112;
    v39 = v10;
    v40 = 2160;
    v41 = 1752392040;
    v42 = 2112;
    v43 = v11;
    v44 = 2160;
    v45 = 1752392040;
    v46 = 2112;
    v47 = v12;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"CDPDLocalSecretController: updated context with context type: %ld, appleID: %{mask.hash}@, dsid: %{mask.hash}@, adsid: %{mask.hash}@\", (uint8_t *)&v34, 0x48u);

  }
  if (!*p_context)
  {
    objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
    v24 = objc_claimAutoreleasedReturnValue();
    v22 = *p_context;
    *p_context = (CDPContext *)v24;
    goto LABEL_13;
  }
  -[CDPContext appleID](*p_context, "appleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "primaryAccountUsername");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext setAppleID:](*p_context, "setAppleID:", v15);

  }
  -[CDPContext dsid](*p_context, "dsid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "primaryAccountDSID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithLongLong:", objc_msgSend(v19, "longLongValue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext setDsid:](*p_context, "setDsid:", v20);

  }
  -[CDPContext altDSID](*p_context, "altDSID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "primaryAccountAltDSID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext setAltDSID:](*p_context, "setAltDSID:", v23);

LABEL_13:
  }
  if (*p_context)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext setTelemetryFlowID:](self->_context, "setTelemetryFlowID:", v26);

    v27 = -[CDPDSecureBackupController initWithContext:uiProvider:delegate:]([CDPDSecureBackupController alloc], "initWithContext:uiProvider:delegate:", self->_context, 0, self);
    secureBackupController = self->_secureBackupController;
    self->_secureBackupController = v27;

    v29 = [CDPDCircleController alloc];
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3E8]), "initWithContext:", self->_context);
    v31 = -[CDPDOctagonTrustProxyImpl initWithContext:]([CDPDOctagonTrustProxyImpl alloc], "initWithContext:", self->_context);
    v32 = -[CDPDCircleController initWithUiProvider:delegate:circleProxy:octagonTrustProxy:](v29, "initWithUiProvider:delegate:circleProxy:octagonTrustProxy:", 0, self, v30, v31);
    circleController = self->_circleController;
    self->_circleController = v32;

  }
}

- (void)attemptToEscrowPreRecord:(id)a3 completion:(id)a4
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
  v10[2] = __65__CDPDLocalSecretController_attemptToEscrowPreRecord_completion___block_invoke;
  v10[3] = &unk_24C81CCD0;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[CDPDLocalSecretController _createContextForSecret:withCompletion:](self, "_createContextForSecret:withCompletion:", 0, v10);

}

void __65__CDPDLocalSecretController_attemptToEscrowPreRecord_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v6, "circleController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "circleStatus");

    if (v8 == 1)
    {
      v9 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __65__CDPDLocalSecretController_attemptToEscrowPreRecord_completion___block_invoke_2;
      v14[3] = &unk_24C81C558;
      v14[4] = v9;
      v15 = *(id *)(a1 + 48);
      objc_msgSend(v9, "_attemptToEscrowPreRecord:completion:", v10, v14);

    }
    else
    {
      v12 = *(_QWORD *)(a1 + 48);
      if (v12)
      {
        _CDPStateError();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

      }
    }
  }
  else
  {
    objc_msgSend(v6, "_handleCompletionStatus:preRecord:", 0, 1);
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v5);
  }

}

void __65__CDPDLocalSecretController_attemptToEscrowPreRecord_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_handleCompletionStatus:preRecord:", a2, 1);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

- (void)localSecretChangedTo:(id)a3 secretType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v8 = a5;
  v9 = a3;
  -[CDPDLocalSecretController _sendiCSCUpdateStartEvent](self, "_sendiCSCUpdateStartEvent");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__CDPDLocalSecretController_localSecretChangedTo_secretType_completion___block_invoke;
  v11[3] = &unk_24C81C558;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[CDPDLocalSecretController _wrappedLocalSecretChangedTo:secretType:completion:](self, "_wrappedLocalSecretChangedTo:secretType:completion:", v9, a4, v11);

}

void __72__CDPDLocalSecretController_localSecretChangedTo_secretType_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_makeICSCUpdateFinishEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sendiCSCUpdateFinishEvent:didUpdate:error:", v5, a2, v7);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

- (void)_wrappedLocalSecretChangedTo:(id)a3 secretType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  unint64_t v30;

  v8 = a3;
  v9 = a5;
  if ((-[CDPContext isPrimaryAccount](self->_context, "isPrimaryAccount") & 1) != 0)
  {
    if (objc_msgSend(v8, "length"))
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __80__CDPDLocalSecretController__wrappedLocalSecretChangedTo_secretType_completion___block_invoke;
      v27[3] = &unk_24C81CD98;
      v27[4] = self;
      v28 = v8;
      v30 = a4;
      v29 = v9;
      -[CDPDLocalSecretController _createContextForSecret:withCompletion:](self, "_createContextForSecret:withCompletion:", 1, v27);

    }
    else
    {
      _CDPLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CDPDLocalSecretController _wrappedLocalSecretChangedTo:secretType:completion:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

      -[CDPDLocalSecretController _handleCompletionStatus:preRecord:](self, "_handleCompletionStatus:preRecord:", 1, 0);
      if (v9)
        (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
    }
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPDLocalSecretController _wrappedLocalSecretChangedTo:secretType:completion:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);

    -[CDPDLocalSecretController _handleCompletionStatus:preRecord:](self, "_handleCompletionStatus:preRecord:", 1, 0);
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5102);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v18);

    }
  }

}

void __80__CDPDLocalSecretController__wrappedLocalSecretChangedTo_secretType_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CDPDStateMachine *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[16];

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v6, "circleController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "circleStatus");

    if (v8 == 1)
    {
      v9 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __80__CDPDLocalSecretController__wrappedLocalSecretChangedTo_secretType_completion___block_invoke_24;
      v16[3] = &unk_24C81C558;
      v16[4] = v9;
      v11 = *(_QWORD *)(a1 + 56);
      v17 = *(id *)(a1 + 48);
      objc_msgSend(v9, "_localSecretChangedTo:secretType:completion:", v10, v11, v16);

    }
    else
    {
      _CDPLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Not in circle , trying repair\", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setCachedLocalSecret:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setCachedLocalSecretType:", *(_QWORD *)(a1 + 56));
      v14 = -[CDPDStateMachine initWithContext:uiProvider:]([CDPDStateMachine alloc], "initWithContext:uiProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
      v15 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __80__CDPDLocalSecretController__wrappedLocalSecretChangedTo_secretType_completion___block_invoke_23;
      v18[3] = &unk_24C81C558;
      v18[4] = v15;
      v19 = *(id *)(a1 + 48);
      objc_msgSend(v15, "_repairWithStateMachine:completion:", v14, v18);

    }
  }
  else
  {
    objc_msgSend(v6, "_handleCompletionStatus:preRecord:", 0, 0);
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v5);
  }

}

void __80__CDPDLocalSecretController__wrappedLocalSecretChangedTo_secretType_completion___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"repair completed with result: %{BOOL}d error: %@\", (uint8_t *)v8, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_handleCompletionStatus:preRecord:", a2, 0);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

void __80__CDPDLocalSecretController__wrappedLocalSecretChangedTo_secretType_completion___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_handleCompletionStatus:preRecord:", a2, 0);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

- (void)_sendiCSCUpdateStartEvent
{
  void *v3;
  void *v4;
  void *v5;
  CDPDAccount *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_context, *MEMORY[0x24BE1A828], *MEMORY[0x24BE1A860]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aaf_processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE1A830]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CDPDCircleController cliqueStatus](self->_circleController, "cliqueStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE1A620]);

  v6 = objc_alloc_init(CDPDAccount);
  -[CDPContext dsid](self->_context, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CDPDAccount isICDPEnabledForDSID:checkWithServer:](v6, "isICDPEnabledForDSID:checkWithServer:", v8, 0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE1A600]);

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:", v12);

}

- (id)_makeICSCUpdateFinishEvent
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_context, *MEMORY[0x24BE1A820], *MEMORY[0x24BE1A860]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aaf_processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE1A830]);

  return v2;
}

- (void)_sendiCSCUpdateFinishEvent:(id)a3 didUpdate:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  void *v8;
  CDPDCircleController *circleController;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CDPDAccount *v19;

  v5 = a4;
  v8 = (void *)MEMORY[0x24BDD16E0];
  circleController = self->_circleController;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v8, "numberWithInteger:", -[CDPDCircleController cliqueStatus](circleController, "cliqueStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE1A620]);

  v19 = objc_alloc_init(CDPDAccount);
  -[CDPContext dsid](self->_context, "dsid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CDPDAccount isICDPEnabledForDSID:checkWithServer:](v19, "isICDPEnabledForDSID:checkWithServer:", v14, 0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE1A600]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE1A640]);

  objc_msgSend(v11, "populateUnderlyingErrorsStartingWithRootError:", v10);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendEvent:", v11);

}

- (void)finishOfflineLocalSecretChangeWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81C558;
  aBlock[4] = self;
  v6 = v4;
  v14 = v6;
  v7 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasLocalSecret");

  if (v9)
  {
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_2;
    v11[3] = &unk_24C81C558;
    v11[4] = self;
    v12 = v7;
    -[CDPDLocalSecretController _createContextForSecret:withCompletion:](self, "_createContextForSecret:withCompletion:", 1, v11);

  }
  else
  {
    _CDPStateError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v7 + 2))(v7, 0, v10);

  }
}

void __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_handleCompletionStatus:preRecord:", a2, 0);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_cdpStateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_3;
    v6[3] = &unk_24C81CDE8;
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v4;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v7, "shouldPerformRepairWithOptionForceFetch:completion:", 0, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_repairWithStateMachine:completion:", v4, *(_QWORD *)(a1 + 40));
  }

}

void __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_3(uint64_t a1, int a2, uint64_t a3)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v3 = *(void **)(a1 + 32);
  if (a3 || a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_repairWithStateMachine:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_4;
    v4[3] = &unk_24C81CDC0;
    v4[4] = v3;
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v3, "_collectLocalSecretWithCompletion:", v4);

  }
}

void __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "validatedSecret");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_localSecretChangedTo:secretType:completion:", v5, objc_msgSend(v6, "secretType"), *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_attemptToEscrowPreRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CDPDSecureBackupContext *v8;
  CDPCAEscrowReporter *v9;
  NSObject *v10;
  void *v11;
  CDPDSecureBackupController *secureBackupController;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc_init(CDPDSecureBackupContext);
    -[CDPDSecureBackupContext setPreRecordUUID:](v8, "setPreRecordUUID:", v6);
    v9 = -[CDPCAEscrowReporter initWithPreRecordIdentifier:]([CDPCAEscrowReporter alloc], "initWithPreRecordIdentifier:", v6);
    -[CDPCAEscrowReporter didAttemptEscrowPreRecord](v9, "didAttemptEscrowPreRecord");
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Have EscrowPreRecord, attempting to enable secure backup: %@\", buf, 0xCu);
    }

    +[CDPDLockAssertion lock](CDPDLockAssertion, "lock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    secureBackupController = self->_secureBackupController;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __66__CDPDLocalSecretController__attemptToEscrowPreRecord_completion___block_invoke;
    v14[3] = &unk_24C81C558;
    v15 = v11;
    v16 = v7;
    v13 = v11;
    -[CDPDSecureBackupController checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:completion:](secureBackupController, "checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:completion:", v8, v14);

  }
  else
  {
    _CDPStateError();
    v8 = (CDPDSecureBackupContext *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, CDPDSecureBackupContext *))v7 + 2))(v7, 0, v8);
  }

}

void __66__CDPDLocalSecretController__attemptToEscrowPreRecord_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

- (void)_localSecretChangedTo:(id)a3 secretType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  CDPCALocalSecretReporter *v10;
  CDPDSecureBackupContext *v11;
  void *v12;
  NSObject *v13;
  CDPDSecureBackupController *secureBackupController;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(CDPCALocalSecretReporter);
  if (objc_msgSend(v8, "length"))
  {
    -[CDPCALocalSecretReporter didChangeLocalSecret](v10, "didChangeLocalSecret");
    v11 = objc_alloc_init(CDPDSecureBackupContext);
    -[CDPDSecureBackupContext setLocalSecret:](v11, "setLocalSecret:", v8);
    -[CDPDSecureBackupContext setLocalSecretType:](v11, "setLocalSecretType:", a4);
    +[CDPDLockAssertion lock](CDPDLockAssertion, "lock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Have local secret, attempting to enable secure backup\", buf, 2u);
    }

    secureBackupController = self->_secureBackupController;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __73__CDPDLocalSecretController__localSecretChangedTo_secretType_completion___block_invoke;
    v16[3] = &unk_24C81C558;
    v17 = v12;
    v18 = v9;
    v15 = v12;
    -[CDPDSecureBackupController checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:completion:](secureBackupController, "checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:completion:", v11, v16);

  }
  else
  {
    -[CDPCALocalSecretReporter didRemoveLocalSecret](v10, "didRemoveLocalSecret");
    _CDPStateError();
    v11 = (CDPDSecureBackupContext *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, CDPDSecureBackupContext *))v9 + 2))(v9, 0, v11);
  }

}

void __73__CDPDLocalSecretController__localSecretChangedTo_secretType_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

- (void)_handleCompletionStatus:(BOOL)a3 preRecord:(BOOL)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    if (a4)
      return;
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasLocalSecret");

    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"Failed to update local secret by re-enabling SecureBackup\", (uint8_t *)&v16, 2u);
      }

      v14 = -[CDPContext type](self->_context, "type");
      -[CDPDLocalSecretController followUpProvider](self, "followUpProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v15;
      if (v14 == 7)
        objc_msgSend(v15, "postConfirmExistingSecretFollowUp");
      else
        objc_msgSend(v15, "postLocalSecretChangeFollowUp");
      goto LABEL_16;
    }
    if (v13)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"No secret, no follow up\", (uint8_t *)&v16, 2u);
    }

    -[CDPDLocalSecretController followUpProvider](self, "followUpProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    goto LABEL_15;
  }
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[CDPContext type](self->_context, "type");
    v16 = 134217984;
    v17 = v6;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Successfully updated local secret by re-enabling SecureBackup with context type: %ld\", (uint8_t *)&v16, 0xCu);
  }

  v7 = -[CDPContext type](self->_context, "type");
  -[CDPDLocalSecretController followUpProvider](self, "followUpProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 != 7)
  {
LABEL_15:
    objc_msgSend(v8, "deleteLocalSecretChangeFollowUp");
    goto LABEL_16;
  }
  objc_msgSend(v8, "deleteConfirmExistingSecretFollowUp");
LABEL_16:

}

- (void)_repairWithStateMachine:(id)a3 completion:(id)a4
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
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Failed to silently update local secret, starting repair\", v9, 2u);
  }

  -[CDPContext set_alwaysCreateEscrowRecord:](self->_context, "set_alwaysCreateEscrowRecord:", 1);
  objc_msgSend(v7, "repairCloudDataProtectionStateWithCompletion:", v6);

}

- (void)_setContextWithAuthResults:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Creating new CDPContext with the auth results\", (uint8_t *)&v9, 2u);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3F8]), "initWithAuthenticationResults:", v4);
  objc_msgSend(v6, "setType:", -[CDPContext type](self->_context, "type"));
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "type");
    v9 = 134217984;
    v10 = v8;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Context type set to %ld\", (uint8_t *)&v9, 0xCu);
  }

  -[CDPDLocalSecretController setContext:](self, "setContext:", v6);
}

- (void)_createContextForSecret:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  CDPStateUIProviderInternal *uiProvider;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  CDPDLocalSecretController *v21;
  id v22;
  uint8_t buf[4];
  CDPStateUIProviderInternal *v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __68__CDPDLocalSecretController__createContextForSecret_withCompletion___block_invoke;
  v20 = &unk_24C81CE10;
  v7 = v6;
  v21 = self;
  v22 = v7;
  v8 = _Block_copy(&v17);
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uiProvider = self->_uiProvider;
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance", v17, v18, v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "primaryAccountStashedPRK");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = uiProvider;
    v25 = 1024;
    v26 = v4;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"Refreshing context for input: (%@) - %{BOOL}d - %@\", buf, 0x1Cu);

  }
  if (-[CDPContext type](self->_context, "type") == 6
    && v4
    && self->_uiProvider
    && (objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "primaryAccountStashedPRK"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        !v14))
  {
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"Enabling backup, but we are missing a PRK, force interaction to get one\", buf, 2u);
    }

    -[CDPStateUIProviderInternal cdpContext:promptForInteractiveAuthenticationWithCompletion:](self->_uiProvider, "cdpContext:promptForInteractiveAuthenticationWithCompletion:", self->_context, v8);
  }
  else
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v15, OS_LOG_TYPE_DEFAULT, "\"Refreshing context with PET\", buf, 2u);
    }

    +[CDPAuthenticationHelper silentAuthenticationForPrimaryAccountWithCompletion:](CDPAuthenticationHelper, "silentAuthenticationForPrimaryAccountWithCompletion:", v8);
  }

}

void __68__CDPDLocalSecretController__createContextForSecret_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void (*v11)(void);
  _QWORD v12[5];
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE0AB28]))
  {
    v8 = objc_msgSend(v6, "code");

    if (v8 == -7003)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __68__CDPDLocalSecretController__createContextForSecret_withCompletion___block_invoke_2;
      v12[3] = &unk_24C81CE10;
      v9 = *(id *)(a1 + 40);
      v12[4] = *(_QWORD *)(a1 + 32);
      v13 = v9;
      +[CDPAuthenticationHelper silentAuthenticationForPrimaryAccountWithCompletion:](CDPAuthenticationHelper, "silentAuthenticationForPrimaryAccountWithCompletion:", v12);

      goto LABEL_11;
    }
  }
  else
  {

  }
  if (v6)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __68__CDPDLocalSecretController__createContextForSecret_withCompletion___block_invoke_cold_1(v10);

    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setContextWithAuthResults:", v5);
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v11();
LABEL_11:

}

uint64_t __68__CDPDLocalSecretController__createContextForSecret_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setContextWithAuthResults:", a2);
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v3();
}

- (id)_cdpStateMachine
{
  return -[CDPDStateMachine initWithContext:uiProvider:]([CDPDStateMachine alloc], "initWithContext:uiProvider:", self->_context, self->_uiProvider);
}

- (void)_collectLocalSecretWithCompletion:(id)a3
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

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDLocalSecretController _collectLocalSecretWithCompletion:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[CDPStateUIProviderInternal cdpContext:promptForLocalSecretWithCompletion:](self->_uiProvider, "cdpContext:promptForLocalSecretWithCompletion:", self->_context, v4);
}

- (id)circlePeerIDForSecureBackupController:(id)a3
{
  uint64_t *p_circleController;
  void *v4;
  NSObject *v5;

  p_circleController = (uint64_t *)&self->_circleController;
  -[CDPDCircleController peerID](self->_circleController, "peerID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDLocalSecretController circlePeerIDForSecureBackupController:].cold.1((uint64_t)v4, p_circleController, v5);

  return v4;
}

- (BOOL)synchronizeCircleViewsForSecureBackupContext:(id)a3
{
  return -[CDPDCircleController synchronizeCircleViews](self->_circleController, "synchronizeCircleViews", a3);
}

- (void)promptForAdoptionOfMultipleICSCWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)circleController:(id)a3 secureBackupRecordsArePresentWithCompletion:(id)a4
{
  -[CDPDSecureBackupController backupRecordsArePresentWithCompletion:](self->_secureBackupController, "backupRecordsArePresentWithCompletion:", a4);
}

- (id)contextForController:(id)a3
{
  return self->_context;
}

- (id)secureChannelContextForController:(id)a3
{
  return 0;
}

- (CDPContext)context
{
  return self->_context;
}

- (CDPDCircleController)circleController
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

- (CDPLocalSecretFollowUpProvider)followUpProvider
{
  return self->_followUpProvider;
}

- (void)setFollowUpProvider:(id)a3
{
  objc_storeStrong((id *)&self->_followUpProvider, a3);
}

- (AAFKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
  objc_storeStrong((id *)&self->_keychainManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainManager, 0);
  objc_storeStrong((id *)&self->_followUpProvider, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_secureBackupController, 0);
  objc_storeStrong((id *)&self->_circleController, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_wrappedLocalSecretChangedTo:(uint64_t)a3 secretType:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a1, a3, "\"No local secret passed in, nothing to update %s. Aborting\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_wrappedLocalSecretChangedTo:(uint64_t)a3 secretType:(uint64_t)a4 completion:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a1, a3, "\"No primary account found in %s. Aborting\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __68__CDPDLocalSecretController__createContextForSecret_withCompletion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "@\"Failed to reauthenticate before updating local secret\", v1, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_collectLocalSecretWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"Prompting user to enter local secret...\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)circlePeerIDForSecureBackupController:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_20DB2C000, log, OS_LOG_TYPE_DEBUG, "\"Got peer id: %@ from %@\", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

@end
