@implementation AKLoginPresenter

- (void)presentOOPLoginUIWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSXPCListener *v14;
  NSXPCListener *remoteListener;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  _QWORD v33[5];
  uint64_t v34;
  id v35;
  void *v36;
  _QWORD v37[3];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AKLoginPresenter presentOOPLoginUIWithContext:completion:].cold.4();

  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v35;
  if (!v9)
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AKLoginPresenter presentOOPLoginUIWithContext:completion:].cold.3();

    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7034);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKLoginPresenter _callCompletionWithResults:password:additionalData:error:](self, "_callCompletionWithResults:password:additionalData:error:", 0, 0, 0, v12);

  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("context"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E2E9A370, CFSTR("oopUIMode"));
  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v14 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  remoteListener = self->_remoteListener;
  self->_remoteListener = v14;

  -[NSXPCListener setDelegate:](self->_remoteListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_remoteListener, "resume");
  -[AKLoginPresenter setPresentationCompletion:](self, "setPresentationCompletion:", v7);

  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  if (objc_msgSend(v16, "canOpenApplication:reason:", CFSTR("com.apple.AuthKitUIService"), &v34))
  {
    v32 = v10;
    v17 = objc_alloc_init(MEMORY[0x1E0D017D0]);
    objc_msgSend(v17, "setObject:forSetting:", v13, 0);
    -[NSXPCListener endpoint](self->_remoteListener, "endpoint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_endpoint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forSetting:", v19, 1);

    v20 = objc_alloc(MEMORY[0x1E0D01698]);
    v21 = (void *)objc_msgSend(v17, "copy");
    v22 = (void *)objc_msgSend(v20, "initWithInfo:responder:", v21, 0);

    v23 = (void *)MEMORY[0x1E0D23158];
    v24 = *MEMORY[0x1E0D22CE0];
    v36 = v22;
    v37[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0D22D00];
    v38[0] = v25;
    v38[1] = MEMORY[0x1E0C9AAA0];
    v27 = *MEMORY[0x1E0D22D50];
    v37[1] = v26;
    v37[2] = v27;
    v38[2] = &unk_1E2E9A388;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "optionsWithDictionary:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    _AKLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[AKLoginPresenter presentOOPLoginUIWithContext:completion:].cold.1(v30);

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __60__AKLoginPresenter_presentOOPLoginUIWithContext_completion___block_invoke;
    v33[3] = &unk_1E2E60E58;
    v33[4] = self;
    objc_msgSend(v16, "openApplication:withOptions:completion:", CFSTR("com.apple.AuthKitUIService"), v29, v33);

    v10 = v32;
  }
  else
  {
    _AKLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[AKLoginPresenter presentOOPLoginUIWithContext:completion:].cold.2((uint64_t)&v34, v31);

    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7034);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[AKLoginPresenter _callCompletionWithResults:password:additionalData:error:](self, "_callCompletionWithResults:password:additionalData:error:", 0, 0, 0, v17);
  }

}

void __60__AKLoginPresenter_presentOOPLoginUIWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__AKLoginPresenter_presentOOPLoginUIWithContext_completion___block_invoke_cold_1();

    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7034);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_callCompletionWithResults:password:additionalData:error:", 0, 0, 0, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __60__AKLoginPresenter_presentOOPLoginUIWithContext_completion___block_invoke_cold_2();
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  +[AKLoginPresenterHostInterface XPCInterface](AKLoginPresenterHostInterface, "XPCInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)authenticationRequestFinishedWithResults:(id)a3 password:(id)a4 additionalData:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  _AKLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[AKLoginPresenter authenticationRequestFinishedWithResults:password:additionalData:error:].cold.1(self, v14);

  -[AKLoginPresenter _callCompletionWithResults:password:additionalData:error:](self, "_callCompletionWithResults:password:additionalData:error:", v13, v12, v11, v10);
}

- (void)_callCompletionWithResults:(id)a3 password:(id)a4 additionalData:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AKLoginPresenter presentationCompletion](self, "presentationCompletion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[AKLoginPresenter presentationCompletion](self, "presentationCompletion");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, id))v14)[2](v14, v15, v10, v11, v12);

  }
  -[AKLoginPresenter setPresentationCompletion:](self, "setPresentationCompletion:", 0);

}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
  objc_storeStrong((id *)&self->_remoteListener, a3);
}

- (id)presentationCompletion
{
  return self->_presentationCompletion;
}

- (void)setPresentationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationCompletion, 0);
  objc_storeStrong((id *)&self->_remoteListener, 0);
}

- (void)presentOOPLoginUIWithContext:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19202F000, log, OS_LOG_TYPE_DEBUG, "Trying to launch application with Scene Delegate", v1, 2u);
}

- (void)presentOOPLoginUIWithContext:(uint64_t)a1 completion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  FBSOpenApplicationErrorCodeToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 138412546;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_19202F000, a2, v4, "Failed to launch application: %@ with error: %@", (uint8_t *)v5);

}

- (void)presentOOPLoginUIWithContext:completion:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_19202F000, v0, OS_LOG_TYPE_ERROR, "Context data is nil: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)presentOOPLoginUIWithContext:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, v0, v1, "Redirecting to AuthKitUIService, to present basic login UI with context: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __60__AKLoginPresenter_presentOOPLoginUIWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_19202F000, v0, v1, "Unable to launch application: %@ with the error: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __60__AKLoginPresenter_presentOOPLoginUIWithContext_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, v0, v1, "Successfully launched process: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)authenticationRequestFinishedWithResults:(void *)a1 password:(NSObject *)a2 additionalData:error:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "presentationCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x194022E4C]();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, a2, v5, "Call completion with authentication result with presentation completion: %@", v6);

}

@end
