@implementation AKInheritanceController

- (AKInheritanceController)init
{
  void *v3;
  void *v4;
  AKInheritanceController *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC8]), "initWithServiceName:remoteProtocol:options:", CFSTR("com.apple.ak.inheritance.xpc"), &unk_1EE252A18, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC0]), "initWithRemoteServiceConfig:delegate:", v3, self);
  v5 = -[AKInheritanceController initWithXPCSession:](self, "initWithXPCSession:", v4);

  return v5;
}

- (AKInheritanceController)initWithXPCSession:(id)a3
{
  id v5;
  AKInheritanceController *v6;
  AKInheritanceController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKInheritanceController;
  v6 = -[AKInheritanceController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteService, a3);
    -[AAFXPCSession resume](v7->_remoteService, "resume");
  }

  return v7;
}

- (void)fetchManifestOptionsWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKInheritanceController *v9;
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
  AKInheritanceController *v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "inheritance-authkit/fetch-dataclass-rules", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  v18[2] = __81__AKInheritanceController_fetchManifestOptionsWithInheritanceContext_completion___block_invoke;
  v18[3] = &unk_1E2E5EF90;
  v20 = v21;
  v11 = v7;
  v19 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v18);
  remoteService = v9->_remoteService;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __81__AKInheritanceController_fetchManifestOptionsWithInheritanceContext_completion___block_invoke_2;
  v16[3] = &unk_1E2E5E220;
  v14 = v12;
  v17 = v14;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fetchManifestOptionsWithInheritanceContext:completion:", v6, v14);

  _Block_object_dispose(v21, 8);
  os_activity_scope_leave(&state);

}

void __81__AKInheritanceController_fetchManifestOptionsWithInheritanceContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __81__AKInheritanceController_fetchManifestOptionsWithInheritanceContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __81__AKInheritanceController_fetchManifestOptionsWithInheritanceContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setupBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKInheritanceController *v9;
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
  AKInheritanceController *v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "inheritance-authkit/persist-manifest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  v18[2] = __77__AKInheritanceController_setupBeneficiaryWithInheritanceContext_completion___block_invoke;
  v18[3] = &unk_1E2E5E9D0;
  v20 = v21;
  v11 = v7;
  v19 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v18);
  remoteService = v9->_remoteService;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __77__AKInheritanceController_setupBeneficiaryWithInheritanceContext_completion___block_invoke_2;
  v16[3] = &unk_1E2E5E220;
  v14 = v12;
  v17 = v14;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setupBeneficiaryWithInheritanceContext:completion:", v6, v14);

  _Block_object_dispose(v21, 8);
  os_activity_scope_leave(&state);

}

void __77__AKInheritanceController_setupBeneficiaryWithInheritanceContext_completion___block_invoke(uint64_t a1, void *a2)
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

void __77__AKInheritanceController_setupBeneficiaryWithInheritanceContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__AKInheritanceController_setupBeneficiaryWithInheritanceContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKInheritanceController *v9;
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
  AKInheritanceController *v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "inheritance-authkit/update-beneficiary", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  v18[2] = __78__AKInheritanceController_updateBeneficiaryWithInheritanceContext_completion___block_invoke;
  v18[3] = &unk_1E2E5E9D0;
  v20 = v21;
  v11 = v7;
  v19 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v18);
  remoteService = v9->_remoteService;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __78__AKInheritanceController_updateBeneficiaryWithInheritanceContext_completion___block_invoke_2;
  v16[3] = &unk_1E2E5E220;
  v14 = v12;
  v17 = v14;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateBeneficiaryWithInheritanceContext:completion:", v6, v14);

  _Block_object_dispose(v21, 8);
  os_activity_scope_leave(&state);

}

void __78__AKInheritanceController_updateBeneficiaryWithInheritanceContext_completion___block_invoke(uint64_t a1, void *a2)
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

void __78__AKInheritanceController_updateBeneficiaryWithInheritanceContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__AKInheritanceController_updateBeneficiaryWithInheritanceContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeBeneficiaryWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKInheritanceController *v9;
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
  AKInheritanceController *v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "inheritance-authkit/remove-beneficiary", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  v18[2] = __78__AKInheritanceController_removeBeneficiaryWithInheritanceContext_completion___block_invoke;
  v18[3] = &unk_1E2E5E9D0;
  v20 = v21;
  v11 = v7;
  v19 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v18);
  remoteService = v9->_remoteService;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __78__AKInheritanceController_removeBeneficiaryWithInheritanceContext_completion___block_invoke_2;
  v16[3] = &unk_1E2E5E220;
  v14 = v12;
  v17 = v14;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeBeneficiaryWithInheritanceContext:completion:", v6, v14);

  _Block_object_dispose(v21, 8);
  os_activity_scope_leave(&state);

}

void __78__AKInheritanceController_removeBeneficiaryWithInheritanceContext_completion___block_invoke(uint64_t a1, void *a2)
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

void __78__AKInheritanceController_removeBeneficiaryWithInheritanceContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__AKInheritanceController_removeBeneficiaryWithInheritanceContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setupBeneficiaryAliasWithInheritanceContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  AKInheritanceController *v11;
  uint64_t v12;
  void *v13;
  AAFXPCSession *remoteService;
  id v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  AKInheritanceController *v24;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInternalBuild");

  if ((v9 & 1) != 0)
  {
    v10 = _os_activity_create(&dword_19202F000, "inheritance-authkit/create-beneficiary-alias", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__1;
    v23[4] = __Block_byref_object_dispose__1;
    v11 = self;
    v12 = MEMORY[0x1E0C809B0];
    v24 = v11;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __83__AKInheritanceController__setupBeneficiaryAliasWithInheritanceContext_completion___block_invoke;
    v20[3] = &unk_1E2E5EFB8;
    v22 = v23;
    v21 = v7;
    v13 = (void *)MEMORY[0x194022E4C](v20);
    remoteService = v11->_remoteService;
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __83__AKInheritanceController__setupBeneficiaryAliasWithInheritanceContext_completion___block_invoke_2;
    v18[3] = &unk_1E2E5E220;
    v15 = v13;
    v19 = v15;
    -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setupBeneficiaryAliasWithInheritanceContext:completion:", v6, v15);

    _Block_object_dispose(v23, 8);
    os_activity_scope_leave(&state);
  }
  else
  {
    _AKLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[AKInheritanceController _setupBeneficiaryAliasWithInheritanceContext:completion:].cold.1(v17);

    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7026);
    v10 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, NSObject *))v7 + 2))(v7, 0, v10);
  }

}

void __83__AKInheritanceController__setupBeneficiaryAliasWithInheritanceContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __83__AKInheritanceController__setupBeneficiaryAliasWithInheritanceContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __83__AKInheritanceController__setupBeneficiaryAliasWithInheritanceContext_completion___block_invoke_2_cold_1();

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

void __81__AKInheritanceController_fetchManifestOptionsWithInheritanceContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to remote inheritance service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __77__AKInheritanceController_setupBeneficiaryWithInheritanceContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to remote inheritance service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __78__AKInheritanceController_updateBeneficiaryWithInheritanceContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to remote inheritance service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __78__AKInheritanceController_removeBeneficiaryWithInheritanceContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to remote inheritance service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_setupBeneficiaryAliasWithInheritanceContext:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19202F000, log, OS_LOG_TYPE_ERROR, "Not an Internal Build. Aborting beneficiary alias setup", v1, 2u);
}

void __83__AKInheritanceController__setupBeneficiaryAliasWithInheritanceContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_19202F000, v0, v1, "Connection to remote inheritance service to %s returned an error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
