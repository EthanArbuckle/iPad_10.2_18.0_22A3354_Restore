@implementation AKWalrusController

- (AKWalrusController)init
{
  AKWalrusController *v2;
  void *v3;
  uint64_t v4;
  AAFXPCSession *remoteService;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKWalrusController;
  v2 = -[AKWalrusController init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC8]), "initWithServiceName:remoteProtocol:options:", CFSTR("com.apple.ak.walrus.xpc"), &unk_1EE270E78, 0);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC0]), "initWithRemoteServiceConfig:delegate:", v3, v2);
    remoteService = v2->_remoteService;
    v2->_remoteService = (AAFXPCSession *)v4;

    -[AAFXPCSession resume](v2->_remoteService, "resume");
  }
  return v2;
}

- (void)PCSAuthContextForWebSessionIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  AKWalrusController *v12;
  uint64_t v13;
  id v14;
  void *v15;
  AAFXPCSession *remoteService;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  AKWalrusController *v25;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_19202F000, "walrus-authkit/fetch-pcs-auth-context", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__8;
  v24[4] = __Block_byref_object_dispose__8;
  v12 = self;
  v13 = MEMORY[0x1E0C809B0];
  v25 = v12;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __83__AKWalrusController_PCSAuthContextForWebSessionIdentifier_serviceName_completion___block_invoke;
  v21[3] = &unk_1E2E60BF8;
  v23 = v24;
  v14 = v10;
  v22 = v14;
  v15 = (void *)MEMORY[0x194022E4C](v21);
  remoteService = v12->_remoteService;
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __83__AKWalrusController_PCSAuthContextForWebSessionIdentifier_serviceName_completion___block_invoke_2;
  v19[3] = &unk_1E2E5E220;
  v17 = v15;
  v20 = v17;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "PCSAuthContextForWebSessionIdentifier:serviceName:completion:", v8, v9, v17);

  _Block_object_dispose(v24, 8);
  os_activity_scope_leave(&state);

}

void __83__AKWalrusController_PCSAuthContextForWebSessionIdentifier_serviceName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;
  v7 = a3;
  v8 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__AKWalrusController_PCSAuthContextForWebSessionIdentifier_serviceName_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __83__AKWalrusController_PCSAuthContextForWebSessionIdentifier_serviceName_completion___block_invoke_2_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)PCSAuthContextForWebSessionUUID:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "UUIDString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AKWalrusController PCSAuthContextForWebSessionIdentifier:serviceName:completion:](self, "PCSAuthContextForWebSessionIdentifier:serviceName:completion:", v10, v9, v8);

}

- (void)removeAllPCSAuthCredentialWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  AKWalrusController *v6;
  uint64_t v7;
  id v8;
  void *v9;
  AAFXPCSession *remoteService;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  AKWalrusController *v19;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19202F000, "walrus-authkit/remove-all-pcs-auth-credentials", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__8;
  v18[4] = __Block_byref_object_dispose__8;
  v6 = self;
  v7 = MEMORY[0x1E0C809B0];
  v19 = v6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__AKWalrusController_removeAllPCSAuthCredentialWithCompletion___block_invoke;
  v15[3] = &unk_1E2E5E9D0;
  v17 = v18;
  v8 = v4;
  v16 = v8;
  v9 = (void *)MEMORY[0x194022E4C](v15);
  remoteService = v6->_remoteService;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __63__AKWalrusController_removeAllPCSAuthCredentialWithCompletion___block_invoke_2;
  v13[3] = &unk_1E2E5E220;
  v11 = v9;
  v14 = v11;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllPCSAuthCredentialWithCompletion:", v11);

  _Block_object_dispose(v18, 8);
  os_activity_scope_leave(&state);

}

void __63__AKWalrusController_removeAllPCSAuthCredentialWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;
  v5 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__AKWalrusController_removeAllPCSAuthCredentialWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__AKWalrusController_removeAllPCSAuthCredentialWithCompletion___block_invoke_2_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)verifyEnableWalrusAllowedWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKWalrusController *v8;
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
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  os_signpost_id_t v31;
  uint64_t v32;
  os_activity_scope_state_s state;
  _QWORD v34[5];
  AKWalrusController *v35;
  uint8_t buf[4];
  os_signpost_id_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__8;
  v34[4] = __Block_byref_object_dispose__8;
  v8 = self;
  v35 = v8;
  v9 = _os_activity_create(&dword_19202F000, "walrus-authkit/verify-walrus-enable-allowed", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VerifyEnableWalrusAllowed", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v37 = v11;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: VerifyEnableWalrusAllowed  enableTelemetry=YES ", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke;
  v28[3] = &unk_1E2E60510;
  v30 = v34;
  v31 = v11;
  v32 = v13;
  v18 = v7;
  v29 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v28);
  remoteService = v8->_remoteService;
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_71;
  v26[3] = &unk_1E2E5E220;
  v21 = v19;
  v27 = v21;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_72;
  v24[3] = &unk_1E2E5E220;
  v23 = v21;
  v25 = v23;
  objc_msgSend(v22, "verifyEnableWalrusAllowedWithContext:completion:", v6, v24);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v34, 8);

}

void __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "VerifyEnableWalrusAllowed", (const char *)&unk_192100ADF, (uint8_t *)&v13, 2u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[6];
    v13 = 134218240;
    v14 = v11;
    v15 = 2048;
    v16 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:VerifyEnableWalrusAllowed ", (uint8_t *)&v13, 0x16u);
  }

  v12 = a1[4];
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);

}

void __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_71(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_71_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_72_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Successfully verified allowed to enable walrus status.", v12, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)postWalrusStateUpdateToServerWithContext:(id)a3 urlBagKey:(id)a4 username:(id)a5 password:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AKWalrusController *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  void *v28;
  AAFXPCSession *remoteService;
  id v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD *v39;
  os_signpost_id_t v40;
  uint64_t v41;
  os_activity_scope_state_s state;
  _QWORD v43[5];
  AKWalrusController *v44;
  uint8_t buf[4];
  os_signpost_id_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__8;
  v43[4] = __Block_byref_object_dispose__8;
  v17 = self;
  v44 = v17;
  v18 = _os_activity_create(&dword_19202F000, "walrus-authkit/post-walrus-state-update-to-server", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v18, &state);
  _AKSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = _AKSignpostCreate(v19);
  v22 = v21;

  _AKSignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PostWalrusStateUpdateToServer", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v46 = v20;
    _os_log_impl(&dword_19202F000, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PostWalrusStateUpdateToServer  enableTelemetry=YES ", buf, 0xCu);
  }

  v26 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke;
  v37[3] = &unk_1E2E60510;
  v39 = v43;
  v40 = v20;
  v41 = v22;
  v27 = v16;
  v38 = v27;
  v28 = (void *)MEMORY[0x194022E4C](v37);
  remoteService = v17->_remoteService;
  v35[0] = v26;
  v35[1] = 3221225472;
  v35[2] = __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_73;
  v35[3] = &unk_1E2E5E220;
  v30 = v28;
  v36 = v30;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v35);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v26;
  v33[1] = 3221225472;
  v33[2] = __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_74;
  v33[3] = &unk_1E2E5E220;
  v32 = v30;
  v34 = v32;
  objc_msgSend(v31, "postWalrusStateUpdateToServerWithContext:urlBagKey:username:password:completion:", v12, v13, v14, v15, v33);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v43, 8);

}

void __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PostWalrusStateUpdateToServer", (const char *)&unk_192100ADF, (uint8_t *)&v13, 2u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[6];
    v13 = 134218240;
    v14 = v11;
    v15 = 2048;
    v16 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PostWalrusStateUpdateToServer ", (uint8_t *)&v13, 0x16u);
  }

  v12 = a1[4];
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);

}

void __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_73(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_73_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_74_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Successfully posted walrus state update status to server.", v12, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
}

void __83__AKWalrusController_PCSAuthContextForWebSessionIdentifier_serviceName_completion___block_invoke_2_cold_1(void *a1)
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
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_19202F000, v2, v3, "Connection to Walrus remote service '%s' returned an error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

void __63__AKWalrusController_removeAllPCSAuthCredentialWithCompletion___block_invoke_2_cold_1(void *a1)
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
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_19202F000, v2, v3, "Connection to Walrus remote service '%s' returned an error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

void __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_71_cold_1(void *a1)
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
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_19202F000, v2, v3, "Connection to Walrus remote service '%s' returned an error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

void __70__AKWalrusController_verifyEnableWalrusAllowedWithContext_completion___block_invoke_72_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "Error verifying whether user is allowed to enable walrus - %{public}@", a5, a6, a7, a8, 2u);
}

void __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_73_cold_1(void *a1)
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
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_19202F000, v2, v3, "Connection to Walrus remote service '%s' returned an error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

void __102__AKWalrusController_postWalrusStateUpdateToServerWithContext_urlBagKey_username_password_completion___block_invoke_74_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "Error updating walrus state update status to server - %{public}@", a5, a6, a7, a8, 2u);
}

@end
