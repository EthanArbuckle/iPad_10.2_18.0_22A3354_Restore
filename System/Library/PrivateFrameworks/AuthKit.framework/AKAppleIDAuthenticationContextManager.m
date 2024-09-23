@implementation AKAppleIDAuthenticationContextManager

- (AKAppleIDAuthenticationContextManager)initWithAuthenticationController:(id)a3
{
  id v4;
  AKAppleIDAuthenticationContextManager *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *authContextsByUUID;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *authContextsQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKAppleIDAuthenticationContextManager;
  v5 = -[AKAppleIDAuthenticationContextManager init](&v12, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    authContextsByUUID = v5->_authContextsByUUID;
    v5->_authContextsByUUID = v6;

    objc_storeWeak((id *)&v5->_authController, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("AKContextManagerQueue", v8);
    authContextsQueue = v5->_authContextsQueue;
    v5->_authContextsQueue = (OS_dispatch_queue *)v9;

  }
  return v5;
}

- (id)registerContext:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  NSObject *authContextsQueue;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v16[5];
  id v17;
  _QWORD block[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasPrefix:", CFSTR("AK")) & 1) != 0)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__2;
    v25 = __Block_byref_object_dispose__2;
    v26 = 0;
    authContextsQueue = self->_authContextsQueue;
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__AKAppleIDAuthenticationContextManager_registerContext___block_invoke;
    block[3] = &unk_1E2E5EFE0;
    v20 = &v21;
    block[4] = self;
    v9 = v4;
    v19 = v9;
    dispatch_barrier_sync(authContextsQueue, block);
    if (v22[5])
    {
      _AKLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "_identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAppleIDAuthenticationContextManager registerContext:].cold.1(v11, (uint64_t)v27, v10);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7086);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = self->_authContextsQueue;
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __57__AKAppleIDAuthenticationContextManager_registerContext___block_invoke_16;
      v16[3] = &unk_1E2E5EC28;
      v16[4] = self;
      v17 = v9;
      dispatch_barrier_async(v14, v16);

      v12 = 0;
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager registerContext:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7085);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

void __57__AKAppleIDAuthenticationContextManager_registerContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "_identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __57__AKAppleIDAuthenticationContextManager_registerContext___block_invoke_16(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v1, "_identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v1, v3);

}

- (void)unregisterContext:(id)a3
{
  void *v4;
  NSObject *authContextsQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AKAppleIDAuthenticationContextManager *v9;

  objc_msgSend(a3, "_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  authContextsQueue = self->_authContextsQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__AKAppleIDAuthenticationContextManager_unregisterContext___block_invoke;
  v7[3] = &unk_1E2E5EC28;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_async(authContextsQueue, v7);

}

void __59__AKAppleIDAuthenticationContextManager_unregisterContext___block_invoke(uint64_t a1)
{
  NSObject *v1;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObjectForKey:");
  }
  else
  {
    _AKLogSystem();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __59__AKAppleIDAuthenticationContextManager_unregisterContext___block_invoke_cold_1();

  }
}

- (void)shouldContinueWithAuthenticationResults:(id)a3 error:(id)a4 forContextID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *authContextsQueue;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  int v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  void *v26;
  id WeakRetained;
  NSObject *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  const __CFString *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD);
  _QWORD v44[4];
  id v45;
  os_signpost_id_t v46;
  uint64_t v47;
  _QWORD block[5];
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v40 = a4;
  v10 = a5;
  v11 = a6;
  v12 = _os_activity_create(&dword_19202F000, "authkit/should-continue", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__2;
  v55 = __Block_byref_object_dispose__2;
  v56 = 0;
  authContextsQueue = self->_authContextsQueue;
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__AKAppleIDAuthenticationContextManager_shouldContinueWithAuthenticationResults_error_forContextID_completion___block_invoke;
  block[3] = &unk_1E2E5EFE0;
  v50 = &v51;
  block[4] = self;
  v15 = v10;
  v49 = v15;
  dispatch_sync(authContextsQueue, block);
  if (v52[5])
  {
    _AKSignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = _AKSignpostCreate(v16);
    v19 = v18;

    _AKSignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      v22 = objc_msgSend(v40, "code");
      *(_DWORD *)buf = 67240192;
      LODWORD(v59) = v22;
      _os_signpost_emit_with_name_impl(&dword_19202F000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "ShouldContinueWithResults", " Error=%{public,signpost.telemetry:number1,name=Error}d  enableTelemetry=YES ", buf, 8u);
    }

    _AKSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v40, "code");
      *(_DWORD *)buf = 134218240;
      v59 = v17;
      v60 = 1026;
      v61 = v24;
      _os_log_impl(&dword_19202F000, v23, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ShouldContinueWithResults  Error=%{public,signpost.telemetry:number1,name=Error}d  enableTelemetry=YES ", buf, 0x12u);
    }

    v44[0] = v14;
    v44[1] = 3221225472;
    v44[2] = __111__AKAppleIDAuthenticationContextManager_shouldContinueWithAuthenticationResults_error_forContextID_completion___block_invoke_17;
    v44[3] = &unk_1E2E5F008;
    v46 = v17;
    v47 = v19;
    v45 = v11;
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194022E4C](v44);
    -[AKAppleIDAuthenticationContextManager delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_authController);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      _AKLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19202F000, v28, OS_LOG_TYPE_DEFAULT, "Calling delegate...", buf, 2u);
      }

      v29 = (id)objc_msgSend(v39, "mutableCopy");
      v30 = objc_msgSend(v26, "authenticationController:shouldContinueWithAuthenticationResults:error:forContext:", WeakRetained, v29, v40, v52[5]);
      _AKLogSystem();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = CFSTR("NO");
        if ((_DWORD)v30)
          v32 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v59 = (os_signpost_id_t)v32;
        _os_log_impl(&dword_19202F000, v31, OS_LOG_TYPE_DEFAULT, "Delegate says to continue? %@", buf, 0xCu);
      }

      ((void (**)(_QWORD, uint64_t, id))v25)[2](v25, v30, v29);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        _AKLogSystem();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19202F000, v38, OS_LOG_TYPE_DEFAULT, "No delegate available.", buf, 2u);
        }

        ((void (**)(_QWORD, BOOL, id))v25)[2](v25, v40 == 0, v39);
        goto LABEL_26;
      }
      _AKLogSystem();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19202F000, v35, OS_LOG_TYPE_DEFAULT, "Calling delegate...", buf, 2u);
      }

      v36 = (void *)objc_msgSend(v39, "mutableCopy");
      v37 = v52[5];
      v41[0] = v14;
      v41[1] = 3221225472;
      v41[2] = __111__AKAppleIDAuthenticationContextManager_shouldContinueWithAuthenticationResults_error_forContextID_completion___block_invoke_27;
      v41[3] = &unk_1E2E5F030;
      v43 = v25;
      v29 = v36;
      v42 = v29;
      objc_msgSend(v26, "authenticationController:shouldContinueWithAuthenticationResults:error:forContext:completion:", WeakRetained, v29, v40, v37, v41);

    }
LABEL_26:

    goto LABEL_27;
  }
  _AKLogSystem();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    -[AKAppleIDAuthenticationContextManager shouldContinueWithAuthenticationResults:error:forContextID:completion:].cold.1((uint64_t)v15, v33, v34);

  (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v39);
LABEL_27:

  _Block_object_dispose(&v51, 8);
  os_activity_scope_leave(&state);

}

void __111__AKAppleIDAuthenticationContextManager_shouldContinueWithAuthenticationResults_error_forContextID_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __111__AKAppleIDAuthenticationContextManager_shouldContinueWithAuthenticationResults_error_forContextID_completion___block_invoke_17(_QWORD *a1, int a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a3;
  Nanoseconds = _AKSignpostGetNanoseconds(v5, v6);
  _AKSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[5];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v13 = 67240192;
    LODWORD(v14) = a2;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v10, OS_SIGNPOST_INTERVAL_END, v11, "ShouldContinueWithResults", " ShouldContinue=%{public,signpost.telemetry:number2,name=ShouldContinue}d ", (uint8_t *)&v13, 8u);
  }

  _AKSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218496;
    v14 = a1[5];
    v15 = 2048;
    v16 = (double)Nanoseconds / 1000000000.0;
    v17 = 1026;
    v18 = a2;
    _os_log_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:ShouldContinueWithResults  ShouldContinue=%{public,signpost.telemetry:number2,name=ShouldContinue}d ", (uint8_t *)&v13, 0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __111__AKAppleIDAuthenticationContextManager_shouldContinueWithAuthenticationResults_error_forContextID_completion___block_invoke_27(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (a2)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_19202F000, v4, OS_LOG_TYPE_DEFAULT, "Delegate says to continue? %@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)presentKeepUsingUIForContext:(id)a3 appleID:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _AKLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentKeepUsingUIForContext:appleID:completion:].cold.1();

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = -7011;
    goto LABEL_12;
  }
  v11 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if ((v11 & 1) == 0)
  {
    if (v13)
      -[AKAppleIDAuthenticationContextManager presentKeepUsingUIForContext:appleID:completion:].cold.3();

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = -7027;
LABEL_12:
    objc_msgSend(v15, "ak_errorWithCode:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v17);

    goto LABEL_13;
  }
  if (v13)
    -[AKAppleIDAuthenticationContextManager presentKeepUsingUIForContext:appleID:completion:].cold.2();

  objc_msgSend(v10, "presentKeepUsingUIForAppleID:completion:", v8, v9);
LABEL_13:

}

- (void)dismissKeepUsingUIForContext:(id)a3 withCompletion:(id)a4
{
  void *v6;
  void *v7;
  void (*v8)(void);
  _QWORD *v9;

  v9 = a4;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7011);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void (*)(void))v9[2];
LABEL_6:
    v8();

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7027);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void (*)(void))v9[2];
    goto LABEL_6;
  }
  objc_msgSend(v6, "dismissKeepUsingUIWithCompletion:", v9);
LABEL_7:

}

- (void)presentBasicLoginUIForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -7011;
LABEL_8:
    objc_msgSend(v9, "ak_errorWithCode:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v12);

    goto LABEL_9;
  }
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EE2646D0) & 1) == 0)
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:].cold.1();

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -7014;
    goto LABEL_8;
  }
  objc_msgSend(v8, "presentBasicLoginUIWithCompletion:", v7);
LABEL_9:

}

- (void)dismissBasicLoginUIForContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;

  v6 = (void (**)(id, _QWORD, void *))a4;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -7011;
LABEL_8:
    objc_msgSend(v9, "ak_errorWithCode:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v12);

    goto LABEL_9;
  }
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE2646D0) & 1) == 0)
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:].cold.1();

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -7014;
    goto LABEL_8;
  }
  objc_msgSend(v8, "dismissBasicLoginUIWithCompletion:", v6);
LABEL_9:

}

- (void)presentLoginAlertForContext:(id)a3 withError:(id)a4 title:(id)a5 message:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = -7011;
LABEL_8:
    objc_msgSend(v18, "ak_errorWithCode:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, 0, v21);

    goto LABEL_9;
  }
  if ((objc_msgSend(v16, "conformsToProtocol:", &unk_1EE2646D0) & 1) == 0)
  {
    _AKLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:].cold.1();

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = -7014;
    goto LABEL_8;
  }
  objc_msgSend(v17, "presentLoginAlertWithError:title:message:completion:", v12, v13, v14, v15);
LABEL_9:

}

- (void)presentSecondFactorUIForContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;

  v6 = (void (**)(id, _QWORD, void *))a4;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = -7011;
LABEL_8:
    objc_msgSend(v8, "ak_errorWithCode:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v11);

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentSecondFactorUIForContext:completion:].cold.1();

    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = -7014;
    goto LABEL_8;
  }
  objc_msgSend(v7, "presentSecondFactorUIWithCompletion:", v6);
LABEL_9:

}

- (void)dismissSecondFactorUIForContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;

  v6 = (void (**)(id, _QWORD, void *))a4;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = -7011;
LABEL_8:
    objc_msgSend(v8, "ak_errorWithCode:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v11);

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:].cold.1();

    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = -7014;
    goto LABEL_8;
  }
  objc_msgSend(v7, "dismissSecondFactorUIWithCompletion:", v6);
LABEL_9:

}

- (void)presentSecondFactorAlertForContext:(id)a3 withError:(id)a4 title:(id)a5 message:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, void *))a7;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = -7011;
LABEL_8:
    objc_msgSend(v17, "ak_errorWithCode:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v20);

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    _AKLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:].cold.1();

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = -7014;
    goto LABEL_8;
  }
  objc_msgSend(v16, "presentSecondFactorAlertWithError:title:message:completion:", v12, v13, v14, v15);
LABEL_9:

}

- (void)presentServerProvidedUIForContext:(id)a3 withConfiguration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  int v24;
  AKAppleIDAuthenticationContextManager *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v24 = 138412802;
    v25 = self;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_debug_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEBUG, "%@: Presenting server provided UI for context (%@) with configuration (%@)", (uint8_t *)&v24, 0x20u);
  }

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = -7011;
LABEL_14:
    objc_msgSend(v20, "ak_errorWithCode:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v23);

    goto LABEL_15;
  }
  if ((objc_msgSend(v12, "conformsToProtocol:", &unk_1EE264AE8) & 1) == 0)
  {
    _AKLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:].cold.1();

    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = -7014;
    goto LABEL_14;
  }
  objc_msgSend(v13, "anisetteDataProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    _AKLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "anisetteDataProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resourceLoadDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412802;
      v25 = self;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "%@: Setting the anisette data provider (%@) on resource load delegate (%@)", (uint8_t *)&v24, 0x20u);

    }
    objc_msgSend(v9, "resourceLoadDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anisetteDataProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAnisetteDataProvider:", v19);

  }
  objc_msgSend(v13, "presentServerProvidedUIWithConfiguration:completion:", v9, v10);
LABEL_15:

}

- (void)dismissServerProvidedUIForContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;

  v6 = (void (**)(id, _QWORD, void *))a4;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -7011;
LABEL_8:
    objc_msgSend(v9, "ak_errorWithCode:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v12);

    goto LABEL_9;
  }
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE264AE8) & 1) == 0)
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:].cold.1();

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -7014;
    goto LABEL_8;
  }
  objc_msgSend(v8, "dismissServerProvidedUIWithCompletion:", v6);
LABEL_9:

}

- (void)presentNativeRecoveryUIForContext:(id)a3 recoveryContext:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;

  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = -7011;
LABEL_8:
    objc_msgSend(v12, "ak_errorWithCode:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v15);

    goto LABEL_9;
  }
  if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EE26DB68) & 1) == 0)
  {
    _AKLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:].cold.1();

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = -7014;
    goto LABEL_8;
  }
  objc_msgSend(v11, "presentNativeRecoveryUIWithContext:completion:", v8, v9);
LABEL_9:

}

- (void)dismissNativeRecoveryUIForContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;

  v6 = (void (**)(id, _QWORD, void *))a4;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -7011;
LABEL_8:
    objc_msgSend(v9, "ak_errorWithCode:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v12);

    goto LABEL_9;
  }
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE26DB68) & 1) == 0)
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:].cold.1();

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -7014;
    goto LABEL_8;
  }
  objc_msgSend(v8, "dismissNativeRecoveryUIWithCompletion:", v6);
LABEL_9:

}

- (void)presentBiometricOrPasscodeValidationForContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -7011;
LABEL_6:
    objc_msgSend(v9, "ak_errorWithCode:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v8);
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -7027;
    goto LABEL_6;
  }
  objc_msgSend(v11, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentBiometricOrPasscodeValidationForAppleID:completion:", v8, v6);
LABEL_7:

}

- (void)launchOutOfProcessAuthentication:(id)a3 surrogateID:(id)a4 withErrorHandler:(id)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = a5;
  objc_msgSend(v6, "ak_errorWithCode:", -7027);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v7, v8);

}

- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    _AKLogFido();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentFidoAuthForContext:fidoContext:completion:].cold.1();

    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = -7011;
    goto LABEL_12;
  }
  v12 = objc_opt_respondsToSelector();
  _AKLogFido();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager presentFidoAuthForContext:fidoContext:completion:].cold.3();

    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = -7027;
LABEL_12:
    objc_msgSend(v16, "ak_errorWithCode:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v18);

    goto LABEL_13;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager presentFidoAuthForContext:fidoContext:completion:].cold.2();

  objc_msgSend(v11, "presentFidoAuthForContext:fidoContext:completion:", v8, v9, v10);
LABEL_13:

}

- (void)presentProximityBroadcastUIForContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:].cold.3();

  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:].cold.2();

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (!v7)
      goto LABEL_17;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = -7011;
LABEL_16:
    objc_msgSend(v14, "ak_errorWithCode:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v16);

    goto LABEL_17;
  }
  v11 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "Asking the client context to present proximity broadcast UI.", v17, 2u);
    }

    objc_msgSend(v10, "presentProximityBroadcastUIWithCompletion:", v7);
    goto LABEL_17;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:].cold.1();

  if (v7)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = -7014;
    goto LABEL_16;
  }
LABEL_17:

}

- (void)presentProximityPairingUIForContext:(id)a3 verificationCode:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t v20[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager presentProximityPairingUIForContext:verificationCode:completion:].cold.3();

  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager presentProximityPairingUIForContext:verificationCode:completion:].cold.2();

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (!v10)
      goto LABEL_17;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = -7011;
LABEL_16:
    objc_msgSend(v17, "ak_errorWithCode:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v19);

    goto LABEL_17;
  }
  v14 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v14 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Asking the client context to present proximity pairing UI.", v20, 2u);
    }

    objc_msgSend(v13, "presentProximityPairingUIWithVerificationCode:completion:", v9, v10);
    goto LABEL_17;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:].cold.1();

  if (v10)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = -7014;
    goto LABEL_16;
  }
LABEL_17:

}

- (void)presentProximityPinCodeUIForContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager presentProximityPinCodeUIForContext:completion:].cold.3();

  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager presentProximityPinCodeUIForContext:completion:].cold.2();

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (!v7)
      goto LABEL_17;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = -7011;
LABEL_16:
    objc_msgSend(v14, "ak_errorWithCode:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v16);

    goto LABEL_17;
  }
  v11 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "Asking the client context show to proximity PIN Entry UI.", v17, 2u);
    }

    objc_msgSend(v10, "presentProximityPinCodeUIWithCompletion:", v7);
    goto LABEL_17;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:].cold.1();

  if (v7)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = -7014;
    goto LABEL_16;
  }
LABEL_17:

}

- (void)activateProximitySession:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  AKAppleIDAuthenticationContextManager *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager activateProximitySession:context:completion:].cold.2();

  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v20 = 138412802;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_debug_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEBUG, "%@: Called to activate proximity session (%@) for context (%@)", (uint8_t *)&v20, 0x20u);
  }

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (!v10)
      goto LABEL_17;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = -7011;
LABEL_16:
    objc_msgSend(v17, "ak_errorWithCode:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v19);

    goto LABEL_17;
  }
  v14 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v14 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_19202F000, v16, OS_LOG_TYPE_DEFAULT, "Asking the client context to activate proximity session.", (uint8_t *)&v20, 2u);
    }

    objc_msgSend(v13, "activateProximitySession:completion:", v8, v10);
    goto LABEL_17;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:].cold.1();

  if (v10)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = -7014;
    goto LABEL_16;
  }
LABEL_17:

}

- (void)dismissProximityPairingUIForContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager dismissProximityPairingUIForContext:completion:].cold.3();

  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager dismissProximityPairingUIForContext:completion:].cold.2();

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (!v7)
      goto LABEL_17;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = -7011;
LABEL_16:
    objc_msgSend(v14, "ak_errorWithCode:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v16);

    goto LABEL_17;
  }
  v11 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "Asking the client context to dismiss proximity pairing UI.", v17, 2u);
    }

    objc_msgSend(v10, "dismissProximityPairingUIWithCompletion:", v7);
    goto LABEL_17;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:].cold.1();

  if (v7)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = -7014;
    goto LABEL_16;
  }
LABEL_17:

}

- (void)showProximityErrorForContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t v16[16];

  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = a3;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager showProximityErrorForContext:completion:].cold.2();

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (!v6)
      goto LABEL_15;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = -7011;
LABEL_14:
    objc_msgSend(v13, "ak_errorWithCode:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v15);

    goto LABEL_15;
  }
  v10 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEFAULT, "Asking the client context to show proximity error UI.", v16, 2u);
    }

    objc_msgSend(v9, "showProximityErrorWithCompletion:", v6);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:].cold.1();

  if (v6)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = -7014;
    goto LABEL_14;
  }
LABEL_15:

}

- (void)provisionAnisetteForContext:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = a3;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager provisionAnisetteForContext:withCompletion:].cold.1();

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "anisetteDataProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "provisionAnisetteWithCompletion:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7060);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v12);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7011);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v11);
  }

}

- (void)syncAnisetteForContext:(id)a3 withSIMData:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = a3;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager syncAnisetteForContext:withSIMData:completion:].cold.1();

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "anisetteDataProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "syncAnisetteWithSIMData:completion:", v8, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7060);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v15);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7011);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v14);
  }

}

- (void)eraseAnisetteForContext:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = a3;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager eraseAnisetteForContext:withCompletion:].cold.1();

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "anisetteDataProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "eraseAnisetteWithCompletion:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7060);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v12);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7011);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v11);
  }

}

- (void)fetchAnisetteDataForContext:(id)a3 provisionIfNecessary:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(id, _QWORD, void *);
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = a3;
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager fetchAnisetteDataForContext:provisionIfNecessary:withCompletion:].cold.1();

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "anisetteDataProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "fetchAnisetteDataAndProvisionIfNecessary:withCompletion:", v5, v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7060);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v14);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7011);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v13);
  }

}

- (void)legacyAnisetteDataForContext:(id)a3 DSID:(id)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = a3;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager legacyAnisetteDataForContext:DSID:withCompletion:].cold.1();

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "anisetteDataProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "legacyAnisetteDataForDSID:withCompletion:", v8, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7060);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v15);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7011);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v14);
  }

}

- (void)fetchPeerAttestationDataForContext:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  AKAppleIDAuthenticationContextManager *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationContextManager fetchPeerAttestationDataForContext:withRequest:completion:].cold.1();

  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v21 = 138412802;
    v22 = self;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_debug_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEBUG, "%@: Called to fetch peer attestation data for context (%@) with request (%@)", (uint8_t *)&v21, 0x20u);
  }

  -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:](self, "_clientSideContextForServerContext:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7011);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v15);
    goto LABEL_17;
  }
  objc_msgSend(v13, "anisetteDataProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7060);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v20 = (void *)v19;
    v10[2](v10, 0, (void *)v19);

    goto LABEL_17;
  }
  v16 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v16 & 1) == 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 138412802;
      v22 = self;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v9;
      _os_log_error_impl(&dword_19202F000, v18, OS_LOG_TYPE_ERROR, "%@: Unable to call anisette data provider (%@) to fetch peer attestation data for request (%@) because it does not respond to 'fetchPeerAttestationDataForRequest:completion:'", (uint8_t *)&v21, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAnisetteError"), -8009, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412802;
    v22 = self;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_19202F000, v18, OS_LOG_TYPE_DEFAULT, "%@: Calling anisette data provider (%@) to fetch peer attestation data for request (%@)", (uint8_t *)&v21, 0x20u);
  }

  objc_msgSend(v15, "fetchPeerAttestationDataForRequest:completion:", v9, v10);
LABEL_17:

}

- (id)_clientSideContextForServerContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *authContextsQueue;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__2;
    v22 = __Block_byref_object_dispose__2;
    v23 = 0;
    authContextsQueue = self->_authContextsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__AKAppleIDAuthenticationContextManager__clientSideContextForServerContext___block_invoke;
    block[3] = &unk_1E2E5EFE0;
    v17 = &v18;
    block[4] = self;
    v7 = v4;
    v16 = v7;
    dispatch_sync(authContextsQueue, block);
    v8 = (void *)v19[5];
    if (v8)
    {
      objc_msgSend(v8, "_updateWithValuesFromContext:", v7);
      v9 = (id)v19[5];
    }
    else
    {
      _AKLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "_identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:].cold.2(v13, (uint64_t)v24, v12);
      }

      v9 = 0;
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AKAppleIDAuthenticationContextManager _clientSideContextForServerContext:].cold.1((uint64_t)v4, v10, v11);

    v9 = 0;
  }

  return v9;
}

void __76__AKAppleIDAuthenticationContextManager__clientSideContextForServerContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "_identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (AKAppleIDAuthenticationDelegate)delegate
{
  return (AKAppleIDAuthenticationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authContextsQueue, 0);
  objc_destroyWeak((id *)&self->_authController);
  objc_storeStrong((id *)&self->_authContextsByUUID, 0);
}

- (void)registerContext:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_8_0(&dword_19202F000, a3, (uint64_t)a3, "Context ID %@ has already been registered for authentication!", (uint8_t *)a2);

}

- (void)registerContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Bad client! You are not supposed to provide your own implementation of AKAppleIDAuthenticationUIProvider!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __59__AKAppleIDAuthenticationContextManager_unregisterContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Missing context identifier, how did we get here?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)shouldContinueWithAuthenticationResults:(uint64_t)a3 error:forContextID:completion:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_8_0(&dword_19202F000, a2, a3, "Client has no knowledge of context ID: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)presentKeepUsingUIForContext:appleID:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "AKAppleIDAuthenticationContextManager failed to presentKeepUsingUIForContext. The client context is missing from the auth context.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)presentKeepUsingUIForContext:appleID:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Presenting keep using UI.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)presentKeepUsingUIForContext:appleID:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Client context missing presentKeepUsingUIForAppleID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)presentBasicLoginUIForContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Error: We do not have a UI-capable context on the client side!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)presentSecondFactorUIForContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Error: We do not have a UI-capabable context on the client side!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)presentFidoAuthForContext:fidoContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Error: Context is not configured for a Fido presentation!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)presentFidoAuthForContext:fidoContext:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Asking the client context to present Fido ui.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)presentFidoAuthForContext:fidoContext:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Error: We do not have a UIProvider. Unable to launch the Fido service!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)presentProximityBroadcastUIForContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Error: We do not have a proximity UI-capable context on the client side!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)presentProximityBroadcastUIForContext:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_19202F000, v0, v1, "%@: Called to present proximity broadcast UI for context (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)presentProximityBroadcastUIForContext:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)presentProximityPairingUIForContext:verificationCode:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_19202F000, v0, v1, "%@: Called to present proximity pairing UI for context (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)presentProximityPairingUIForContext:verificationCode:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)presentProximityPinCodeUIForContext:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_19202F000, v0, v1, "%@: Called to present proximity PIN Entry UI for context (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)presentProximityPinCodeUIForContext:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)activateProximitySession:context:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dismissProximityPairingUIForContext:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_19202F000, v0, v1, "%@: Called to dismiss proximity pairing UI for context (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)dismissProximityPairingUIForContext:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)showProximityErrorForContext:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)provisionAnisetteForContext:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)syncAnisetteForContext:withSIMData:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)eraseAnisetteForContext:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchAnisetteDataForContext:provisionIfNecessary:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)legacyAnisetteDataForContext:DSID:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchPeerAttestationDataForContext:withRequest:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_clientSideContextForServerContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_8_0(&dword_19202F000, a2, a3, "Server has provided an invalid context lacking an ID: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_clientSideContextForServerContext:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_8_0(&dword_19202F000, a3, (uint64_t)a3, "Client has no knowledge of context ID: %@", (uint8_t *)a2);

}

@end
