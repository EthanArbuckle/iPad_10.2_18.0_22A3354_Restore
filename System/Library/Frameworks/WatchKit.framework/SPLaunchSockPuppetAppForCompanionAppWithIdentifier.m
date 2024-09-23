@implementation SPLaunchSockPuppetAppForCompanionAppWithIdentifier

void __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  int v17;
  __CFString *v18;
  __CFString *v19;
  BOOL v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v24 = v6;
    if (SPHoldCompanionExtensionProcessAssertion_block_invoke_onceToken != -1)
      dispatch_once(&SPHoldCompanionExtensionProcessAssertion_block_invoke_onceToken, &__block_literal_global_4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend((id)SPHoldCompanionExtensionProcessAssertion_block_invoke_sOptionsTranslations, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend((id)SPHoldCompanionExtensionProcessAssertion_block_invoke_sKeysToLeaveValuesUntranslated, "containsObject:", v13))
          {
            v16 = v15;
          }
          else if (objc_msgSend((id)SPHoldCompanionExtensionProcessAssertion_block_invoke_sKeysWithBoolValues, "containsObject:", v13))
          {
            v17 = objc_msgSend(v15, "BOOLValue");
            v18 = CFSTR("NO");
            if (v17)
              v18 = CFSTR("YES");
            v16 = v18;
          }
          else
          {
            objc_msgSend((id)SPHoldCompanionExtensionProcessAssertion_block_invoke_sOptionsTranslations, "objectForKeyedSubscript:", v15);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          v19 = v16;
          if (v14)
            v20 = v16 == 0;
          else
            v20 = 1;
          if (!v20)
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v16, v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v10);
    }

    v21 = *(void **)(a1 + 40);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_3;
    v27[3] = &unk_24D3BC380;
    v28 = v21;
    v29 = *(id *)(a1 + 32);
    v30 = *(id *)(a1 + 48);
    v22 = v26;
    objc_msgSend(v5, "launchSockPuppetAppForCompanionAppWithIdentifier:options:completion:", v28, v26, v27);

    v7 = v25;
  }
  else
  {
    wk_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_cold_1();

    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_91;
    v35[3] = &unk_24D3BC330;
    v37 = *(id *)(a1 + 48);
    v36 = v7;
    spUtils_dispatchSyncToMainThread(v35);

    v22 = v37;
  }

}

uint64_t __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_91(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];
  const __CFString *v7;
  _QWORD v8[10];
  _QWORD v9[11];

  v9[10] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("SPXcodeSupportAppLaunchModeKey");
  v8[1] = CFSTR("SPXcodeSupportAppLaunchModeValueGlance");
  v9[0] = CFSTR("WK_APP_LAUNCH_MODE");
  v9[1] = CFSTR("GLANCE");
  v8[2] = CFSTR("SPXcodeSupportAppLaunchModeValueComplication");
  v8[3] = CFSTR("SPXcodeSupportAppLaunchModeValueNotification");
  v9[2] = CFSTR("COMPLICATION");
  v9[3] = CFSTR("NOTIFICATION");
  v8[4] = CFSTR("SPXcodeSupportAppLaunchModeNotificationRemotePayloadKey");
  v8[5] = CFSTR("SPXcodeSupportAppLaunchModeNotificationForceStaticPresentationKey");
  v9[4] = CFSTR("WK_NOTIF_CONTEXT");
  v9[5] = CFSTR("WK_NOTIF_FORCE_STATIC");
  v8[6] = CFSTR("SPDeviceBacklightAssertionTime");
  v8[7] = CFSTR("SPHoldCompanionExtensionProcessAssertion");
  v9[6] = CFSTR("lgbl");
  v9[7] = CFSTR("SPServerHoldCompanionExtensionProcessAssertion");
  v8[8] = CFSTR("SPXcodeSupportAppLaunchEnvironmentKey");
  v8[9] = CFSTR("SPXcodeSupportAppLaunchArgumentsKey");
  v9[8] = CFSTR("xle");
  v9[9] = CFSTR("xla");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SPHoldCompanionExtensionProcessAssertion_block_invoke_sOptionsTranslations;
  SPHoldCompanionExtensionProcessAssertion_block_invoke_sOptionsTranslations = v0;

  v7 = CFSTR("SPXcodeSupportAppLaunchModeNotificationForceStaticPresentationKey");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)SPHoldCompanionExtensionProcessAssertion_block_invoke_sKeysWithBoolValues;
  SPHoldCompanionExtensionProcessAssertion_block_invoke_sKeysWithBoolValues = v2;

  v6[0] = CFSTR("SPXcodeSupportAppLaunchModeNotificationRemotePayloadKey");
  v6[1] = CFSTR("SPSimulatorAppLaunchModeApplicationLaunchURLKey");
  v6[2] = CFSTR("SPDeviceBacklightAssertionTime");
  v6[3] = CFSTR("SPHoldCompanionExtensionProcessAssertion");
  v6[4] = CFSTR("SPXcodeSupportAppLaunchEnvironmentKey");
  v6[5] = CFSTR("SPXcodeSupportAppLaunchArgumentsKey");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)SPHoldCompanionExtensionProcessAssertion_block_invoke_sKeysToLeaveValuesUntranslated;
  SPHoldCompanionExtensionProcessAssertion_block_invoke_sKeysToLeaveValuesUntranslated = v4;

}

void __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_3(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_4;
  v7[3] = &unk_24D3BC358;
  v12 = a2;
  v8 = a1[4];
  v9 = a1[5];
  v10 = v5;
  v11 = a1[6];
  v6 = v5;
  spUtils_dispatchSyncToMainThread(v7);

}

uint64_t __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_4(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 64);
  wk_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 136446978;
      v9 = "SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_4";
      v10 = 1024;
      v11 = 213;
      v12 = 2114;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_215918000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Successfully launched WatchKit app for companionAppIdentifier %{public}@ with options %{public}@", (uint8_t *)&v8, 0x26u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_4_cold_1((_QWORD *)a1, v4);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_cold_1()
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

void __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke_4_cold_1(_QWORD *a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = 136447234;
  v6 = "SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke";
  v7 = 1024;
  v8 = 215;
  v9 = 2114;
  v10 = v2;
  v11 = 2114;
  v12 = v3;
  v13 = 2114;
  v14 = v4;
  _os_log_error_impl(&dword_215918000, a2, OS_LOG_TYPE_ERROR, "%{public}s:%d: Failed to launch  WatchKit app for companionAppIdentifier %{public}@ with options %{public}@. Got error %{public}@", (uint8_t *)&v5, 0x30u);
}

@end
