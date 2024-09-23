@implementation CDUserContextService

void __55___CDUserContextService_sharedInstanceWithPersistence___block_invoke(uint64_t a1)
{
  _CDUserContextService *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.coreduetd.context"));
  v2 = -[_CDUserContextService initWithListener:withPersistence:withStorage:withStore:]([_CDUserContextService alloc], "initWithListener:withPersistence:withStorage:withStore:", v4, *(_QWORD *)(a1 + 32), 0, 0);
  v3 = (void *)sharedInstanceWithPersistence__service;
  sharedInstanceWithPersistence__service = (uint64_t)v2;

}

void __61___CDUserContextService_sharedInstanceWithSharedMemoryStore___block_invoke(uint64_t a1)
{
  _CDUserContextService *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.coreduetd.context"));
  v2 = -[_CDUserContextService initWithListener:withPersistence:withStorage:withStore:]([_CDUserContextService alloc], "initWithListener:withPersistence:withStorage:withStore:", v4, 0, 0, *(_QWORD *)(a1 + 32));
  v3 = (void *)sharedInstanceWithSharedMemoryStore__service;
  sharedInstanceWithSharedMemoryStore__service = (uint64_t)v2;

}

void __45___CDUserContextService_addOpenRegistration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
    objc_sync_enter(v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", WeakRetained);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v5, v9);
    objc_sync_exit(v7);

    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    objc_sync_enter(v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", WeakRetained);
    objc_sync_exit(v8);

    objc_msgSend(*(id *)(a1 + 32), "informClientOfFiredRegistration:info:", WeakRetained, v5);
  }

}

void __62___CDUserContextService_informClientOfFiredRegistration_info___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62___CDUserContextService_informClientOfFiredRegistration_info___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __62___CDUserContextService_informClientOfFiredRegistration_info___block_invoke_cold_1(a1);
  }

}

uint64_t __40___CDUserContextService_regenerateState__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setContextValue:forContextualKeyPath:", a3, a2);
}

void __40___CDUserContextService_regenerateState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
    objc_sync_enter(v8);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v10 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "addObject:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v5, v16);
    objc_sync_exit(v8);

    v11 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    objc_sync_enter(v11);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v13 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v12, "removeObject:", v13);

    objc_sync_exit(v11);
    v14 = *(void **)(a1 + 32);
    v15 = objc_loadWeakRetained(v6);
    objc_msgSend(v14, "informClientOfFiredRegistration:info:", v15, v5);

  }
}

uint64_t __60___CDUserContextService_listener_shouldAcceptNewConnection___block_invoke()
{
  uint64_t result;

  NSSelectorFromString(CFSTR("doesImplementUnitTestsCategory"));
  result = objc_opt_respondsToSelector();
  listener_shouldAcceptNewConnection__isUnitTests = result & 1;
  return result;
}

void __66___CDUserContextService_fetchProxySourceDeviceUUIDFromSubscriber___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __66___CDUserContextService_fetchProxySourceDeviceUUIDFromSubscriber___block_invoke_cold_2();
LABEL_10:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __66___CDUserContextService_fetchProxySourceDeviceUUIDFromSubscriber___block_invoke_cold_1();

  +[_CDXPCCodecs parseProxySourceDeviceUUIDEvent:error:](_CDXPCContextCodecs, "parseProxySourceDeviceUUIDEvent:error:", v5, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v8 = (void *)v9;
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_18DD73000, v10, OS_LOG_TYPE_INFO, "CDUserContext: received proxy source device uuid: %@", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setProxySourceDeviceUUID:forUserID:", v8, objc_msgSend(*(id *)(a1 + 40), "uid"));
    goto LABEL_10;
  }
LABEL_11:

}

void __77___CDUserContextService_requestActivateDevicesFromAllSubscribersWithHandler___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1[5] + 8) + 32));
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __77___CDUserContextService_requestActivateDevicesFromAllSubscribersWithHandler___block_invoke_cold_1((uint64_t)a1, (uint64_t)(a1 + 6), v2);

    v3 = a1[4];
    if (v3)
      (*(void (**)(void))(v3 + 16))();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[5] + 8) + 32));
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __77___CDUserContextService_requestActivateDevicesFromAllSubscribersWithHandler___block_invoke_35(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1[6] + 8) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", a1[4]);
  if (++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) == a1[10])
  {
    v2 = a1[5];
    if (v2)
      (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1[7] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    v5 = *(_QWORD *)(a1[9] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[6] + 8) + 32));
}

void __74___CDUserContextService_requestActivateDevicesFromSubscriber_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __74___CDUserContextService_requestActivateDevicesFromSubscriber_withHandler___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __74___CDUserContextService_requestActivateDevicesFromSubscriber_withHandler___block_invoke_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

void __62___CDUserContextService_informClientOfFiredRegistration_info___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_1(&dword_18DD73000, v2, v3, "CDUserContext: sent event for registration %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __62___CDUserContextService_informClientOfFiredRegistration_info___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "CDUserContext: failed to send event: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66___CDUserContextService_fetchProxySourceDeviceUUIDFromSubscriber___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_10(&dword_18DD73000, v0, v1, "CDUserContext: handling fetch proxy source device uuid reply", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

void __66___CDUserContextService_fetchProxySourceDeviceUUIDFromSubscriber___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "CDUserContext: failed to send event to fetch proxy source device uuid: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77___CDUserContextService_requestActivateDevicesFromAllSubscribersWithHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64) - objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_18DD73000, a3, OS_LOG_TYPE_ERROR, "CDUserContext: Failed to get %@ proxy source device UUIDs", v5, 0xCu);

}

void __74___CDUserContextService_requestActivateDevicesFromSubscriber_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_10(&dword_18DD73000, v0, v1, "CDUserContext: handling request activate devices reply", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

void __74___CDUserContextService_requestActivateDevicesFromSubscriber_withHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "CDUserContext: failed to send event to request activate devices: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
