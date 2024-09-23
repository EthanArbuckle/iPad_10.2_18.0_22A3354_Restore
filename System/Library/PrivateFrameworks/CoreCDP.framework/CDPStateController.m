@implementation CDPStateController

- (void)isManateeAvailable:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Manatee is not available, error: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (BOOL)isManateeAvailable:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  CDPManateeStateController *v7;
  void *v8;
  CDPManateeStateController *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_20D7E6000, "cdp/manatee-availability", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"Requesting manatee state...\", buf, 2u);
  }

  v7 = [CDPManateeStateController alloc];
  -[CDPController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CDPManateeStateController initWithContext:](v7, "initWithContext:", v8);

  v15 = 0;
  v10 = -[CDPManateeStateController isManateeAvailable:](v9, "isManateeAvailable:", &v15);
  v11 = v15;
  if (v10)
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "\"Manatee is available\", buf, 2u);
    }

  }
  else
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CDPStateController isManateeAvailable:].cold.1();

    if (a3)
      *a3 = objc_retainAutorelease(v11);
  }

  os_activity_scope_leave(&state);
  return v10;
}

- (CDPStateController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDPStateController;
  return -[CDPController init](&v3, sel_init);
}

- (void)handleCloudDataProtectionStateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[7];
  _QWORD v14[3];
  char v15;
  _QWORD v16[3];
  char v17;

  v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke;
  v13[3] = &unk_24C7C1AE8;
  v13[4] = self;
  v13[5] = v16;
  v13[6] = v14;
  v6 = (void *)MEMORY[0x212BA9A30](v13);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFC630]), "initWithMaxRetries:", 2);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_2_23;
  v9[3] = &unk_24C7C1B58;
  v8 = v4;
  v10 = v8;
  v11 = v16;
  v12 = v14;
  objc_msgSend(v7, "scheduleTask:shouldRetry:completionHandler:", v6, &__block_literal_global_12, v9);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);

}

void __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_2;
  v6[3] = &unk_24C7C1AC0;
  v8 = *(_OWORD *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_handleCloudDataProtectionStateWithCompletion:", v6);

}

uint64_t __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_2(_QWORD *a1, char a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

uint64_t __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_21(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cdp_indicatesDaemonConnectionWasInterrupted");
}

void __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_2_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  dispatch_block_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  __int128 v11;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_3;
  v8[3] = &unk_24C7C1B30;
  v5 = *(id *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v6 = v4;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __67__CDPStateController_handleCloudDataProtectionStateWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24), a1[4]);
  return result;
}

- (void)_handleCloudDataProtectionStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  CDPStateController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t v23[8];
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  __int128 *p_buf;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  CDPStateController *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _os_activity_create(&dword_20D7E6000, "cdp/statemachine-handle", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _CDPSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _CDPSignpostCreate(v6);
  v9 = v8;

  _CDPSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HandleCloudDataProtectionState", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: HandleCloudDataProtectionState  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v13 = self;
  v36 = v13;
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __68__CDPStateController__handleCloudDataProtectionStateWithCompletion___block_invoke;
  v26[3] = &unk_24C7C1B80;
  v29 = v7;
  v30 = v9;
  p_buf = &buf;
  v15 = v4;
  v27 = v15;
  v16 = (void *)MEMORY[0x212BA9A30](v26);
  -[CDPController daemonConn](v13, "daemonConn");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __68__CDPStateController__handleCloudDataProtectionStateWithCompletion___block_invoke_26;
  v24[3] = &unk_24C7C10E8;
  v18 = v16;
  v25 = v18;
  objc_msgSend(v17, "daemonWithErrorHandler:", v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_20D7E6000, v20, OS_LOG_TYPE_DEFAULT, "\"Requesting start of CDP state machine...\", v23, 2u);
  }

  -[CDPController context](v13, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v13, "uiProviderProxy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleCloudDataProtectionStateWithContext:uiProvider:completion:", v21, v22, v18);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __68__CDPStateController__handleCloudDataProtectionStateWithCompletion___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  double v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  _BYTE v21[10];
  _BYTE v22[10];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  _CDPSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v20 = 67240192;
    *(_DWORD *)v21 = objc_msgSend(v7, "code");
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "HandleCloudDataProtectionState", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v20, 8u);
  }

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (double)Nanoseconds / 1000000000.0;
    v14 = a1[6];
    v15 = objc_msgSend(v7, "code");
    v20 = 134218496;
    *(_QWORD *)v21 = v14;
    *(_WORD *)&v21[8] = 2048;
    *(double *)v22 = v13;
    *(_WORD *)&v22[8] = 1026;
    v23 = v15;
    _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: HandleCloudDataProtectionState  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v20, 0x1Cu);
  }

  v16 = *(_QWORD *)(a1[5] + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = 0;

  v18 = a1[4];
  if (v18)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v18 + 16))(v18, a2, a3, v7);
  _CDPLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 67109634;
    *(_DWORD *)v21 = a2;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = a3;
    *(_WORD *)v22 = 2112;
    *(_QWORD *)&v22[2] = v7;
    _os_log_impl(&dword_20D7E6000, v19, OS_LOG_TYPE_DEFAULT, "\"State machine completed shouldCompleteSignIn=%{BOOL}d cloudDataProtectionEnabled=%{BOOL}d error=%@\", (uint8_t *)&v20, 0x18u);
  }

}

void __68__CDPStateController__handleCloudDataProtectionStateWithCompletion___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__CDPStateController__handleCloudDataProtectionStateWithCompletion___block_invoke_26_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)repairCloudDataProtectionStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  CDPStateController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t v23[8];
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  __int128 *p_buf;
  os_signpost_id_t v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  CDPStateController *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _os_activity_create(&dword_20D7E6000, "cdp/statemachine-repair", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _CDPSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _CDPSignpostCreate(v6);
  v9 = v8;

  _CDPSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RepairCloudDataProtectionState", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RepairCloudDataProtectionState  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v13 = self;
  v36 = v13;
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke;
  v26[3] = &unk_24C7C1BD0;
  v29 = v7;
  v30 = v9;
  p_buf = &buf;
  v15 = v4;
  v27 = v15;
  v16 = (void *)MEMORY[0x212BA9A30](v26);
  -[CDPController daemonConn](v13, "daemonConn");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_30;
  v24[3] = &unk_24C7C10E8;
  v18 = v16;
  v25 = v18;
  objc_msgSend(v17, "daemonWithErrorHandler:", v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_20D7E6000, v20, OS_LOG_TYPE_DEFAULT, "\"Requesting repair of CDP state...\", v23, 2u);
  }

  -[CDPController context](v13, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v13, "uiProviderProxy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "repairCloudDataProtectionStateWithContext:uiProvider:completion:", v21, v22, v18);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  id v14;
  id v15;
  __int128 v16;
  _QWORD block[4];
  id v18;
  __int128 v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  double v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  Nanoseconds = _CDPSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _CDPSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v22) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RepairCloudDataProtectionState", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = *(_QWORD *)(a1 + 48);
    v13 = objc_msgSend(v5, "code");
    *(_DWORD *)buf = 134218496;
    v22 = v12;
    v23 = 2048;
    v24 = v11;
    v25 = 1026;
    v26 = v13;
    _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RepairCloudDataProtectionState  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_28;
  block[3] = &unk_24C7C1BA8;
  v20 = a2;
  v18 = v5;
  v16 = *(_OWORD *)(a1 + 32);
  v14 = (id)v16;
  v19 = v16;
  v15 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_28(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t result;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    v8[0] = 67109378;
    v8[1] = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"State machine repair completed didRepair=%{BOOL}d error=%@\", (uint8_t *)v8, 0x12u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_30_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startCircleApplicationApprovalServer:(id)a3
{
  id v4;
  CDPStateController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[8];
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  CDPStateController *v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__3;
  v20[4] = __Block_byref_object_dispose__3;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v21 = v5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke;
  v17[3] = &unk_24C7C1C20;
  v19 = v20;
  v7 = v4;
  v18 = v7;
  v8 = (void *)MEMORY[0x212BA9A30](v17);
  -[CDPController daemonConn](v5, "daemonConn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke_3;
  v15[3] = &unk_24C7C10E8;
  v10 = v8;
  v16 = v10;
  objc_msgSend(v9, "daemonWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "\"Requesting start of accepting sharing session...\", v14, 2u);
  }

  -[CDPController context](v5, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startCircleApplicationApprovalServerWithContext:completion:", v13, v10);

  _Block_object_dispose(v20, 8);
}

void __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke_2;
  block[3] = &unk_24C7C1BF8;
  v8 = *(_OWORD *)(a1 + 32);
  v6 = (id)v8;
  v11 = v8;
  v12 = a2;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startCircleApplicationApprovalServerSkipEscrowFetches:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Requesting start of accepting sharing session, skipping escrow fetches...\", v7, 2u);
  }

  -[CDPController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set_skipEscrowFetches:", 1);

  -[CDPStateController startCircleApplicationApprovalServer:](self, "startCircleApplicationApprovalServer:", v4);
}

- (void)recoverAndSynchronizeWithSquirrel:(id)a3
{
  id v4;
  CDPStateController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  CDPStateController *v22;

  v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__3;
  v21[4] = __Block_byref_object_dispose__3;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v22 = v5;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __56__CDPStateController_recoverAndSynchronizeWithSquirrel___block_invoke;
  v18[3] = &unk_24C7C1C20;
  v20 = v21;
  v7 = v4;
  v19 = v7;
  v8 = (void *)MEMORY[0x212BA9A30](v18);
  -[CDPController daemonConn](v5, "daemonConn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __56__CDPStateController_recoverAndSynchronizeWithSquirrel___block_invoke_3;
  v16[3] = &unk_24C7C10E8;
  v10 = v8;
  v17 = v10;
  objc_msgSend(v9, "daemonWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "\"Requesting repair and synchronization of CDP state with Squirrel...\", v15, 2u);
  }

  -[CDPController context](v5, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v5, "uiProviderProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recoverAndSynchronizeSquirrelWithContext:uiProvider:completion:", v13, v14, v10);

  _Block_object_dispose(v21, 8);
}

void __56__CDPStateController_recoverAndSynchronizeWithSquirrel___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CDPStateController_recoverAndSynchronizeWithSquirrel___block_invoke_2;
  block[3] = &unk_24C7C1BF8;
  v8 = *(_OWORD *)(a1 + 32);
  v6 = (id)v8;
  v11 = v8;
  v12 = a2;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __56__CDPStateController_recoverAndSynchronizeWithSquirrel___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __56__CDPStateController_recoverAndSynchronizeWithSquirrel___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_30_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)recoverWithSquirrel:(id)a3
{
  id v4;
  CDPStateController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  CDPStateController *v22;

  v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__3;
  v21[4] = __Block_byref_object_dispose__3;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v22 = v5;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __42__CDPStateController_recoverWithSquirrel___block_invoke;
  v18[3] = &unk_24C7C1C20;
  v20 = v21;
  v7 = v4;
  v19 = v7;
  v8 = (void *)MEMORY[0x212BA9A30](v18);
  -[CDPController daemonConn](v5, "daemonConn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __42__CDPStateController_recoverWithSquirrel___block_invoke_3;
  v16[3] = &unk_24C7C10E8;
  v10 = v8;
  v17 = v10;
  objc_msgSend(v9, "daemonWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "\"Requesting repair of CDP state with Squirrel...\", v15, 2u);
  }

  -[CDPController context](v5, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v5, "uiProviderProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recoverSquirrelWithContext:uiProvider:completion:", v13, v14, v10);

  _Block_object_dispose(v21, 8);
}

void __42__CDPStateController_recoverWithSquirrel___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__CDPStateController_recoverWithSquirrel___block_invoke_2;
  block[3] = &unk_24C7C1BF8;
  v8 = *(_OWORD *)(a1 + 32);
  v6 = (id)v8;
  v11 = v8;
  v12 = a2;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __42__CDPStateController_recoverWithSquirrel___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __42__CDPStateController_recoverWithSquirrel___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_30_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)attemptToEscrowPreRecord:(id)a3 preRecordUUID:(id)a4 secretType:(unint64_t)a5 completion:(id)a6
{
  -[CDPStateController attemptToEscrowPreRecord:completion:](self, "attemptToEscrowPreRecord:completion:", a4, a6, a5);
}

- (void)attemptToEscrowPreRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CDPStateController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint8_t v17[8];
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  CDPStateController *v24;

  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__3;
  v23[4] = __Block_byref_object_dispose__3;
  v8 = self;
  v9 = MEMORY[0x24BDAC760];
  v24 = v8;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke;
  v20[3] = &unk_24C7C1C20;
  v22 = v23;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x212BA9A30](v20);
  -[CDPController daemonConn](v8, "daemonConn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke_3;
  v18[3] = &unk_24C7C10E8;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v12, "daemonWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_20D7E6000, v15, OS_LOG_TYPE_DEFAULT, "\"Informing daemon of attempting to escrow preRecord...\", v17, 2u);
  }

  -[CDPController context](v8, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attemptToEscrowPreRecord:context:completion:", v6, v16, v13);

  _Block_object_dispose(v23, 8);
}

void __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke_2;
  block[3] = &unk_24C7C1BF8;
  v8 = *(_OWORD *)(a1 + 32);
  v6 = (id)v8;
  v11 = v8;
  v12 = a2;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)localSecretChangedTo:(id)a3 secretType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  CDPStateController *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v24[16];
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t *v32;
  _QWORD *v33;
  unint64_t v34;
  _QWORD v35[5];
  CDPStateController *v36;
  _QWORD v37[4];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v8 = a3;
  v9 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  v43 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__3;
  v35[4] = __Block_byref_object_dispose__3;
  v10 = self;
  v11 = MEMORY[0x24BDAC760];
  v36 = v10;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke;
  v29[3] = &unk_24C7C1C98;
  v32 = &v38;
  v12 = v8;
  v33 = v35;
  v34 = a4;
  v30 = v12;
  v13 = v9;
  v31 = v13;
  v14 = (void *)MEMORY[0x212BA9A30](v29);
  -[CDPController daemonConn](v10, "daemonConn");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_32;
  v25[3] = &unk_24C7C1CC0;
  v28 = v37;
  v16 = v14;
  v26 = v16;
  v17 = v13;
  v27 = v17;
  objc_msgSend(v15, "daemonWithErrorHandler:", v25);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v39[5];
  v39[5] = v18;

  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_20D7E6000, v20, OS_LOG_TYPE_DEFAULT, "\"Informing daemon of local secret change...\", v24, 2u);
  }

  v21 = (void *)v39[5];
  -[CDPController context](v10, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v10, "uiProviderProxy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localSecretChangedTo:secretType:context:uiProvider:completion:", v12, a4, v22, v23, v16);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v38, 8);

}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_2;
  block[3] = &unk_24C7C1C70;
  v6 = *(_QWORD *)(a1 + 48);
  v11 = v5;
  v14 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 56);
  v16 = v8;
  v12 = v7;
  v13 = *(id *)(a1 + 40);
  v17 = a2;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  if (*(_QWORD *)(a1 + 32))
  {
    _CDPLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_2_cold_1();

    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "uiProviderProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_31;
    v12[3] = &unk_24C7C1C48;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 64);
    v13 = v8;
    v15 = v9;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v3, "localSecretChangedTo:secretType:context:uiProvider:completion:", v4, v5, v6, v7, v12);

  }
  else if (*(_QWORD *)(a1 + 48))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_31(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _DWORD v14[2];
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a1[4];
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_31_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "uiProviderProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = 67109634;
    v14[1] = a2;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"Local Secret Updated after retry: %{BOOL}d. UIProxy: %@. Context: %@\", (uint8_t *)v14, 0x1Cu);

  }
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

  v13 = a1[5];
  if (v13)
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v5);

}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_32(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_32_cold_1();

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v5 = a1[5];
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  }

}

- (void)finishOfflineLocalSecretChangeWithCompletion:(id)a3
{
  id v4;
  CDPStateController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  CDPStateController *v22;

  v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__3;
  v21[4] = __Block_byref_object_dispose__3;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v22 = v5;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __67__CDPStateController_finishOfflineLocalSecretChangeWithCompletion___block_invoke;
  v18[3] = &unk_24C7C1C20;
  v20 = v21;
  v7 = v4;
  v19 = v7;
  v8 = (void *)MEMORY[0x212BA9A30](v18);
  -[CDPController daemonConn](v5, "daemonConn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __67__CDPStateController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_3;
  v16[3] = &unk_24C7C10E8;
  v10 = v8;
  v17 = v10;
  objc_msgSend(v9, "daemonWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "\"Attempting to finish offline local secret change...\", v15, 2u);
  }

  -[CDPController context](v5, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v5, "uiProviderProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishOfflineLocalSecretChangeWithContext:uiProvider:completion:", v13, v14, v10);

  _Block_object_dispose(v21, 8);
}

void __67__CDPStateController_finishOfflineLocalSecretChangeWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__CDPStateController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_2;
  block[3] = &unk_24C7C1BF8;
  v8 = *(_OWORD *)(a1 + 32);
  v6 = (id)v8;
  v11 = v8;
  v12 = a2;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __67__CDPStateController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __67__CDPStateController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_32_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)finishCyrusFlowAfterTermsAgreementWithContext:(id)a3
{
  id v4;
  CDPStateController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  CDPStateController *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__3;
  v24[4] = __Block_byref_object_dispose__3;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v25 = v5;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke;
  v21[3] = &unk_24C7C1C20;
  v23 = v24;
  v7 = v4;
  v22 = v7;
  v8 = (void *)MEMORY[0x212BA9A30](v21);
  -[CDPController daemonConn](v5, "daemonConn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke_3;
  v19[3] = &unk_24C7C10E8;
  v10 = v8;
  v20 = v10;
  objc_msgSend(v9, "daemonWithErrorHandler:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[CDPController context](v5, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPController context](v5, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "type");
    *(_DWORD *)buf = 138412546;
    v27 = v14;
    v28 = 2048;
    v29 = v16;
    _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "\"Attempting to finish secure terms flow for %@ with type %ld\", buf, 0x16u);

  }
  -[CDPController context](v5, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v5, "uiProviderProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishCyrusFlowAfterTermsAgreementWithContext:uiProvider:completion:", v17, v18, v10);

  _Block_object_dispose(v24, 8);
}

void __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke_2;
  block[3] = &unk_24C7C1BF8;
  v8 = *(_OWORD *)(a1 + 32);
  v6 = (id)v8;
  v11 = v8;
  v12 = a2;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldPerformRepairWithOptionForceFetch:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  os_activity_scope_state_s state;

  v5 = a3;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp: repair state check", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[CDPController daemonConn](self, "daemonConn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke;
  v15[3] = &unk_24C7C12B0;
  v15[4] = &v20;
  objc_msgSend(v8, "synchronousDaemonWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDPController context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke_33;
  v14[3] = &unk_24C7C15F8;
  v14[4] = &v20;
  v14[5] = &v16;
  objc_msgSend(v10, "shouldPerformRepairForContext:forceFetch:completion:", v11, v5, v14);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v12 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  os_activity_scope_leave(&state);
  return v12;
}

void __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke_cold_1();

}

void __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke_33(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)shouldPerformRepairWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  CDPStateController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint8_t v17[8];
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  CDPStateController *v24;
  os_activity_scope_state_s state;

  v4 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp/should-perform-repair", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__3;
  v23[4] = __Block_byref_object_dispose__3;
  v8 = self;
  v9 = MEMORY[0x24BDAC760];
  v24 = v8;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke;
  v20[3] = &unk_24C7C1C20;
  v22 = v23;
  v10 = v6;
  v21 = v10;
  v11 = (void *)MEMORY[0x212BA9A30](v20);
  -[CDPController daemonConn](v8, "daemonConn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2;
  v18[3] = &unk_24C7C10E8;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v12, "daemonWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_20D7E6000, v15, OS_LOG_TYPE_DEFAULT, "\"Requesting to check if repair should be performed on the CDP state\", v17, 2u);
  }

  -[CDPController context](v8, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "shouldPerformRepairForContext:forceFetch:completion:", v16, v4, v13);

  _Block_object_dispose(v23, 8);
  os_activity_scope_leave(&state);

}

void __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldPerformAuthenticatedRepairWithOptionForceFetch:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  os_activity_scope_state_s state;

  v5 = a3;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp: authenticated repair state check", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[CDPController daemonConn](self, "daemonConn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__CDPStateController_shouldPerformAuthenticatedRepairWithOptionForceFetch_error___block_invoke;
  v15[3] = &unk_24C7C12B0;
  v15[4] = &v20;
  objc_msgSend(v8, "synchronousDaemonWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDPController context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __81__CDPStateController_shouldPerformAuthenticatedRepairWithOptionForceFetch_error___block_invoke_34;
  v14[3] = &unk_24C7C15F8;
  v14[4] = &v20;
  v14[5] = &v16;
  objc_msgSend(v10, "shouldPerformAuthenticatedRepairForContext:forceFetch:completion:", v11, v5, v14);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v12 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  os_activity_scope_leave(&state);
  return v12;
}

void __81__CDPStateController_shouldPerformAuthenticatedRepairWithOptionForceFetch_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __81__CDPStateController_shouldPerformAuthenticatedRepairWithOptionForceFetch_error___block_invoke_cold_1();

}

void __81__CDPStateController_shouldPerformAuthenticatedRepairWithOptionForceFetch_error___block_invoke_34(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)generateEscrowRecordReportUsingCache:(BOOL)a3 completion:(id)a4
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
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  os_signpost_id_t v27;
  uint64_t v28;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v4 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp/generate-escrow-record-report", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  _CDPSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _CDPSignpostCreate(v8);
  v11 = v10;

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v31) = v4;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "GenerateEscrowRecordReport", " enableTelemetry=YES  UseCache=%{public,signpost.telemetry:number2,name=UseCache}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v31 = v9;
    v32 = 1026;
    v33 = v4;
    _os_log_impl(&dword_20D7E6000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GenerateEscrowRecordReport  enableTelemetry=YES  UseCache=%{public,signpost.telemetry:number2,name=UseCache}d ", buf, 0x12u);
  }

  v15 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __70__CDPStateController_generateEscrowRecordReportUsingCache_completion___block_invoke;
  v25[3] = &unk_24C7C1CE8;
  v25[4] = self;
  v27 = v9;
  v28 = v11;
  v16 = v6;
  v26 = v16;
  v17 = (void *)MEMORY[0x212BA9A30](v25);
  -[CDPController daemonConn](self, "daemonConn");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __70__CDPStateController_generateEscrowRecordReportUsingCache_completion___block_invoke_36;
  v23[3] = &unk_24C7C10E8;
  v19 = v17;
  v24 = v19;
  objc_msgSend(v18, "synchronousDaemonWithErrorHandler:", v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v31) = v4;
    _os_log_impl(&dword_20D7E6000, v21, OS_LOG_TYPE_DEFAULT, "\"Generating escrow record report (usingCache: %{BOOL}d)\", buf, 8u);
  }

  -[CDPController context](self, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "generateEscrowRecordStatusReportForContext:usingCache:withCompletion:", v22, v4, v19);

  os_activity_scope_leave(&state);
}

void __70__CDPStateController_generateEscrowRecordReportUsingCache_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  _CDPSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v9, OS_SIGNPOST_INTERVAL_END, v10, "GenerateEscrowRecordReport", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _CDPSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[6];
    v14 = objc_msgSend(v6, "code");
    v17 = 134218496;
    v18 = v13;
    v19 = 2048;
    v20 = v12;
    v21 = 1026;
    v22 = v14;
    _os_log_impl(&dword_20D7E6000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GenerateEscrowRecordReport  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  if (v6)
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __70__CDPStateController_generateEscrowRecordReportUsingCache_completion___block_invoke_cold_1();

  }
  v16 = a1[5];
  if (v16)
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);

}

uint64_t __70__CDPStateController_generateEscrowRecordReportUsingCache_completion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:(id)a3
{
  id v4;
  CDPStateController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  CDPStateController *v23;

  v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__3;
  v22[4] = __Block_byref_object_dispose__3;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v23 = v5;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke;
  v19[3] = &unk_24C7C1C20;
  v21 = v22;
  v7 = v4;
  v20 = v7;
  v8 = (void *)MEMORY[0x212BA9A30](v19);
  v9 = _os_activity_create(&dword_20D7E6000, "cdp/authenticate-and-generate-rk", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  -[CDPController daemonConn](v5, "daemonConn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_38;
  v16[3] = &unk_24C7C10E8;
  v11 = v8;
  v17 = v11;
  objc_msgSend(v10, "daemonWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[CDPStateController authenticateAndGenerateNewRecoveryKeyWithCompletion:].cold.1();

  -[CDPController context](v5, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v5, "uiProviderProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "authenticateAndGenerateNewRecoveryKeyWithContext:uiProvider:completion:", v14, v15, v11);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v22, 8);

}

void __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_2;
  block[3] = &unk_24C7C1BF8;
  v8 = *(_OWORD *)(a1 + 32);
  v6 = (id)v8;
  v11 = v8;
  v12 = a2;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_2_cold_1();

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_38_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateNewRecoveryKey:(id)a3
{
  id v4;
  CDPStateController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  os_activity_scope_state_s state;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  CDPStateController *v29;

  v4 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  v5 = self;
  v29 = v5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__3;
  v26[4] = __Block_byref_object_dispose__3;
  v27 = (id)objc_opt_new();
  v6 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __45__CDPStateController_generateNewRecoveryKey___block_invoke;
  v22[3] = &unk_24C7C1D10;
  v24 = v26;
  v25 = v28;
  v7 = v4;
  v23 = v7;
  v8 = (void *)MEMORY[0x212BA9A30](v22);
  v9 = _os_activity_create(&dword_20D7E6000, "cdp/generate-rk", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  -[CDPController daemonConn](v5, "daemonConn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  v17 = 3221225472;
  v18 = __45__CDPStateController_generateNewRecoveryKey___block_invoke_3;
  v19 = &unk_24C7C10E8;
  v11 = v8;
  v20 = v11;
  objc_msgSend(v10, "daemonWithErrorHandler:", &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[CDPStateController generateNewRecoveryKey:].cold.1();

  -[CDPController context](v5, "context", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v5, "uiProviderProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "generateNewRecoveryKeyWithContext:uiProvider:completion:", v14, v15, v11);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(v28, 8);
}

void __45__CDPStateController_generateNewRecoveryKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "reportRecoveryKeyTaskFinishedWithSuccess:error:", a2, v5);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__CDPStateController_generateNewRecoveryKey___block_invoke_2;
  v8[3] = &unk_24C7C1BF8;
  v11 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v12 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __45__CDPStateController_generateNewRecoveryKey___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __45__CDPStateController_generateNewRecoveryKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CDPStateController_generateNewRecoveryKey___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)authenticateAndDeleteRecoveryKeyWithCompletion:(id)a3
{
  id v4;
  CDPStateController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  CDPStateController *v23;

  v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__3;
  v22[4] = __Block_byref_object_dispose__3;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v23 = v5;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke;
  v19[3] = &unk_24C7C1C20;
  v21 = v22;
  v7 = v4;
  v20 = v7;
  v8 = (void *)MEMORY[0x212BA9A30](v19);
  v9 = _os_activity_create(&dword_20D7E6000, "cdp/authenticate-and-delete-rk", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  -[CDPController daemonConn](v5, "daemonConn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_40;
  v16[3] = &unk_24C7C10E8;
  v11 = v8;
  v17 = v11;
  objc_msgSend(v10, "daemonWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[CDPStateController authenticateAndDeleteRecoveryKeyWithCompletion:].cold.1();

  -[CDPController context](v5, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v5, "uiProviderProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "authenticateAndDeleteRecoveryKeyWithContext:uiProvider:completion:", v14, v15, v11);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v22, 8);

}

void __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_2;
  block[3] = &unk_24C7C1BF8;
  v8 = *(_OWORD *)(a1 + 32);
  v6 = (id)v8;
  v11 = v8;
  v12 = a2;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_2_cold_1();

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_40_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteRecoveryKey:(id)a3
{
  id v4;
  CDPStateController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  os_activity_scope_state_s state;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  CDPStateController *v29;

  v4 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  v5 = self;
  v29 = v5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__3;
  v26[4] = __Block_byref_object_dispose__3;
  v27 = (id)objc_opt_new();
  v6 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __40__CDPStateController_deleteRecoveryKey___block_invoke;
  v22[3] = &unk_24C7C1D10;
  v24 = v26;
  v25 = v28;
  v7 = v4;
  v23 = v7;
  v8 = (void *)MEMORY[0x212BA9A30](v22);
  v9 = _os_activity_create(&dword_20D7E6000, "cdp/delete-rk", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  -[CDPController daemonConn](v5, "daemonConn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  v17 = 3221225472;
  v18 = __40__CDPStateController_deleteRecoveryKey___block_invoke_3;
  v19 = &unk_24C7C10E8;
  v11 = v8;
  v20 = v11;
  objc_msgSend(v10, "daemonWithErrorHandler:", &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[CDPStateController deleteRecoveryKey:].cold.1();

  -[CDPController context](v5, "context", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v5, "uiProviderProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteRecoveryKeyWithContext:uiProvider:completion:", v14, v15, v11);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(v28, 8);
}

void __40__CDPStateController_deleteRecoveryKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "reportRecoveryKeyTaskFinishedWithSuccess:error:", a2, v5);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__CDPStateController_deleteRecoveryKey___block_invoke_2;
  v8[3] = &unk_24C7C1BF8;
  v11 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v12 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __40__CDPStateController_deleteRecoveryKey___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __40__CDPStateController_deleteRecoveryKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __40__CDPStateController_deleteRecoveryKey___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)verifyRecoveryKey:(id)a3
{
  id v4;
  CDPStateController *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  os_activity_scope_state_s state;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  CDPStateController *v29;

  v4 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  v5 = self;
  v29 = v5;
  v6 = (void *)objc_opt_new();
  v7 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __40__CDPStateController_verifyRecoveryKey___block_invoke;
  v24[3] = &unk_24C7C1C48;
  v8 = v6;
  v25 = v8;
  v27 = v28;
  v9 = v4;
  v26 = v9;
  v10 = (void *)MEMORY[0x212BA9A30](v24);
  v11 = _os_activity_create(&dword_20D7E6000, "cdp/verify-rk", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  -[CDPController daemonConn](v5, "daemonConn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v7;
  v19 = 3221225472;
  v20 = __40__CDPStateController_verifyRecoveryKey___block_invoke_3;
  v21 = &unk_24C7C10E8;
  v13 = v10;
  v22 = v13;
  objc_msgSend(v12, "daemonWithErrorHandler:", &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[CDPStateController verifyRecoveryKey:].cold.1();

  -[CDPController context](v5, "context", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v5, "uiProviderProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "verifyRecoveryKeyWithContext:uiProvider:completion:", v16, v17, v13);

  os_activity_scope_leave(&state);
  _Block_object_dispose(v28, 8);

}

void __40__CDPStateController_verifyRecoveryKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "reportRecoveryKeyTaskFinishedWithSuccess:error:", a2, v5);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__CDPStateController_verifyRecoveryKey___block_invoke_2;
  block[3] = &unk_24C7C1BF8;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v12 = a2;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __40__CDPStateController_verifyRecoveryKey___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __40__CDPStateController_verifyRecoveryKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __40__CDPStateController_verifyRecoveryKey___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)deleteRecoveryKeyWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  _QWORD v15[6];
  os_activity_scope_state_s state;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  -[CDPController daemonConn](self, "daemonConn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __49__CDPStateController_deleteRecoveryKeyWithError___block_invoke;
  v17[3] = &unk_24C7C12B0;
  v17[4] = &v18;
  objc_msgSend(v5, "synchronousDaemonWithErrorHandler:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = _os_activity_create(&dword_20D7E6000, "cdp/delete-rk", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CDPStateController deleteRecoveryKey:].cold.1();

  -[CDPController context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](self, "uiProviderProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __49__CDPStateController_deleteRecoveryKeyWithError___block_invoke_43;
  v15[3] = &unk_24C7C15F8;
  v15[4] = &v24;
  v15[5] = &v18;
  objc_msgSend(v7, "deleteRecoveryKeyWithContext:uiProvider:completion:", v10, v11, v15);

  v12 = *((unsigned __int8 *)v25 + 24);
  if (a3 && !*((_BYTE *)v25 + 24))
  {
    *a3 = objc_retainAutorelease((id)v19[5]);
    v12 = *((unsigned __int8 *)v25 + 24);
  }
  v13 = v12 != 0;
  os_activity_scope_leave(&state);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v13;
}

void __49__CDPStateController_deleteRecoveryKeyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __40__CDPStateController_deleteRecoveryKey___block_invoke_3_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __49__CDPStateController_deleteRecoveryKeyWithError___block_invoke_43(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)isRecoveryKeyAvailableWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  BOOL v12;
  _QWORD v14[6];
  os_activity_scope_state_s state;
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
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  -[CDPController daemonConn](self, "daemonConn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54__CDPStateController_isRecoveryKeyAvailableWithError___block_invoke;
  v16[3] = &unk_24C7C12B0;
  v16[4] = &v17;
  objc_msgSend(v4, "synchronousDaemonWithErrorHandler:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = _os_activity_create(&dword_20D7E6000, "cdp/rk-availability", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPStateController isRecoveryKeyAvailableWithError:].cold.2();

  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __54__CDPStateController_isRecoveryKeyAvailableWithError___block_invoke_44;
  v14[3] = &unk_24C7C15F8;
  v14[4] = &v23;
  v14[5] = &v17;
  objc_msgSend(v6, "isRecoveryKeyAvailableWithCompletion:", v14);
  v9 = (void *)v18[5];
  if (v9)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v9);
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPStateController isRecoveryKeyAvailableWithError:].cold.1();
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *((unsigned __int8 *)v24 + 24);
      *(_DWORD *)buf = 67109120;
      v28 = v11;
      _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "\"Recovery key availability - %{BOOL}d\", buf, 8u);
    }
  }

  v12 = *((_BYTE *)v24 + 24) != 0;
  os_activity_scope_leave(&state);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v12;
}

void __54__CDPStateController_isRecoveryKeyAvailableWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__CDPStateController_isRecoveryKeyAvailableWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __54__CDPStateController_isRecoveryKeyAvailableWithError___block_invoke_44(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)isRecoveryKeyAvailableWithCompletion:(id)a3
{
  id v4;
  CDPStateController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  CDPDaemonConnection *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  os_activity_scope_state_s state;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  CDPStateController *v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__3;
  v20[4] = __Block_byref_object_dispose__3;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v21 = v5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke;
  v17[3] = &unk_24C7C1C20;
  v19 = v20;
  v7 = v4;
  v18 = v7;
  v8 = (void *)MEMORY[0x212BA9A30](v17);
  v9 = _os_activity_create(&dword_20D7E6000, "cdp/rk-availability", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = objc_alloc_init(CDPDaemonConnection);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_2;
  v14[3] = &unk_24C7C10E8;
  v11 = v7;
  v15 = v11;
  -[CDPDaemonConnection daemonWithErrorHandler:](v10, "daemonWithErrorHandler:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[CDPStateController isRecoveryKeyAvailableWithError:].cold.2();

  objc_msgSend(v12, "isRecoveryKeyAvailableWithCompletion:", v8);
  os_activity_scope_leave(&state);

  _Block_object_dispose(v20, 8);
}

void __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD block[4];
  id v12;
  __int128 v13;
  char v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = a2;
    _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"Recovery key availability - %{BOOL}d\", buf, 8u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_45;
  block[3] = &unk_24C7C1BF8;
  v10 = *(_OWORD *)(a1 + 32);
  v8 = (id)v10;
  v13 = v10;
  v14 = a2;
  v12 = v5;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_45(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isWalrusRecoveryKeyAvailableWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  BOOL v12;
  _QWORD v14[6];
  os_activity_scope_state_s state;
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
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  -[CDPController daemonConn](self, "daemonConn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__CDPStateController_isWalrusRecoveryKeyAvailableWithError___block_invoke;
  v16[3] = &unk_24C7C12B0;
  v16[4] = &v17;
  objc_msgSend(v4, "synchronousDaemonWithErrorHandler:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = _os_activity_create(&dword_20D7E6000, "cdp/walrus-rk-availability", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPStateController isWalrusRecoveryKeyAvailableWithError:].cold.2();

  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __60__CDPStateController_isWalrusRecoveryKeyAvailableWithError___block_invoke_47;
  v14[3] = &unk_24C7C15F8;
  v14[4] = &v23;
  v14[5] = &v17;
  objc_msgSend(v6, "isWalrusRecoveryKeyAvailableWithCompletion:", v14);
  v9 = (void *)v18[5];
  if (v9)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v9);
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPStateController isWalrusRecoveryKeyAvailableWithError:].cold.1();
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *((unsigned __int8 *)v24 + 24);
      *(_DWORD *)buf = 67109120;
      v28 = v11;
      _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "\"Walrus Recovery key availability - %{BOOL}d\", buf, 8u);
    }
  }

  v12 = *((_BYTE *)v24 + 24) != 0;
  os_activity_scope_leave(&state);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v12;
}

void __60__CDPStateController_isWalrusRecoveryKeyAvailableWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__CDPStateController_isWalrusRecoveryKeyAvailableWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __60__CDPStateController_isWalrusRecoveryKeyAvailableWithError___block_invoke_47(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)isWalrusRecoveryKeyAvailableWithCompletion:(id)a3
{
  id v4;
  CDPStateController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  CDPDaemonConnection *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  os_activity_scope_state_s state;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  CDPStateController *v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__3;
  v20[4] = __Block_byref_object_dispose__3;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v21 = v5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke;
  v17[3] = &unk_24C7C1C20;
  v19 = v20;
  v7 = v4;
  v18 = v7;
  v8 = (void *)MEMORY[0x212BA9A30](v17);
  v9 = _os_activity_create(&dword_20D7E6000, "cdp/walrus-rk-availability", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = objc_alloc_init(CDPDaemonConnection);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_2;
  v14[3] = &unk_24C7C10E8;
  v11 = v7;
  v15 = v11;
  -[CDPDaemonConnection daemonWithErrorHandler:](v10, "daemonWithErrorHandler:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[CDPStateController isWalrusRecoveryKeyAvailableWithError:].cold.2();

  objc_msgSend(v12, "isWalrusRecoveryKeyAvailableWithCompletion:", v8);
  os_activity_scope_leave(&state);

  _Block_object_dispose(v20, 8);
}

void __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD block[4];
  id v12;
  __int128 v13;
  char v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = a2;
    _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"Walrus Recovery key availability - %{BOOL}d\", buf, 8u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_48;
  block[3] = &unk_24C7C1BF8;
  v10 = *(_OWORD *)(a1 + 32);
  v8 = (id)v10;
  v13 = v10;
  v14 = a2;
  v12 = v5;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_48(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  uint8_t buf[8];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_20D7E6000, "cdp/verify-rk-observing-systems-have-matching-state", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[CDPController daemonConn](self, "daemonConn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __82__CDPStateController_verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError___block_invoke;
  v15[3] = &unk_24C7C12B0;
  v15[4] = &v20;
  objc_msgSend(v6, "synchronousDaemonWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v9, OS_LOG_TYPE_DEFAULT, "\"Verifying all systems agree on RK state\", buf, 2u);
  }

  -[CDPController context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __82__CDPStateController_verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError___block_invoke_49;
  v13[3] = &unk_24C7C15F8;
  v13[4] = &v20;
  v13[5] = &v16;
  objc_msgSend(v8, "verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:completion:", v10, v13);

  if (a3)
    *a3 = objc_retainAutorelease((id)v21[5]);
  v11 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  os_activity_scope_leave(&state);
  return v11;
}

void __82__CDPStateController_verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke_cold_1();

}

void __82__CDPStateController_verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError___block_invoke_49(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (id)generateRandomRecoveryKey:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  -[CDPController daemonConn](self, "daemonConn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __48__CDPStateController_generateRandomRecoveryKey___block_invoke;
  v14[3] = &unk_24C7C12B0;
  v14[4] = &v15;
  objc_msgSend(v5, "synchronousDaemonWithErrorHandler:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPStateController generateNewRecoveryKey:].cold.1();

  -[CDPController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __48__CDPStateController_generateRandomRecoveryKey___block_invoke_50;
  v13[3] = &unk_24C7C1D38;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v7, "generateRandomRecoveryKeyWithContext:completion:", v9, v13);

  v10 = (void *)v22[5];
  if (a3 && !v10)
  {
    *a3 = objc_retainAutorelease((id)v16[5]);
    v10 = (void *)v22[5];
  }
  v11 = v10;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __48__CDPStateController_generateRandomRecoveryKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CDPStateController_generateNewRecoveryKey___block_invoke_3_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __48__CDPStateController_generateRandomRecoveryKey___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)handleURLActionWithInfo:(id)a3
{
  -[CDPStateController handleURLActionWithInfo:completion:](self, "handleURLActionWithInfo:completion:", a3, 0);
}

- (void)handleURLActionWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"Handling URL action: %@\", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("command"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("rejoin")))
  {
    -[CDPStateController repairCloudDataProtectionStateWithCompletion:](self, "repairCloudDataProtectionStateWithCompletion:", v7);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("offline-secret-change")))
  {
    -[CDPStateController finishOfflineLocalSecretChangeWithCompletion:](self, "finishOfflineLocalSecretChangeWithCompletion:", v7);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("regenerate")))
  {
    -[CDPStateController generateNewRecoveryKey:](self, "generateNewRecoveryKey:", v7);
  }

}

- (void)fetchEscrowRecordDevicesWithContext:(id)a3 usingCache:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  CDPStateController *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint8_t v19[8];
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  CDPStateController *v26;
  os_activity_scope_state_s state;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create(&dword_20D7E6000, "cdp/fetch-escrow-devices", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__3;
  v25[4] = __Block_byref_object_dispose__3;
  v11 = self;
  v12 = MEMORY[0x24BDAC760];
  v26 = v11;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __80__CDPStateController_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke;
  v22[3] = &unk_24C7C1D60;
  v24 = v25;
  v13 = v9;
  v23 = v13;
  v14 = (void *)MEMORY[0x212BA9A30](v22);
  -[CDPController daemonConn](v11, "daemonConn");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __80__CDPStateController_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke_3;
  v20[3] = &unk_24C7C10E8;
  v16 = v14;
  v21 = v16;
  objc_msgSend(v15, "daemonWithErrorHandler:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_20D7E6000, v18, OS_LOG_TYPE_DEFAULT, "\"Requesting list of escrow-record associated devices\", v19, 2u);
  }

  objc_msgSend(v17, "fetchEscrowRecordDevicesWithContext:usingCache:completion:", v8, v6, v16);
  _Block_object_dispose(v25, 8);

  os_activity_scope_leave(&state);
}

void __80__CDPStateController_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__CDPStateController_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke_2;
  block[3] = &unk_24C7C13D0;
  v9 = *(id *)(a1 + 32);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __80__CDPStateController_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

void __80__CDPStateController_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deviceEscrowRecordRecoverableWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CDPStateController *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[8];
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  CDPStateController *v24;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_20D7E6000, "cdp/device-escrow-record-recoverable", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__3;
  v23[4] = __Block_byref_object_dispose__3;
  v9 = self;
  v10 = MEMORY[0x24BDAC760];
  v24 = v9;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __74__CDPStateController_deviceEscrowRecordRecoverableWithContext_completion___block_invoke;
  v20[3] = &unk_24C7C1DB0;
  v22 = v23;
  v11 = v7;
  v21 = v11;
  v12 = (void *)MEMORY[0x212BA9A30](v20);
  -[CDPController daemonConn](v9, "daemonConn");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __74__CDPStateController_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_3;
  v18[3] = &unk_24C7C10E8;
  v14 = v12;
  v19 = v14;
  objc_msgSend(v13, "daemonWithErrorHandler:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_20D7E6000, v16, OS_LOG_TYPE_DEFAULT, "\"Checking for the current device's ecrow record being recoverable\", v17, 2u);
  }

  objc_msgSend(v15, "deviceEscrowRecordRecoverableWithContext:completion:", v6, v14);
  _Block_object_dispose(v23, 8);

  os_activity_scope_leave(&state);
}

void __74__CDPStateController_deviceEscrowRecordRecoverableWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__CDPStateController_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_2;
  v8[3] = &unk_24C7C1D88;
  v6 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __74__CDPStateController_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __74__CDPStateController_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isDeviceEscrowRecordRecoverable:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  CDPStateController *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = _os_activity_create(&dword_20D7E6000, "cdp/synchronous-device-escrow-record-recoverable", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__CDPStateController_isDeviceEscrowRecordRecoverable___block_invoke;
  v12[3] = &unk_24C7C1DD8;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a3;
  v6 = (void *)MEMORY[0x212BA9A30](v12);
  -[CDPController daemonConn](self, "daemonConn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousDaemonWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_20D7E6000, v9, OS_LOG_TYPE_DEFAULT, "\"%@: Checking current device's escrow record recoverability\", buf, 0xCu);
  }

  -[CDPController context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceEscrowRecordRecoverableWithContext:completion:", v10, v6);

  LOBYTE(v10) = *((_BYTE *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);
  os_activity_scope_leave(&state);

  return (char)v10;
}

void __54__CDPStateController_isDeviceEscrowRecordRecoverable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __54__CDPStateController_isDeviceEscrowRecordRecoverable___block_invoke_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 == 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) && *(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v3);

}

- (BOOL)shouldPerformSilentEscrowRecordRepairUsingCache:(BOOL)a3 error:(id *)a4
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
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[9];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  os_activity_scope_state_s state;
  uint8_t v35[4];
  _BOOL4 v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v5 = a3;
  v42 = *MEMORY[0x24BDAC8D0];
  v7 = _os_activity_create(&dword_20D7E6000, "cdp/should-perform-silent-escrow-record-repair-sync", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  _CDPSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _CDPSignpostCreate(v8);
  v11 = v10;

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ShouldPerformSilentEscrowRecordRepairSync", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _CDPSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_20D7E6000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ShouldPerformSilentEscrowRecordRepairSync  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3;
  v40 = __Block_byref_object_dispose__3;
  v41 = 0;
  v15 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke;
  v29[3] = &unk_24C7C1E00;
  v29[7] = v9;
  v29[8] = v11;
  v29[4] = self;
  v29[5] = &buf;
  v29[6] = &v30;
  v16 = (void *)MEMORY[0x212BA9A30](v29);
  -[CDPController daemonConn](self, "daemonConn");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v15;
  v25 = 3221225472;
  v26 = __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke_61;
  v27 = &unk_24C7C10E8;
  v18 = v16;
  v28 = v18;
  objc_msgSend(v17, "synchronousDaemonWithErrorHandler:", &v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v35 = 67109120;
    v36 = v5;
    _os_log_impl(&dword_20D7E6000, v20, OS_LOG_TYPE_DEFAULT, "\"Synchronously checking if silent escrow record repair should be performed (usingCache: %{BOOL}d)\", v35, 8u);
  }

  -[CDPController context](self, "context", v24, v25, v26, v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "shouldPerformSilentEscrowRecordRepairWithContext:usingCache:completion:", v21, v5, v18);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v22 = *((_BYTE *)v31 + 24) != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v30, 8);
  os_activity_scope_leave(&state);

  return v22;
}

void __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  Nanoseconds = _CDPSignpostGetNanoseconds(a1[7], a1[8]);
  _CDPSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[7];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "code");
    v19 = 67240192;
    LODWORD(v20) = v10;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "ShouldPerformSilentEscrowRecordRepairSync", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  _CDPSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = a1[7];
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "code");
    v19 = 134218496;
    v20 = v13;
    v21 = 2048;
    v22 = v12;
    v23 = 1026;
    v24 = v14;
    _os_log_impl(&dword_20D7E6000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: ShouldPerformSilentEscrowRecordRepairSync  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  _CDPLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v5)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 67109120;
    LODWORD(v20) = a2;
    _os_log_impl(&dword_20D7E6000, v16, OS_LOG_TYPE_DEFAULT, "\"Escrow record repair is needed: %{BOOL}d\", (uint8_t *)&v19, 8u);
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  v17 = *(_QWORD *)(a1[5] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v5;

}

uint64_t __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)shouldPerformSilentEscrowRecordRepairUsingCache:(BOOL)a3 completion:(id)a4
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
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  os_signpost_id_t v27;
  uint64_t v28;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v31;
  uint64_t v32;

  v4 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp/should-perform-silent-escrow-record-repair-async", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  _CDPSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _CDPSignpostCreate(v8);
  v11 = v10;

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ShouldPerformSilentEscrowRecordRepairAsync", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v31 = v9;
    _os_log_impl(&dword_20D7E6000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ShouldPerformSilentEscrowRecordRepairAsync  enableTelemetry=YES ", buf, 0xCu);
  }

  v15 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __81__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke;
  v25[3] = &unk_24C7C1E28;
  v25[4] = self;
  v27 = v9;
  v28 = v11;
  v16 = v6;
  v26 = v16;
  v17 = (void *)MEMORY[0x212BA9A30](v25);
  -[CDPController daemonConn](self, "daemonConn");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __81__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke_62;
  v23[3] = &unk_24C7C10E8;
  v19 = v17;
  v24 = v19;
  objc_msgSend(v18, "daemonWithErrorHandler:", v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v31) = v4;
    _os_log_impl(&dword_20D7E6000, v21, OS_LOG_TYPE_DEFAULT, "\"Checking if silent escrow record repair should be performed (usingCache: %{BOOL}d)\", buf, 8u);
  }

  -[CDPController context](self, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shouldPerformSilentEscrowRecordRepairWithContext:usingCache:completion:", v22, v4, v19);

  os_activity_scope_leave(&state);
}

void __81__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  _CDPSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "ShouldPerformSilentEscrowRecordRepairAsync", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _CDPSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[6];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: ShouldPerformSilentEscrowRecordRepairAsync  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v5)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 67109120;
    LODWORD(v18) = a2;
    _os_log_impl(&dword_20D7E6000, v15, OS_LOG_TYPE_DEFAULT, "\"Should perform silent escrow record repair: %{BOOL}d\", (uint8_t *)&v17, 8u);
  }

  v16 = a1[5];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __81__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startSilentEscrowRecordRepairWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  os_signpost_id_t v25;
  uint64_t v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _os_activity_create(&dword_20D7E6000, "cdp/start-silent-escrow-record-repair", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _CDPSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _CDPSignpostCreate(v6);
  v9 = v8;

  _CDPSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "StartSilentEscrowRecordRepair", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v29 = v7;
    _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StartSilentEscrowRecordRepair  enableTelemetry=YES ", buf, 0xCu);
  }

  v13 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __66__CDPStateController_startSilentEscrowRecordRepairWithCompletion___block_invoke;
  v23[3] = &unk_24C7C1E28;
  v23[4] = self;
  v25 = v7;
  v26 = v9;
  v14 = v4;
  v24 = v14;
  v15 = (void *)MEMORY[0x212BA9A30](v23);
  -[CDPController daemonConn](self, "daemonConn");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __66__CDPStateController_startSilentEscrowRecordRepairWithCompletion___block_invoke_63;
  v21[3] = &unk_24C7C10E8;
  v17 = v15;
  v22 = v17;
  objc_msgSend(v16, "daemonWithErrorHandler:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v19, OS_LOG_TYPE_DEFAULT, "\"Requesting start of silent escrow record repair...\", buf, 2u);
  }

  -[CDPController context](self, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startSilentEscrowRecordRepairWithContext:completion:", v20, v17);

  os_activity_scope_leave(&state);
}

void __66__CDPStateController_startSilentEscrowRecordRepairWithCompletion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  _CDPSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "StartSilentEscrowRecordRepair", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _CDPSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[6];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StartSilentEscrowRecordRepair  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_20D7E6000, v15, OS_LOG_TYPE_DEFAULT, "\"Successfully started silent escrow record repair\", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __66__CDPStateController_startSilentEscrowRecordRepairWithCompletion___block_invoke_cold_1();
  }

  v16 = a1[5];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __66__CDPStateController_startSilentEscrowRecordRepairWithCompletion___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performSilentEscrowRecordRepairWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  os_signpost_id_t v25;
  uint64_t v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _os_activity_create(&dword_20D7E6000, "cdp/perform-silent-escrow-record-repair", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  _CDPSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = _CDPSignpostCreate(v6);
  v9 = v8;

  _CDPSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PerformSilentEscrowRecordRepair", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v29 = v7;
    _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformSilentEscrowRecordRepair  enableTelemetry=YES ", buf, 0xCu);
  }

  v13 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __68__CDPStateController_performSilentEscrowRecordRepairWithCompletion___block_invoke;
  v23[3] = &unk_24C7C1E28;
  v23[4] = self;
  v25 = v7;
  v26 = v9;
  v14 = v4;
  v24 = v14;
  v15 = (void *)MEMORY[0x212BA9A30](v23);
  -[CDPController daemonConn](self, "daemonConn");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __68__CDPStateController_performSilentEscrowRecordRepairWithCompletion___block_invoke_64;
  v21[3] = &unk_24C7C10E8;
  v17 = v15;
  v22 = v17;
  objc_msgSend(v16, "daemonWithErrorHandler:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v19, OS_LOG_TYPE_DEFAULT, "\"Performing silent escrow record repair...\", buf, 2u);
  }

  -[CDPController context](self, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performSilentEscrowRecordRepairWithContext:completion:", v20, v17);

  os_activity_scope_leave(&state);
}

void __68__CDPStateController_performSilentEscrowRecordRepairWithCompletion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  Nanoseconds = _CDPSignpostGetNanoseconds(a1[6], a1[7]);
  _CDPSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 67240192;
    LODWORD(v18) = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PerformSilentEscrowRecordRepair", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 8u);
  }

  _CDPSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[6];
    v13 = objc_msgSend(v5, "code");
    v17 = 134218496;
    v18 = v12;
    v19 = 2048;
    v20 = v11;
    v21 = 1026;
    v22 = v13;
    _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformSilentEscrowRecordRepair  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v17, 0x1Cu);
  }

  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_20D7E6000, v15, OS_LOG_TYPE_DEFAULT, "\"Successfully performed silent escrow record repair\", (uint8_t *)&v17, 2u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __68__CDPStateController_performSilentEscrowRecordRepairWithCompletion___block_invoke_cold_1();
  }

  v16 = a1[5];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __68__CDPStateController_performSilentEscrowRecordRepairWithCompletion___block_invoke_64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)updateLastSilentEscrowRecordRepairAttemptDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp/update-last-silent-escrow-record-repair-attempt-date", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v8 = MEMORY[0x24BDAC760];
  v30 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __74__CDPStateController_updateLastSilentEscrowRecordRepairAttemptDate_error___block_invoke;
  v21[3] = &unk_24C7C1E50;
  v21[4] = self;
  v9 = v6;
  v22 = v9;
  v23 = &v31;
  v24 = &v25;
  v10 = (void *)MEMORY[0x212BA9A30](v21);
  -[CDPController daemonConn](self, "daemonConn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __74__CDPStateController_updateLastSilentEscrowRecordRepairAttemptDate_error___block_invoke_65;
  v19[3] = &unk_24C7C10E8;
  v12 = v10;
  v20 = v12;
  objc_msgSend(v11, "synchronousDaemonWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v9;
    _os_log_impl(&dword_20D7E6000, v14, OS_LOG_TYPE_DEFAULT, "\"Requesting update of silent escrow record repair attempt date to %@...\", buf, 0xCu);
  }

  -[CDPController context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateLastSilentEscrowRecordRepairAttemptDate:context:completion:", v9, v15, v12);

  v16 = *((unsigned __int8 *)v32 + 24);
  if (a4 && !*((_BYTE *)v32 + 24))
  {
    *a4 = objc_retainAutorelease((id)v26[5]);
    v16 = *((unsigned __int8 *)v32 + 24);
  }
  v17 = v16 != 0;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  os_activity_scope_leave(&state);

  return v17;
}

void __74__CDPStateController_updateLastSilentEscrowRecordRepairAttemptDate_error___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[5];
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"Successfully updated last silent escrow record repair attempt date to %@\", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __74__CDPStateController_updateLastSilentEscrowRecordRepairAttemptDate_error___block_invoke_cold_1();
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

uint64_t __74__CDPStateController_updateLastSilentEscrowRecordRepairAttemptDate_error___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setKeyChainSyncCompatibilityState:(unint64_t)a3 withAltDSID:(id)a4
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
  void *v16;
  NSObject *v17;
  unint64_t Nanoseconds;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  os_activity_scope_state_s v22;
  uint8_t buf[4];
  os_signpost_id_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp/sos-compatibility-state-updated", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v22.opaque[0] = 0;
  v22.opaque[1] = 0;
  os_activity_scope_enter(v7, &v22);
  _CDPSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _CDPSignpostCreate(v8);
  v11 = v10;

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SetKeyChainSyncCompatibilityState", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = v9;
    _os_log_impl(&dword_20D7E6000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetKeyChainSyncCompatibilityState  enableTelemetry=YES ", buf, 0xCu);
  }

  -[CDPController daemonConn](self, "daemonConn");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "daemonWithErrorHandler:", &__block_literal_global_66);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v17, OS_LOG_TYPE_DEFAULT, "\"Requesting setKeyChainSyncCompatibilityState\", buf, 2u);
  }

  objc_msgSend(v16, "setKeyChainSyncCompatibilityState:withAltDSID:", a3, v6);
  Nanoseconds = _CDPSignpostGetNanoseconds(v9, v11);
  _CDPSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v24) = a3;
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v20, OS_SIGNPOST_INTERVAL_END, v9, "SetKeyChainSyncCompatibilityState", " sosCompatibilityType=%{public,signpost.telemetry:number1,name=sosCompatibilityType}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v24 = v9;
    v25 = 2048;
    v26 = (double)Nanoseconds / 1000000000.0;
    v27 = 1026;
    v28 = a3;
    _os_log_impl(&dword_20D7E6000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetKeyChainSyncCompatibilityState  sosCompatibilityType=%{public,signpost.telemetry:number1,name=sosCompatibilityType}d ", buf, 0x1Cu);
  }

  os_activity_scope_leave(&v22);
}

void __68__CDPStateController_setKeyChainSyncCompatibilityState_withAltDSID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_30_cold_1();

}

void __68__CDPStateController__handleCloudDataProtectionStateWithCompletion___block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while starting state machine: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __67__CDPStateController_repairCloudDataProtectionStateWithCompletion___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while repairing state: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __59__CDPStateController_startCircleApplicationApprovalServer___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while accepting sharing session: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __58__CDPStateController_attemptToEscrowPreRecord_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while attempting to escrow preRecord: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Processing Local Secret Change failed: %@. Attempting one retry.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_31_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Retrying Local Secret Change failed: %@.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __65__CDPStateController_localSecretChangedTo_secretType_completion___block_invoke_32_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while updating local secret: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __68__CDPStateController_finishCyrusFlowAfterTermsAgreementWithContext___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while finishing Cyrus secure terms flow: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __68__CDPStateController_shouldPerformRepairWithOptionForceFetch_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while checking recovery existence: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __73__CDPStateController_shouldPerformRepairWithOptionForceFetch_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to get remote object proxy for CDP daemon: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __81__CDPStateController_shouldPerformAuthenticatedRepairWithOptionForceFetch_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while checking authenticated repair state: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __70__CDPStateController_generateEscrowRecordReportUsingCache_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to generate escrow record report: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Attempting to authenticate and then generate a recovery key\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_10_1();
}

void __74__CDPStateController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_38_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC error while authenticating and then generating a recovery key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)generateNewRecoveryKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Attempting to generate a new recovery key\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __45__CDPStateController_generateNewRecoveryKey___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while generating a recovery key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)authenticateAndDeleteRecoveryKeyWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Attempting to authenticate and then delete recovery key\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __69__CDPStateController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_40_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC error while authenticating and then deleting a recovery key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)deleteRecoveryKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Attempting to delete a recovery key\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __40__CDPStateController_deleteRecoveryKey___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while deleting a recovery key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)verifyRecoveryKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Attempting to verify the recovery key\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __40__CDPStateController_verifyRecoveryKey___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while verifying a recovery key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)isRecoveryKeyAvailableWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to fetch recovery key availability with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)isRecoveryKeyAvailableWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Attempting to fetch recovery key state\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __54__CDPStateController_isRecoveryKeyAvailableWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while fetching recovery key state: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to fetch recovery key availability with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __59__CDPStateController_isRecoveryKeyAvailableWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_16(&dword_20D7E6000, v0, v1, "\"XPC Error while fetching recovery key availability.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)isWalrusRecoveryKeyAvailableWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to fetch walrus recovery key availability with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)isWalrusRecoveryKeyAvailableWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Attempting to fetch walrus recovery key state\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __60__CDPStateController_isWalrusRecoveryKeyAvailableWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while fetching walrus recovery key state: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to walrus fetch recovery key availability with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __65__CDPStateController_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_16(&dword_20D7E6000, v0, v1, "\"XPC Error while fetching walrus recovery key availability.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __54__CDPStateController_isDeviceEscrowRecordRecoverable___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_1();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_20D7E6000, v1, OS_LOG_TYPE_ERROR, "\"%@: Failed to find recoverable escrow record for current device with error (%@)\", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

void __76__CDPStateController_shouldPerformSilentEscrowRecordRepairUsingCache_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to check if escrow record repair is needed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __66__CDPStateController_startSilentEscrowRecordRepairWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to start silent escrow record repair: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __68__CDPStateController_performSilentEscrowRecordRepairWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to perform silent escrow record repair: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __74__CDPStateController_updateLastSilentEscrowRecordRepairAttemptDate_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to update last silent escrow record repair attempt date: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
