@implementation GCDefaultDeviceManager

void __62___GCDefaultDeviceManager_refreshPhysicalDeviceConfiguration___block_invoke(id *a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v13 = WeakRetained;
    objc_msgSend(a1[4], "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13[5], "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v3);

    if (v5)
    {
      objc_msgSend(a1[5], "configurationIdentifierForDevice:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "deviceRegistry");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceConfigurationRegistry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeConfigurationWithIdentifier:", v6);

      objc_msgSend(a1[5], "deviceRegistry");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deviceConfigurationRegistry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "refreshActiveConfigurations");

      objc_msgSend(a1[5], "_onqueue_registerDefaultConfigurationForDevice:replaceExisting:", v3, 1);
      objc_msgSend(a1[5], "deviceRegistry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deviceConfigurationRegistry");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "refreshActiveConfigurations");

    }
    WeakRetained = v13;
  }

}

void __43___GCDefaultDeviceManager_claimHIDService___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _GCDefaultPhysicalDevice *v5;
  void *v6;
  _GCDefaultPhysicalDevice *v7;
  _GCDefaultPhysicalDevice *v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "deviceManager:physicalDeviceForHIDDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v7 = (_GCDefaultPhysicalDevice *)objc_claimAutoreleasedReturnValue();
    -[_GCDefaultPhysicalDevice manager](v7, "manager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);

    if (v3 != v4)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

    }
    v5 = v7;
  }
  else
  {
    v5 = -[_GCDefaultPhysicalDevice initWithHIDDevice:manager:]([_GCDefaultPhysicalDevice alloc], "initWithHIDDevice:manager:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  v8 = v5;
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_registerPhysicalDevice:serviceInfo:checkForDuplicateDevice:", v5, *(_QWORD *)(a1 + 40), 1);

}

void __56___GCDefaultDeviceManager__onqueue_relinquishHIDDevice___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    *a4 = 1;
  }

}

uint64_t __48___GCDefaultDeviceManager_relinquishHIDService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_relinquishHIDDevice:", *(_QWORD *)(a1 + 40));
}

void __64___GCDefaultDeviceManager_acceptDriverConnection_forHIDService___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  int isInternalBuild;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();
  isInternalBuild = gc_isInternalBuild();
  if ((v3 & 1) != 0)
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __64___GCDefaultDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_1();

    }
    objc_msgSend(v2, "setDriverConnection:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 48);
        v8 = 138412546;
        v9 = v7;
        v10 = 2112;
        v11 = v2;
        _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_INFO, "Dropping incoming filter connection %@ because %@ does not support it.", (uint8_t *)&v8, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }

}

void __64___GCDefaultDeviceManager_acceptFilterConnection_forHIDService___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  int isInternalBuild;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();
  isInternalBuild = gc_isInternalBuild();
  if ((v3 & 1) != 0)
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __64___GCDefaultDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_1();

    }
    objc_msgSend(v2, "setFilterConnection:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 48);
        v8 = 138412546;
        v9 = v7;
        v10 = 2112;
        v11 = v2;
        _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_INFO, "Dropping incoming filter connection %@ because %@ does not support it.", (uint8_t *)&v8, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }

}

void __64___GCDefaultDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_7(&dword_215181000, v0, v1, "Passing driver connection %@ to device %@.");
  OUTLINED_FUNCTION_2_6();
}

void __64___GCDefaultDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_7(&dword_215181000, v0, v1, "Passing filter connection %@ to device %@.");
  OUTLINED_FUNCTION_2_6();
}

@end
