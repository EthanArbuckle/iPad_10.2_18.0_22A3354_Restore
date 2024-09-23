@implementation AKAppleIDSigningController

- (AKAppleIDSigningController)init
{
  return -[AKAppleIDSigningController initWithDaemonXPCEndpoint:](self, "initWithDaemonXPCEndpoint:", 0);
}

- (AKAppleIDSigningController)initWithDaemonXPCEndpoint:(id)a3
{
  id v5;
  AKAppleIDSigningController *v6;
  AKAppleIDSigningController *v7;
  AKAppleIDAuthenticationController *v8;
  AKAppleIDAuthenticationController *authenticationController;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *signingQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKAppleIDSigningController;
  v6 = -[AKAppleIDSigningController init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listenerEndpoint, a3);
    v8 = objc_alloc_init(AKAppleIDAuthenticationController);
    authenticationController = v7->_authenticationController;
    v7->_authenticationController = v8;

    v7->_signerLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.authkit.signingQ", v10);
    signingQueue = v7->_signingQueue;
    v7->_signingQueue = (OS_dispatch_queue *)v11;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AKAppleIDSigningController;
  -[AKAppleIDSigningController dealloc](&v3, sel_dealloc);
}

- (id)_connection
{
  os_unfair_lock_s *p_signerLock;
  void *v3;
  _QWORD v5[5];

  p_signerLock = &self->_signerLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AKAppleIDSigningController__connection__block_invoke;
  v5[3] = &unk_1E2E5F278;
  v5[4] = self;
  os_unfair_lock_lock(&self->_signerLock);
  __41__AKAppleIDSigningController__connection__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_signerLock);
  return v3;
}

id __41__AKAppleIDSigningController__connection__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void (**v5)(void);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[4];
  if (!v3)
  {
    objc_initWeak(&location, v2);
    v4 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __41__AKAppleIDSigningController__connection__block_invoke_2;
    v21[3] = &unk_1E2E5F278;
    v21[4] = *(_QWORD *)(a1 + 32);
    v5 = (void (**)(void))MEMORY[0x194022E4C](v21);
    v5[2]();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = v6;

    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    +[AKAppleIDSigningDaemonInterface XPCInterface](AKAppleIDSigningDaemonInterface, "XPCInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRemoteObjectInterface:", v10);

    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v19[0] = v4;
    v19[1] = 3221225472;
    v19[2] = __41__AKAppleIDSigningController__connection__block_invoke_3;
    v19[3] = &unk_1E2E5E1F8;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v11, "setInterruptionHandler:", v19);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v14 = v4;
    v15 = 3221225472;
    v16 = __41__AKAppleIDSigningController__connection__block_invoke_4;
    v17 = &unk_1E2E5E1F8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v12, "setInvalidationHandler:", &v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resume", v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return v3;
}

id __41__AKAppleIDSigningController__connection__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
  if (v2)
    v4 = (void *)objc_msgSend(v3, "initWithListenerEndpoint:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  else
    v4 = (void *)objc_msgSend(v3, "initWithMachServiceName:options:", CFSTR("com.apple.ak.anisette.xpc"), 0);
  return v4;
}

void __41__AKAppleIDSigningController__connection__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __41__AKAppleIDSigningController__connection__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

- (void)_connectionInterrupted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Connection to akd signer was interrupted!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __52__AKAppleIDSigningController__connectionInterrupted__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

- (void)_connectionInvalidated
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Connection to akd signer was invalidated: this is fine.™", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __52__AKAppleIDSigningController__connectionInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

- (void)absintheSignatureForData:(id)a3 completion:(id)a4
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
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/absinthe-signature-for-data", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke;
  v20[3] = &unk_1E2E5FDC8;
  v20[4] = self;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x194022E4C](v20);
  -[AKAppleIDSigningController _connection](self, "_connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2;
  v18[3] = &unk_1E2E5E220;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_72;
  v16[3] = &unk_1E2E5FDF0;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "absintheSignatureForData:completion:", v6, v16);

  os_activity_scope_leave(&state);
}

uint64_t __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_72(uint64_t a1, void *a2, void *a3)
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
      __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_72_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)signaturesForData:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
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
  _QWORD v23[5];
  id v24;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_19202F000, "authkit/signatures-for-data", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __67__AKAppleIDSigningController_signaturesForData_options_completion___block_invoke;
  v23[3] = &unk_1E2E5FE18;
  v23[4] = self;
  v13 = v10;
  v24 = v13;
  v14 = (void *)MEMORY[0x194022E4C](v23);
  -[AKAppleIDSigningController _connection](self, "_connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __67__AKAppleIDSigningController_signaturesForData_options_completion___block_invoke_2;
  v21[3] = &unk_1E2E5E220;
  v16 = v14;
  v22 = v16;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __67__AKAppleIDSigningController_signaturesForData_options_completion___block_invoke_74;
  v19[3] = &unk_1E2E5F160;
  v18 = v16;
  v20 = v18;
  objc_msgSend(v17, "signaturesForData:options:completion:", v8, v9, v19);

  os_activity_scope_leave(&state);
}

uint64_t __67__AKAppleIDSigningController_signaturesForData_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __67__AKAppleIDSigningController_signaturesForData_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__AKAppleIDSigningController_signaturesForData_options_completion___block_invoke_74(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_72_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)attestationDataForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDSigningController attestationDataForRequest:completion:].cold.1();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__AKAppleIDSigningController_attestationDataForRequest_completion___block_invoke;
  v10[3] = &unk_1E2E5F0B0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[AKAppleIDSigningController signingHeadersForRequest:completion:](self, "signingHeadersForRequest:completion:", v6, v10);

}

void __67__AKAppleIDSigningController_attestationDataForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  AKAttestationData *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __67__AKAppleIDSigningController_attestationDataForRequest_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "%@: Generated additional headers for attestation (%@)", (uint8_t *)&v12, 0x16u);
  }

  v10 = -[AKAttestationData initWithDictionary:]([AKAttestationData alloc], "initWithDictionary:", v5);
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, AKAttestationData *, id))(v11 + 16))(v11, v10, v6);

}

- (BOOL)isProxy
{
  return self->_isProxy;
}

- (void)setIsProxy:(BOOL)a3
{
  self->_isProxy = a3;
}

- (NSString)initialURLKey
{
  return self->_initialURLKey;
}

- (void)setInitialURLKey:(id)a3
{
  objc_storeStrong((id *)&self->_initialURLKey, a3);
}

- (AKAppleIDAuthenticationController)authenticationController
{
  return self->_authenticationController;
}

- (void)setAuthenticationController:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationController, a3);
}

- (BOOL)shouldSendAbsintheHeader
{
  return self->_shouldSendAbsintheHeader;
}

- (void)setShouldSendAbsintheHeader:(BOOL)a3
{
  self->_shouldSendAbsintheHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_initialURLKey, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_signingQueue, 0);
}

- (void)signingHeadersForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AKAppleIDSigningController authenticationController](self, "authenticationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke;
  v11[3] = &unk_1E2E5FF58;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "fetchURLBagForAltDSID:completion:", 0, v11);

}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_group_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void (**v19)(_QWORD);
  void (**v20)(_QWORD, _QWORD);
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  id v34;
  NSObject *group;
  _QWORD block[4];
  id v37;
  id v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  NSObject *v48;
  uint64_t v49;
  id v50;
  id v51;
  uint8_t *v52;
  id v53;
  uint8_t buf[8];
  uint8_t *v55;
  uint64_t v56;
  char v57;
  id location[2];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = dispatch_group_create();
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_initWeak(location, *(id *)(a1 + 32));
    *(_QWORD *)buf = 0;
    v55 = buf;
    v56 = 0x2020000000;
    v9 = MEMORY[0x1E0C809B0];
    v57 = 0;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_123;
    v47[3] = &unk_1E2E5FE90;
    v52 = buf;
    v10 = v7;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v48 = v10;
    v49 = v11;
    v50 = v12;
    objc_copyWeak(&v53, location);
    v13 = v8;
    v51 = v13;
    v14 = (void *)MEMORY[0x194022E4C](v47);
    v39[0] = v9;
    v39[1] = 3221225472;
    v39[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_125;
    v39[3] = &unk_1E2E5FF08;
    v15 = v10;
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v40 = v15;
    v41 = v16;
    v42 = v17;
    objc_copyWeak(&v46, location);
    v18 = v13;
    v43 = v18;
    v44 = v6;
    v19 = v14;
    v45 = v19;
    v20 = (void (**)(_QWORD, _QWORD))MEMORY[0x194022E4C](v39);
    objc_opt_class();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cfgs"));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    group = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;

    objc_opt_class();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("abs-enable"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;

    if (v25)
    {
      v19[2](v19);
    }
    else
    {
      _AKLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_cold_2();

    }
    v34 = v6;
    objc_opt_class();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("baa-interval"));
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v28)
    {
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("AKAttestationSignerValidity"));
      ((void (**)(_QWORD, void *))v20)[2](v20, v30);
    }
    else
    {
      _AKLogSystem();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_cold_1();

      if (!v25)
        v19[2](v19);
    }
    v32 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_130;
    block[3] = &unk_1E2E5FF30;
    v37 = v18;
    v38 = *(id *)(a1 + 48);
    v33 = v18;
    dispatch_group_notify(group, v32, block);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&v53);

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(location);

    v6 = v34;
  }
  else
  {
    _AKLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v23, OS_LOG_TYPE_DEFAULT, "urlBag not present", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_additionalAbsintheHeadersForRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_123(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2;
    v5[3] = &unk_1E2E5FE68;
    objc_copyWeak(&v8, (id *)(a1 + 72));
    v6 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v3, "_additionalAbsintheHeadersForRequest:completion:", v4, v5);

    objc_destroyWeak(&v8);
  }
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained[2];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_3;
  block[3] = &unk_1E2E5FE40;
  v12 = v5;
  v13 = a1[4];
  v14 = v6;
  v15 = WeakRetained;
  v16 = a1[5];
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_3_cold_2(a1);

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:");
  }
  else
  {
    _AKLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_3_cold_1();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "code"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(*(_QWORD *)(a1 + 56) + 40))
      v6 = CFSTR("X-MMe-Proxied-Nas-E");
    else
      v6 = CFSTR("X-MMe-Nas-E");
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_125(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_125_cold_1();

  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_126;
  v9[3] = &unk_1E2E5FEE0;
  objc_copyWeak(&v15, (id *)(a1 + 80));
  v10 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v14 = *(id *)(a1 + 72);
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v5, "_additionalAttestationHeadersForRequest:options:completion:", v6, v3, v9);

  objc_destroyWeak(&v15);
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8 = WeakRetained[2];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2_127;
  block[3] = &unk_1E2E5FEB8;
  v14 = v5;
  v15 = *(id *)(a1 + 32);
  v16 = v6;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v17 = v9;
  v18 = v10;
  v20 = *(id *)(a1 + 64);
  v19 = *(id *)(a1 + 56);
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, block);

}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2_127(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2_127_cold_2(a1);

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:");
  }
  else
  {
    _AKLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2_127_cold_1();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "code"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "underlyingErrors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 56), "underlyingErrors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v10, "code"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v12;
    }
    if (*(_BYTE *)(*(_QWORD *)(a1 + 64) + 40))
      v13 = CFSTR("X-Apple-Proxied-Baa-E");
    else
      v13 = CFSTR("X-Apple-Baa-E");
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_130(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_130_cold_1(a1);

  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

}

- (void)signWithBAAHeaders:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = CFSTR("AKAttestationUseDeviceCheckKeychainAccess");
  v15[0] = &unk_1E2E9A298;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke;
  v11[3] = &unk_1E2E5FF58;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[AKAppleIDSigningController _additionalAttestationHeadersForRequest:options:completion:](self, "_additionalAttestationHeadersForRequest:options:completion:", v10, v8, v11);

}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[2] = __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2;
  block[3] = &unk_1E2E5FFA8;
  block[1] = 3221225472;
  v14 = v5;
  v15 = v6;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = v10;
  v18 = *(id *)(a1 + 48);
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, block);

}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  void *v71;
  const __CFString *v72;
  _QWORD v73[3];

  v73[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = v2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v2, "addEntriesFromDictionary:");
  }
  else
  {
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_7();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "underlyingErrors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") == 0;

    if (!v8)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 40), "underlyingErrors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v11, "code"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v13;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("X-Apple-Baa-E"));
    objc_msgSend(*(id *)(a1 + 40), "ak_allUnderlyingErrors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_133;
    v66[3] = &unk_1E2E5FF80;
    v67 = v15;
    v16 = v15;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v66);
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("|"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("X-Apple-Baa-UE"));

  }
  if (SDeviceIdentityIsSupported())
    v18 = CFSTR("1");
  else
    v18 = CFSTR("2");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("X-Apple-Baa-Avail"));
  objc_msgSend(*(id *)(a1 + 48), "HTTPBody");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ak_serverFriendlyString");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "ak_SHA256Data");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "aaf_toHexString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lowercaseString");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v58, v59);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "dataUsingEncoding:", 4);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (SDeviceIdentityIsSupported())
    {
      v64 = 0;
      v65 = 0;
      v22 = v56;
      v68 = 0;
      v69 = &v68;
      v70 = 0x2020000000;
      v23 = getDeviceIdentityCreateHostSignatureSymbolLoc_ptr;
      v71 = getDeviceIdentityCreateHostSignatureSymbolLoc_ptr;
      if (!getDeviceIdentityCreateHostSignatureSymbolLoc_ptr)
      {
        v24 = (void *)DeviceIdentityLibrary_0();
        v23 = dlsym(v24, "DeviceIdentityCreateHostSignature");
        v69[3] = (uint64_t)v23;
        getDeviceIdentityCreateHostSignatureSymbolLoc_ptr = v23;
      }
      _Block_object_dispose(&v68, 8);
      if (!v23)
      {
        _BYSetupAssistantNeedsToRun_cold_1();
        __break(1u);
      }
      ((void (*)(id, _QWORD, id *, id *))v23)(v22, 0, &v65, &v64);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v65;
      v26 = v64;
      if (!v26)
        goto LABEL_26;
    }
    else
    {
      _AKLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_6();

      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7066);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v25 = 0;
      if (!v26)
        goto LABEL_26;
    }
    _AKLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_5();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v26, "code"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "underlyingErrors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count") == 0;

    if (!v32)
    {
      v33 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v26, "underlyingErrors");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "numberWithInteger:", objc_msgSend(v35, "code"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringValue");
      v37 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)v37;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("X-Apple-Host-Baa-E"));

LABEL_26:
    if (v61 && v25)
    {
      _AKLogSystem();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_4();

      v39 = *(void **)(a1 + 56);
      v63 = 0;
      objc_msgSend(v39, "_parseDERCertificatesFromChain:error:", v25, &v63);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v63;
      if (!v40)
      {
        v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "base64EncodedStringWithOptions:", 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addObject:", v42);

        objc_msgSend(v55, "objectAtIndexedSubscript:", 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "base64EncodedStringWithOptions:", 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addObject:", v44);

        _AKLogSystem();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_3();

        v72 = CFSTR("certs");
        v73[0] = v54;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v53, 0, &v62);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v62;
        if (v46)
        {
          objc_msgSend(v46, "aaf_toCompressedData:", 517);
          v47 = objc_claimAutoreleasedReturnValue();
          -[NSObject base64EncodedStringWithOptions:](v47, "base64EncodedStringWithOptions:", 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("X-Apple-Host-Baa"));
          objc_msgSend(v61, "base64EncodedStringWithOptions:", 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("X-Apple-I-Host-Baa-S"));

        }
        else
        {
          _AKLogSystem();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_2();
        }

      }
    }

  }
  v50 = *(_QWORD *)(a1 + 64);
  v51 = (void *)objc_msgSend(v3, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v50 + 16))(v50, v51, *(_QWORD *)(a1 + 40));

}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_133(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v4, "domain");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%ld"), v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

}

- (id)_parseDERCertificatesFromChain:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  int v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  unint64_t v21;
  _OWORD v22[3];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  memset(v22, 0, sizeof(v22));
  v21 = 0;
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = CTParseCertificateSet(v6, v6 + objc_msgSend(v5, "length"), v22, 3, &v21);
  if (v7)
    v8 = 1;
  else
    v8 = v21 == 0;
  if (v8)
  {
    v9 = v7;
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AKAppleIDSigningController(Convenience) _parseDERCertificatesFromChain:error:].cold.1((uint64_t *)&v21, v9, v10);

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7066);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = 0;
LABEL_20:
      v18 = 0;
      *a4 = v11;
      goto LABEL_23;
    }
    v12 = 0;
LABEL_22:
    v18 = 0;
    goto LABEL_23;
  }
  v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v12 = (id)objc_msgSend(v13, "initWithCapacity:", v21);
  if (v21)
  {
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = (unint64_t)&v22[v14];
      if (!*(_QWORD *)v16 || !*(_QWORD *)(v16 + 8))
        break;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *(_QWORD *)v16, *(_QWORD *)(v16 | 8));
      objc_msgSend(v12, "setObject:atIndexedSubscript:", v17, v14);

      v14 = ++v15;
      if (v21 <= v15)
        goto LABEL_15;
    }
    _AKLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[AKAppleIDSigningController(Convenience) _parseDERCertificatesFromChain:error:].cold.2();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7066);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    goto LABEL_22;
  }
LABEL_15:
  v12 = v12;
  v18 = v12;
LABEL_23:

  return v18;
}

- (void)_additionalAbsintheHeadersForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(v6, "HTTPBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke;
  v10[3] = &unk_1E2E5FFD0;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  -[AKAppleIDSigningController absintheSignatureForData:completion:](self, "absintheSignatureForData:completion:", v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BYTE *WeakRetained;
  NSObject *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke_cold_3();

    v9 = *(_QWORD *)(a1 + 32);
    if (WeakRetained[40])
      v10 = CFSTR("X-MMe-Proxied-Nas-Qualify");
    else
      v10 = CFSTR("X-MMe-Nas-Qualify");
    v20 = v10;
    v21[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v11, v6);
  }
  else
  {
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v13)
        __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke_cold_2();

      v14 = *(_QWORD *)(a1 + 32);
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB3388];
      v19 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ak_errorWithCode:userInfo:", -7066, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v16);

    }
    else
    {
      if (v13)
        __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke_cold_1();

      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7066);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v11);
    }
  }

}

- (void)_additionalAttestationHeadersForRequest:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id location;

  v8 = a3;
  v9 = a4;
  v37 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ak_serverFriendlyString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AKAttestationUseDeviceCheckKeychainAccess"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  v16 = 0x1E2E5C000;
  if (v15)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("X-Apple-I-Client-Time"));
    objc_msgSend(v8, "HTTPBody");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v36 = v8;
    if (v17)
    {
      objc_msgSend(v17, "ak_SHA256Data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "aaf_toHexString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lowercaseString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("X-Apple-I-Payload-Hash"));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v21, v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dataUsingEncoding:", 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("X-Apple-I-Baa-S"));

      v16 = 0x1E2E5C000uLL;
      v8 = v36;

    }
    objc_msgSend(*(id *)(v16 + 3408), "currentDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uniqueDeviceIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dataUsingEncoding:", 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, CFSTR("X-Mme-Device-Id-S"));
    v16 = 0x1E2E5C000uLL;
    if (+[AKDevice hasUniqueDeviceIdentifier](AKDevice, "hasUniqueDeviceIdentifier"))
    {
      +[AKDevice currentDevice](AKDevice, "currentDevice");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "provisioningDeviceIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dataUsingEncoding:", 4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, CFSTR("X-Apple-I-Provisioning-Device-Id-S"));

      v8 = v36;
      v16 = 0x1E2E5C000uLL;
    }

  }
  objc_msgSend(*(id *)(v16 + 3408), "currentDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "serverFriendlyDescription");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dataUsingEncoding:", 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    if (self->_isProxy)
      v33 = CFSTR("X-MMe-Proxied-Client-Info-S");
    else
      v33 = CFSTR("X-MMe-Client-Info-S");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v32, v33);
  }
  objc_initWeak(&location, self);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke;
  v38[3] = &unk_1E2E60018;
  objc_copyWeak(&v41, &location);
  v34 = v11;
  v39 = v34;
  v35 = v37;
  v40 = v35;
  -[AKAppleIDSigningController signaturesForData:options:completion:](self, "signaturesForData:options:completion:", v10, v9, v38);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

}

void __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _BYTE *WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v7)
  {
    objc_msgSend(v7, "aaf_map:", &__block_literal_global_16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (WeakRetained[40])
        v14 = CFSTR("X-Apple-Proxied-Baa");
      else
        v14 = CFSTR("X-Apple-Baa");
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v14);
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v12);
    objc_msgSend(v15, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
    _AKLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_cold_3(v12);

    v17 = *(_QWORD *)(a1 + 40);
    v18 = (void *)objc_msgSend(v15, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v17 + 16))(v17, v18, 0);

LABEL_14:
    goto LABEL_15;
  }
  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v20)
      __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_cold_2();

    v21 = *(_QWORD *)(a1 + 40);
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB3388];
    v25[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ak_errorWithCode:userInfo:", -7066, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v13);
    goto LABEL_14;
  }
  if (v20)
    __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_cold_1();

  v23 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7066);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v12);
LABEL_15:

}

uint64_t __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
}

void __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Remote signing service returned an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__AKAppleIDSigningController_absintheSignatureForData_completion___block_invoke_72_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Remote signing service successfully signed data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)attestationDataForRequest:completion:.cold.1()
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
  _os_log_debug_impl(&dword_19202F000, v1, OS_LOG_TYPE_DEBUG, "%@: Generating attestation data for request (%@)", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __67__AKAppleIDSigningController_attestationDataForRequest_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_1();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_19202F000, v1, OS_LOG_TYPE_ERROR, "%@: Failed to generate attestation data with error (%@)", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No baaInterval", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Absinthe not enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch absinthe headers, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_3_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_2(&dword_19202F000, v2, v3, "We have additional absinthe headers %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_125_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Requesting additional Attestation for header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2_127_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch attestation headers, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_2_127_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_2(&dword_19202F000, v2, v3, "We have attesation headers: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __79__AKAppleIDSigningController_Convenience__signingHeadersForRequest_completion___block_invoke_130_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*(id *)(a1 + 32), "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_2(&dword_19202F000, v1, v2, "returing %lu additional headers", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to process host certificate chain, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, v0, v1, "hostCertificateChain: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Received signed host data and certificate chain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch host attestation headers, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "DeviceIdentity not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __73__AKAppleIDSigningController_Convenience__signWithBAAHeaders_completion___block_invoke_2_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch attestation headers, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Unknown absinthe error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Absinthe error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __91__AKAppleIDSigningController_Convenience___additionalAbsintheHeadersForRequest_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, v0, v1, "Absinthe data generated for proxy %@", v2);
  OUTLINED_FUNCTION_1();
}

void __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Unknown attestation error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Attestation error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __102__AKAppleIDSigningController_Convenience___additionalAttestationHeadersForRequest_options_completion___block_invoke_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_2(&dword_19202F000, v2, v3, "Attestation signature headers %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
