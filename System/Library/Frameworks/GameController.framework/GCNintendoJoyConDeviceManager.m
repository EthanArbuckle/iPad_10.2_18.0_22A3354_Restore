@implementation GCNintendoJoyConDeviceManager

void __61___GCNintendoJoyConDeviceManager_device_fusionGestureActive___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  int v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeObject:", *(_QWORD *)(a1 + 32));
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "fusionDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (objc_msgSend(*(id *)(a1 + 32), "type") == 1 && objc_msgSend(v5, "type") == 2
       || objc_msgSend(*(id *)(a1 + 32), "type") == 2 && objc_msgSend(v5, "type") == 1))
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "type");
      v10 = v5;
      if (v9 == 1)
        v10 = *(void **)(a1 + 32);
      v11 = v10;
      v12 = objc_msgSend(*(id *)(a1 + 32), "type");
      v13 = v5;
      if (v12 == 2)
        v13 = *(void **)(a1 + 32);
      v14 = v13;
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = 138412546;
          v37 = v11;
          v38 = 2112;
          v39 = v14;
          _os_log_impl(&dword_215181000, v35, OS_LOG_TYPE_INFO, "Fusing (via gesture).  Left: %@.  Right: %@", (uint8_t *)&v36, 0x16u);
        }

      }
      +[_GCNintendoFusedJoyConDevice identifierForFusedJoyConDeviceWithLeftDevice:rightDevice:](_GCNintendoFusedJoyConDevice, "identifierForFusedJoyConDeviceWithLeftDevice:rightDevice:", v11, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "deviceRegistry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "deviceConfigurationRegistry");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "configurationWithIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = (void *)objc_msgSend(v18, "mutableCopy");
        objc_msgSend(v19, "setPriority:", 20);
        objc_msgSend(*(id *)(a1 + 40), "deviceRegistry");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deviceConfigurationRegistry");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "updateConfiguration:", v19);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "_onqueue_registerFusionConfigurationWithLeftDevice:rightDevice:", v11, v14);
      }
      objc_msgSend(*(id *)(a1 + 40), "deviceRegistry");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "deviceConfigurationRegistry");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "refreshActiveConfigurationsWithCompletion:", 0);

      goto LABEL_34;
    }
    goto LABEL_20;
  }
  objc_msgSend(v3, "leftDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  if (v5 == v6)
  {
    v22 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    objc_msgSend(v4, "rightDevice");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "member:", v1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {

LABEL_27:
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v36 = 138412290;
          v37 = v4;
          _os_log_impl(&dword_215181000, v34, OS_LOG_TYPE_INFO, "Unfusing (via gesture): %@", (uint8_t *)&v36, 0xCu);
        }

      }
      objc_msgSend(v4, "configuration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isTransient"))
      {
        objc_msgSend(*(id *)(a1 + 40), "deviceRegistry");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "deviceConfigurationRegistry");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeConfigurationWithIdentifier:", v29);
      }
      else
      {
        v27 = (void *)objc_msgSend(v5, "mutableCopy");
        objc_msgSend(v27, "setPriority:", 0);
        objc_msgSend(*(id *)(a1 + 40), "deviceRegistry");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "deviceConfigurationRegistry");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "updateConfiguration:", v27);
      }

      objc_msgSend(*(id *)(a1 + 40), "deviceRegistry");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "deviceConfigurationRegistry");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "refreshActiveConfigurationsWithCompletion:", 0);

LABEL_34:
      goto LABEL_35;
    }
  }
  objc_msgSend(v4, "rightDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 != *(void **)(a1 + 32))
  {

    if (v5 == v6)
LABEL_20:

    goto LABEL_21;
  }
  v24 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  objc_msgSend(v4, "leftDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "member:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  if (v26)
    goto LABEL_27;
LABEL_21:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "addObject:", *(_QWORD *)(a1 + 32));
LABEL_35:

}

void __50___GCNintendoJoyConDeviceManager_claimHIDService___block_invoke(uint64_t a1)
{
  _GCNintendoJoyConDevicePending *v2;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _BYTE location[12];
  __int16 v14;
  _GCNintendoJoyConDevicePending *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = -[_GCNintendoJoyConDevicePending initWithHIDService:manager:]([_GCNintendoJoyConDevicePending alloc], "initWithHIDService:manager:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v8;
      v14 = 2112;
      v15 = v2;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_INFO, "%@: Adding %@", location, 0x16u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  if (!v4)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKey:", v2, *(_QWORD *)(a1 + 32));
  objc_initWeak((id *)location, *(id *)(a1 + 40));
  -[_GCNintendoJoyConDevicePending device](v2, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50___GCNintendoJoyConDeviceManager_claimHIDService___block_invoke_108;
  v10[3] = &unk_24D2B3D20;
  objc_copyWeak(&v12, (id *)location);
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v5, "observeSuccessOnQueue:withBlock:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)location);

}

void __50___GCNintendoJoyConDeviceManager_claimHIDService___block_invoke_108(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *, _BYTE *);
  void *v12;
  id v13;
  _BYTE *v14;
  _BYTE buf[24];
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = WeakRetained;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v3;
        _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_INFO, "%@: Prepared %@", buf, 0x16u);
      }

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    v18 = 0;
    v5 = WeakRetained[5];
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __50___GCNintendoJoyConDeviceManager_claimHIDService___block_invoke_109;
    v12 = &unk_24D2B3CF8;
    v6 = v3;
    v13 = v6;
    v14 = buf;
    objc_msgSend(v5, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, &v9);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      objc_msgSend(WeakRetained, "_onqueue_relinquishHIDService:", v9, v10, v11, v12);

    _Block_object_dispose(buf, 8);
    objc_msgSend(WeakRetained[5], "setObject:forKey:", v6, *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained[4], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "_onqueue_registerDefaultConfigurationsForDevice:", v6);
    objc_msgSend(WeakRetained, "deviceRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceManager:deviceDidConnect:", WeakRetained, v6);

  }
}

void __50___GCNintendoJoyConDeviceManager_claimHIDService___block_invoke_109(uint64_t a1, void *a2, void *a3, _BYTE *a4)
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

uint64_t __55___GCNintendoJoyConDeviceManager_relinquishHIDService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_relinquishHIDService:", *(_QWORD *)(a1 + 40));
}

void __71___GCNintendoJoyConDeviceManager_acceptDriverConnection_forHIDService___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  int isInternalBuild;
  NSObject *v5;
  NSObject *v6;

  v2 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isInternalBuild = gc_isInternalBuild();
  if (v3)
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __71___GCNintendoJoyConDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_2(v2);

    }
    objc_msgSend(v3, "setDriverConnection:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __71___GCNintendoJoyConDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_1(v2, v2 + 1, v5);

    }
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }

}

void __71___GCNintendoJoyConDeviceManager_acceptFilterConnection_forHIDService___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  char v4;
  int isInternalBuild;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_opt_respondsToSelector();
    isInternalBuild = gc_isInternalBuild();
    if ((v4 & 1) != 0)
    {
      if (isInternalBuild)
      {
        getGCLogger();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          __71___GCNintendoJoyConDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_2(a1);

      }
      objc_msgSend(v3, "setFilterConnection:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      if (isInternalBuild)
      {
        getGCLogger();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138412546;
          v13 = v11;
          v14 = 2112;
          v15 = v3;
          _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_INFO, "Dropping incoming filter connection %@ because %@ does not support it.", buf, 0x16u);
        }

      }
      objc_msgSend(*(id *)(a1 + 48), "invalidate");
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __71___GCNintendoJoyConDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_1(v2);

    }
    objc_msgSend(v6, "setFilterConnection:", *(_QWORD *)(a1 + 48));
  }
  else if (!v3)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("_GCNintendoJoyConDeviceManager.m"), 456, CFSTR("No device for %@"), *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }

}

void __71___GCNintendoJoyConDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_215181000, log, OS_LOG_TYPE_ERROR, "%@: No device for %@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_3_0();
}

void __71___GCNintendoJoyConDeviceManager_acceptDriverConnection_forHIDService___block_invoke_cold_2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_5(&dword_215181000, v1, v2, "%@: Passing driver connection to device %@.", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3_0();
}

void __71___GCNintendoJoyConDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_5(&dword_215181000, v1, v2, "%@: Passing filter connection to device %@.", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3_0();
}

void __71___GCNintendoJoyConDeviceManager_acceptFilterConnection_forHIDService___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 48);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_5(&dword_215181000, v1, v2, "Passing filter connection %@ to device %@.", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3_0();
}

@end
