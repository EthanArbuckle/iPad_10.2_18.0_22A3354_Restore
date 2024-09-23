@implementation AKAppleIDPasskeyController

- (AKAppleIDPasskeyController)init
{
  void *v3;
  void *v4;
  AKAppleIDPasskeyController *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC8]), "initWithServiceName:remoteProtocol:options:", CFSTR("com.apple.ak.appleidpasskey.xpc"), &unk_1EE270DB8, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC0]), "initWithRemoteServiceConfig:delegate:", v3, self);
  v5 = -[AKAppleIDPasskeyController initWithXPCSession:](self, "initWithXPCSession:", v4);

  return v5;
}

- (AKAppleIDPasskeyController)initWithXPCSession:(id)a3
{
  id v5;
  AKAppleIDPasskeyController *v6;
  AKAppleIDPasskeyController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAppleIDPasskeyController;
  v6 = -[AKAppleIDPasskeyController init](&v9, sel_init);
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
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Connection to AppleIDPasskey remote service was interrupted", a5, a6, a7, a8, 0);
}

- (void)remoteServiceDidInvalidate
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Connection to AppleIDPasskey remote service was invalidated", a5, a6, a7, a8, 0);
}

- (void)setupAppleIDPasskeyWithContext:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_19202F000, "AppleIDPasskey/setupAppleIDPasskey", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AppleIDPasskeySetup", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AppleIDPasskeySetup  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __72__AKAppleIDPasskeyController_setupAppleIDPasskeyWithContext_completion___block_invoke;
  v24[3] = &unk_1E2E60718;
  v24[4] = self;
  v26 = v10;
  v27 = v12;
  v17 = v7;
  v25 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v24);
  remoteService = self->_remoteService;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __72__AKAppleIDPasskeyController_setupAppleIDPasskeyWithContext_completion___block_invoke_63;
  v22[3] = &unk_1E2E5E220;
  v20 = v18;
  v23 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setupAppleIDPasskeyWithContext:completion:", v6, v20);

  os_activity_scope_leave(&state);
}

void __72__AKAppleIDPasskeyController_setupAppleIDPasskeyWithContext_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "AppleIDPasskeySetup", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[6];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AppleIDPasskeySetup  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _AKLogPasskey();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Completed AppleID passkey setup successfully", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __72__AKAppleIDPasskeyController_setupAppleIDPasskeyWithContext_completion___block_invoke_cold_1();
  }

  v16 = a1[5];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __72__AKAppleIDPasskeyController_setupAppleIDPasskeyWithContext_completion___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)verifyAppleIDPasskeyWithContext:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_19202F000, "AppleIDPasskey/verifyAppleIDPasskey", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AppleIDPasskeyVerification", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AppleIDPasskeyVerification  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __73__AKAppleIDPasskeyController_verifyAppleIDPasskeyWithContext_completion___block_invoke;
  v24[3] = &unk_1E2E60740;
  v24[4] = self;
  v26 = v10;
  v27 = v12;
  v17 = v7;
  v25 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v24);
  remoteService = self->_remoteService;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __73__AKAppleIDPasskeyController_verifyAppleIDPasskeyWithContext_completion___block_invoke_66;
  v22[3] = &unk_1E2E5E220;
  v20 = v18;
  v23 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "verifyAppleIDPasskeyWithContext:completion:", v6, v20);

  os_activity_scope_leave(&state);
}

void __73__AKAppleIDPasskeyController_verifyAppleIDPasskeyWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "AppleIDPasskeyVerification", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
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
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AppleIDPasskeyVerification  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  _AKLogPasskey();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Completed AppleID passkey verification successfully", (uint8_t *)&v18, 2u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __73__AKAppleIDPasskeyController_verifyAppleIDPasskeyWithContext_completion___block_invoke_cold_1();
  }

  v17 = a1[5];
  if (v17)
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);

}

uint64_t __73__AKAppleIDPasskeyController_verifyAppleIDPasskeyWithContext_completion___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unenrollAppleIDPasskeyWithContext:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_19202F000, "AppleIDPasskey/unenrollAppleIDPasskey", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AppleIDPasskeyUnenroll", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AppleIDPasskeyUnenroll  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__AKAppleIDPasskeyController_unenrollAppleIDPasskeyWithContext_completion___block_invoke;
  v24[3] = &unk_1E2E60718;
  v24[4] = self;
  v26 = v10;
  v27 = v12;
  v17 = v7;
  v25 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v24);
  remoteService = self->_remoteService;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __75__AKAppleIDPasskeyController_unenrollAppleIDPasskeyWithContext_completion___block_invoke_67;
  v22[3] = &unk_1E2E5E220;
  v20 = v18;
  v23 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unenrollAppleIDPasskeyWithContext:completion:", v6, v20);

  os_activity_scope_leave(&state);
}

void __75__AKAppleIDPasskeyController_unenrollAppleIDPasskeyWithContext_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
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
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "AppleIDPasskeyUnenroll", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[6];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AppleIDPasskeyUnenroll  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _AKLogPasskey();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Completed AppleID passkey unenroll successfully", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __75__AKAppleIDPasskeyController_unenrollAppleIDPasskeyWithContext_completion___block_invoke_cold_1();
  }

  v16 = a1[5];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __75__AKAppleIDPasskeyController_unenrollAppleIDPasskeyWithContext_completion___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)appleIDPasskeyStatusWithContext:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_19202F000, "AppleIDPasskey/appleIDPasskeyStatus", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AppleIDPasskeyStatus", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AppleIDPasskeyStatus  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __73__AKAppleIDPasskeyController_appleIDPasskeyStatusWithContext_completion___block_invoke;
  v24[3] = &unk_1E2E60740;
  v24[4] = self;
  v26 = v10;
  v27 = v12;
  v17 = v7;
  v25 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v24);
  remoteService = self->_remoteService;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __73__AKAppleIDPasskeyController_appleIDPasskeyStatusWithContext_completion___block_invoke_68;
  v22[3] = &unk_1E2E5E220;
  v20 = v18;
  v23 = v20;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appleIDPasskeyStatusWithContext:completion:", v6, v20);

  os_activity_scope_leave(&state);
}

void __73__AKAppleIDPasskeyController_appleIDPasskeyStatusWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "AppleIDPasskeyStatus", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 8u);
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
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AppleIDPasskeyStatus  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v18, 0x1Cu);
  }

  _AKLogPasskey();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Completed AppleID passkey status successfully", (uint8_t *)&v18, 2u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __73__AKAppleIDPasskeyController_appleIDPasskeyStatusWithContext_completion___block_invoke_cold_1();
  }

  v17 = a1[5];
  if (v17)
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);

}

uint64_t __73__AKAppleIDPasskeyController_appleIDPasskeyStatusWithContext_completion___block_invoke_68(uint64_t a1)
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

void __72__AKAppleIDPasskeyController_setupAppleIDPasskeyWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "AppleID passkey setup failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__AKAppleIDPasskeyController_verifyAppleIDPasskeyWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "AppleID passkey verification failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__AKAppleIDPasskeyController_unenrollAppleIDPasskeyWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "AppleID passkey unenroll failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__AKAppleIDPasskeyController_appleIDPasskeyStatusWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "AppleID passkey status failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
