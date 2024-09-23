@implementation CDPRecoveryController

- (void)performRecovery:(id)a3
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
  CDPRecoveryController *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[4];
  id v34;
  __int128 *p_buf;
  os_signpost_id_t v36;
  uint64_t v37;
  os_activity_scope_state_s state;
  uint8_t v39[4];
  CDPRecoveryController *v40;
  __int16 v41;
  void *v42;
  __int128 buf;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  CDPRecoveryController *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _os_activity_create(&dword_20D7E6000, "cdp: recovery flow", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
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
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "NativeAccountRecovery", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_20D7E6000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: NativeAccountRecovery  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4;
  v46 = __Block_byref_object_dispose__4;
  v13 = self;
  v47 = v13;
  v14 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __41__CDPRecoveryController_performRecovery___block_invoke;
  v33[3] = &unk_24C7C1ED8;
  v36 = v7;
  v37 = v9;
  p_buf = &buf;
  v15 = v4;
  v34 = v15;
  v16 = (void *)MEMORY[0x212BA9A30](v33);
  -[CDPController daemonConn](v13, "daemonConn");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v14;
  v31[1] = 3221225472;
  v31[2] = __41__CDPRecoveryController_performRecovery___block_invoke_2;
  v31[3] = &unk_24C7C0F80;
  v31[4] = v13;
  v18 = v16;
  v32 = v18;
  objc_msgSend(v17, "daemonWithErrorHandler:", v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystemAnalytics();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    -[CDPController context](v13, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "telemetryFlowID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v39 = 138412546;
    v40 = v13;
    v41 = 2112;
    v42 = v28;
    _os_log_debug_impl(&dword_20D7E6000, v20, OS_LOG_TYPE_DEBUG, "%@: setting context type to be CDPContextTypeAccountRecovery with flowID=%@", v39, 0x16u);

  }
  -[CDPController context](v13, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setType:", 11);

  -[CDPController context](v13, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController uiProviderProxy](v13, "uiProviderProxy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPController authProvider](v13, "authProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDPAuthProviderProxy proxyWithAuthProvider:](CDPAuthProviderProxy, "proxyWithAuthProvider:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v14;
  v29[1] = 3221225472;
  v29[2] = __41__CDPRecoveryController_performRecovery___block_invoke_21;
  v29[3] = &unk_24C7C13A0;
  v29[4] = v13;
  v26 = v18;
  v30 = v26;
  objc_msgSend(v19, "performRecoveryWithContext:uiProvider:authProvider:completion:", v22, v23, v25, v29);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

}

void __41__CDPRecoveryController_performRecovery___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v15;
  id v16;
  id v17;
  __int128 v18;
  _QWORD block[4];
  id v20;
  id v21;
  __int128 v22;
  uint8_t buf[4];
  _BYTE v24[10];
  double v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  Nanoseconds = _CDPSignpostGetNanoseconds(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  _CDPSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v24 = v5 != 0;
    *(_WORD *)&v24[4] = 1026;
    *(_DWORD *)&v24[6] = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_20D7E6000, v9, OS_SIGNPOST_INTERVAL_END, v10, "NativeAccountRecovery", " result != nil=%{public,signpost.telemetry:number1,name=result != nil}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }

  _CDPSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = *(_QWORD *)(a1 + 48);
    v14 = objc_msgSend(v6, "code");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v24 = v13;
    *(_WORD *)&v24[8] = 2048;
    v25 = v12;
    v26 = 1026;
    v27 = v5 != 0;
    v28 = 1026;
    v29 = v14;
    _os_log_impl(&dword_20D7E6000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: NativeAccountRecovery  result != nil=%{public,signpost.telemetry:number1,name=result != nil}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__CDPRecoveryController_performRecovery___block_invoke_17;
  block[3] = &unk_24C7C1EB0;
  v18 = *(_OWORD *)(a1 + 32);
  v15 = (id)v18;
  v22 = v18;
  v20 = v5;
  v21 = v6;
  v16 = v6;
  v17 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __41__CDPRecoveryController_performRecovery___block_invoke_17(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1[7] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

void __41__CDPRecoveryController_performRecovery___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sanitizedRecoveryErrorWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __41__CDPRecoveryController_performRecovery___block_invoke_2_cold_1((uint64_t)v3, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __41__CDPRecoveryController_performRecovery___block_invoke_21(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_sanitizedRecoveryErrorWithError:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_sanitizedRecoveryErrorWithError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "domain"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("CDPStateError")),
        v5,
        !v6))
  {
    v10 = *MEMORY[0x24BDD1398];
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPStateError(-5200, (uint64_t)v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

void __41__CDPRecoveryController_performRecovery___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_ERROR, "\"XPC Error while recovering data: %@\", (uint8_t *)&v2, 0xCu);
}

@end
