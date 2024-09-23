@implementation SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier

void __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
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
    v11[2] = __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_2;
    v11[3] = &unk_24D3BC4E8;
    v7 = &v12;
    v8 = v6;
    v12 = v8;
    v9 = &v13;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(a2, "xcodeWillInstallSockPuppetAppWithCompanionAppIdentifier:completion:", v8, v11);
  }
  else
  {
    wk_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_cold_1();

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_107;
    v14[3] = &unk_24D3BC330;
    v7 = &v16;
    v16 = *(id *)(a1 + 40);
    v9 = &v15;
    v15 = v5;
    spUtils_dispatchSyncToMainThread(v14);
  }

}

uint64_t __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_107(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_3;
  v5[3] = &unk_24D3BC3D0;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  spUtils_dispatchSyncToMainThread(v5);

}

uint64_t __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_3(_QWORD *a1)
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
      __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_3_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[5];
    v7 = 136446722;
    v8 = "SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_3";
    v9 = 1024;
    v10 = 321;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_215918000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Successfully handled willInstall for WatchKit app for companionAppIdentifier %{public}@", (uint8_t *)&v7, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_cold_1()
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

void __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  v2 = 136446978;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_215918000, v0, v1, "%{public}s:%d: Got error handling willInstall for WatchKit app for companionAppIdentifier %{public}@: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

@end
