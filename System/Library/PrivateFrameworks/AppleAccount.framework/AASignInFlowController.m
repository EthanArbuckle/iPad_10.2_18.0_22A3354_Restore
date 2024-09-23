@implementation AASignInFlowController

- (AASignInFlowController)init
{
  void *v3;
  AASignInFlowController *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[AASignInFlowController initWithAccountStore:](self, "initWithAccountStore:", v3);

  return v4;
}

- (AASignInFlowController)initWithAccountStore:(id)a3
{
  id v5;
  AASignInFlowController *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *uiQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *utilityQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AASignInFlowController;
  v6 = -[AASignInFlowController init](&v14, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.AppleAccount.sign-in-flow-controller-ui", v7);
    uiQueue = v6->_uiQueue;
    v6->_uiQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("com.apple.AppleAccount.sign-in-flow-controller-utility", v8);
    utilityQueue = v6->_utilityQueue;
    v6->_utilityQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_accountStore, a3);
  }

  return v6;
}

- (void)signInWithIDMSAuthenticationResults:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  OS_dispatch_queue *uiQueue;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD block[5];
  id v16;
  id v17;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19EACA000, "appleaccount/signin-with-IDMSauthresults", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v7)
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[AASignInFlowController signInWithIDMSAuthenticationResults:completion:].cold.1();

  }
  uiQueue = self->_uiQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__AASignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke;
  block[3] = &unk_1E416E518;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  v11 = uiQueue;
  v12 = v7;
  v13 = v6;
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v11, v14);

  os_activity_scope_leave(&state);
}

uint64_t __73__AASignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_signInWithIDMSAuthenticationResults:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_registerAndVerifyLoginForiCloudAccount:(id)a3 authResults:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *uiQueue;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  uiQueue = self->_uiQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__AASignInFlowController__registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke;
  v17[3] = &unk_1E4170728;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = uiQueue;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v17);
  dispatch_async(v12, v16);

}

uint64_t __93__AASignInFlowController__registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_registerAndVerifyLoginForiCloudAccount:authResults:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_verifyLoginResponseForiCloudAccount:(id)a3 withAuthResults:(id)a4 withSuccess:(BOOL)a5 error:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  OS_dispatch_queue *uiQueue;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  dispatch_block_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  uiQueue = self->_uiQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __108__AASignInFlowController__verifyLoginResponseForiCloudAccount_withAuthResults_withSuccess_error_completion___block_invoke;
  v23[3] = &unk_1E4170750;
  v23[4] = self;
  v24 = v12;
  v28 = a5;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v17 = uiQueue;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v23);
  dispatch_async(v17, v22);

}

uint64_t __108__AASignInFlowController__verifyLoginResponseForiCloudAccount_withAuthResults_withSuccess_error_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_verifyLoginResponseForiCloudAccount:withAuthResults:withSuccess:error:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_validateAndEnrollCDPStateForAccount:(id)a3 withAuthResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *uiQueue;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  uiQueue = self->_uiQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__AASignInFlowController__validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke;
  v17[3] = &unk_1E4170728;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = uiQueue;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v17);
  dispatch_async(v12, v16);

}

uint64_t __90__AASignInFlowController__validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_validateAndEnrollCDPStateForAccount:withAuthResults:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_addKeysAndEnrollCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *uiQueue;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  uiQueue = self->_uiQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__AASignInFlowController__addKeysAndEnrollCDPStateForAccount_withCDPContext_completion___block_invoke;
  v17[3] = &unk_1E4170728;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = uiQueue;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v17);
  dispatch_async(v12, v16);

}

uint64_t __88__AASignInFlowController__addKeysAndEnrollCDPStateForAccount_withCDPContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_addKeysAndEnrollCDPStateForAccount:withCDPContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_enrollCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *uiQueue;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  uiQueue = self->_uiQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__AASignInFlowController__enrollCDPStateForAccount_withCDPContext_completion___block_invoke;
  v17[3] = &unk_1E4170728;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = uiQueue;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v17);
  dispatch_async(v12, v16);

}

uint64_t __78__AASignInFlowController__enrollCDPStateForAccount_withCDPContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_enrollCDPStateForAccount:withCDPContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_onqueue_signInWithIDMSAuthenticationResults:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double Nanoseconds;
  NSObject *v25;
  NSObject *v26;
  int v27;
  double v28;
  NSObject *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  _QWORD v51[5];
  id v52;
  os_signpost_id_t v53;
  uint64_t v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  _QWORD v59[5];
  id v60;
  id v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  uint8_t buf[4];
  os_signpost_id_t v67;
  __int16 v68;
  double v69;
  __int16 v70;
  int v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke;
  v64[3] = &unk_1E4170778;
  v49 = v8;
  v65 = v49;
  v48 = (void *)MEMORY[0x1A1AED7A0](v64);
  objc_storeStrong((id *)&self->_authResults, a3);
  _AASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = _AASignpostCreate(v9);
  v12 = v11;

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "GetLocalAppleAccount", " enableTelemetry=YES ", buf, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v67 = v10;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GetLocalAppleAccount  enableTelemetry=YES ", buf, 0xCu);
  }

  v63 = 0;
  -[AASignInFlowController _onqueue_updateOrCreateAppleAccountForAuthResults:accountCreationError:](self, "_onqueue_updateOrCreateAppleAccountForAuthResults:accountCreationError:", v7, &v63);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v63;
  v17 = v16;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "code"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  -[AASignInFlowController telemetryTimeSeries](self, "telemetryTimeSeries");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "GetLocalAppleAccount", "errorCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

  if (v17)
  objc_msgSend(v17, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AASignInFlowController telemetryTimeSeries](self, "telemetryTimeSeries");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "GetLocalAppleAccount", "errorDomain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

  Nanoseconds = (double)_AASignpostGetNanoseconds(v10, v12);
  _AASignpostLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    v27 = objc_msgSend(v17, "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v67) = v27;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v26, OS_SIGNPOST_INTERVAL_END, v10, "GetLocalAppleAccount", " Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 8u);
  }
  v28 = Nanoseconds / 1000000000.0;

  _AASignpostLogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = objc_msgSend(v17, "code");
    *(_DWORD *)buf = 134218496;
    v67 = v10;
    v68 = 2048;
    v69 = v28;
    v70 = 1026;
    v71 = v30;
    _os_log_impl(&dword_19EACA000, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:GetLocalAppleAccount  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x1Cu);
  }

  -[AASignInFlowController telemetryTimeSeries](self, "telemetryTimeSeries");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("GetLocalAppleAccount"));

  if (v17)
  {
    -[AASignInFlowController _delegate_presentAccountCreationError:completion:](self, "_delegate_presentAccountCreationError:completion:", v17, v48);
  }
  else
  {
    v33 = MEMORY[0x1E0C809B0];
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_28;
    v59[3] = &unk_1E41707C8;
    v62 = v48;
    v59[4] = self;
    v34 = v7;
    v60 = v34;
    v35 = v50;
    v61 = v35;
    v36 = (void *)MEMORY[0x1A1AED7A0](v59);
    v55[0] = v33;
    v55[1] = 3221225472;
    v55[2] = __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_35;
    v55[3] = &unk_1E4170728;
    v55[4] = self;
    v37 = v35;
    v56 = v37;
    v57 = v34;
    v58 = v36;
    v38 = v36;
    v39 = (void *)MEMORY[0x1A1AED7A0](v55);
    _AASignpostLogSystem();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = _AASignpostCreate(v40);
    v43 = v42;

    _AASignpostLogSystem();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19EACA000, v45, OS_SIGNPOST_INTERVAL_BEGIN, v41, "SignInPresentProgressView", " enableTelemetry=YES ", buf, 2u);
    }

    _AASignpostLogSystem();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v67 = v41;
      _os_log_impl(&dword_19EACA000, v46, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInPresentProgressView  enableTelemetry=YES ", buf, 0xCu);
    }

    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_36;
    v51[3] = &unk_1E41707F0;
    v53 = v41;
    v54 = v43;
    v51[4] = self;
    v52 = v39;
    v47 = v39;
    -[AASignInFlowController _delegate_presentProgressViewForAccount:completion:](self, "_delegate_presentProgressViewForAccount:completion:", v37, v51);

  }
}

uint64_t __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_28(uint64_t a1, char a2, void *a3, void *a4)
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
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  os_signpost_id_t v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  os_signpost_id_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_stashLoginResponseWithAuthenticationResults:appleAccount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Successfully authenticated account, attempting to enable FindMy if possible...", buf, 2u);
    }

    _AASignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = _AASignpostCreate(v10);
    v13 = v12;

    _AASignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19EACA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SignInEnableFindMy", " enableTelemetry=YES ", buf, 2u);
    }

    _AASignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v11;
      _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInEnableFindMy  enableTelemetry=YES ", buf, 0xCu);
    }

    v17 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_29;
    v19[3] = &unk_1E41707A0;
    v19[4] = v17;
    v23 = v11;
    v24 = v13;
    v18 = *(_QWORD *)(a1 + 48);
    v22 = *(id *)(a1 + 56);
    v25 = a2;
    v20 = v7;
    v21 = v8;
    objc_msgSend(v17, "_enableFindMyIfPossibleWithAccount:completion:", v18, v19);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_29(uint64_t a1, uint64_t a2)
{
  int v2;
  void *v4;
  void *v5;
  void *v6;
  double Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v2 = a2;
  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInEnableFindMy", "didEnable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  Nanoseconds = (double)_AASignpostGetNanoseconds(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  _AASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v18) = v2;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SignInEnableFindMy", " DidEnable=%{public,signpost.telemetry:number1,name=DidEnable}d ", buf, 8u);
  }
  v11 = Nanoseconds / 1000000000.0;

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134218496;
    v18 = v13;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v2;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInEnableFindMy  DidEnable=%{public,signpost.telemetry:number1,name=DidEnable}d ", buf, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("SignInEnableFindMy"));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_35(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_termsAreRequired");
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  if (v2)
    return objc_msgSend(v3, "_delegate_presentGenericTermsUIforAccount:authResults:serverError:completion:", v4, v5, 0, *(_QWORD *)(a1 + 56));
  else
    return objc_msgSend(v3, "_registerAndVerifyLoginForiCloudAccount:authResults:withCompletion:", v4, v5, *(_QWORD *)(a1 + 56));
}

uint64_t __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_36(uint64_t a1, uint64_t a2)
{
  int v2;
  void *v4;
  void *v5;
  void *v6;
  double Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v2 = a2;
  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInPresentProgressView", "didPresent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  Nanoseconds = (double)_AASignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _AASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v19) = v2;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SignInPresentProgressView", " DidPresent=%{public,signpost.telemetry:number1,name=DidPresent}d ", buf, 8u);
  }
  v11 = Nanoseconds / 1000000000.0;

  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218496;
    v19 = v13;
    v20 = 2048;
    v21 = v11;
    v22 = 1026;
    v23 = v2;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInPresentProgressView  DidPresent=%{public,signpost.telemetry:number1,name=DidPresent}d ", buf, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("SignInPresentProgressView"));

  _AALogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_36_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_onqueue_updateOrCreateAppleAccountForAuthResults:(id)a3 accountCreationError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (-[ACAccountStore aa_appleAccountWithPersonID:](self->_accountStore, "aa_appleAccountWithPersonID:", v8),
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    self->_existingAccount = 1;
    -[AASignInFlowController _onqueue_prepareExistingAppleAccountForSignIn:withAuthResults:accountCreationError:](self, "_onqueue_prepareExistingAppleAccountForSignIn:withAuthResults:accountCreationError:", v9, v6, a4);
    if (!a4)
      goto LABEL_8;
  }
  else
  {
    -[AASignInFlowController _onqueue_createNewAppleAccountWithAuthResults:accountCreationError:](self, "_onqueue_createNewAppleAccountWithAuthResults:accountCreationError:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
    {
LABEL_8:
      -[AASignInFlowController _onqueue_updateAppleAccount:withAuthenticationResults:](self, "_onqueue_updateAppleAccount:withAuthenticationResults:", v10, v6);
      v11 = v10;
      goto LABEL_9;
    }
  }
  if (!*a4)
    goto LABEL_8;
  v11 = 0;
LABEL_9:

  return v11;
}

- (void)_onqueue_prepareExistingAppleAccountForSignIn:(id)a3 withAuthResults:(id)a4 accountCreationError:(id *)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = *MEMORY[0x1E0CFFF40];
  v10 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AASignInFlowController _onqueue_updateAppleAccountIfNecessary:withAltDSID:rawPassword:](self, "_onqueue_updateAppleAccountIfNecessary:withAltDSID:rawPassword:", v8, v11, v12);
  -[AASignInFlowController _onqueue_saveTermsWithAuthResults:account:](self, "_onqueue_saveTermsWithAuthResults:account:", v10, v8);

  _AALogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "aa_altDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    v23 = v15;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: found an existing account with altDSID: %@", (uint8_t *)&v22, 0xCu);

  }
  -[AASignInFlowController _userPersonaUniqueString](self, "_userPersonaUniqueString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "aa_altDSID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v18;
      _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: found an existing account with altDSID %@, but we're running in the enterprise persona.", (uint8_t *)&v22, 0xCu);

    }
    if (!objc_msgSend(v8, "isDataSeparatedAccount"))
      goto LABEL_18;
LABEL_9:
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[AASignInFlowController _onqueue_prepareExistingAppleAccountForSignIn:withAuthResults:accountCreationError:].cold.1();

    if (a5)
    {
      -[AASignInFlowController _aaErrorForErrorCode:](self, "_aaErrorForErrorCode:", -8012);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_18;
  }
  if ((objc_msgSend(v8, "isDataSeparatedAccount") & 1) != 0)
    goto LABEL_9;
  if (!v13 && objc_msgSend(v8, "aa_isAccountClass:", CFSTR("basic")))
  {
    _AALogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v8;
      _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: promoting existing account %@ to primary", (uint8_t *)&v22, 0xCu);
    }

    objc_msgSend(v8, "aa_setAccountClass:", CFSTR("primary"));
    -[AASignInFlowController _nameForCloudService](self, "_nameForCloudService");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccountDescription:", v21);

  }
LABEL_18:

}

- (id)_onqueue_createNewAppleAccountWithAuthResults:(id)a3 accountCreationError:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  char v24;
  void *v25;
  void *v26;
  NSObject *v27;
  __CFString **v28;
  void *v29;
  void *v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFC8]);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFB0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v6;
    _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: will sign in a new iCloud Account for %@", buf, 0xCu);
  }

  v10 = objc_alloc(MEMORY[0x1E0C8F298]);
  -[ACAccountStore aa_appleAccountType](self->_accountStore, "aa_appleAccountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithAccountType:", v11);

  v33 = (void *)v6;
  objc_msgSend(v12, "setUsername:", v6);
  v13 = (void *)v8;
  objc_msgSend(v12, "_aa_setPersonID:", v8);
  -[AASignInFlowController _userPersonaUniqueString](self, "_userPersonaUniqueString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[AAPreferences isMultipleFullAccountsEnabled](AAPreferences, "isMultipleFullAccountsEnabled");
  -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACAccountStore aa_dataSeparatedAccounts](self->_accountStore, "aa_dataSeparatedAccounts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
    v19 = v15;
  else
    v19 = 1;
  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = CFSTR("NO");
    if (v15)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    if (v18)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v35 = (uint64_t)v22;
    v36 = 2112;
    v37 = v23;
    if (!v19)
      v21 = CFSTR("YES");
    v38 = 2112;
    v39 = v21;
    _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: multiple full accounts allowed: %@, already have data separated account: %@, disallow multiple full accounts: %@", buf, 0x20u);
  }

  if (v14)
    v24 = v19;
  else
    v24 = 1;
  if ((v24 & 1) != 0)
  {
    v25 = v13;
    if (v14)
    {
      v26 = v33;
      objc_msgSend(v12, "setAccountDescription:", v33);
      objc_msgSend(v12, "aa_setAccountClass:", CFSTR("full"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C8EFC8]);
    }
    else
    {
      v26 = v33;
      if (v16)
      {
        objc_msgSend(v12, "setAccountDescription:", v33);
        if (v15)
          v28 = AAAccountClassFull;
        else
          v28 = AAAccountClassBasic;
      }
      else
      {
        -[AASignInFlowController _nameForCloudService](self, "_nameForCloudService");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAccountDescription:", v29);

        v28 = AAAccountClassPrimary;
      }
      objc_msgSend(v12, "aa_setAccountClass:", *v28);
    }
  }
  else
  {
    _AALogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    v25 = v13;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[AASignInFlowController _onqueue_createNewAppleAccountWithAuthResults:accountCreationError:].cold.1();

    v26 = v33;
    if (a4)
    {
      -[AASignInFlowController _aaErrorForErrorCode:](self, "_aaErrorForErrorCode:", -8013);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  -[AASignInFlowController _onqueue_saveTermsWithAuthResults:account:](self, "_onqueue_saveTermsWithAuthResults:account:", v5, v12);

  return v12;
}

- (void)_onqueue_updateAppleAccount:(id)a3 withAuthenticationResults:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF40]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFB0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8F2B0], "credentialWithPassword:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCredential:", v11);
  objc_msgSend(v5, "_aa_setRawPassword:", v8);
  objc_msgSend(v5, "_aa_setAltDSID:", v9);
  objc_msgSend(v5, "aa_firstName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF68]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    objc_msgSend(v5, "aa_setFirstName:", v14);
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[AASignInFlowController _onqueue_updateAppleAccount:withAuthenticationResults:].cold.2();

  }
  objc_msgSend(v5, "aa_lastName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF90]);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    objc_msgSend(v5, "aa_setLastName:", v18);
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[AASignInFlowController _onqueue_updateAppleAccount:withAuthenticationResults:].cold.1();

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appProvidedContext"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    _AALogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appProvidedContext"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v22;
      _os_log_impl(&dword_19EACA000, v21, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: AuthContext contains AppProvidedContext: %@", (uint8_t *)&v24, 0xCu);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appProvidedContext"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_aa_setAppProvidedContext:", v23);

  }
}

- (void)_onqueue_updateAppleAccountIfNecessary:(id)a3 withAltDSID:(id)a4 rawPassword:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v8;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "Checking to see if we should update altDSID on iCloud account %@", (uint8_t *)&v17, 0xCu);
  }

  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v8, "aa_altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "iCloud account already has altDSID, ignoring...", (uint8_t *)&v17, 2u);
      }

    }
    else
    {
      if (v15)
      {
        v17 = 138412290;
        v18 = v9;
        _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "Updating iCloud account with altDSID: %@", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(v8, "_aa_setRawPassword:", v10);
      objc_msgSend(v8, "_aa_setAltDSID:", v9);
      -[ACAccountStore saveVerifiedAccount:withCompletionHandler:](self->_accountStore, "saveVerifiedAccount:withCompletionHandler:", v8, 0);
    }
  }
  else
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "No altDSID provided, nothing to do...", (uint8_t *)&v17, 2u);
    }

  }
}

- (void)_onqueue_saveTermsWithAuthResults:(id)a3 account:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF38]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AASignInFlowController _onqueue_saveTermsWithAuthResults:account:].cold.1();

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "saveTermsAcceptance:forAccount:", v6, v5);

  }
}

- (void)_cacheLoginResponse:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  AADaemonController *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  os_signpost_id_t v22;
  uint64_t v23;
  uint8_t buf[4];
  os_signpost_id_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _AASignpostCreate(v11);
  v14 = v13;

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SignInCacheLoginResponse", " enableTelemetry=YES ", buf, 2u);
  }

  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = v12;
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInCacheLoginResponse  enableTelemetry=YES ", buf, 0xCu);
  }

  v18 = objc_alloc_init(AADaemonController);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __68__AASignInFlowController__cacheLoginResponse_forAccount_completion___block_invoke;
  v20[3] = &unk_1E4170818;
  v22 = v12;
  v23 = v14;
  v20[4] = self;
  v21 = v8;
  v19 = v8;
  -[AADaemonController cacheLoginResponse:forAccount:completion:](v18, "cacheLoginResponse:forAccount:completion:", v10, v9, v20);

}

void __68__AASignInFlowController__cacheLoginResponse_forAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double Nanoseconds;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "code"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInCacheLoginResponse", "errorCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  if (v4)
  objc_msgSend(v4, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInCacheLoginResponse", "errorDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  Nanoseconds = (double)_AASignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 48);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v23) = objc_msgSend(v4, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v13, OS_SIGNPOST_INTERVAL_END, v14, "SignInCacheLoginResponse", " Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 8u);
  }
  v15 = Nanoseconds / 1000000000.0;

  _AASignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 48);
    v18 = objc_msgSend(v4, "code");
    *(_DWORD *)buf = 134218496;
    v23 = v17;
    v24 = 2048;
    v25 = v15;
    v26 = 1026;
    v27 = v18;
    _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInCacheLoginResponse  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("SignInCacheLoginResponse"));

  v21 = *(_QWORD *)(a1 + 40);
  if (v21)
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v4);

}

- (void)_onqueue_registerAndVerifyLoginForiCloudAccount:(id)a3 authResults:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[AAPreferences shouldUseUnifiedLoginEndpoint](AAPreferences, "shouldUseUnifiedLoginEndpoint"))
  {
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke;
    v20[3] = &unk_1E4170868;
    v20[4] = self;
    v12 = v8;
    v21 = v12;
    v13 = (void *)MEMORY[0x1A1AED7A0](v20);
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_56;
    v16[3] = &unk_1E41708B8;
    v16[4] = self;
    v17 = v9;
    v18 = v13;
    v19 = v10;
    v14 = v13;
    -[AASignInFlowController _loginAndUpdateiCloudWithAuthResults:iCloudAccount:withCompletion:](self, "_loginAndUpdateiCloudWithAuthResults:iCloudAccount:withCompletion:", v17, v12, v16);

  }
  else
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "[Warning] Using legacy non-unified login endpoint path for sign in (not expected)", buf, 2u);
    }

    -[AASignInFlowController _onqueue_legacyRegisterAndVerifyLoginForiCloudAccount:authResults:withCompletion:](self, "_onqueue_legacyRegisterAndVerifyLoginForiCloudAccount:authResults:withCompletion:", v8, v9, v10);
  }

}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  void (**v13)(_QWORD);

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_54;
    v10[3] = &unk_1E4170840;
    v11 = v5;
    v12 = *(id *)(a1 + 40);
    v13 = v6;
    objc_msgSend(v7, "_cacheLoginResponse:forAccount:completion:", v11, v8, v10);

  }
  else
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_cold_1();

    v6[2](v6);
  }

}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_54(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_54_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "Successfully cached login response (%@) for account (%@)", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_56(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "aa_isAARecoverableError"))
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "LoginAndUpdateiCloudAccount failed with recoverable error, retrying once...", buf, 2u);
    }

    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_57;
    v26[3] = &unk_1E4170890;
    v15 = *(id *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v28 = v15;
    v26[4] = v16;
    v27 = v17;
    v29 = *(id *)(a1 + 56);
    objc_msgSend(v13, "_loginAndUpdateiCloudWithAuthResults:iCloudAccount:withCompletion:", v14, v9, v26);

    v18 = v28;
  }
  else
  {
    v19 = *(_QWORD *)(a1 + 48);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_2;
    v20[3] = &unk_1E4170750;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v9;
    v22 = *(id *)(a1 + 40);
    v25 = a2;
    v23 = v10;
    v24 = *(id *)(a1 + 56);
    (*(void (**)(uint64_t, id, _QWORD *))(v19 + 16))(v19, v11, v20);

    v18 = v21;
  }

}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_57(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void (*v15)(uint64_t, id, _QWORD *);
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_57_cold_1();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_58;
  v18[3] = &unk_1E4170750;
  v13 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 48);
  v18[4] = *(_QWORD *)(a1 + 32);
  v19 = v9;
  v23 = a2;
  v20 = v13;
  v21 = v10;
  v22 = *(id *)(a1 + 56);
  v15 = *(void (**)(uint64_t, id, _QWORD *))(v14 + 16);
  v16 = v10;
  v17 = v9;
  v15(v14, v11, v18);

}

uint64_t __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_verifyLoginResponseForiCloudAccount:withAuthResults:withSuccess:error:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_verifyLoginResponseForiCloudAccount:withAuthResults:withSuccess:error:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_loginAndUpdateiCloudWithAuthResults:(id)a3 iCloudAccount:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ACAccountStore *accountStore;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  os_signpost_id_t v31;
  uint64_t v32;
  uint8_t buf[4];
  os_signpost_id_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _AASignpostCreate(v11);
  v14 = v13;

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "LoginAndUpdateAccount", " enableTelemetry=YES ", buf, 2u);
  }

  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = v12;
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: LoginAndUpdateAccount  enableTelemetry=YES ", buf, 0xCu);
  }

  v18 = (void *)MEMORY[0x1E0CF0E68];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF40]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFB8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "analyticsEventWithName:altDSID:flowID:", CFSTR("com.apple.appleaccount.iCloudAuthLoginAndUpdate"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  +[AAiCloudLoginAccountRequester delegateParamsForAllDelegates](AAiCloudLoginAccountRequester, "delegateParamsForAllDelegates");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  accountStore = self->_accountStore;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __92__AASignInFlowController__loginAndUpdateiCloudWithAuthResults_iCloudAccount_withCompletion___block_invoke;
  v27[3] = &unk_1E41708E0;
  v31 = v12;
  v32 = v14;
  v27[4] = self;
  v28 = v21;
  v29 = v8;
  v30 = v9;
  v24 = v9;
  v25 = v8;
  v26 = v21;
  -[ACAccountStore aa_loginAndUpdateiCloudAccount:delegateParams:withCompletion:](accountStore, "aa_loginAndUpdateiCloudAccount:delegateParams:withCompletion:", v25, v22, v27);

}

void __92__AASignInFlowController__loginAndUpdateiCloudWithAuthResults_iCloudAccount_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double Nanoseconds;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  double v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  _BYTE v31[10];
  double v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "LoginAndUpdateAccount", "errorCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  if (v9)
  objc_msgSend(v9, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "LoginAndUpdateAccount", "errorDomain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

  Nanoseconds = (double)_AASignpostGetNanoseconds(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 64);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v31 = a2;
    *(_WORD *)&v31[4] = 1026;
    *(_DWORD *)&v31[6] = objc_msgSend(v9, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v18, OS_SIGNPOST_INTERVAL_END, v19, "LoginAndUpdateAccount", " Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }
  v20 = Nanoseconds / 1000000000.0;

  _AASignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 64);
    v23 = objc_msgSend(v9, "code");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v31 = v22;
    *(_WORD *)&v31[8] = 2048;
    v32 = v20;
    v33 = 1026;
    v34 = a2;
    v35 = 1026;
    v36 = v23;
    _os_log_impl(&dword_19EACA000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:LoginAndUpdateAccount  Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("LoginAndUpdateAccount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CF0EE0]);

  objc_msgSend(*(id *)(a1 + 40), "populateUnderlyingErrorsStartingWithRootError:", v9);
  +[AAAnalyticsRTCReporter reporter](AAAnalyticsRTCReporter, "reporter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sendEvent:", *(_QWORD *)(a1 + 40));

  objc_msgSend(v7, "responseDictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("serverInfo"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_aa_setTermsServerInfo:", v29);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_onqueue_legacyRegisterAndVerifyLoginForiCloudAccount:(id)a3 authResults:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  ACAccountStore *accountStore;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  uint8_t buf[4];
  os_signpost_id_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _AASignpostCreate(v11);
  v14 = v13;

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SignInRegisterAccount", " enableTelemetry=YES ", buf, 2u);
  }

  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v29 = v12;
    _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInRegisterAccount  enableTelemetry=YES ", buf, 0xCu);
  }

  accountStore = self->_accountStore;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __107__AASignInFlowController__onqueue_legacyRegisterAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke;
  v22[3] = &unk_1E4170908;
  v26 = v12;
  v27 = v14;
  v22[4] = self;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  v19 = v10;
  v20 = v9;
  v21 = v8;
  -[ACAccountStore aa_registerAppleAccount:withCompletion:](accountStore, "aa_registerAppleAccount:withCompletion:", v21, v22);

}

void __107__AASignInFlowController__onqueue_legacyRegisterAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double Nanoseconds;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  _BYTE v24[10];
  double v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInRegisterAccount", "errorCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  if (v6)
  objc_msgSend(v6, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInRegisterAccount", "errorDomain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  Nanoseconds = (double)_AASignpostGetNanoseconds(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 64);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v24 = a2;
    *(_WORD *)&v24[4] = 1026;
    *(_DWORD *)&v24[6] = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v15, OS_SIGNPOST_INTERVAL_END, v16, "SignInRegisterAccount", " Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }
  v17 = Nanoseconds / 1000000000.0;

  _AASignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 64);
    v20 = objc_msgSend(v6, "code");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v24 = v19;
    *(_WORD *)&v24[8] = 2048;
    v25 = v17;
    v26 = 1026;
    v27 = a2;
    v28 = 1026;
    v29 = v20;
    _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInRegisterAccount  Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("SignInRegisterAccount"));

  objc_msgSend(*(id *)(a1 + 32), "_verifyLoginResponseForiCloudAccount:withAuthResults:withSuccess:error:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, v6, *(_QWORD *)(a1 + 56));
}

- (void)_onqueue_verifyLoginResponseForiCloudAccount:(id)a3 withAuthResults:(id)a4 withSuccess:(BOOL)a5 error:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  int v27;
  _BOOL4 v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (a5)
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Account is valid: finish account setup", buf, 2u);
    }

    objc_msgSend(v12, "aa_password");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      _AALogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, "We have a password, setAuthenticated to NO and grab delegate tokens", buf, 2u);
      }

      objc_msgSend(v12, "setAuthenticated:", 0);
    }
    -[AASignInFlowController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AASignInFlowController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "skipCDPEnablement");

      if (v21)
      {
        _AALogSystem();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "aa_altDSID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 141558274;
          v39 = 1752392040;
          v40 = 2112;
          v41 = v23;
          _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Skipping iCDP state machine for %{mask.hash}@ because delegate said to.", buf, 0x16u);

        }
LABEL_27:

        _AALogSystem();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19EACA000, v32, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Finished auth'ing account and skipping iCDP state validation.", buf, 2u);
        }

        -[AASignInFlowController _onqueue_saveAccount:withAuthResults:withCDPEnablement:withAllDataclassesEnabledIfPossibleWithCompletion:](self, "_onqueue_saveAccount:withAuthResults:withCDPEnablement:withAllDataclassesEnabledIfPossibleWithCompletion:", v12, v13, 0, v15);
        goto LABEL_30;
      }
    }
    else
    {

    }
    v27 = objc_msgSend(v12, "aa_isAccountClass:", CFSTR("primary"));
    _AALogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (!v27)
    {
      if (v28)
      {
        objc_msgSend(v12, "aa_altDSID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558274;
        v39 = 1752392040;
        v40 = 2112;
        v41 = v31;
        _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Account for %{mask.hash}@ is secondary and MultiUserManatee is off, no iCDP setup will be attempted.", buf, 0x16u);

      }
      goto LABEL_27;
    }
    if (v28)
    {
      objc_msgSend(v12, "aa_altDSID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 141558274;
      v39 = 1752392040;
      v40 = 2112;
      v41 = v29;
      _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Account for %{mask.hash}@ is primary, proceeding with iCDP setup.", buf, 0x16u);

    }
    _AALogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v30, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Finished auth'ing account and must validate iCDP state.", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __116__AASignInFlowController__onqueue_verifyLoginResponseForiCloudAccount_withAuthResults_withSuccess_error_completion___block_invoke;
    v33[3] = &unk_1E4170930;
    v34 = v12;
    objc_copyWeak(&v37, (id *)buf);
    v35 = v13;
    v36 = v15;
    -[AASignInFlowController _onqueue_validateAndEnrollCDPStateForAccount:withAuthResults:completion:](self, "_onqueue_validateAndEnrollCDPStateForAccount:withAuthResults:completion:", v34, v35, v33);

    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend(v14, "userInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", CFSTR("localizedError"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    _AALogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = (uint64_t)v25;
      _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "Account is not valid: handling error %@", buf, 0xCu);
    }

    if (objc_msgSend(v25, "isEqualToString:", CFSTR("MOBILEME_TERMS_OF_SERVICE_UPDATE")))
      -[AASignInFlowController _delegate_presentGenericTermsUIforAccount:authResults:serverError:completion:](self, "_delegate_presentGenericTermsUIforAccount:authResults:serverError:completion:", v12, v13, v14, v15);
    else
      -[AASignInFlowController _delegate_presentValidationAlertForError:forAccount:completion:](self, "_delegate_presentValidationAlertForError:forAccount:completion:", v14, v12, v15);

  }
LABEL_30:

}

void __116__AASignInFlowController__onqueue_verifyLoginResponseForiCloudAccount_withAuthResults_withSuccess_error_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *WeakRetained;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[16];

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "refresh");
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Validating iCDP succeeded! Proceeding with iCloud sign-in...", v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_saveAccount:withAuthResults:withCDPEnablement:withAllDataclassesEnabledIfPossibleWithCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
    goto LABEL_12;
  }
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __116__AASignInFlowController__onqueue_verifyLoginResponseForiCloudAccount_withAuthResults_withSuccess_error_completion___block_invoke_cold_1();

  if (objc_msgSend(v5, "shouldDisplayToUser"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_delegate_presentValidationAlertForError:forAccount:completion:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
LABEL_12:

    goto LABEL_13;
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -3);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, WeakRetained);
    goto LABEL_12;
  }
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v9 + 16))(v9, 0, 0, v5);
LABEL_13:

}

- (void)_onqueue_validateAndEnrollCDPStateForAccount:(id)a3 withAuthResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v12 = v11;
  if (self->_shouldAutomaticallySaveSignInResults)
  {
    if (self->_existingAccount)
    {
      _AALogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "Skipping warmup flag as account already exists.", buf, 2u);
      }

    }
    else
    {
      objc_msgSend(v11, "setWarmingUp:", 1);
    }
    v14 = v12;
  }
  else
  {
    -[ACAccountStore setNotificationsEnabled:](self->_accountStore, "setNotificationsEnabled:", 0);
    v14 = (void *)objc_msgSend(v12, "copy");

  }
  objc_msgSend(v14, "setEnabled:forDataclass:", 1, *MEMORY[0x1E0C8F3C0]);
  v15 = *MEMORY[0x1E0C8F3C8];
  if (objc_msgSend(v14, "isProvisionedForDataclass:", *MEMORY[0x1E0C8F3C8])
    && (objc_msgSend(v14, "aa_serverDisabledDataclass:", v15) & 1) == 0)
  {
    objc_msgSend(v14, "setEnabled:forDataclass:", 1, v15);
  }
  objc_msgSend(v14, "setEnabled:forDataclass:", 1, *MEMORY[0x1E0C8F398]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __98__AASignInFlowController__onqueue_validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke;
  v19[3] = &unk_1E4170958;
  v19[4] = self;
  v20 = v9;
  v21 = v14;
  v22 = v10;
  v16 = v10;
  v17 = v14;
  v18 = v9;
  -[AASignInFlowController _preflightSaveWithAuthResults:account:withCompletion:](self, "_preflightSaveWithAuthResults:account:withCompletion:", v18, v17, v19);

}

void __98__AASignInFlowController__onqueue_validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  if ((objc_msgSend(v4, "aa_isAARecoverableError") & 1) != 0 || objc_msgSend(v4, "aa_isXPCError"))
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "PreflightSave failed with recoverable / xpc error, retrying once...", buf, 2u);
    }

    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __98__AASignInFlowController__onqueue_validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke_76;
    v9[3] = &unk_1E416EED0;
    v8 = *(_QWORD *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v6, "_preflightSaveWithAuthResults:account:withCompletion:", v7, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __98__AASignInFlowController__onqueue_validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke_76(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __98__AASignInFlowController__onqueue_validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke_76_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_preflightSaveWithAuthResults:(id)a3 account:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ACAccountStore *accountStore;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  os_signpost_id_t v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  os_signpost_id_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __79__AASignInFlowController__preflightSaveWithAuthResults_account_withCompletion___block_invoke;
  v36[3] = &unk_1E416F2E8;
  v36[4] = self;
  v37 = v10;
  v28 = v10;
  v11 = (void *)MEMORY[0x1A1AED7A0](v36);
  _AASignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = _AASignpostCreate(v12);
  v15 = v14;

  _AASignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SignInPreflightSave", " enableTelemetry=YES ", buf, 2u);
  }

  _AASignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v39 = v13;
    _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInPreflightSave  enableTelemetry=YES ", buf, 0xCu);
  }

  v19 = (void *)MEMORY[0x1E0CF0E68];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF40]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFB8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "analyticsEventWithName:altDSID:flowID:", CFSTR("com.apple.appleaccount.iCloudAuthPreflightSave"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  accountStore = self->_accountStore;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __79__AASignInFlowController__preflightSaveWithAuthResults_account_withCompletion___block_invoke_77;
  v29[3] = &unk_1E4170980;
  v34 = v13;
  v35 = v15;
  v29[4] = self;
  v30 = v22;
  v32 = v9;
  v33 = v11;
  v31 = v8;
  v24 = v9;
  v25 = v8;
  v26 = v11;
  v27 = v22;
  -[ACAccountStore saveAccount:withCompletionHandler:](accountStore, "saveAccount:withCompletionHandler:", v24, v29);

}

void __79__AASignInFlowController__preflightSaveWithAuthResults_account_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a3;
  objc_msgSend(v4, "setNotificationsEnabled:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __79__AASignInFlowController__preflightSaveWithAuthResults_account_withCompletion___block_invoke_77(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double Nanoseconds;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  _BYTE v31[10];
  double v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInPreflightSave", "errorCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  if (v6)
  objc_msgSend(v6, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInPreflightSave", "errorDomain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  Nanoseconds = (double)_AASignpostGetNanoseconds(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  _AASignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 72);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v31 = a2;
    *(_WORD *)&v31[4] = 1026;
    *(_DWORD *)&v31[6] = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v15, OS_SIGNPOST_INTERVAL_END, v16, "SignInPreflightSave", " DidSave=%{public,signpost.telemetry:number1,name=DidSave}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }
  v17 = Nanoseconds / 1000000000.0;

  _AASignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 72);
    v20 = objc_msgSend(v6, "code");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v31 = v19;
    *(_WORD *)&v31[8] = 2048;
    v32 = v17;
    v33 = 1026;
    v34 = a2;
    v35 = 1026;
    v36 = v20;
    _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInPreflightSave  DidSave=%{public,signpost.telemetry:number1,name=DidSave}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("SignInPreflightSave"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CF0EE0]);

  objc_msgSend(*(id *)(a1 + 40), "populateUnderlyingErrorsStartingWithRootError:", v6);
  +[AAAnalyticsRTCReporter reporter](AAAnalyticsRTCReporter, "reporter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendEvent:", *(_QWORD *)(a1 + 40));

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_createCDPContextWithAuthResults:", *(_QWORD *)(a1 + 48));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(*(id *)(a1 + 32), "_addKeysAndEnrollCDPStateForAccount:withCDPContext:completion:", *(_QWORD *)(a1 + 56), v25, *(_QWORD *)(a1 + 64));
    }
    else
    {
      _AALogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __79__AASignInFlowController__preflightSaveWithAuthResults_account_withCompletion___block_invoke_77_cold_1();

      v28 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 32), "_aaErrorForErrorCode:", -17);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v28 + 16))(v28, 0, v29);

    }
  }
  else
  {
    _AALogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v31 = v6;
      _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "iCDP preflighting failed because we could not save the iCloud account! Error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (void)_onqueue_addKeysAndEnrollCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  AACustodianController *v14;
  _QWORD v15[4];
  id v16;
  AASignInFlowController *v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AASignInFlowController _onqueue_addKeysAndEnrollCDPStateForAccount:withCDPContext:completion:].cold.1((uint64_t)self, v11);

  -[NSDictionary valueForKey:](self->_authResults, "valueForKey:", *MEMORY[0x1E0CFFF48]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    _AALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "Looks to be a login from custodian recovery flows. Fetching recovery keys for CDP flows", buf, 2u);
    }

    v14 = objc_alloc_init(AACustodianController);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __96__AASignInFlowController__onqueue_addKeysAndEnrollCDPStateForAccount_withCDPContext_completion___block_invoke;
    v15[3] = &unk_1E41709A8;
    v16 = v9;
    v17 = self;
    v18 = v8;
    v19 = v10;
    -[AACustodianController fetchCustodianRecoveryKeysWithSessionID:completion:](v14, "fetchCustodianRecoveryKeysWithSessionID:completion:", v12, v15);

  }
  else
  {
    -[AASignInFlowController _onqueue_enrollCDPStateForAccount:withCDPContext:completion:](self, "_onqueue_enrollCDPStateForAccount:withCDPContext:completion:", v8, v9, v10);
  }

}

void __96__AASignInFlowController__onqueue_addKeysAndEnrollCDPStateForAccount_withCDPContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_msgSend(getCDPCustodianRecoveryInfoClass(), "instancesRespondToSelector:", sel_recordBuildVersion);
    v8 = objc_alloc((Class)getCDPCustodianRecoveryInfoClass());
    objc_msgSend(v5, "wrappedRKC");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wrappingKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "custodianUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "recordBuildVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v8, "initWithWrappedRKC:wrappingKey:custodianUUID:recordBuildVersion:", v9, v10, v11, v12);

    }
    else
    {
      v13 = (void *)objc_msgSend(v8, "initWithWrappedRKC:wrappingKey:custodianUUID:", v9, v10, v11);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCustodianRecoveryInfo:", v13);
  }
  else
  {
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __96__AASignInFlowController__onqueue_addKeysAndEnrollCDPStateForAccount_withCDPContext_completion___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 40), "_enrollCDPStateForAccount:withCDPContext:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

}

- (void)_onqueue_enrollCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  id WeakRetained;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  os_signpost_id_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 buf;
  Class (*v41)(uint64_t);
  void *v42;
  uint64_t *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v11 = (void *)getCDPStateControllerClass_softClass;
  v39 = getCDPStateControllerClass_softClass;
  v12 = MEMORY[0x1E0C809B0];
  if (!getCDPStateControllerClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v41 = __getCDPStateControllerClass_block_invoke;
    v42 = &unk_1E416F0A0;
    v43 = &v36;
    __getCDPStateControllerClass_block_invoke((uint64_t)&buf);
    v11 = (void *)v37[3];
  }
  v13 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v36, 8);
  v14 = (void *)objc_msgSend([v13 alloc], "initWithContext:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_cdpUIProvider);
  v16 = WeakRetained == 0;

  if (v16)
  {
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[AASignInFlowController _onqueue_enrollCDPStateForAccount:withCDPContext:completion:].cold.1();
  }
  else
  {
    v17 = objc_loadWeakRetained((id *)&self->_cdpUIProvider);
    objc_msgSend(v14, "setUiProvider:", v17);
  }

  _AASignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = _AASignpostCreate(v18);
  v21 = v20;

  _AASignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v19, "SignInValidateCDP", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _AASignpostLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v19;
    _os_log_impl(&dword_19EACA000, v24, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInValidateCDP  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  v29[0] = v12;
  v29[1] = 3221225472;
  v29[2] = __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke;
  v29[3] = &unk_1E41709F8;
  v29[4] = self;
  v30 = v14;
  v34 = v19;
  v35 = v21;
  v32 = v8;
  v33 = v10;
  v31 = v9;
  v25 = v8;
  v26 = v10;
  v27 = v9;
  v28 = v14;
  objc_msgSend(v28, "handleCloudDataProtectionStateWithCompletion:", v29);

}

void __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double Nanoseconds;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  double v28;
  NSObject *v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  char v48;
  uint8_t buf[4];
  _BYTE v50[10];
  double v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v44 = a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharingChannel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", v8 != 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInValidateCDP", "hasSharingChannel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInValidateCDP", "shouldCompleteSignIn");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInValidateCDP", "cloudDataProtectionEnabled");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

  if (v44)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v44, "code"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInValidateCDP", "errorCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

  if (v44)
  objc_msgSend(v44, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInValidateCDP", "errorDomain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

  Nanoseconds = (double)_AASignpostGetNanoseconds(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  _AASignpostLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v27 = *(_QWORD *)(a1 + 72);
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v50 = a3;
    *(_WORD *)&v50[4] = 1026;
    *(_DWORD *)&v50[6] = objc_msgSend(v44, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v26, OS_SIGNPOST_INTERVAL_END, v27, "SignInValidateCDP", " Enabled=%{public,signpost.telemetry:number1,name=Enabled}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }
  v28 = Nanoseconds / 1000000000.0;

  _AASignpostLogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = *(_QWORD *)(a1 + 72);
    v31 = objc_msgSend(v44, "code");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v50 = v30;
    *(_WORD *)&v50[8] = 2048;
    v51 = v28;
    v52 = 1026;
    v53 = a3;
    v54 = 1026;
    v55 = v31;
    _os_log_impl(&dword_19EACA000, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInValidateCDP  Enabled=%{public,signpost.telemetry:number1,name=Enabled}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("SignInValidateCDP"));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "telemetryTimeSeries");
    v34 = objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke_cold_1();

    if (v34)
    {
      objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addEntriesFromDictionary:", v34);

    }
  }
  else
  {
    _AALogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke_cold_2();
  }

  if ((_DWORD)a2 && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v37 = v44;
    v38 = *(_QWORD *)(a1 + 64);
    if (v38)
      (*(void (**)(uint64_t, uint64_t, id))(v38 + 16))(v38, 1, v37);
  }
  else
  {
    v39 = v44;
    _AALogSystem();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v40, OS_LOG_TYPE_DEFAULT, "Cleaning up temporary account state created during iCDP validation.", buf, 2u);
    }

    v41 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke_93;
    v45[3] = &unk_1E41709D0;
    v42 = *(_QWORD *)(a1 + 56);
    v47 = *(id *)(a1 + 64);
    v48 = a2;
    v46 = v39;
    objc_msgSend(v41, "removeAccount:withCompletionHandler:", v42, v45);

  }
}

void __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke_93(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Failed to clean up after iCDP! Error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (id)_onqueue_createCDPContextWithAuthResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  -[AASignInFlowController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AASignInFlowController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cdpContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AASignInFlowController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cdpContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  else
  {

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v10 = (void *)getCDPContextClass_softClass;
  v18 = getCDPContextClass_softClass;
  if (!getCDPContextClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getCDPContextClass_block_invoke;
    v14[3] = &unk_1E416F0A0;
    v14[4] = &v15;
    __getCDPContextClass_block_invoke((uint64_t)v14);
    v10 = (void *)v16[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v15, 8);
  v9 = (void *)objc_msgSend([v11 alloc], "initWithAuthenticationResults:", v4);
  -[AASignInFlowController messageSession](self, "messageSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSharingChannel:", v12);

  objc_msgSend(v9, "set_ignoreLockAssertErrors:", -[AASignInFlowController ignoreLockAssertErrors](self, "ignoreLockAssertErrors"));
LABEL_8:

  return v9;
}

- (void)_enableFindMyIfPossibleWithAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *uiQueue;
  NSObject *v9;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  uiQueue = self->_uiQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AASignInFlowController__enableFindMyIfPossibleWithAccount_completion___block_invoke;
  block[3] = &unk_1E416E518;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = uiQueue;
  v10 = v7;
  v11 = v6;
  v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v9, v12);

}

uint64_t __72__AASignInFlowController__enableFindMyIfPossibleWithAccount_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_enableFindMyIfPossibleWithAccount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_onqueue_enableFindMyIfPossibleWithAccount:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  BOOL v11;
  __int16 v12;
  uint8_t buf[2];
  __int16 v14;
  __int16 v15;
  __int16 v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(MEMORY[0x1E0CF0E90], "isVirtualMachine"))
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v9 = "Device is a virtual machine, not enabling FindMy...";
      v10 = (uint8_t *)&v16;
LABEL_17:
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v11 = -[AASignInFlowController _shouldEnableDataclassesForAccount:](self, "_shouldEnableDataclassesForAccount:", v6);
  if (-[AASignInFlowController _findMyActivationAction](self, "_findMyActivationAction") == 2 || !v11)
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v9 = "Activation lock action explicitly disabled, not enabling FindMy...";
      v10 = (uint8_t *)&v15;
      goto LABEL_17;
    }
LABEL_18:

    v7[2](v7, 0);
    goto LABEL_19;
  }
  if (!-[AASignInFlowController shouldAutomaticallySaveSignInResults](self, "shouldAutomaticallySaveSignInResults"))
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v9 = "Automatic sign in result save disabled, not enabling FindMy...";
      v10 = (uint8_t *)&v14;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (!objc_msgSend(v6, "aa_isAccountClass:", CFSTR("primary"))
    || (objc_msgSend(v6, "aa_isPrimaryEmailVerified") & 1) == 0)
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Account is not a primary with email verified...";
      v10 = buf;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if ((objc_msgSend(v6, "isProvisionedForDataclass:", *MEMORY[0x1E0C8F3A8]) & 1) == 0)
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v12 = 0;
    v9 = "Account is not provisioned for FindMy...";
    v10 = (uint8_t *)&v12;
    goto LABEL_17;
  }
  -[AASignInFlowController _onqueue_delegate_enableFindMyWithCompletion:](self, "_onqueue_delegate_enableFindMyWithCompletion:", v7);
LABEL_19:

}

- (void)_saveAccount:(id)a3 withAuthResults:(id)a4 withCDPEnablement:(BOOL)a5 withAllDataclassesEnabledIfPossibleWithCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  OS_dispatch_queue *uiQueue;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  BOOL v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  uiQueue = self->_uiQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__AASignInFlowController__saveAccount_withAuthResults_withCDPEnablement_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke;
  block[3] = &unk_1E4170A20;
  block[4] = self;
  v20 = v10;
  v23 = a5;
  v21 = v11;
  v22 = v12;
  v14 = uiQueue;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v14, v18);

}

uint64_t __123__AASignInFlowController__saveAccount_withAuthResults_withCDPEnablement_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_saveAccount:withAuthResults:withCDPEnablement:withAllDataclassesEnabledIfPossibleWithCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)_backgroundSaveAccount:(id)a3 withDataclassEnablement:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *utilityQueue;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a5;
  utilityQueue = self->_utilityQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__AASignInFlowController__backgroundSaveAccount_withDataclassEnablement_completion___block_invoke;
  v15[3] = &unk_1E4170A48;
  v15[4] = self;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v11 = utilityQueue;
  v12 = v9;
  v13 = v8;
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_DEFAULT, 0, v15);
  dispatch_async(v11, v14);

}

uint64_t __84__AASignInFlowController__backgroundSaveAccount_withDataclassEnablement_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_saveAccount:withDataclassEnablement:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_onqueue_saveAccount:(id)a3 withAuthResults:(id)a4 withCDPEnablement:(BOOL)a5 withAllDataclassesEnabledIfPossibleWithCompletion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  _BOOL8 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  _QWORD v42[5];
  void *v43;
  void (**v44)(_QWORD, _QWORD, _QWORD, _QWORD);
  os_signpost_id_t v45;
  uint64_t v46;
  _QWORD v47[4];
  void *v48;
  AASignInFlowController *v49;
  os_signpost_id_t v50;
  uint64_t v51;
  uint8_t buf[4];
  _BYTE v53[10];
  __int16 v54;
  _BOOL4 v55;
  uint64_t v56;

  v7 = a5;
  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v12;
  if (self->_shouldAutomaticallySaveSignInResults)
  {
    if (self->_pendingSignIn)
    {
      _AALogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[AASignInFlowController _onqueue_saveAccount:withAuthResults:withCDPEnablement:withAllDataclassesEnabledIfPossibleWithCompletion:].cold.1();

      -[AASignInFlowController _aaErrorForErrorCode:](self, "_aaErrorForErrorCode:", -8004);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v13)[2](v13, 0, 0, v15);

    }
    else
    {
      self->_pendingSignIn = 1;
      objc_msgSend(v10, "refresh");
      if (objc_msgSend(v10, "isWarmingUp"))
      {
        _AALogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, "Account is no longer warming up.", buf, 2u);
        }

        objc_msgSend(v10, "setWarmingUp:", 0);
      }
      v17 = v7
         && -[AASignInFlowController _delegateWantsToBackgroundDataclassEnablement](self, "_delegateWantsToBackgroundDataclassEnablement");
      v18 = -[AASignInFlowController _shouldEnableDataclassesForAccount:](self, "_shouldEnableDataclassesForAccount:", v10);
      _AALogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v53 = v7;
        *(_WORD *)&v53[4] = 1024;
        *(_DWORD *)&v53[6] = v17;
        v54 = 1024;
        v55 = v18;
        _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "Saving account - isEnablingCDP: %{BOOL}d, wantsBackgroundDataclassEnablement %{BOOL}d, dataclassEnablement: %{BOOL}d", buf, 0x14u);
      }

      v20 = (void *)MEMORY[0x1E0CF0E68];
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF40]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFB8]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "analyticsEventWithName:altDSID:flowID:", CFSTR("com.apple.appleaccount.iCloudAccountAdd"), v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        _AALogSystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v53 = v18;
          _os_log_impl(&dword_19EACA000, v24, OS_LOG_TYPE_DEFAULT, "Kicking off accounts save with dataclass enablement (%{BOOL}d) in the background.", buf, 8u);
        }

        _AASignpostLogSystem();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = _AASignpostCreate(v25);
        v28 = v27;

        _AASignpostLogSystem();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19EACA000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v26, "SignInEnableDataclasses", " enableTelemetry=YES ", buf, 2u);
        }

        _AASignpostLogSystem();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v53 = v26;
          _os_log_impl(&dword_19EACA000, v31, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInEnableDataclasses  enableTelemetry=YES ", buf, 0xCu);
        }

        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __131__AASignInFlowController__onqueue_saveAccount_withAuthResults_withCDPEnablement_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke;
        v47[3] = &unk_1E4170A70;
        v50 = v26;
        v51 = v28;
        v48 = v23;
        v49 = self;
        v32 = v23;
        -[AASignInFlowController _backgroundSaveAccount:withDataclassEnablement:completion:](self, "_backgroundSaveAccount:withDataclassEnablement:completion:", v10, v18, v47);
        ((void (**)(_QWORD, uint64_t, id, _QWORD))v13)[2](v13, 1, v10, 0);
        v33 = v48;
      }
      else
      {
        _AASignpostLogSystem();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = _AASignpostCreate(v34);
        v37 = v36;

        _AASignpostLogSystem();
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19EACA000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v35, "SignInEnableDataclasses", " enableTelemetry=YES ", buf, 2u);
        }

        _AASignpostLogSystem();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v53 = v35;
          _os_log_impl(&dword_19EACA000, v40, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInEnableDataclasses  enableTelemetry=YES ", buf, 0xCu);
        }

        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __131__AASignInFlowController__onqueue_saveAccount_withAuthResults_withCDPEnablement_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke_98;
        v42[3] = &unk_1E4170A98;
        v45 = v35;
        v46 = v37;
        v42[4] = self;
        v43 = v23;
        v44 = v13;
        v41 = v23;
        -[AASignInFlowController _onqueue_delegate_saveAccount:withDataclassEnablement:completion:](self, "_onqueue_delegate_saveAccount:withDataclassEnablement:completion:", v10, v18, v42);

        v33 = v43;
      }

    }
  }
  else
  {
    (*((void (**)(id, uint64_t, id, _QWORD))v12 + 2))(v12, 1, v10, 0);
  }

}

void __131__AASignInFlowController__onqueue_saveAccount_withAuthResults_withCDPEnablement_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  int v16;
  _BYTE v17[10];
  double v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CF0EE0]);

  objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v6);
  +[AAAnalyticsRTCReporter reporter](AAAnalyticsRTCReporter, "reporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:", *(_QWORD *)(a1 + 32));

  Nanoseconds = _AASignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _AASignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 48);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v16 = 67240448;
    *(_DWORD *)v17 = a2;
    *(_WORD *)&v17[4] = 1026;
    *(_DWORD *)&v17[6] = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SignInEnableDataclasses", " Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0xEu);
  }

  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 48);
    v15 = objc_msgSend(v6, "code");
    v16 = 134218752;
    *(_QWORD *)v17 = v14;
    *(_WORD *)&v17[8] = 2048;
    v18 = (double)Nanoseconds / 1000000000.0;
    v19 = 1026;
    v20 = a2;
    v21 = 1026;
    v22 = v15;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignInEnableDataclasses  Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x22u);
  }

}

void __131__AASignInFlowController__onqueue_saveAccount_withAuthResults_withCDPEnablement_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke_98(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double Nanoseconds;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  double v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  const __CFString *v29;
  uint8_t buf[4];
  _BYTE v31[10];
  double v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInEnableDataclasses", "errorCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  if (v9)
  objc_msgSend(v9, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "SignInEnableDataclasses", "errorDomain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

  Nanoseconds = (double)_AASignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  _AASignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 56);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v31 = a2;
    *(_WORD *)&v31[4] = 1026;
    *(_DWORD *)&v31[6] = objc_msgSend(v9, "code");
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v18, OS_SIGNPOST_INTERVAL_END, v19, "SignInEnableDataclasses", " Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }
  v20 = Nanoseconds / 1000000000.0;

  _AASignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 56);
    v23 = objc_msgSend(v9, "code");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v31 = v22;
    *(_WORD *)&v31[8] = 2048;
    v32 = v20;
    v33 = 1026;
    v34 = a2;
    v35 = 1026;
    v36 = v23;
    _os_log_impl(&dword_19EACA000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInEnableDataclasses  Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("SignInEnableDataclasses"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CF0EE0]);

  objc_msgSend(*(id *)(a1 + 40), "populateUnderlyingErrorsStartingWithRootError:", v9);
  +[AAAnalyticsRTCReporter reporter](AAAnalyticsRTCReporter, "reporter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sendEvent:", *(_QWORD *)(a1 + 40));

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  _AALogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = CFSTR("NO");
    if ((_DWORD)a2)
      v29 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v31 = v29;
    *(_WORD *)&v31[8] = 2112;
    v32 = *(double *)&v9;
    _os_log_impl(&dword_19EACA000, v28, OS_LOG_TYPE_DEFAULT, "iCloud account save completed with success: %@, error: %@", buf, 0x16u);
  }

  if ((a2 & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "_delegate_presentAccountCreationError:completion:", v9, *(_QWORD *)(a1 + 48));

}

- (void)_onqueue_saveAccount:(id)a3 withDataclassEnablement:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  AASignInOperationHelper *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init(AASignInOperationHelper);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__AASignInFlowController__onqueue_saveAccount_withDataclassEnablement_completion___block_invoke;
  v12[3] = &unk_1E4170AC0;
  v13 = v7;
  v14 = v8;
  v10 = v7;
  v11 = v8;
  -[AASignInOperationHelper signInAccount:enablingDataclasses:completion:](v9, "signInAccount:enablingDataclasses:completion:", v10, v6, v12);

}

uint64_t __82__AASignInFlowController__onqueue_saveAccount_withDataclassEnablement_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if ((_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 1, *(_QWORD *)(a1 + 32), 0);
  else
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(v4 + 16))(v4, a2, 0, a3);
}

- (void)_delegate_presentAccountCreationError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  dispatch_block_t v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AASignInFlowController _titleForSignInFailureAlert](self, "_titleForSignInFailureAlert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v21 = v6;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v10;
    _os_log_error_impl(&dword_19EACA000, v11, OS_LOG_TYPE_ERROR, "AASignInFlowController: Sign in - account creation failed with error: %@, title: %@, message: %@", buf, 0x20u);
  }

  -[AASignInFlowController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__AASignInFlowController__delegate_presentAccountCreationError_completion___block_invoke;
    block[3] = &unk_1E4170B10;
    block[4] = self;
    v16 = v8;
    v17 = v10;
    v19 = v7;
    v18 = v6;
    v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v6);
  }

}

void __75__AASignInFlowController__delegate_presentAccountCreationError_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__AASignInFlowController__delegate_presentAccountCreationError_completion___block_invoke_2;
  v6[3] = &unk_1E4170AE8;
  v8 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "signInFlowController:showAlertWithTitle:message:completion:", v3, v4, v5, v6);

}

uint64_t __75__AASignInFlowController__delegate_presentAccountCreationError_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  _AALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __75__AASignInFlowController__delegate_presentAccountCreationError_completion___block_invoke_2_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_delegate_presentGenericTermsUIforAccount:(id)a3 authResults:(id)a4 serverError:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  char v16;
  dispatch_block_t v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _AALogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v10;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Account needs terms: %@", buf, 0xCu);
  }

  -[AASignInFlowController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __103__AASignInFlowController__delegate_presentGenericTermsUIforAccount_authResults_serverError_completion___block_invoke;
    v20[3] = &unk_1E4170728;
    v20[4] = self;
    v21 = v10;
    v22 = v11;
    v23 = v13;
    v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v20);
    dispatch_async(MEMORY[0x1E0C80D38], v17);

  }
  else
  {
    _AALogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AASignInFlowController _delegate_presentGenericTermsUIforAccount:authResults:serverError:completion:].cold.1();

    -[AASignInFlowController _aaErrorForErrorCode:withUnderlyingError:](self, "_aaErrorForErrorCode:withUnderlyingError:", -8010, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v19);

  }
}

void __103__AASignInFlowController__delegate_presentGenericTermsUIforAccount_authResults_serverError_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint8_t buf[4];
  os_signpost_id_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _AASignpostLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = _AASignpostCreate(v2);
  v5 = v4;

  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "TermsAcceptance", " enableTelemetry=YES ", buf, 2u);
  }

  _AASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = v3;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TermsAcceptance  enableTelemetry=YES ", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__AASignInFlowController__delegate_presentGenericTermsUIforAccount_authResults_serverError_completion___block_invoke_107;
  v12[3] = &unk_1E4170A98;
  v12[4] = v10;
  v15 = v3;
  v16 = v5;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v9, "signInFlowController:presentGenericTermsUIForAccount:completion:", v10, v11, v12);

}

void __103__AASignInFlowController__delegate_presentGenericTermsUIforAccount_authResults_serverError_completion___block_invoke_107(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double Nanoseconds;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  int v21;
  double v22;
  NSObject *v23;
  const __CFString *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (a2)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v31 = v10;
    v32 = 2112;
    v33 = *(double *)&v8;
    _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Account accepted terms: %@, error: %@", buf, 0x16u);
  }

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "TermsAcceptance", "errorCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  if (v8)
  objc_msgSend(v8, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s"), "TermsAcceptance", "errorDomain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

  Nanoseconds = (double)_AASignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  _AASignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = *(_QWORD *)(a1 + 56);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v21 = objc_msgSend(v8, "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v31) = v21;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v19, OS_SIGNPOST_INTERVAL_END, v20, "TermsAcceptance", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }
  v22 = Nanoseconds / 1000000000.0;

  _AASignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *(const __CFString **)(a1 + 56);
    v25 = objc_msgSend(v8, "code");
    *(_DWORD *)buf = 134218496;
    v31 = v24;
    v32 = 2048;
    v33 = v22;
    v34 = 1026;
    v35 = v25;
    _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:TermsAcceptance  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 32), "telemetryTimeSeries");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("TermsAcceptance"));

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_registerAndVerifyLoginForiCloudAccount:authResults:withCompletion:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v28 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v28 + 16))(v28, 0, 0, v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AASignInErrors"), -8006, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v28 + 16))(v28, 0, 0, v29);

    }
  }

}

- (void)_delegate_presentValidationAlertForError:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  dispatch_block_t v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB2D50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[AASignInFlowController _titleForVerificationFailureAlert](self, "_titleForVerificationFailureAlert");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v7, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CB2D68]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v26 = v7;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v15;
    _os_log_error_impl(&dword_19EACA000, v16, OS_LOG_TYPE_ERROR, "AASignInFlowController: Sign in - validation failed with error: %@, title: %@, message: %@", buf, 0x20u);
  }

  -[AASignInFlowController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__AASignInFlowController__delegate_presentValidationAlertForError_forAccount_completion___block_invoke;
    block[3] = &unk_1E4170B10;
    block[4] = self;
    v21 = v13;
    v22 = v15;
    v24 = v8;
    v23 = v7;
    v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v8 + 2))(v8, 0, 0, v7);
  }

}

void __89__AASignInFlowController__delegate_presentValidationAlertForError_forAccount_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__AASignInFlowController__delegate_presentValidationAlertForError_forAccount_completion___block_invoke_2;
  v6[3] = &unk_1E4170AE8;
  v8 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "signInFlowController:showAlertWithTitle:message:completion:", v3, v4, v5, v6);

}

uint64_t __89__AASignInFlowController__delegate_presentValidationAlertForError_forAccount_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  _AALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __89__AASignInFlowController__delegate_presentValidationAlertForError_forAccount_completion___block_invoke_2_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_delegate_presentProgressViewForAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_block_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  AASignInFlowController *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[AASignInFlowController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((v9 & 1) != 0)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[AASignInFlowController _delegate_presentProgressViewForAccount:completion:].cold.1();

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __77__AASignInFlowController__delegate_presentProgressViewForAccount_completion___block_invoke;
      v14[3] = &unk_1E4170728;
      v15 = v8;
      v16 = self;
      v17 = v6;
      v18 = v7;
      v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v14);
      dispatch_async(MEMORY[0x1E0C80D38], v12);

    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AASignInFlowController _delegate_presentProgressViewForAccount:completion:].cold.2();

      if (v7)
        (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }

  }
  else
  {
    _AALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[AASignInFlowController _delegate_presentProgressViewForAccount:completion:].cold.3();

    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __77__AASignInFlowController__delegate_presentProgressViewForAccount_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signInFlowController:presentProgressViewForAccount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_onqueue_delegate_saveAccount:(id)a3 withDataclassEnablement:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v8 = a5;
  -[AASignInFlowController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0 && v6)
  {
    -[AASignInFlowController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "signInFlowController:saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:", self, v12, v8);

  }
  else
  {
    -[AASignInFlowController _onqueue_saveAccount:withDataclassEnablement:completion:](self, "_onqueue_saveAccount:withDataclassEnablement:completion:", v12, v6, v8);
  }

}

- (void)_onqueue_delegate_enableFindMyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[AASignInFlowController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AASignInFlowController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AASignInFlowController _findMyActivationAction](self, "_findMyActivationAction");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__AASignInFlowController__onqueue_delegate_enableFindMyWithCompletion___block_invoke;
    v10[3] = &unk_1E416ED28;
    v11 = v4;
    objc_msgSend(v7, "signInFlowController:enableFindMyWithAction:completion:", self, v8, v10);

  }
  else
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AASignInFlowController _onqueue_delegate_enableFindMyWithCompletion:].cold.1(self, v9);

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

uint64_t __71__AASignInFlowController__onqueue_delegate_enableFindMyWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;

  _AALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__AASignInFlowController__onqueue_delegate_enableFindMyWithCompletion___block_invoke_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_nameForCloudService
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SERVICE_TYPE_ICLOUD"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_titleForSignInFailureAlert
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_TITLE"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_titleForVerificationFailureAlert
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("VERIFICATION_FAILED_TITLE"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_aaErrorForErrorCode:(int64_t)a3
{
  return -[AASignInFlowController _aaErrorForErrorCode:withUnderlyingError:](self, "_aaErrorForErrorCode:withUnderlyingError:", a3, 0);
}

- (id)_aaErrorForErrorCode:(int64_t)a3 withUnderlyingError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AASignInFlowController _aaMessageForErrorCode:](self, "_aaMessageForErrorCode:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D50]);

  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AASignInErrors"), a3, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_aaMessageForErrorCode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_VALIDATE"), 0, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AASignInFlowController _isDuplicateAccountError:](self, "_isDuplicateAccountError:", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ALREADY_EXISTING_ACCOUNT_DESC"), 0, CFSTR("Localizable"));
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

- (BOOL)_isDuplicateAccountError:(int64_t)a3
{
  return ((unint64_t)(a3 + 8012) < 0xB) & (0x403u >> (a3 + 76));
}

- (BOOL)_delegateWantsToSkipDataclassEnablement
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AASignInFlowController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AASignInFlowController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "skipDataclassEnablement");

    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("NO");
      if (v6)
        v8 = CFSTR("YES");
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Delegate wants to skip dataclass enablement: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_delegateWantsToBackgroundDataclassEnablement
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AASignInFlowController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AASignInFlowController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "backgroundDataclassEnablement");

    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("NO");
      if (v6)
        v8 = CFSTR("YES");
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Delegate wants to background dataclass enablement: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_delegateRequiresTerms
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[AASignInFlowController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[AASignInFlowController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requiredTerms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

- (unint64_t)_findMyActivationAction
{
  void *v3;
  char v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[AASignInFlowController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[AASignInFlowController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "findMyActivationAction");

  if (v6)
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = v6;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Delegate provided custom activation action: %lu", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

- (BOOL)_shouldEnableDataclassesForAccount:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[AASignInFlowController _delegateWantsToSkipDataclassEnablement](self, "_delegateWantsToSkipDataclassEnablement")|| self->_existingAccount && !-[AASignInFlowController _newSignInReauth](self, "_newSignInReauth"))
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "aa_isPrimaryEmailVerified");
  }

  return v5;
}

- (BOOL)_newSignInReauth
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AASignInFlowController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AASignInFlowController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "newSignInReauth");

    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("NO");
      if (v6)
        v8 = CFSTR("YES");
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Delegate indicates new sign in reauth: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_shouldStashLoginResponse
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AASignInFlowController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AASignInFlowController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldStashLoginResponse");

    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("NO");
      if (v6)
        v8 = CFSTR("YES");
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Delegate wants to stash login response: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_stashLoginResponseWithAuthenticationResults:(id)a3 appleAccount:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *utilityQueue;
  NSObject *v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[AASignInFlowController _shouldStashLoginResponse](self, "_shouldStashLoginResponse"))
  {
    utilityQueue = self->_utilityQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __84__AASignInFlowController__stashLoginResponseWithAuthenticationResults_appleAccount___block_invoke;
    v11[3] = &unk_1E416E8E8;
    v12 = v7;
    v13 = v6;
    v9 = utilityQueue;
    v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_DEFAULT, 0, v11);
    dispatch_async(v9, v10);

  }
}

void __84__AASignInFlowController__stashLoginResponseWithAuthenticationResults_appleAccount___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t Nanoseconds;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  os_signpost_id_t v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _AASignpostLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = _AASignpostCreate(v2);
  v5 = v4;

  _AASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "StashLoginResponse", " enableTelemetry=YES ", (uint8_t *)&v16, 2u);
  }

  _AASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134217984;
    v17 = v3;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StashLoginResponse  enableTelemetry=YES ", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "aa_cloudKitAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "credential");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "token");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:](AALoginContextManager, "stashLoginResponseWithAuthenticationResults:cloudKitToken:", *(_QWORD *)(a1 + 40), v11);
  Nanoseconds = _AASignpostGetNanoseconds(v3, v5);
  _AASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_19EACA000, v14, OS_SIGNPOST_INTERVAL_END, v3, "StashLoginResponse", (const char *)&unk_19EB99C95, (uint8_t *)&v16, 2u);
  }

  _AASignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218240;
    v17 = v3;
    v18 = 2048;
    v19 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StashLoginResponse ", (uint8_t *)&v16, 0x16u);
  }

}

- (id)_userPersonaUniqueString
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0DC5EF0]);
  if ((objc_msgSend(v2, "isEnterprisePersona") & 1) != 0 || objc_msgSend(v2, "isGuestPersona"))
  {
    objc_msgSend(v2, "userPersonaUniqueString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[AASignInFlowController _userPersonaUniqueString].cold.1((uint64_t)v3, v2, v4);
  }
  else
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[AASignInFlowController _userPersonaUniqueString].cold.2();
    v3 = 0;
  }

  return v3;
}

- (void)prewarmOperationsWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[AARemoteServer sharedServer](AARemoteServer, "sharedServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__AASignInFlowController_prewarmOperationsWithCompletion___block_invoke;
  v6[3] = &unk_1E4170B60;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "configurationWithCompletion:", v6);

}

void __58__AASignInFlowController_prewarmOperationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  NSObject *v13;

  v3 = a2;
  objc_msgSend(CFSTR("PREWARM"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_group_create();
  objc_msgSend(v3, "absintheEnable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  v8 = MEMORY[0x1E0C809B0];
  if (v7 == 1)
  {
    dispatch_group_enter(v5);
    +[AAAbsintheSigner sharedSigner](AAAbsintheSigner, "sharedSigner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __58__AASignInFlowController_prewarmOperationsWithCompletion___block_invoke_2;
    v12[3] = &unk_1E4170B38;
    v13 = v5;
    objc_msgSend(v9, "signatureForData:completion:", v4, v12);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __58__AASignInFlowController_prewarmOperationsWithCompletion___block_invoke_3;
    v10[3] = &unk_1E416E4A0;
    v11 = *(id *)(a1 + 32);
    dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v10);

  }
}

void __58__AASignInFlowController_prewarmOperationsWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __58__AASignInFlowController_prewarmOperationsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (AASignInFlowControllerDelegate)delegate
{
  return (AASignInFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CDPStateUIProvider)cdpUIProvider
{
  return (CDPStateUIProvider *)objc_loadWeakRetained((id *)&self->_cdpUIProvider);
}

- (void)setCdpUIProvider:(id)a3
{
  objc_storeWeak((id *)&self->_cdpUIProvider, a3);
}

- (BOOL)shouldAutomaticallySaveSignInResults
{
  return self->_shouldAutomaticallySaveSignInResults;
}

- (void)setShouldAutomaticallySaveSignInResults:(BOOL)a3
{
  self->_shouldAutomaticallySaveSignInResults = a3;
}

- (BOOL)existingAccount
{
  return self->_existingAccount;
}

- (void)setExistingAccount:(BOOL)a3
{
  self->_existingAccount = a3;
}

- (BOOL)ignoreLockAssertErrors
{
  return self->_ignoreLockAssertErrors;
}

- (void)setIgnoreLockAssertErrors:(BOOL)a3
{
  self->_ignoreLockAssertErrors = a3;
}

- (CUMessageSession)messageSession
{
  return self->_messageSession;
}

- (void)setMessageSession:(id)a3
{
  objc_storeStrong((id *)&self->_messageSession, a3);
}

- (NSMutableDictionary)telemetryTimeSeries
{
  return self->_telemetryTimeSeries;
}

- (void)setTelemetryTimeSeries:(id)a3
{
  objc_storeStrong((id *)&self->_telemetryTimeSeries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryTimeSeries, 0);
  objc_storeStrong((id *)&self->_messageSession, 0);
  objc_destroyWeak((id *)&self->_cdpUIProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uiQueue, 0);
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_authResults, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)signInWithIDMSAuthenticationResults:completion:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_19EACA000, v0, OS_LOG_TYPE_FAULT, "CloudService sign in was called with a nil completion. This should should never happen.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_36_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_19EACA000, v0, v1, "Delegate presented progress view: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_onqueue_prepareExistingAppleAccountForSignIn:withAuthResults:accountCreationError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AASignInFlowController: cannot promote existing data separated account %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_onqueue_createNewAppleAccountWithAuthResults:accountCreationError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "AASignInFlowController: Having multiple full accounts is not a supported configuration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_onqueue_updateAppleAccount:withAuthenticationResults:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_19EACA000, v0, v1, "Updated Apple account (%@) with temporary last name from IdMS results (%@)");
  OUTLINED_FUNCTION_1_0();
}

- (void)_onqueue_updateAppleAccount:withAuthenticationResults:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_19EACA000, v0, v1, "Updated Apple account (%@) with temporary first name from IdMS results (%@)");
  OUTLINED_FUNCTION_1_0();
}

- (void)_onqueue_saveTermsWithAuthResults:account:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, v0, v1, "Auth results contained terms info.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Nil response cannot be cached, immediately continuing sign in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_54_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_error_impl(&dword_19EACA000, v3, OS_LOG_TYPE_ERROR, "Failed to cache login response (%@) for account (%@) with error: %@", v4, 0x20u);
  OUTLINED_FUNCTION_11();
}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_57_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, v0, v1, "LoginAndUpdateiCloudAccount completed retry.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __116__AASignInFlowController__onqueue_verifyLoginResponseForiCloudAccount_withAuthResults_withSuccess_error_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Validating iCDP failed with error %@! Blocking iCloud sign-in...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __98__AASignInFlowController__onqueue_validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke_76_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, v0, v1, "PreflightSave completed retry.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__AASignInFlowController__preflightSaveWithAuthResults_account_withCompletion___block_invoke_77_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "AASignInFlowController: Skipping iCDP state machine because we failed to create a CDPContext.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_onqueue_addKeysAndEnrollCDPStateForAccount:(uint64_t)a1 withCDPContext:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 16), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19EACA000, a2, v4, "Looking for custodian sessionID in authentication results: %{private}@", v5);

  OUTLINED_FUNCTION_11();
}

void __96__AASignInFlowController__onqueue_addKeysAndEnrollCDPStateForAccount_withCDPContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to fetch Custodian recovery keys with error: %@, continuing with regular CDP Flows", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_onqueue_enrollCDPStateForAccount:withCDPContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "No CDPUI provider, this may not go well.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1_2(&dword_19EACA000, v0, v1, "CDPContext (%@) is providing specialized time series: %@");
  OUTLINED_FUNCTION_1_0();
}

void __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_19EACA000, v0, v1, "CDPContext (%@) does not respond to 'telemetryTimeSeries' selector (SDK mismatch)", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_onqueue_saveAccount:withAuthResults:withCDPEnablement:withAllDataclassesEnabledIfPossibleWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Attempt to save account while another save is mid-flight!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__AASignInFlowController__delegate_presentAccountCreationError_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AASignInFlowController: Sign in - account creation failed, didShowAlert: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_delegate_presentGenericTermsUIforAccount:authResults:serverError:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "AASignInFlowController: Failing sign in as account needs terms and we are unable to display UI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __89__AASignInFlowController__delegate_presentValidationAlertForError_forAccount_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AASignInFlowController: Sign in - validation failed, didShowAlert: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_delegate_presentProgressViewForAccount:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_19EACA000, v0, v1, "AASignInFlowController: Requesting delegate (%@) to present progress view for account (%@)");
  OUTLINED_FUNCTION_1_0();
}

- (void)_delegate_presentProgressViewForAccount:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AASignInFlowController: Delegate (%@) does not respond to selector 'signInFlowController:presentProgressViewForAccount:completion:'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_delegate_presentProgressViewForAccount:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, v0, v1, "AASignInFlowController: AppleAccountUI/AppleIDSignInProgress=false, skipping delegate call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_onqueue_delegate_enableFindMyWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_19EACA000, a2, OS_LOG_TYPE_ERROR, "AASignInFlowController: Delegate (%@) does not respond to selector, FindMy enable failed.", v4, 0xCu);

  OUTLINED_FUNCTION_11();
}

void __71__AASignInFlowController__onqueue_delegate_enableFindMyWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "AASignInFlowController: User completed FindMy activation with result: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_userPersonaUniqueString
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, v0, v1, "We're not running in data separated Persona.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
