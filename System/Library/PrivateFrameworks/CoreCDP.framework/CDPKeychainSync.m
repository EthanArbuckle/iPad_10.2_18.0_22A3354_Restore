@implementation CDPKeychainSync

+ (BOOL)isUserVisibleKeychainSyncEnabled
{
  NSObject *v2;
  CDPDaemonConnection *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[5];
  uint8_t buf[8];
  uint8_t *v10;
  uint64_t v11;
  char v12;
  os_activity_scope_state_s state;

  v2 = _os_activity_create(&dword_20D7E6000, "cdp: Keychain Status Check", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  v3 = objc_alloc_init(CDPDaemonConnection);
  -[CDPDaemonConnection synchronousDaemonWithErrorHandler:](v3, "synchronousDaemonWithErrorHandler:", &__block_literal_global_9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Checking user-visible keychain sync status\", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v10 = buf;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__CDPKeychainSync_isUserVisibleKeychainSyncEnabled__block_invoke_12;
  v8[3] = &unk_24C7C18A8;
  v8[4] = buf;
  objc_msgSend(v4, "isUserVisibleKeychainSyncEnabledWithCompletion:", v8);
  -[CDPDaemonConnection connection](v3, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  LOBYTE(v6) = v10[24];
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);
  return (char)v6;
}

void __51__CDPKeychainSync_isUserVisibleKeychainSyncEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __51__CDPKeychainSync_isUserVisibleKeychainSyncEnabled__block_invoke_cold_1();

}

void __51__CDPKeychainSync_isUserVisibleKeychainSyncEnabled__block_invoke_12(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("DISABLED");
    if (a2)
      v5 = CFSTR("ENABLED");
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"User-visible keychain sync status is %@\", (uint8_t *)&v6, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

+ (void)setUserVisibleKeychainSyncEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  CDPDaemonConnection *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  id v13;
  CDPDaemonConnection *v14;
  _QWORD v15[4];
  CDPDaemonConnection *v16;
  id v17;
  BOOL v18;
  _QWORD v19[4];
  id v20;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = _os_activity_create(&dword_20D7E6000, "cdp: Keychain Status Change", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = objc_alloc_init(CDPDaemonConnection);
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke;
  v19[3] = &unk_24C7C10E8;
  v9 = v5;
  v20 = v9;
  -[CDPDaemonConnection daemonWithErrorHandler:](v7, "daemonWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("DISABLED");
    if (v4)
      v12 = CFSTR("ENABLED");
    *(_DWORD *)buf = 138412290;
    v23 = v12;
    _os_log_impl(&dword_20D7E6000, v11, OS_LOG_TYPE_DEFAULT, "\"Setting user-visible keychain sync to %@\", buf, 0xCu);
  }

  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_18;
  v15[3] = &unk_24C7C18F8;
  v18 = v4;
  v13 = v9;
  v17 = v13;
  v14 = v7;
  v16 = v14;
  objc_msgSend(v10, "setUserVisibleKeychainSyncEnabled:withCompletion:", v4, v15);

  os_activity_scope_leave(&state);
}

void __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__CDPKeychainSync_isUserVisibleKeychainSyncEnabled__block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_18(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  char v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 48))
        v8 = CFSTR("ENABLED");
      else
        v8 = CFSTR("DISABLED");
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"User-visibile keychain sync set to %@\", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_18_cold_1(a1, (uint64_t)v5, v7);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_19;
  v11[3] = &unk_24C7C18D0;
  v9 = *(id *)(a1 + 40);
  v15 = a2;
  v14 = v9;
  v12 = v5;
  v13 = *(id *)(a1 + 32);
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_19(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

+ (void)removeNonViewAwarePeersFromCircleWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  CDPDaemonConnection *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  CDPDaemonConnection *v14;
  _QWORD v15[4];
  CDPDaemonConnection *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp: Remove Legacy Peers", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = objc_alloc_init(CDPDaemonConnection);
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke;
  v18[3] = &unk_24C7C10E8;
  v10 = v6;
  v19 = v10;
  -[CDPDaemonConnection daemonWithErrorHandler:](v8, "daemonWithErrorHandler:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[CDPKeychainSync removeNonViewAwarePeersFromCircleWithContext:completion:].cold.1();

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_22;
  v15[3] = &unk_24C7C1920;
  v13 = v10;
  v17 = v13;
  v14 = v8;
  v16 = v14;
  objc_msgSend(v11, "removeNonViewAwarePeersFromCircleWithContext:completion:", v5, v15);

  os_activity_scope_leave(&state);
}

void __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_22(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_22_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_22_cold_2();
  }

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_23;
  v10[3] = &unk_24C7C18D0;
  v8 = *(id *)(a1 + 40);
  v14 = a2;
  v13 = v8;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

void __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_23(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

+ (void)synchronizeKeychainSyncForContext:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  CDPDaemonConnection *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  CDPDaemonConnection *v14;
  _QWORD v15[4];
  CDPDaemonConnection *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_20D7E6000, "cdp: Synchronize Keychain State", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = objc_alloc_init(CDPDaemonConnection);
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke;
  v18[3] = &unk_24C7C10E8;
  v10 = v6;
  v19 = v10;
  -[CDPDaemonConnection daemonWithErrorHandler:](v8, "daemonWithErrorHandler:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[CDPKeychainSync removeNonViewAwarePeersFromCircleWithContext:completion:].cold.1();

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_24;
  v15[3] = &unk_24C7C1920;
  v13 = v10;
  v17 = v13;
  v14 = v8;
  v16 = v14;
  objc_msgSend(v11, "synchronizeUserVisibleKeychainSyncEligibilityForContext:completion:", v5, v15);

  os_activity_scope_leave(&state);
}

void __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_24(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_24_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_24_cold_2();
  }

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_25;
  v10[3] = &unk_24C7C18D0;
  v8 = *(id *)(a1 + 40);
  v14 = a2;
  v13 = v8;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

void __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_25(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

void __51__CDPKeychainSync_isUserVisibleKeychainSyncEnabled__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while checking if user-visible keychain sync is enabled: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_18_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("ENABLED");
  if (!*(_BYTE *)(a1 + 48))
    v3 = CFSTR("DISABLED");
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_20D7E6000, log, OS_LOG_TYPE_ERROR, "\"Failed to set user-visibile keychain sync set to %@: %@\", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_5();
}

+ (void)removeNonViewAwarePeersFromCircleWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Removing non-view-aware peers from the circle\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while remove non-view-aware peers: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_22_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Successfully removed non-view-aware peers from the circle\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_22_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to remove non-view-aware peers from the circle: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while synchronizing keychain state: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Successfully synchronized keychain state\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_24_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"Failed to synchronize keychain state with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
