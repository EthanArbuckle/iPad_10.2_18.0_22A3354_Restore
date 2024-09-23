@implementation AAInheritanceController

- (void)dealloc
{
  NSObject *v3;
  AAFXPCSession *remoteService;
  objc_super v5;

  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AATrustedContactFlowPresenter dealloc].cold.1((uint64_t)self, v3);

  -[AAFXPCSession invalidate](self->_remoteService, "invalidate");
  remoteService = self->_remoteService;
  self->_remoteService = 0;

  v5.receiver = self;
  v5.super_class = (Class)AAInheritanceController;
  -[AAInheritanceController dealloc](&v5, sel_dealloc);
}

- (void)fetchBeneficiariesWithCompletion:(id)a3
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
  AAInheritanceController *v14;
  uint64_t v15;
  id v16;
  void *v17;
  AAFXPCSession *remoteService;
  id v19;
  void *v20;
  void *v21;
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
  AAInheritanceController *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v6 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/fetch-beneficiaries", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchBeneficiaries enableTelemetry=YES ", (const char *)&unk_19EB99C95, (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchBeneficiaries enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__8;
  v33 = __Block_byref_object_dispose__8;
  v14 = self;
  v34 = v14;
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__AAInheritanceController_fetchBeneficiariesWithCompletion___block_invoke;
  v24[3] = &unk_1E4170168;
  p_buf = &buf;
  v27 = v8;
  v28 = v10;
  v16 = v5;
  v25 = v16;
  v17 = (void *)MEMORY[0x1A1AED7A0](v24);
  remoteService = v14->_remoteService;
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __60__AAInheritanceController_fetchBeneficiariesWithCompletion___block_invoke_94;
  v22[3] = &unk_1E416E660;
  v19 = v17;
  v23 = v19;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fetchBeneficiariesWithCompletion:", v19);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __60__AAInheritanceController_fetchBeneficiariesWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchBeneficiaries", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

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
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchBeneficiaries  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Fetched Beneficiaries: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

- (void)configureRemoteInterface:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[5];
  _QWORD v26[6];
  _QWORD v27[6];

  v27[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  v27[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion_, 0, 1);

  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  v26[4] = objc_opt_class();
  v26[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_fetchManifestOptionsForContact_completion_, 0, 1);

  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  v25[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_fetchBeneficiariesWithCompletion_, 0, 1);

  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  v24[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_fetchBenefactorsWithCompletion_, 0, 1);

  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  v23[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_fetchSuggestedBeneficiariesWithCompletion_, 0, 1);

  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  v22[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_fetchInvitationsWithCompletion_, 0, 1);

  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchInvitationWithBeneficiaryID_completion_, 0, 1);

  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  v20[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_fetchAllHealthInfoWithCompletion_, 0, 1);

}

- (AAInheritanceController)init
{
  AAInheritanceController *v2;
  void *v3;
  uint64_t v4;
  AAFXPCSession *remoteService;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAInheritanceController;
  v2 = -[AAInheritanceController init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC8]), "initWithServiceName:remoteProtocol:options:", CFSTR("com.apple.aa.inheritance.xpc"), &unk_1EE53DBC0, 0);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC0]), "initWithRemoteServiceConfig:delegate:", v3, v2);
    remoteService = v2->_remoteService;
    v2->_remoteService = (AAFXPCSession *)v4;

    -[AAFXPCSession resume](v2->_remoteService, "resume");
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
}

- (void)fetchManifestOptionsForContact:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  AAInheritanceController *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AAFXPCSession *remoteService;
  id v23;
  void *v24;
  void *v25;
  void *v26;
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
  AAInheritanceController *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

    if (v9)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_10;
LABEL_3:
  v10 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/fetch-dataclass-rules", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _AASignpostCreate(v11);
  v14 = v13;

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FetchContactManifestOptions", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchContactManifestOptions  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__8;
  v38 = __Block_byref_object_dispose__8;
  v18 = self;
  v39 = v18;
  v19 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __69__AAInheritanceController_fetchManifestOptionsForContact_completion___block_invoke;
  v29[3] = &unk_1E41700C8;
  p_buf = &buf;
  v32 = v12;
  v33 = v14;
  v20 = v9;
  v30 = v20;
  v21 = (void *)MEMORY[0x1A1AED7A0](v29);
  remoteService = v18->_remoteService;
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __69__AAInheritanceController_fetchManifestOptionsForContact_completion___block_invoke_68;
  v27[3] = &unk_1E416E660;
  v23 = v21;
  v28 = v23;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fetchManifestOptionsForContact:completion:", v7, v23);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __69__AAInheritanceController_fetchManifestOptionsForContact_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
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
  v8 = a2;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 67240192;
    LODWORD(v20) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchContactManifestOptions", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = a1[6];
    _AAErrorUnderlyingError(v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v19 = 134218496;
    v20 = v16;
    v21 = 2048;
    v22 = v15;
    v23 = 1026;
    v24 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchContactManifestOptions  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);

  }
  (*(void (**)(void))(a1[4] + 16))();

}

void __69__AAInheritanceController_fetchManifestOptionsForContact_completion___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__AAInheritanceController_fetchManifestOptionsForContact_completion___block_invoke_68_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)isRecipient:(id)a3 capableOf:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  AAInheritanceController *v20;
  uint64_t v21;
  id v22;
  void *v23;
  AAFXPCSession *remoteService;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 *p_buf;
  os_signpost_id_t v35;
  uint64_t v36;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  AAInheritanceController *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("capability"));

    if (v11)
      goto LABEL_4;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle"));

  if (!v10)
    goto LABEL_11;
LABEL_3:
  if (!v11)
    goto LABEL_12;
LABEL_4:
  v12 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/is-recipient-capable", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = _AASignpostCreate(v13);
  v16 = v15;

  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "BeneficiaryIsRecipientCapable", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: BeneficiaryIsRecipientCapable  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__8;
  v41 = __Block_byref_object_dispose__8;
  v20 = self;
  v42 = v20;
  v21 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __60__AAInheritanceController_isRecipient_capableOf_completion___block_invoke;
  v32[3] = &unk_1E41700F0;
  p_buf = &buf;
  v35 = v14;
  v36 = v16;
  v22 = v11;
  v33 = v22;
  v23 = (void *)MEMORY[0x1A1AED7A0](v32);
  remoteService = v20->_remoteService;
  v30[0] = v21;
  v30[1] = 3221225472;
  v30[2] = __60__AAInheritanceController_isRecipient_capableOf_completion___block_invoke_75;
  v30[3] = &unk_1E416E660;
  v25 = v23;
  v31 = v25;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "isRecipient:capableOf:completion:", v9, v10, v25);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

uint64_t __60__AAInheritanceController_isRecipient_capableOf_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint64_t result;
  int v12;
  uint64_t v13;
  __int16 v14;
  double v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
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
    v12 = 67240192;
    LODWORD(v13) = a2;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "BeneficiaryIsRecipientCapable", " isSupported=%{public,signpost.telemetry:number2,name=isSupported}d ", (uint8_t *)&v12, 8u);
  }

  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218496;
    v13 = a1[6];
    v14 = 2048;
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = 1026;
    v17 = a2;
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: BeneficiaryIsRecipientCapable  isSupported=%{public,signpost.telemetry:number2,name=isSupported}d ", (uint8_t *)&v12, 0x1Cu);
  }

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __60__AAInheritanceController_isRecipient_capableOf_completion___block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AAInheritanceController_isRecipient_capableOf_completion___block_invoke_75_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setupBeneficiaryManifest:(id)a3 contactInfo:(id)a4 setupAuthToken:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  AAInheritanceController *v23;
  uint64_t v24;
  id v25;
  void *v26;
  AAFXPCSession *remoteService;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  __int128 *p_buf;
  os_signpost_id_t v39;
  uint64_t v40;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  AAInheritanceController *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manifest"));

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("beneficiarySetupAuthToken"));

      if (v14)
        goto LABEL_5;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactInfo"));

  if (!v13)
    goto LABEL_13;
LABEL_4:
  if (!v14)
    goto LABEL_14;
LABEL_5:
  v15 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/setup-beneficiary-manifest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  _AASignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = _AASignpostCreate(v16);
  v19 = v18;

  _AASignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SetupBeneficiaryManifest", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetupBeneficiaryManifest  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__8;
  v45 = __Block_byref_object_dispose__8;
  v23 = self;
  v46 = v23;
  v24 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __90__AAInheritanceController_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion___block_invoke;
  v36[3] = &unk_1E4170118;
  p_buf = &buf;
  v39 = v17;
  v40 = v19;
  v25 = v14;
  v37 = v25;
  v26 = (void *)MEMORY[0x1A1AED7A0](v36);
  remoteService = v23->_remoteService;
  v34[0] = v24;
  v34[1] = 3221225472;
  v34[2] = __90__AAInheritanceController_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion___block_invoke_83;
  v34[3] = &unk_1E416E660;
  v28 = v26;
  v35 = v28;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setupBeneficiaryManifest:contactInfo:setupAuthToken:completion:", v11, v12, v13, v28);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __90__AAInheritanceController_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
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
  v8 = a2;

  Nanoseconds = _AASignpostGetNanoseconds(a1[6], a1[7]);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    _AAErrorUnderlyingError(v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 67240192;
    LODWORD(v20) = objc_msgSend(v13, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SetupBeneficiaryManifest", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);

  }
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = a1[6];
    _AAErrorUnderlyingError(v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v19 = 134218496;
    v20 = v16;
    v21 = 2048;
    v22 = v15;
    v23 = 1026;
    v24 = v18;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetupBeneficiaryManifest  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);

  }
  (*(void (**)(void))(a1[4] + 16))();

}

void __90__AAInheritanceController_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __90__AAInheritanceController_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion___block_invoke_83_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAccessCodeForContactInfo:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  AAInheritanceController *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AAFXPCSession *remoteService;
  id v23;
  void *v24;
  void *v25;
  void *v26;
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
  AAInheritanceController *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactInfo"));

    if (v9)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_10;
LABEL_3:
  v10 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/update-access-code", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _AASignpostCreate(v11);
  v14 = v13;

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "RemoveAccessCode", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveAccessCode  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__8;
  v38 = __Block_byref_object_dispose__8;
  v18 = self;
  v39 = v18;
  v19 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __69__AAInheritanceController_removeAccessCodeForContactInfo_completion___block_invoke;
  v29[3] = &unk_1E4170140;
  p_buf = &buf;
  v32 = v12;
  v33 = v14;
  v20 = v9;
  v30 = v20;
  v21 = (void *)MEMORY[0x1A1AED7A0](v29);
  remoteService = v18->_remoteService;
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __69__AAInheritanceController_removeAccessCodeForContactInfo_completion___block_invoke_84;
  v27[3] = &unk_1E416E660;
  v23 = v21;
  v28 = v23;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeAccessCodeForContactInfo:completion:", v7, v23);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __69__AAInheritanceController_removeAccessCodeForContactInfo_completion___block_invoke(_QWORD *a1, void *a2)
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
  int v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    v16 = 67240192;
    LODWORD(v17) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveAccessCode", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);

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
    v16 = 134218496;
    v17 = v13;
    v18 = 2048;
    v19 = v12;
    v20 = 1026;
    v21 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveAccessCode  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);

  }
  (*(void (**)(void))(a1[4] + 16))();

}

void __69__AAInheritanceController_removeAccessCodeForContactInfo_completion___block_invoke_84(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__AAInheritanceController_removeAccessCodeForContactInfo_completion___block_invoke_84_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeBeneficiary:(id)a3 manifest:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  AAInheritanceController *v21;
  uint64_t v22;
  id v23;
  void *v24;
  AAFXPCSession *remoteService;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 *p_buf;
  os_signpost_id_t v35;
  uint64_t v36;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  AAInheritanceController *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("beneficiary"));

    if (v12)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_10;
LABEL_3:
  v13 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/remove-beneficiary", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = _AASignpostCreate(v14);
  v17 = v16;

  _AASignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RemoveBeneficiary", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v15;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveBeneficiary  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__8;
  v41 = __Block_byref_object_dispose__8;
  v21 = self;
  v42 = v21;
  v22 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __65__AAInheritanceController_removeBeneficiary_manifest_completion___block_invoke;
  v32[3] = &unk_1E4170140;
  p_buf = &buf;
  v35 = v15;
  v36 = v17;
  v23 = v12;
  v33 = v23;
  v24 = (void *)MEMORY[0x1A1AED7A0](v32);
  remoteService = v21->_remoteService;
  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __65__AAInheritanceController_removeBeneficiary_manifest_completion___block_invoke_87;
  v30[3] = &unk_1E416E660;
  v26 = v24;
  v31 = v26;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeBeneficiary:manifest:completion:", v9, v10, v26);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __65__AAInheritanceController_removeBeneficiary_manifest_completion___block_invoke(_QWORD *a1, void *a2)
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
  int v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    v16 = 67240192;
    LODWORD(v17) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveBeneficiary", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);

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
    v16 = 134218496;
    v17 = v13;
    v18 = 2048;
    v19 = v12;
    v20 = 1026;
    v21 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveBeneficiary  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);

  }
  (*(void (**)(void))(a1[4] + 16))();

}

void __65__AAInheritanceController_removeBeneficiary_manifest_completion___block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__AAInheritanceController_removeBeneficiary_manifest_completion___block_invoke_87_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeBenefactor:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  AAInheritanceController *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AAFXPCSession *remoteService;
  id v23;
  void *v24;
  void *v25;
  void *v26;
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
  AAInheritanceController *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("benefactor"));

    if (v9)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_10;
LABEL_3:
  v10 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/remove-benefactor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _AASignpostCreate(v11);
  v14 = v13;

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "RemoveBenefactor", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveBenefactor  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__8;
  v38 = __Block_byref_object_dispose__8;
  v18 = self;
  v39 = v18;
  v19 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __55__AAInheritanceController_removeBenefactor_completion___block_invoke;
  v29[3] = &unk_1E4170140;
  p_buf = &buf;
  v32 = v12;
  v33 = v14;
  v20 = v9;
  v30 = v20;
  v21 = (void *)MEMORY[0x1A1AED7A0](v29);
  remoteService = v18->_remoteService;
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __55__AAInheritanceController_removeBenefactor_completion___block_invoke_90;
  v27[3] = &unk_1E416E660;
  v23 = v21;
  v28 = v23;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeBenefactor:completion:", v7, v23);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __55__AAInheritanceController_removeBenefactor_completion___block_invoke(_QWORD *a1, void *a2)
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
  int v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    v16 = 67240192;
    LODWORD(v17) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveBenefactor", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);

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
    v16 = 134218496;
    v17 = v13;
    v18 = 2048;
    v19 = v12;
    v20 = 1026;
    v21 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveBenefactor  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);

  }
  (*(void (**)(void))(a1[4] + 16))();

}

void __55__AAInheritanceController_removeBenefactor_completion___block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__AAInheritanceController_removeBenefactor_completion___block_invoke_90_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateAccessCodeForContactInfo:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  AAInheritanceController *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AAFXPCSession *remoteService;
  id v23;
  void *v24;
  void *v25;
  void *v26;
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
  AAInheritanceController *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactInfo"));

    if (v9)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_10;
LABEL_3:
  v10 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/remove-access-code", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _AASignpostCreate(v11);
  v14 = v13;

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "UpdateAccessCode enableTelemetry=YES ", (const char *)&unk_19EB99C95, (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: UpdateAccessCode enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__8;
  v38 = __Block_byref_object_dispose__8;
  v18 = self;
  v39 = v18;
  v19 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __69__AAInheritanceController_updateAccessCodeForContactInfo_completion___block_invoke;
  v29[3] = &unk_1E4170140;
  p_buf = &buf;
  v32 = v12;
  v33 = v14;
  v20 = v9;
  v30 = v20;
  v21 = (void *)MEMORY[0x1A1AED7A0](v29);
  remoteService = v18->_remoteService;
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __69__AAInheritanceController_updateAccessCodeForContactInfo_completion___block_invoke_91;
  v27[3] = &unk_1E416E660;
  v23 = v21;
  v28 = v23;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "updateAccessCodeForContactInfo:completion:", v7, v23);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __69__AAInheritanceController_updateAccessCodeForContactInfo_completion___block_invoke(_QWORD *a1, void *a2)
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
  int v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    v16 = 67240192;
    LODWORD(v17) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "UpdateAccessCode", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);

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
    v16 = 134218496;
    v17 = v13;
    v18 = 2048;
    v19 = v12;
    v20 = 1026;
    v21 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: UpdateAccessCode  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);

  }
  (*(void (**)(void))(a1[4] + 16))();

}

void __69__AAInheritanceController_updateAccessCodeForContactInfo_completion___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__AAInheritanceController_updateAccessCodeForContactInfo_completion___block_invoke_91_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateBeneficiaryManifest:(id)a3 contactInfo:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  AAInheritanceController *v20;
  uint64_t v21;
  id v22;
  void *v23;
  AAFXPCSession *remoteService;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 *p_buf;
  os_signpost_id_t v35;
  uint64_t v36;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  AAInheritanceController *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactInfo"));

    if (v11)
      goto LABEL_4;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manifest"));

  if (!v10)
    goto LABEL_11;
LABEL_3:
  if (!v11)
    goto LABEL_12;
LABEL_4:
  v12 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/remove-manifest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = _AASignpostCreate(v13);
  v16 = v15;

  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "UpdateBeneficiaryManifest enableTelemetry=YES ", (const char *)&unk_19EB99C95, (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: UpdateBeneficiaryManifest enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__8;
  v41 = __Block_byref_object_dispose__8;
  v20 = self;
  v42 = v20;
  v21 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __76__AAInheritanceController_updateBeneficiaryManifest_contactInfo_completion___block_invoke;
  v32[3] = &unk_1E4170140;
  p_buf = &buf;
  v35 = v14;
  v36 = v16;
  v22 = v11;
  v33 = v22;
  v23 = (void *)MEMORY[0x1A1AED7A0](v32);
  remoteService = v20->_remoteService;
  v30[0] = v21;
  v30[1] = 3221225472;
  v30[2] = __76__AAInheritanceController_updateBeneficiaryManifest_contactInfo_completion___block_invoke_92;
  v30[3] = &unk_1E416E660;
  v25 = v23;
  v31 = v25;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "updateBeneficiaryManifest:contactInfo:completion:", v9, v10, v25);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __76__AAInheritanceController_updateBeneficiaryManifest_contactInfo_completion___block_invoke(_QWORD *a1, void *a2)
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
  int v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    v16 = 67240192;
    LODWORD(v17) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "UpdateBeneficiaryManifest", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);

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
    v16 = 134218496;
    v17 = v13;
    v18 = 2048;
    v19 = v12;
    v20 = 1026;
    v21 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: UpdateBeneficiaryManifest  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);

  }
  (*(void (**)(void))(a1[4] + 16))();

}

void __76__AAInheritanceController_updateBeneficiaryManifest_contactInfo_completion___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__AAInheritanceController_updateBeneficiaryManifest_contactInfo_completion___block_invoke_92_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__AAInheritanceController_fetchBeneficiariesWithCompletion___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AAInheritanceController_fetchBeneficiariesWithCompletion___block_invoke_94_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchBenefactorsWithCompletion:(id)a3
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
  AAInheritanceController *v14;
  uint64_t v15;
  id v16;
  void *v17;
  AAFXPCSession *remoteService;
  id v19;
  void *v20;
  void *v21;
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
  AAInheritanceController *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v6 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/fetch-benefactors", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchBenefactors enableTelemetry=YES ", (const char *)&unk_19EB99C95, (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchBenefactors enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__8;
  v33 = __Block_byref_object_dispose__8;
  v14 = self;
  v34 = v14;
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__AAInheritanceController_fetchBenefactorsWithCompletion___block_invoke;
  v24[3] = &unk_1E4170168;
  p_buf = &buf;
  v27 = v8;
  v28 = v10;
  v16 = v5;
  v25 = v16;
  v17 = (void *)MEMORY[0x1A1AED7A0](v24);
  remoteService = v14->_remoteService;
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __58__AAInheritanceController_fetchBenefactorsWithCompletion___block_invoke_95;
  v22[3] = &unk_1E416E660;
  v19 = v17;
  v23 = v19;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fetchBenefactorsWithCompletion:", v19);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __58__AAInheritanceController_fetchBenefactorsWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchBenefactors", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

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
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchBenefactors  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Fetched Benefactors: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __58__AAInheritanceController_fetchBenefactorsWithCompletion___block_invoke_95(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__AAInheritanceController_fetchBenefactorsWithCompletion___block_invoke_95_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSuggestedBeneficiariesWithCompletion:(id)a3
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
  AAInheritanceController *v14;
  uint64_t v15;
  id v16;
  void *v17;
  AAFXPCSession *remoteService;
  id v19;
  void *v20;
  void *v21;
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
  AAInheritanceController *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v6 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/fetch-suugested-beneficiaries", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchSuggestedBeneficiaries enableTelemetry=YES ", (const char *)&unk_19EB99C95, (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchSuggestedBeneficiaries enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__8;
  v33 = __Block_byref_object_dispose__8;
  v14 = self;
  v34 = v14;
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __69__AAInheritanceController_fetchSuggestedBeneficiariesWithCompletion___block_invoke;
  v24[3] = &unk_1E4170168;
  p_buf = &buf;
  v27 = v8;
  v28 = v10;
  v16 = v5;
  v25 = v16;
  v17 = (void *)MEMORY[0x1A1AED7A0](v24);
  remoteService = v14->_remoteService;
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __69__AAInheritanceController_fetchSuggestedBeneficiariesWithCompletion___block_invoke_96;
  v22[3] = &unk_1E416E660;
  v19 = v17;
  v23 = v19;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fetchSuggestedBeneficiariesWithCompletion:", v19);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __69__AAInheritanceController_fetchSuggestedBeneficiariesWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchSuggestedBeneficiaries", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

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
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchSuggestedBeneficiaries  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Suggested Beneficiaries: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __69__AAInheritanceController_fetchSuggestedBeneficiariesWithCompletion___block_invoke_96(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__AAInheritanceController_fetchSuggestedBeneficiariesWithCompletion___block_invoke_96_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendInvitationToContact:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  AAInheritanceController *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AAFXPCSession *remoteService;
  id v23;
  void *v24;
  void *v25;
  void *v26;
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
  AAInheritanceController *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactInfo"));

    if (v9)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 311, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_10;
LABEL_3:
  v10 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/send-invitation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _AASignpostCreate(v11);
  v14 = v13;

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SendInvitationToContact enableTelemetry=YES ", (const char *)&unk_19EB99C95, (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SendInvitationToContact enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__8;
  v38 = __Block_byref_object_dispose__8;
  v18 = self;
  v39 = v18;
  v19 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __62__AAInheritanceController_sendInvitationToContact_completion___block_invoke;
  v29[3] = &unk_1E4170140;
  p_buf = &buf;
  v32 = v12;
  v33 = v14;
  v20 = v9;
  v30 = v20;
  v21 = (void *)MEMORY[0x1A1AED7A0](v29);
  remoteService = v18->_remoteService;
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __62__AAInheritanceController_sendInvitationToContact_completion___block_invoke_97;
  v27[3] = &unk_1E416E660;
  v23 = v21;
  v28 = v23;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendInvitationToContact:completion:", v7, v23);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __62__AAInheritanceController_sendInvitationToContact_completion___block_invoke(_QWORD *a1, void *a2)
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SendInvitationToContact", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

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
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SendInvitationToContact  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Sent Invitation.", (uint8_t *)&v17, 2u);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __62__AAInheritanceController_sendInvitationToContact_completion___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__AAInheritanceController_sendInvitationToContact_completion___block_invoke_97_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchInvitationsWithCompletion:(id)a3
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
  AAInheritanceController *v14;
  uint64_t v15;
  id v16;
  void *v17;
  AAFXPCSession *remoteService;
  id v19;
  void *v20;
  void *v21;
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
  AAInheritanceController *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 334, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v6 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/fetch-invitations", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchInvitations enableTelemetry=YES ", (const char *)&unk_19EB99C95, (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchInvitations enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__8;
  v33 = __Block_byref_object_dispose__8;
  v14 = self;
  v34 = v14;
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__AAInheritanceController_fetchInvitationsWithCompletion___block_invoke;
  v24[3] = &unk_1E4170168;
  p_buf = &buf;
  v27 = v8;
  v28 = v10;
  v16 = v5;
  v25 = v16;
  v17 = (void *)MEMORY[0x1A1AED7A0](v24);
  remoteService = v14->_remoteService;
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __58__AAInheritanceController_fetchInvitationsWithCompletion___block_invoke_98;
  v22[3] = &unk_1E416E660;
  v19 = v17;
  v23 = v19;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fetchInvitationsWithCompletion:", v19);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __58__AAInheritanceController_fetchInvitationsWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchInvitations", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

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
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchInvitations  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Fetched Invitations: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __58__AAInheritanceController_fetchInvitationsWithCompletion___block_invoke_98(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__AAInheritanceController_fetchInvitationsWithCompletion___block_invoke_98_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchInvitationWithBeneficiaryID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  AAInheritanceController *v17;
  uint64_t v18;
  id v19;
  void *v20;
  AAFXPCSession *remoteService;
  id v22;
  void *v23;
  void *v24;
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
  AAInheritanceController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 357, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/fetch-invitation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = _AASignpostCreate(v10);
  v13 = v12;

  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "BeneficiaryInvitation enableTelemetry=YES ", (const char *)&unk_19EB99C95, (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: BeneficiaryInvitation enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__8;
  v36 = __Block_byref_object_dispose__8;
  v17 = self;
  v37 = v17;
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __71__AAInheritanceController_fetchInvitationWithBeneficiaryID_completion___block_invoke;
  v27[3] = &unk_1E4170190;
  p_buf = &buf;
  v30 = v11;
  v31 = v13;
  v19 = v8;
  v28 = v19;
  v20 = (void *)MEMORY[0x1A1AED7A0](v27);
  remoteService = v17->_remoteService;
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __71__AAInheritanceController_fetchInvitationWithBeneficiaryID_completion___block_invoke_100;
  v25[3] = &unk_1E416E660;
  v22 = v20;
  v26 = v22;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fetchInvitationWithBeneficiaryID:completion:", v7, v22);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __71__AAInheritanceController_fetchInvitationWithBeneficiaryID_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "BeneficiaryInvitation", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

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
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: BeneficiaryInvitation  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Fetched Invitation: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __71__AAInheritanceController_fetchInvitationWithBeneficiaryID_completion___block_invoke_100(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__AAInheritanceController_fetchInvitationWithBeneficiaryID_completion___block_invoke_100_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeInvitation:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  AAInheritanceController *v17;
  uint64_t v18;
  id v19;
  void *v20;
  AAFXPCSession *remoteService;
  id v22;
  void *v23;
  void *v24;
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
  AAInheritanceController *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 381, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitation"));

  }
  v9 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/remove-invitation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = _AASignpostCreate(v10);
  v13 = v12;

  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RemoveInvitation enableTelemetry=YES ", (const char *)&unk_19EB99C95, (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveInvitation enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__8;
  v36 = __Block_byref_object_dispose__8;
  v17 = self;
  v37 = v17;
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __55__AAInheritanceController_removeInvitation_completion___block_invoke;
  v27[3] = &unk_1E4170140;
  p_buf = &buf;
  v30 = v11;
  v31 = v13;
  v19 = v8;
  v28 = v19;
  v20 = (void *)MEMORY[0x1A1AED7A0](v27);
  remoteService = v17->_remoteService;
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __55__AAInheritanceController_removeInvitation_completion___block_invoke_103;
  v25[3] = &unk_1E416E660;
  v22 = v20;
  v26 = v22;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeInvitation:completion:", v7, v22);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __55__AAInheritanceController_removeInvitation_completion___block_invoke(_QWORD *a1, void *a2)
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveInvitation", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

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
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveInvitation  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Removed Invitation.", (uint8_t *)&v17, 2u);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __55__AAInheritanceController_removeInvitation_completion___block_invoke_103(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__AAInheritanceController_removeInvitation_completion___block_invoke_103_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)respondToInvitation:(id)a3 accepted:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
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
  AAInheritanceController *v19;
  uint64_t v20;
  id v21;
  void *v22;
  AAFXPCSession *remoteService;
  id v24;
  void *v25;
  void *v26;
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
  AAInheritanceController *v39;
  uint64_t v40;

  v6 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 406, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("beneficiaryID"));

  }
  v11 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/respond-invitation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = _AASignpostCreate(v12);
  v15 = v14;

  _AASignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RespondToInvitation enableTelemetry=YES ", (const char *)&unk_19EB99C95, (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RespondToInvitation enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__8;
  v38 = __Block_byref_object_dispose__8;
  v19 = self;
  v39 = v19;
  v20 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __67__AAInheritanceController_respondToInvitation_accepted_completion___block_invoke;
  v29[3] = &unk_1E4170140;
  p_buf = &buf;
  v32 = v13;
  v33 = v15;
  v21 = v10;
  v30 = v21;
  v22 = (void *)MEMORY[0x1A1AED7A0](v29);
  remoteService = v19->_remoteService;
  v27[0] = v20;
  v27[1] = 3221225472;
  v27[2] = __67__AAInheritanceController_respondToInvitation_accepted_completion___block_invoke_106;
  v27[3] = &unk_1E416E660;
  v24 = v22;
  v28 = v24;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "respondToInvitation:accepted:completion:", v9, v6, v24);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __67__AAInheritanceController_respondToInvitation_accepted_completion___block_invoke(_QWORD *a1, void *a2)
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
  int v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    v16 = 67240192;
    LODWORD(v17) = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RespondToInvitation", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);

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
    v16 = 134218496;
    v17 = v13;
    v18 = 2048;
    v19 = v12;
    v20 = 1026;
    v21 = v15;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RespondToInvitation  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);

  }
  (*(void (**)(void))(a1[4] + 16))();

}

void __67__AAInheritanceController_respondToInvitation_accepted_completion___block_invoke_106(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__AAInheritanceController_respondToInvitation_accepted_completion___block_invoke_106_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAllHealthInfoWithCompletion:(id)a3
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
  AAInheritanceController *v14;
  uint64_t v15;
  id v16;
  void *v17;
  AAFXPCSession *remoteService;
  id v19;
  void *v20;
  void *v21;
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
  AAInheritanceController *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v6 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/fetch-inheritance-health-info", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchAllHealthInfo enableTelemetry=YES ", (const char *)&unk_19EB99C95, (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAllHealthInfo enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__8;
  v33 = __Block_byref_object_dispose__8;
  v14 = self;
  v34 = v14;
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__AAInheritanceController_fetchAllHealthInfoWithCompletion___block_invoke;
  v24[3] = &unk_1E4170168;
  p_buf = &buf;
  v27 = v8;
  v28 = v10;
  v16 = v5;
  v25 = v16;
  v17 = (void *)MEMORY[0x1A1AED7A0](v24);
  remoteService = v14->_remoteService;
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __60__AAInheritanceController_fetchAllHealthInfoWithCompletion___block_invoke_107;
  v22[3] = &unk_1E416E660;
  v19 = v17;
  v23 = v19;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fetchAllHealthInfoWithCompletion:", v19);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __60__AAInheritanceController_fetchAllHealthInfoWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchAllHealthInfo", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 8u);

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
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchAllHealthInfo  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v20, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Fetched Health Records: %@", (uint8_t *)&v20, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __60__AAInheritanceController_fetchAllHealthInfoWithCompletion___block_invoke_107(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AAInheritanceController_fetchAllHealthInfoWithCompletion___block_invoke_107_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentInheritanceInvitationUIWithBeneficiaryID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  AAInheritanceController *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AAFXPCSession *remoteService;
  id v23;
  void *v24;
  void *v25;
  void *v26;
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
  AAInheritanceController *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 452, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("beneficiaryID"));

    if (v9)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 453, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_10;
LABEL_3:
  v10 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/present-invitation-ui", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _AASignpostCreate(v11);
  v14 = v13;

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PresentInheritanceInvitationUI enableTelemetry=YES ", (const char *)&unk_19EB99C95, (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PresentInheritanceInvitationUI enableTelemetry=YES  ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__8;
  v38 = __Block_byref_object_dispose__8;
  v18 = self;
  v39 = v18;
  v19 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __86__AAInheritanceController_presentInheritanceInvitationUIWithBeneficiaryID_completion___block_invoke;
  v29[3] = &unk_1E4170140;
  p_buf = &buf;
  v32 = v12;
  v33 = v14;
  v20 = v9;
  v30 = v20;
  v21 = (void *)MEMORY[0x1A1AED7A0](v29);
  remoteService = v18->_remoteService;
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __86__AAInheritanceController_presentInheritanceInvitationUIWithBeneficiaryID_completion___block_invoke_108;
  v27[3] = &unk_1E416E660;
  v23 = v21;
  v28 = v23;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "presentInheritanceInvitationUIWithBeneficiaryID:completion:", v7, v23);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __86__AAInheritanceController_presentInheritanceInvitationUIWithBeneficiaryID_completion___block_invoke(_QWORD *a1, void *a2)
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
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PresentInheritanceInvitationUI", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 8u);

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
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PresentInheritanceInvitationUI  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v17, 0x1Cu);

  }
  if (a1[4])
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Initiated invitation UI flow.", (uint8_t *)&v17, 2u);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }

}

void __86__AAInheritanceController_presentInheritanceInvitationUIWithBeneficiaryID_completion___block_invoke_108(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __86__AAInheritanceController_presentInheritanceInvitationUIWithBeneficiaryID_completion___block_invoke_108_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setupBeneficiaryAliasWithAccessKey:(id)a3 password:(id)a4 firstName:(id)a5 lastName:(id)a6 authToken:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  AAInheritanceController *v24;
  uint64_t v25;
  id v26;
  void *v27;
  AAFXPCSession *remoteService;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD *v40;
  _QWORD v41[5];
  AAInheritanceController *v42;
  os_activity_scope_state_s state;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 481, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessKey"));

  }
  v35 = v15;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 482, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("password"));

  }
  v21 = v18;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 483, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authToken"));

  }
  v22 = v17;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAInheritanceController.m"), 484, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v23 = _os_activity_create(&dword_19EACA000, "inheritance-appleaccount/setup-beneficiary-alias", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v23, &state);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__8;
  v41[4] = __Block_byref_object_dispose__8;
  v24 = self;
  v25 = MEMORY[0x1E0C809B0];
  v42 = v24;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __111__AAInheritanceController_setupBeneficiaryAliasWithAccessKey_password_firstName_lastName_authToken_completion___block_invoke;
  v38[3] = &unk_1E41701B8;
  v40 = v41;
  v26 = v20;
  v39 = v26;
  v27 = (void *)MEMORY[0x1A1AED7A0](v38);
  remoteService = v24->_remoteService;
  v36[0] = v25;
  v36[1] = 3221225472;
  v36[2] = __111__AAInheritanceController_setupBeneficiaryAliasWithAccessKey_password_firstName_lastName_authToken_completion___block_invoke_116;
  v36[3] = &unk_1E416E660;
  v29 = v27;
  v37 = v29;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v36);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setupBeneficiaryAliasWithAccessKey:password:firstName:lastName:authToken:completion:", v35, v16, v22, v21, v19, v29);

  _Block_object_dispose(v41, 8);
  os_activity_scope_leave(&state);

}

void __111__AAInheritanceController_setupBeneficiaryAliasWithAccessKey_password_firstName_lastName_authToken_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  if (*(_QWORD *)(a1 + 32))
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Setup Beneficiary Alias", v13, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __111__AAInheritanceController_setupBeneficiaryAliasWithAccessKey_password_firstName_lastName_authToken_completion___block_invoke_116(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __111__AAInheritanceController_setupBeneficiaryAliasWithAccessKey_password_firstName_lastName_authToken_completion___block_invoke_116_cold_1();

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

void __69__AAInheritanceController_fetchManifestOptionsForContact_completion___block_invoke_68_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __60__AAInheritanceController_isRecipient_capableOf_completion___block_invoke_75_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __90__AAInheritanceController_setupBeneficiaryManifest_contactInfo_setupAuthToken_completion___block_invoke_83_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __69__AAInheritanceController_removeAccessCodeForContactInfo_completion___block_invoke_84_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __65__AAInheritanceController_removeBeneficiary_manifest_completion___block_invoke_87_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __55__AAInheritanceController_removeBenefactor_completion___block_invoke_90_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __69__AAInheritanceController_updateAccessCodeForContactInfo_completion___block_invoke_91_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __76__AAInheritanceController_updateBeneficiaryManifest_contactInfo_completion___block_invoke_92_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __60__AAInheritanceController_fetchBeneficiariesWithCompletion___block_invoke_94_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __58__AAInheritanceController_fetchBenefactorsWithCompletion___block_invoke_95_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __69__AAInheritanceController_fetchSuggestedBeneficiariesWithCompletion___block_invoke_96_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __62__AAInheritanceController_sendInvitationToContact_completion___block_invoke_97_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __58__AAInheritanceController_fetchInvitationsWithCompletion___block_invoke_98_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __71__AAInheritanceController_fetchInvitationWithBeneficiaryID_completion___block_invoke_100_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __55__AAInheritanceController_removeInvitation_completion___block_invoke_103_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __67__AAInheritanceController_respondToInvitation_accepted_completion___block_invoke_106_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __60__AAInheritanceController_fetchAllHealthInfoWithCompletion___block_invoke_107_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __86__AAInheritanceController_presentInheritanceInvitationUIWithBeneficiaryID_completion___block_invoke_108_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __111__AAInheritanceController_setupBeneficiaryAliasWithAccessKey_password_firstName_lastName_authToken_completion___block_invoke_116_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19EACA000, v0, v1, "Connection to remote service to %{public}s returned an error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
