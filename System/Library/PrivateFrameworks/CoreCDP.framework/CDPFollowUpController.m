@implementation CDPFollowUpController

- (CDPFollowUpController)init
{
  CDPFollowUpController *v2;
  CDPDaemonConnection *v3;
  CDPDaemonConnection *daemonConn;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPFollowUpController;
  v2 = -[CDPFollowUpController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CDPDaemonConnection);
    daemonConn = v2->_daemonConn;
    v2->_daemonConn = v3;

  }
  return v2;
}

- (BOOL)postFollowUpWithContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  CDPDaemonConnection *daemonConn;
  void *v10;
  char v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp: post follow up", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v8 = MEMORY[0x24BDAC760];
  daemonConn = self->_daemonConn;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__CDPFollowUpController_postFollowUpWithContext_error___block_invoke;
  v14[3] = &unk_24C7C12B0;
  v14[4] = &v19;
  -[CDPDaemonConnection synchronousDaemonWithErrorHandler:](daemonConn, "synchronousDaemonWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __55__CDPFollowUpController_postFollowUpWithContext_error___block_invoke_12;
  v13[3] = &unk_24C7C15F8;
  v13[4] = &v15;
  v13[5] = &v19;
  objc_msgSend(v10, "postFollowUpWithContext:completion:", v6, v13);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v11 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  os_activity_scope_leave(&state);
  return v11;
}

void __55__CDPFollowUpController_postFollowUpWithContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __55__CDPFollowUpController_postFollowUpWithContext_error___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

void __55__CDPFollowUpController_postFollowUpWithContext_error___block_invoke_12(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"Posted follow ups (%{BOOL}d) with error: %@\", (uint8_t *)v9, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (BOOL)clearFollowUpWithContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  CDPDaemonConnection *daemonConn;
  void *v10;
  char v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp: clear follow up", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v8 = MEMORY[0x24BDAC760];
  daemonConn = self->_daemonConn;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__CDPFollowUpController_clearFollowUpWithContext_error___block_invoke;
  v14[3] = &unk_24C7C12B0;
  v14[4] = &v19;
  -[CDPDaemonConnection synchronousDaemonWithErrorHandler:](daemonConn, "synchronousDaemonWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __56__CDPFollowUpController_clearFollowUpWithContext_error___block_invoke_14;
  v13[3] = &unk_24C7C15F8;
  v13[4] = &v15;
  v13[5] = &v19;
  objc_msgSend(v10, "clearFollowUpWithContext:completion:", v6, v13);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v11 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  os_activity_scope_leave(&state);
  return v11;
}

void __56__CDPFollowUpController_clearFollowUpWithContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __56__CDPFollowUpController_clearFollowUpWithContext_error___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

void __56__CDPFollowUpController_clearFollowUpWithContext_error___block_invoke_14(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_20D7E6000, v6, OS_LOG_TYPE_DEFAULT, "\"Cleared follow ups (%{BOOL}d) with error: %@\", (uint8_t *)v9, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (void)dealloc
{
  objc_super v3;

  -[CDPFollowUpController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CDPFollowUpController;
  -[CDPFollowUpController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D7E6000, log, OS_LOG_TYPE_DEBUG, "\"Invalidating connection\", v1, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConn, 0);
}

void __55__CDPFollowUpController_postFollowUpWithContext_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"XPC Error posting a follow up: %@\", a5, a6, a7, a8, 2u);
}

void __56__CDPFollowUpController_clearFollowUpWithContext_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"XPC Error cleaning up follow ups: %@\", a5, a6, a7, a8, 2u);
}

@end
