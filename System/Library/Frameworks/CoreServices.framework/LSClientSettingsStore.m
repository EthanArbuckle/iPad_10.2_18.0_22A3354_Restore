@implementation LSClientSettingsStore

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v9 = 0;
  objc_msgSend(v2, "__internalQueue_xpcConnectionWithError:", &v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;

}

void __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _LSExtensionsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_cold_1((uint64_t)v7, objc_msgSend(v3, "code"), v4);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
  }
  else
  {
    _LSExtensionsLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_cold_1((uint64_t)v9, objc_msgSend(v7, "code"), v8);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

void __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_197(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _LSExtensionsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2_cold_1();

}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_198(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    _LSExtensionsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_198_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v9 = 0;
  objc_msgSend(v2, "__internalQueue_xpcConnectionWithError:", &v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;

}

void __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  _LSExtensionsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

void __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke_200(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  char v6;

  v4 = a2;
  if (v4)
  {
    _LSExtensionsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;

}

void __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v9 = 0;
  objc_msgSend(v2, "__internalQueue_xpcConnectionWithError:", &v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;

}

void __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  _LSExtensionsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_201(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  char v6;

  v4 = a2;
  if (v4)
  {
    _LSExtensionsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;

}

void __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_5(&dword_182882000, a3, (uint64_t)a3, "Failed to get settings store from 'lsd' with error code: %ld", (uint8_t *)a1);
}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Failed to set user election for key '%@' error: %@");
  OUTLINED_FUNCTION_1();
}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_198_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Failed to retrieve user election for key '%@' error: %@");
  OUTLINED_FUNCTION_1();
}

void __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5(&dword_182882000, v0, v1, "Failed to reset user elections error: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
