@implementation GCControllerManager

void __38___GCControllerManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  currentProcessIsGameControllerDaemon();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedManager;
  sharedInstance_sharedManager = v0;

}

void __40___GCControllerManager_setupHIDMonitor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, __IOHIDServiceClient *a4)
{
  id *v6;
  id WeakRetained;
  NSObject *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  os_activity_scope_state_s v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v18.opaque[0] = 0;
    v18.opaque[1] = 0;
    v8 = _os_activity_create(&dword_215181000, "HID Service Removed", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &v18);
    v9 = objc_loadWeakRetained(v6);
    v10 = v9;
    if (v9 && *(_QWORD *)(a1 + 40) == v9[5])
    {
      IOHIDServiceClientGetRegistryID(a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = objc_msgSend(v11, "unsignedLongLongValue", v18.opaque[0], v18.opaque[1]);
          *(_DWORD *)buf = 134217984;
          v20 = v16;
          _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "HID Service Removed: registryID='%#010llx'", buf, 0xCu);
        }

      }
      v12 = (void *)objc_msgSend(objc_alloc((Class)&off_254DE4170), "initWithService:queue:", a4, v10[2]);
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "registryID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v10, "onHIDServiceRemoved:", v13);
          objc_msgSend(v10, "_legacy_removeControllerWithServiceInfo:", v13);

          os_activity_scope_leave(&v18);
LABEL_11:

          goto LABEL_12;
        }
      }
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v20 = (uint64_t)a4;
          _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_INFO, "#WARNING Ignoring removed IOHIDService because it returned an invalid registryID:\n%@", buf, 0xCu);
        }

      }
    }

    goto LABEL_11;
  }
LABEL_12:

}

void __40___GCControllerManager_setupHIDMonitor___block_invoke_88(uint64_t a1, uint64_t a2, uint64_t a3, __IOHIDServiceClient *a4)
{
  _QWORD *WeakRetained;
  _QWORD *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  os_activity_scope_state_s v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 48) == WeakRetained[5])
  {
    v16.opaque[0] = 0;
    v16.opaque[1] = 0;
    v8 = _os_activity_create(&dword_215181000, "HID Service Added", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &v16);
    IOHIDServiceClientGetRegistryID(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_msgSend(v9, "unsignedLongLongValue", v16.opaque[0], v16.opaque[1]);
        *(_DWORD *)buf = 134217984;
        v18 = v14;
        _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "HID Service Added: registryID='%#010llx'", buf, 0xCu);
      }

    }
    v10 = (void *)objc_msgSend(objc_alloc((Class)&off_254DE4170), "initWithService:queue:", a4, v7[2]);
    v11 = v10;
    if (v10
      && (objc_msgSend(v10, "registryID"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      IOHIDServiceClientRegisterRemovalBlock();
      objc_msgSend(v7, "onHIDServiceAdded:", v11);
      objc_msgSend(v7, "_legacy_addControllerWithServiceInfo:", v11);

      os_activity_scope_leave(&v16);
    }
    else
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v18 = (uint64_t)a4;
          _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "#WARNING Ignoring added IOHIDService because it returned an invalid registryID:\n%@", buf, 0xCu);
        }

      }
    }

  }
}

void __40___GCControllerManager_setupHIDMonitor___block_invoke_89(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __40___GCControllerManager_setupHIDMonitor___block_invoke_2(uint64_t a1)
{
  CFArrayRef v2;
  const __CFArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = IOHIDEventSystemClientCopyServices(*(IOHIDEventSystemClientRef *)(a1 + 40));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2;
  v4 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        ++v7;
      }
      while (v5 != v7);
      v5 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __43___GCControllerManager_teardownHIDMonitor___block_invoke(uint64_t a1)
{
  IOHIDEventSystemClientCancel();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setStopped:", 1);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  __dmb(0xBu);
}

uint64_t __60___GCControllerManager_Legacy___legacy_startHIDEventMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_legacy_updateControllerWithEvent:", a2);
}

void __58___GCControllerManager_Legacy___legacy_publishController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[GCAnalytics instance](GCAnalytics, "instance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publishController:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "setCurrentController:", *(_QWORD *)(a1 + 32));
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "productCategory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_DEFAULT, "posting GCControllerDidConnectNotification for %@ controller: %@", (uint8_t *)&v7, 0x16u);

    }
  }
  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("GCControllerDidConnectNotification"), *(_QWORD *)(a1 + 32), 0);

}

void __60___GCControllerManager_Legacy___legacy_unpublishController___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[GCAnalytics instance](GCAnalytics, "instance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unpublishController:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "updateCurrentControllerAndProfileForUnpublishedController:", *(_QWORD *)(a1 + 32));
  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("GCControllerDidDisconnectNotification"), *(_QWORD *)(a1 + 32), 0);

}

void __46___GCControllerManager_Legacy__addController___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", objc_msgSend(v2, "deviceHash"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
        v16 = 138412290;
        v17 = v15;
        _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_DEFAULT, "existing controller does not exist: %@", (uint8_t *)&v16, 0xCu);
      }

    }
    if (objc_msgSend(v2, "isATVRemote"))
      v6 = objc_msgSend(v2, "isForwarded");
    else
      v6 = 1;
    objc_msgSend(v2, "physicalInputProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_254DCB1F0))
    {
      objc_msgSend(v2, "physicalInputProfile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "deviceType");

      if (v10 != 5)
      {
LABEL_17:
        objc_msgSend(*(id *)(a1 + 40), "storeController:", v2);
        v7 = v2;
        goto LABEL_18;
      }
      v11 = *(_QWORD *)(a1 + 40);
      v12 = v2;
      v8 = *(void **)(v11 + 136);
      *(_QWORD *)(v11 + 136) = v12;
      v6 = 1;
    }

    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isATVRemote") && objc_msgSend(v2, "isATVRemote"))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "combineSiriRemoteHIDDevicesWithNewController:existingController:", v2, v5);
  }
  else if ((objc_msgSend(v2, "isForwarded") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "setObject:forKey:", v2, v3);
    v6 = 1;
  }
  v7 = v5;
LABEL_18:
  v13 = v7;

  objc_msgSend(v13, "setAllHIDDevicesConnected:", v6);
  objc_msgSend(*(id *)(a1 + 40), "_legacy_publishController:", v13);

}

uint64_t __60___GCControllerManager_Legacy__removeController_registryID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeController:registryID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __51___GCControllerManager_Legacy___legacy_controllers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[NSMutableArray array](&off_254DEBB20, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "areAllHIDDevicesConnected"))
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v2;

}

void __53___GCControllerManager_Legacy__isExistingController___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "deviceHash"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "objectForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

@end
