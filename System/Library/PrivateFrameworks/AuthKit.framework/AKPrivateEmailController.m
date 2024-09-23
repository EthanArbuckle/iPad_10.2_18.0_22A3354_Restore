@implementation AKPrivateEmailController

- (AKPrivateEmailController)init
{
  void *v3;
  void *v4;
  AKPrivateEmailController *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC8]), "initWithServiceName:remoteProtocol:exportedProtocol:options:", CFSTR("com.apple.ak.privateemail.xpc"), &unk_1EE259908, &unk_1EE267360, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC0]), "initWithRemoteServiceConfig:delegate:", v3, self);
  v5 = -[AKPrivateEmailController initWithXPCSession:](self, "initWithXPCSession:", v4);

  return v5;
}

- (AKPrivateEmailController)initWithXPCSession:(id)a3
{
  id v5;
  AKPrivateEmailController *v6;
  AKPrivateEmailClientImpl *v7;
  AKPrivateEmailClientImpl *clientImpl;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKPrivateEmailController;
  v6 = -[AKPrivateEmailController init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AKPrivateEmailClientImpl);
    clientImpl = v6->_clientImpl;
    v6->_clientImpl = v7;

    objc_storeStrong((id *)&v6->_remoteService, a3);
    -[AAFXPCSession resume](v6->_remoteService, "resume");
  }

  return v6;
}

- (void)configureRemoteInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_lookupPrivateEmailForAltDSID_withKey_completion_, 0, 1);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_registerPrivateEmailForAltDSID_withKey_completion_, 0, 1);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_registerPrivateEmailWithContext_completion_, 0, 1);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_listAllPrivateEmailsForAltDSID_completion_, 0, 1);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_fetchSignInWithApplePrivateEmailWithContext_completion_, 0, 1);

}

- (id)exportedObject
{
  return self->_clientImpl;
}

- (AKPrivateEmailUIProvider)uiProvider
{
  return -[AKPrivateEmailClientImpl uiProvider](self->_clientImpl, "uiProvider");
}

- (void)setUiProvider:(id)a3
{
  -[AKPrivateEmailClientImpl setUiProvider:](self->_clientImpl, "setUiProvider:", a3);
}

- (void)lookupPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AKPrivateEmailContext *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[AKPrivateEmailContext initWithKey:altDSID:]([AKPrivateEmailContext alloc], "initWithKey:altDSID:", v9, v10);

  -[AKPrivateEmailController lookupPrivateEmailWithContext:completion:](self, "lookupPrivateEmailWithContext:completion:", v11, v8);
}

- (void)lookupPrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKPrivateEmailController *v8;
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
  AAFXPCSession *remoteService;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  os_signpost_id_t v28;
  uint64_t v29;
  os_activity_scope_state_s state;
  _QWORD v31[5];
  AKPrivateEmailController *v32;
  uint8_t buf[4];
  os_signpost_id_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__7;
  v31[4] = __Block_byref_object_dispose__7;
  v8 = self;
  v32 = v8;
  v9 = _os_activity_create(&dword_19202F000, "private-email-authkit/lookup-email", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PrivateEmailLocalLookup", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = v11;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailLocalLookup  enableTelemetry=YES ", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __69__AKPrivateEmailController_lookupPrivateEmailWithContext_completion___block_invoke;
  v25[3] = &unk_1E2E60470;
  v27 = v31;
  v28 = v11;
  v29 = v13;
  v18 = v7;
  v26 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v25);
  remoteService = v8->_remoteService;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __69__AKPrivateEmailController_lookupPrivateEmailWithContext_completion___block_invoke_92;
  v23[3] = &unk_1E2E5E220;
  v21 = v19;
  v24 = v21;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lookupPrivateEmailWithContext:completion:", v6, v21);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v31, 8);

}

void __69__AKPrivateEmailController_lookupPrivateEmailWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  double v14;
  void *v15;
  int v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v18 = 67240192;
    LODWORD(v19) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailLocalLookup", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)Nanoseconds / 1000000000.0;
    v15 = (void *)a1[6];
    v16 = objc_msgSend(v6, "code");
    v18 = 134218496;
    v19 = v15;
    v20 = 2048;
    v21 = v14;
    v22 = 1026;
    v23 = v16;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailLocalLookup  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  if (a1[4])
  {
    _AKLogHme();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_19202F000, v17, OS_LOG_TYPE_DEFAULT, "Completed Private Email lookup, error:%@", (uint8_t *)&v18, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __69__AKPrivateEmailController_lookupPrivateEmailWithContext_completion___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogHme();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__AKPrivateEmailController_lookupPrivateEmailWithContext_completion___block_invoke_92_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AKPrivateEmailController *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  AAFXPCSession *remoteService;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  os_signpost_id_t v31;
  uint64_t v32;
  os_activity_scope_state_s state;
  _QWORD v34[5];
  AKPrivateEmailController *v35;
  uint8_t buf[4];
  os_signpost_id_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__7;
  v34[4] = __Block_byref_object_dispose__7;
  v11 = self;
  v35 = v11;
  v12 = _os_activity_create(&dword_19202F000, "private-email-authkit/fetch-email", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = _AKSignpostCreate(v13);
  v16 = v15;

  _AKSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PrivateEmailRemoteFetch", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v37 = v14;
    _os_log_impl(&dword_19202F000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailRemoteFetch  enableTelemetry=YES ", buf, 0xCu);
  }

  v20 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __75__AKPrivateEmailController_fetchPrivateEmailForAltDSID_withKey_completion___block_invoke;
  v28[3] = &unk_1E2E60470;
  v30 = v34;
  v31 = v14;
  v32 = v16;
  v21 = v10;
  v29 = v21;
  v22 = (void *)MEMORY[0x194022E4C](v28);
  remoteService = v11->_remoteService;
  v26[0] = v20;
  v26[1] = 3221225472;
  v26[2] = __75__AKPrivateEmailController_fetchPrivateEmailForAltDSID_withKey_completion___block_invoke_94;
  v26[3] = &unk_1E2E5E220;
  v24 = v22;
  v27 = v24;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fetchPrivateEmailForAltDSID:withKey:completion:", v8, v9, v24);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v34, 8);

}

void __75__AKPrivateEmailController_fetchPrivateEmailForAltDSID_withKey_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  double v14;
  void *v15;
  int v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v18 = 67240192;
    LODWORD(v19) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailRemoteFetch", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)Nanoseconds / 1000000000.0;
    v15 = (void *)a1[6];
    v16 = objc_msgSend(v6, "code");
    v18 = 134218496;
    v19 = v15;
    v20 = 2048;
    v21 = v14;
    v22 = 1026;
    v23 = v16;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailRemoteFetch  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  if (a1[4])
  {
    _AKLogHme();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_19202F000, v17, OS_LOG_TYPE_DEFAULT, "Completed Private Email fetch, error:%@", (uint8_t *)&v18, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __75__AKPrivateEmailController_fetchPrivateEmailForAltDSID_withKey_completion___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogHme();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__AKPrivateEmailController_fetchPrivateEmailForAltDSID_withKey_completion___block_invoke_94_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerPrivateEmailForAltDSID:(id)a3 withKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  AKPrivateEmailController *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  AAFXPCSession *remoteService;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  os_signpost_id_t v31;
  uint64_t v32;
  os_activity_scope_state_s state;
  _QWORD v34[5];
  AKPrivateEmailController *v35;
  uint8_t buf[4];
  os_signpost_id_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__7;
  v34[4] = __Block_byref_object_dispose__7;
  v11 = self;
  v35 = v11;
  v12 = _os_activity_create(&dword_19202F000, "private-email-authkit/register-email", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = _AKSignpostCreate(v13);
  v16 = v15;

  _AKSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PrivateEmailRemoteRegister", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v37 = v14;
    _os_log_impl(&dword_19202F000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailRemoteRegister  enableTelemetry=YES ", buf, 0xCu);
  }

  v20 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __78__AKPrivateEmailController_registerPrivateEmailForAltDSID_withKey_completion___block_invoke;
  v28[3] = &unk_1E2E60470;
  v30 = v34;
  v31 = v14;
  v32 = v16;
  v21 = v10;
  v29 = v21;
  v22 = (void *)MEMORY[0x194022E4C](v28);
  remoteService = v11->_remoteService;
  v26[0] = v20;
  v26[1] = 3221225472;
  v26[2] = __78__AKPrivateEmailController_registerPrivateEmailForAltDSID_withKey_completion___block_invoke_95;
  v26[3] = &unk_1E2E5E220;
  v24 = v22;
  v27 = v24;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerPrivateEmailForAltDSID:withKey:completion:", v8, v9, v24);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v34, 8);

}

void __78__AKPrivateEmailController_registerPrivateEmailForAltDSID_withKey_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  double v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  id v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v19 = 67240192;
    LODWORD(v20) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailRemoteRegister", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)Nanoseconds / 1000000000.0;
    v15 = (void *)a1[6];
    v16 = objc_msgSend(v6, "code");
    v19 = 134218496;
    v20 = v15;
    v21 = 2048;
    v22 = v14;
    v23 = 1026;
    v24 = v16;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailRemoteRegister  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  _AKLogHme();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v6;
    _os_log_impl(&dword_19202F000, v17, OS_LOG_TYPE_DEFAULT, "Completed Private Email fetch in background, error:%@", (uint8_t *)&v19, 0xCu);
  }

  v18 = a1[4];
  if (v18)
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v5, v6);

}

void __78__AKPrivateEmailController_registerPrivateEmailForAltDSID_withKey_completion___block_invoke_95(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogHme();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__AKPrivateEmailController_registerPrivateEmailForAltDSID_withKey_completion___block_invoke_95_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerPrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKPrivateEmailController *v8;
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
  AAFXPCSession *remoteService;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  os_signpost_id_t v28;
  uint64_t v29;
  os_activity_scope_state_s state;
  _QWORD v31[5];
  AKPrivateEmailController *v32;
  uint8_t buf[4];
  os_signpost_id_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__7;
  v31[4] = __Block_byref_object_dispose__7;
  v8 = self;
  v32 = v8;
  v9 = _os_activity_create(&dword_19202F000, "private-email-authkit/register-email", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PrivateEmailRemoteRegister", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = v11;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailRemoteRegister  enableTelemetry=YES ", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __71__AKPrivateEmailController_registerPrivateEmailWithContext_completion___block_invoke;
  v25[3] = &unk_1E2E60470;
  v27 = v31;
  v28 = v11;
  v29 = v13;
  v18 = v7;
  v26 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v25);
  remoteService = v8->_remoteService;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __71__AKPrivateEmailController_registerPrivateEmailWithContext_completion___block_invoke_96;
  v23[3] = &unk_1E2E5E220;
  v21 = v19;
  v24 = v21;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerPrivateEmailWithContext:completion:", v6, v21);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v31, 8);

}

void __71__AKPrivateEmailController_registerPrivateEmailWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  double v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  id v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v19 = 67240192;
    LODWORD(v20) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailRemoteRegister", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)Nanoseconds / 1000000000.0;
    v15 = (void *)a1[6];
    v16 = objc_msgSend(v6, "code");
    v19 = 134218496;
    v20 = v15;
    v21 = 2048;
    v22 = v14;
    v23 = 1026;
    v24 = v16;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailRemoteRegister  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  _AKLogHme();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v6;
    _os_log_impl(&dword_19202F000, v17, OS_LOG_TYPE_DEFAULT, "Completed Private Email fetch in background, error:%@", (uint8_t *)&v19, 0xCu);
  }

  v18 = a1[4];
  if (v18)
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v5, v6);

}

void __71__AKPrivateEmailController_registerPrivateEmailWithContext_completion___block_invoke_96(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogHme();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__AKPrivateEmailController_registerPrivateEmailWithContext_completion___block_invoke_96_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKPrivateEmailController *v8;
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
  AAFXPCSession *remoteService;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  os_signpost_id_t v28;
  uint64_t v29;
  os_activity_scope_state_s state;
  _QWORD v31[5];
  AKPrivateEmailController *v32;
  uint8_t buf[4];
  os_signpost_id_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__7;
  v31[4] = __Block_byref_object_dispose__7;
  v8 = self;
  v32 = v8;
  v9 = _os_activity_create(&dword_19202F000, "private-email-authkit/fetch-with-context", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PrivateEmailContextFetch", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = v11;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailContextFetch  enableTelemetry=YES ", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __68__AKPrivateEmailController_fetchPrivateEmailWithContext_completion___block_invoke;
  v25[3] = &unk_1E2E60470;
  v27 = v31;
  v28 = v11;
  v29 = v13;
  v18 = v7;
  v26 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v25);
  remoteService = v8->_remoteService;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __68__AKPrivateEmailController_fetchPrivateEmailWithContext_completion___block_invoke_97;
  v23[3] = &unk_1E2E5E220;
  v21 = v19;
  v24 = v21;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fetchPrivateEmailWithContext:completion:", v6, v21);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v31, 8);

}

void __68__AKPrivateEmailController_fetchPrivateEmailWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  double v14;
  void *v15;
  int v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v18 = 67240192;
    LODWORD(v19) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailContextFetch", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)Nanoseconds / 1000000000.0;
    v15 = (void *)a1[6];
    v16 = objc_msgSend(v6, "code");
    v18 = 134218496;
    v19 = v15;
    v20 = 2048;
    v21 = v14;
    v22 = 1026;
    v23 = v16;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailContextFetch  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  if (a1[4])
  {
    _AKLogHme();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_19202F000, v17, OS_LOG_TYPE_DEFAULT, "Completed Private Email context fetch, error:%@", (uint8_t *)&v18, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __68__AKPrivateEmailController_fetchPrivateEmailWithContext_completion___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogHme();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__AKPrivateEmailController_fetchPrivateEmailWithContext_completion___block_invoke_97_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getContextForRequestContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKPrivateEmailController *v9;
  uint64_t v10;
  id v11;
  void *v12;
  AAFXPCSession *remoteService;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  AKPrivateEmailController *v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/PrivateEmailContext", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__7;
  v21[4] = __Block_byref_object_dispose__7;
  v9 = self;
  v22 = v9;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke;
  v18[3] = &unk_1E2E60498;
  v11 = v7;
  v19 = v11;
  v20 = v21;
  v12 = (void *)MEMORY[0x194022E4C](v18);
  remoteService = v9->_remoteService;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke_99;
  v16[3] = &unk_1E2E5E220;
  v14 = v12;
  v17 = v14;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getContextForRequestContext:completion:", v6, v14);

  _Block_object_dispose(v21, 8);
  os_activity_scope_leave(&state);

}

void __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogHme();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "getContext completed with context: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke_cold_1((uint64_t)v6, v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

void __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke_99(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogHme();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke_99_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deletePrivateEmailDatabaseWithCompletion:(id)a3
{
  id v4;
  AKPrivateEmailController *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AAFXPCSession *remoteService;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  os_signpost_id_t v25;
  uint64_t v26;
  os_activity_scope_state_s state;
  _QWORD v28[5];
  AKPrivateEmailController *v29;
  uint8_t buf[4];
  os_signpost_id_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__7;
  v28[4] = __Block_byref_object_dispose__7;
  v5 = self;
  v29 = v5;
  v6 = _os_activity_create(&dword_19202F000, "private-email-authkit/delete-db", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = _AKSignpostCreate(v7);
  v10 = v9;

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PrivateEmailDeleteDatabase", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v31 = v8;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailDeleteDatabase  enableTelemetry=YES ", buf, 0xCu);
  }

  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__AKPrivateEmailController_deletePrivateEmailDatabaseWithCompletion___block_invoke;
  v22[3] = &unk_1E2E604C0;
  v24 = v28;
  v25 = v8;
  v26 = v10;
  v15 = v4;
  v23 = v15;
  v16 = (void *)MEMORY[0x194022E4C](v22);
  remoteService = v5->_remoteService;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __69__AKPrivateEmailController_deletePrivateEmailDatabaseWithCompletion___block_invoke_101;
  v20[3] = &unk_1E2E5E220;
  v18 = v16;
  v21 = v18;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deletePrivateEmailDatabaseWithCompletion:", v18);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v28, 8);

}

void __69__AKPrivateEmailController_deletePrivateEmailDatabaseWithCompletion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  double v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PrivateEmailDeleteDatabase", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _AKSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (double)Nanoseconds / 1000000000.0;
    v14 = a1[6];
    v15 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v14;
    v19 = 2048;
    v20 = v13;
    v21 = 1026;
    v22 = v15;
    _os_log_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailDeleteDatabase  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

void __69__AKPrivateEmailController_deletePrivateEmailDatabaseWithCompletion___block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogHme();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__AKPrivateEmailController_deletePrivateEmailDatabaseWithCompletion___block_invoke_101_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)privateEmailListVersionWithCompletion:(id)a3
{
  id v4;
  AKPrivateEmailController *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AAFXPCSession *remoteService;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  os_signpost_id_t v25;
  uint64_t v26;
  os_activity_scope_state_s state;
  _QWORD v28[5];
  AKPrivateEmailController *v29;
  uint8_t buf[4];
  os_signpost_id_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__7;
  v28[4] = __Block_byref_object_dispose__7;
  v5 = self;
  v29 = v5;
  v6 = _os_activity_create(&dword_19202F000, "private-email-authkit/list-version", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = _AKSignpostCreate(v7);
  v10 = v9;

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PrivateEmailListVersion", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v31 = v8;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailListVersion  enableTelemetry=YES ", buf, 0xCu);
  }

  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __66__AKPrivateEmailController_privateEmailListVersionWithCompletion___block_invoke;
  v22[3] = &unk_1E2E604E8;
  v24 = v28;
  v25 = v8;
  v26 = v10;
  v15 = v4;
  v23 = v15;
  v16 = (void *)MEMORY[0x194022E4C](v22);
  remoteService = v5->_remoteService;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __66__AKPrivateEmailController_privateEmailListVersionWithCompletion___block_invoke_103;
  v20[3] = &unk_1E2E5E220;
  v18 = v16;
  v21 = v18;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "privateEmailListVersionWithCompletion:", v18);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v28, 8);

}

void __66__AKPrivateEmailController_privateEmailListVersionWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  double v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v18 = 67240192;
    LODWORD(v19) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailListVersion", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)Nanoseconds / 1000000000.0;
    v15 = a1[6];
    v16 = objc_msgSend(v6, "code");
    v18 = 134218496;
    v19 = v15;
    v20 = 2048;
    v21 = v14;
    v22 = 1026;
    v23 = v16;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailListVersion  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  v17 = a1[4];
  if (v17)
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);

}

void __66__AKPrivateEmailController_privateEmailListVersionWithCompletion___block_invoke_103(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogHme();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__AKPrivateEmailController_privateEmailListVersionWithCompletion___block_invoke_103_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removePrivateEmailKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKPrivateEmailController *v8;
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
  AAFXPCSession *remoteService;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  os_signpost_id_t v28;
  uint64_t v29;
  os_activity_scope_state_s state;
  _QWORD v31[5];
  AKPrivateEmailController *v32;
  uint8_t buf[4];
  os_signpost_id_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__7;
  v31[4] = __Block_byref_object_dispose__7;
  v8 = self;
  v32 = v8;
  v9 = _os_activity_create(&dword_19202F000, "private-email-authkit/remove-key", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PrivateEmailRemoveKey", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = v11;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailRemoveKey  enableTelemetry=YES ", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __61__AKPrivateEmailController_removePrivateEmailKey_completion___block_invoke;
  v25[3] = &unk_1E2E60510;
  v27 = v31;
  v28 = v11;
  v29 = v13;
  v18 = v7;
  v26 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v25);
  remoteService = v8->_remoteService;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __61__AKPrivateEmailController_removePrivateEmailKey_completion___block_invoke_104;
  v23[3] = &unk_1E2E5E220;
  v21 = v19;
  v24 = v21;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removePrivateEmailKey:completion:", v6, v21);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v31, 8);

}

void __61__AKPrivateEmailController_removePrivateEmailKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v15 = 67240192;
    LODWORD(v16) = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PrivateEmailRemoveKey", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v15, 8u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[6];
    v13 = objc_msgSend(v3, "code");
    v15 = 134218496;
    v16 = v12;
    v17 = 2048;
    v18 = v11;
    v19 = 1026;
    v20 = v13;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailRemoveKey  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v15, 0x1Cu);
  }

  v14 = a1[4];
  if (v14)
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);

}

void __61__AKPrivateEmailController_removePrivateEmailKey_completion___block_invoke_104(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogHme();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__AKPrivateEmailController_removePrivateEmailKey_completion___block_invoke_104_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)listAllPrivateEmailsForAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKPrivateEmailController *v8;
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
  AAFXPCSession *remoteService;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  os_signpost_id_t v28;
  uint64_t v29;
  os_activity_scope_state_s state;
  _QWORD v31[5];
  AKPrivateEmailController *v32;
  uint8_t buf[4];
  os_signpost_id_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__7;
  v31[4] = __Block_byref_object_dispose__7;
  v8 = self;
  v32 = v8;
  v9 = _os_activity_create(&dword_19202F000, "private-email-authkit/fetch-email-list", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PrivateEmailLocalFetchAll", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = v11;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailLocalFetchAll  enableTelemetry=YES ", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __70__AKPrivateEmailController_listAllPrivateEmailsForAltDSID_completion___block_invoke;
  v25[3] = &unk_1E2E60538;
  v27 = v31;
  v28 = v11;
  v29 = v13;
  v18 = v7;
  v26 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v25);
  remoteService = v8->_remoteService;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __70__AKPrivateEmailController_listAllPrivateEmailsForAltDSID_completion___block_invoke_106;
  v23[3] = &unk_1E2E5E220;
  v21 = v19;
  v24 = v21;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "listAllPrivateEmailsForAltDSID:completion:", v6, v21);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v31, 8);

}

void __70__AKPrivateEmailController_listAllPrivateEmailsForAltDSID_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  double v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v20 = 67240192;
    LODWORD(v21) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailLocalFetchAll", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);
  }

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)Nanoseconds / 1000000000.0;
    v15 = a1[6];
    v16 = objc_msgSend(v6, "code");
    v20 = 134218496;
    v21 = v15;
    v22 = 2048;
    v23 = v14;
    v24 = 1026;
    v25 = v16;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailLocalFetchAll  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }

  _AKLogHme();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v5, "count");
    v20 = 134218242;
    v21 = v18;
    v22 = 2112;
    v23 = *(double *)&v6;
    _os_log_impl(&dword_19202F000, v17, OS_LOG_TYPE_DEFAULT, "Completed Fetch Private Email list with %lu addresses, error:%@", (uint8_t *)&v20, 0x16u);
  }

  v19 = a1[4];
  if (v19)
    (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v5, v6);

}

void __70__AKPrivateEmailController_listAllPrivateEmailsForAltDSID_completion___block_invoke_106(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogHme();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__AKPrivateEmailController_listAllPrivateEmailsForAltDSID_completion___block_invoke_106_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSignInWithApplePrivateEmailWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKPrivateEmailController *v8;
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
  AAFXPCSession *remoteService;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  os_signpost_id_t v28;
  uint64_t v29;
  os_activity_scope_state_s state;
  _QWORD v31[5];
  AKPrivateEmailController *v32;
  uint8_t buf[4];
  os_signpost_id_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__7;
  v31[4] = __Block_byref_object_dispose__7;
  v8 = self;
  v32 = v8;
  v9 = _os_activity_create(&dword_19202F000, "private-email-authkit/fetch-siwahme-with-context", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PrivateEmailFetchSiwaHme", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = v11;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PrivateEmailFetchSiwaHme  enableTelemetry=YES ", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __83__AKPrivateEmailController_fetchSignInWithApplePrivateEmailWithContext_completion___block_invoke;
  v25[3] = &unk_1E2E60470;
  v27 = v31;
  v28 = v11;
  v29 = v13;
  v18 = v7;
  v26 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v25);
  remoteService = v8->_remoteService;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __83__AKPrivateEmailController_fetchSignInWithApplePrivateEmailWithContext_completion___block_invoke_107;
  v23[3] = &unk_1E2E5E220;
  v21 = v19;
  v24 = v21;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fetchSignInWithApplePrivateEmailWithContext:completion:", v6, v21);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v31, 8);

}

void __83__AKPrivateEmailController_fetchSignInWithApplePrivateEmailWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  double v14;
  void *v15;
  int v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v18 = 67240192;
    LODWORD(v19) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PrivateEmailFetchSiwaHme", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)Nanoseconds / 1000000000.0;
    v15 = (void *)a1[6];
    v16 = objc_msgSend(v6, "code");
    v18 = 134218496;
    v19 = v15;
    v20 = 2048;
    v21 = v14;
    v22 = 1026;
    v23 = v16;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PrivateEmailFetchSiwaHme  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  if (a1[4])
  {
    _AKLogHme();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_19202F000, v17, OS_LOG_TYPE_DEFAULT, "Completed fetch SiWA Private Email, error:%@", (uint8_t *)&v18, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __83__AKPrivateEmailController_fetchSignInWithApplePrivateEmailWithContext_completion___block_invoke_107(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogHme();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __83__AKPrivateEmailController_fetchSignInWithApplePrivateEmailWithContext_completion___block_invoke_107_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (AAFXPCSession)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
  objc_storeStrong((id *)&self->_remoteService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_clientImpl, 0);
}

void __69__AKPrivateEmailController_lookupPrivateEmailWithContext_completion___block_invoke_92_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __75__AKPrivateEmailController_fetchPrivateEmailForAltDSID_withKey_completion___block_invoke_94_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __78__AKPrivateEmailController_registerPrivateEmailForAltDSID_withKey_completion___block_invoke_95_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __71__AKPrivateEmailController_registerPrivateEmailWithContext_completion___block_invoke_96_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __68__AKPrivateEmailController_fetchPrivateEmailWithContext_completion___block_invoke_97_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "getContext failed: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __67__AKPrivateEmailController_getContextForRequestContext_completion___block_invoke_99_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __69__AKPrivateEmailController_deletePrivateEmailDatabaseWithCompletion___block_invoke_101_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __66__AKPrivateEmailController_privateEmailListVersionWithCompletion___block_invoke_103_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __61__AKPrivateEmailController_removePrivateEmailKey_completion___block_invoke_104_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __70__AKPrivateEmailController_listAllPrivateEmailsForAltDSID_completion___block_invoke_106_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __83__AKPrivateEmailController_fetchSignInWithApplePrivateEmailWithContext_completion___block_invoke_107_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to private email service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
