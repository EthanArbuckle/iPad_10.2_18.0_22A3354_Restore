@implementation AKCustodianController

- (AKCustodianController)init
{
  return -[AKCustodianController initWithDaemonXPCEndpoint:](self, "initWithDaemonXPCEndpoint:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

- (void)dealloc
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_19202F000, v0, OS_LOG_TYPE_DEBUG, "%@ deallocated", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (AKCustodianController)initWithDaemonXPCEndpoint:(id)a3
{
  id v4;
  AKCustodianController *v5;
  AKCustodianDaemonConnection *v6;
  AKCustodianDaemonConnection *daemonConnection;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKCustodianController;
  v5 = -[AKCustodianController init](&v9, sel_init);
  if (v5)
  {
    v6 = -[AKCustodianDaemonConnection initWithListenerEndpoint:]([AKCustodianDaemonConnection alloc], "initWithListenerEndpoint:", v4);
    daemonConnection = v5->_daemonConnection;
    v5->_daemonConnection = v6;

  }
  return v5;
}

- (void)initiateCustodianSetupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKCustodianController *v8;
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
  AKCustodianDaemonConnection *daemonConnection;
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
  AKCustodianController *v36;
  uint8_t buf[4];
  os_signpost_id_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__16;
  v35[4] = __Block_byref_object_dispose__16;
  v8 = self;
  v36 = v8;
  v9 = _os_activity_create(&dword_19202F000, "custodian-authkit/initiate-custodian", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CustodianSetupStart", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v38 = v11;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianSetupStart  enableTelemetry=YES ", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke;
  v29[3] = &unk_1E2E61F40;
  v32 = v11;
  v33 = v13;
  v31 = v35;
  v18 = v7;
  v30 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v29);
  daemonConnection = v8->_daemonConnection;
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke_12;
  v27[3] = &unk_1E2E5E220;
  v21 = v19;
  v28 = v21;
  -[AKCustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = (os_signpost_id_t)v6;
    _os_log_impl(&dword_19202F000, v23, OS_LOG_TYPE_DEFAULT, "Calling out to remote custodian service to initiate custodian for context %@", buf, 0xCu);
  }

  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke_14;
  v25[3] = &unk_1E2E61F68;
  v24 = v21;
  v26 = v24;
  objc_msgSend(v22, "initiateCustodianSetupWithContext:completion:", v6, v25);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v35, 8);

}

void __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CustodianSetupStart", (const char *)&unk_192100ADF, (uint8_t *)&v16, 2u);
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
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:CustodianSetupStart ", (uint8_t *)&v16, 0x16u);
  }

  v13 = *(_QWORD *)(a1[5] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

  v15 = a1[4];
  if (v15)
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);

}

void __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke_12_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v5, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote custodian initiation call: %@. Error: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)finalizeCustodianSetupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKCustodianController *v8;
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
  AKCustodianDaemonConnection *daemonConnection;
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
  AKCustodianController *v36;
  uint8_t buf[4];
  os_signpost_id_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__16;
  v35[4] = __Block_byref_object_dispose__16;
  v8 = self;
  v36 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/custodian-finalize-custodian", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CustodianSetupFinalize", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v38 = v11;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianSetupFinalize  enableTelemetry=YES ", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke;
  v29[3] = &unk_1E2E60510;
  v32 = v11;
  v33 = v13;
  v31 = v35;
  v18 = v7;
  v30 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v29);
  daemonConnection = v8->_daemonConnection;
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_15;
  v27[3] = &unk_1E2E5E220;
  v21 = v19;
  v28 = v21;
  -[AKCustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = (os_signpost_id_t)v6;
    _os_log_impl(&dword_19202F000, v23, OS_LOG_TYPE_DEFAULT, "Calling out to remote custodian service to finalize custodian for context %@", buf, 0xCu);
  }

  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_16;
  v25[3] = &unk_1E2E5E220;
  v24 = v21;
  v26 = v24;
  objc_msgSend(v22, "finalizeCustodianSetupWithContext:completion:", v6, v25);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v35, 8);

}

void __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[6];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v6, OS_SIGNPOST_INTERVAL_END, v7, "CustodianSetupFinalize", (const char *)&unk_192100ADF, (uint8_t *)&v13, 2u);
  }

  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[6];
    v13 = 134218240;
    v14 = v9;
    v15 = 2048;
    v16 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:CustodianSetupFinalize ", (uint8_t *)&v13, 0x16u);
  }

  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  v12 = a1[4];
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);

}

void __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_15_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_16_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Successfully finalized custodianship.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)revokeCustodianWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKCustodianController *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  AKCustodianDaemonConnection *daemonConnection;
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
  AKCustodianController *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__16;
  v26[4] = __Block_byref_object_dispose__16;
  v8 = self;
  v27 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/custodian-revoke-custodian", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke;
  v22[3] = &unk_1E2E5E9D0;
  v24 = v26;
  v11 = v7;
  v23 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v22);
  daemonConnection = v8->_daemonConnection;
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_2;
  v20[3] = &unk_1E2E5E220;
  v14 = v12;
  v21 = v14;
  -[AKCustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Calling out to remote custodian service to revoke custodian for context %@", buf, 0xCu);
  }

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_17;
  v18[3] = &unk_1E2E5E220;
  v17 = v14;
  v19 = v17;
  objc_msgSend(v15, "revokeCustodianWithContext:completion:", v6, v18);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);

}

void __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke(uint64_t a1, void *a2)
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

void __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_17_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Successfully revoked custodianship.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateCustodianRecoveryKeyWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKCustodianController *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  AKCustodianDaemonConnection *daemonConnection;
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
  AKCustodianController *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__16;
  v26[4] = __Block_byref_object_dispose__16;
  v8 = self;
  v27 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/custodian-update-key", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke;
  v22[3] = &unk_1E2E5E9D0;
  v24 = v26;
  v11 = v7;
  v23 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v22);
  daemonConnection = v8->_daemonConnection;
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_2;
  v20[3] = &unk_1E2E5E220;
  v14 = v12;
  v21 = v14;
  -[AKCustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Updating idMS recovery key with context %@", buf, 0xCu);
  }

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_18;
  v18[3] = &unk_1E2E5E220;
  v17 = v14;
  v19 = v17;
  objc_msgSend(v15, "updateCustodianRecoveryKeyWithContext:completion:", v6, v18);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);

}

void __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke(uint64_t a1, void *a2)
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

void __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_18_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated recovery key with idMS.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startCustodianRecoveryRequestWithContext:(id)a3 completion:(id)a4
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
  AKCustodianController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AKCustodianDaemonConnection *daemonConnection;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  __int128 *p_buf;
  os_signpost_id_t v28;
  uint64_t v29;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  AKCustodianController *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "custodian-authkit/start-custodian-recovery", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CustodianRecoveryStart", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianRecoveryStart  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__16;
  v34 = __Block_byref_object_dispose__16;
  v16 = self;
  v35 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __77__AKCustodianController_startCustodianRecoveryRequestWithContext_completion___block_invoke;
  v25[3] = &unk_1E2E61F90;
  v28 = v10;
  v29 = v12;
  p_buf = &buf;
  v18 = v7;
  v26 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v25);
  daemonConnection = v16->_daemonConnection;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __77__AKCustodianController_startCustodianRecoveryRequestWithContext_completion___block_invoke_20;
  v23[3] = &unk_1E2E5E220;
  v21 = v19;
  v24 = v21;
  -[AKCustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "startCustodianRecoveryRequestWithContext:completion:", v6, v21);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __77__AKCustodianController_startCustodianRecoveryRequestWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CustodianRecoveryStart", (const char *)&unk_192100ADF, (uint8_t *)&v17, 2u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)a1[6];
    v17 = 134218240;
    v18 = v12;
    v19 = 2048;
    v20 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:CustodianRecoveryStart ", (uint8_t *)&v17, 0x16u);
  }

  _AKLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v5)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "startCustodianRecoveryRequestWithContext completed with response: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    __77__AKCustodianController_startCustodianRecoveryRequestWithContext_completion___block_invoke_cold_1();
  }

  v15 = *(_QWORD *)(a1[5] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __77__AKCustodianController_startCustodianRecoveryRequestWithContext_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCustodianRecoveryCodeConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  AKCustodianController *v6;
  uint64_t v7;
  id v8;
  void *v9;
  AKCustodianDaemonConnection *daemonConnection;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  AKCustodianController *v19;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19202F000, "custodian-authkit/fetch-code-config", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__16;
  v18[4] = __Block_byref_object_dispose__16;
  v6 = self;
  v7 = MEMORY[0x1E0C809B0];
  v19 = v6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__AKCustodianController_fetchCustodianRecoveryCodeConfigurationWithCompletion___block_invoke;
  v15[3] = &unk_1E2E5E6B0;
  v17 = v18;
  v8 = v4;
  v16 = v8;
  v9 = (void *)MEMORY[0x194022E4C](v15);
  daemonConnection = v6->_daemonConnection;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __79__AKCustodianController_fetchCustodianRecoveryCodeConfigurationWithCompletion___block_invoke_21;
  v13[3] = &unk_1E2E5E220;
  v11 = v9;
  v14 = v11;
  -[AKCustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchCustodianRecoveryCodeConfigurationWithCompletion:", v11);

  _Block_object_dispose(v18, 8);
  os_activity_scope_leave(&state);

}

void __79__AKCustodianController_fetchCustodianRecoveryCodeConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "fetchCustodianRecoveryCodeConfiguration completed with result: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __79__AKCustodianController_fetchCustodianRecoveryCodeConfigurationWithCompletion___block_invoke_cold_1();
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__AKCustodianController_fetchCustodianRecoveryCodeConfigurationWithCompletion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startCustodianRecoveryTransactionWithContext:(id)a3 completion:(id)a4
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
  void *v15;
  NSObject *v16;
  void *v17;
  AKCustodianController *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AKCustodianDaemonConnection *daemonConnection;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _BYTE *v29;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  AKCustodianController *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "custodian-authkit/custodian-recovery-circle", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    objc_msgSend(v6, "recoverySessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v15;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CustodianRecoveryMessage", " RecoverySessionID=%{public,signpost.telemetry:string1,name=RecoverySessionID}@  enableTelemetry=YES ", buf, 0xCu);

  }
  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "recoverySessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v17;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianRecoveryMessage  RecoverySessionID=%{public,signpost.telemetry:string1,name=RecoverySessionID}@  enableTelemetry=YES ", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__16;
  v35 = __Block_byref_object_dispose__16;
  v18 = self;
  v36 = v18;
  v19 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke;
  v27[3] = &unk_1E2E604C0;
  v30 = v10;
  v31 = v12;
  v29 = buf;
  v20 = v7;
  v28 = v20;
  v21 = (void *)MEMORY[0x194022E4C](v27);
  daemonConnection = v18->_daemonConnection;
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke_23;
  v25[3] = &unk_1E2E5E220;
  v23 = v21;
  v26 = v23;
  -[AKCustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "startCustodianRecoveryTransactionWithContext:completion:", v6, v23);

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

}

void __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke(_QWORD *a1, int a2, void *a3)
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
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CustodianRecoveryMessage", (const char *)&unk_192100ADF, (uint8_t *)&v16, 2u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[6];
    v16 = 134218240;
    v17 = v11;
    v18 = 2048;
    v19 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:CustodianRecoveryMessage ", (uint8_t *)&v16, 0x16u);
  }

  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a2)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "startCustodianRecoveryTransactionWithContext completed successfully", (uint8_t *)&v16, 2u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke_cold_1();
  }

  v14 = *(_QWORD *)(a1[5] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

void __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke_23_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCustodianRecoveryTokenWithContext:(id)a3 completion:(id)a4
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
  void *v15;
  NSObject *v16;
  void *v17;
  AKCustodianController *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AKCustodianDaemonConnection *daemonConnection;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _BYTE *v29;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  AKCustodianController *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "custodian-authkit/fetch-recovery-token", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    objc_msgSend(v6, "recoverySessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v15;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CustodianRecoveryToken", " RecoverySessionID=%{public,signpost.telemetry:string1,name=RecoverySessionID}@  enableTelemetry=YES ", buf, 0xCu);

  }
  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "recoverySessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v17;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianRecoveryToken  RecoverySessionID=%{public,signpost.telemetry:string1,name=RecoverySessionID}@  enableTelemetry=YES ", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__16;
  v35 = __Block_byref_object_dispose__16;
  v18 = self;
  v36 = v18;
  v19 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke;
  v27[3] = &unk_1E2E604E8;
  v30 = v10;
  v31 = v12;
  v29 = buf;
  v20 = v7;
  v28 = v20;
  v21 = (void *)MEMORY[0x194022E4C](v27);
  daemonConnection = v18->_daemonConnection;
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke_25;
  v25[3] = &unk_1E2E5E220;
  v23 = v21;
  v26 = v23;
  -[AKCustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fetchCustodianRecoveryTokenWithContext:completion:", v6, v23);

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

}

void __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CustodianRecoveryToken", (const char *)&unk_192100ADF, (uint8_t *)&v17, 2u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)a1[6];
    v17 = 134218240;
    v18 = v12;
    v19 = 2048;
    v20 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:CustodianRecoveryToken ", (uint8_t *)&v17, 0x16u);
  }

  _AKLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v6)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v5;
    _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "fetchCustodianRecoveryTokenWithContext completed with token: %@", (uint8_t *)&v17, 0xCu);
  }

  v15 = *(_QWORD *)(a1[5] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

void __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke_25_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCustodianDataRecoveryKeyWithContext:(id)a3 completion:(id)a4
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
  void *v15;
  NSObject *v16;
  void *v17;
  AKCustodianController *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AKCustodianDaemonConnection *daemonConnection;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _BYTE *v29;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  AKCustodianController *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "custodian-authkit/fetch-wrap-rkc", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    objc_msgSend(v6, "recoverySessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v15;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CustodianDataRecoveryKey", " RecoverySessionID=%{public,signpost.telemetry:string1,name=RecoverySessionID}@  enableTelemetry=YES ", buf, 0xCu);

  }
  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "recoverySessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v17;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CustodianDataRecoveryKey  RecoverySessionID=%{public,signpost.telemetry:string1,name=RecoverySessionID}@  enableTelemetry=YES ", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__16;
  v35 = __Block_byref_object_dispose__16;
  v18 = self;
  v36 = v18;
  v19 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke;
  v27[3] = &unk_1E2E61F90;
  v30 = v10;
  v31 = v12;
  v29 = buf;
  v20 = v7;
  v28 = v20;
  v21 = (void *)MEMORY[0x194022E4C](v27);
  daemonConnection = v18->_daemonConnection;
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke_26;
  v25[3] = &unk_1E2E5E220;
  v23 = v21;
  v26 = v23;
  -[AKCustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fetchCustodianDataRecoveryKeyWithContext:completion:", v6, v23);

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

}

void __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "CustodianDataRecoveryKey", (const char *)&unk_192100ADF, (uint8_t *)&v17, 2u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)a1[6];
    v17 = 134218240;
    v18 = v12;
    v19 = 2048;
    v20 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:CustodianDataRecoveryKey ", (uint8_t *)&v17, 0x16u);
  }

  _AKLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v5)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "fetchCustodianDataRecoveryKey completed with response: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke_cold_1();
  }

  v15 = *(_QWORD *)(a1[5] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

void __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke_26_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendEmbargoEndNotificationFeedbackWithContext:(id)a3 urlKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  AKCustodianController *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  AKCustodianDaemonConnection *daemonConnection;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  __int128 *p_buf;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  AKCustodianController *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_19202F000, "custodian-authkit/embargo-feedback", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEFAULT, "Starting call to send embargo end notification feedback to IdMS with context: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__16;
  v34 = __Block_byref_object_dispose__16;
  v13 = self;
  v35 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke;
  v26[3] = &unk_1E2E61FB8;
  v15 = v8;
  v27 = v15;
  p_buf = &buf;
  v16 = v10;
  v28 = v16;
  v17 = (void *)MEMORY[0x194022E4C](v26);
  daemonConnection = v13->_daemonConnection;
  v21 = v14;
  v22 = 3221225472;
  v23 = __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_27;
  v24 = &unk_1E2E5E220;
  v19 = v17;
  v25 = v19;
  -[AKCustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", &v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendEmbargoEndNotificationFeedbackWithContext:urlKey:completion:", v15, v9, v19, v21, v22, v23, v24);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "transactionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "sendEmbargoEndNotification completed without error for transactionID: %@", (uint8_t *)&v9, 0xCu);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_27_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performTrustedContactsDataSync:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKCustodianController *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  AKCustodianDaemonConnection *daemonConnection;
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
  AKCustodianController *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__16;
  v26[4] = __Block_byref_object_dispose__16;
  v8 = self;
  v27 = v8;
  v9 = _os_activity_create(&dword_19202F000, "custodian-authkit/perform-trustedContacts-sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __67__AKCustodianController_performTrustedContactsDataSync_completion___block_invoke;
  v22[3] = &unk_1E2E61FE0;
  v24 = v26;
  v11 = v7;
  v23 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v22);
  daemonConnection = v8->_daemonConnection;
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __67__AKCustodianController_performTrustedContactsDataSync_completion___block_invoke_2;
  v20[3] = &unk_1E2E5E220;
  v14 = v12;
  v21 = v14;
  -[AKCustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Starting call to perform trusted contacts data sync with IdMS: %@", buf, 0xCu);
  }

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __67__AKCustodianController_performTrustedContactsDataSync_completion___block_invoke_29;
  v18[3] = &unk_1E2E62008;
  v17 = v14;
  v19 = v17;
  objc_msgSend(v15, "performTrustedContactsDataSync:completion:", v6, v18);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);

}

void __67__AKCustodianController_performTrustedContactsDataSync_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __67__AKCustodianController_performTrustedContactsDataSync_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_27_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__AKCustodianController_performTrustedContactsDataSync_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v5, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Result of trusted contacts data sync call: %@. Error: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __70__AKCustodianController_initiateCustodianSetupWithContext_completion___block_invoke_12_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Initiated Custodian with remote custodian service returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_15_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Finalized Custodian setup with remote custodian service returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__AKCustodianController_finalizeCustodianSetupWithContext_completion___block_invoke_16_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Error finalizing custodianship: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Revoke custodian with remote custodian service returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__AKCustodianController_revokeCustodianWithContext_completion___block_invoke_17_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Error revoking custodianship: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Update recovery key returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__AKCustodianController_updateCustodianRecoveryKeyWithContext_completion___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Error updating recovery key: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__AKCustodianController_startCustodianRecoveryRequestWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "startCustodianRecoveryRequestWithContext completed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__AKCustodianController_fetchCustodianRecoveryCodeConfigurationWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch custodian recovery code configuration with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "startCustodianRecoveryTransactionWithContext completed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __81__AKCustodianController_startCustodianRecoveryTransactionWithContext_completion___block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "XPC Connection failed or interrupted with error: %@ on call: startCustodianRecoveryTransactionWithContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "fetchCustodianRecoveryTokenWithContext completed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__AKCustodianController_fetchCustodianRecoveryTokenWithContext_completion___block_invoke_25_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "XPC Connection failed or interrupted with error: %@ on call: fetchCustodianRecoveryTokenWithContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch custodian data recovery key with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__AKCustodianController_fetchCustodianDataRecoveryKeyWithContext_completion___block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "XPC Connection failed or interrupted with error: %@ on call: fetchCustodianDataRecoveryKeyWithContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "sendEmbargoEndNotificationFeedback failed with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __89__AKCustodianController_sendEmbargoEndNotificationFeedbackWithContext_urlKey_completion___block_invoke_27_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "XPC Connection failed or interrupted with error: %@ on call: sendEmbargoEndNotificationFeedbackWithContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
