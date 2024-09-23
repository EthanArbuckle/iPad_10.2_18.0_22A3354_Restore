@implementation SPTerminateSockPuppetAppForCompanionAppWithIdentifier

void __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a3;
  if (a2)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_102;
    v9[3] = &unk_24D3BC308;
    v6 = &v10;
    v7 = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "terminateSockPuppetAppForCompanionAppWithIdentifier:completion:", v7, v9);
  }
  else
  {
    wk_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_cold_1();

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_101;
    v11[3] = &unk_24D3BC3D0;
    v6 = &v12;
    v12 = v5;
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    spUtils_dispatchSyncToMainThread(v11);

  }
}

uint64_t __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_101(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  wk_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_101_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[5];
    v7 = 136446722;
    v8 = "SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke";
    v9 = 1024;
    v10 = 246;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_215918000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Successfully terminated WatchKit app for companionAppIdentifier %{public}@", (uint8_t *)&v7, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_102(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_2;
  v6[3] = &unk_24D3BC330;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  spUtils_dispatchSyncToMainThread(v6);

}

uint64_t __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_cold_1()
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

void __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke_101_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  v2 = 136446978;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: Got error terminating WatchKit app for companionAppIdentifier %{public}@: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

@end
