@implementation AKAnisetteProvisioningController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_daemonXPCEndpoint, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_anisetteServiceConnection, 0);
}

- (void)dealloc
{
  NSXPCConnection *anisetteServiceConnection;
  NSXPCConnection *v4;
  objc_super v5;

  -[NSLock lock](self->_connectionLock, "lock");
  anisetteServiceConnection = self->_anisetteServiceConnection;
  if (anisetteServiceConnection)
  {
    -[NSXPCConnection invalidate](anisetteServiceConnection, "invalidate");
    v4 = self->_anisetteServiceConnection;
    self->_anisetteServiceConnection = 0;

  }
  -[NSLock unlock](self->_connectionLock, "unlock");
  v5.receiver = self;
  v5.super_class = (Class)AKAnisetteProvisioningController;
  -[AKAnisetteProvisioningController dealloc](&v5, sel_dealloc);
}

void __92__AKAnisetteProvisioningController_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_16(_QWORD *a1, void *a2, void *a3)
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
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[5];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "FetchAnisette", (const char *)&unk_192100ADF, (uint8_t *)&v14, 2u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[5];
    v14 = 134218240;
    v15 = v12;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAnisette ", (uint8_t *)&v14, 0x16u);
  }

  v13 = a1[4];
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

}

void __92__AKAnisetteProvisioningController_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  unint64_t Nanoseconds;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "ak_isXPCServiceError"))
  {
    _AKTrafficLogSubsystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AKAnisetteProvisioningController fetchAnisetteDataAndProvisionIfNecessary:error:].cold.1();

    v8 = *(unsigned __int8 *)(a1 + 64);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __92__AKAnisetteProvisioningController_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_16;
    v17[3] = &unk_1E2E61960;
    v19 = *(_OWORD *)(a1 + 48);
    v9 = *(void **)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v9, "_fetchAnisetteDataAndProvisionIfNecessary:withCompletion:", v8, v17);

  }
  else
  {
    Nanoseconds = _AKSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    _AKSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 48);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19202F000, v12, OS_SIGNPOST_INTERVAL_END, v13, "FetchAnisette", (const char *)&unk_192100ADF, buf, 2u);
    }

    _AKSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218240;
      v21 = v15;
      v22 = 2048;
      v23 = (double)Nanoseconds / 1000000000.0;
      _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAnisette ", buf, 0x16u);
    }

    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }

}

- (id)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  unint64_t Nanoseconds;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  id v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v5 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_19202F000, "authkit/fetch-anisette", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _AKSignpostCreate(v8);
  v11 = v10;

  _AKSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FetchAnisette", (const char *)&unk_192100ADF, buf, 2u);
  }

  _AKSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v28 = v9;
    _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAnisette ", buf, 0xCu);
  }

  v25 = 0;
  -[AKAnisetteProvisioningController _fetchAnisetteDataAndProvisionIfNecessary:error:](self, "_fetchAnisetteDataAndProvisionIfNecessary:error:", v5, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;
  if (objc_msgSend(v16, "ak_isXPCServiceError"))
  {
    _AKTrafficLogSubsystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[AKAnisetteProvisioningController fetchAnisetteDataAndProvisionIfNecessary:error:].cold.1();

    v24 = 0;
    -[AKAnisetteProvisioningController _fetchAnisetteDataAndProvisionIfNecessary:error:](self, "_fetchAnisetteDataAndProvisionIfNecessary:error:", v5, &v24);
    v18 = objc_claimAutoreleasedReturnValue();
    v16 = v24;

    v15 = (void *)v18;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v16);
  Nanoseconds = _AKSignpostGetNanoseconds(v9, v11);
  _AKSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v21, OS_SIGNPOST_INTERVAL_END, v9, "FetchAnisette", (const char *)&unk_192100ADF, buf, 2u);
  }

  _AKSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v28 = v9;
    v29 = 2048;
    v30 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAnisette ", buf, 0x16u);
  }

  os_activity_scope_leave(&state);
  return v15;
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  os_signpost_id_t v19;
  uint64_t v20;
  BOOL v21;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v24;
  uint64_t v25;

  v4 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = _os_activity_create(&dword_19202F000, "authkit/fetch-anisette", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _AKSignpostCreate(v8);
  v11 = v10;

  _AKSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FetchAnisette", (const char *)&unk_192100ADF, buf, 2u);
  }

  _AKSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = v9;
    _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAnisette ", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__AKAnisetteProvisioningController_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke;
  v17[3] = &unk_1E2E61988;
  v21 = v4;
  v17[4] = self;
  v19 = v9;
  v20 = v11;
  v15 = v6;
  v18 = v15;
  v16 = (void *)MEMORY[0x194022E4C](v17);
  -[AKAnisetteProvisioningController _fetchAnisetteDataAndProvisionIfNecessary:withCompletion:](self, "_fetchAnisetteDataAndProvisionIfNecessary:withCompletion:", v4, v16);

  os_activity_scope_leave(&state);
}

- (id)_anisetteServiceConnection
{
  NSXPCConnection *anisetteServiceConnection;
  NSXPCListenerEndpoint *daemonXPCEndpoint;
  id v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  _AKAnisetteProviderProxy *v11;
  NSXPCConnection *v12;
  void *v13;
  NSXPCConnection *v14;
  uint64_t v15;
  NSXPCConnection *v16;
  NSXPCConnection *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  -[NSLock lock](self->_connectionLock, "lock");
  anisetteServiceConnection = self->_anisetteServiceConnection;
  if (!anisetteServiceConnection)
  {
    daemonXPCEndpoint = self->_daemonXPCEndpoint;
    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    if (daemonXPCEndpoint)
      v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithListenerEndpoint:", self->_daemonXPCEndpoint);
    else
      v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", CFSTR("com.apple.ak.anisette.xpc"), 0);
    v7 = self->_anisetteServiceConnection;
    self->_anisetteServiceConnection = v6;

    v8 = self->_anisetteServiceConnection;
    +[AKAnisetteProvisioningDaemonInterface XPCInterface](AKAnisetteProvisioningDaemonInterface, "XPCInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    v10 = self->_anisetteServiceConnection;
    v11 = -[_AKAnisetteProviderProxy initWithProvider:]([_AKAnisetteProviderProxy alloc], "initWithProvider:", self->_anisetteDataProvider);
    -[NSXPCConnection setExportedObject:](v10, "setExportedObject:", v11);

    v12 = self->_anisetteServiceConnection;
    +[AKAnisetteProvisioningClientInterface XPCInterface](AKAnisetteProvisioningClientInterface, "XPCInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v12, "setExportedInterface:", v13);

    objc_initWeak(&location, self);
    v14 = self->_anisetteServiceConnection;
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke;
    v21[3] = &unk_1E2E5E1F8;
    objc_copyWeak(&v22, &location);
    -[NSXPCConnection setInterruptionHandler:](v14, "setInterruptionHandler:", v21);
    v16 = self->_anisetteServiceConnection;
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_38;
    v19[3] = &unk_1E2E5E1F8;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInvalidationHandler:](v16, "setInvalidationHandler:", v19);
    -[NSXPCConnection resume](self->_anisetteServiceConnection, "resume");
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    anisetteServiceConnection = self->_anisetteServiceConnection;
  }
  v17 = anisetteServiceConnection;
  -[NSLock unlock](self->_connectionLock, "unlock");
  return v17;
}

- (AKAnisetteProvisioningController)init
{
  AKAnisetteProvisioningController *v2;
  NSLock *v3;
  NSLock *connectionLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKAnisetteProvisioningController;
  v2 = -[AKAnisetteProvisioningController init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    connectionLock = v2->_connectionLock;
    v2->_connectionLock = v3;

    -[NSLock setName:](v2->_connectionLock, "setName:", CFSTR("AKAnisetteProvisioningControllerXPCLock"));
  }
  return v2;
}

- (void)anisetteDataForURLRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  os_activity_scope_state_s v11;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/anisette-for-request", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v8, &v11);
  if (v6 && (objc_msgSend(v6, "ak_usesHTTPSScheme") & 1) == 0)
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKAnisetteProvisioningController anisetteDataForURLRequest:completion:].cold.1();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAnisetteError"), -8012, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v10);

    }
  }
  else
  {
    -[AKAnisetteProvisioningController fetchAnisetteDataAndProvisionIfNecessary:withCompletion:](self, "fetchAnisetteDataAndProvisionIfNecessary:withCompletion:", 1, v7);
  }
  os_activity_scope_leave(&v11);

}

- (id)anisetteDataWithError:(id *)a3
{
  return -[AKAnisetteProvisioningController fetchAnisetteDataAndProvisionIfNecessary:error:](self, "fetchAnisetteDataAndProvisionIfNecessary:error:", 1, a3);
}

- (AKAnisetteProvisioningController)initWithDaemonXPCEndpoint:(id)a3
{
  id v5;
  AKAnisetteProvisioningController *v6;
  AKAnisetteProvisioningController *v7;

  v5 = a3;
  v6 = -[AKAnisetteProvisioningController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_daemonXPCEndpoint, a3);

  return v7;
}

- (id)initForDevice:(id)a3 provider:(id)a4
{
  id v7;
  id v8;
  AKAnisetteProvisioningController *v9;
  id *p_isa;

  v7 = a3;
  v8 = a4;
  v9 = -[AKAnisetteProvisioningController init](self, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetDevice, a3);
    objc_storeStrong(p_isa + 5, a4);
  }

  return p_isa;
}

- (void)provisionWithCompletion:(id)a3
{
  id v4;
  AKAnisetteProvisioningController *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  AKDevice *targetDevice;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD *v31;
  os_signpost_id_t v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  _QWORD v35[5];
  AKAnisetteProvisioningController *v36;
  uint8_t buf[4];
  os_signpost_id_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__15;
  v35[4] = __Block_byref_object_dispose__15;
  v5 = self;
  v36 = v5;
  v6 = _os_activity_create(&dword_19202F000, "authkit/anisette-provision", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = (void *)os_transaction_create();
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _AKSignpostCreate(v8);
  v11 = v10;

  _AKSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ProvisionAnisette", " enableTelemetry=YES ", buf, 2u);
  }

  _AKSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v38 = v9;
    _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ProvisionAnisette  enableTelemetry=YES ", buf, 0xCu);
  }

  v15 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke;
  v28[3] = &unk_1E2E618E8;
  v32 = v9;
  v33 = v11;
  v31 = v35;
  v16 = v4;
  v30 = v16;
  v17 = v7;
  v29 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v28);
  -[AKAnisetteProvisioningController _anisetteServiceConnection](v5, "_anisetteServiceConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5;
  v26[3] = &unk_1E2E5E220;
  v20 = v18;
  v27 = v20;
  objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  targetDevice = v5->_targetDevice;
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_7;
  v24[3] = &unk_1E2E5E778;
  v23 = v20;
  v25 = v23;
  objc_msgSend(v21, "provisionAnisetteForDevice:completion:", targetDevice, v24);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v35, 8);

}

void __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[7], a1[8]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[7];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "ProvisionAnisette", (const char *)&unk_192100ADF, (uint8_t *)&v15, 2u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[7];
    v15 = 134218240;
    v16 = v11;
    v17 = 2048;
    v18 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:ProvisionAnisette ", (uint8_t *)&v15, 0x16u);
  }

  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

  v14 = a1[5];
  if (v14)
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);

}

void __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_7_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)syncWithSIMData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAnisetteProvisioningController *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  AKDevice *targetDevice;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  os_activity_scope_state_s state;
  _QWORD v29[5];
  AKAnisetteProvisioningController *v30;

  v6 = a3;
  v7 = a4;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__15;
  v29[4] = __Block_byref_object_dispose__15;
  v8 = self;
  v30 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/sync-sim", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = (void *)os_transaction_create();
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke;
  v24[3] = &unk_1E2E61910;
  v27 = v29;
  v12 = v7;
  v26 = v12;
  v13 = v10;
  v25 = v13;
  v14 = (void *)MEMORY[0x194022E4C](v24);
  -[AKAnisetteProvisioningController _anisetteServiceConnection](v8, "_anisetteServiceConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke_2;
  v22[3] = &unk_1E2E5E220;
  v16 = v14;
  v23 = v16;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  targetDevice = v8->_targetDevice;
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke_9;
  v20[3] = &unk_1E2E5E778;
  v19 = v16;
  v21 = v19;
  objc_msgSend(v17, "syncAnisetteWithSIMData:device:completion:", v6, targetDevice, v20);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v29, 8);

}

void __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke_9_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)eraseWithCompletion:(id)a3
{
  id v4;
  AKAnisetteProvisioningController *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  AKDevice *targetDevice;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD *v31;
  os_signpost_id_t v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  _QWORD v35[5];
  AKAnisetteProvisioningController *v36;
  uint8_t buf[4];
  os_signpost_id_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__15;
  v35[4] = __Block_byref_object_dispose__15;
  v5 = self;
  v36 = v5;
  v6 = _os_activity_create(&dword_19202F000, "authkit/anisette-erase", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = (void *)os_transaction_create();
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _AKSignpostCreate(v8);
  v11 = v10;

  _AKSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EraseAnisette", (const char *)&unk_192100ADF, buf, 2u);
  }

  _AKSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v38 = v9;
    _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: EraseAnisette ", buf, 0xCu);
  }

  v15 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke;
  v28[3] = &unk_1E2E618E8;
  v32 = v9;
  v33 = v11;
  v31 = v35;
  v16 = v4;
  v30 = v16;
  v17 = v7;
  v29 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v28);
  -[AKAnisetteProvisioningController _anisetteServiceConnection](v5, "_anisetteServiceConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke_11;
  v26[3] = &unk_1E2E5E220;
  v20 = v18;
  v27 = v20;
  objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  targetDevice = v5->_targetDevice;
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke_12;
  v24[3] = &unk_1E2E5E778;
  v23 = v20;
  v25 = v23;
  objc_msgSend(v21, "eraseAnisetteForDevice:completion:", targetDevice, v24);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v35, 8);

}

void __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[7], a1[8]);
  _AKSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[7];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v8, OS_SIGNPOST_INTERVAL_END, v9, "EraseAnisette", (const char *)&unk_192100ADF, (uint8_t *)&v15, 2u);
  }

  _AKSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[7];
    v15 = 134218240;
    v16 = v11;
    v17 = 2048;
    v18 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:EraseAnisette ", (uint8_t *)&v15, 0x16u);
  }

  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

  v14 = a1[5];
  if (v14)
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);

}

void __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke_12_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)anisetteDataForURLRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "ak_usesHTTPSScheme"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAnisetteError"), -8012, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    -[AKAnisetteProvisioningController fetchAnisetteDataAndProvisionIfNecessary:error:](self, "fetchAnisetteDataAndProvisionIfNecessary:error:", 1, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)anisetteDataWithCompletion:(id)a3
{
  -[AKAnisetteProvisioningController anisetteDataForURLRequest:completion:](self, "anisetteDataForURLRequest:completion:", 0, a3);
}

- (id)_fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  AKDevice *targetDevice;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__15;
  v29 = __Block_byref_object_dispose__15;
  v30 = 0;
  v22 = 0;
  v23[0] = &v22;
  v23[1] = 0x3032000000;
  v23[2] = __Block_byref_object_copy__15;
  v23[3] = __Block_byref_object_dispose__15;
  v24 = 0;
  -[AKAnisetteProvisioningController _anisetteServiceConnection](self, "_anisetteServiceConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke;
  v21[3] = &unk_1E2E5E868;
  v21[4] = &v22;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  targetDevice = self->_targetDevice;
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke_14;
  v20[3] = &unk_1E2E61938;
  v20[4] = &v25;
  v20[5] = &v22;
  objc_msgSend(v9, "fetchAnisetteDataAndProvisionIfNecessary:device:completion:", v5, targetDevice, v20);
  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(v23[0] + 40));
  if (*(_QWORD *)(v23[0] + 40))
  {
    _AKTrafficLogSubsystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AKAnisetteProvisioningController _fetchAnisetteDataAndProvisionIfNecessary:error:].cold.1((uint64_t)v23, v11, v12, v13, v14, v15, v16, v17);

  }
  v18 = (id)v26[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v25, 8);

  return v18;
}

void __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _AKTrafficLogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_QWORD *)(v7 + 40))
  {
    _AKTrafficLogSubsystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke_14_cold_1();

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  v9 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

- (void)_fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  AKAnisetteProvisioningController *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  AKAnisetteProvisioningController *v20;

  v4 = a3;
  v6 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__15;
  v19[4] = __Block_byref_object_dispose__15;
  v7 = self;
  v8 = MEMORY[0x1E0C809B0];
  v20 = v7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke;
  v16[3] = &unk_1E2E619B0;
  v18 = v19;
  v9 = v6;
  v17 = v9;
  v10 = (void *)MEMORY[0x194022E4C](v16);
  -[AKAnisetteProvisioningController _anisetteServiceConnection](v7, "_anisetteServiceConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __93__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_17;
  v14[3] = &unk_1E2E5E220;
  v12 = v10;
  v15 = v12;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "fetchAnisetteDataAndProvisionIfNecessary:device:completion:", v4, v7->_targetDevice, v12);
  _Block_object_dispose(v19, 8);

}

void __93__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  _AKTrafficLogSubsystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke_14_cold_1();
  }

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

uint64_t __93__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  AKAnisetteProvisioningController *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  AKDevice *targetDevice;
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
  AKAnisetteProvisioningController *v28;

  v6 = a3;
  v7 = a4;
  if (!v6)
    v8 = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("No DSID was provided!"), 0);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__15;
  v27[4] = __Block_byref_object_dispose__15;
  v9 = self;
  v28 = v9;
  v10 = _os_activity_create(&dword_19202F000, "authkit/legacy-anisette", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke;
  v23[3] = &unk_1E2E619B0;
  v25 = v27;
  v12 = v7;
  v24 = v12;
  v13 = (void *)MEMORY[0x194022E4C](v23);
  -[AKAnisetteProvisioningController _anisetteServiceConnection](v9, "_anisetteServiceConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke_2;
  v21[3] = &unk_1E2E5E220;
  v15 = v13;
  v22 = v15;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  targetDevice = v9->_targetDevice;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke_21;
  v19[3] = &unk_1E2E619D8;
  v18 = v15;
  v20 = v18;
  objc_msgSend(v16, "legacyAnisetteDataForDSID:device:completion:", v6, targetDevice, v19);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v27, 8);

}

void __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;

  v5 = a3;
  v6 = a2;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke_21_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAnisetteProvisioningController *v8;
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
  AKDevice *targetDevice;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD *v33;
  os_signpost_id_t v34;
  uint64_t v35;
  os_activity_scope_state_s state;
  _QWORD v37[5];
  AKAnisetteProvisioningController *v38;
  uint8_t buf[4];
  os_signpost_id_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__15;
  v37[4] = __Block_byref_object_dispose__15;
  v8 = self;
  v38 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/fetch-peer-attestation-data", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FetchAttestation", (const char *)&unk_192100ADF, buf, 2u);
  }

  _AKSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v40 = v11;
    _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAttestation ", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke;
  v31[3] = &unk_1E2E61A00;
  v34 = v11;
  v35 = v13;
  v33 = v37;
  v18 = v7;
  v32 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v31);
  -[AKAnisetteProvisioningController _anisetteServiceConnection](v8, "_anisetteServiceConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_23;
  v29[3] = &unk_1E2E5E220;
  v21 = v19;
  v30 = v21;
  objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  targetDevice = v8->_targetDevice;
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_24;
  v26[3] = &unk_1E2E60620;
  v24 = v6;
  v27 = v24;
  v25 = v21;
  v28 = v25;
  objc_msgSend(v22, "attestationDataForDevice:withRequest:completion:", targetDevice, v24, v26);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v37, 8);

}

void __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "FetchAttestation", (const char *)&unk_192100ADF, (uint8_t *)&v16, 2u);
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
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAttestation ", (uint8_t *)&v16, 0x16u);
  }

  v13 = *(_QWORD *)(a1[5] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

  v15 = a1[4];
  if (v15)
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);

}

void __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKTrafficLogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKTrafficLogSubsystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_24_cold_1();
  }

  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldEnableAttestationLogging");

  if (v10 == 1)
  {
    _AKTrafficLogSubsystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attestationHeaders");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      v18 = 2112;
      v19 = v6;
      _os_log_debug_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEBUG, "Attestation for request [%@] - headers [%@], error - [%@]", (uint8_t *)&v14, 0x20u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)attestationDataForRequest:(id)a3 error:(id *)a4
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
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  unint64_t Nanoseconds;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  id v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19202F000, "authkit/fetch-attestation-data-sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _AKSignpostCreate(v8);
  v11 = v10;

  _AKSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FetchAttestation", (const char *)&unk_192100ADF, buf, 2u);
  }

  _AKSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v28 = v9;
    _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAttestation ", buf, 0xCu);
  }

  v25 = 0;
  -[AKAnisetteProvisioningController _attestationDataForRequest:error:](self, "_attestationDataForRequest:error:", v6, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;
  if (objc_msgSend(v16, "ak_isXPCServiceError"))
  {
    _AKTrafficLogSubsystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[AKAnisetteProvisioningController attestationDataForRequest:error:].cold.1();

    v24 = 0;
    -[AKAnisetteProvisioningController _attestationDataForRequest:error:](self, "_attestationDataForRequest:error:", v6, &v24);
    v18 = objc_claimAutoreleasedReturnValue();
    v16 = v24;

    v15 = (void *)v18;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v16);
  Nanoseconds = _AKSignpostGetNanoseconds(v9, v11);
  _AKSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v21, OS_SIGNPOST_INTERVAL_END, v9, "FetchAttestation", (const char *)&unk_192100ADF, buf, 2u);
  }

  _AKSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v28 = v9;
    v29 = 2048;
    v30 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAttestation ", buf, 0x16u);
  }

  os_activity_scope_leave(&state);
  return v15;
}

- (id)_attestationDataForRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  AKAttestationRequestData *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__15;
  v29 = __Block_byref_object_dispose__15;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__15;
  v23 = __Block_byref_object_dispose__15;
  v24 = 0;
  -[AKAnisetteProvisioningController _anisetteServiceConnection](self, "_anisetteServiceConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__AKAnisetteProvisioningController__attestationDataForRequest_error___block_invoke;
  v18[3] = &unk_1E2E5E868;
  v18[4] = &v19;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AKAttestationRequestData initWithRequest:requiredHeaders:]([AKAttestationRequestData alloc], "initWithRequest:requiredHeaders:", v6, 0);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __69__AKAnisetteProvisioningController__attestationDataForRequest_error___block_invoke_27;
  v14[3] = &unk_1E2E61A28;
  v11 = v6;
  v15 = v11;
  v16 = &v19;
  v17 = &v25;
  objc_msgSend(v9, "attestationDataForRequestData:completion:", v10, v14);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v12 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __69__AKAnisetteProvisioningController__attestationDataForRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _AKTrafficLogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __69__AKAnisetteProvisioningController__attestationDataForRequest_error___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldEnableAttestationLogging");

  if (v8 == 1)
  {
    _AKTrafficLogSubsystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attestationHeaders");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      v20 = 2112;
      v21 = v6;
      _os_log_debug_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEBUG, "Attestation for request [%@] - headers [%@], error - [%@]", (uint8_t *)&v16, 0x20u);

    }
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    _AKTrafficLogSubsystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();
  }
  else
  {
    _AKTrafficLogSubsystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_24_cold_1();

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = v5;
    v10 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
  }

}

- (void)attestationDataForRequest:(id)a3 completion:(id)a4
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
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  os_signpost_id_t v22;
  uint64_t v23;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/fetch-attestation-data-async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FetchAttestation", (const char *)&unk_192100ADF, buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAttestation ", buf, 0xCu);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__AKAnisetteProvisioningController_attestationDataForRequest_completion___block_invoke;
  v19[3] = &unk_1E2E61A78;
  v19[4] = self;
  v16 = v6;
  v20 = v16;
  v22 = v10;
  v23 = v12;
  v17 = v7;
  v21 = v17;
  v18 = (void *)MEMORY[0x194022E4C](v19);
  -[AKAnisetteProvisioningController _attestationDataForRequest:completion:](self, "_attestationDataForRequest:completion:", v16, v18);

  os_activity_scope_leave(&state);
}

void __73__AKAnisetteProvisioningController_attestationDataForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  unint64_t Nanoseconds;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "ak_isXPCServiceError"))
  {
    _AKTrafficLogSubsystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AKAnisetteProvisioningController attestationDataForRequest:error:].cold.1();

    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__AKAnisetteProvisioningController_attestationDataForRequest_completion___block_invoke_28;
    v17[3] = &unk_1E2E61A50;
    v19 = *(_OWORD *)(a1 + 56);
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v8, "_attestationDataForRequest:completion:", v9, v17);

  }
  else
  {
    Nanoseconds = _AKSignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    _AKSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 56);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19202F000, v12, OS_SIGNPOST_INTERVAL_END, v13, "FetchAttestation", (const char *)&unk_192100ADF, buf, 2u);
    }

    _AKSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134218240;
      v21 = v15;
      v22 = 2048;
      v23 = (double)Nanoseconds / 1000000000.0;
      _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAttestation ", buf, 0x16u);
    }

    v16 = *(_QWORD *)(a1 + 48);
    if (v16)
      (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }

}

void __73__AKAnisetteProvisioningController_attestationDataForRequest_completion___block_invoke_28(_QWORD *a1, void *a2, void *a3)
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
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[5], a1[6]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[5];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "FetchAttestation", (const char *)&unk_192100ADF, (uint8_t *)&v14, 2u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[5];
    v14 = 134218240;
    v15 = v12;
    v16 = 2048;
    v17 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:FetchAttestation ", (uint8_t *)&v14, 0x16u);
  }

  v13 = a1[4];
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

}

- (void)_attestationDataForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAnisetteProvisioningController *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  AKAttestationRequestData *v16;
  AKAttestationRequestData *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  AKAnisetteProvisioningController *v28;

  v6 = a3;
  v7 = a4;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__15;
  v27[4] = __Block_byref_object_dispose__15;
  v8 = self;
  v9 = MEMORY[0x1E0C809B0];
  v28 = v8;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __74__AKAnisetteProvisioningController__attestationDataForRequest_completion___block_invoke;
  v23[3] = &unk_1E2E61AA0;
  v26 = v27;
  v10 = v6;
  v24 = v10;
  v11 = v7;
  v25 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v23);
  -[AKAnisetteProvisioningController _anisetteServiceConnection](v8, "_anisetteServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  v19 = 3221225472;
  v20 = __74__AKAnisetteProvisioningController__attestationDataForRequest_completion___block_invoke_29;
  v21 = &unk_1E2E5E220;
  v14 = v12;
  v22 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [AKAttestationRequestData alloc];
  v17 = -[AKAttestationRequestData initWithRequest:requiredHeaders:](v16, "initWithRequest:requiredHeaders:", v10, 0, v18, v19, v20, v21);
  objc_msgSend(v15, "attestationDataForRequestData:completion:", v17, v14);

  _Block_object_dispose(v27, 8);
}

void __74__AKAnisetteProvisioningController__attestationDataForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  _AKTrafficLogSubsystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();
LABEL_9:

    goto LABEL_10;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_24_cold_1();

  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldEnableAttestationLogging");

  if (v12 == 1)
  {
    _AKTrafficLogSubsystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __74__AKAnisetteProvisioningController__attestationDataForRequest_completion___block_invoke_cold_1(a1, v5, v10);
    goto LABEL_9;
  }
LABEL_10:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

}

uint64_t __74__AKAnisetteProvisioningController__attestationDataForRequest_completion___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetDeviceIdentityWithCompletion:(id)a3
{
  id v4;
  AKAnisetteProvisioningController *v5;
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
  AKAnisetteProvisioningController *v23;

  v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__15;
  v22[4] = __Block_byref_object_dispose__15;
  v5 = self;
  v23 = v5;
  v6 = _os_activity_create(&dword_19202F000, "authkit/reset-baa-certs", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke;
  v18[3] = &unk_1E2E5E9D0;
  v20 = v22;
  v8 = v4;
  v19 = v8;
  v9 = (void *)MEMORY[0x194022E4C](v18);
  -[AKAnisetteProvisioningController _anisetteServiceConnection](v5, "_anisetteServiceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_2;
  v16[3] = &unk_1E2E5E220;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_30;
  v14[3] = &unk_1E2E5E220;
  v13 = v11;
  v15 = v13;
  objc_msgSend(v12, "resetDeviceIdentityWithCompletion:", v14);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v22, 8);

}

void __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke(uint64_t a1, void *a2)
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

void __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKTrafficLogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  _AKTrafficLogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_30_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_30_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setTimeAdjustmentWithServerTime:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAnisetteProvisioningController *v8;
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
  AKAnisetteProvisioningController *v26;

  v6 = a3;
  v7 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__15;
  v25[4] = __Block_byref_object_dispose__15;
  v8 = self;
  v26 = v8;
  v9 = _os_activity_create(&dword_19202F000, "authkit/resync-server-time", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke;
  v21[3] = &unk_1E2E5E9D0;
  v23 = v25;
  v11 = v7;
  v22 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v21);
  -[AKAnisetteProvisioningController _anisetteServiceConnection](v8, "_anisetteServiceConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke_2;
  v19[3] = &unk_1E2E5E220;
  v14 = v12;
  v20 = v14;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke_31;
  v17[3] = &unk_1E2E5E220;
  v16 = v14;
  v18 = v16;
  objc_msgSend(v15, "setTimeAdjustmentWithServerTime:completion:", v6, v17);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v25, 8);

}

void __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke(uint64_t a1, void *a2)
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

void __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKTrafficLogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  _AKTrafficLogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke_31_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)postAttestationAnalytics:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAnisetteProvisioningController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  AKAnisetteProvisioningController *v24;

  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__15;
  v23[4] = __Block_byref_object_dispose__15;
  v8 = self;
  v9 = MEMORY[0x1E0C809B0];
  v24 = v8;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke;
  v20[3] = &unk_1E2E5E9D0;
  v22 = v23;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x194022E4C](v20);
  -[AKAnisetteProvisioningController _anisetteServiceConnection](v8, "_anisetteServiceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke_2;
  v18[3] = &unk_1E2E5E220;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke_32;
  v16[3] = &unk_1E2E5E220;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "postAttestationAnalyticsWithData:completion:", v6, v16);

  _Block_object_dispose(v23, 8);
}

void __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke(uint64_t a1, void *a2)
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

void __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKTrafficLogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  _AKTrafficLogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke_32_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;

  _AKTrafficLogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_cold_1();

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "lock");
    objc_msgSend(v4[1], "setInvalidationHandler:", 0);
    objc_msgSend(v4[1], "invalidate");
    v5 = v4[1];
    v4[1] = 0;

    objc_msgSend(v4[2], "unlock");
  }

}

void __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_38(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;

  _AKTrafficLogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_38_cold_1();

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "lock");
    v5 = v4[1];
    v4[1] = 0;

    objc_msgSend(v4[2], "unlock");
  }

}

- (AKDevice)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(id)a3
{
  objc_storeStrong((id *)&self->_targetDevice, a3);
}

- (AKAnisetteServiceProtocol)anisetteDataProvider
{
  return self->_anisetteDataProvider;
}

- (void)setAnisetteDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_anisetteDataProvider, a3);
}

void __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Remote Anisette service returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__AKAnisetteProvisioningController_provisionWithCompletion___block_invoke_7_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Remote Anisette service successfuly provisioned.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __63__AKAnisetteProvisioningController_syncWithSIMData_completion___block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Remote Anisette service successfuly resynced provisioning data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __56__AKAnisetteProvisioningController_eraseWithCompletion___block_invoke_12_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Remote Anisette service successfuly erased provisioning data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)anisetteDataForURLRequest:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Not allowed to use Anisette data with non-HTTPS URLs.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Anisette fetch failed with XPC error, retrying...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_fetchAnisetteDataAndProvisionIfNecessary:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19202F000, a2, a3, "Remote Anisette service returned an error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __84__AKAnisetteProvisioningController__fetchAnisetteDataAndProvisionIfNecessary_error___block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Remote Anisette service returned Anisette data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __77__AKAnisetteProvisioningController_legacyAnisetteDataForDSID_withCompletion___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Remote Anisette service returned legacy Anisette data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __82__AKAnisetteProvisioningController_fetchPeerAttestationDataForRequest_completion___block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Remote Anisette service returned Attestation data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)attestationDataForRequest:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Attestation fetch failed with XPC error, retrying...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKAnisetteProvisioningController__attestationDataForRequest_completion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "attestationHeaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = 0;
  _os_log_debug_impl(&dword_19202F000, a3, OS_LOG_TYPE_DEBUG, "Attestation for request [%@] - headers [%@], error - [%@]", (uint8_t *)&v7, 0x20u);

}

void __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Remote Anisette service reset BAA certs successfully.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __70__AKAnisetteProvisioningController_resetDeviceIdentityWithCompletion___block_invoke_30_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Remote Anisette service returned an error during resetting device identity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__AKAnisetteProvisioningController_setTimeAdjustmentWithServerTime_completion___block_invoke_31_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Successfully set server time adjustment.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __72__AKAnisetteProvisioningController_postAttestationAnalytics_completion___block_invoke_32_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Successfully posted analytics.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_cold_1()
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

void __62__AKAnisetteProvisioningController__anisetteServiceConnection__block_invoke_38_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Connection to akd was invalidated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
