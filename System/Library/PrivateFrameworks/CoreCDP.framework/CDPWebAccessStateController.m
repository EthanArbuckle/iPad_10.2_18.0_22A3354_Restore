@implementation CDPWebAccessStateController

- (void)webAccessStatusWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  CDPDaemonConnection *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v3 = a3;
  v4 = _os_activity_create(&dword_20D7E6000, "Web access: Fetching status.", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  v5 = objc_alloc_init(CDPDaemonConnection);
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke;
  v12[3] = &unk_24C7C10E8;
  v7 = v3;
  v13 = v7;
  -[CDPDaemonConnection daemonWithErrorHandler:](v5, "daemonWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_12;
  v10[3] = &unk_24C7C1288;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "webAccessStatusWithCompletion:", v10);

  os_activity_scope_leave(&state);
}

void __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_12_cold_1((uint64_t)v5, v7, v8);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = a2;
      _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"Web access status - %lu\", (uint8_t *)&v9, 0xCu);
    }

    +[CDPWebAccessNotificationHandler sharedInstance](CDPWebAccessNotificationHandler, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject startObservingWebAccessStateChangeNotification](v7, "startObservingWebAccessStateChangeNotification");
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)webAccessStatus:(id *)a3
{
  NSObject *v4;
  CDPDaemonConnection *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  os_activity_scope_state_s state;

  v4 = _os_activity_create(&dword_20D7E6000, "Web access: Fetching status.", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v5 = objc_alloc_init(CDPDaemonConnection);
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__CDPWebAccessStateController_webAccessStatus___block_invoke;
  v11[3] = &unk_24C7C12B0;
  v11[4] = &v12;
  -[CDPDaemonConnection synchronousDaemonWithErrorHandler:](v5, "synchronousDaemonWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __47__CDPWebAccessStateController_webAccessStatus___block_invoke_15;
  v10[3] = &unk_24C7C12D8;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend(v7, "webAccessStatusWithCompletion:", v10);
  if (a3)
    *a3 = objc_retainAutorelease((id)v13[5]);
  v8 = v19[3];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  os_activity_scope_leave(&state);

  return v8;
}

void __47__CDPWebAccessStateController_webAccessStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void __47__CDPWebAccessStateController_webAccessStatus___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __47__CDPWebAccessStateController_webAccessStatus___block_invoke_15_cold_1((uint64_t)v6, v7, v8);
  }
  else
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = a2;
      _os_log_impl(&dword_20D7E6000, v9, OS_LOG_TYPE_DEFAULT, "\"Web access status - %lu\", (uint8_t *)&v10, 0xCu);
    }

    +[CDPWebAccessNotificationHandler sharedInstance](CDPWebAccessNotificationHandler, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject startObservingWebAccessStateChangeNotification](v7, "startObservingWebAccessStateChangeNotification");
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (void)updateWebAccessStatus:(unint64_t)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  CDPDaemonConnection *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  os_activity_scope_state_s state;

  v5 = a4;
  v6 = _os_activity_create(&dword_20D7E6000, "Web access: Updating status", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = objc_alloc_init(CDPDaemonConnection);
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke;
  v14[3] = &unk_24C7C10E8;
  v9 = v5;
  v15 = v9;
  -[CDPDaemonConnection daemonWithErrorHandler:](v7, "daemonWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke_16;
  v12[3] = &unk_24C7C10E8;
  v11 = v9;
  v13 = v11;
  objc_msgSend(v10, "updateWebAccessStatus:completion:", a3, v12);

  os_activity_scope_leave(&state);
}

void __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke_16_cold_1(v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Web access status update has been completed successfully.\", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_16(&dword_20D7E6000, a1, a3, "\"XPC Error while fetching web access status.\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __61__CDPWebAccessStateController_webAccessStatusWithCompletion___block_invoke_12_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_20D7E6000, a2, a3, "\"Failed to fetch web access status with error: %@\", (uint8_t *)&v3);
}

void __47__CDPWebAccessStateController_webAccessStatus___block_invoke_15_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_20D7E6000, a2, a3, "\"Failed to fetch web access status with error - %@\", (uint8_t *)&v3);
}

void __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_16(&dword_20D7E6000, a1, a3, "\"XPC Error while updating web access status.\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __64__CDPWebAccessStateController_updateWebAccessStatus_completion___block_invoke_16_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_20D7E6000, a2, v4, "\"Failed to update web access status with error %@\", (uint8_t *)&v5);

}

@end
