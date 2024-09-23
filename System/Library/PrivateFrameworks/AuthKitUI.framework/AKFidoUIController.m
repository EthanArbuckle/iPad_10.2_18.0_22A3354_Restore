@implementation AKFidoUIController

- (AKFidoUIController)init
{
  id v3;
  void *v4;
  void *v5;
  AKFidoUIController *v6;

  v3 = objc_alloc(MEMORY[0x1E0CF0EC8]);
  v4 = (void *)objc_msgSend(v3, "initWithServiceName:remoteProtocol:options:", *MEMORY[0x1E0D00010], &unk_1EF540210, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC0]), "initWithRemoteServiceConfig:delegate:", v4, self);
  v6 = -[AKFidoUIController initWithXPCSession:](self, "initWithXPCSession:", v5);

  return v6;
}

- (AKFidoUIController)initWithXPCSession:(id)a3
{
  id v5;
  AKFidoUIController *v6;
  AKFidoUIController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKFidoUIController;
  v6 = -[AKFidoUIController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteService, a3);
    -[AAFXPCSession resume](v7->_remoteService, "resume");
  }

  return v7;
}

- (void)registerFidoKeyWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKFidoUIController *v9;
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
  AKFidoUIController *v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1BD795000, "fido-authkit/register-key", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__1;
  v21[4] = __Block_byref_object_dispose__1;
  v9 = self;
  v10 = MEMORY[0x1E0C809B0];
  v22 = v9;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke;
  v18[3] = &unk_1E7679B58;
  v20 = v21;
  v11 = v7;
  v19 = v11;
  v12 = (void *)MEMORY[0x1C3B760D8](v18);
  remoteService = v9->_remoteService;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke_2;
  v16[3] = &unk_1E76789C8;
  v14 = v12;
  v17 = v14;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerFidoKeyWithContext:completion:", v6, v14);

  _Block_object_dispose(v21, 8);
  os_activity_scope_leave(&state);

}

void __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogFido();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)verifyFidoKeyWithFidoContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKFidoUIController *v9;
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
  AKFidoUIController *v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1BD795000, "fido-authkit/verify-fido-key", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__1;
  v21[4] = __Block_byref_object_dispose__1;
  v9 = self;
  v10 = MEMORY[0x1E0C809B0];
  v22 = v9;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__AKFidoUIController_verifyFidoKeyWithFidoContext_completion___block_invoke;
  v18[3] = &unk_1E7679B80;
  v20 = v21;
  v11 = v7;
  v19 = v11;
  v12 = (void *)MEMORY[0x1C3B760D8](v18);
  remoteService = v9->_remoteService;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __62__AKFidoUIController_verifyFidoKeyWithFidoContext_completion___block_invoke_2;
  v16[3] = &unk_1E76789C8;
  v14 = v12;
  v17 = v14;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "verifyFidoKeyWithFidoContext:completion:", v6, v14);

  _Block_object_dispose(v21, 8);
  os_activity_scope_leave(&state);

}

void __62__AKFidoUIController_verifyFidoKeyWithFidoContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __62__AKFidoUIController_verifyFidoKeyWithFidoContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogFido();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__AKFidoUIController_verifyFidoKeyWithFidoContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)verifyFidoKeyWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKFidoUIController *v9;
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
  AKFidoUIController *v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1BD795000, "fido-authkit/verify-context-key", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__1;
  v21[4] = __Block_byref_object_dispose__1;
  v9 = self;
  v10 = MEMORY[0x1E0C809B0];
  v22 = v9;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__AKFidoUIController_verifyFidoKeyWithContext_completion___block_invoke;
  v18[3] = &unk_1E7679BA8;
  v20 = v21;
  v11 = v7;
  v19 = v11;
  v12 = (void *)MEMORY[0x1C3B760D8](v18);
  remoteService = v9->_remoteService;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __58__AKFidoUIController_verifyFidoKeyWithContext_completion___block_invoke_2;
  v16[3] = &unk_1E76789C8;
  v14 = v12;
  v17 = v14;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "verifyFidoKeyWithContext:completion:", v6, v14);

  _Block_object_dispose(v21, 8);
  os_activity_scope_leave(&state);

}

void __58__AKFidoUIController_verifyFidoKeyWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;
  v9 = a4;
  v10 = a3;
  v11 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__AKFidoUIController_verifyFidoKeyWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogFido();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__AKFidoUIController_verifyFidoKeyWithContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)verifyFidoRecoveryWithContext:(id)a3 recoveryToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  AKFidoUIController *v12;
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
  AKFidoUIController *v25;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1BD795000, "fido-authkit/verify-recovery-key", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__1;
  v24[4] = __Block_byref_object_dispose__1;
  v12 = self;
  v13 = MEMORY[0x1E0C809B0];
  v25 = v12;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__AKFidoUIController_verifyFidoRecoveryWithContext_recoveryToken_completion___block_invoke;
  v21[3] = &unk_1E7679BA8;
  v23 = v24;
  v14 = v10;
  v22 = v14;
  v15 = (void *)MEMORY[0x1C3B760D8](v21);
  remoteService = v12->_remoteService;
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __77__AKFidoUIController_verifyFidoRecoveryWithContext_recoveryToken_completion___block_invoke_2;
  v19[3] = &unk_1E76789C8;
  v17 = v15;
  v20 = v17;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "verifyFidoRecoveryWithContext:recoveryToken:completion:", v8, v9, v17);

  _Block_object_dispose(v24, 8);
  os_activity_scope_leave(&state);

}

void __77__AKFidoUIController_verifyFidoRecoveryWithContext_recoveryToken_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;
  v9 = a4;
  v10 = a3;
  v11 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__AKFidoUIController_verifyFidoRecoveryWithContext_recoveryToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogFido();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__AKFidoUIController_verifyFidoRecoveryWithContext_recoveryToken_completion___block_invoke_2_cold_1();

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
}

void __60__AKFidoUIController_registerFidoKeyWithContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1BD795000, v0, v1, "Connection to remote FIDO service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __62__AKFidoUIController_verifyFidoKeyWithFidoContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1BD795000, v0, v1, "Connection to remote FIDO service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __58__AKFidoUIController_verifyFidoKeyWithContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1BD795000, v0, v1, "Connection to remote FIDO service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void __77__AKFidoUIController_verifyFidoRecoveryWithContext_recoveryToken_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1BD795000, v0, v1, "Connection to remote FIDO service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

@end
