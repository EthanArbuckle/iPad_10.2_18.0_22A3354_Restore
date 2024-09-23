@implementation AKAppleIDAuthenticationController

+ (NSSet)sensitiveAuthenticationKeys
{
  if (sensitiveAuthenticationKeys_onceToken != -1)
    dispatch_once(&sensitiveAuthenticationKeys_onceToken, &__block_literal_global_4);
  return (NSSet *)(id)sensitiveAuthenticationKeys_sensitiveAuthenticationKeys;
}

void __64__AKAppleIDAuthenticationController_sensitiveAuthenticationKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("AKPassword"), CFSTR("AKRawPassword"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sensitiveAuthenticationKeys_sensitiveAuthenticationKeys;
  sensitiveAuthenticationKeys_sensitiveAuthenticationKeys = v0;

}

+ (NSSet)sensitiveTokenKeys
{
  if (sensitiveTokenKeys_onceToken != -1)
    dispatch_once(&sensitiveTokenKeys_onceToken, &__block_literal_global_152);
  return (NSSet *)(id)sensitiveTokenKeys_sensitiveTokenKeys;
}

void __55__AKAppleIDAuthenticationController_sensitiveTokenKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("AKPasswordResetTokenKey"), CFSTR("AKShortLivedToken"), CFSTR("AKIdentityToken"), CFSTR("AKCustodianSetupToken"), CFSTR("AKInheritanceBeneficiarySetupToken"), CFSTR("GsIdmsToken"), CFSTR("token"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sensitiveTokenKeys_sensitiveTokenKeys;
  sensitiveTokenKeys_sensitiveTokenKeys = v0;

}

+ (NSSet)tokenDictionaryKeys
{
  if (tokenDictionaryKeys_onceToken != -1)
    dispatch_once(&tokenDictionaryKeys_onceToken, &__block_literal_global_153);
  return (NSSet *)(id)tokenDictionaryKeys_tokenDictionaryKeys;
}

void __56__AKAppleIDAuthenticationController_tokenDictionaryKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("AKIDMSToken"), CFSTR("t"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tokenDictionaryKeys_tokenDictionaryKeys;
  tokenDictionaryKeys_tokenDictionaryKeys = v0;

}

- (AKAppleIDAuthenticationController)init
{
  return -[AKAppleIDAuthenticationController initWithIdentifier:daemonXPCEndpoint:](self, "initWithIdentifier:daemonXPCEndpoint:", 0, 0);
}

- (AKAppleIDAuthenticationController)initWithIdentifier:(id)a3
{
  return -[AKAppleIDAuthenticationController initWithIdentifier:daemonXPCEndpoint:](self, "initWithIdentifier:daemonXPCEndpoint:", a3, 0);
}

- (AKAppleIDAuthenticationController)initWithDaemonXPCEndpoint:(id)a3
{
  return -[AKAppleIDAuthenticationController initWithIdentifier:daemonXPCEndpoint:](self, "initWithIdentifier:daemonXPCEndpoint:", 0, a3);
}

- (AKAppleIDAuthenticationController)initWithIdentifier:(id)a3 daemonXPCEndpoint:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  uint64_t v9;
  NSString *serviceID;
  AKAppleIDAuthenticationContextManager *v11;
  AKAppleIDAuthenticationContextManager *contextManager;
  NSLock *v13;
  NSLock *connectionLock;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AKAppleIDAuthenticationController;
  v8 = -[AKAppleIDAuthenticationController init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    serviceID = v8->_serviceID;
    v8->_serviceID = (NSString *)v9;

    v11 = -[AKAppleIDAuthenticationContextManager initWithAuthenticationController:]([AKAppleIDAuthenticationContextManager alloc], "initWithAuthenticationController:", v8);
    contextManager = v8->_contextManager;
    v8->_contextManager = v11;

    v13 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    connectionLock = v8->_connectionLock;
    v8->_connectionLock = v13;

    -[NSLock setName:](v8->_connectionLock, "setName:", CFSTR("AKAppleIDAuthenticationControllerXPCLock"));
    objc_storeStrong((id *)&v8->_daemonXPCEndpoint, a4);
  }

  return v8;
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

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "%@ deallocated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (AKAppleIDAuthenticationDelegate)delegate
{
  return -[AKAppleIDAuthenticationContextManager delegate](self->_contextManager, "delegate");
}

- (void)setDelegate:(id)a3
{
  -[AKAppleIDAuthenticationContextManager setDelegate:](self->_contextManager, "setDelegate:", a3);
}

- (void)authenticateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void (**v23)(id, _QWORD, uint64_t);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  os_signpost_id_t v45;
  uint64_t v46;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  _BYTE v49[14];
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[AKAppleIDAuthenticationController authenticateWithContext:completion:] requires a non-nil value for the context parameter."));
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v36 = _os_activity_create(&dword_19202F000, "authkit/authenticate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v36, &state);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _AKSignpostCreate(v8);
  v11 = v10;

  _AKSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = objc_msgSend(v6, "authenticationType", v36);
    objc_msgSend(v6, "_proxiedAppBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67240450;
    *(_DWORD *)v49 = v14;
    *(_WORD *)&v49[4] = 2114;
    *(_QWORD *)&v49[6] = v15;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AuthenticateWithContext", " AuthenticationType=%{public,signpost.telemetry:number1,name=AuthenticationType}d  ProxiedBundleID=%{public,signpost.telemetry:string1,name=ProxiedBundleID}@  enableTelemetry=YES ", buf, 0x12u);

  }
  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v6, "authenticationType");
    objc_msgSend(v6, "_proxiedAppBundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)v49 = v9;
    *(_WORD *)&v49[8] = 1026;
    *(_DWORD *)&v49[10] = v17;
    v50 = 2114;
    v51 = v18;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AuthenticateWithContext  AuthenticationType=%{public,signpost.telemetry:number1,name=AuthenticationType}d  ProxiedBundleID=%{public,signpost.telemetry:string1,name=ProxiedBundleID}@  enableTelemetry=YES ", buf, 0x1Cu);

  }
  -[AKAppleIDAuthenticationContextManager registerContext:](self->_contextManager, "registerContext:", v6);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v7 && v19)
    v7[2](v7, 0, v19);
  v21 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __72__AKAppleIDAuthenticationController_authenticateWithContext_completion___block_invoke;
  v42[3] = &unk_1E2E5E5E8;
  v42[4] = self;
  v22 = v6;
  v43 = v22;
  v45 = v9;
  v46 = v11;
  v23 = v7;
  v44 = v23;
  v24 = (void *)MEMORY[0x194022E4C](v42);
  if (self->_serviceID)
    objc_msgSend(v22, "setServiceIdentifier:");
  -[AKAppleIDAuthenticationController delegate](self, "delegate", v36);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
    objc_msgSend(v22, "set_ignoreShouldContinueProxy:", 1);
  objc_msgSend(v22, "username");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationController _serverFriendlyUsername:](self, "_serverFriendlyUsername:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUsername:", v27);

  _AKLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v22, "debugDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v49 = v29;
    _os_log_impl(&dword_19202F000, v28, OS_LOG_TYPE_DEFAULT, "Request with %@", buf, 0xCu);

  }
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v21;
  v40[1] = 3221225472;
  v40[2] = __72__AKAppleIDAuthenticationController_authenticateWithContext_completion___block_invoke_172;
  v40[3] = &unk_1E2E5E220;
  v31 = v24;
  v41 = v31;
  objc_msgSend(v30, "remoteObjectProxyWithErrorHandler:", v40);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "_sanitizedCopy");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "isContextEligibleForSilentAuth"))
  {
    if (objc_msgSend(v22, "_capabilityForUIDisplay") == 1)
    {
      _AKLogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        -[AKAppleIDAuthenticationController authenticateWithContext:completion:].cold.1();
    }
    else
    {
      _AKLogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        -[AKAppleIDAuthenticationController authenticateWithContext:completion:].cold.2();
    }

  }
  v38[0] = v21;
  v38[1] = 3221225472;
  v38[2] = __72__AKAppleIDAuthenticationController_authenticateWithContext_completion___block_invoke_174;
  v38[3] = &unk_1E2E5E248;
  v35 = v31;
  v39 = v35;
  objc_msgSend(v32, "authenticateWithContext:completion:", v33, v38);

  os_activity_scope_leave(&state);
}

void __72__AKAppleIDAuthenticationController_authenticateWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  double v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1[4] + 32), "unregisterContext:", a1[5]);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  Nanoseconds = (double)_AKSignpostGetNanoseconds(a1[7], a1[8]);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v21 = 67240192;
    LODWORD(v22) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v10, OS_SIGNPOST_INTERVAL_END, v11, "AuthenticateWithContext", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v21, 8u);
  }
  v12 = Nanoseconds / 1000000000.0;

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = a1[7];
    v15 = objc_msgSend(v6, "code");
    v21 = 134218496;
    v22 = v14;
    v23 = 2048;
    v24 = v12;
    v25 = 1026;
    v26 = v15;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AuthenticateWithContext  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v21, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("AuthenticateWithContext"));

  if (v7)
  {
    v17 = (void *)objc_msgSend(v5, "mutableCopy");
    v18 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("AKTimeSeries"));

    v19 = objc_msgSend(v17, "copy");
    v5 = (id)v19;
  }
  v20 = a1[6];
  if (v20)
    (*(void (**)(uint64_t, id, id))(v20 + 16))(v20, v5, v6);

}

void __72__AKAppleIDAuthenticationController_authenticateWithContext_completion___block_invoke_172(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AKTriageLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "Remote authentication service returned an error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__AKAppleIDAuthenticationController_authenticateWithContext_completion___block_invoke_174(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AKTriageLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Remote authentication service returned an error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "ak_redactedCopy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Remote authentication service came back with: %@", (uint8_t *)&v9, 0xCu);

    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endProximityAuthenticationForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  os_signpost_id_t v35;
  uint64_t v36;
  uint8_t buf[4];
  _BYTE v38[14];
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[AKAppleIDAuthenticationController endProximityAuthenticationForContext:completion:] requires a non-nil value for the context parameter."));
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _AKSignpostCreate(v8);
  v11 = v10;

  _AKSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = objc_msgSend(v6, "authenticationType");
    objc_msgSend(v6, "_proxiedAppBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67240450;
    *(_DWORD *)v38 = v14;
    *(_WORD *)&v38[4] = 2114;
    *(_QWORD *)&v38[6] = v15;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EndProximityAuth", " AuthenticationType=%{public,signpost.telemetry:number1,name=AuthenticationType}d  ProxiedBundleID=%{public,signpost.telemetry:string1,name=ProxiedBundleID}@  enableTelemetry=YES ", buf, 0x12u);

  }
  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v6, "authenticationType");
    objc_msgSend(v6, "_proxiedAppBundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)v38 = v9;
    *(_WORD *)&v38[8] = 1026;
    *(_DWORD *)&v38[10] = v17;
    v39 = 2114;
    v40 = v18;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: EndProximityAuth  AuthenticationType=%{public,signpost.telemetry:number1,name=AuthenticationType}d  ProxiedBundleID=%{public,signpost.telemetry:string1,name=ProxiedBundleID}@  enableTelemetry=YES ", buf, 0x1Cu);

  }
  v19 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __85__AKAppleIDAuthenticationController_endProximityAuthenticationForContext_completion___block_invoke;
  v32[3] = &unk_1E2E5E5E8;
  v32[4] = self;
  v33 = v6;
  v35 = v9;
  v36 = v11;
  v34 = v7;
  v20 = v7;
  v21 = v6;
  v22 = (void *)MEMORY[0x194022E4C](v32);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __85__AKAppleIDAuthenticationController_endProximityAuthenticationForContext_completion___block_invoke_177;
  v30[3] = &unk_1E2E5E220;
  v24 = v22;
  v31 = v24;
  objc_msgSend(v23, "remoteObjectProxyWithErrorHandler:", v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "_sanitizedCopy");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __85__AKAppleIDAuthenticationController_endProximityAuthenticationForContext_completion___block_invoke_178;
  v28[3] = &unk_1E2E5E248;
  v29 = v24;
  v27 = v24;
  objc_msgSend(v25, "endProximityAuthenticationForContext:completion:", v26, v28);

}

void __85__AKAppleIDAuthenticationController_endProximityAuthenticationForContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1[4] + 32), "unregisterContext:", a1[5]);
  Nanoseconds = _AKSignpostGetNanoseconds(a1[7], a1[8]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[7];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v16 = 67240192;
    LODWORD(v17) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "EndProximityAuth", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[7];
    v14 = objc_msgSend(v6, "code");
    v16 = 134218496;
    v17 = v13;
    v18 = 2048;
    v19 = v12;
    v20 = 1026;
    v21 = v14;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:EndProximityAuth  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);
  }

  v15 = a1[6];
  if (v15)
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);

}

void __85__AKAppleIDAuthenticationController_endProximityAuthenticationForContext_completion___block_invoke_177(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AKTriageLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "Remote authentication service returned an error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__AKAppleIDAuthenticationController_endProximityAuthenticationForContext_completion___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AKTriageLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Remote authentication service returned an error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "ak_redactedCopy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Remote authentication service came back with: %@", (uint8_t *)&v9, 0xCu);

    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAppleIDWithAltDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  os_activity_scope_state_s v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = _os_activity_create(&dword_19202F000, "authkit/set-in-use", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v9, &v16);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_179);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v18 = v8;
    v19 = 2112;
    if (v6)
      v15 = CFSTR("YES");
    v20 = v13;
    v21 = 2112;
    v22 = v15;
    _os_log_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service for altDSID %@, service %@, inUse %@.", buf, 0x20u);

  }
  objc_msgSend(v11, "setAppleIDWithAltDSID:inUse:forService:completion:", v8, v6, a5, &__block_literal_global_186);

  os_activity_scope_leave(&v16);
}

void __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

}

void __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_184(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (a2)
      v6 = CFSTR("YES");
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@.", (uint8_t *)&v7, 0x16u);
  }

}

- (void)setAppleIDWithDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  os_activity_scope_state_s v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = _os_activity_create(&dword_19202F000, "authkit/set-in-use", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v9, &v16);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_187);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v18 = v8;
    v19 = 2112;
    if (v6)
      v15 = CFSTR("YES");
    v20 = v13;
    v21 = 2112;
    v22 = v15;
    _os_log_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service for DSID %@, service %@, inUse %@.", buf, 0x20u);

  }
  objc_msgSend(v11, "setAppleIDWithDSID:inUse:forService:completion:", v8, v6, a5, &__block_literal_global_189);

  os_activity_scope_leave(&v16);
}

void __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

}

void __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_188(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (a2)
      v6 = CFSTR("YES");
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@.", (uint8_t *)&v7, 0x16u);
  }

}

- (void)fetchUserInformationForAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  os_activity_scope_state_s state;
  _QWORD v26[5];
  AKAppleIDAuthenticationController *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v8 = self;
  v27 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/fetch-user-info", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __79__AKAppleIDAuthenticationController_fetchUserInformationForAltDSID_completion___block_invoke;
  v22[3] = &unk_1E2E5E6B0;
  v24 = v26;
  v11 = v7;
  v23 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v22);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v8, "_authenticationServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __79__AKAppleIDAuthenticationController_fetchUserInformationForAltDSID_completion___block_invoke_2;
  v20[3] = &unk_1E2E5E220;
  v14 = v12;
  v21 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch user information for: %@", buf, 0xCu);
  }

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __79__AKAppleIDAuthenticationController_fetchUserInformationForAltDSID_completion___block_invoke_190;
  v18[3] = &unk_1E2E5E248;
  v17 = v14;
  v19 = v17;
  objc_msgSend(v15, "fetchUserInformationForAltDSID:completion:", v6, v18);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);

}

void __79__AKAppleIDAuthenticationController_fetchUserInformationForAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __79__AKAppleIDAuthenticationController_fetchUserInformationForAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__AKAppleIDAuthenticationController_fetchUserInformationForAltDSID_completion___block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "ak_redactedCopy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138478083;
    v10 = v8;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %{private}@. Error: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getUserInformationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/fetch-user-info-with-context", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __78__AKAppleIDAuthenticationController_getUserInformationWithContext_completion___block_invoke;
  v22[3] = &unk_1E2E5E6D8;
  v22[4] = self;
  v10 = v7;
  v23 = v10;
  v11 = (void *)MEMORY[0x194022E4C](v22);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __78__AKAppleIDAuthenticationController_getUserInformationWithContext_completion___block_invoke_2;
  v20[3] = &unk_1E2E5E220;
  v13 = v11;
  v21 = v13;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "altDSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v16;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch user information for altDSID (%@) with context: %@", buf, 0x16u);

  }
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __78__AKAppleIDAuthenticationController_getUserInformationWithContext_completion___block_invoke_192;
  v18[3] = &unk_1E2E5E700;
  v17 = v13;
  v19 = v17;
  objc_msgSend(v14, "getUserInformationWithContext:completion:", v6, v18);

  os_activity_scope_leave(&state);
}

uint64_t __78__AKAppleIDAuthenticationController_getUserInformationWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __78__AKAppleIDAuthenticationController_getUserInformationWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__AKAppleIDAuthenticationController_getUserInformationWithContext_completion___block_invoke_192(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138478083;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %{private}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getUserInformationForAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  os_activity_scope_state_s state;
  _QWORD v26[5];
  AKAppleIDAuthenticationController *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v8 = self;
  v27 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/fetch-user-info-typed", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __77__AKAppleIDAuthenticationController_getUserInformationForAltDSID_completion___block_invoke;
  v22[3] = &unk_1E2E5E728;
  v24 = v26;
  v11 = v7;
  v23 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v22);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v8, "_authenticationServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __77__AKAppleIDAuthenticationController_getUserInformationForAltDSID_completion___block_invoke_2;
  v20[3] = &unk_1E2E5E220;
  v14 = v12;
  v21 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch user information for: %@", buf, 0xCu);
  }

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __77__AKAppleIDAuthenticationController_getUserInformationForAltDSID_completion___block_invoke_193;
  v18[3] = &unk_1E2E5E700;
  v17 = v14;
  v19 = v17;
  objc_msgSend(v15, "getUserInformationForAltDSID:completion:", v6, v18);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);

}

void __77__AKAppleIDAuthenticationController_getUserInformationForAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __77__AKAppleIDAuthenticationController_getUserInformationForAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__AKAppleIDAuthenticationController_getUserInformationForAltDSID_completion___block_invoke_193(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138478083;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %{private}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateUserInformationForAltDSID:(id)a3 userInformation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AKAppleIDAuthenticationController *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  os_activity_scope_state_s state;
  _QWORD v29[5];
  AKAppleIDAuthenticationController *v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  v11 = self;
  v30 = v11;
  v12 = _os_activity_create(&dword_19202F000, "authkit/update-user-info", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __96__AKAppleIDAuthenticationController_updateUserInformationForAltDSID_userInformation_completion___block_invoke;
  v25[3] = &unk_1E2E5E750;
  v27 = v29;
  v14 = v10;
  v26 = v14;
  v15 = (void *)MEMORY[0x194022E4C](v25);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v11, "_authenticationServiceConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __96__AKAppleIDAuthenticationController_updateUserInformationForAltDSID_userInformation_completion___block_invoke_2;
  v23[3] = &unk_1E2E5E220;
  v17 = v15;
  v24 = v17;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    _os_log_impl(&dword_19202F000, v19, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to update user information for: %@", buf, 0xCu);
  }

  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __96__AKAppleIDAuthenticationController_updateUserInformationForAltDSID_userInformation_completion___block_invoke_194;
  v21[3] = &unk_1E2E5E778;
  v20 = v17;
  v22 = v20;
  objc_msgSend(v18, "updateUserInformationForAltDSID:userInformation:completion:", v8, v9, v21);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v29, 8);

}

void __96__AKAppleIDAuthenticationController_updateUserInformationForAltDSID_userInformation_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __96__AKAppleIDAuthenticationController_updateUserInformationForAltDSID_userInformation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__AKAppleIDAuthenticationController_updateUserInformationForAltDSID_userInformation_completion___block_invoke_194(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Result of remote call: %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAuthModeWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  os_activity_scope_state_s state;
  _QWORD v27[5];
  AKAppleIDAuthenticationController *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  v8 = self;
  v28 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/fetch-auth-mode", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __73__AKAppleIDAuthenticationController_fetchAuthModeWithContext_completion___block_invoke;
  v23[3] = &unk_1E2E5E7A0;
  v25 = v27;
  v11 = v7;
  v24 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v23);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v8, "_authenticationServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __73__AKAppleIDAuthenticationController_fetchAuthModeWithContext_completion___block_invoke_2;
  v21[3] = &unk_1E2E5E220;
  v14 = v12;
  v22 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "username");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v17;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch auth mode for: %@", buf, 0xCu);

  }
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __73__AKAppleIDAuthenticationController_fetchAuthModeWithContext_completion___block_invoke_196;
  v19[3] = &unk_1E2E5E7C8;
  v18 = v14;
  v20 = v18;
  objc_msgSend(v15, "fetchAuthModeWithContext:completion:", v6, v19);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v27, 8);

}

void __73__AKAppleIDAuthenticationController_fetchAuthModeWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __73__AKAppleIDAuthenticationController_fetchAuthModeWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__AKAppleIDAuthenticationController_fetchAuthModeWithContext_completion___block_invoke_196(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = a2;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Result of remote call: %lu. Error: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchDeviceListWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__AKAppleIDAuthenticationController_fetchDeviceListWithContext_completion___block_invoke;
  v8[3] = &unk_1E2E5E7F0;
  v9 = v6;
  v7 = v6;
  -[AKAppleIDAuthenticationController deviceListWithContext:completion:](self, "deviceListWithContext:completion:", a3, v8);

}

void __75__AKAppleIDAuthenticationController_fetchDeviceListWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    objc_msgSend(a2, "deviceList");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (void)deviceListWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKAppleIDAuthenticationController *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  AKAppleIDAuthenticationController *v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/fetch-device-list", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  v9 = self;
  v10 = MEMORY[0x1E0C809B0];
  v26 = v9;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __70__AKAppleIDAuthenticationController_deviceListWithContext_completion___block_invoke;
  v22[3] = &unk_1E2E5E818;
  v24 = v25;
  v11 = v7;
  v23 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v22);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v9, "_authenticationServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __70__AKAppleIDAuthenticationController_deviceListWithContext_completion___block_invoke_2;
  v20[3] = &unk_1E2E5E220;
  v14 = v12;
  v21 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v6;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch device list information for: %{public}@", buf, 0xCu);
  }

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __70__AKAppleIDAuthenticationController_deviceListWithContext_completion___block_invoke_198;
  v18[3] = &unk_1E2E5E7F0;
  v17 = v14;
  v19 = v17;
  objc_msgSend(v15, "deviceListWithContext:completion:", v6, v18);

  _Block_object_dispose(v25, 8);
  os_activity_scope_leave(&state);

}

void __70__AKAppleIDAuthenticationController_deviceListWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __70__AKAppleIDAuthenticationController_deviceListWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__AKAppleIDAuthenticationController_deviceListWithContext_completion___block_invoke_198(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)deviceListWithContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19202F000, "authkit/fetch-device-list", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__AKAppleIDAuthenticationController_deviceListWithContext_error___block_invoke;
  v21[3] = &unk_1E2E5E840;
  v21[4] = &v28;
  v21[5] = &v22;
  v9 = (void *)MEMORY[0x194022E4C](v21);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __65__AKAppleIDAuthenticationController_deviceListWithContext_error___block_invoke_2;
  v19[3] = &unk_1E2E5E220;
  v11 = v9;
  v20 = v11;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v6;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch device list information for: %{public}@", buf, 0xCu);
  }

  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __65__AKAppleIDAuthenticationController_deviceListWithContext_error___block_invoke_199;
  v17[3] = &unk_1E2E5E7F0;
  v14 = v11;
  v18 = v14;
  objc_msgSend(v12, "deviceListWithContext:completion:", v6, v17);
  if (a4)
    *a4 = objc_retainAutorelease((id)v29[5]);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  os_activity_scope_leave(&state);
  return v15;
}

void __65__AKAppleIDAuthenticationController_deviceListWithContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __65__AKAppleIDAuthenticationController_deviceListWithContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__AKAppleIDAuthenticationController_deviceListWithContext_error___block_invoke_199(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fetchAuthorizedAppListWithContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19202F000, "authkit/fetch-app-list", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__AKAppleIDAuthenticationController_fetchAuthorizedAppListWithContext_error___block_invoke;
  v15[3] = &unk_1E2E5E868;
  v15[4] = &v16;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v6;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch app list information for: %@", buf, 0xCu);
  }

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __77__AKAppleIDAuthenticationController_fetchAuthorizedAppListWithContext_error___block_invoke_200;
  v14[3] = &unk_1E2E5E890;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v10, "fetchAppListWithAltDSID:completion:", v6, v14);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v12 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  os_activity_scope_leave(&state);
  return v12;
}

void __77__AKAppleIDAuthenticationController_fetchAuthorizedAppListWithContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __77__AKAppleIDAuthenticationController_fetchAuthorizedAppListWithContext_error___block_invoke_200(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@", (uint8_t *)&v13, 0x16u);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

- (BOOL)deleteAuthorizationDatabaseWithAltDSID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  char v12;
  _QWORD v14[6];
  uint8_t buf[8];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = _os_activity_create(&dword_19202F000, "authkit/delete-authorization-list", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__AKAppleIDAuthenticationController_deleteAuthorizationDatabaseWithAltDSID_error___block_invoke;
  v16[3] = &unk_1E2E5E868;
  v16[4] = &v21;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to wipe authorization database", buf, 2u);
  }

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __82__AKAppleIDAuthenticationController_deleteAuthorizationDatabaseWithAltDSID_error___block_invoke_202;
  v14[3] = &unk_1E2E5E8B8;
  v14[4] = &v21;
  v14[5] = &v17;
  objc_msgSend(v10, "deleteAuthorizationDatabaseWithAltDSID:completion:", v6, v14);
  if (a4)
    *a4 = objc_retainAutorelease((id)v22[5]);
  v12 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  os_activity_scope_leave(&state);
  return v12;
}

void __82__AKAppleIDAuthenticationController_deleteAuthorizationDatabaseWithAltDSID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __82__AKAppleIDAuthenticationController_deleteAuthorizationDatabaseWithAltDSID_error___block_invoke_202(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)performSilentTTRFor:(unint64_t)a3 completion:(id)a4
{
  id v6;
  AKAppleIDAuthenticationController *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  os_signpost_id_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD *v33;
  os_activity_scope_state_s state;
  _QWORD v35[5];
  AKAppleIDAuthenticationController *v36;
  uint8_t buf[4];
  os_signpost_id_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy_;
  v35[4] = __Block_byref_object_dispose_;
  v7 = self;
  v36 = v7;
  v8 = _os_activity_create(&dword_19202F000, "authkit/silent-TTR", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke;
  v31[3] = &unk_1E2E5E750;
  v33 = v35;
  v10 = v6;
  v32 = v10;
  v11 = (void *)MEMORY[0x194022E4C](v31);
  _AKSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = _AKSignpostCreate(v12);
  v15 = v14;

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "TriggerSilentTTR", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v38 = v13;
    _os_log_impl(&dword_19202F000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TriggerSilentTTR  enableTelemetry=YES ", buf, 0xCu);
  }

  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v7, "_authenticationServiceConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_203;
  v27[3] = &unk_1E2E5E8E0;
  v29 = v13;
  v30 = v15;
  v20 = v11;
  v28 = v20;
  objc_msgSend(v19, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_204;
  v23[3] = &unk_1E2E5E908;
  v25 = v13;
  v26 = v15;
  v22 = v20;
  v24 = v22;
  objc_msgSend(v21, "performSilentTTRFor:completion:", a3, v23);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v35, 8);

}

void __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_203(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v6, OS_SIGNPOST_INTERVAL_END, v7, "TriggerSilentTTR", (const char *)&unk_192100ADF, (uint8_t *)&v11, 2u);
  }

  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[5];
    v11 = 134218240;
    v12 = v9;
    v13 = 2048;
    v14 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:TriggerSilentTTR ", (uint8_t *)&v11, 0x16u);
  }

  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(a1[4] + 16))();
}

void __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_204(_QWORD *a1, int a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "TriggerSilentTTR", (const char *)&unk_192100ADF, (uint8_t *)&v21, 2u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[5];
    v21 = 134218240;
    v22 = v11;
    v23 = 2048;
    v24 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:TriggerSilentTTR ", (uint8_t *)&v21, 0x16u);
  }

  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a2)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_204_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_204_cold_2();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (BOOL)revokeAuthorizationForApplicationWithClientID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19202F000, "authkit/revoke-authorization", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__AKAppleIDAuthenticationController_revokeAuthorizationForApplicationWithClientID_error___block_invoke;
  v15[3] = &unk_1E2E5E868;
  v15[4] = &v20;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to revoke authorization for clientID: %@", buf, 0xCu);
  }

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __89__AKAppleIDAuthenticationController_revokeAuthorizationForApplicationWithClientID_error___block_invoke_205;
  v14[3] = &unk_1E2E5E8B8;
  v14[4] = &v20;
  v14[5] = &v16;
  objc_msgSend(v10, "revokeAuthorizationForApplicationWithClientID:completion:", v6, v14);
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v12 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  os_activity_scope_leave(&state);
  return v12;
}

void __89__AKAppleIDAuthenticationController_revokeAuthorizationForApplicationWithClientID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __89__AKAppleIDAuthenticationController_revokeAuthorizationForApplicationWithClientID_error___block_invoke_205(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)warmUpVerificationSessionWithCompletion:(id)a3
{
  id v4;
  AKAppleIDAuthenticationController *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[8];
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  os_activity_scope_state_s state;
  _QWORD v24[5];
  AKAppleIDAuthenticationController *v25;

  v4 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  v5 = self;
  v25 = v5;
  v6 = _os_activity_create(&dword_19202F000, "authkit/satori-warmup", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77__AKAppleIDAuthenticationController_warmUpVerificationSessionWithCompletion___block_invoke;
  v20[3] = &unk_1E2E5E750;
  v22 = v24;
  v8 = v4;
  v21 = v8;
  v9 = (void *)MEMORY[0x194022E4C](v20);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v5, "_authenticationServiceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __77__AKAppleIDAuthenticationController_warmUpVerificationSessionWithCompletion___block_invoke_2;
  v18[3] = &unk_1E2E5E220;
  v11 = v9;
  v19 = v11;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to warmup verification session", buf, 2u);
  }

  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __77__AKAppleIDAuthenticationController_warmUpVerificationSessionWithCompletion___block_invoke_206;
  v15[3] = &unk_1E2E5E778;
  v14 = v11;
  v16 = v14;
  objc_msgSend(v12, "warmUpVerificationSessionWithCompletion:", v15);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v24, 8);

}

void __77__AKAppleIDAuthenticationController_warmUpVerificationSessionWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __77__AKAppleIDAuthenticationController_warmUpVerificationSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__AKAppleIDAuthenticationController_warmUpVerificationSessionWithCompletion___block_invoke_206(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "WarmUp Session completed...", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setConfigurationInfo:(id)a3 forIdentifier:(id)a4 forAltDSID:(id)a5 completion:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  id v13;
  AKAppleIDAuthenticationController *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  const __CFString *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  os_activity_scope_state_s state;
  _QWORD v33[5];
  AKAppleIDAuthenticationController *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  v13 = a6;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy_;
  v33[4] = __Block_byref_object_dispose_;
  v14 = self;
  v34 = v14;
  v15 = _os_activity_create(&dword_19202F000, "authkit/set-configuration-info", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __94__AKAppleIDAuthenticationController_setConfigurationInfo_forIdentifier_forAltDSID_completion___block_invoke;
  v29[3] = &unk_1E2E5E750;
  v31 = v33;
  v17 = v13;
  v30 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v29);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v14, "_authenticationServiceConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __94__AKAppleIDAuthenticationController_setConfigurationInfo_forIdentifier_forAltDSID_completion___block_invoke_2;
  v27[3] = &unk_1E2E5E220;
  v20 = v18;
  v28 = v20;
  objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = CFSTR("(null)");
    if (v11)
      v23 = v11;
    *(_DWORD *)buf = 138412546;
    v36 = v10;
    v37 = 2112;
    v38 = v23;
    _os_log_impl(&dword_19202F000, v22, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to set: %@ for identifier: %@.", buf, 0x16u);
  }

  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __94__AKAppleIDAuthenticationController_setConfigurationInfo_forIdentifier_forAltDSID_completion___block_invoke_209;
  v25[3] = &unk_1E2E5E778;
  v24 = v20;
  v26 = v24;
  objc_msgSend(v21, "setConfigurationInfo:forIdentifier:forAltDSID:completion:", v10, v11, v12, v25);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v33, 8);

}

void __94__AKAppleIDAuthenticationController_setConfigurationInfo_forIdentifier_forAltDSID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __94__AKAppleIDAuthenticationController_setConfigurationInfo_forIdentifier_forAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__AKAppleIDAuthenticationController_setConfigurationInfo_forIdentifier_forAltDSID_completion___block_invoke_209(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)configurationInfoWithIdentifiers:(id)a3 forAltDSID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AKAppleIDAuthenticationController *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  os_activity_scope_state_s state;
  _QWORD v29[5];
  AKAppleIDAuthenticationController *v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  v11 = self;
  v30 = v11;
  v12 = _os_activity_create(&dword_19202F000, "authkit/fetch-configuration-info", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __92__AKAppleIDAuthenticationController_configurationInfoWithIdentifiers_forAltDSID_completion___block_invoke;
  v25[3] = &unk_1E2E5E6B0;
  v27 = v29;
  v14 = v10;
  v26 = v14;
  v15 = (void *)MEMORY[0x194022E4C](v25);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v11, "_authenticationServiceConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __92__AKAppleIDAuthenticationController_configurationInfoWithIdentifiers_forAltDSID_completion___block_invoke_2;
  v23[3] = &unk_1E2E5E220;
  v17 = v15;
  v24 = v17;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    _os_log_impl(&dword_19202F000, v19, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch configuration for identifiers: %@.", buf, 0xCu);
  }

  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __92__AKAppleIDAuthenticationController_configurationInfoWithIdentifiers_forAltDSID_completion___block_invoke_210;
  v21[3] = &unk_1E2E5E248;
  v20 = v17;
  v22 = v20;
  objc_msgSend(v18, "configurationInfoWithIdentifiers:forAltDSID:completion:", v8, v9, v21);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v29, 8);

}

void __92__AKAppleIDAuthenticationController_configurationInfoWithIdentifiers_forAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __92__AKAppleIDAuthenticationController_configurationInfoWithIdentifiers_forAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__AKAppleIDAuthenticationController_configurationInfoWithIdentifiers_forAltDSID_completion___block_invoke_210(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138478083;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %{private}@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkSecurityUpgradeEligibilityForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  os_activity_scope_state_s state;
  _QWORD v25[5];
  AKAppleIDAuthenticationController *v26;

  v6 = a3;
  v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  v8 = self;
  v26 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/check-upgrade-eligibility", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __90__AKAppleIDAuthenticationController_checkSecurityUpgradeEligibilityForContext_completion___block_invoke;
  v21[3] = &unk_1E2E5E750;
  v23 = v25;
  v11 = v7;
  v22 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v21);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v8, "_authenticationServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __90__AKAppleIDAuthenticationController_checkSecurityUpgradeEligibilityForContext_completion___block_invoke_2;
  v19[3] = &unk_1E2E5E220;
  v14 = v12;
  v20 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __90__AKAppleIDAuthenticationController_checkSecurityUpgradeEligibilityForContext_completion___block_invoke_211;
  v17[3] = &unk_1E2E5E778;
  v16 = v14;
  v18 = v16;
  objc_msgSend(v15, "checkSecurityUpgradeEligibilityForContext:completion:", v6, v17);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);

}

void __90__AKAppleIDAuthenticationController_checkSecurityUpgradeEligibilityForContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __90__AKAppleIDAuthenticationController_checkSecurityUpgradeEligibilityForContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__AKAppleIDAuthenticationController_checkSecurityUpgradeEligibilityForContext_completion___block_invoke_211(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "HSA 2 eligibility check came back with result: %@ and error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateLoginCodeWithCompletion:(id)a3
{
  id v4;
  AKAppleIDAuthenticationController *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  os_activity_scope_state_s state;
  _QWORD v22[5];
  AKAppleIDAuthenticationController *v23;

  v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v5 = self;
  v23 = v5;
  v6 = _os_activity_create(&dword_19202F000, "authkit/generate-login-code", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__AKAppleIDAuthenticationController_generateLoginCodeWithCompletion___block_invoke;
  v18[3] = &unk_1E2E5E930;
  v20 = v22;
  v8 = v4;
  v19 = v8;
  v9 = (void *)MEMORY[0x194022E4C](v18);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v5, "_authenticationServiceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __69__AKAppleIDAuthenticationController_generateLoginCodeWithCompletion___block_invoke_2;
  v16[3] = &unk_1E2E5E220;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __69__AKAppleIDAuthenticationController_generateLoginCodeWithCompletion___block_invoke_213;
  v14[3] = &unk_1E2E5E958;
  v13 = v11;
  v15 = v13;
  objc_msgSend(v12, "generateLoginCodeWithCompletion:", v14);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v22, 8);

}

void __69__AKAppleIDAuthenticationController_generateLoginCodeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __69__AKAppleIDAuthenticationController_generateLoginCodeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__AKAppleIDAuthenticationController_generateLoginCodeWithCompletion___block_invoke_213(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Generated code: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)validateLoginCode:(unint64_t)a3 forAppleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  AKAppleIDAuthenticationController *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  os_activity_scope_state_s state;
  _QWORD v27[5];
  AKAppleIDAuthenticationController *v28;

  v8 = a4;
  v9 = a5;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  v10 = self;
  v28 = v10;
  v11 = _os_activity_create(&dword_19202F000, "authkit/validate-login-code", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __77__AKAppleIDAuthenticationController_validateLoginCode_forAppleID_completion___block_invoke;
  v23[3] = &unk_1E2E5E750;
  v25 = v27;
  v13 = v9;
  v24 = v13;
  v14 = (void *)MEMORY[0x194022E4C](v23);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v10, "_authenticationServiceConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __77__AKAppleIDAuthenticationController_validateLoginCode_forAppleID_completion___block_invoke_2;
  v21[3] = &unk_1E2E5E220;
  v16 = v14;
  v22 = v16;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __77__AKAppleIDAuthenticationController_validateLoginCode_forAppleID_completion___block_invoke_214;
  v19[3] = &unk_1E2E5E778;
  v18 = v16;
  v20 = v18;
  objc_msgSend(v17, "validateLoginCode:forAppleID:withCompletion:", a3, v8, v19);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v27, 8);

}

void __77__AKAppleIDAuthenticationController_validateLoginCode_forAppleID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __77__AKAppleIDAuthenticationController_validateLoginCode_forAppleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__AKAppleIDAuthenticationController_validateLoginCode_forAppleID_completion___block_invoke_214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performCircleRequestWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  os_activity_scope_state_s state;
  _QWORD v25[5];
  AKAppleIDAuthenticationController *v26;

  v6 = a3;
  v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  v8 = self;
  v26 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/perform-circle-request", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__AKAppleIDAuthenticationController_performCircleRequestWithContext_completion___block_invoke;
  v21[3] = &unk_1E2E5E980;
  v23 = v25;
  v11 = v7;
  v22 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v21);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v8, "_authenticationServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __80__AKAppleIDAuthenticationController_performCircleRequestWithContext_completion___block_invoke_2;
  v19[3] = &unk_1E2E5E220;
  v14 = v12;
  v20 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __80__AKAppleIDAuthenticationController_performCircleRequestWithContext_completion___block_invoke_216;
  v17[3] = &unk_1E2E5E9A8;
  v16 = v14;
  v18 = v16;
  objc_msgSend(v15, "performCircleRequestWithContext:completion:", v6, v17);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);

}

void __80__AKAppleIDAuthenticationController_performCircleRequestWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __80__AKAppleIDAuthenticationController_performCircleRequestWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__AKAppleIDAuthenticationController_performCircleRequestWithContext_completion___block_invoke_216(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performCheckInForAccountWithAltDSID:(id)a3 completion:(id)a4
{
  -[AKAppleIDAuthenticationController performCheckInForAccountWithAltDSID:event:completion:](self, "performCheckInForAccountWithAltDSID:event:completion:", a3, CFSTR("liveness"), a4);
}

- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  AKAppleIDAuthenticationController *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  _QWORD v32[5];
  AKAppleIDAuthenticationController *v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = _os_activity_create(&dword_19202F000, "authkit/check-in", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  v14 = self;
  v15 = MEMORY[0x1E0C809B0];
  v33 = v14;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke;
  v29[3] = &unk_1E2E5E9D0;
  v31 = v32;
  v16 = v12;
  v30 = v16;
  v17 = (void *)MEMORY[0x194022E4C](v29);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v14, "_authenticationServiceConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_2;
  v27[3] = &unk_1E2E5E220;
  v19 = v17;
  v28 = v19;
  objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v10;
    v37 = 2048;
    v38 = a5;
    _os_log_impl(&dword_19202F000, v21, OS_LOG_TYPE_DEFAULT, "Calling remote authentication service to perform check-in for altDSID: %@ with reason: %lu", buf, 0x16u);
  }

  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_217;
  v24[3] = &unk_1E2E5E9F8;
  v22 = v10;
  v25 = v22;
  v23 = v19;
  v26 = v23;
  objc_msgSend(v20, "performCheckInForAccountWithAltDSID:event:reason:completion:", v22, v11, a5, v24);

  _Block_object_dispose(v32, 8);
  os_activity_scope_leave(&state);

}

void __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_217(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "Remote call to peform check-in for account with altDSID (%@) returned", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_217_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  AKAppleIDAuthenticationController *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  AKAppleIDAuthenticationController *v31;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_19202F000, "authkit/check-in", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy_;
  v30[4] = __Block_byref_object_dispose_;
  v12 = self;
  v13 = MEMORY[0x1E0C809B0];
  v31 = v12;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __90__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_completion___block_invoke;
  v27[3] = &unk_1E2E5E9D0;
  v29 = v30;
  v14 = v10;
  v28 = v14;
  v15 = (void *)MEMORY[0x194022E4C](v27);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v12, "_authenticationServiceConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __90__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_completion___block_invoke_2;
  v25[3] = &unk_1E2E5E220;
  v17 = v15;
  v26 = v17;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v8;
    _os_log_impl(&dword_19202F000, v19, OS_LOG_TYPE_DEFAULT, "Calling remote authentication service to perform check-in for altDSID: %@", buf, 0xCu);
  }

  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __90__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_completion___block_invoke_218;
  v22[3] = &unk_1E2E5E9F8;
  v20 = v8;
  v23 = v20;
  v21 = v17;
  v24 = v21;
  objc_msgSend(v18, "performCheckInForAccountWithAltDSID:event:completion:", v20, v9, v22);

  _Block_object_dispose(v30, 8);
  os_activity_scope_leave(&state);

}

void __90__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __90__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_completion___block_invoke_218(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "Remote call to peform check-in for account with altDSID (%@) returned", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_217_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)reportSignOutForAppleID:(id)a3 service:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  AKAppleIDAuthenticationController *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  os_activity_scope_state_s state;
  _QWORD v27[5];
  AKAppleIDAuthenticationController *v28;

  v8 = a3;
  v9 = a5;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  v10 = self;
  v28 = v10;
  v11 = _os_activity_create(&dword_19202F000, "authkit/report-sign-out", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__AKAppleIDAuthenticationController_reportSignOutForAppleID_service_completion___block_invoke;
  v23[3] = &unk_1E2E5E750;
  v25 = v27;
  v13 = v9;
  v24 = v13;
  v14 = (void *)MEMORY[0x194022E4C](v23);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v10, "_authenticationServiceConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __80__AKAppleIDAuthenticationController_reportSignOutForAppleID_service_completion___block_invoke_2;
  v21[3] = &unk_1E2E5E220;
  v16 = v14;
  v22 = v16;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __80__AKAppleIDAuthenticationController_reportSignOutForAppleID_service_completion___block_invoke_219;
  v19[3] = &unk_1E2E5E778;
  v18 = v16;
  v20 = v18;
  objc_msgSend(v17, "reportSignOutForAppleID:service:completion:", v8, a4, v19);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v27, 8);

}

void __80__AKAppleIDAuthenticationController_reportSignOutForAppleID_service_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __80__AKAppleIDAuthenticationController_reportSignOutForAppleID_service_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__AKAppleIDAuthenticationController_reportSignOutForAppleID_service_completion___block_invoke_219(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reportSignOutForAllAppleIDsWithCompletion:(id)a3
{
  id v4;
  AKAppleIDAuthenticationController *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  os_activity_scope_state_s state;
  _QWORD v23[5];
  AKAppleIDAuthenticationController *v24;

  v4 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v5 = self;
  v24 = v5;
  v6 = _os_activity_create(&dword_19202F000, "authkit/report-sign-out-all", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__AKAppleIDAuthenticationController_reportSignOutForAllAppleIDsWithCompletion___block_invoke;
  v19[3] = &unk_1E2E5E750;
  v21 = v23;
  v8 = v4;
  v20 = v8;
  v9 = (void *)MEMORY[0x194022E4C](v19);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v5, "_authenticationServiceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __79__AKAppleIDAuthenticationController_reportSignOutForAllAppleIDsWithCompletion___block_invoke_2;
  v16[3] = &unk_1E2E5E9D0;
  v18 = v23;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __79__AKAppleIDAuthenticationController_reportSignOutForAllAppleIDsWithCompletion___block_invoke_220;
  v14[3] = &unk_1E2E5E778;
  v13 = v11;
  v15 = v13;
  objc_msgSend(v12, "reportSignOutForAllAppleIDsWithCompletion:", v14);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v23, 8);

}

void __79__AKAppleIDAuthenticationController_reportSignOutForAllAppleIDsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __79__AKAppleIDAuthenticationController_reportSignOutForAllAppleIDsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__AKAppleIDAuthenticationController_reportSignOutForAllAppleIDsWithCompletion___block_invoke_220(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AKAppleIDAuthenticationController *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  os_activity_scope_state_s state;
  _QWORD v29[5];
  AKAppleIDAuthenticationController *v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  v11 = self;
  v30 = v11;
  v12 = _os_activity_create(&dword_19202F000, "authkit/update-state-with-response", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forContext_completion___block_invoke;
  v25[3] = &unk_1E2E5E750;
  v27 = v29;
  v14 = v10;
  v26 = v14;
  v15 = (void *)MEMORY[0x194022E4C](v25);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v11, "_authenticationServiceConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forContext_completion___block_invoke_2;
  v23[3] = &unk_1E2E5E220;
  v17 = v15;
  v24 = v17;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v9;
    v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_19202F000, v19, OS_LOG_TYPE_DEFAULT, "Asking akd to update state for %@ with auth response: %@", buf, 0x16u);
  }

  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forContext_completion___block_invoke_221;
  v21[3] = &unk_1E2E5E778;
  v20 = v17;
  v22 = v20;
  objc_msgSend(v18, "updateStateWithExternalAuthenticationResponse:forContext:completion:", v8, v9, v21);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v29, 8);

}

void __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forContext_completion___block_invoke_221(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Result of updating auth state: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forAppleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AKAppleIDAuthenticationController *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  os_activity_scope_state_s state;
  _QWORD v29[5];
  AKAppleIDAuthenticationController *v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  v11 = self;
  v30 = v11;
  v12 = _os_activity_create(&dword_19202F000, "authkit/update-state-with-response", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forAppleID_completion___block_invoke;
  v25[3] = &unk_1E2E5E750;
  v27 = v29;
  v14 = v10;
  v26 = v14;
  v15 = (void *)MEMORY[0x194022E4C](v25);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v11, "_authenticationServiceConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forAppleID_completion___block_invoke_2;
  v23[3] = &unk_1E2E5E220;
  v17 = v15;
  v24 = v17;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v9;
    v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_19202F000, v19, OS_LOG_TYPE_DEFAULT, "Asking akd to update state for %@ with auth response: %@", buf, 0x16u);
  }

  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forAppleID_completion___block_invoke_222;
  v21[3] = &unk_1E2E5E778;
  v20 = v17;
  v22 = v20;
  objc_msgSend(v18, "updateStateWithExternalAuthenticationResponse:forAppleID:completion:", v8, v9, v21);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v29, 8);

}

void __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forAppleID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forAppleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__AKAppleIDAuthenticationController_updateStateWithExternalAuthenticationResponse_forAppleID_completion___block_invoke_222(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Result of updating auth state: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isDevicePasscodeProtected:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x3032000000;
  v19[2] = __Block_byref_object_copy_;
  v19[3] = __Block_byref_object_dispose_;
  v20 = 0;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__AKAppleIDAuthenticationController_isDevicePasscodeProtected___block_invoke;
  v17[3] = &unk_1E2E5E868;
  v17[4] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __63__AKAppleIDAuthenticationController_isDevicePasscodeProtected___block_invoke_2;
  v16[3] = &unk_1E2E5E8B8;
  v16[4] = &v21;
  v16[5] = &v18;
  objc_msgSend(v6, "isDevicePasscodeProtected:", v16);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(v19[0] + 40));
  if (*(_QWORD *)(v19[0] + 40))
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationController isDevicePasscodeProtected:].cold.1((uint64_t)v19, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v21, 8);
  return v14;
}

void __63__AKAppleIDAuthenticationController_isDevicePasscodeProtected___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__AKAppleIDAuthenticationController_isDevicePasscodeProtected___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (id)activeLoginCode:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x3032000000;
  v19[2] = __Block_byref_object_copy_;
  v19[3] = __Block_byref_object_dispose_;
  v20 = 0;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__AKAppleIDAuthenticationController_activeLoginCode___block_invoke;
  v17[3] = &unk_1E2E5E868;
  v17[4] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __53__AKAppleIDAuthenticationController_activeLoginCode___block_invoke_2;
  v16[3] = &unk_1E2E5EA20;
  v16[4] = &v21;
  v16[5] = &v18;
  objc_msgSend(v6, "activeLoginCode:", v16);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(v19[0] + 40));
  if (*(_QWORD *)(v19[0] + 40))
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationController activeLoginCode:].cold.1((uint64_t)v19, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = (id)v22[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v21, 8);

  return v14;
}

void __53__AKAppleIDAuthenticationController_activeLoginCode___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __53__AKAppleIDAuthenticationController_activeLoginCode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)getServerUILoadDelegateForAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  os_signpost_id_t v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  _QWORD v35[5];
  AKAppleIDAuthenticationController *v36;
  uint8_t buf[4];
  os_signpost_id_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy_;
  v35[4] = __Block_byref_object_dispose_;
  v8 = self;
  v36 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/fetch-load-delegate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = _AKSignpostCreate(v10);
  v13 = v12;

  _AKSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FetchServerLoadDelegate", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v38 = v11;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchServerLoadDelegate  enableTelemetry=YES ", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __82__AKAppleIDAuthenticationController_getServerUILoadDelegateForAltDSID_completion___block_invoke;
  v29[3] = &unk_1E2E5EA48;
  v32 = v11;
  v33 = v13;
  v31 = v35;
  v18 = v7;
  v30 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v29);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v8, "_authenticationServiceConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __82__AKAppleIDAuthenticationController_getServerUILoadDelegateForAltDSID_completion___block_invoke_225;
  v27[3] = &unk_1E2E5E220;
  v21 = v19;
  v28 = v21;
  objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = (os_signpost_id_t)v6;
    _os_log_impl(&dword_19202F000, v23, OS_LOG_TYPE_DEFAULT, "Asking akd for AKAppleIDServerResourceLoadDelegate for altDSID %@", buf, 0xCu);
  }

  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __82__AKAppleIDAuthenticationController_getServerUILoadDelegateForAltDSID_completion___block_invoke_226;
  v25[3] = &unk_1E2E5EA70;
  v24 = v21;
  v26 = v24;
  objc_msgSend(v22, "getServerUILoadDelegateForAltDSID:completion:", v6, v25);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v35, 8);

}

void __82__AKAppleIDAuthenticationController_getServerUILoadDelegateForAltDSID_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "FetchServerLoadDelegate", (const char *)&unk_192100ADF, (uint8_t *)&v16, 2u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[6];
    v16 = 134218240;
    v17 = v12;
    v18 = 2048;
    v19 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchServerLoadDelegate ", (uint8_t *)&v16, 0x16u);
  }

  v13 = *(_QWORD *)(a1[5] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

  v15 = a1[4];
  if (v15)
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);

}

void __82__AKAppleIDAuthenticationController_getServerUILoadDelegateForAltDSID_completion___block_invoke_225(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__AKAppleIDAuthenticationController_getServerUILoadDelegateForAltDSID_completion___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Result of getting AKAppleIDServerResourceLoadDelegate: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getServerUILoadDelegateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  os_signpost_id_t v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  _QWORD v35[5];
  AKAppleIDAuthenticationController *v36;
  uint8_t buf[4];
  os_signpost_id_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy_;
  v35[4] = __Block_byref_object_dispose_;
  v8 = self;
  v36 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/fetch-load-delegate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = _AKSignpostCreate(v10);
  v13 = v12;

  _AKSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FetchServerLoadDelegate", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v38 = v11;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchServerLoadDelegate  enableTelemetry=YES ", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __83__AKAppleIDAuthenticationController_getServerUILoadDelegateWithContext_completion___block_invoke;
  v29[3] = &unk_1E2E5EA48;
  v32 = v11;
  v33 = v13;
  v31 = v35;
  v18 = v7;
  v30 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v29);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v8, "_authenticationServiceConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __83__AKAppleIDAuthenticationController_getServerUILoadDelegateWithContext_completion___block_invoke_227;
  v27[3] = &unk_1E2E5E220;
  v21 = v19;
  v28 = v21;
  objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = (os_signpost_id_t)v6;
    _os_log_impl(&dword_19202F000, v23, OS_LOG_TYPE_DEFAULT, "Asking akd for AKAppleIDServerResourceLoadDelegate for context %@", buf, 0xCu);
  }

  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __83__AKAppleIDAuthenticationController_getServerUILoadDelegateWithContext_completion___block_invoke_228;
  v25[3] = &unk_1E2E5EA70;
  v24 = v21;
  v26 = v24;
  objc_msgSend(v22, "getServerUILoadDelegateWithContext:completion:", v6, v25);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v35, 8);

}

void __83__AKAppleIDAuthenticationController_getServerUILoadDelegateWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "FetchServerLoadDelegate", (const char *)&unk_192100ADF, (uint8_t *)&v16, 2u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[6];
    v16 = 134218240;
    v17 = v12;
    v18 = 2048;
    v19 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchServerLoadDelegate ", (uint8_t *)&v16, 0x16u);
  }

  v13 = *(_QWORD *)(a1[5] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

  v15 = a1[4];
  if (v15)
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);

}

void __83__AKAppleIDAuthenticationController_getServerUILoadDelegateWithContext_completion___block_invoke_227(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__AKAppleIDAuthenticationController_getServerUILoadDelegateWithContext_completion___block_invoke_228(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Result of getting AKAppleIDServerResourceLoadDelegate: %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)synchronizeFollowUpItemsForContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  uint64_t v15;
  BOOL v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  os_activity_scope_state_s state;
  uint8_t v25[4];
  const __CFString *v26;
  __int16 v27;
  uint64_t v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19202F000, "authkit/sync-follow-up-items", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Synchronizing follow ups for altDSID: %@", (uint8_t *)&buf, 0xCu);

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_error___block_invoke;
  v19[3] = &unk_1E2E5E868;
  v19[4] = &buf;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __78__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_error___block_invoke_2;
  v18[3] = &unk_1E2E5E8B8;
  v18[4] = &v20;
  v18[5] = &buf;
  objc_msgSend(v12, "synchronizeFollowUpItemsForContext:completion:", v6, v18);
  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  _AKLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v21 + 24))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v25 = 138412546;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "Synchronized follow ups %@ with error %@", v25, 0x16u);
  }

  v16 = *((_BYTE *)v21 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v16;
}

void __78__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __78__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)synchronizeFollowUpItemsForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  os_activity_scope_state_s state;
  _QWORD v25[5];
  AKAppleIDAuthenticationController *v26;

  v6 = a3;
  v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  v8 = self;
  v26 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/sync-follow-up-items", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke;
  v21[3] = &unk_1E2E5E750;
  v23 = v25;
  v11 = v7;
  v22 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v21);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v8, "_authenticationServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke_2;
  v19[3] = &unk_1E2E5E220;
  v14 = v12;
  v20 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke_229;
  v17[3] = &unk_1E2E5E778;
  v16 = v14;
  v18 = v16;
  objc_msgSend(v15, "synchronizeFollowUpItemsForContext:completion:", v6, v17);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);

}

void __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke_229(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Synchronized follow ups %@ with error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  os_activity_scope_state_s state;
  _QWORD v26[5];
  AKAppleIDAuthenticationController *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v8 = self;
  v27 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/followup-teardown", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke;
  v22[3] = &unk_1E2E5E750;
  v24 = v26;
  v11 = v7;
  v23 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v22);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v8, "_authenticationServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke_2;
  v20[3] = &unk_1E2E5E220;
  v14 = v12;
  v21 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Asking akd to teardown: %@", buf, 0xCu);
  }

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke_230;
  v18[3] = &unk_1E2E5E778;
  v17 = v14;
  v19 = v17;
  objc_msgSend(v15, "teardownFollowUpWithContext:completion:", v6, v18);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);

}

void __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke_230(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke_230_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)renewRecoveryTokenWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  os_activity_scope_state_s state;
  _QWORD v26[5];
  AKAppleIDAuthenticationController *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v8 = self;
  v27 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/renew-recovery-token", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke;
  v22[3] = &unk_1E2E5E6B0;
  v24 = v26;
  v11 = v7;
  v23 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v22);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v8, "_authenticationServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke_2;
  v20[3] = &unk_1E2E5E220;
  v14 = v12;
  v21 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Asking akd to fetch a new recovery token token with info: %@", buf, 0xCu);
  }

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke_231;
  v18[3] = &unk_1E2E5E248;
  v17 = v14;
  v19 = v17;
  objc_msgSend(v15, "renewRecoveryTokenWithContext:completion:", v6, v18);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);

}

void __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke_231_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)verifyMasterKey:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AKAppleIDAuthenticationController *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  os_activity_scope_state_s state;
  _QWORD v29[5];
  AKAppleIDAuthenticationController *v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  v11 = self;
  v30 = v11;
  v12 = _os_activity_create(&dword_19202F000, "authkit/verify-master-key", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke;
  v25[3] = &unk_1E2E5E6B0;
  v27 = v29;
  v14 = v10;
  v26 = v14;
  v15 = (void *)MEMORY[0x194022E4C](v25);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v11, "_authenticationServiceConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke_2;
  v23[3] = &unk_1E2E5E220;
  v17 = v15;
  v24 = v17;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v9;
    _os_log_impl(&dword_19202F000, v19, OS_LOG_TYPE_DEFAULT, "Asking akd to verify master key with info: %@", buf, 0xCu);
  }

  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke_232;
  v21[3] = &unk_1E2E5E248;
  v20 = v17;
  v22 = v20;
  objc_msgSend(v18, "verifyMasterKey:withContext:completion:", v8, v9, v21);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v29, 8);

}

void __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke_232(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke_232_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)persistMasterKeyVerifier:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AKPersistRecoveryKeyContext *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(AKPersistRecoveryKeyContext);
  -[AKPersistRecoveryKeyContext setVerifier:](v11, "setVerifier:", v10);

  -[AKPersistRecoveryKeyContext setKeyType:](v11, "setKeyType:", 0);
  -[AKAppleIDAuthenticationController persistRecoveryKeyWithContext:authContext:completion:](self, "persistRecoveryKeyWithContext:authContext:completion:", v11, v9, v8);

}

- (void)persistRecoveryKeyWithContext:(id)a3 authContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AKAppleIDAuthenticationController *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  os_activity_scope_state_s state;
  _QWORD v29[5];
  AKAppleIDAuthenticationController *v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  v11 = self;
  v30 = v11;
  v12 = _os_activity_create(&dword_19202F000, "authkit/persist-recovery-key", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke;
  v25[3] = &unk_1E2E5E750;
  v27 = v29;
  v14 = v10;
  v26 = v14;
  v15 = (void *)MEMORY[0x194022E4C](v25);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v11, "_authenticationServiceConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke_2;
  v23[3] = &unk_1E2E5E220;
  v17 = v15;
  v24 = v17;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v8;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_19202F000, v19, OS_LOG_TYPE_DEFAULT, "Asking akd to persist recovery key with persistKeyContext: %@, authContext:%@", buf, 0x16u);
  }

  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke_234;
  v21[3] = &unk_1E2E5E778;
  v20 = v17;
  v22 = v20;
  objc_msgSend(v18, "persistRecoveryKeyWithContext:authContext:completion:", v8, v9, v21);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v29, 8);

}

void __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke_234(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke_234_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)validateVettingToken:(id)a3 forAltDSID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AKAppleIDAuthenticationController *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  AKAppleIDAuthenticationController *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD *v34;
  os_activity_scope_state_s state;
  _QWORD v36[5];
  AKAppleIDAuthenticationController *v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy_;
  v36[4] = __Block_byref_object_dispose_;
  v11 = self;
  v37 = v11;
  v12 = _os_activity_create(&dword_19202F000, "authkit/validate-vetting-token", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v13 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke;
  v32[3] = &unk_1E2E5E750;
  v34 = v36;
  v14 = v10;
  v33 = v14;
  v15 = (void *)MEMORY[0x194022E4C](v32);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v11, "_authenticationServiceConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v13;
  v30[1] = 3221225472;
  v30[2] = __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_2;
  v30[3] = &unk_1E2E5E220;
  v17 = v15;
  v31 = v17;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v39 = v8;
    v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_19202F000, v19, OS_LOG_TYPE_DEFAULT, "Asking akd to validate vetting token %@ for altDSID: %@", buf, 0x16u);
  }

  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_235;
  v24[3] = &unk_1E2E5EAC0;
  v20 = v9;
  v25 = v20;
  v26 = v11;
  v21 = v17;
  v29 = v21;
  v22 = v18;
  v27 = v22;
  v23 = v8;
  v28 = v23;
  objc_msgSend(v22, "validateVettingToken:forAltDSID:completion:", v23, v20, v24);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v36, 8);

}

void __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_235(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  AKAppleIDAuthenticationContext *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", CFSTR("AKAuthenticationError")) & 1) != 0)
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == -7058)
      {
        _AKLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "Vetting-token validation failed due to expired master token. Attempting to re-auth...", buf, 2u);
        }

        v10 = objc_alloc_init(AKAppleIDAuthenticationContext);
        objc_msgSend(v6, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AKUsername"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAppleIDAuthenticationContext setUsername:](v10, "setUsername:", v12);

        -[AKAppleIDAuthenticationContext setAltDSID:](v10, "setAltDSID:", *(_QWORD *)(a1 + 32));
        -[AKAppleIDAuthenticationContext setIsUsernameEditable:](v10, "setIsUsernameEditable:", 0);
        -[AKAppleIDAuthenticationContext _setProxyingForApp:](v10, "_setProxyingForApp:", 1);
        v13 = *(void **)(a1 + 40);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_237;
        v16[3] = &unk_1E2E5EA98;
        v20 = *(id *)(a1 + 64);
        v17 = *(id *)(a1 + 48);
        v18 = *(id *)(a1 + 56);
        v19 = *(id *)(a1 + 32);
        objc_msgSend(v13, "authenticateWithContext:completion:", v10, v16);

        goto LABEL_13;
      }
    }
    else
    {

    }
  }
  _AKLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("NO");
    if (a2)
      v15 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v22 = v15;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "Result: Is token valid? %@. Error: %@", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_13:

}

void __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_237(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_237_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Master token should be fresh now. Reattempting vetting token-validation...", buf, 2u);
    }

    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_238;
    v10[3] = &unk_1E2E5E778;
    v9 = *(_QWORD *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v7, "validateVettingToken:forAltDSID:completion:", v8, v9, v10);

  }
}

void __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_238(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Result afer reauth: Is token valid? %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)isCreateAppleIDAllowedWithCompletion:(id)a3
{
  id v4;
  AKAppleIDAuthenticationController *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  os_activity_scope_state_s state;
  _QWORD v22[5];
  AKAppleIDAuthenticationController *v23;

  v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v5 = self;
  v23 = v5;
  v6 = _os_activity_create(&dword_19202F000, "authkit/create-appleid-allowed", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke;
  v18[3] = &unk_1E2E5E750;
  v20 = v22;
  v8 = v4;
  v19 = v8;
  v9 = (void *)MEMORY[0x194022E4C](v18);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v5, "_authenticationServiceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke_239;
  v16[3] = &unk_1E2E5E220;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke_240;
  v14[3] = &unk_1E2E5E778;
  v13 = v11;
  v15 = v13;
  objc_msgSend(v12, "isCreateAppleIDAllowedWithCompletion:", v14);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v22, 8);

}

void __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  if (v5)
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke_cold_1();

  }
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (a2)
      v10 = CFSTR("YES");
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "Allow create AppleID is determined to be - %@", (uint8_t *)&v11, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke_239(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke_240(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)accountNamesForAltDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_241);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke_242;
  v9[3] = &unk_1E2E5EB08;
  v9[4] = &v10;
  objc_msgSend(v6, "accountNamesForAltDSID:completion:", v4, v9);
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1();

}

void __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke_242(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke_242_cold_2();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke_242_cold_1();

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = v5;
    v8 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

}

- (void)fetchURLBagForAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAppleIDAuthenticationController *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[8];
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  os_activity_scope_state_s state;
  _QWORD v27[5];
  AKAppleIDAuthenticationController *v28;

  v6 = a3;
  v7 = a4;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  v8 = self;
  v28 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/fetch-url-bag", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __70__AKAppleIDAuthenticationController_fetchURLBagForAltDSID_completion___block_invoke;
  v23[3] = &unk_1E2E5E6B0;
  v25 = v27;
  v11 = v7;
  v24 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v23);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v8, "_authenticationServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __70__AKAppleIDAuthenticationController_fetchURLBagForAltDSID_completion___block_invoke_2;
  v21[3] = &unk_1E2E5E220;
  v14 = v12;
  v22 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to url bag", buf, 2u);
  }

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __70__AKAppleIDAuthenticationController_fetchURLBagForAltDSID_completion___block_invoke_244;
  v18[3] = &unk_1E2E5E248;
  v17 = v14;
  v19 = v17;
  objc_msgSend(v15, "fetchURLBagForAltDSID:completion:", v6, v18);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v27, 8);

}

void __70__AKAppleIDAuthenticationController_fetchURLBagForAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __70__AKAppleIDAuthenticationController_fetchURLBagForAltDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__AKAppleIDAuthenticationController_fetchURLBagForAltDSID_completion___block_invoke_244(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetching URL bag. Error: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_urlBagFromCache:(BOOL)a3 altDSID:(id)a4 withError:(id *)a5
{
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[6];
  uint8_t buf[8];
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  os_activity_scope_state_s state;

  v5 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/fetch-url-bag", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy_;
  v18[4] = __Block_byref_object_dispose_;
  v19 = 0;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__AKAppleIDAuthenticationController__urlBagFromCache_altDSID_withError___block_invoke;
  v17[3] = &unk_1E2E5E868;
  v17[4] = v18;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEFAULT, "Synchronously calling out to remote auth service to url bag", buf, 2u);
  }

  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __72__AKAppleIDAuthenticationController__urlBagFromCache_altDSID_withError___block_invoke_245;
  v15[3] = &unk_1E2E5EB30;
  v15[4] = &v20;
  v15[5] = v18;
  objc_msgSend(v11, "fetchURLBagFromCache:altDSID:completion:", v5, v7, v15);
  v13 = (id)v21[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  os_activity_scope_leave(&state);
  return v13;
}

void __72__AKAppleIDAuthenticationController__urlBagFromCache_altDSID_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __72__AKAppleIDAuthenticationController__urlBagFromCache_altDSID_withError___block_invoke_245(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetching URL bag. Error: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

- (void)forceURLBagUpdateForAltDSID:(id)a3 urlSwitchData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AKAppleIDAuthenticationController *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  os_activity_scope_state_s state;
  _QWORD v31[5];
  AKAppleIDAuthenticationController *v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  v11 = self;
  v32 = v11;
  v12 = _os_activity_create(&dword_19202F000, "authkit/urlbag-update", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __90__AKAppleIDAuthenticationController_forceURLBagUpdateForAltDSID_urlSwitchData_completion___block_invoke;
  v27[3] = &unk_1E2E5E750;
  v29 = v31;
  v14 = v10;
  v28 = v14;
  v15 = (void *)MEMORY[0x194022E4C](v27);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v11, "_authenticationServiceConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __90__AKAppleIDAuthenticationController_forceURLBagUpdateForAltDSID_urlSwitchData_completion___block_invoke_2;
  v25[3] = &unk_1E2E5E220;
  v17 = v15;
  v26 = v17;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v8;
    _os_log_impl(&dword_19202F000, v19, OS_LOG_TYPE_DEFAULT, "Synchronously calling out to remote auth service to force update URL Bag for altDSID: %@", buf, 0xCu);
  }

  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __90__AKAppleIDAuthenticationController_forceURLBagUpdateForAltDSID_urlSwitchData_completion___block_invoke_246;
  v22[3] = &unk_1E2E5EB58;
  v20 = v8;
  v23 = v20;
  v21 = v17;
  v24 = v21;
  objc_msgSend(v18, "forceURLBagUpdateForAltDSID:urlSwitchData:completion:", v20, v9, v22);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v31, 8);

}

void __90__AKAppleIDAuthenticationController_forceURLBagUpdateForAltDSID_urlSwitchData_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __90__AKAppleIDAuthenticationController_forceURLBagUpdateForAltDSID_urlSwitchData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__AKAppleIDAuthenticationController_forceURLBagUpdateForAltDSID_urlSwitchData_completion___block_invoke_246(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412802;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_19202F000, v6, OS_LOG_TYPE_DEFAULT, "Finished updating urlbag update for AltDSID: %@ with result: %d error:%@", (uint8_t *)&v8, 0x1Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_authenticationServiceConnection
{
  NSXPCConnection *authenticationServiceConnection;
  NSXPCListenerEndpoint *daemonXPCEndpoint;
  id v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  void *v11;
  NSXPCConnection *v12;
  uint64_t v13;
  NSXPCConnection *v14;
  NSXPCConnection *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  -[NSLock lock](self->_connectionLock, "lock");
  authenticationServiceConnection = self->_authenticationServiceConnection;
  if (!authenticationServiceConnection)
  {
    daemonXPCEndpoint = self->_daemonXPCEndpoint;
    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    if (daemonXPCEndpoint)
      v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithListenerEndpoint:", self->_daemonXPCEndpoint);
    else
      v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", CFSTR("com.apple.ak.auth.xpc"), 0);
    v7 = self->_authenticationServiceConnection;
    self->_authenticationServiceConnection = v6;

    v8 = self->_authenticationServiceConnection;
    +[AKAppleIDAuthenticationDaemonInterface XPCInterface](AKAppleIDAuthenticationDaemonInterface, "XPCInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_authenticationServiceConnection, "setExportedObject:", self->_contextManager);
    v10 = self->_authenticationServiceConnection;
    +[AKAppleIDAuthenticationClientInterface XPCInterface](AKAppleIDAuthenticationClientInterface, "XPCInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v10, "setExportedInterface:", v11);

    objc_initWeak(&location, self);
    v12 = self->_authenticationServiceConnection;
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__AKAppleIDAuthenticationController__authenticationServiceConnection__block_invoke;
    v19[3] = &unk_1E2E5E1F8;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInterruptionHandler:](v12, "setInterruptionHandler:", v19);
    v14 = self->_authenticationServiceConnection;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __69__AKAppleIDAuthenticationController__authenticationServiceConnection__block_invoke_250;
    v17[3] = &unk_1E2E5E1F8;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", v17);
    -[NSXPCConnection resume](self->_authenticationServiceConnection, "resume");
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    authenticationServiceConnection = self->_authenticationServiceConnection;
  }
  v15 = authenticationServiceConnection;
  -[NSLock unlock](self->_connectionLock, "unlock");
  return v15;
}

void __69__AKAppleIDAuthenticationController__authenticationServiceConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __69__AKAppleIDAuthenticationController__authenticationServiceConnection__block_invoke_cold_1();

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[5], "lock");
    objc_msgSend(v4[3], "invalidate");
    v5 = v4[3];
    v4[3] = 0;

    objc_msgSend(v4[5], "unlock");
  }

}

void __69__AKAppleIDAuthenticationController__authenticationServiceConnection__block_invoke_250(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  __int16 v6[8];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 0;
    _os_log_impl(&dword_19202F000, v2, OS_LOG_TYPE_DEFAULT, "Connection to akd was invalidated.", (uint8_t *)v6, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[5], "lock");
    v5 = v4[3];
    v4[3] = 0;

    objc_msgSend(v4[5], "unlock");
  }

}

- (void)clearSessionCacheWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  AKAppleIDAuthenticationController *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  AKAppleIDAuthenticationController *v19;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19202F000, "authkit/clear-session-cache", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy_;
  v18[4] = __Block_byref_object_dispose_;
  v6 = self;
  v7 = MEMORY[0x1E0C809B0];
  v19 = v6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__AKAppleIDAuthenticationController_clearSessionCacheWithCompletion___block_invoke;
  v15[3] = &unk_1E2E5E750;
  v17 = v18;
  v8 = v4;
  v16 = v8;
  v9 = (void *)MEMORY[0x194022E4C](v15);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v6, "_authenticationServiceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __69__AKAppleIDAuthenticationController_clearSessionCacheWithCompletion___block_invoke_2;
  v13[3] = &unk_1E2E5E220;
  v11 = v9;
  v14 = v11;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "clearSessionCacheWithCompletion:", v11);
  _Block_object_dispose(v18, 8);

  os_activity_scope_leave(&state);
}

void __69__AKAppleIDAuthenticationController_clearSessionCacheWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;
  v6 = a3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__AKAppleIDAuthenticationController_clearSessionCacheWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__AKAppleIDAuthenticationController_clearSessionCacheWithCompletion___block_invoke_2_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchGlobalConfigurationUsingPolicy:(unint64_t)a3 completion:(id)a4
{
  id v6;
  AKAppleIDAuthenticationController *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[8];
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  os_activity_scope_state_s state;
  _QWORD v26[5];
  AKAppleIDAuthenticationController *v27;

  v6 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v7 = self;
  v27 = v7;
  v8 = _os_activity_create(&dword_19202F000, "authkit/fetch-global-config", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __84__AKAppleIDAuthenticationController_fetchGlobalConfigurationUsingPolicy_completion___block_invoke;
  v22[3] = &unk_1E2E5E6B0;
  v24 = v26;
  v10 = v6;
  v23 = v10;
  v11 = (void *)MEMORY[0x194022E4C](v22);
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](v7, "_authenticationServiceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __84__AKAppleIDAuthenticationController_fetchGlobalConfigurationUsingPolicy_completion___block_invoke_2;
  v20[3] = &unk_1E2E5E220;
  v13 = v11;
  v21 = v13;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service for global config", buf, 2u);
  }

  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __84__AKAppleIDAuthenticationController_fetchGlobalConfigurationUsingPolicy_completion___block_invoke_251;
  v17[3] = &unk_1E2E5E248;
  v16 = v13;
  v18 = v16;
  objc_msgSend(v14, "fetchGlobalConfigurationUsingPolicy:completion:", a3, v17);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);

}

void __84__AKAppleIDAuthenticationController_fetchGlobalConfigurationUsingPolicy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __84__AKAppleIDAuthenticationController_fetchGlobalConfigurationUsingPolicy_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__AKAppleIDAuthenticationController_fetchGlobalConfigurationUsingPolicy_completion___block_invoke_251(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetching global config. Error: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performPasswordResetWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__AKAppleIDAuthenticationController_performPasswordResetWithContext_completion___block_invoke;
  v21[3] = &unk_1E2E5E248;
  v22 = v7;
  v9 = v7;
  v10 = (void *)MEMORY[0x194022E4C](v21);
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v12;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Request with %@", buf, 0xCu);

  }
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __80__AKAppleIDAuthenticationController_performPasswordResetWithContext_completion___block_invoke_252;
  v19[3] = &unk_1E2E5E220;
  v14 = v10;
  v20 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __80__AKAppleIDAuthenticationController_performPasswordResetWithContext_completion___block_invoke_253;
  v17[3] = &unk_1E2E5E248;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "performPasswordResetWithContext:completion:", v6, v17);

}

uint64_t __80__AKAppleIDAuthenticationController_performPasswordResetWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __80__AKAppleIDAuthenticationController_performPasswordResetWithContext_completion___block_invoke_252(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __80__AKAppleIDAuthenticationController_performPasswordResetWithContext_completion___block_invoke_253(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "ak_redactedCopy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Remote authentication service came back with: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (void)deleteDeviceListCacheWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke;
  v16[3] = &unk_1E2E5E220;
  v10 = v7;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationController deleteDeviceListCacheWithContext:completion:].cold.1();

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke_254;
  v14[3] = &unk_1E2E5E778;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "deleteDeviceListCacheWithContext:completion:", v6, v14);

}

void __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke_254(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke_254_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)deleteDeviceListCacheWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__AKAppleIDAuthenticationController_deleteDeviceListCacheWithCompletion___block_invoke;
  v13[3] = &unk_1E2E5E220;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationController deleteDeviceListCacheWithCompletion:].cold.1();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __73__AKAppleIDAuthenticationController_deleteDeviceListCacheWithCompletion___block_invoke_255;
  v11[3] = &unk_1E2E5E778;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "deleteDeviceListCacheWithCompletion:", v11);

}

void __73__AKAppleIDAuthenticationController_deleteDeviceListCacheWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __73__AKAppleIDAuthenticationController_deleteDeviceListCacheWithCompletion___block_invoke_255(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke_254_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)fetchTokensWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__AKAppleIDAuthenticationController_fetchTokensWithAltDSID_tokenIdentifiers_completion___block_invoke;
  v19[3] = &unk_1E2E5E220;
  v13 = v8;
  v20 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationController fetchTokensWithAltDSID:tokenIdentifiers:completion:].cold.1();

  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __88__AKAppleIDAuthenticationController_fetchTokensWithAltDSID_tokenIdentifiers_completion___block_invoke_256;
  v17[3] = &unk_1E2E5E248;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v14, "fetchTokensWithAltDSID:tokenIdentifiers:completion:", v10, v9, v17);

}

void __88__AKAppleIDAuthenticationController_fetchTokensWithAltDSID_tokenIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __88__AKAppleIDAuthenticationController_fetchTokensWithAltDSID_tokenIdentifiers_completion___block_invoke_256(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __88__AKAppleIDAuthenticationController_fetchTokensWithAltDSID_tokenIdentifiers_completion___block_invoke_256_cold_1();

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)deleteTokensFromCacheWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __98__AKAppleIDAuthenticationController_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion___block_invoke;
  v19[3] = &unk_1E2E5E220;
  v13 = v8;
  v20 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationController deleteTokensFromCacheWithAltDSID:tokenIdentifiers:completion:].cold.1();

  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __98__AKAppleIDAuthenticationController_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion___block_invoke_257;
  v17[3] = &unk_1E2E5E778;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v14, "deleteTokensFromCacheWithAltDSID:tokenIdentifiers:completion:", v10, v9, v17);

}

void __98__AKAppleIDAuthenticationController_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __98__AKAppleIDAuthenticationController_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion___block_invoke_257(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __98__AKAppleIDAuthenticationController_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion___block_invoke_257_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (id)_serverFriendlyUsername:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length") && (objc_msgSend(v3, "containsString:", CFSTR("@")) & 1) == 0)
  {
    if (AAAFoundationSwiftLibraryCore())
      getAAFPhoneNumberFormatterClass();
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "normalizedFormatFor:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (void)fetchBirthdayForAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  -[AKAppleIDAuthenticationController _authenticationServiceConnection](self, "_authenticationServiceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__AKAppleIDAuthenticationController_fetchBirthdayForAltDSID_completion___block_invoke;
  v16[3] = &unk_1E2E5E220;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationController fetchTokensWithAltDSID:tokenIdentifiers:completion:].cold.1();

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __72__AKAppleIDAuthenticationController_fetchBirthdayForAltDSID_completion___block_invoke_260;
  v14[3] = &unk_1E2E5EB80;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "fetchBirthdayForAltDSID:completion:", v7, v14);

}

void __72__AKAppleIDAuthenticationController_fetchBirthdayForAltDSID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, 0, 0, v3);

}

uint64_t __72__AKAppleIDAuthenticationController_fetchBirthdayForAltDSID_completion___block_invoke_260(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)deallocHandler
{
  return self->_deallocHandler;
}

- (void)setDeallocHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocHandler, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_contextManager, 0);
  objc_storeStrong((id *)&self->_authenticationServiceConnection, 0);
  objc_storeStrong((id *)&self->_daemonXPCEndpoint, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
}

- (void)authenticateWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_19202F000, v0, v1, "Interactive authentication requested by background daemon, client error, AKAppleIDAuthenticationTypeSilentPreferred should be used", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)authenticateWithContext:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_19202F000, v0, v1, "Interactive authentication requested by UI context, please investigate why silent auth could not be used", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __76__AKAppleIDAuthenticationController_setAppleIDWithAltDSID_inUse_forService___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Remote authentication service returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Remote authentication service returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_204_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a1, a3, "Remote Auth Service SilentTTR returned success: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __68__AKAppleIDAuthenticationController_performSilentTTRFor_completion___block_invoke_204_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Remote Auth Service SilentTTR returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __97__AKAppleIDAuthenticationController_performCheckInForAccountWithAltDSID_event_reason_completion___block_invoke_217_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to perform check-in: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isDevicePasscodeProtected:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "Failed to get passcode state with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)activeLoginCode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "Failed to get active code with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __83__AKAppleIDAuthenticationController_synchronizeFollowUpItemsForContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to synchronize follow ups due to xpc error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__AKAppleIDAuthenticationController_teardownFollowUpWithContext_completion___block_invoke_230_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Completed teardown request; Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__AKAppleIDAuthenticationController_renewRecoveryTokenWithContext_completion___block_invoke_231_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to renew recovery token: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __72__AKAppleIDAuthenticationController_verifyMasterKey_context_completion___block_invoke_232_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to verify master key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__AKAppleIDAuthenticationController_persistRecoveryKeyWithContext_authContext_completion___block_invoke_234_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to persist recovery key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __80__AKAppleIDAuthenticationController_validateVettingToken_forAltDSID_completion___block_invoke_237_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Unable to refresh expired master token for vetting-token validation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKAppleIDAuthenticationController_isCreateAppleIDAllowedWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Error getting create Apple ID state - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke_242_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Account name list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__AKAppleIDAuthenticationController_accountNamesForAltDSID___block_invoke_242_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to get account name list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__AKAppleIDAuthenticationController__authenticationServiceConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Connection to akd was interrupted!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __69__AKAppleIDAuthenticationController_clearSessionCacheWithCompletion___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[AKAppleIDAuthenticationController clearSessionCacheWithCompletion:]_block_invoke_2";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Connection to session remote service '%s' returned an error: %@", (uint8_t *)&v4, 0x16u);

}

- (void)deleteDeviceListCacheWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Calling out to remote auth service to delete device list cache information for: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __81__AKAppleIDAuthenticationController_deleteDeviceListCacheWithContext_completion___block_invoke_254_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19202F000, v0, v1, "Result of remote call status: %d and error: %@");
  OUTLINED_FUNCTION_1();
}

- (void)deleteDeviceListCacheWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Calling out to remote auth service to delete device list cache information", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)fetchTokensWithAltDSID:tokenIdentifiers:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Calling out to remote auth service to fetch tokens", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __88__AKAppleIDAuthenticationController_fetchTokensWithAltDSID_tokenIdentifiers_completion___block_invoke_256_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_19202F000, v1, OS_LOG_TYPE_DEBUG, "Result of fetch tokens remote call data: %@ and error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)deleteTokensFromCacheWithAltDSID:tokenIdentifiers:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Calling out to remote auth service to delete tokens", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __98__AKAppleIDAuthenticationController_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion___block_invoke_257_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19202F000, v0, v1, "Result of delete tokens remote call result: %d and error: %@");
  OUTLINED_FUNCTION_1();
}

@end
