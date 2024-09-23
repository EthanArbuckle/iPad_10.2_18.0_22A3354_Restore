@implementation AADaemonController

- (AADaemonController)init
{
  AADaemonController *v2;
  void *v3;
  uint64_t v4;
  AAFXPCSession *remoteService;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AADaemonController;
  v2 = -[AADaemonController init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC8]), "initWithServiceName:remoteProtocol:options:", CFSTR("com.apple.aa.daemon.xpc"), &unk_1EE536538, 0);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF0EC0]), "initWithRemoteServiceConfig:delegate:", v3, v2);
    remoteService = v2->_remoteService;
    v2->_remoteService = (AAFXPCSession *)v4;

    -[AAFXPCSession resume](v2->_remoteService, "resume");
  }
  return v2;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, a2, a3, "%@ deallocated", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleAppleAccountDeleteForAccount:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  AAFXPCSession *remoteService;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  os_activity_scope_state_s state;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADaemonController.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oldAccount"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADaemonController.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = _os_activity_create(&dword_19EACA000, "daemon-appleaccount/handle-AppleAccount-Delete", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__AADaemonController_handleAppleAccountDeleteForAccount_completion___block_invoke;
  v21[3] = &unk_1E416E638;
  v21[4] = self;
  v12 = v9;
  v22 = v12;
  v13 = (void *)MEMORY[0x1A1AED7A0](v21);
  remoteService = self->_remoteService;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __68__AADaemonController_handleAppleAccountDeleteForAccount_completion___block_invoke_2;
  v19[3] = &unk_1E416E660;
  v15 = v13;
  v20 = v15;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleAppleAccountDeleteForAccount:completion:", v7, v15);

  os_activity_scope_leave(&state);
}

uint64_t __68__AADaemonController_handleAppleAccountDeleteForAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__AADaemonController_handleAppleAccountDeleteForAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__AADaemonController_handleAppleAccountDeleteForAccount_completion___block_invoke_2_cold_1((uint64_t)v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cacheLoginResponse:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADaemonController.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("loginResponse"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADaemonController.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__AADaemonController_cacheLoginResponse_forAccount_completion___block_invoke;
  v17[3] = &unk_1E416E638;
  v17[4] = self;
  v18 = v11;
  v12 = v11;
  v13 = (void *)MEMORY[0x1A1AED7A0](v17);
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](self->_remoteService, "remoteServiceProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cacheLoginResponse:forAccount:completion:", v9, v10, v13);

}

uint64_t __63__AADaemonController_cacheLoginResponse_forAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchCachedLoginResponseForAccount:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  AAFXPCSession *remoteService;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADaemonController.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

  }
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68__AADaemonController_fetchCachedLoginResponseForAccount_completion___block_invoke;
  v18[3] = &unk_1E416E688;
  v18[4] = self;
  v19 = v8;
  v10 = v8;
  v11 = (void *)MEMORY[0x1A1AED7A0](v18);
  remoteService = self->_remoteService;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __68__AADaemonController_fetchCachedLoginResponseForAccount_completion___block_invoke_2;
  v16[3] = &unk_1E416E660;
  v17 = v11;
  v13 = v11;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchCachedLoginResponseForAccount:completion:", v7, v13);

}

uint64_t __68__AADaemonController_fetchCachedLoginResponseForAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __68__AADaemonController_fetchCachedLoginResponseForAccount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)urlConfigurationWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  AAFXPCSession *remoteService;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53__AADaemonController_urlConfigurationWithCompletion___block_invoke;
  v21[3] = &unk_1E416E6B0;
  v21[4] = self;
  v6 = v4;
  v22 = v6;
  v7 = (void *)MEMORY[0x1A1AED7A0](v21);
  remoteService = self->_remoteService;
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __53__AADaemonController_urlConfigurationWithCompletion___block_invoke_46;
  v19[3] = &unk_1E416E660;
  v20 = v7;
  v9 = v7;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](remoteService, "remoteServiceProxyWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AADaemonController urlConfigurationWithCompletion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  objc_msgSend(v10, "urlConfigurationWithCompletion:", v9);
}

void __53__AADaemonController_urlConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (*(_QWORD *)(a1 + 40))
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315906;
      v12 = "-[AADaemonController urlConfigurationWithCompletion:]_block_invoke";
      v13 = 2112;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_debug_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEBUG, "%s configuration: %@, response: %@, error: %@", (uint8_t *)&v11, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __53__AADaemonController_urlConfigurationWithCompletion___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)configureRemoteInterface:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_handleAppleAccountDeleteForAccount_completion_, 0, 1);
  v7 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8, v10, v11, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_urlConfigurationWithCompletion_, 0, 1);
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

void __68__AADaemonController_handleAppleAccountDeleteForAccount_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446466;
  v3 = "-[AADaemonController handleAppleAccountDeleteForAccount:completion:]_block_invoke_2";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "Connection to remote service to %{public}s returned an error: %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)urlConfigurationWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, a1, a3, "%s Initiating url configuration fetch...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
