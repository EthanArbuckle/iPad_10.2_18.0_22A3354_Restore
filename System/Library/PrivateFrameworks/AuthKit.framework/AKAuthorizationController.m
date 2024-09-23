@implementation AKAuthorizationController

+ (BOOL)shouldProcessURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[16];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AKLogSiwa();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Should process URL called", buf, 2u);
  }

  objc_msgSend(a1, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_nativeTakeoverURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSiwa();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[AKAuthorizationController shouldProcessURL:].cold.2();

  if (objc_msgSend(v7, "count"))
  {
    v9 = 0x1E0CB3000uLL;
    v45 = v4;
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v44 = v7;
    v11 = v7;
    v52 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v52)
    {
      v12 = *(_QWORD *)v54;
      v51 = *(_QWORD *)v54;
      v46 = v10;
LABEL_8:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v54 != v12)
          objc_enumerationMutation(v11);
        v14 = *(void **)(v9 + 2456);
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsWithURL:resolvingAgainstBaseURL:", v15, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "scheme");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject scheme](v10, "scheme");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v17, "caseInsensitiveCompare:", v18))
        {
          v19 = v11;
          objc_msgSend(v16, "host");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v10;
          -[NSObject host](v10, "host");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v20, "caseInsensitiveCompare:", v22))
          {
            objc_msgSend(v16, "path");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject path](v21, "path");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v23, "caseInsensitiveCompare:", v24))
            {
              v49 = v24;
              v50 = v23;
              objc_msgSend(v16, "password");
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = v21;
              -[NSObject password](v21, "password");
              v27 = objc_claimAutoreleasedReturnValue();
              v48 = (void *)v25;
              v28 = (void *)v25;
              v29 = (void *)v27;
              if (!objc_msgSend(v28, "caseInsensitiveCompare:", v27))
              {
                objc_msgSend(v16, "port");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject port](v26, "port");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v30, "compare:", v31);

                v11 = v19;
                v9 = 0x1E0CB3000;
                v10 = v46;
                v12 = v51;
                if (!v47)
                {
                  _AKLogSiwa();
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_19202F000, v41, OS_LOG_TYPE_DEFAULT, "Authorization controller should process URL", buf, 2u);
                  }

                  v33 = 1;
                  goto LABEL_33;
                }
                goto LABEL_19;
              }

              v24 = v49;
              v23 = v50;
            }

          }
          v11 = v19;
          v9 = 0x1E0CB3000;
          v10 = v21;
          v12 = v51;
        }

LABEL_19:
        if (v52 == ++v13)
        {
          v32 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
          v52 = v32;
          if (v32)
            goto LABEL_8;
          break;
        }
      }
    }

    _AKLogSiwa();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "URL shouldn't be processed", buf, 2u);
    }
    v33 = 0;
LABEL_33:
    v7 = v44;
    v4 = v45;

  }
  else
  {
    _AKLogSiwa();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[AKAuthorizationController shouldProcessURL:].cold.1(v10, v34, v35, v36, v37, v38, v39, v40);
    v33 = 0;
  }

  return v33;
}

- (id)_nativeTakeoverURLs
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[5];
  uint8_t buf[8];
  _QWORD v11[4];
  id v12;

  _AKLogSiwa();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v3, OS_LOG_TYPE_DEFAULT, "Fetching native takeover URLs", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v11[0] = buf;
  v11[1] = 0x3032000000;
  v11[2] = __Block_byref_object_copy__17;
  v11[3] = __Block_byref_object_dispose__17;
  v12 = 0;
  -[AKAuthorizationDaemonConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_55);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_20;
  v9[3] = &unk_1E2E62140;
  v9[4] = buf;
  objc_msgSend(v4, "fetchNativeTakeoverURLSetWithCompletion:", v9);
  _AKLogSiwa();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AKAuthorizationController _nativeTakeoverURLs].cold.1((uint64_t)v11, v5, v6);

  v7 = *(id *)(v11[0] + 40);
  _Block_object_dispose(buf, 8);

  return v7;
}

+ (id)sharedController
{
  if (sharedController_onceToken_0 != -1)
    dispatch_once(&sharedController_onceToken_0, &__block_literal_global_33);
  return (id)sharedController_sharedController;
}

void __45__AKAuthorizationController_sharedController__block_invoke()
{
  AKAuthorizationController *v0;
  void *v1;

  v0 = objc_alloc_init(AKAuthorizationController);
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;

}

- (AKAuthorizationController)init
{
  return -[AKAuthorizationController initWithDaemonXPCEndpoint:](self, "initWithDaemonXPCEndpoint:", 0);
}

- (AKAuthorizationController)initWithDaemonXPCEndpoint:(id)a3
{
  id v4;
  AKAuthorizationController *v5;
  AKAuthorizationClientImpl *v6;
  AKAuthorizationClientImpl *clientImpl;
  AKAuthorizationDaemonConnection *v8;
  AKAuthorizationDaemonConnection *daemonConnection;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKAuthorizationController;
  v5 = -[AKAuthorizationController init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(AKAuthorizationClientImpl);
    clientImpl = v5->_clientImpl;
    v5->_clientImpl = v6;

    v8 = -[AKAuthorizationDaemonConnection initWithListenerEndpoint:exportedInterface:]([AKAuthorizationDaemonConnection alloc], "initWithListenerEndpoint:exportedInterface:", v4, v5->_clientImpl);
    daemonConnection = v5->_daemonConnection;
    v5->_daemonConnection = v8;

  }
  return v5;
}

void __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  _AKLogSiwa();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Native takeover URLs fetched", v11, 2u);
    }

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = v5;
    v8 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_20_cold_1();
  }

}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, v0, v1, "%@ deallocated", v2);
  OUTLINED_FUNCTION_1();
}

- (AKAuthorizationUIProvider)uiProvider
{
  return -[AKAuthorizationClientImpl uiProvider](self->_clientImpl, "uiProvider");
}

- (void)setUiProvider:(id)a3
{
  -[AKAuthorizationClientImpl setUiProvider:](self->_clientImpl, "setUiProvider:", a3);
}

- (void)performAuthorizationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  AKAuthorizationController *v10;
  uint64_t v11;
  id v12;
  void *v13;
  AKAuthorizationDaemonConnection *daemonConnection;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  AKAuthorizationController *v27;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/authorize", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _AKLogSiwa();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "Authorization controller performAuthorizationWithContext called", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__17;
  v26 = __Block_byref_object_dispose__17;
  v10 = self;
  v11 = MEMORY[0x1E0C809B0];
  v27 = v10;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke;
  v19[3] = &unk_1E2E62050;
  v21 = buf;
  v12 = v7;
  v20 = v12;
  v13 = (void *)MEMORY[0x194022E4C](v19);
  daemonConnection = v10->_daemonConnection;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke_4;
  v17[3] = &unk_1E2E5E220;
  v15 = v13;
  v18 = v15;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performAuthorization:completion:", v6, v15);

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

}

void __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  _AKLogSiwa();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Authorization completed with authorization: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke_cold_1();
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)beginAuthorizationWithContext:(id)a3 completion:(id)a4
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
  AKAuthorizationController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AKAuthorizationDaemonConnection *daemonConnection;
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
  AKAuthorizationController *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/begin-authorize", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AuthorizationExternalAuthBegin", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AuthorizationExternalAuthBegin  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__17;
  v34 = __Block_byref_object_dispose__17;
  v16 = self;
  v35 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __70__AKAuthorizationController_beginAuthorizationWithContext_completion___block_invoke;
  v25[3] = &unk_1E2E62078;
  v28 = v10;
  v29 = v12;
  p_buf = &buf;
  v18 = v7;
  v26 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v25);
  daemonConnection = v16->_daemonConnection;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __70__AKAuthorizationController_beginAuthorizationWithContext_completion___block_invoke_7;
  v23[3] = &unk_1E2E5E220;
  v21 = v19;
  v24 = v21;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "beginAuthorizationWithContext:completion:", v6, v21);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __70__AKAuthorizationController_beginAuthorizationWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  double v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v19 = 67240192;
    LODWORD(v20) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "AuthorizationExternalAuthBegin", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = (void *)a1[6];
    v14 = objc_msgSend(v6, "code");
    v19 = 134218496;
    v20 = v13;
    v21 = 2048;
    v22 = v12;
    v23 = 1026;
    v24 = v14;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AuthorizationExternalAuthBegin  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  _AKLogSiwa();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Begin Authorization completed with userResponse: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __70__AKAuthorizationController_beginAuthorizationWithContext_completion___block_invoke_cold_1();
  }

  v17 = *(_QWORD *)(a1[5] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __70__AKAuthorizationController_beginAuthorizationWithContext_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)continueAuthorizationWithContext:(id)a3 completion:(id)a4
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
  AKAuthorizationController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AKAuthorizationDaemonConnection *daemonConnection;
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
  AKAuthorizationController *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/continue-authorize", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AuthorizationExternalAuthContinue", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AuthorizationExternalAuthContinue  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__17;
  v34 = __Block_byref_object_dispose__17;
  v16 = self;
  v35 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __73__AKAuthorizationController_continueAuthorizationWithContext_completion___block_invoke;
  v25[3] = &unk_1E2E620A0;
  v28 = v10;
  v29 = v12;
  p_buf = &buf;
  v18 = v7;
  v26 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v25);
  daemonConnection = v16->_daemonConnection;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __73__AKAuthorizationController_continueAuthorizationWithContext_completion___block_invoke_8;
  v23[3] = &unk_1E2E5E220;
  v21 = v19;
  v24 = v21;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "continueAuthorizationWithContext:completion:", v6, v21);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __73__AKAuthorizationController_continueAuthorizationWithContext_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  double v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v19 = 67240192;
    LODWORD(v20) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v9, OS_SIGNPOST_INTERVAL_END, v10, "AuthorizationExternalAuthContinue", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  _AKSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = (void *)a1[6];
    v14 = objc_msgSend(v6, "code");
    v19 = 134218496;
    v20 = v13;
    v21 = 2048;
    v22 = v12;
    v23 = 1026;
    v24 = v14;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AuthorizationExternalAuthContinue  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  _AKLogSiwa();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Continue Authorization completed with authorization: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __73__AKAuthorizationController_continueAuthorizationWithContext_completion___block_invoke_cold_1();
  }

  v17 = *(_QWORD *)(a1[5] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __73__AKAuthorizationController_continueAuthorizationWithContext_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelAuthorizationWithContext:(id)a3 completion:(id)a4
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
  AKAuthorizationController *v16;
  uint64_t v17;
  id v18;
  void *v19;
  AKAuthorizationDaemonConnection *daemonConnection;
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
  AKAuthorizationController *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/cancel-authorize", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_19202F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AuthorizationExternalAuthCancel", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AKSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AuthorizationExternalAuthCancel  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__17;
  v34 = __Block_byref_object_dispose__17;
  v16 = self;
  v35 = v16;
  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __71__AKAuthorizationController_cancelAuthorizationWithContext_completion___block_invoke;
  v25[3] = &unk_1E2E60510;
  v28 = v10;
  v29 = v12;
  p_buf = &buf;
  v18 = v7;
  v26 = v18;
  v19 = (void *)MEMORY[0x194022E4C](v25);
  daemonConnection = v16->_daemonConnection;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __71__AKAuthorizationController_cancelAuthorizationWithContext_completion___block_invoke_9;
  v23[3] = &unk_1E2E5E220;
  v21 = v19;
  v24 = v21;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "cancelAuthorizationWithContext:completion:", v6, v21);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __71__AKAuthorizationController_cancelAuthorizationWithContext_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  double v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  Nanoseconds = _AKSignpostGetNanoseconds(a1[6], a1[7]);
  _AKSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[6];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v16 = 67240192;
    LODWORD(v17) = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_19202F000, v6, OS_SIGNPOST_INTERVAL_END, v7, "AuthorizationExternalAuthCancel", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 8u);
  }

  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (double)Nanoseconds / 1000000000.0;
    v10 = a1[6];
    v11 = objc_msgSend(v3, "code");
    v16 = 134218496;
    v17 = v10;
    v18 = 2048;
    v19 = v9;
    v20 = 1026;
    v21 = v11;
    _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:AuthorizationExternalAuthCancel  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x1Cu);
  }

  _AKLogSiwa();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v3)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __71__AKAuthorizationController_cancelAuthorizationWithContext_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "Cancel Authorization completed successfully", (uint8_t *)&v16, 2u);
  }

  v14 = *(_QWORD *)(a1[5] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __71__AKAuthorizationController_cancelAuthorizationWithContext_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)revokeAuthorizationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKAuthorizationController *v9;
  uint64_t v10;
  id v11;
  void *v12;
  AKAuthorizationDaemonConnection *daemonConnection;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  AKAuthorizationController *v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/revokeUpgrade", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__17;
  v21[4] = __Block_byref_object_dispose__17;
  v9 = self;
  v10 = MEMORY[0x1E0C809B0];
  v22 = v9;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__AKAuthorizationController_revokeAuthorizationWithContext_completion___block_invoke;
  v18[3] = &unk_1E2E5E750;
  v20 = v21;
  v11 = v7;
  v19 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v18);
  daemonConnection = v9->_daemonConnection;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __71__AKAuthorizationController_revokeAuthorizationWithContext_completion___block_invoke_11;
  v16[3] = &unk_1E2E5E220;
  v14 = v12;
  v17 = v14;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "revokeUpgradeWithContext:completion:", v6, v14);

  _Block_object_dispose(v21, 8);
  os_activity_scope_leave(&state);

}

void __71__AKAuthorizationController_revokeAuthorizationWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v5 = a3;
  _AKLogSiwa();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Revoke completed successfully", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __71__AKAuthorizationController_revokeAuthorizationWithContext_completion___block_invoke_cold_1();
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__AKAuthorizationController_revokeAuthorizationWithContext_completion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCredentialStateForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKAuthorizationController *v9;
  uint64_t v10;
  id v11;
  void *v12;
  AKAuthorizationDaemonConnection *daemonConnection;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  AKAuthorizationController *v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/credentialState", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__17;
  v21[4] = __Block_byref_object_dispose__17;
  v9 = self;
  v10 = MEMORY[0x1E0C809B0];
  v22 = v9;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke;
  v18[3] = &unk_1E2E620C8;
  v20 = v21;
  v11 = v7;
  v19 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v18);
  daemonConnection = v9->_daemonConnection;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_14;
  v16[3] = &unk_1E2E5E220;
  v14 = v12;
  v17 = v14;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getCredentialStateForRequest:completion:", v6, v14);

  _Block_object_dispose(v21, 8);
  os_activity_scope_leave(&state);

}

void __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v5 = a3;
  if (v5)
  {
    _AKLogSiwa();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_cold_2();

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  _AKLogSiwa();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_cold_1(a2, v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCredentialStateForClientID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKAuthorizationController *v9;
  uint64_t v10;
  id v11;
  void *v12;
  AKAuthorizationDaemonConnection *daemonConnection;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  AKAuthorizationController *v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/credentialStateForClientID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__17;
  v21[4] = __Block_byref_object_dispose__17;
  v9 = self;
  v10 = MEMORY[0x1E0C809B0];
  v22 = v9;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__AKAuthorizationController_getCredentialStateForClientID_completion___block_invoke;
  v18[3] = &unk_1E2E620C8;
  v20 = v21;
  v11 = v7;
  v19 = v11;
  v12 = (void *)MEMORY[0x194022E4C](v18);
  daemonConnection = v9->_daemonConnection;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __70__AKAuthorizationController_getCredentialStateForClientID_completion___block_invoke_15;
  v16[3] = &unk_1E2E5E220;
  v14 = v12;
  v17 = v14;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getCredentialStateForClientID:completion:", v6, v14);

  _Block_object_dispose(v21, 8);
  os_activity_scope_leave(&state);

}

void __70__AKAuthorizationController_getCredentialStateForClientID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v5 = a3;
  if (v5)
  {
    _AKLogSiwa();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_cold_2();

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  _AKLogSiwa();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_cold_1(a2, v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__AKAuthorizationController_getCredentialStateForClientID_completion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getPresentationContextForRequestContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AKAuthorizationController *v9;
  uint64_t v10;
  id v11;
  void *v12;
  AKAuthorizationDaemonConnection *daemonConnection;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  AKAuthorizationController *v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19202F000, "authkit/presentationContext", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__17;
  v21[4] = __Block_byref_object_dispose__17;
  v9 = self;
  v22 = v9;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__AKAuthorizationController_getPresentationContextForRequestContext_completion___block_invoke;
  v18[3] = &unk_1E2E620F0;
  v11 = v7;
  v19 = v11;
  v20 = v21;
  v12 = (void *)MEMORY[0x194022E4C](v18);
  daemonConnection = v9->_daemonConnection;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __80__AKAuthorizationController_getPresentationContextForRequestContext_completion___block_invoke_17;
  v16[3] = &unk_1E2E5E220;
  v14 = v12;
  v17 = v14;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getPresentationContextForRequestContext:completion:", v6, v14);

  _Block_object_dispose(v21, 8);
  os_activity_scope_leave(&state);

}

void __80__AKAuthorizationController_getPresentationContextForRequestContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  _AKLogSiwa();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "getPresentationContext completed with presentation context: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

uint64_t __80__AKAuthorizationController_getPresentationContextForRequestContext_completion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performAuthorizationWithContext:(id)a3 withUserProvidedInformation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AKAuthorizationController *v18;
  uint64_t v19;
  id v20;
  void *v21;
  AKAuthorizationDaemonConnection *daemonConnection;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD *v33;
  _QWORD v34[5];
  AKAuthorizationController *v35;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_19202F000, "authkit/performRequestWithSelection", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (-[AKAuthorizationController _shouldOverrideProxiedBundleIDForContext:](self, "_shouldOverrideProxiedBundleIDForContext:", v8))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "set_proxiedClientBundleID:", v13);
  }
  objc_msgSend(v8, "authorizationRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRequestIdentifier:", v15);

  objc_msgSend(v8, "passwordRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRequestIdentifier:", v17);

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__17;
  v34[4] = __Block_byref_object_dispose__17;
  v18 = self;
  v19 = MEMORY[0x1E0C809B0];
  v35 = v18;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __100__AKAuthorizationController_performAuthorizationWithContext_withUserProvidedInformation_completion___block_invoke;
  v31[3] = &unk_1E2E62118;
  v31[4] = v18;
  v20 = v10;
  v32 = v20;
  v33 = v34;
  v21 = (void *)MEMORY[0x194022E4C](v31);
  daemonConnection = v18->_daemonConnection;
  v26 = v19;
  v27 = 3221225472;
  v28 = __100__AKAuthorizationController_performAuthorizationWithContext_withUserProvidedInformation_completion___block_invoke_19;
  v29 = &unk_1E2E5E220;
  v23 = v21;
  v30 = v23;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", &v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSiwa();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v8;
    _os_log_impl(&dword_19202F000, v25, OS_LOG_TYPE_DEFAULT, "Attempting proxy auth with context: %@", buf, 0xCu);
  }

  objc_msgSend(v24, "performAuthorizationWithContext:withUserProvidedInformation:completion:", v8, v9, v23, v26, v27, v28, v29);
  _Block_object_dispose(v34, 8);

  os_activity_scope_leave(&state);
}

void __100__AKAuthorizationController_performAuthorizationWithContext_withUserProvidedInformation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  _AKLogSiwa();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "performAuthorizationWithContext completed with presentation context: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __100__AKAuthorizationController_performAuthorizationWithContext_withUserProvidedInformation_completion___block_invoke_cold_1(a1, (uint64_t)v6, v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

uint64_t __100__AKAuthorizationController_performAuthorizationWithContext_withUserProvidedInformation_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _AKLogSiwa();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_cold_1();

}

- (id)_appleOwnedDomains
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[5];
  uint8_t buf[8];
  _QWORD v11[4];
  id v12;

  _AKLogSiwa();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v3, OS_LOG_TYPE_DEFAULT, "Fetching apple owned domains...", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v11[0] = buf;
  v11[1] = 0x3032000000;
  v11[2] = __Block_byref_object_copy__17;
  v11[3] = __Block_byref_object_dispose__17;
  v12 = 0;
  -[AKAuthorizationDaemonConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__AKAuthorizationController__appleOwnedDomains__block_invoke_23;
  v9[3] = &unk_1E2E62140;
  v9[4] = buf;
  objc_msgSend(v4, "fetchAppleOwnedDomainSetWithCompletion:", v9);
  _AKLogSiwa();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AKAuthorizationController _appleOwnedDomains].cold.1((uint64_t)v11, v5, v6);

  v7 = *(id *)(v11[0] + 40);
  _Block_object_dispose(buf, 8);

  return v7;
}

void __47__AKAuthorizationController__appleOwnedDomains__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _AKLogSiwa();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __47__AKAuthorizationController__appleOwnedDomains__block_invoke_cold_1();

}

void __47__AKAuthorizationController__appleOwnedDomains__block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  _AKLogSiwa();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Apple owned domains fetched", v11, 2u);
    }

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = v5;
    v8 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __47__AKAuthorizationController__appleOwnedDomains__block_invoke_23_cold_1();
  }

}

- (void)fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion:(id)a3
{
  id v4;
  AKAuthorizationController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  AKAuthorizationDaemonConnection *daemonConnection;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  AKAuthorizationController *v18;

  v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__17;
  v17[4] = __Block_byref_object_dispose__17;
  v5 = self;
  v6 = MEMORY[0x1E0C809B0];
  v18 = v5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__AKAuthorizationController_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion___block_invoke;
  v14[3] = &unk_1E2E62168;
  v16 = v17;
  v7 = v4;
  v15 = v7;
  v8 = (void *)MEMORY[0x194022E4C](v14);
  daemonConnection = v5->_daemonConnection;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __85__AKAuthorizationController_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion___block_invoke_25;
  v12[3] = &unk_1E2E5E220;
  v10 = v8;
  v13 = v10;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion:", v10);

  _Block_object_dispose(v17, 8);
}

void __85__AKAuthorizationController_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v6, "length");
  _AKLogSiwa();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "fetchAppleIDAuthorizeHTMLResponseTemplate completed with result.", v12, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __85__AKAuthorizationController_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion___block_invoke_cold_1();
  }

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__AKAuthorizationController_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)continueFetchingIconForRequestContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAuthorizationController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  AKAuthorizationDaemonConnection *daemonConnection;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  AKAuthorizationController *v21;

  v6 = a3;
  v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__17;
  v20[4] = __Block_byref_object_dispose__17;
  v8 = self;
  v9 = MEMORY[0x1E0C809B0];
  v21 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__AKAuthorizationController_continueFetchingIconForRequestContext_completion___block_invoke;
  v17[3] = &unk_1E2E62190;
  v19 = v20;
  v10 = v7;
  v18 = v10;
  v11 = (void *)MEMORY[0x194022E4C](v17);
  daemonConnection = v8->_daemonConnection;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __78__AKAuthorizationController_continueFetchingIconForRequestContext_completion___block_invoke_27;
  v15[3] = &unk_1E2E5E220;
  v13 = v11;
  v16 = v13;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "continueFetchingIconForRequestContext:completion:", v6, v13);

  _Block_object_dispose(v20, 8);
}

void __78__AKAuthorizationController_continueFetchingIconForRequestContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v6, "length");
  _AKLogSiwa();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "continueFetchingIconWithCompletion completed with result.", v12, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __78__AKAuthorizationController_continueFetchingIconForRequestContext_completion___block_invoke_cold_1();
  }

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__AKAuthorizationController_continueFetchingIconForRequestContext_completion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)primaryApplicationInformationForWebServiceWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  AKAuthorizationDaemonConnection *daemonConnection;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19202F000, "authkit/fetch-primary-bundleid", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__17;
  v27 = __Block_byref_object_dispose__17;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__17;
  v21 = __Block_byref_object_dispose__17;
  v22 = 0;
  v8 = MEMORY[0x1E0C809B0];
  daemonConnection = self->_daemonConnection;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__AKAuthorizationController_primaryApplicationInformationForWebServiceWithInfo_error___block_invoke;
  v16[3] = &unk_1E2E5E868;
  v16[4] = &v17;
  -[AKAuthorizationDaemonConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSiwa();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("client_id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v12;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Calling out to remote auth service to fetch primary bundle ID for service: %@", buf, 0xCu);

  }
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __86__AKAuthorizationController_primaryApplicationInformationForWebServiceWithInfo_error___block_invoke_29;
  v15[3] = &unk_1E2E5EB30;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v10, "fetchPrimaryApplicationInformationForWebServiceWithInfo:completion:", v6, v15);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v13 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  os_activity_scope_leave(&state);
  return v13;
}

void __86__AKAuthorizationController_primaryApplicationInformationForWebServiceWithInfo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _AKLogSiwa();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__AKAppleIDAuthenticationController_setAppleIDWithDSID_inUse_forService___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __86__AKAuthorizationController_primaryApplicationInformationForWebServiceWithInfo_error___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Result of remote call: %@. Error: %@", (uint8_t *)&v13, 0x16u);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

- (void)storeAuthorization:(id)a3 forProxiedRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  AKAuthorizationController *v12;
  uint64_t v13;
  id v14;
  void *v15;
  AKAuthorizationDaemonConnection *daemonConnection;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  AKAuthorizationController *v25;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_19202F000, "authkit/store-proxied-authorization", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__17;
  v24[4] = __Block_byref_object_dispose__17;
  v12 = self;
  v13 = MEMORY[0x1E0C809B0];
  v25 = v12;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__AKAuthorizationController_storeAuthorization_forProxiedRequest_completion___block_invoke;
  v21[3] = &unk_1E2E5E750;
  v23 = v24;
  v14 = v10;
  v22 = v14;
  v15 = (void *)MEMORY[0x194022E4C](v21);
  daemonConnection = v12->_daemonConnection;
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __77__AKAuthorizationController_storeAuthorization_forProxiedRequest_completion___block_invoke_31;
  v19[3] = &unk_1E2E5E220;
  v17 = v15;
  v20 = v17;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "storeAuthorization:forProxiedRequest:completion:", v8, v9, v17);

  _Block_object_dispose(v24, 8);
  os_activity_scope_leave(&state);

}

void __77__AKAuthorizationController_storeAuthorization_forProxiedRequest_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v5 = a3;
  _AKLogSiwa();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Store proxied authorization completed", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __77__AKAuthorizationController_storeAuthorization_forProxiedRequest_completion___block_invoke_cold_1();
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__AKAuthorizationController_storeAuthorization_forProxiedRequest_completion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)canPerformAuthorization
{
  return 1;
}

+ (id)appleOwnedDomains
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_appleOwnedDomains");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isURLFromAppleOwnedDomain:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[16];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AKLogSiwa();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Checking if url is apple owned", buf, 2u);
  }

  objc_msgSend(a1, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_appleOwnedDomains");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v4, "host");
    v8 = objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v7;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v15 = -[NSObject length](v8, "length", (_QWORD)v28);
          if (v15 >= objc_msgSend(v14, "length"))
          {
            v16 = -[NSObject length](v8, "length");
            v17 = v16 - objc_msgSend(v14, "length");
            if (!-[NSObject compare:options:range:](v8, "compare:options:range:", v14, 1, v17, objc_msgSend(v14, "length")))
            {
              v18 = -[NSObject length](v8, "length");
              if (v18 == objc_msgSend(v14, "length")
                || -[NSObject characterAtIndex:](v8, "characterAtIndex:", v17 - 1) == 46)
              {
                v19 = 1;
                goto LABEL_22;
              }
            }
          }
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v11)
          continue;
        break;
      }
    }

    _AKLogSiwa();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "URL is not apple owned", buf, 2u);
    }
    v19 = 0;
LABEL_22:

  }
  else
  {
    _AKLogSiwa();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[AKAuthorizationController shouldProcessURL:].cold.1(v8, v20, v21, v22, v23, v24, v25, v26);
    v19 = 0;
  }

  return v19;
}

+ (unint64_t)appSSORequestTypeForURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AKLogSiwa();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_19202F000, v5, OS_LOG_TYPE_DEFAULT, "Checking app SSO request type", (uint8_t *)&v16, 2u);
  }

  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isForgotPasswordNativeTakeoverEnabled");

  if (!v7)
    goto LABEL_6;
  +[AKURLBag sharedBag](AKURLBag, "sharedBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iForgotWebURLToIntercept");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) != 0)
  {
    a1 = (id)2;
  }
  else
  {
LABEL_6:
    LODWORD(a1) = objc_msgSend(a1, "isURLFromAppleOwnedDomain:", v4);
    _AKLogSiwa();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = CFSTR("NO");
      if ((_DWORD)a1)
        v14 = CFSTR("YES");
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "Should show authorization flow: %@", (uint8_t *)&v16, 0xCu);
    }

    a1 = (id)a1;
  }

  return (unint64_t)a1;
}

- (void)establishConnectionWithNotificationHandlerEndpoint:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAuthorizationController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  AKAuthorizationDaemonConnection *daemonConnection;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  AKAuthorizationController *v21;

  v6 = a3;
  v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__17;
  v20[4] = __Block_byref_object_dispose__17;
  v8 = self;
  v9 = MEMORY[0x1E0C809B0];
  v21 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__AKAuthorizationController_establishConnectionWithNotificationHandlerEndpoint_completion___block_invoke;
  v17[3] = &unk_1E2E5E750;
  v19 = v20;
  v10 = v7;
  v18 = v10;
  v11 = (void *)MEMORY[0x194022E4C](v17);
  daemonConnection = v8->_daemonConnection;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __91__AKAuthorizationController_establishConnectionWithNotificationHandlerEndpoint_completion___block_invoke_43;
  v15[3] = &unk_1E2E5E220;
  v13 = v11;
  v16 = v13;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "establishConnectionWithNotificationHandlerEndpoint:completion:", v6, v13);

  _Block_object_dispose(v20, 8);
}

void __91__AKAuthorizationController_establishConnectionWithNotificationHandlerEndpoint_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[16];

  v5 = a3;
  v6 = v5;
  if ((_DWORD)a2)
  {
    _AKLogSiwa();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Established connection between notification center endpoint and daemon service.", v11, 2u);
    }
  }
  else
  {
    if ((objc_msgSend(v5, "ak_isAuthenticationErrorWithCode:", -7026) & 1) != 0)
      goto LABEL_8;
    _AKLogSiwa();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__AKAuthorizationController_establishConnectionWithNotificationHandlerEndpoint_completion___block_invoke_cold_1();
  }

LABEL_8:
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, a2, v6);

}

uint64_t __91__AKAuthorizationController_establishConnectionWithNotificationHandlerEndpoint_completion___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)establishConnectionWithStateBroadcastHandlerEndpoint:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKAuthorizationController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  AKAuthorizationDaemonConnection *daemonConnection;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  AKAuthorizationController *v21;

  v6 = a3;
  v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__17;
  v20[4] = __Block_byref_object_dispose__17;
  v8 = self;
  v9 = MEMORY[0x1E0C809B0];
  v21 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__AKAuthorizationController_establishConnectionWithStateBroadcastHandlerEndpoint_completion___block_invoke;
  v17[3] = &unk_1E2E5E750;
  v19 = v20;
  v10 = v7;
  v18 = v10;
  v11 = (void *)MEMORY[0x194022E4C](v17);
  daemonConnection = v8->_daemonConnection;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __93__AKAuthorizationController_establishConnectionWithStateBroadcastHandlerEndpoint_completion___block_invoke_44;
  v15[3] = &unk_1E2E5E220;
  v13 = v11;
  v16 = v13;
  -[AKAuthorizationDaemonConnection remoteObjectProxyWithErrorHandler:](daemonConnection, "remoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "establishConnectionWithStateBroadcastHandlerEndpoint:completion:", v6, v13);

  _Block_object_dispose(v20, 8);
}

void __93__AKAuthorizationController_establishConnectionWithStateBroadcastHandlerEndpoint_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[16];

  v5 = a3;
  v6 = v5;
  if ((_DWORD)a2)
  {
    _AKLogSiwa();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Established connection between state broadcast handler endpoint and daemon service.", v11, 2u);
    }
  }
  else
  {
    if ((objc_msgSend(v5, "ak_isAuthenticationErrorWithCode:", -7026) & 1) != 0)
      goto LABEL_8;
    _AKLogSiwa();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __93__AKAuthorizationController_establishConnectionWithStateBroadcastHandlerEndpoint_completion___block_invoke_cold_1();
  }

LABEL_8:
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, a2, v6);

}

uint64_t __93__AKAuthorizationController_establishConnectionWithStateBroadcastHandlerEndpoint_completion___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_shouldOverrideProxiedBundleIDForContext:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  if (objc_msgSend(v3, "_isWebLogin")
    && objc_msgSend(v3, "_isEligibleForUpgradeFromPassword"))
  {
    if (objc_msgSend(v3, "_isEligibleForUpgradeFromPassword"))
    {
      objc_msgSend(v3, "_proxiedClientBundleID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        LOBYTE(v5) = 0;
      else
        v5 = objc_msgSend(v3, "_isSubscriptionLogin") ^ 1;

    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    v5 = objc_msgSend(v3, "_isSubscriptionLogin") ^ 1;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_clientImpl, 0);
}

void __72__AKAuthorizationController_performAuthorizationWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Authorization failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__AKAuthorizationController_beginAuthorizationWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Begin Authorization failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__AKAuthorizationController_continueAuthorizationWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Continue Authorization failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__AKAuthorizationController_cancelAuthorizationWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Cancel Authorization failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __71__AKAuthorizationController_revokeAuthorizationWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Revoke failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, a2, v4, "Credential State returned with state: %@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __69__AKAuthorizationController_getCredentialStateForRequest_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Credential State request returned with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __100__AKAuthorizationController_performAuthorizationWithContext_withUserProvidedInformation_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_19202F000, log, OS_LOG_TYPE_ERROR, "%@: Authorization failed: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_nativeTakeoverURLs
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_19202F000, a2, a3, "Native takeover URLs: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch authorized URLs with XPC error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48__AKAuthorizationController__nativeTakeoverURLs__block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch authorized URLs with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_appleOwnedDomains
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_19202F000, a2, a3, "Apple owned domains: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __47__AKAuthorizationController__appleOwnedDomains__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch apple owned domains with XPC error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__AKAuthorizationController__appleOwnedDomains__block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch apple owned domains with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __85__AKAuthorizationController_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to fetch authorization HTML response template with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__AKAuthorizationController_continueFetchingIconForRequestContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to continue fetching icon with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__AKAuthorizationController_storeAuthorization_forProxiedRequest_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Store proxied authorization failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)shouldProcessURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "No URL for Apple ID Authorization", a5, a6, a7, a8, 0);
}

+ (void)shouldProcessURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_19202F000, v0, v1, "Authorize URLs: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __91__AKAuthorizationController_establishConnectionWithNotificationHandlerEndpoint_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to establish connection between notification center endpoint and daemon service with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __93__AKAuthorizationController_establishConnectionWithStateBroadcastHandlerEndpoint_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Failed to establish connection between state broadcast handler endpoint and daemon service with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
