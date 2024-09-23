@implementation DKSync3Coordinator

uint64_t __39___DKSync3Coordinator_initWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleContextChangedNotification:", a2);
}

void __141___DKSync3Coordinator__DKSyncRemoteContextStorageDelegate__remoteContextStorage_subscribeToChangesWithPeer_registrationIdentifier_predicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x24BE1B128];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __141___DKSync3Coordinator__DKSyncRemoteContextStorageDelegate__remoteContextStorage_subscribeToChangesWithPeer_registrationIdentifier_predicate___block_invoke_2;
  v10[3] = &unk_24DD8CA08;
  objc_copyWeak(&v15, (id *)(a1 + 64));
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v9 = v5;
  v14 = v9;
  objc_msgSend(v7, "performAsyncBlock:", v10);

  objc_destroyWeak(&v15);
}

void __128___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v7 = 0;
  objc_msgSend(v2, "subscribeToContextValueChangeNotificationsWithRegistration:deviceIDs:error:", v3, v4, &v7);
  v5 = v7;
  v6 = a1[7];
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

void __132___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v7 = 0;
  objc_msgSend(v2, "unsubscribeFromContextValueChangeNotificationsWithRegistration:deviceIDs:error:", v3, v4, &v7);
  v5 = v7;
  v6 = a1[7];
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

void __116___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToDeviceStatusChangeNotificationsForDeviceTypes_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = (void *)a1[4];
  v3 = a1[6];
  v6 = 0;
  objc_msgSend(v2, "subscribeToDeviceStatusChangeNotificationsForDeviceTypes:error:", v3, &v6);
  v4 = v6;
  v5 = a1[5];
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);

}

void __126___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __126___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke_cold_2(a1, v3);

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __126___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke_cold_1(a1, v5);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 40));
  }

}

void __130___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __130___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke_cold_2(a1, v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __130___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke_cold_1(a1, v5);
  }

}

void __91___DKSync3Coordinator__CDRemoteUserContextServer__fetchPropertiesOfRemoteKeyPaths_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __91___DKSync3Coordinator__CDRemoteUserContextServer__fetchPropertiesOfRemoteKeyPaths_handler___block_invoke_2;
  v3[3] = &unk_24DD8CB38;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_fetchPropertiesOfRemoteKeyPaths:handler:", v2, v3);

}

uint64_t __91___DKSync3Coordinator__CDRemoteUserContextServer__fetchPropertiesOfRemoteKeyPaths_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85___DKSync3Coordinator__CDRemoteUserContextServer__requestActivateDevicesWithHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __85___DKSync3Coordinator__CDRemoteUserContextServer__requestActivateDevicesWithHandler___block_invoke_2;
  v2[3] = &unk_24DD8CB38;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_requestActivateDevicesWithHandler:", v2);

}

uint64_t __85___DKSync3Coordinator__CDRemoteUserContextServer__requestActivateDevicesWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __107___DKSync3Coordinator__CDRemoteUserContextServer__sendContextValuesToPeer_registrationIdentifier_keyPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;

  objc_msgSend(MEMORY[0x24BE1AFC8], "syncChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __107___DKSync3Coordinator__CDRemoteUserContextServer__sendContextValuesToPeer_registrationIdentifier_keyPaths___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __107___DKSync3Coordinator__CDRemoteUserContextServer__sendContextValuesToPeer_registrationIdentifier_keyPaths___block_invoke_cold_1();
  }

}

void __141___DKSync3Coordinator__DKSyncRemoteContextStorageDelegate__remoteContextStorage_subscribeToChangesWithPeer_registrationIdentifier_predicate___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint8_t a11, __int128 a12, const __CFString *a13, __int128 a14, __int128 a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __CFString *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  OUTLINED_FUNCTION_27();
  a28 = v32;
  a29 = v33;
  OUTLINED_FUNCTION_28();
  a17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)OUTLINED_FUNCTION_14(), "description");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *(_QWORD *)(v31 + 40);
  v36 = &stru_24DD8CBD0;
  if (objc_msgSend(*(id *)(v31 + 48), "me"))
    v37 = CFSTR("pseudo ");
  else
    v37 = &stru_24DD8CBD0;
  objc_msgSend(*(id *)(v31 + 48), "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v31 + 48), "model");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(v31 + 48), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_26();
    objc_msgSend(v40, "stringWithFormat:", CFSTR(" (%@)"));
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_11();
  _CDPrettyPrintCollection();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_29();
  *(_QWORD *)((char *)&a12 + 6) = v35;
  HIWORD(a12) = 2114;
  a13 = v37;
  LOWORD(a14) = 2114;
  *(_QWORD *)((char *)&a14 + 2) = v38;
  WORD5(a14) = 2114;
  *(_QWORD *)((char *)&a14 + 12) = v36;
  WORD2(a15) = v42;
  *(_QWORD *)((char *)&a15 + 6) = v43;
  OUTLINED_FUNCTION_30(&dword_21AA79000, v29, v44, "%{public}@: Callack sending context values for registration %@ to %{public}@peer %{public}@%{public}@ with key paths: %@", &a11);
  if (v39)
  {

  }
  OUTLINED_FUNCTION_9();
}

void __126___DKSync3Coordinator__CDRemoteUserContextServer__subscribeToContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20;

  objc_msgSend((id)OUTLINED_FUNCTION_14(), "description");
  objc_claimAutoreleasedReturnValue();
  v7 = &stru_24DD8CBD0;
  OUTLINED_FUNCTION_31();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_20();
    objc_msgSend(v10, "stringWithFormat:", CFSTR(" (%@)"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_23(&dword_21AA79000, v12, v13, "%{public}@: Failed to subscribe %{public}@peer %{public}@%{public}@ to context value change notifications with registration %{public}@: %{public}@:%lld (%@)", v14, v15, v16, v17, v18, v19, v20);

  if (v9)
  {

  }
  OUTLINED_FUNCTION_18();
}

void __130___DKSync3Coordinator__CDRemoteUserContextServer__unsubscribeFromContextValueChangeNotificationsWithRegistration_deviceIDs_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v20;

  objc_msgSend((id)OUTLINED_FUNCTION_14(), "description");
  objc_claimAutoreleasedReturnValue();
  v7 = &stru_24DD8CBD0;
  OUTLINED_FUNCTION_31();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_20();
    objc_msgSend(v10, "stringWithFormat:", CFSTR(" (%@)"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_23(&dword_21AA79000, v12, v13, "%{public}@: Failed to unsubscribe %{public}@peer %{public}@%{public}@ from context value change notifications with registration %{public}@: %{public}@:%lld (%@)", v14, v15, v16, v17, v18, v19, v20);

  if (v9)
  {

  }
  OUTLINED_FUNCTION_18();
}

void __92___DKSync3Coordinator__CDRemoteUserContextServer___fetchPropertiesOfRemoteKeyPaths_handler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, int a12, __int16 a13, __int16 a14, void *a15, __int128 a16, __int128 a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id *v37;
  id *v38;
  void *v39;
  __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;

  OUTLINED_FUNCTION_27();
  a30 = v31;
  a31 = v32;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  a19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)OUTLINED_FUNCTION_14(), "description");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = &stru_24DD8CBD0;
  if (objc_msgSend(v38[6], "me"))
    v41 = CFSTR("pseudo ");
  else
    v41 = &stru_24DD8CBD0;
  objc_msgSend(v38[6], "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38[6], "model");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v38[6], "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_20();
    objc_msgSend(v44, "stringWithFormat:", CFSTR(" (%@)"));
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v36, "domain");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v36, "code");
  LODWORD(buf) = 138544898;
  *(_QWORD *)((char *)&buf + 4) = v39;
  WORD6(buf) = 2114;
  *(_QWORD *)((char *)&buf + 14) = v41;
  a14 = 2114;
  a15 = v42;
  LOWORD(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 2) = v40;
  WORD5(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 12) = v45;
  WORD2(a17) = 2048;
  *(_QWORD *)((char *)&a17 + 6) = v46;
  HIWORD(a17) = 2112;
  a18 = v36;
  _os_log_error_impl(&dword_21AA79000, v34, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch properties of key paths from %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", (uint8_t *)&buf, 0x48u);

  if (v43)
  {

  }
  OUTLINED_FUNCTION_9();
}

void __92___DKSync3Coordinator__CDRemoteUserContextServer___fetchPropertiesOfRemoteKeyPaths_handler___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint8_t a11, __int128 a12, void *a13, __int128 a14, __int128 a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  void *v29;
  id *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  __int16 v43;
  uint64_t v44;

  OUTLINED_FUNCTION_27();
  a28 = v31;
  a29 = v32;
  v34 = v33;
  OUTLINED_FUNCTION_28();
  a17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)OUTLINED_FUNCTION_14(), "description");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v30[5], "count"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = &stru_24DD8CBD0;
  if (objc_msgSend(v30[6], "me"))
    v39 = CFSTR("pseudo ");
  else
    v39 = &stru_24DD8CBD0;
  objc_msgSend(v30[6], "identifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30[6], "model");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v30[6], "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_20();
    objc_msgSend(v42, "stringWithFormat:", CFSTR(" (%@)"));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_29();
  *(_QWORD *)((char *)&a12 + 6) = v36;
  HIWORD(a12) = v43;
  a13 = v37;
  LOWORD(a14) = 2114;
  *(_QWORD *)((char *)&a14 + 2) = v39;
  WORD5(a14) = 2114;
  *(_QWORD *)((char *)&a14 + 12) = v40;
  WORD2(a15) = 2114;
  *(_QWORD *)((char *)&a15 + 6) = v38;
  OUTLINED_FUNCTION_30(&dword_21AA79000, v34, v44, "%{public}@: Successfullly fetched %@ of %@ properties of key paths from %{public}@peer %{public}@%{public}@", &a11);
  if (v41)
  {

  }
  OUTLINED_FUNCTION_9();
}

void __107___DKSync3Coordinator__CDRemoteUserContextServer__sendContextValuesToPeer_registrationIdentifier_keyPaths___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_28();
  objc_msgSend((id)OUTLINED_FUNCTION_14(), "description");
  objc_claimAutoreleasedReturnValue();
  v3 = &stru_24DD8CBD0;
  OUTLINED_FUNCTION_34();
  objc_msgSend(*(id *)(v2 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 40), "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(v2 + 40), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_26();
    objc_msgSend(v6, "stringWithFormat:", CFSTR(" (%@)"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(v2 + 48), "valueForKey:", CFSTR("key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  _CDPrettyPrintCollection();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_15(&dword_21AA79000, v9, v10, "%{public}@: Successfully sent context values to %{public}@peer %{public}@%{public}@ for key paths: %{public}@", v11, v12, v13, v14, v15, v16, 2u);

  if (v5)
  {

  }
  OUTLINED_FUNCTION_19();
}

void __107___DKSync3Coordinator__CDRemoteUserContextServer__sendContextValuesToPeer_registrationIdentifier_keyPaths___block_invoke_cold_2()
{
  void *v0;
  NSObject *v1;
  void *v2;
  uint64_t v3;
  __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  OUTLINED_FUNCTION_28();
  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)OUTLINED_FUNCTION_14(), "description");
  objc_claimAutoreleasedReturnValue();
  v4 = &stru_24DD8CBD0;
  if (OUTLINED_FUNCTION_34())
    v5 = CFSTR("pseudo ");
  else
    v5 = &stru_24DD8CBD0;
  objc_msgSend(*(id *)(v3 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 40), "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(v3 + 40), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_26();
    objc_msgSend(v8, "stringWithFormat:", CFSTR(" (%@)"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(v3 + 48), "valueForKey:", CFSTR("key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  _CDPrettyPrintCollection();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138544386;
  v12 = v0;
  v13 = 2114;
  v14 = v5;
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_21AA79000, v1, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send context values to %{public}@peer %{public}@%{public}@ for key paths: %{public}@", buf, 0x34u);

  if (v7)
  {

  }
  OUTLINED_FUNCTION_19();
}

@end
