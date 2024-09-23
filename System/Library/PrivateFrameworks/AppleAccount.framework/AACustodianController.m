@implementation AACustodianController

- (AACustodianController)init
{
  return -[AACustodianController initWithDaemonXPCEndpoint:](self, "initWithDaemonXPCEndpoint:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedPRKC, 0);
  objc_storeStrong((id *)&self->_ownerCustodianAltDSID, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

- (AACustodianController)initWithDaemonXPCEndpoint:(id)a3
{
  id v4;
  AACustodianController *v5;
  AACustodianDaemonConnection *v6;
  AACustodianDaemonConnection *daemonConnection;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AACustodianController;
  v5 = -[AACustodianController init](&v9, sel_init);
  if (v5)
  {
    v6 = -[AACustodianDaemonConnection initWithListenerEndpoint:]([AACustodianDaemonConnection alloc], "initWithListenerEndpoint:", v4);
    daemonConnection = v5->_daemonConnection;
    v5->_daemonConnection = v6;

  }
  return v5;
}

void __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  int v20;
  id v21;
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

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 67240192;
    LODWORD(v21) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchTrustedContacts", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = (void *)a1[6];
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v20 = 134218496;
    v21 = v16;
    v22 = 2048;
    v23 = v15;
    v24 = 1026;
    v25 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchTrustedContacts  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Fetched trusted contacts: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

- (void)fetchTrustedContactsWithCompletion:(id)a3
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
  AACustodianController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AACustodianDaemonConnection *daemonConnection;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AACustodianController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/fetch-trusted-contacts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _AASignpostCreate(v6);
  v9 = v8;

  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchTrustedContacts", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchTrustedContacts  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v13 = self;
  v37 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke;
  v27[3] = &unk_1E4170168;
  p_buf = &buf;
  v30 = v7;
  v31 = v9;
  v15 = v4;
  v28 = v15;
  v16 = (void *)MEMORY[0x1A1AED7A0](v27);
  daemonConnection = v13->_daemonConnection;
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_28;
  v25[3] = &unk_1E416E660;
  v18 = v16;
  v26 = v18;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Fetching trusted contacts.", v24, 2u);
  }

  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_29;
  v22[3] = &unk_1E416EE50;
  v21 = v18;
  v23 = v21;
  objc_msgSend(v19, "fetchTrustedContactsWithCompletion:", v22);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

- (void)setupCustodianshipWithContext:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AACustodianDaemonConnection *daemonConnection;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  os_signpost_id_t v33;
  uint64_t v34;
  os_activity_scope_state_s state;
  uint8_t v36[4];
  void *v37;
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  AACustodianController *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/set-up-custodianship", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SetupCustodianship", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetupCustodianship  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__9;
  v41 = __Block_byref_object_dispose__9;
  v16 = self;
  v42 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke;
  v30[3] = &unk_1E4170C68;
  p_buf = &buf;
  v33 = v10;
  v34 = v12;
  v18 = v7;
  v31 = v18;
  v19 = (void *)MEMORY[0x1A1AED7A0](v30);
  daemonConnection = v16->_daemonConnection;
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_16;
  v28[3] = &unk_1E416E660;
  v21 = v19;
  v29 = v21;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "debugDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v36 = 138412290;
    v37 = v24;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "Setting up custodianship: %@", v36, 0xCu);

  }
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_18;
  v26[3] = &unk_1E4170C90;
  v25 = v21;
  v27 = v25;
  objc_msgSend(v22, "setupCustodianshipWithContext:completion:", v6, v26);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  uint64_t v16;
  void *v17;
  int v18;
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

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 67240192;
    LODWORD(v21) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SetupCustodianship", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = a1[6];
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v20 = 134218496;
    v21 = v16;
    v22 = 2048;
    v23 = v15;
    v24 = 1026;
    v25 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetupCustodianship  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  v19 = a1[4];
  if (v19)
    (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v5, v6);

}

void __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_16_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_18_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)respondToCustodianRequestWithResponse:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AACustodianDaemonConnection *daemonConnection;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t v27[8];
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  os_signpost_id_t v33;
  uint64_t v34;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  AACustodianController *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/custodian-invitation-response", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RespondToCustodianRequest", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RespondToCustodianRequest  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9;
  v39 = __Block_byref_object_dispose__9;
  v16 = self;
  v40 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke;
  v30[3] = &unk_1E4170140;
  p_buf = &buf;
  v33 = v10;
  v34 = v12;
  v18 = v7;
  v31 = v18;
  v19 = (void *)MEMORY[0x1A1AED7A0](v30);
  daemonConnection = v16->_daemonConnection;
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_19;
  v28[3] = &unk_1E416E660;
  v21 = v19;
  v29 = v21;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "Responding to a custodian request.", v27, 2u);
  }

  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_20;
  v25[3] = &unk_1E416E660;
  v24 = v21;
  v26 = v24;
  objc_msgSend(v22, "respondToInviteWithContext:completion:", v6, v25);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
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
  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    _AAErrorUnderlyingError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RespondToCustodianRequest", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    _AAErrorUnderlyingError(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "code");
    v17 = 134218496;
    v18 = v13;
    v19 = 2048;
    v20 = v12;
    v21 = 1026;
    v22 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RespondToCustodianRequest  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);

}

void __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_19_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_20_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Responded to the custodian request successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeCustodian:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AACustodianDaemonConnection *daemonConnection;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 *p_buf;
  os_signpost_id_t v35;
  uint64_t v36;
  os_activity_scope_state_s state;
  uint8_t v38[4];
  void *v39;
  __int128 buf;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  AACustodianController *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/custodian-remove", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RemoveCustodian", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveCustodian  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__9;
  v43 = __Block_byref_object_dispose__9;
  v16 = self;
  v44 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __52__AACustodianController_removeCustodian_completion___block_invoke;
  v32[3] = &unk_1E4170140;
  p_buf = &buf;
  v35 = v10;
  v36 = v12;
  v18 = v7;
  v33 = v18;
  v19 = (void *)MEMORY[0x1A1AED7A0](v32);
  daemonConnection = v16->_daemonConnection;
  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __52__AACustodianController_removeCustodian_completion___block_invoke_21;
  v30[3] = &unk_1E416E660;
  v21 = v19;
  v31 = v21;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v38 = 138412290;
    v39 = v24;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "Removing custodian with ID %@.", v38, 0xCu);

  }
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __52__AACustodianController_removeCustodian_completion___block_invoke_22;
  v27[3] = &unk_1E416E638;
  v25 = v6;
  v28 = v25;
  v26 = v21;
  v29 = v26;
  objc_msgSend(v22, "removeCustodian:completion:", v25, v27);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __52__AACustodianController_removeCustodian_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
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
  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    _AAErrorUnderlyingError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveCustodian", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    _AAErrorUnderlyingError(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "code");
    v17 = 134218496;
    v18 = v13;
    v19 = 2048;
    v20 = v12;
    v21 = 1026;
    v22 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveCustodian  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);

}

void __52__AACustodianController_removeCustodian_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__AACustodianController_removeCustodian_completion___block_invoke_21_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__AACustodianController_removeCustodian_completion___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__AACustodianController_removeCustodian_completion___block_invoke_22_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Custodian %@ removed successfully.", (uint8_t *)&v7, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)stopBeingCustodian:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AACustodianDaemonConnection *daemonConnection;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 *p_buf;
  os_signpost_id_t v35;
  uint64_t v36;
  os_activity_scope_state_s state;
  uint8_t v38[4];
  void *v39;
  __int128 buf;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  AACustodianController *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/stop-being-custodian", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "StopBeingCustodian", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StopBeingCustodian  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__9;
  v43 = __Block_byref_object_dispose__9;
  v16 = self;
  v44 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __55__AACustodianController_stopBeingCustodian_completion___block_invoke;
  v32[3] = &unk_1E4170140;
  p_buf = &buf;
  v35 = v10;
  v36 = v12;
  v18 = v7;
  v33 = v18;
  v19 = (void *)MEMORY[0x1A1AED7A0](v32);
  daemonConnection = v16->_daemonConnection;
  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __55__AACustodianController_stopBeingCustodian_completion___block_invoke_23;
  v30[3] = &unk_1E416E660;
  v21 = v19;
  v31 = v21;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v38 = 138412290;
    v39 = v24;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "Ending custodianship with ID %@.", v38, 0xCu);

  }
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __55__AACustodianController_stopBeingCustodian_completion___block_invoke_24;
  v27[3] = &unk_1E416E638;
  v25 = v6;
  v28 = v25;
  v26 = v21;
  v29 = v26;
  objc_msgSend(v22, "stopBeingCustodian:completion:", v25, v27);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __55__AACustodianController_stopBeingCustodian_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
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
  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    _AAErrorUnderlyingError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "StopBeingCustodian", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    _AAErrorUnderlyingError(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "code");
    v17 = 134218496;
    v18 = v13;
    v19 = 2048;
    v20 = v12;
    v21 = 1026;
    v22 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StopBeingCustodian  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);

}

void __55__AACustodianController_stopBeingCustodian_completion___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__AACustodianController_stopBeingCustodian_completion___block_invoke_23_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__AACustodianController_stopBeingCustodian_completion___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__AACustodianController_stopBeingCustodian_completion___block_invoke_24_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Custodianship %@ has been ended.", (uint8_t *)&v7, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchCachedTrustedContactsWithCompletion:(id)a3
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
  AACustodianController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AACustodianDaemonConnection *daemonConnection;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AACustodianController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/fetch-cached-trusted-contacts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _AASignpostCreate(v6);
  v9 = v8;

  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchCachedTrustedContacts", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCachedTrustedContacts  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v13 = self;
  v37 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke;
  v27[3] = &unk_1E4170168;
  p_buf = &buf;
  v30 = v7;
  v31 = v9;
  v15 = v4;
  v28 = v15;
  v16 = (void *)MEMORY[0x1A1AED7A0](v27);
  daemonConnection = v13->_daemonConnection;
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_26;
  v25[3] = &unk_1E416E660;
  v18 = v16;
  v26 = v18;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Fetching cached trusted contacts.", v24, 2u);
  }

  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_27;
  v22[3] = &unk_1E416EE50;
  v21 = v18;
  v23 = v21;
  objc_msgSend(v19, "fetchCachedTrustedContactsWithCompletion:", v22);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  int v20;
  id v21;
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

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 67240192;
    LODWORD(v21) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCachedTrustedContacts", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = (void *)a1[6];
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v20 = 134218496;
    v21 = v16;
    v22 = 2048;
    v23 = v15;
    v24 = 1026;
    v25 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCachedTrustedContacts  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Fetched cached trusted contacts: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_26_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_27_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_28_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_29_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchCustodianshipInfoWithCompletion:(id)a3
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
  AACustodianController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AACustodianDaemonConnection *daemonConnection;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AACustodianController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/fetch-custodianship-info", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _AASignpostCreate(v6);
  v9 = v8;

  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchCustodianshipInfo", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCustodianshipInfo  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v13 = self;
  v37 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke;
  v27[3] = &unk_1E4170168;
  p_buf = &buf;
  v30 = v7;
  v31 = v9;
  v15 = v4;
  v28 = v15;
  v16 = (void *)MEMORY[0x1A1AED7A0](v27);
  daemonConnection = v13->_daemonConnection;
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_30;
  v25[3] = &unk_1E416E660;
  v18 = v16;
  v26 = v18;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Fetching custodianship info.", v24, 2u);
  }

  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_31;
  v22[3] = &unk_1E416EE50;
  v21 = v18;
  v23 = v21;
  objc_msgSend(v19, "fetchCustodianshipInfoWithCompletion:", v22);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  int v20;
  id v21;
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

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 67240192;
    LODWORD(v21) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCustodianshipInfo", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = (void *)a1[6];
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v20 = 134218496;
    v21 = v16;
    v22 = 2048;
    v23 = v15;
    v24 = 1026;
    v25 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianshipInfo  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Fetched custodianship info: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__AACustodianController_stopBeingCustodian_completion___block_invoke_23_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_31_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchCustodianshipInfoWithUUID:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AACustodianDaemonConnection *daemonConnection;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t v27[8];
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  os_signpost_id_t v33;
  uint64_t v34;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  AACustodianController *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/fetch-custodianship-info-with-uuid", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FetchCustodianshipInfoWithUUID", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCustodianshipInfoWithUUID  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9;
  v39 = __Block_byref_object_dispose__9;
  v16 = self;
  v40 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __67__AACustodianController_fetchCustodianshipInfoWithUUID_completion___block_invoke;
  v30[3] = &unk_1E4170CB8;
  p_buf = &buf;
  v33 = v10;
  v34 = v12;
  v18 = v7;
  v31 = v18;
  v19 = (void *)MEMORY[0x1A1AED7A0](v30);
  daemonConnection = v16->_daemonConnection;
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __67__AACustodianController_fetchCustodianshipInfoWithUUID_completion___block_invoke_33;
  v28[3] = &unk_1E416E660;
  v21 = v19;
  v29 = v21;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "Fetching custodianship info.", v27, 2u);
  }

  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __67__AACustodianController_fetchCustodianshipInfoWithUUID_completion___block_invoke_34;
  v25[3] = &unk_1E4170CE0;
  v24 = v21;
  v26 = v24;
  objc_msgSend(v22, "fetchCustodianshipInfoWithUUID:completion:", v6, v25);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __67__AACustodianController_fetchCustodianshipInfoWithUUID_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  int v20;
  id v21;
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

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 67240192;
    LODWORD(v21) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCustodianshipInfoWithUUID", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = (void *)a1[6];
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v20 = 134218496;
    v21 = v16;
    v22 = 2048;
    v23 = v15;
    v24 = 1026;
    v25 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianshipInfoWithUUID  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Fetched custodianship info: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __67__AACustodianController_fetchCustodianshipInfoWithUUID_completion___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__AACustodianController_stopBeingCustodian_completion___block_invoke_23_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__AACustodianController_fetchCustodianshipInfoWithUUID_completion___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_31_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchSuggestedCustodiansWithCompletion:(id)a3
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
  AACustodianController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AACustodianDaemonConnection *daemonConnection;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AACustodianController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/fetch-suggested-custodians", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _AASignpostCreate(v6);
  v9 = v8;

  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchSuggestedCustodians", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchSuggestedCustodians  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v13 = self;
  v37 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke;
  v27[3] = &unk_1E4170168;
  p_buf = &buf;
  v30 = v7;
  v31 = v9;
  v15 = v4;
  v28 = v15;
  v16 = (void *)MEMORY[0x1A1AED7A0](v27);
  daemonConnection = v13->_daemonConnection;
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke_35;
  v25[3] = &unk_1E416E660;
  v18 = v16;
  v26 = v18;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Fetching suggested custodians.", v24, 2u);
  }

  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke_36;
  v22[3] = &unk_1E416EE50;
  v21 = v18;
  v23 = v21;
  objc_msgSend(v19, "fetchSuggestedCustodiansWithCompletion:", v22);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  int v20;
  id v21;
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

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 67240192;
    LODWORD(v21) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchSuggestedCustodians", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = (void *)a1[6];
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v20 = 134218496;
    v21 = v16;
    v22 = 2048;
    v23 = v15;
    v24 = 1026;
    v25 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchSuggestedCustodians  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Fetched suggested custodians: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__AACustodianController_stopBeingCustodian_completion___block_invoke_23_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke_36_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchCustodianHealthStatusWithCompletion:(id)a3
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
  AACustodianController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AACustodianDaemonConnection *daemonConnection;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AACustodianController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/fetch-custodian-health", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _AASignpostCreate(v6);
  v9 = v8;

  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchCustodianHealthStatus", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCustodianHealthStatus  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v13 = self;
  v37 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke;
  v27[3] = &unk_1E4170168;
  p_buf = &buf;
  v30 = v7;
  v31 = v9;
  v15 = v4;
  v28 = v15;
  v16 = (void *)MEMORY[0x1A1AED7A0](v27);
  daemonConnection = v13->_daemonConnection;
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke_37;
  v25[3] = &unk_1E416E660;
  v18 = v16;
  v26 = v18;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Fetching custodian health status.", v24, 2u);
  }

  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke_38;
  v22[3] = &unk_1E416EE50;
  v21 = v18;
  v23 = v21;
  objc_msgSend(v19, "fetchCustodianHealthStatusWithCompletion:", v22);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  int v20;
  id v21;
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

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 67240192;
    LODWORD(v21) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCustodianHealthStatus", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = (void *)a1[6];
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v20 = 134218496;
    v21 = v16;
    v22 = 2048;
    v23 = v15;
    v24 = 1026;
    v25 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianHealthStatus  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Fetched health info: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__AACustodianController_stopBeingCustodian_completion___block_invoke_23_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke_38_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)startCustodianRecoveryWithContext:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AACustodianDaemonConnection *daemonConnection;
  id v21;
  void *v22;
  NSObject *v23;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AACustodianController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/start-recovery", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "StartCustodianRecovery", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StartCustodianRecovery  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v16 = self;
  v37 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke;
  v27[3] = &unk_1E4170D08;
  p_buf = &buf;
  v30 = v10;
  v31 = v12;
  v18 = v7;
  v28 = v18;
  v19 = (void *)MEMORY[0x1A1AED7A0](v27);
  daemonConnection = v16->_daemonConnection;
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke_40;
  v25[3] = &unk_1E416E660;
  v21 = v19;
  v26 = v21;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "Initiating custodian recovery request.", v24, 2u);
  }

  objc_msgSend(v22, "startCustodianRecoveryWithContext:completion:", v6, v21);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
}

void __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  id v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 67240192;
    LODWORD(v23) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "StartCustodianRecovery", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = (void *)a1[6];
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v22 = 134218496;
    v23 = v16;
    v24 = 2048;
    v25 = v15;
    v26 = 1026;
    v27 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StartCustodianRecovery  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 0x1Cu);

  }
  _AALogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v5)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v5;
      _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Custodian recovery started successfully with recovery ID: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke_cold_1();
  }

  v21 = a1[4];
  if (v21)
    (*(void (**)(uint64_t, id, id))(v21 + 16))(v21, v5, v6);

}

void __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke_40_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCustodianRecoveryConfigurationWithCompletion:(id)a3
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
  AACustodianController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AACustodianDaemonConnection *daemonConnection;
  id v18;
  void *v19;
  NSObject *v20;
  uint8_t v21[8];
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 *p_buf;
  os_signpost_id_t v27;
  uint64_t v28;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  AACustodianController *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/fetch-configuration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _AASignpostCreate(v6);
  v9 = v8;

  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchCustodianRecoveryConfiguration", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCustodianRecoveryConfiguration  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__9;
  v33 = __Block_byref_object_dispose__9;
  v13 = self;
  v34 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke;
  v24[3] = &unk_1E4170D30;
  p_buf = &buf;
  v27 = v7;
  v28 = v9;
  v15 = v4;
  v25 = v15;
  v16 = (void *)MEMORY[0x1A1AED7A0](v24);
  daemonConnection = v13->_daemonConnection;
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke_42;
  v22[3] = &unk_1E416E660;
  v18 = v16;
  v23 = v18;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Fetching custodian configuration.", v21, 2u);
  }

  objc_msgSend(v19, "fetchCustodianRecoveryConfigurationWithCompletion:", v18);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
}

void __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  id v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 67240192;
    LODWORD(v23) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCustodianRecoveryConfiguration", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = (void *)a1[6];
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v22 = 134218496;
    v23 = v16;
    v24 = 2048;
    v25 = v15;
    v26 = 1026;
    v27 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianRecoveryConfiguration  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 0x1Cu);

  }
  _AALogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v5)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v5;
      _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Custodian recovery configuration fetched successfully with configuration: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke_cold_1();
  }

  v21 = a1[4];
  if (v21)
    (*(void (**)(uint64_t, id, id))(v21 + 16))(v21, v5, v6);

}

void __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke_42_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  AACustodianDaemonConnection *daemonConnection;
  id v22;
  void *v23;
  NSObject *v24;
  uint8_t v25[16];
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 *p_buf;
  os_signpost_id_t v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  AACustodianController *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/generate-code", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "GenerateCustodianRecoveryCode", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GenerateCustodianRecoveryCode  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__9;
  v38 = __Block_byref_object_dispose__9;
  v16 = self;
  v39 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke;
  v28[3] = &unk_1E4170D58;
  p_buf = &buf;
  v32 = v10;
  v33 = v12;
  v18 = v6;
  v29 = v18;
  v19 = v7;
  v30 = v19;
  v20 = (void *)MEMORY[0x1A1AED7A0](v28);
  daemonConnection = v16->_daemonConnection;
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke_43;
  v26[3] = &unk_1E416E660;
  v22 = v20;
  v27 = v22;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_19EACA000, v24, OS_LOG_TYPE_DEFAULT, "Calling daemon to generate custodian recovery code", v25, 2u);
  }

  objc_msgSend(v23, "generateCustodianRecoveryCodeWithContext:completion:", v18, v22);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
}

void __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  void *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 67240192;
    LODWORD(v25) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "GenerateCustodianRecoveryCode", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v24, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = *(void **)(a1 + 56);
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v24 = 134218496;
    v25 = v16;
    v26 = 2048;
    v27 = v15;
    v28 = 1026;
    v29 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GenerateCustodianRecoveryCode  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v24, 0x1Cu);

  }
  _AALogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v5)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "custodianUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v22;
      _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Custodian recovery code was generated successfully for custodian: %@", (uint8_t *)&v24, 0xCu);

    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke_cold_1();
  }

  v23 = *(_QWORD *)(a1 + 40);
  if (v23)
    (*(void (**)(uint64_t, id, id))(v23 + 16))(v23, v5, v6);

}

void __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke_43_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)validateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AACustodianDaemonConnection *daemonConnection;
  id v21;
  void *v22;
  NSObject *v23;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AACustodianController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/validate-code", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ValidateCustodianRecoveryCode", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ValidateCustodianRecoveryCode  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v16 = self;
  v37 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke;
  v27[3] = &unk_1E4170D80;
  p_buf = &buf;
  v30 = v10;
  v31 = v12;
  v18 = v7;
  v28 = v18;
  v19 = (void *)MEMORY[0x1A1AED7A0](v27);
  daemonConnection = v16->_daemonConnection;
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke_45;
  v25[3] = &unk_1E416E660;
  v21 = v19;
  v26 = v21;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "Calling daemon to verify custodian recovery code", v24, 2u);
  }

  objc_msgSend(v22, "validateCustodianRecoveryCodeWithContext:completion:", v6, v21);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
}

void __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  id v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 67240192;
    LODWORD(v23) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "ValidateCustodianRecoveryCode", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = (void *)a1[6];
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v22 = 134218496;
    v23 = v16;
    v24 = 2048;
    v25 = v15;
    v26 = 1026;
    v27 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: ValidateCustodianRecoveryCode  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 0x1Cu);

  }
  _AALogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v5)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v5;
      _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Custodian code verification successful with context: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke_cold_1();
  }

  v21 = a1[4];
  if (v21)
    (*(void (**)(uint64_t, id, id))(v21 + 16))(v21, v5, v6);

}

void __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke_45_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCustodianRecoveryKeysWithSessionID:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AACustodianDaemonConnection *daemonConnection;
  id v21;
  void *v22;
  NSObject *v23;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AACustodianController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/fetch-keys", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FetchCustodianRecoveryKeys", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCustodianRecoveryKeys  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v16 = self;
  v37 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke;
  v27[3] = &unk_1E4170DA8;
  p_buf = &buf;
  v30 = v10;
  v31 = v12;
  v18 = v7;
  v28 = v18;
  v19 = (void *)MEMORY[0x1A1AED7A0](v27);
  daemonConnection = v16->_daemonConnection;
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_47;
  v25[3] = &unk_1E416E660;
  v21 = v19;
  v26 = v21;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "Calling daemon service to fetch custodian recovery keys", v24, 2u);
  }

  objc_msgSend(v22, "fetchCustodianRecoveryKeysWithSessionID:completion:", v6, v21);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
}

void __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  id v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 67240192;
    LODWORD(v23) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCustodianRecoveryKeys", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = (void *)a1[6];
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v22 = 134218496;
    v23 = v16;
    v24 = 2048;
    v25 = v15;
    v26 = 1026;
    v27 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianRecoveryKeys  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 0x1Cu);

  }
  _AALogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v5)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v5;
      _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Fetched recovery keys successfully with keys: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_cold_1();
  }

  v21 = a1[4];
  if (v21)
    (*(void (**)(uint64_t, id, id))(v21 + 16))(v21, v5, v6);

}

void __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_47_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)cancelCustodianRecoveryWithSessionID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  AACustodianDaemonConnection *daemonConnection;
  void *v16;
  NSObject *v17;
  id *v18;
  int v19;
  unint64_t Nanoseconds;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  id obj;
  _QWORD v32[5];
  os_activity_scope_state_s state;
  uint8_t v34[4];
  _BYTE v35[18];
  __int16 v36;
  int v37;
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/custodian-cancel-recovery", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  _AASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _AASignpostCreate(v8);
  v11 = v10;

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CancelCustodianRecovery", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CancelCustodianRecovery  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__9;
  v41 = __Block_byref_object_dispose__9;
  v42 = 0;
  daemonConnection = self->_daemonConnection;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __68__AACustodianController_cancelCustodianRecoveryWithSessionID_error___block_invoke;
  v32[3] = &unk_1E4170DD0;
  v32[4] = &buf;
  -[AACustodianDaemonConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "Calling daemon service to cancel custodian recovery", v34, 2u);
  }

  v18 = (id *)(*((_QWORD *)&buf + 1) + 40);
  obj = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v19 = objc_msgSend(v16, "cancelCustodianRecoveryWithSessionID:error:", v6, &obj);
  objc_storeStrong(v18, obj);
  Nanoseconds = _AASignpostGetNanoseconds(v9, v11);
  _AASignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    _AAErrorUnderlyingError(*(void **)(*((_QWORD *)&buf + 1) + 40));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "code");
    *(_DWORD *)v34 = 67240192;
    *(_DWORD *)v35 = v24;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v22, OS_SIGNPOST_INTERVAL_END, v9, "FetchCustodianRecoveryKeys", " Error=%{public,signpost.telemetry:number2,name=Error}d ", v34, 8u);

  }
  _AASignpostLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    _AAErrorUnderlyingError(*(void **)(*((_QWORD *)&buf + 1) + 40));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "code");
    *(_DWORD *)v34 = 134218496;
    *(_QWORD *)v35 = v9;
    *(_WORD *)&v35[8] = 2048;
    *(double *)&v35[10] = (double)Nanoseconds / 1000000000.0;
    v36 = 1026;
    v37 = v27;
    _os_log_impl(&dword_19EACA000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianRecoveryKeys  Error=%{public,signpost.telemetry:number2,name=Error}d ", v34, 0x1Cu);

  }
  _AALogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v34 = 67109378;
    *(_DWORD *)v35 = v19;
    *(_WORD *)&v35[4] = 2112;
    *(_QWORD *)&v35[6] = v29;
    _os_log_impl(&dword_19EACA000, v28, OS_LOG_TYPE_DEFAULT, "Custodian recovery canceled with result: %i, error: %@", v34, 0x12u);
  }

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v19;
}

void __68__AACustodianController_cancelCustodianRecoveryWithSessionID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_47_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (void)fetchCustodianPasswordResetInformationWithSessionID:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  AACustodianDaemonConnection *daemonConnection;
  id v22;
  void *v23;
  NSObject *v24;
  uint8_t v25[16];
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 *p_buf;
  os_signpost_id_t v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  AACustodianController *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/fetch-recovery-token", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FetchCustodianPasswordResetInfo", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCustodianPasswordResetInfo  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__9;
  v38 = __Block_byref_object_dispose__9;
  v16 = self;
  v39 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __88__AACustodianController_fetchCustodianPasswordResetInformationWithSessionID_completion___block_invoke;
  v28[3] = &unk_1E4170DF8;
  p_buf = &buf;
  v32 = v10;
  v33 = v12;
  v18 = v6;
  v29 = v18;
  v19 = v7;
  v30 = v19;
  v20 = (void *)MEMORY[0x1A1AED7A0](v28);
  daemonConnection = v16->_daemonConnection;
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __88__AACustodianController_fetchCustodianPasswordResetInformationWithSessionID_completion___block_invoke_49;
  v26[3] = &unk_1E416E660;
  v22 = v20;
  v27 = v22;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_19EACA000, v24, OS_LOG_TYPE_DEFAULT, "Calling daemon service to fetch custodian recovery token", v25, 2u);
  }

  objc_msgSend(v23, "fetchCustodianPasswordResetInformationWithSessionID:completion:", v18, v22);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
}

void __88__AACustodianController_fetchCustodianPasswordResetInformationWithSessionID_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  double v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[7], a1[8]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[7];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 67240192;
    LODWORD(v24) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchCustodianPasswordResetInfo", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v23, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = a1[7];
    _AAErrorUnderlyingError(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v23 = 134218496;
    v24 = v16;
    v25 = 2048;
    v26 = v15;
    v27 = 1026;
    v28 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCustodianPasswordResetInfo  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v23, 0x1Cu);

  }
  _AALogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v5)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v21 = a1[4];
      v23 = 138412290;
      v24 = v21;
      _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Fetched recovery token successfully for sessionID: %@", (uint8_t *)&v23, 0xCu);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __88__AACustodianController_fetchCustodianPasswordResetInformationWithSessionID_completion___block_invoke_cold_1();
  }

  v22 = a1[5];
  if (v22)
    (*(void (**)(uint64_t, id, id))(v22 + 16))(v22, v5, v6);

}

void __88__AACustodianController_fetchCustodianPasswordResetInformationWithSessionID_completion___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_47_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startHealthCheckWithCompletion:(id)a3
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
  AACustodianController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AACustodianDaemonConnection *daemonConnection;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AACustodianController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/custodian-health-check", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _AASignpostCreate(v6);
  v9 = v8;

  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "StartHealthCheck", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StartHealthCheck  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v13 = self;
  v37 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __56__AACustodianController_startHealthCheckWithCompletion___block_invoke;
  v27[3] = &unk_1E4170140;
  p_buf = &buf;
  v30 = v7;
  v31 = v9;
  v15 = v4;
  v28 = v15;
  v16 = (void *)MEMORY[0x1A1AED7A0](v27);
  daemonConnection = v13->_daemonConnection;
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_50;
  v25[3] = &unk_1E416E660;
  v18 = v16;
  v26 = v18;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Starting health check", v24, 2u);
  }

  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_51;
  v22[3] = &unk_1E416E660;
  v21 = v18;
  v23 = v21;
  objc_msgSend(v19, "startHealthCheckWithCompletion:", v22);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __56__AACustodianController_startHealthCheckWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
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
  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    _AAErrorUnderlyingError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "StartHealthCheck", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    _AAErrorUnderlyingError(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "code");
    v17 = 134218496;
    v18 = v13;
    v19 = 2048;
    v20 = v12;
    v21 = 1026;
    v22 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StartHealthCheck  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);

}

void __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_50_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_51_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)performTrustedContactsDataSyncWithCompletion:(id)a3
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
  AACustodianController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AACustodianDaemonConnection *daemonConnection;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AACustodianController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/trusted-contacts-data-sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _AASignpostCreate(v6);
  v9 = v8;

  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PerformTrustedContactsDataSync", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformTrustedContactsDataSync  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v13 = self;
  v37 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke;
  v27[3] = &unk_1E4170140;
  p_buf = &buf;
  v30 = v7;
  v31 = v9;
  v15 = v4;
  v28 = v15;
  v16 = (void *)MEMORY[0x1A1AED7A0](v27);
  daemonConnection = v13->_daemonConnection;
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_52;
  v25[3] = &unk_1E416E660;
  v18 = v16;
  v26 = v18;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Performing trusted contacts data sync", v24, 2u);
  }

  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_53;
  v22[3] = &unk_1E416E660;
  v21 = v18;
  v23 = v21;
  objc_msgSend(v19, "performTrustedContactsDataSyncWithCompletion:", v22);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
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
  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    _AAErrorUnderlyingError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PerformTrustedContactsDataSync", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    _AAErrorUnderlyingError(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "code");
    v17 = 134218496;
    v18 = v13;
    v19 = 2048;
    v20 = v12;
    v21 = 1026;
    v22 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformTrustedContactsDataSync  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);

}

void __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_52_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_53_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)startManateeMigrationWithCompletion:(id)a3
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
  AACustodianController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AACustodianDaemonConnection *daemonConnection;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AACustodianController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/start-manatee-migration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _AASignpostCreate(v6);
  v9 = v8;

  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "StartManateeMigration", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StartManateeMigration  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v13 = self;
  v37 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke;
  v27[3] = &unk_1E4170140;
  p_buf = &buf;
  v30 = v7;
  v31 = v9;
  v15 = v4;
  v28 = v15;
  v16 = (void *)MEMORY[0x1A1AED7A0](v27);
  daemonConnection = v13->_daemonConnection;
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_54;
  v25[3] = &unk_1E416E660;
  v18 = v16;
  v26 = v18;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Calling out to remote custodian service to start Manatee migration.", v24, 2u);
  }

  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_55;
  v22[3] = &unk_1E416E660;
  v21 = v18;
  v23 = v21;
  objc_msgSend(v19, "startManateeMigrationWithCompletion:", v22);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    _AAErrorUnderlyingError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "StartManateeMigration", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    _AAErrorUnderlyingError(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "code");
    v17 = 134218496;
    v18 = v13;
    v19 = 2048;
    v20 = v12;
    v21 = 1026;
    v22 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StartManateeMigration  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Manatee migration completed", (uint8_t *)&v17, 2u);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_54_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_55_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)pullTrustedContactsFromCloudKitWithCompletion:(id)a3
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
  AACustodianController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AACustodianDaemonConnection *daemonConnection;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  __int128 *p_buf;
  os_signpost_id_t v36;
  uint64_t v37;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  AACustodianController *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/pull-trusted-contacts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _AASignpostCreate(v6);
  v9 = v8;

  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PullTrustedContacts", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PullTrustedContacts  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__9;
  v42 = __Block_byref_object_dispose__9;
  v13 = self;
  v43 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke;
  v33[3] = &unk_1E4170140;
  p_buf = &buf;
  v36 = v7;
  v37 = v9;
  v15 = v4;
  v34 = v15;
  v16 = (void *)MEMORY[0x1A1AED7A0](v33);
  daemonConnection = v13->_daemonConnection;
  v31[0] = v14;
  v31[1] = 3221225472;
  v31[2] = __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_56;
  v31[3] = &unk_1E416E660;
  v18 = v16;
  v32 = v18;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[AACustodianController pullTrustedContactsFromCloudKitWithCompletion:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

  v29[0] = v14;
  v29[1] = 3221225472;
  v29[2] = __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_57;
  v29[3] = &unk_1E416E660;
  v28 = v18;
  v30 = v28;
  objc_msgSend(v19, "pullTrustedContactsFromCloudKitWithCompletion:", v29);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    _AAErrorUnderlyingError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 67240192;
    LODWORD(v27) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PullTrustedContacts", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v26, 8u);

  }
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    _AAErrorUnderlyingError(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "code");
    v26 = 134218496;
    v27 = v13;
    v28 = 2048;
    v29 = v12;
    v30 = 1026;
    v31 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PullTrustedContacts  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v26, 0x1Cu);

  }
  _AALogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v3)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
  }

  v25 = a1[4];
  if (v25)
    (*(void (**)(uint64_t, id))(v25 + 16))(v25, v3);

}

void __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_56_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)displayTrustedContactFlowWithModel:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AACustodianDaemonConnection *daemonConnection;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t v27[8];
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  os_signpost_id_t v33;
  uint64_t v34;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  AACustodianController *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/display-trusted-contact-flow-ui", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "DisplayTrustedContactFlow", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: DisplayTrustedContactFlow  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9;
  v39 = __Block_byref_object_dispose__9;
  v16 = self;
  v40 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke;
  v30[3] = &unk_1E4170140;
  p_buf = &buf;
  v33 = v10;
  v34 = v12;
  v18 = v7;
  v31 = v18;
  v19 = (void *)MEMORY[0x1A1AED7A0](v30);
  daemonConnection = v16->_daemonConnection;
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_58;
  v28[3] = &unk_1E416E660;
  v21 = v19;
  v29 = v21;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "Displaying trusted contact flow from view service.", v27, 2u);
  }

  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_59;
  v25[3] = &unk_1E416E660;
  v24 = v21;
  v26 = v24;
  objc_msgSend(v22, "displayTrustedContactFlowWithModel:completion:", v6, v25);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
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
  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    _AAErrorUnderlyingError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "DisplayTrustedContactFlow", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    _AAErrorUnderlyingError(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "code");
    v17 = 134218496;
    v18 = v13;
    v19 = 2048;
    v20 = v12;
    v21 = 1026;
    v22 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: DisplayTrustedContactFlow  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);

}

void __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_58(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_58_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_59(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_59_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Displayed trusted contact flow UI successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)displayInvitationUIWithUUID:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AACustodianDaemonConnection *daemonConnection;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t v27[8];
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  os_signpost_id_t v33;
  uint64_t v34;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  AACustodianController *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/display-invitation-ui", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "DisplayInvitationUI", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: DisplayInvitationUI  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9;
  v39 = __Block_byref_object_dispose__9;
  v16 = self;
  v40 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke;
  v30[3] = &unk_1E4170140;
  p_buf = &buf;
  v33 = v10;
  v34 = v12;
  v18 = v7;
  v31 = v18;
  v19 = (void *)MEMORY[0x1A1AED7A0](v30);
  daemonConnection = v16->_daemonConnection;
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_60;
  v28[3] = &unk_1E416E660;
  v21 = v19;
  v29 = v21;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "Displaying invitation UI from view service.", v27, 2u);
  }

  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_61;
  v25[3] = &unk_1E416E660;
  v24 = v21;
  v26 = v24;
  objc_msgSend(v22, "displayCustodianInviteWithUUID:completion:", v6, v25);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
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
  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    _AAErrorUnderlyingError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "DisplayInvitationUI", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    _AAErrorUnderlyingError(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "code");
    v17 = 134218496;
    v18 = v13;
    v19 = 2048;
    v20 = v12;
    v21 = 1026;
    v22 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: DisplayInvitationUI  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);

}

void __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_60_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_61_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Displayed invitation UI successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reSendCustodianInvitationWithCustodianID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AACustodianController *v9;
  uint64_t v10;
  id v11;
  void *v12;
  AACustodianDaemonConnection *daemonConnection;
  id v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[8];
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  AACustodianController *v24;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/resend-invite", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__9;
  v23[4] = __Block_byref_object_dispose__9;
  v9 = self;
  v10 = MEMORY[0x1E0C809B0];
  v24 = v9;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77__AACustodianController_reSendCustodianInvitationWithCustodianID_completion___block_invoke;
  v20[3] = &unk_1E416ECD8;
  v22 = v23;
  v11 = v7;
  v21 = v11;
  v12 = (void *)MEMORY[0x1A1AED7A0](v20);
  daemonConnection = v9->_daemonConnection;
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __77__AACustodianController_reSendCustodianInvitationWithCustodianID_completion___block_invoke_2;
  v18[3] = &unk_1E416E660;
  v14 = v12;
  v19 = v14;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Calling daemon service to resend invitation.", v17, 2u);
  }

  objc_msgSend(v15, "reSendCustodianInvitationWithCustodianID:completion:", v6, v14);
  _Block_object_dispose(v23, 8);

  os_activity_scope_leave(&state);
}

void __77__AACustodianController_reSendCustodianInvitationWithCustodianID_completion___block_invoke(uint64_t a1, void *a2)
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

void __77__AACustodianController_reSendCustodianInvitationWithCustodianID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__AACustodianController_reSendCustodianInvitationWithCustodianID_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)availableRecoveryFactorsWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  AACustodianController *v14;
  uint64_t v15;
  id v16;
  void *v17;
  AACustodianDaemonConnection *daemonConnection;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t v26[8];
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  __int128 *p_buf;
  os_signpost_id_t v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  AACustodianController *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AACustodianController.m"), 679, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v6 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/available-recovery-factors", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = _AASignpostCreate(v7);
  v10 = v9;

  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchAvailableRecoveryFactors", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAvailableRecoveryFactors  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__9;
  v38 = __Block_byref_object_dispose__9;
  v14 = self;
  v39 = v14;
  v15 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke;
  v29[3] = &unk_1E4170E20;
  p_buf = &buf;
  v32 = v8;
  v33 = v10;
  v16 = v5;
  v30 = v16;
  v17 = (void *)MEMORY[0x1A1AED7A0](v29);
  daemonConnection = v14->_daemonConnection;
  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_70;
  v27[3] = &unk_1E416E660;
  v19 = v17;
  v28 = v19;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_19EACA000, v21, OS_LOG_TYPE_DEFAULT, "Fetching available recovery factors", v26, 2u);
  }

  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_71;
  v24[3] = &unk_1E416E568;
  v22 = v19;
  v25 = v22;
  objc_msgSend(v20, "availableRecoveryFactorsWithCompletion:", v24);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  NSObject *v13;
  double v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    _AAErrorUnderlyingError(v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 67240192;
    LODWORD(v20) = objc_msgSend(v12, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchAvailableRecoveryFactors", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);

  }
  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (double)Nanoseconds / 1000000000.0;
    v15 = a1[6];
    _AAErrorUnderlyingError(v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "code");
    v19 = 134218496;
    v20 = v15;
    v21 = 2048;
    v22 = v14;
    v23 = 1026;
    v24 = v17;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchAvailableRecoveryFactors  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);

  }
  v18 = a1[4];
  if (v18)
    (*(void (**)(uint64_t, uint64_t, id))(v18 + 16))(v18, a2, v5);

}

void __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_70_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_71(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_71_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)repairCustodians:(id)a3 remove:(id)a4 completion:(id)a5
{
  -[AACustodianController repairCustodians:completion:](self, "repairCustodians:completion:", a3, a5);
}

- (void)repairCustodians:(id)a3 completion:(id)a4
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
  AACustodianController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AACustodianDaemonConnection *daemonConnection;
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
  __int128 *p_buf;
  os_signpost_id_t v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  uint8_t v35[4];
  id v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  AACustodianController *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/custodian-repair", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RepairCustodians", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RepairCustodians  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__9;
  v40 = __Block_byref_object_dispose__9;
  v16 = self;
  v41 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __53__AACustodianController_repairCustodians_completion___block_invoke;
  v29[3] = &unk_1E4170140;
  p_buf = &buf;
  v32 = v10;
  v33 = v12;
  v18 = v7;
  v30 = v18;
  v19 = (void *)MEMORY[0x1A1AED7A0](v29);
  daemonConnection = v16->_daemonConnection;
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __53__AACustodianController_repairCustodians_completion___block_invoke_72;
  v27[3] = &unk_1E416E660;
  v21 = v19;
  v28 = v21;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v35 = 138412290;
    v36 = v6;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "Repairing custodians %@", v35, 0xCu);
  }

  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __53__AACustodianController_repairCustodians_completion___block_invoke_73;
  v25[3] = &unk_1E416E660;
  v24 = v21;
  v26 = v24;
  objc_msgSend(v22, "repairCustodians:completion:", v6, v25);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __53__AACustodianController_repairCustodians_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
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
  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    _AAErrorUnderlyingError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RepairCustodians", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    _AAErrorUnderlyingError(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "code");
    v17 = 134218496;
    v18 = v13;
    v19 = 2048;
    v20 = v12;
    v21 = 1026;
    v22 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RepairCustodians  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);

}

void __53__AACustodianController_repairCustodians_completion___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__AACustodianController_repairCustodians_completion___block_invoke_72_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__AACustodianController_repairCustodians_completion___block_invoke_73(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__AACustodianController_repairCustodians_completion___block_invoke_73_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Custodians repaired successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)preflightCustodianRecoveryWithCompletion:(id)a3
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
  AACustodianController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  AACustodianDaemonConnection *daemonConnection;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AACustodianController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19EACA000, "custodian-appleaccount/preflight-custodian-recovery", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _AASignpostCreate(v6);
  v9 = v8;

  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PreflightCustodianRecovery", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PreflightCustodianRecovery  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  v13 = self;
  v37 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke;
  v27[3] = &unk_1E4170140;
  p_buf = &buf;
  v30 = v7;
  v31 = v9;
  v15 = v4;
  v28 = v15;
  v16 = (void *)MEMORY[0x1A1AED7A0](v27);
  daemonConnection = v13->_daemonConnection;
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_74;
  v25[3] = &unk_1E416E660;
  v18 = v16;
  v26 = v18;
  -[AACustodianDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "Starting Preflight custodian recovery in CustodianController", v24, 2u);
  }

  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_75;
  v22[3] = &unk_1E416E660;
  v21 = v18;
  v23 = v21;
  objc_msgSend(v19, "preflightCustodianRecoveryWithCompletion:", v22);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
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
  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    _AAErrorUnderlyingError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PreflightCustodianRecovery", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

  }
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    _AAErrorUnderlyingError(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "code");
    v17 = 134218496;
    v18 = v13;
    v19 = 2048;
    v20 = v12;
    v21 = 1026;
    v22 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightCustodianRecovery  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  v16 = a1[4];
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);

}

void __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_74_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_75_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Preflight custodian recovery successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_16_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for setting up custodianship return an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__AACustodianController_setupCustodianshipWithContext_completion___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Custodian setup failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for responding to custodian requests returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __74__AACustodianController_respondToCustodianRequestWithResponse_completion___block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Error responding to custodian requests: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __52__AACustodianController_removeCustodian_completion___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for removing custodian returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __52__AACustodianController_removeCustodian_completion___block_invoke_22_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Error removing custodian: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __55__AACustodianController_stopBeingCustodian_completion___block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __55__AACustodianController_stopBeingCustodian_completion___block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Error ending custodianship: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for fetching cached trusted contacts returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__AACustodianController_fetchCachedTrustedContactsWithCompletion___block_invoke_27_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Error fetching cached trusted contacts: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_28_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for fetching trusted contacts returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __60__AACustodianController_fetchTrustedContactsWithCompletion___block_invoke_29_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Error fetching trusted contacts: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __62__AACustodianController_fetchCustodianshipInfoWithCompletion___block_invoke_31_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Error fetching custodianship info: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __64__AACustodianController_fetchSuggestedCustodiansWithCompletion___block_invoke_36_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Error fetching suggested custodians: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__AACustodianController_fetchCustodianHealthStatusWithCompletion___block_invoke_38_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Error fetching health status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Custodian recovery failed to start with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __70__AACustodianController_startCustodianRecoveryWithContext_completion___block_invoke_40_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for starting custodian recovery request returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Custodian recovery configuration failed to fetch with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __75__AACustodianController_fetchCustodianRecoveryConfigurationWithCompletion___block_invoke_42_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for fetching custodian configuration returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Custodian recovery code failed to be generated with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __77__AACustodianController_generateCustodianRecoveryCodeWithContext_completion___block_invoke_43_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for generating custodian recovery code returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Custodian code verification failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __77__AACustodianController_validateCustodianRecoveryCodeWithContext_completion___block_invoke_45_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for validating custodian recovery code returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to fetch recovery keys with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __76__AACustodianController_fetchCustodianRecoveryKeysWithSessionID_completion___block_invoke_47_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for fetching recovery keys returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __88__AACustodianController_fetchCustodianPasswordResetInformationWithSessionID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to fetch recovery token with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_50_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for health check return an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__AACustodianController_startHealthCheckWithCompletion___block_invoke_51_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Custodian health check failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_52_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for trusted contacts data sync returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __70__AACustodianController_performTrustedContactsDataSyncWithCompletion___block_invoke_53_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Performing trusted contacts data sync failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_54_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for starting Manatee migration return an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __61__AACustodianController_startManateeMigrationWithCompletion___block_invoke_55_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Manatee migration failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)pullTrustedContactsFromCloudKitWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, a1, a3, "Calling out to remote custodian service to pull trusted contacts from CloudKit.", a5, a6, a7, a8, 0);
}

void __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, a1, a3, "Completed pulling trusted contacts from CloudKit", a5, a6, a7, a8, 0);
}

void __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to pull trusted contacts from CloudKit: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__AACustodianController_pullTrustedContactsFromCloudKitWithCompletion___block_invoke_56_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for pulling trusted contacts from CloudKit return an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_58_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for displaying trusted contact flow returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __71__AACustodianController_displayTrustedContactFlowWithModel_completion___block_invoke_59_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Displayed trusted contact flow with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_60_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for displaying invitation UI returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __64__AACustodianController_displayInvitationUIWithUUID_completion___block_invoke_61_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Displayed invitation UI with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __77__AACustodianController_reSendCustodianInvitationWithCustodianID_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for resending invitation encountered error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_70_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for fetching available recovery factors returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __64__AACustodianController_availableRecoveryFactorsWithCompletion___block_invoke_71_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Fetching available recovery factors failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__AACustodianController_repairCustodians_completion___block_invoke_72_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for repairing custodian returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__AACustodianController_repairCustodians_completion___block_invoke_73_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Error repairing error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_74_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AppleAccount daemon connection for Preflighting custodian returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__AACustodianController_preflightCustodianRecoveryWithCompletion___block_invoke_75_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Preflight custodian recovery failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
