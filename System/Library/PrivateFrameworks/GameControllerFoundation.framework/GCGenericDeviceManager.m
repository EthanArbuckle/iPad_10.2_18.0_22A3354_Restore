@implementation GCGenericDeviceManager

uint64_t __45___GCGenericDeviceManager_setDeviceRegistry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onioqueue_setupHIDMatching");
}

void __43___GCGenericDeviceManager_claimHIDService___block_invoke(uint64_t a1)
{
  _GCGenericPhysicalDevicePending *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  _GCGenericPhysicalDevicePending *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = -[_GCGenericPhysicalDevicePending initWithHIDService:manager:]([_GCGenericPhysicalDevicePending alloc], "initWithHIDService:manager:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  _gc_log_generic_device();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v14 = v4;
    v15 = 2112;
    v16 = v2;
    _os_log_impl(&dword_1DC79E000, v3, OS_LOG_TYPE_INFO, "%@: Adding %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  if (!v6)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setObject:forKey:", v2, *(_QWORD *)(a1 + 32));
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  -[_GCGenericPhysicalDevicePending device](v2, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43___GCGenericDeviceManager_claimHIDService___block_invoke_23;
  v10[3] = &unk_1EA4D2E08;
  objc_copyWeak(&v12, (id *)buf);
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v7, "observeSuccessOnQueue:withBlock:", v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __43___GCGenericDeviceManager_claimHIDService___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, _BYTE *);
  void *v13;
  id v14;
  _BYTE *v15;
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _gc_log_generic_device();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = WeakRetained;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v3;
      _os_log_impl(&dword_1DC79E000, v5, OS_LOG_TYPE_INFO, "%@: Prepared %@", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v17 = __Block_byref_object_copy__2;
    v18 = __Block_byref_object_dispose__2;
    v19 = 0;
    v6 = WeakRetained[7];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __43___GCGenericDeviceManager_claimHIDService___block_invoke_24;
    v13 = &unk_1EA4D2DE0;
    v7 = v3;
    v14 = v7;
    v15 = buf;
    objc_msgSend(v6, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, &v10);
    v8 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v8)
      -[_GCGenericDeviceManager _onqueue_relinquishHIDService:]((uint64_t)WeakRetained, v8);

    _Block_object_dispose(buf, 8);
    objc_msgSend(WeakRetained[7], "setObject:forKey:", v7, *(_QWORD *)(a1 + 32), v10, v11, v12, v13);
    objc_msgSend(WeakRetained[6], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "_onqueue_registerDefaultConfigurationForDevice:", v7);
    objc_msgSend(WeakRetained, "deviceRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceManager:deviceDidConnect:", WeakRetained, v7);

  }
}

void __43___GCGenericDeviceManager_claimHIDService___block_invoke_24(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = a3;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v10, "isEqual:", v11);
  if ((_DWORD)v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __48___GCGenericDeviceManager_relinquishHIDService___block_invoke(uint64_t a1)
{
  -[_GCGenericDeviceManager _onqueue_relinquishHIDService:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __64___GCGenericDeviceManager_acceptDriverConnection_forHIDService___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;

  v2 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _gc_log_generic_device();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __64___GCGenericDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_2(v2);

    objc_msgSend(v3, "setDriverConnection:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64___GCGenericDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_1(v2, v2 + 1, v5);

    objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }

}

void __64___GCGenericDeviceManager_acceptFilterConnection_forHIDService___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_opt_respondsToSelector();
    _gc_log_generic_device();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((v4 & 1) != 0)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __64___GCGenericDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_2(a1);

      objc_msgSend(v3, "setFilterConnection:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v12 = v7;
        v13 = 2112;
        v14 = v3;
        _os_log_impl(&dword_1DC79E000, v6, OS_LOG_TYPE_INFO, "Dropping incoming filter connection %@ because %@ does not support it.", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 48), "invalidate");
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    _gc_log_generic_device();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __64___GCGenericDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_1(v2);

    objc_msgSend(v8, "setFilterConnection:", *(_QWORD *)(a1 + 48));
  }
  else if (!v3)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("_GCGenericDeviceManager.m"), 304, CFSTR("No device for %@"), *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }

}

void __54___GCGenericDeviceManager__onioqueue_setupHIDMatching__block_invoke(uint64_t a1)
{
  __HIDDevicesMatched(*(void **)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

void __64___GCGenericDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1DC79E000, log, OS_LOG_TYPE_ERROR, "%@: No device for %@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

void __64___GCGenericDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC79E000, v1, v2, "%@: Passing driver connection to device %@.", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

void __64___GCGenericDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC79E000, v1, v2, "%@: Passing filter connection to device %@.", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

void __64___GCGenericDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 48);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC79E000, v1, v2, "Passing filter connection %@ to device %@.", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

@end
