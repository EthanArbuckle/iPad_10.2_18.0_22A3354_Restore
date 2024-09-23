@implementation SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier

void __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id *v7;
  id v8;
  id *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_2;
    v11[3] = &unk_24D3BC448;
    v7 = &v12;
    v8 = v6;
    v12 = v8;
    v9 = &v13;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(a2, "getSockPuppetAppRunningStatusForCompanionAppWithIdentifier:completion:", v8, v11);
  }
  else
  {
    wk_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_cold_1();

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_103;
    v14[3] = &unk_24D3BC330;
    v7 = &v16;
    v16 = *(id *)(a1 + 40);
    v9 = &v15;
    v15 = v5;
    spUtils_dispatchSyncToMainThread(v14);
  }

}

uint64_t __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_103(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v5 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_3;
  v7[3] = &unk_24D3BC420;
  v8 = v5;
  v11 = a3;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v6 = v5;
  spUtils_dispatchSyncToMainThread(v7);

}

uint64_t __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  wk_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_3_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 136446978;
    v9 = "SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_3";
    v10 = 1024;
    v11 = 275;
    v12 = 1024;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_215918000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Successfully got app running status=%d for WatchKit app for companionAppIdentifier %{public}@", (uint8_t *)&v8, 0x22u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: Got error from getXcodeSupportRemoteObjectProxy(): %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  v2 = 136446978;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: Got error getting app running status for WatchKit app for companionAppIdentifier %{public}@: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

@end
