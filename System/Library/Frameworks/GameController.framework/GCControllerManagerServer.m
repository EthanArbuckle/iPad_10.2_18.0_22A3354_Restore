@implementation GCControllerManagerServer

uint64_t __57___GCControllerManagerServer_initWithControllerProfiles___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupHIDMonitor:", 1);
}

uint64_t __57___GCControllerManagerServer_initWithControllerProfiles___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_signalGameControllerFocusModeEvent");
}

uint64_t __61___GCControllerManagerServer_deviceManager_deviceDidConnect___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_registerPhysicalDevice:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshLogicalDevices");
}

uint64_t __64___GCControllerManagerServer_deviceManager_deviceDidDisconnect___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_unregisterPhysicalDevice:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshLogicalDevices");
}

uint64_t __72___GCControllerManagerServer_refreshActiveConfigurationsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshLogicalDevices");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __57___GCControllerManagerServer_refreshActiveConfigurations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshLogicalDevices");
}

void __82___GCControllerManagerServer__hidqueue_pushPendingDriverConnection_forRegistryID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  objc_setAssociatedObject(*(id *)(a1 + 48), "DriverConnectionInvalidationRegistrationKey", 0, (void *)1);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __82___GCControllerManagerServer__hidqueue_pushPendingDriverConnection_forRegistryID___block_invoke_2;
  block[3] = &unk_24D2B2B70;
  block[1] = 3221225472;
  block[4] = v2;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  dispatch_async(v4, block);

}

void __82___GCControllerManagerServer__hidqueue_pushPendingDriverConnection_forRegistryID___block_invoke_2(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 272), "objectForKey:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", a1[6]);
  if (!objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1[4] + 272), "removeObjectForKey:", a1[5]);

}

void __82___GCControllerManagerServer__hidqueue_pushPendingFilterConnection_forRegistryID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  objc_setAssociatedObject(*(id *)(a1 + 48), "FilterConnectionInvalidationRegistrationKey", 0, (void *)1);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __82___GCControllerManagerServer__hidqueue_pushPendingFilterConnection_forRegistryID___block_invoke_2;
  block[3] = &unk_24D2B2B70;
  block[1] = 3221225472;
  block[4] = v2;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  dispatch_async(v4, block);

}

void __82___GCControllerManagerServer__hidqueue_pushPendingFilterConnection_forRegistryID___block_invoke_2(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 280), "objectForKey:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", a1[6]);
  if (!objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1[4] + 280), "removeObjectForKey:", a1[5]);

}

void __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(NSObject **)(v7 + 16);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke_316;
    v11[3] = &unk_24D2B2BC0;
    v11[4] = v7;
    v12 = v5;
    v13 = *(id *)(a1 + 32);
    v14 = a3;
    dispatch_async(v8, v11);

  }
  else
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v16 = v10;
        _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "#WARNING Connection %@ did not return a device registry ID.  Dropping.", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

void __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke_316(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int isInternalBuild;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "member:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)*(v2 - 1) + 33), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_12;
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke_316_cold_2(a1, (uint64_t)v4, v17);

    }
    v5 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56) == 1)
    {
      if ((objc_msgSend(v4, "acceptFilterConnection:forHIDService:", v5, v3) & 1) != 0)
        goto LABEL_14;
LABEL_12:
      if (!gc_isInternalBuild())
        goto LABEL_13;
      getGCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v16 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)v19 = 138412546;
        *(_QWORD *)&v19[4] = v16;
        *(_WORD *)&v19[12] = 2112;
        *(_QWORD *)&v19[14] = v4;
        v10 = "Dropping incoming driver connection %@ because %@ rejected it.";
        v11 = v7;
        v12 = OS_LOG_TYPE_INFO;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
    if ((objc_msgSend(v4, "acceptDriverConnection:forHIDService:", v5, v3) & 1) == 0)
      goto LABEL_12;
  }
  else
  {
    isInternalBuild = gc_isInternalBuild();
    if (v3)
    {
      if (!isInternalBuild)
      {
LABEL_13:
        objc_msgSend(*(id *)(a1 + 48), "invalidate", *(_OWORD *)v19, *(_QWORD *)&v19[16]);
        goto LABEL_14;
      }
      getGCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 40);
        v8 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)v19 = 138412546;
        *(_QWORD *)&v19[4] = v8;
        *(_WORD *)&v19[12] = 2112;
        *(_QWORD *)&v19[14] = v9;
        v10 = "#WARNING Dropping incoming driver connection %@ because it is for an unclaimed HID service with registryID '%@'";
        v11 = v7;
        v12 = OS_LOG_TYPE_DEFAULT;
LABEL_21:
        _os_log_impl(&dword_215181000, v11, v12, v10, v19, 0x16u);
      }
LABEL_22:

      goto LABEL_13;
    }
    if (isInternalBuild)
    {
      getGCLogger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke_316_cold_1(a1, v2, v18);

    }
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(a1 + 56) == 1)
      objc_msgSend(v14, "_hidqueue_pushPendingFilterConnection:forRegistryID:", v13, v15);
    else
      objc_msgSend(v14, "_hidqueue_pushPendingDriverConnection:forRegistryID:", v13, v15);
  }
LABEL_14:

}

void __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke_316_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 48);
  v5 = objc_msgSend(*a2, "unsignedLongLongValue");
  v7 = 138412546;
  v8 = v4;
  v9 = 2048;
  v10 = v5;
  OUTLINED_FUNCTION_6(&dword_215181000, a3, v6, "Stashing incoming driver connection %@ for unknown HID service with registryID '%#010llx'.", (uint8_t *)&v7);
  OUTLINED_FUNCTION_2();
}

void __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke_316_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_6(&dword_215181000, a3, (uint64_t)a3, "Sending incoming driver connection %@ to %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

@end
