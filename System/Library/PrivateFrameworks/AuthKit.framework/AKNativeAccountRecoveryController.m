@implementation AKNativeAccountRecoveryController

- (AKNativeAccountRecoveryController)initWithContext:(id)a3 uiProvider:(id)a4 flowID:(id)a5
{
  id v9;
  id v10;
  id v11;
  AKNativeAccountRecoveryController *v12;
  AKNativeAccountRecoveryController *v13;
  NSObject *v14;
  void *v15;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  AKNativeAccountRecoveryController *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AKNativeAccountRecoveryController;
  v12 = -[AKNativeAccountRecoveryController init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recoveryContext, a3);
    if (v11)
    {
      _AKLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        -[AKAccountRecoveryContext authContext](v13->_recoveryContext, "authContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "telemetryFlowID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v13;
        v22 = 2112;
        v23 = v18;
        v24 = 2112;
        v25 = v11;
        _os_log_debug_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEBUG, "%@: Overriding the telemetryFlowID: from recoveryContext.authContext.telemetryFlowID=%@ to flowID=%@", buf, 0x20u);

      }
      -[AKAccountRecoveryContext authContext](v13->_recoveryContext, "authContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTelemetryFlowID:", v11);

    }
    objc_storeStrong((id *)&v13->_cdpUiProvider, a4);
  }

  return v13;
}

- (AKNativeAccountRecoveryController)initWithContext:(id)a3 uiProvider:(id)a4
{
  return -[AKNativeAccountRecoveryController initWithContext:uiProvider:flowID:](self, "initWithContext:uiProvider:flowID:", a3, a4, 0);
}

- (void)presentNativeRecoveryUIWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  CDPRecoveryController *v6;
  CDPRecoveryController *recoveryController;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CDPRecoveryController *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AKNativeAccountRecoveryController presentNativeRecoveryUIWithCompletion:].cold.2((uint64_t)self, v5);

  +[AKCDPFactory recoveryControllerWithContext:](AKCDPFactory, "recoveryControllerWithContext:", self->_recoveryContext);
  v6 = (CDPRecoveryController *)objc_claimAutoreleasedReturnValue();
  recoveryController = self->_recoveryController;
  self->_recoveryController = v6;

  -[CDPRecoveryController setAuthProvider:](self->_recoveryController, "setAuthProvider:", self);
  -[CDPRecoveryController setUiProvider:](self->_recoveryController, "setUiProvider:", self->_cdpUiProvider);
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AKNativeAccountRecoveryController presentNativeRecoveryUIWithCompletion:].cold.1((uint64_t)&self->_recoveryController, v8, v9, v10, v11, v12, v13, v14);

  v15 = self->_recoveryController;
  if (v15)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__AKNativeAccountRecoveryController_presentNativeRecoveryUIWithCompletion___block_invoke;
    v17[3] = &unk_1E2E5F0B0;
    v17[4] = self;
    v18 = v4;
    -[CDPRecoveryController performRecovery:](v15, "performRecovery:", v17);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7001);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v16);

  }
}

void __75__AKNativeAccountRecoveryController_presentNativeRecoveryUIWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  void (*v13)(void);
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __75__AKNativeAccountRecoveryController_presentNativeRecoveryUIWithCompletion___block_invoke_cold_1((uint64_t)v6, v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "mandatesRecoveryKey") & 1) != 0)
    {

    }
    else
    {
      v10 = objc_msgSend(v6, "cdp_isCDPErrorWithCode:", -5215);

      if (v10)
      {
        +[AKNativeAccountRecoveryController postBodyForiCSCServerUIResponseWithContext:recoveryError:](AKNativeAccountRecoveryController, "postBodyForiCSCServerUIResponseWithContext:recoveryError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    v11 = 0;
LABEL_12:
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      v13 = *(void (**)(void))(v12 + 16);
LABEL_16:
      v13();
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "supportsMasterKeyRecovery"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_mapICSCRecoveryResultsToAuthKit:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
    {
      v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, _QWORD))(v9 + 16))(v9, v5, 0);
LABEL_18:

}

- (void)dismissNativeRecoveryUIWithCompletion:(id)a3
{
  AKAccountRecoveryContext *recoveryContext;
  CDPRecoveryController *recoveryController;
  void *v6;
  id v7;

  v7 = a3;
  recoveryContext = self->_recoveryContext;
  self->_recoveryContext = 0;

  -[CDPRecoveryController invalidate](self->_recoveryController, "invalidate");
  recoveryController = self->_recoveryController;
  self->_recoveryController = 0;

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
    v6 = v7;
  }

}

- (void)cdpContext:(id)a3 performSilentRecoveryTokenRenewal:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  AKAccountRecoveryContext *recoveryContext;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(AKAppleIDAuthenticationController);
  recoveryContext = self->_recoveryContext;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__AKNativeAccountRecoveryController_cdpContext_performSilentRecoveryTokenRenewal___block_invoke;
  v12[3] = &unk_1E2E5F0B0;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[AKAppleIDAuthenticationController renewRecoveryTokenWithContext:completion:](v8, "renewRecoveryTokenWithContext:completion:", recoveryContext, v12);

}

void __82__AKNativeAccountRecoveryController_cdpContext_performSilentRecoveryTokenRenewal___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = (void *)objc_msgSend(v6, "copy");
  if (!v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AKPassword"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPasswordEquivToken:", v9);

  }
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __82__AKNativeAccountRecoveryController_cdpContext_performSilentRecoveryTokenRenewal___block_invoke_cold_1((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)cdpContext:(id)a3 verifyMasterKey:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  AKAppleIDAuthenticationController *v9;

  v7 = a5;
  v8 = a4;
  v9 = objc_alloc_init(AKAppleIDAuthenticationController);
  -[AKAppleIDAuthenticationController verifyMasterKey:context:completion:](v9, "verifyMasterKey:context:completion:", v8, self->_recoveryContext, v7);

}

- (id)_mapICSCRecoveryResultsToAuthKit:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKCDPFactory cdpIDMSRecordPRKKey](AKCDPFactory, "cdpIDMSRecordPRKKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[AKCDPFactory cdpIDMSRecordMIDKey](AKCDPFactory, "cdpIDMSRecordMIDKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("X-Apple-I-iCSC-PRK"));
    if (v9)
    {
LABEL_3:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("X-Apple-I-iCSC-MD-M"));
      goto LABEL_10;
    }
  }
  else
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AKNativeAccountRecoveryController _mapICSCRecoveryResultsToAuthKit:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);

    if (v9)
      goto LABEL_3;
  }
  _AKLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[AKNativeAccountRecoveryController _mapICSCRecoveryResultsToAuthKit:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

LABEL_10:
  v26 = (void *)objc_msgSend(v5, "copy");

  return v26;
}

+ (id)requestForRecoveryCompletionWithContext:(id)a3 recoveredInfo:(id)a4 recoveryError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  NSObject *v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Building recovery response request", buf, 2u);
  }

  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v9;
    _os_log_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEFAULT, "Recovered info %@", buf, 0xCu);
  }

  objc_msgSend(v8, "recoveryContinuationURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v8, "decodedRecoveryIdentityTokenString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v8, "authContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "altDSID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ak_addICSCRecoveryHeaderWithIdentityToken:forAltDSID:", v15, v17);

      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __105__AKNativeAccountRecoveryController_requestForRecoveryCompletionWithContext_recoveredInfo_recoveryError___block_invoke;
      v30 = &unk_1E2E5F0D8;
      v18 = v14;
      v31 = v18;
      v19 = v8;
      v32 = v19;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v27);
      objc_msgSend(a1, "postBodyForiCSCServerUIResponseWithContext:recoveryError:", v19, v10, v27, v28, v29, v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject ak_setBodyWithParameters:](v18, "ak_setBodyWithParameters:", v20);
      _AKLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject allHTTPHeaderFields](v18, "allHTTPHeaderFields");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v34 = v22;
        _os_log_impl(&dword_19202F000, v21, OS_LOG_TYPE_DEFAULT, "Recovery response: %@", buf, 0xCu);

      }
      _AKLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v20;
        _os_log_impl(&dword_19202F000, v23, OS_LOG_TYPE_DEFAULT, "Recovery response body: %@", buf, 0xCu);
      }

      v24 = v18;
      v25 = v31;
    }
    else
    {
      _AKLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        +[AKNativeAccountRecoveryController requestForRecoveryCompletionWithContext:recoveredInfo:recoveryError:].cold.1(v25);
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __105__AKNativeAccountRecoveryController_requestForRecoveryCompletionWithContext_recoveredInfo_recoveryError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("X-Apple-Recovery-Identity-Token")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("X-Apple-I-iCSC-PRK")))
    {
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
    }
    else
    {
      objc_opt_class();
      v14 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;

      if (v15)
      {
        v13 = v15;
        v12 = 0;
        v11 = v13;
        goto LABEL_12;
      }
      objc_opt_class();
      v16 = v14;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v16;
      else
        v12 = 0;

      if (!v12)
      {
        _AKLogSystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          __105__AKNativeAccountRecoveryController_requestForRecoveryCompletionWithContext_recoveredInfo_recoveryError___block_invoke_cold_1((uint64_t)v16, v8);
        goto LABEL_3;
      }
      objc_msgSend(v12, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = 0;
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v11, v5);

    goto LABEL_13;
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "authContext");
  v8 = objc_claimAutoreleasedReturnValue();
  -[NSObject altDSID](v8, "altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ak_addRecoveryHeaderWithIdentityToken:forAltDSID:", v6, v9);

LABEL_3:
LABEL_13:

}

+ (id)postBodyForiCSCServerUIResponseWithContext:(id)a3 recoveryError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __CFString **v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t v21[16];

  v5 = a4;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Building recovery response body", v21, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("appleid"));
  if (!v5)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("success"), CFSTR("status"));
    goto LABEL_17;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("failure"), CFSTR("status"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "code"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("errorCode"));

  objc_msgSend(v5, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKCDPFactory cdpErrorDomain](AKCDPFactory, "cdpErrorDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v14)
  {
    v15 = objc_msgSend(v5, "code");
    switch(v15)
    {
      case -5215:
        v16 = AKActionCancel;
        break;
      case -5207:
        v16 = AKICSCResponseActionStartAccountRecovery;
        break;
      case -5200:
        v16 = AKICSCResponseActionTryAgain;
        break;
      default:
        goto LABEL_15;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *v16, CFSTR("action"));
  }
LABEL_15:
  objc_msgSend(v5, "localizedFailureReason");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v5, "localizedFailureReason");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("errorMessage"));

  }
LABEL_17:
  v19 = (void *)objc_msgSend(v8, "copy");

  return v19;
}

+ (BOOL)shouldSendServerResponseForRecoveredInfo:(id)a3 withRecoveryError:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "shouldSendServerResponseForRecoveredInfo: Recovery error: %@", (uint8_t *)&v10, 0xCu);
  }

  if (v4)
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKCDPFactory cdpErrorDomain](AKCDPFactory, "cdpErrorDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
      v8 = objc_msgSend(v4, "code") == -5200 || objc_msgSend(v4, "code") == -5207 || objc_msgSend(v4, "code") == -5215;
    else
      v8 = 0;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpUiProvider, 0);
  objc_storeStrong((id *)&self->_recoveryContext, 0);
  objc_storeStrong((id *)&self->_recoveryController, 0);
}

- (void)presentNativeRecoveryUIWithCompletion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "Starting recovery using %@...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)presentNativeRecoveryUIWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 16), "authContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 16), "authContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "DSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 141558786;
  v9 = 1752392040;
  v10 = 2112;
  v11 = v5;
  v12 = 2160;
  v13 = 1752392040;
  v14 = 2112;
  v15 = v7;
  _os_log_debug_impl(&dword_19202F000, a2, OS_LOG_TYPE_DEBUG, "Starting retrieval of recovery info for appleId <%{mask.hash}@ : %{mask.hash}@>", (uint8_t *)&v8, 0x2Au);

}

void __75__AKNativeAccountRecoveryController_presentNativeRecoveryUIWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve recovery info with error. %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __82__AKNativeAccountRecoveryController_cdpContext_performSilentRecoveryTokenRenewal___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "Recovered data for context: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_mapICSCRecoveryResultsToAuthKit:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_19202F000, a1, a3, "Escrowed recovery info missing MID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)_mapICSCRecoveryResultsToAuthKit:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_19202F000, a1, a3, "Escrowed recovery info missing PRK", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

+ (void)requestForRecoveryCompletionWithContext:(os_log_t)log recoveredInfo:recoveryError:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19202F000, log, OS_LOG_TYPE_ERROR, "Failed to unwrap the icsc recovery identity token.", v1, 2u);
  OUTLINED_FUNCTION_7();
}

void __105__AKNativeAccountRecoveryController_requestForRecoveryCompletionWithContext_recoveredInfo_recoveryError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19202F000, a2, OS_LOG_TYPE_FAULT, "Unexpected recoveredValue: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
