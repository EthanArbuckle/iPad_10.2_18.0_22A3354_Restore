@implementation AKSignInWithAppleController

- (AKSignInWithAppleController)init
{
  void *v3;
  void *v4;
  AKSignInWithAppleController *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC8]), "initWithServiceName:remoteProtocol:options:", CFSTR("com.apple.ak.signinwithapple.xpc"), &unk_1EE270FF8, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC0]), "initWithRemoteServiceConfig:delegate:", v3, self);
  v5 = -[AKSignInWithAppleController initWithXPCSession:](self, "initWithXPCSession:", v4);

  return v5;
}

- (AKSignInWithAppleController)initWithXPCSession:(id)a3
{
  id v5;
  AKSignInWithAppleController *v6;
  AKSignInWithAppleController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKSignInWithAppleController;
  v6 = -[AKSignInWithAppleController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteService, a3);
    -[AAFXPCSession resume](v7->_remoteService, "resume");
  }

  return v7;
}

- (void)remoteServiceDidInterrupt
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Connection to SignInWithApple remote service was interrupted", a5, a6, a7, a8, 0);
}

- (void)remoteServiceDidInvalidate
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Connection to SignInWithApple remote service was invalidated", a5, a6, a7, a8, 0);
}

- (void)configureRemoteInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_fetchAccountsWithContext_completion_, 0, 1);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_fetchAppIconForClientID_iconSize_completion_, 0, 1);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_shareAccountWithContext_withGroup_completion_, 0, 1);

}

- (void)fetchAccountsWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  AAFXPCSession *remoteService;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "SignInWithApple/fetchAccounts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AKSignpostCreate(v9);
  v12 = v11;

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwAFetchAccounts", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAFetchAccounts  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __67__AKSignInWithAppleController_fetchAccountsWithContext_completion___block_invoke;
  v24[3] = &unk_1E2E61DB0;
  v24[4] = self;
  v26 = v10;
  v27 = v12;
  v17 = v7;
  v25 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v24);
  remoteService = self->_remoteService;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __67__AKSignInWithAppleController_fetchAccountsWithContext_completion___block_invoke_94;
  v22[3] = &unk_1E2E5E220;
  v20 = v18;
  v23 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fetchAccountsWithContext:completion:", v6, v20);

  os_activity_scope_leave(&state);
}

void __67__AKSignInWithAppleController_fetchAccountsWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
  NSObject *v15;
  NSObject *v16;
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v18 = 67240192;
    LODWORD(v19) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SiwAFetchAccounts", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    v14 = objc_msgSend(v6, "code");
    v18 = 134218496;
    v19 = v13;
    v20 = 2048;
    v21 = v12;
    v22 = 1026;
    v23 = v14;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAFetchAccounts  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  _AKLogSiwa();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Completed fetch SiwA accounts successfully", (uint8_t *)&v18, 2u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __67__AKSignInWithAppleController_fetchAccountsWithContext_completion___block_invoke_cold_1();
  }

  v17 = a1[5];
  if (v17)
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);

}

uint64_t __67__AKSignInWithAppleController_fetchAccountsWithContext_completion___block_invoke_94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)revokeAcccountWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  AAFXPCSession *remoteService;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "SignInWithApple/revokeAccount", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AKSignpostCreate(v9);
  v12 = v11;

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwARevokeAccount", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwARevokeAccount  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __68__AKSignInWithAppleController_revokeAcccountWithContext_completion___block_invoke;
  v27[3] = &unk_1E2E5E908;
  v29 = v10;
  v30 = v12;
  v17 = v7;
  v28 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v27);
  remoteService = self->_remoteService;
  v22 = v16;
  v23 = 3221225472;
  v24 = __68__AKSignInWithAppleController_revokeAcccountWithContext_completion___block_invoke_97;
  v25 = &unk_1E2E5E220;
  v20 = v18;
  v26 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "revokeAcccountWithContext:completion:", v6, v20, v22, v23, v24, v25);

  os_activity_scope_leave(&state);
}

void __68__AKSignInWithAppleController_revokeAcccountWithContext_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwARevokeAccount", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[5];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwARevokeAccount  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _AKLogSiwa();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Successfully revoked SiwA account", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __68__AKSignInWithAppleController_revokeAcccountWithContext_completion___block_invoke_cold_1();
  }

  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __68__AKSignInWithAppleController_revokeAcccountWithContext_completion___block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchEULAForClientID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  AAFXPCSession *remoteService;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "SignInWithApple/appEULAFetch", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AKSignpostCreate(v9);
  v12 = v11;

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwAFetchEULA", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAFetchEULA  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __63__AKSignInWithAppleController_fetchEULAForClientID_completion___block_invoke;
  v24[3] = &unk_1E2E61DD8;
  v24[4] = self;
  v26 = v10;
  v27 = v12;
  v17 = v7;
  v25 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v24);
  remoteService = self->_remoteService;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __63__AKSignInWithAppleController_fetchEULAForClientID_completion___block_invoke_99;
  v22[3] = &unk_1E2E5E220;
  v20 = v18;
  v23 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fetchEULAForClientID:completion:", v6, v17);

  os_activity_scope_leave(&state);
}

void __63__AKSignInWithAppleController_fetchEULAForClientID_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v19 = 67240192;
    LODWORD(v20) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SiwAFetchEULA", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    v14 = objc_msgSend(v6, "code");
    v19 = 134218496;
    v20 = v13;
    v21 = 2048;
    v22 = v12;
    v23 = 1026;
    v24 = v14;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAFetchEULA  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  v15 = objc_msgSend(v5, "length");
  _AKLogSiwa();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_19202F000, v17, OS_LOG_TYPE_DEFAULT, "Successfully fetched EULA", (uint8_t *)&v19, 2u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    __63__AKSignInWithAppleController_fetchEULAForClientID_completion___block_invoke_cold_1();
  }

  v18 = a1[5];
  if (v18)
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v5, v6);

}

uint64_t __63__AKSignInWithAppleController_fetchEULAForClientID_completion___block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAppIconForClientID:(id)a3 iconSize:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AAFXPCSession *remoteService;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  os_signpost_id_t v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v36;
  uint64_t v37;

  height = a4.height;
  width = a4.width;
  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = _os_activity_create(&dword_19202F000, "SignInWithApple/appIconFetch", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SiwAFetchAppIcon", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v36 = v13;
    _os_log_impl(&dword_19202F000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAFetchAppIcon  enableTelemetry=YES ", buf, 0xCu);
  }

  v19 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __75__AKSignInWithAppleController_fetchAppIconForClientID_iconSize_completion___block_invoke;
  v30[3] = &unk_1E2E61E00;
  v32 = v13;
  v33 = v15;
  v20 = v10;
  v31 = v20;
  v21 = (void *)MEMORY[0x194022E4C](v30);
  remoteService = self->_remoteService;
  v25 = v19;
  v26 = 3221225472;
  v27 = __75__AKSignInWithAppleController_fetchAppIconForClientID_iconSize_completion___block_invoke_101;
  v28 = &unk_1E2E5E220;
  v23 = v21;
  v29 = v23;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", &v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fetchAppIconForClientID:iconSize:completion:", v9, v20, width, height, v25, v26, v27, v28);

  os_activity_scope_leave(&state);
}

void __75__AKSignInWithAppleController_fetchAppIconForClientID_iconSize_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[5];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v19 = 67240192;
    LODWORD(v20) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SiwAFetchAppIcon", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[5];
    v14 = objc_msgSend(v6, "code");
    v19 = 134218496;
    v20 = v13;
    v21 = 2048;
    v22 = v12;
    v23 = 1026;
    v24 = v14;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAFetchAppIcon  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  objc_msgSend(v5, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSiwa();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_19202F000, v17, OS_LOG_TYPE_DEFAULT, "Successfully fetched app icon", (uint8_t *)&v19, 2u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    __75__AKSignInWithAppleController_fetchAppIconForClientID_iconSize_completion___block_invoke_cold_1();
  }

  v18 = a1[4];
  if (v18)
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v5, v6);

}

uint64_t __75__AKSignInWithAppleController_fetchAppIconForClientID_iconSize_completion___block_invoke_101(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelAppIconRequestForClientID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  AAFXPCSession *remoteService;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "SignInWithApple/cancelAppIconFetch", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AKSignpostCreate(v9);
  v12 = v11;

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwACancelAppIcon", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwACancelAppIcon  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__AKSignInWithAppleController_cancelAppIconRequestForClientID_completion___block_invoke;
  v27[3] = &unk_1E2E5E908;
  v29 = v10;
  v30 = v12;
  v17 = v7;
  v28 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v27);
  remoteService = self->_remoteService;
  v22 = v16;
  v23 = 3221225472;
  v24 = __74__AKSignInWithAppleController_cancelAppIconRequestForClientID_completion___block_invoke_102;
  v25 = &unk_1E2E5E220;
  v20 = v18;
  v26 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cancelAppIconRequestForClientID:completion:", v6, v17, v22, v23, v24, v25);

  os_activity_scope_leave(&state);
}

void __74__AKSignInWithAppleController_cancelAppIconRequestForClientID_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwACancelAppIcon", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[5];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwACancelAppIcon  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _AKLogSiwa();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Successfully cancel app icon fetch", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __74__AKSignInWithAppleController_cancelAppIconRequestForClientID_completion___block_invoke_cold_1();
  }

  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __74__AKSignInWithAppleController_cancelAppIconRequestForClientID_completion___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)shareAccountWithContext:(id)a3 withGroup:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AAFXPCSession *remoteService;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_19202F000, "SignInWithApple/shareCredential", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SiwAShareCredential", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = v13;
    _os_log_impl(&dword_19202F000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAShareCredential  enableTelemetry=YES ", buf, 0xCu);
  }

  v19 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__AKSignInWithAppleController_shareAccountWithContext_withGroup_completion___block_invoke;
  v27[3] = &unk_1E2E61E28;
  v27[4] = self;
  v29 = v13;
  v30 = v15;
  v20 = v10;
  v28 = v20;
  v21 = (void *)MEMORY[0x194022E4C](v27);
  remoteService = self->_remoteService;
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __76__AKSignInWithAppleController_shareAccountWithContext_withGroup_completion___block_invoke_104;
  v25[3] = &unk_1E2E5E220;
  v23 = v21;
  v26 = v23;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "shareAccountWithContext:withGroup:completion:", v8, v9, v23);

  os_activity_scope_leave(&state);
}

void __76__AKSignInWithAppleController_shareAccountWithContext_withGroup_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
  NSObject *v15;
  NSObject *v16;
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v18 = 67240192;
    LODWORD(v19) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SiwAShareCredential", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    v14 = objc_msgSend(v6, "code");
    v18 = 134218496;
    v19 = v13;
    v20 = 2048;
    v21 = v12;
    v22 = 1026;
    v23 = v14;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAShareCredential  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  _AKLogSiwa();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "SiwA account shared successfully", (uint8_t *)&v18, 2u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __76__AKSignInWithAppleController_shareAccountWithContext_withGroup_completion___block_invoke_cold_1();
  }

  v17 = a1[5];
  if (v17)
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);

}

uint64_t __76__AKSignInWithAppleController_shareAccountWithContext_withGroup_completion___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unshareAccountWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  AAFXPCSession *remoteService;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "SignInWithApple/unshareCredential", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AKSignpostCreate(v9);
  v12 = v11;

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwAUnshareCredential", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAUnshareCredential  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __68__AKSignInWithAppleController_unshareAccountWithContext_completion___block_invoke;
  v27[3] = &unk_1E2E5E908;
  v29 = v10;
  v30 = v12;
  v17 = v7;
  v28 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v27);
  remoteService = self->_remoteService;
  v22 = v16;
  v23 = 3221225472;
  v24 = __68__AKSignInWithAppleController_unshareAccountWithContext_completion___block_invoke_105;
  v25 = &unk_1E2E5E220;
  v20 = v18;
  v26 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unshareAccountWithContext:completion:", v6, v20, v22, v23, v24, v25);

  os_activity_scope_leave(&state);
}

void __68__AKSignInWithAppleController_unshareAccountWithContext_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwAUnshareCredential", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[5];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAUnshareCredential  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _AKLogSiwa();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Successfully unshared SiwA account", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __68__AKSignInWithAppleController_unshareAccountWithContext_completion___block_invoke_cold_1();
  }

  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __68__AKSignInWithAppleController_unshareAccountWithContext_completion___block_invoke_105(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)leaveGroupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  AAFXPCSession *remoteService;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "SignInWithApple/leaveGroup", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AKSignpostCreate(v9);
  v12 = v11;

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwALeaveGroup", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwALeaveGroup  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __64__AKSignInWithAppleController_leaveGroupWithContext_completion___block_invoke;
  v27[3] = &unk_1E2E5E908;
  v29 = v10;
  v30 = v12;
  v17 = v7;
  v28 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v27);
  remoteService = self->_remoteService;
  v22 = v16;
  v23 = 3221225472;
  v24 = __64__AKSignInWithAppleController_leaveGroupWithContext_completion___block_invoke_106;
  v25 = &unk_1E2E5E220;
  v20 = v18;
  v26 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leaveGroupWithContext:completion:", v6, v20, v22, v23, v24, v25);

  os_activity_scope_leave(&state);
}

void __64__AKSignInWithAppleController_leaveGroupWithContext_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwALeaveGroup", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[5];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwALeaveGroup  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _AKLogSiwa();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Successfully completed group departure", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __64__AKSignInWithAppleController_leaveGroupWithContext_completion___block_invoke_cold_1();
  }

  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __64__AKSignInWithAppleController_leaveGroupWithContext_completion___block_invoke_106(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteAllItemsFromDepartedGroupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  AAFXPCSession *remoteService;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "SignInWithApple/deleteGroupItems", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AKSignpostCreate(v9);
  v12 = v11;

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwADeleteGroupItems", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwADeleteGroupItems  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __85__AKSignInWithAppleController_deleteAllItemsFromDepartedGroupWithContext_completion___block_invoke;
  v27[3] = &unk_1E2E5E908;
  v29 = v10;
  v30 = v12;
  v17 = v7;
  v28 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v27);
  remoteService = self->_remoteService;
  v22 = v16;
  v23 = 3221225472;
  v24 = __85__AKSignInWithAppleController_deleteAllItemsFromDepartedGroupWithContext_completion___block_invoke_107;
  v25 = &unk_1E2E5E220;
  v20 = v18;
  v26 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deleteAllItemsFromDepartedGroupWithContext:completion:", v6, v20, v22, v23, v24, v25);

  os_activity_scope_leave(&state);
}

void __85__AKSignInWithAppleController_deleteAllItemsFromDepartedGroupWithContext_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwADeleteGroupItems", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[5];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwADeleteGroupItems  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _AKLogSiwa();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Successfully deleted all items from group", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __85__AKSignInWithAppleController_deleteAllItemsFromDepartedGroupWithContext_completion___block_invoke_cold_1();
  }

  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __85__AKSignInWithAppleController_deleteAllItemsFromDepartedGroupWithContext_completion___block_invoke_107(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)participantRemovedWithContext:(id)a3 participantID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AAFXPCSession *remoteService;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  os_signpost_id_t v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_19202F000, "SignInWithApple/participantRemoved", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SiwAParticipantRemoved", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v36 = v13;
    _os_log_impl(&dword_19202F000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAParticipantRemoved  enableTelemetry=YES ", buf, 0xCu);
  }

  v19 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __86__AKSignInWithAppleController_participantRemovedWithContext_participantID_completion___block_invoke;
  v30[3] = &unk_1E2E5E908;
  v32 = v13;
  v33 = v15;
  v20 = v10;
  v31 = v20;
  v21 = (void *)MEMORY[0x194022E4C](v30);
  remoteService = self->_remoteService;
  v25 = v19;
  v26 = 3221225472;
  v27 = __86__AKSignInWithAppleController_participantRemovedWithContext_participantID_completion___block_invoke_108;
  v28 = &unk_1E2E5E220;
  v23 = v21;
  v29 = v23;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", &v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "participantRemovedWithContext:participantID:completion:", v8, v9, v23, v25, v26, v27, v28);

  os_activity_scope_leave(&state);
}

void __86__AKSignInWithAppleController_participantRemovedWithContext_participantID_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwAParticipantRemoved", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[5];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAParticipantRemoved  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _AKLogSiwa();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Successfully performed actions after participant removal.", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __86__AKSignInWithAppleController_participantRemovedWithContext_participantID_completion___block_invoke_cold_1();
  }

  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __86__AKSignInWithAppleController_participantRemovedWithContext_participantID_completion___block_invoke_108(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSharedGroupsWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  AAFXPCSession *remoteService;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "SignInWithApple/fetchSharedGroups", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AKSignpostCreate(v9);
  v12 = v11;

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwAFetchSharedGroups", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAFetchSharedGroups  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __71__AKSignInWithAppleController_fetchSharedGroupsWithContext_completion___block_invoke;
  v27[3] = &unk_1E2E5E908;
  v29 = v10;
  v30 = v12;
  v17 = v7;
  v28 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v27);
  remoteService = self->_remoteService;
  v22 = v16;
  v23 = 3221225472;
  v24 = __71__AKSignInWithAppleController_fetchSharedGroupsWithContext_completion___block_invoke_109;
  v25 = &unk_1E2E5E220;
  v20 = v18;
  v26 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fetchSharedGroupsWithContext:completion:", v6, v20, v22, v23, v24, v25);

  os_activity_scope_leave(&state);
}

void __71__AKSignInWithAppleController_fetchSharedGroupsWithContext_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwAFetchSharedGroups", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[5];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAFetchSharedGroups  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _AKLogSiwa();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Successfully fetched shared groups", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __71__AKSignInWithAppleController_fetchSharedGroupsWithContext_completion___block_invoke_cold_1();
  }

  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __71__AKSignInWithAppleController_fetchSharedGroupsWithContext_completion___block_invoke_109(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performTokenRotationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  AAFXPCSession *remoteService;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "SignInWithApple/performTokenRotation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AKSignpostCreate(v9);
  v12 = v11;

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwAPerformTokenRotation", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAPerformTokenRotation  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __74__AKSignInWithAppleController_performTokenRotationWithContext_completion___block_invoke;
  v27[3] = &unk_1E2E5E908;
  v29 = v10;
  v30 = v12;
  v17 = v7;
  v28 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v27);
  remoteService = self->_remoteService;
  v22 = v16;
  v23 = 3221225472;
  v24 = __74__AKSignInWithAppleController_performTokenRotationWithContext_completion___block_invoke_110;
  v25 = &unk_1E2E5E220;
  v20 = v18;
  v26 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "performTokenRotationWithContext:completion:", v6, v20, v22, v23, v24, v25);

  os_activity_scope_leave(&state);
}

void __74__AKSignInWithAppleController_performTokenRotationWithContext_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwAPerformTokenRotation", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[5];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAPerformTokenRotation  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _AKLogSiwa();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Successfully performed token rotation", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __74__AKSignInWithAppleController_performTokenRotationWithContext_completion___block_invoke_cold_1();
  }

  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __74__AKSignInWithAppleController_performTokenRotationWithContext_completion___block_invoke_110(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performHealthCheckWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  AAFXPCSession *remoteService;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "SignInWithApple/performHealthCheck", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AKSignpostCreate(v9);
  v12 = v11;

  _AKSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SiwAPerformHealthCheck", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAPerformHealthCheck  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __72__AKSignInWithAppleController_performHealthCheckWithContext_completion___block_invoke;
  v27[3] = &unk_1E2E5E908;
  v29 = v10;
  v30 = v12;
  v17 = v7;
  v28 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v27);
  remoteService = self->_remoteService;
  v22 = v16;
  v23 = 3221225472;
  v24 = __72__AKSignInWithAppleController_performHealthCheckWithContext_completion___block_invoke_111;
  v25 = &unk_1E2E5E220;
  v20 = v18;
  v26 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "performHealthCheckWithContext:completion:", v6, v20, v22, v23, v24, v25);

  os_activity_scope_leave(&state);
}

void __72__AKSignInWithAppleController_performHealthCheckWithContext_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SiwAPerformHealthCheck", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[5];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAPerformHealthCheck  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _AKLogSiwa();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Successfully performed health check", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __72__AKSignInWithAppleController_performHealthCheckWithContext_completion___block_invoke_cold_1();
  }

  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __72__AKSignInWithAppleController_performHealthCheckWithContext_completion___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSignInWithApplePrivateEmailCountWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  AAFXPCSession *remoteService;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19202F000, "SignInWithApple/fetchSIWAHMECount", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _AKSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _AKSignpostCreate(v6);
  v9 = v8;

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SiwAFetchHMECount", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = v7;
    _os_log_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SiwAFetchHMECount  enableTelemetry=YES ", buf, 0xCu);
  }

  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __83__AKSignInWithAppleController_fetchSignInWithApplePrivateEmailCountWithCompletion___block_invoke;
  v24[3] = &unk_1E2E61E50;
  v26 = v7;
  v27 = v9;
  v14 = v4;
  v25 = v14;
  v15 = (void *)MEMORY[0x194022E4C](v24);
  remoteService = self->_remoteService;
  v19 = v13;
  v20 = 3221225472;
  v21 = __83__AKSignInWithAppleController_fetchSignInWithApplePrivateEmailCountWithCompletion___block_invoke_113;
  v22 = &unk_1E2E5E220;
  v17 = v15;
  v23 = v17;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", &v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fetchSignInWithApplePrivateEmailCountWithCompletion:", v17, v19, v20, v21, v22);

  os_activity_scope_leave(&state);
}

void __83__AKSignInWithAppleController_fetchSignInWithApplePrivateEmailCountWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
  NSObject *v15;
  NSObject *v16;
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[5];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v18 = 67240192;
    LODWORD(v19) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SiwAFetchHMECount", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[5];
    v14 = objc_msgSend(v6, "code");
    v18 = 134218496;
    v19 = v13;
    v20 = 2048;
    v21 = v12;
    v22 = 1026;
    v23 = v14;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SiwAFetchHMECount  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  _AKLogSiwa();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Successfully fetched SIWA HME Count", (uint8_t *)&v18, 2u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __83__AKSignInWithAppleController_fetchSignInWithApplePrivateEmailCountWithCompletion___block_invoke_cold_1();
  }

  v17 = a1[4];
  if (v17)
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);

}

uint64_t __83__AKSignInWithAppleController_fetchSignInWithApplePrivateEmailCountWithCompletion___block_invoke_113(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
}

void __67__AKSignInWithAppleController_fetchAccountsWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Fetch SiwA accounts failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__AKSignInWithAppleController_revokeAcccountWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to revoke SiwA account with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__AKSignInWithAppleController_fetchEULAForClientID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch EULA with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__AKSignInWithAppleController_fetchAppIconForClientID_iconSize_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch app icon with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__AKSignInWithAppleController_cancelAppIconRequestForClientID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to cancel app icon fetch with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__AKSignInWithAppleController_shareAccountWithContext_withGroup_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "SiwA account sharing failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__AKSignInWithAppleController_unshareAccountWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to unshare SiwA account with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__AKSignInWithAppleController_leaveGroupWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to complete group departure with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __85__AKSignInWithAppleController_deleteAllItemsFromDepartedGroupWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to deleted all items from group with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __86__AKSignInWithAppleController_participantRemovedWithContext_participantID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to perform actions after participant removal with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__AKSignInWithAppleController_fetchSharedGroupsWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch shared groups with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__AKSignInWithAppleController_performTokenRotationWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to perform token rotation with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __72__AKSignInWithAppleController_performHealthCheckWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to perform health check with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __83__AKSignInWithAppleController_fetchSignInWithApplePrivateEmailCountWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch SIWA HME count with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
