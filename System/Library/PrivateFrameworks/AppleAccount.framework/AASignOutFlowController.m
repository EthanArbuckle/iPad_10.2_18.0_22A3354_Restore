@implementation AASignOutFlowController

- (AASignOutFlowController)init
{
  return -[AASignOutFlowController initWithContext:](self, "initWithContext:", 0);
}

- (AASignOutFlowController)initWithContext:(id)a3
{
  id v4;
  AASignOutFlowController *v5;
  uint64_t v6;
  ACAccountStore *accountStore;
  void *v8;
  uint64_t v9;
  NSString *telemetryFlowID;
  void **p_telemetryFlowID;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AASignOutFlowController;
  v5 = -[AASignOutFlowController init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v6 = objc_claimAutoreleasedReturnValue();
    accountStore = v5->_accountStore;
    v5->_accountStore = (ACAccountStore *)v6;

    if (v4)
    {
      objc_msgSend(v4, "authenticationResults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFB8]);
      v9 = objc_claimAutoreleasedReturnValue();
      p_telemetryFlowID = (void **)&v5->telemetryFlowID;
      telemetryFlowID = v5->telemetryFlowID;
      v5->telemetryFlowID = (NSString *)v9;

      if (!v5->telemetryFlowID)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *p_telemetryFlowID;
        *p_telemetryFlowID = (void *)v13;

        _AALogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[AASignOutFlowController initWithContext:].cold.1((uint64_t *)&v5->telemetryFlowID, v15);

      }
    }
  }

  return v5;
}

- (void)signOutAppleAccount:(id)a3 completion:(id)a4
{
  char *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  _QWORD block[4];
  char *v25;
  AASignOutFlowController *v26;
  id v27;
  id v28[3];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = (char *)a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AASignOutFlowController.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

  }
  objc_msgSend(v7, "accountType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if ((v11 & 1) != 0)
  {
    v12 = _os_activity_create(&dword_19EACA000, "appleaccount/signOutAppleAccount", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v12, &state);
    _AALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v7;
      _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Will begin sign out of account: %@", buf, 0xCu);
    }

    _AASignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (char *)_AASignpostCreate(v14);
    v17 = v16;

    _AASignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19EACA000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "SignOutAppleAccount", " enableTelemetry=YES ", buf, 2u);
    }

    _AASignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v31 = v15;
      _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignOutAppleAccount  enableTelemetry=YES ", buf, 0xCu);
    }

    -[AASignOutFlowController sendTelemetryEventSignoutStart:](self, "sendTelemetryEventSignoutStart:", v7);
    objc_initWeak((id *)buf, self);
    dispatch_get_global_queue(25, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke;
    block[3] = &unk_1E416F400;
    objc_copyWeak(v28, (id *)buf);
    v25 = v7;
    v26 = self;
    v28[1] = v15;
    v28[2] = v17;
    v27 = v8;
    dispatch_async(v21, block);

    objc_destroyWeak(v28);
    objc_destroyWeak((id *)buf);
    os_activity_scope_leave(&state);
  }
  else
  {
    _AALogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "Attempting to sign out non-AppleAccount, bailing!", (uint8_t *)&state, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4404);
    v12 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, NSObject *))v8 + 2))(v8, 0, v12);
  }

}

void __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  __int128 v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E0CF0E68];
    objc_msgSend(*(id *)(a1 + 32), "aida_alternateDSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "analyticsEventWithName:altDSID:flowID:", CFSTR("com.apple.appleaccount.signOutFinish"), v4, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_2;
    v11[3] = &unk_1E416F3D8;
    v11[4] = WeakRetained;
    v7 = v6;
    v16 = *(_OWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v12 = v7;
    v13 = v8;
    v14 = v5;
    v15 = v9;
    v10 = v5;
    objc_msgSend(WeakRetained, "_preflightSignOutOfAccount:completion:", v7, v11);

  }
  else
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_cold_1(v10);
  }

}

void __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  unint64_t Nanoseconds;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  int v18;
  NSObject *v19;
  double v20;
  const __CFString *v21;
  int v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  __int128 v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v33 = v7;
    v34 = 2112;
    v35 = *(double *)&v5;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Sign out preflight completed with success: %@ and error: %@", buf, 0x16u);
  }

  if (a2)
  {
    v9 = *(void **)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_29;
    v25[3] = &unk_1E416F3D8;
    v26 = v8;
    v31 = *(_OWORD *)(a1 + 72);
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(a1 + 56);
    v27 = v10;
    v28 = v11;
    v29 = v12;
    v30 = *(id *)(a1 + 64);
    objc_msgSend(v9, "_signOutAppleAccount:completion:", v26, v25);

  }
  else
  {
    _AALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_2_cold_1();

    Nanoseconds = _AASignpostGetNanoseconds(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
    _AASignpostLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = *(_QWORD *)(a1 + 72);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      v18 = objc_msgSend(v5, "code");
      *(_DWORD *)buf = 67240192;
      LODWORD(v33) = v18;
      _os_signpost_emit_with_name_impl(&dword_19EACA000, v16, OS_SIGNPOST_INTERVAL_END, v17, "SignOutAppleAccount", " Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 8u);
    }

    _AASignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (double)Nanoseconds / 1000000000.0;
      v21 = *(const __CFString **)(a1 + 72);
      v22 = objc_msgSend(v5, "code");
      *(_DWORD *)buf = 134218496;
      v33 = v21;
      v34 = 2048;
      v35 = v20;
      v36 = 1026;
      v37 = v22;
      _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignOutAppleAccount  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x1Cu);
    }

    objc_msgSend(*(id *)(a1 + 48), "sendTelemetryEventSignoutFinish:account:didSucceed:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, v5);
    v23 = *(_QWORD *)(a1 + 64);
    if (v23)
    {
      if (v5)
      {
        (*(void (**)(uint64_t, _QWORD, id))(v23 + 16))(v23, 0, v5);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v24);

      }
    }
  }

}

void __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  int v13;
  NSObject *v14;
  double v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v19 = 138412802;
    if ((_DWORD)a2)
      v8 = CFSTR("YES");
    v20 = v7;
    v21 = 2112;
    v22 = *(double *)&v8;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Sign out of account (%@) completed with success: %@ and error: %@", (uint8_t *)&v19, 0x20u);
  }

  Nanoseconds = _AASignpostGetNanoseconds(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 72);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13 = objc_msgSend(*(id *)(a1 + 40), "code");
    v19 = 67240192;
    LODWORD(v20) = v13;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SignOutAppleAccount", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (double)Nanoseconds / 1000000000.0;
    v16 = *(_QWORD *)(a1 + 72);
    v17 = objc_msgSend(*(id *)(a1 + 40), "code");
    v19 = 134218496;
    v20 = v16;
    v21 = 2048;
    v22 = v15;
    v23 = 1026;
    LODWORD(v24) = v17;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignOutAppleAccount  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 48), "sendTelemetryEventSignoutFinish:account:didSucceed:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), a2, v5);
  v18 = *(_QWORD *)(a1 + 64);
  if (v18)
    (*(void (**)(uint64_t, uint64_t, id))(v18 + 16))(v18, a2, v5);

}

- (void)_preflightSignOutOfAccount:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  void (**v12)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (+[AADeviceInfo hasiCloudSignOutRestriction](AADeviceInfo, "hasiCloudSignOutRestriction")
    || objc_msgSend(v6, "aa_isRemotelyManaged"))
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AASignOutFlowController _preflightSignOutOfAccount:completion:].cold.1(v6, v8);

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4406);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__AASignOutFlowController__preflightSignOutOfAccount_completion___block_invoke;
    v10[3] = &unk_1E416F338;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[AASignOutFlowController _performWalrusValidationForAccount:completion:](self, "_performWalrusValidationForAccount:completion:", v11, v10);

  }
}

void __65__AASignOutFlowController__preflightSignOutOfAccount_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint8_t buf[4];
  os_signpost_id_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    _AASignpostLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = _AASignpostCreate(v3);
    v6 = v5;

    _AASignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19EACA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v4, "DisableFindMyDevice", " enableTelemetry=YES ", buf, 2u);
    }

    _AASignpostLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v4;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: DisableFindMyDevice  enableTelemetry=YES ", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__AASignOutFlowController__preflightSignOutOfAccount_completion___block_invoke_33;
    v12[3] = &unk_1E416F428;
    v14 = v4;
    v15 = v6;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v10, "_disableDeviceLocatorForAccount:completion:", v11, v12);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
}

void __65__AASignOutFlowController__preflightSignOutOfAccount_completion___block_invoke_33(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  unint64_t Nanoseconds;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  double v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  Nanoseconds = _AASignpostGetNanoseconds(a1[5], a1[6]);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = a1[5];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v13 = 67240192;
    LODWORD(v14) = objc_msgSend(v4, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v7, OS_SIGNPOST_INTERVAL_END, v8, "DisableFindMyDevice", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v13, 8u);
  }

  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (double)Nanoseconds / 1000000000.0;
    v11 = a1[5];
    v12 = objc_msgSend(v4, "code");
    v13 = 134218496;
    v14 = v11;
    v15 = 2048;
    v16 = v10;
    v17 = 1026;
    v18 = v12;
    _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: DisableFindMyDevice  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v13, 0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)_performWalrusValidationForAccount:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  int v10;
  char v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(v6, "accountType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  v11 = objc_msgSend(v6, "aa_isAccountClass:", CFSTR("primary"));
  if (v10 && (v11 & 1) != 0)
  {
    -[AASignOutFlowController _delegate_performWalrusValidationForAccount:completion:](self, "_delegate_performWalrusValidationForAccount:completion:", v6, v7);
  }
  else
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Walrus validation is not necessary for non-primary/non-apple account: %@", (uint8_t *)&v13, 0xCu);
    }

    v7[2](v7, 1, 0);
  }

}

- (void)_signOutAppleAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  os_signpost_id_t v18;
  uint64_t v19;
  uint8_t buf[4];
  os_signpost_id_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  _AASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _AASignpostCreate(v8);
  v11 = v10;

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SignOutAppleAccountDelegate", " enableTelemetry=YES ", buf, 2u);
  }

  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = v9;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignOutAppleAccountDelegate  enableTelemetry=YES ", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__AASignOutFlowController__signOutAppleAccount_completion___block_invoke;
  v16[3] = &unk_1E416F428;
  v18 = v9;
  v19 = v11;
  v17 = v6;
  v15 = v6;
  -[AASignOutFlowController _delegate_signOutAccount:completion:](self, "_delegate_signOutAccount:completion:", v7, v16);

}

void __59__AASignOutFlowController__signOutAppleAccount_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  unint64_t Nanoseconds;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  double v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  Nanoseconds = _AASignpostGetNanoseconds(a1[5], a1[6]);
  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = a1[5];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v13 = 67240192;
    LODWORD(v14) = objc_msgSend(v4, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SignOutAppleAccountDelegate", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v13, 8u);
  }

  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (double)Nanoseconds / 1000000000.0;
    v11 = a1[5];
    v12 = objc_msgSend(v4, "code");
    v13 = 134218496;
    v14 = v11;
    v15 = 2048;
    v16 = v10;
    v17 = 1026;
    v18 = v12;
    _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignOutAppleAccountDelegate  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v13, 0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)_disableDeviceLocatorForAccount:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  __int16 v15;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(v6, "accountType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if ((v10 & 1) == 0)
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v12 = "Attempting to sign out non-AppleAccount, all clear!";
      v13 = (uint8_t *)&v15;
LABEL_8:
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
LABEL_9:

    v7[2](v7, 1, 0);
    goto LABEL_10;
  }
  if ((objc_msgSend(v6, "aa_isAccountClass:", CFSTR("primary")) & 1) == 0)
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v12 = "Attempting to sign out secondary account, all clear!";
      v13 = (uint8_t *)&v14;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[AASignOutFlowController _delegate_disableFindMyDeviceForAccount:completion:](self, "_delegate_disableFindMyDeviceForAccount:completion:", v6, v7);
LABEL_10:

}

- (void)_delegate_presentError:(id)a3 withTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    _os_log_error_impl(&dword_19EACA000, v10, OS_LOG_TYPE_ERROR, "AASignOutFlowController: Will show alert for error: %@, title: %@, message: %@", buf, 0x20u);
  }

  -[AASignOutFlowController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__AASignOutFlowController__delegate_presentError_withTitle___block_invoke;
    block[3] = &unk_1E416E700;
    block[4] = self;
    v15 = v7;
    v16 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    _AALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AASignOutFlowController _delegate_presentError:withTitle:].cold.1(self);

  }
}

void __60__AASignOutFlowController__delegate_presentError_withTitle___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signOutFlowController:showAlertWithTitle:message:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &__block_literal_global_14);

}

void __60__AASignOutFlowController__delegate_presentError_withTitle___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;

  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__AASignOutFlowController__delegate_presentError_withTitle___block_invoke_2_cold_1(a2, v3, v4);

}

- (void)_delegate_disableFindMyDeviceForAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AASignOutFlowController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Calling delegate to disable find my device for account: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__AASignOutFlowController__delegate_disableFindMyDeviceForAccount_completion___block_invoke;
    block[3] = &unk_1E416E518;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AASignOutFlowController _delegate_disableFindMyDeviceForAccount:completion:].cold.1(self);

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4405);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

  }
}

void __78__AASignOutFlowController__delegate_disableFindMyDeviceForAccount_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__AASignOutFlowController__delegate_disableFindMyDeviceForAccount_completion___block_invoke_2;
  v5[3] = &unk_1E416EED0;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "signOutFlowController:disableFindMyDeviceForAccount:completion:", v3, v4, v5);

}

void __78__AASignOutFlowController__delegate_disableFindMyDeviceForAccount_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Delegate disabled find my device with success %@ and error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_delegate_signOutAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AASignOutFlowController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Calling delegate to sign out account: %@", buf, 0xCu);
    }

    -[AASignOutFlowController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__AASignOutFlowController__delegate_signOutAccount_completion___block_invoke;
    v14[3] = &unk_1E416EED0;
    v15 = v7;
    objc_msgSend(v12, "signOutFlowController:signOutAccount:completion:", self, v6, v14);

    v13 = v15;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AASignOutFlowController _delegate_signOutAccount:completion:].cold.1(self);

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4405);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);
  }

}

void __63__AASignOutFlowController__delegate_signOutAccount_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Delegate signOutAccount completed with success %@ and error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_delegate_performWalrusValidationForAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AASignOutFlowController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Calling delegate to perform walrus validation for account: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__AASignOutFlowController__delegate_performWalrusValidationForAccount_completion___block_invoke;
    block[3] = &unk_1E416E518;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AASignOutFlowController _delegate_performWalrusValidationForAccount:completion:].cold.1(self);

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4405);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

  }
}

void __82__AASignOutFlowController__delegate_performWalrusValidationForAccount_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__AASignOutFlowController__delegate_performWalrusValidationForAccount_completion___block_invoke_2;
  v5[3] = &unk_1E416EED0;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "signOutFlowController:performWalrusValidationForAccount:completion:", v3, v4, v5);

}

void __82__AASignOutFlowController__delegate_performWalrusValidationForAccount_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Delegate 'performWalrusValidationForAccount:completion' completed with success %@ and error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendTelemetryEventSignoutStart:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[AASignOutFlowController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AASignOutFlowController delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setTelemetryFlowID:](v7, "setTelemetryFlowID:", self->telemetryFlowID);
  }
  else
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AASignOutFlowController sendTelemetryEventSignoutStart:].cold.1(v7);
  }

  +[AAAnalyticsRTCReporter reporter](AAAnalyticsRTCReporter, "reporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CF0E68];
  objc_msgSend(v4, "aida_alternateDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "analyticsEventWithName:altDSID:flowID:", CFSTR("com.apple.appleaccount.signOutStart"), v10, self->telemetryFlowID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:", v11);

}

- (void)sendTelemetryEventSignoutFinish:(id)a3 account:(id)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  _BOOL8 v6;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v6 = a5;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a6;
  v10 = a3;
  objc_msgSend(v8, "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CF0EE0]);

  objc_msgSend(v10, "populateUnderlyingErrorsStartingWithRootError:", v9);
  +[AAAnalyticsRTCReporter reporter](AAAnalyticsRTCReporter, "reporter");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendEvent:", v10);

}

- (AASignOutFlowControllerDelegate)delegate
{
  return (AASignOutFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)initWithContext:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_19EACA000, a2, OS_LOG_TYPE_DEBUG, "Received nil telemetryFlowID from AIDAServiceContext, generated new telemetryFlowID %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19EACA000, log, OS_LOG_TYPE_FAULT, "AASignOutFlowController unexpectedly deallocated during signout", v1, 2u);
}

void __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_19EACA000, v0, v1, "AASignOutFlowController: Sign out preflight failed with error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_preflightSignOutOfAccount:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  const __CFString *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (+[AADeviceInfo hasiCloudSignOutRestriction](AADeviceInfo, "hasiCloudSignOutRestriction"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (objc_msgSend(a1, "aa_isRemotelyManaged"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "AASignOutFlowController: Sign out preflight failed - the device has sign out restriction(%@) or account is remotely managed(%@)", (uint8_t *)&v6, 0x16u);
}

- (void)_delegate_presentError:(void *)a1 withTitle:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_19EACA000, v2, v3, "AASignOutFlowController: Delegate (%@) does not respond to selector showAlertWithTitle:message:", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

void __60__AASignOutFlowController__delegate_presentError_withTitle___block_invoke_2_cold_1(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_19EACA000, a2, a3, "AASignOutFlowController: didShowAlert: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)_delegate_disableFindMyDeviceForAccount:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_19EACA000, v2, v3, "AASignOutFlowController: Delegate (%@) does not respond to selector disableFindMyDeviceForAccount.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

- (void)_delegate_signOutAccount:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_19EACA000, v2, v3, "AASignOutFlowController: Delegate (%@) does not respond to selector signOutAccount", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

- (void)_delegate_performWalrusValidationForAccount:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_19EACA000, v2, v3, "AASignOutFlowController: Delegate (%@) does not respond to selector 'performWalrusValidationForAccount:completion'", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10();
}

- (void)sendTelemetryEventSignoutStart:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19EACA000, log, OS_LOG_TYPE_DEBUG, "AASignOutFlowController's delegate does not respond to selector: telemetryFlowID", v1, 2u);
}

@end
