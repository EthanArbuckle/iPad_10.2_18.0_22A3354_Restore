@implementation ACCPlatformPluginBluetooth

- (NSString)pluginName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)initPlugin
{
  init_logging();
  -[ACCPlatformPluginBluetooth setIsRunning:](self, "setIsRunning:", 0);
  -[ACCPlatformPluginBluetooth setBtUpdatesStarted:](self, "setBtUpdatesStarted:", 0);
}

- (void)startPlugin
{
  -[ACCPlatformPluginBluetooth setIsRunning:](self, "setIsRunning:", 1);
}

- (void)stopPlugin
{
  -[ACCPlatformPluginBluetooth setIsRunning:](self, "setIsRunning:", 0);
}

- (void)performInit
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ACCPlatformPluginBluetooth_performInit__block_invoke;
  block[3] = &unk_24D5BE4B0;
  block[4] = self;
  if (performInit_onceToken != -1)
    dispatch_once(&performInit_onceToken, block);
}

void __41__ACCPlatformPluginBluetooth_performInit__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = dispatch_queue_create("com.apple.plugin.platform.bluetooth", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

}

- (id)getAccessoryList
{
  -[ACCPlatformPluginBluetooth performInit](self, "performInit");
  return self->_accessoryList;
}

- (id)accessoryAttached:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  ACCPlatformBluetoothStatusAccessory *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *btEventQueue;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD block[5];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_216886000, v7, OS_LOG_TYPE_INFO, "accessoryUID=%@", buf, 0xCu);
  }

  if (v4)
  {
    -[ACCPlatformPluginBluetooth getAccessoryList](self, "getAccessoryList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (ACCPlatformBluetoothStatusAccessory *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v9 = -[ACCPlatformBluetoothStatusAccessory initWithUID:]([ACCPlatformBluetoothStatusAccessory alloc], "initWithUID:", v4);
      -[ACCPlatformPluginBluetooth getAccessoryList](self, "getAccessoryList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v9, v4);

      -[ACCPlatformPluginBluetooth getAccessoryList](self, "getAccessoryList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12 == 1)
      {
        btEventQueue = self->_btEventQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __48__ACCPlatformPluginBluetooth_accessoryAttached___block_invoke;
        block[3] = &unk_24D5BE4B0;
        block[4] = self;
        dispatch_sync(btEventQueue, block);
      }
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v14 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
        v14 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[ACCPlatformPluginBluetooth getAccessoryList](self, "getAccessoryList");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v16;
        _os_log_impl(&dword_216886000, v14, OS_LOG_TYPE_INFO, "Added new accessory to list, accessoryList=%@", buf, 0xCu);

      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __48__ACCPlatformPluginBluetooth_accessoryAttached___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (!v1[2])
    _AttachToBTServer(v1);
}

- (void)accessoryDetached:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *btEventQueue;
  _QWORD block[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v4;
    _os_log_impl(&dword_216886000, v7, OS_LOG_TYPE_INFO, "accessory=%@", buf, 0xCu);
  }

  if (v4)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[ACCPlatformPluginBluetooth getAccessoryList](self, "getAccessoryList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = v10;
      _os_log_impl(&dword_216886000, v8, OS_LOG_TYPE_INFO, "Remove accessory from list, accessoryList=%@", buf, 0xCu);

    }
    -[ACCPlatformPluginBluetooth getAccessoryList](self, "getAccessoryList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);

    v13 = _BTGetAccessoryManager((uint64_t)self->_btSession);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v4, "componentList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v20, "needToUnplugBTDevice")
            && !_BTGetDevice((uint64_t)self->_btSession, v13, v20, &v29))
          {
            -[ACCPlatformPluginBluetooth unplugBTDevice:btAccessoryManager:btDevice:](self, "unplugBTDevice:btAccessoryManager:btDevice:", v20, v13, v29);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v17);
    }

    -[ACCPlatformPluginBluetooth getAccessoryList](self, "getAccessoryList");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (!v22)
    {
      btEventQueue = self->_btEventQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __48__ACCPlatformPluginBluetooth_accessoryDetached___block_invoke;
      block[3] = &unk_24D5BE4B0;
      block[4] = self;
      dispatch_async(btEventQueue, block);
    }
  }

}

void __48__ACCPlatformPluginBluetooth_accessoryDetached___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  id v8;
  _DWORD v9[4];
  _QWORD buf[4];

  buf[3] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 9) = 0;
    v2 = *(id *)(a1 + 32);
    if (gLogObjects)
      v3 = gNumLogObjects < 1;
    else
      v3 = 1;
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf[0]) = 138412290;
      *(_QWORD *)((char *)buf + 4) = v2;
      _os_log_impl(&dword_216886000, v5, OS_LOG_TYPE_INFO, "_DetachFromBTServer object=%@", (uint8_t *)buf, 0xCu);
    }

    buf[0] = objc_msgSend(v2, "btSession");
    if (buf[0])
    {
      v6 = BTSessionDetachWithQueue();
      if (!v6)
      {
LABEL_25:
        objc_msgSend(v2, "setBtSession:", 0);

        return;
      }
    }
    else
    {
      v6 = 1;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl(&dword_216886000, v7, OS_LOG_TYPE_DEFAULT, "ERROR - failed detaching from BT server, result=%d", (uint8_t *)v9, 8u);
    }

    goto LABEL_25;
  }
}

- (void)pluginBTDevice:(id)a3 btAccessoryManager:(BTAccessoryManagerImpl *)a4 btDevice:(BTDeviceImpl *)a5
{
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  int v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = v7;
    _os_log_impl(&dword_216886000, v10, OS_LOG_TYPE_INFO, "component=%@", (uint8_t *)&v18, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = v7;
    _os_log_impl(&dword_216886000, v11, OS_LOG_TYPE_INFO, "call BTAccessoryManagerPlugInDevice, component=%@", (uint8_t *)&v18, 0xCu);
  }

  v13 = BTAccessoryManagerPlugInDevice();
  if (v13 && (v14 = v13, v13 != 603))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v17;
      v20 = 1024;
      v21 = v14;
      _os_log_impl(&dword_216886000, v15, OS_LOG_TYPE_INFO, "ERROR - BTAccessoryManagerPlugInDevice (%@) failed (with %d result)!", (uint8_t *)&v18, 0x12u);

    }
  }
  else
  {
    objc_msgSend(v7, "setBtAccessoryManager:", a4);
    objc_msgSend(v7, "setBtDevice:", a5);
    objc_msgSend(v7, "setNeedToUnplugBTDevice:", 1);
  }

}

- (void)unplugBTDevice:(id)a3 btAccessoryManager:(BTAccessoryManagerImpl *)a4 btDevice:(BTDeviceImpl *)a5
{
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_216886000, v8, OS_LOG_TYPE_INFO, "component=%@", (uint8_t *)&v16, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_216886000, v9, OS_LOG_TYPE_INFO, "call BTAccessoryManagerUnplugDevice, component=%@", (uint8_t *)&v16, 0xCu);
  }

  v11 = BTAccessoryManagerUnplugDevice();
  if (v11 && (v12 = v11, v11 != 604))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v15;
      v18 = 1024;
      v19 = v12;
      _os_log_impl(&dword_216886000, v13, OS_LOG_TYPE_INFO, "ERROR - BTAccessoryManagerUnplugDevice (%@) failed (with %d result)!", (uint8_t *)&v16, 0x12u);

    }
  }
  else
  {
    objc_msgSend(v5, "setNeedToUnplugBTDevice:", 0);
  }

}

- (void)startCheckingForUpdates:(id)a3 forAccessory:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *btEventQueue;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v7;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_216886000, v10, OS_LOG_TYPE_INFO, "accessoryUID=%@ componentDict=%@", buf, 0x16u);
  }

  if (v6 && v7)
  {
    -[ACCPlatformPluginBluetooth getAccessoryList](self, "getAccessoryList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
        v16 = MEMORY[0x24BDACB70];
        v19 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_impl(&dword_216886000, v16, OS_LOG_TYPE_INFO, "Unable to find accessory for %@", buf, 0xCu);
      }

      v15 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("ACCBluetoothStatusComponentInfoUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {

    }
    else
    {
      +[_ACCBluetoothStatusComponent createComponentFromDict:](_ACCBluetoothStatusComponent, "createComponentFromDict:", v6);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentList");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v15, v13);

      if (!v15)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    if (-[ACCPlatformPluginBluetooth btUpdatesStarted](self, "btUpdatesStarted"))
    {
      btEventQueue = self->_btEventQueue;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __67__ACCPlatformPluginBluetooth_startCheckingForUpdates_forAccessory___block_invoke;
      v20[3] = &unk_24D5BE4D8;
      v20[4] = self;
      v15 = v15;
      v21 = v15;
      dispatch_async(btEventQueue, v20);

    }
    goto LABEL_28;
  }
LABEL_29:

}

void __67__ACCPlatformPluginBluetooth_startCheckingForUpdates_forAccessory___block_invoke(uint64_t a1)
{
  __notifyComponentStatus(*(void **)(a1 + 32), *(void **)(a1 + 40), 0);
}

- (void)stopCheckingForUpdates:(id)a3 forAccessory:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v17 = 138412546;
    v18 = v7;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_216886000, v10, OS_LOG_TYPE_INFO, "accessoryUID=%@ componentDict=%@", (uint8_t *)&v17, 0x16u);
  }

  if (v6 && v7)
  {
    -[ACCPlatformPluginBluetooth getAccessoryList](self, "getAccessoryList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("ACCBluetoothStatusComponentInfoUID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v13);
      v15 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
        v15 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v7;
        _os_log_impl(&dword_216886000, v15, OS_LOG_TYPE_INFO, "Unable to find accessory for %@", (uint8_t *)&v17, 0xCu);
      }
    }

  }
}

- (int)updateBTComponent:(id)a3 forAccessory:(id)a4 withEnabledState:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  int v24;
  id v25;
  uint64_t v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v5 = a5;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v8;
    v30 = 1024;
    v31 = v5;
    _os_log_impl(&dword_216886000, v12, OS_LOG_TYPE_INFO, "updateBTComponent: componentDict=%@ enabled=%d", buf, 0x12u);
  }

  if (v8)
  {
    if (!v9)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCBluetoothStatusComponentInfoAccessoryUID"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCBluetoothStatusComponentInfoUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCPlatformPluginBluetooth getAccessoryList](self, "getAccessoryList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "componentList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v13);
      v17 = objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        +[_ACCBluetoothStatusComponent createComponentFromDict:](_ACCBluetoothStatusComponent, "createComponentFromDict:", v8);
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentList");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v17, v13);

      }
      v27 = 0;
      v19 = _BTGetAccessoryManager((uint64_t)self->_btSession);
      if (v19)
      {
        v20 = v19;
        if (!_BTGetDevice((uint64_t)self->_btSession, v19, v17, &v27))
        {
          if (v27)
          {
            if (v5)
            {
              -[ACCPlatformPluginBluetooth pluginBTDevice:btAccessoryManager:btDevice:](self, "pluginBTDevice:btAccessoryManager:btDevice:", v17, v20);
              if (BTDeviceConnect())
              {
                logObjectForModule();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  -[NSObject name](v17, "name");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v29 = v22;
                  v23 = "ERROR - BTDeviceConnect (%@) failed!";
LABEL_39:
                  _os_log_impl(&dword_216886000, v21, OS_LOG_TYPE_INFO, v23, buf, 0xCu);

                  goto LABEL_40;
                }
                goto LABEL_40;
              }
            }
            else
            {
              -[ACCPlatformPluginBluetooth unplugBTDevice:btAccessoryManager:btDevice:](self, "unplugBTDevice:btAccessoryManager:btDevice:", v17, v20);
              if (BTDeviceDisconnect())
              {
                logObjectForModule();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  -[NSObject name](v17, "name");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v29 = v22;
                  v23 = "ERROR - BTDeviceDisconnect (%@) failed!";
                  goto LABEL_39;
                }
LABEL_40:

              }
            }
          }
          v24 = 0;
          goto LABEL_34;
        }
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v17 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
        v17 = MEMORY[0x24BDACB70];
        v25 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v9;
        _os_log_impl(&dword_216886000, v17, OS_LOG_TYPE_INFO, "ERROR - no accessory registered for accessoryUID %@", buf, 0xCu);
      }
    }
    v24 = -1;
LABEL_34:

    goto LABEL_35;
  }
  v24 = -1;
LABEL_35:

  return v24;
}

- (void)iterateRegisteredComponentsForKnownAddresses:(id)a3 allOFF:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[ACCPlatformPluginBluetooth getAccessoryList](self, "getAccessoryList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v22 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v23 = v9;
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v10, "componentList");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v25;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v25 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v16);
              if (!v6
                || (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v16), "macAddr"),
                    v18 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v6, "member:", v18),
                    v19 = (void *)objc_claimAutoreleasedReturnValue(),
                    v19,
                    v18,
                    v19))
              {
                __notifyComponentStatus(self, v17, a4);
              }
              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v14);
        }

        v9 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }

}

- (id)nameForMacAddress:(id)a3
{
  id v4;
  NSObject *btEventQueue;
  NSObject *v6;
  BOOL v7;
  id v8;
  const char *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int Name;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v20;
  id v21;
  _QWORD block[6];
  int v23;
  __int16 v24;
  uint8_t buf[4];
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24 = -21846;
  v23 = -1431655766;
  block[5] = 0xAAAAAAAAAAAAAAAALL;
  if (!v4)
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 1;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)gLogObjects;
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v9 = "ERROR - NULL MAC Address.";
    goto LABEL_44;
  }
  -[ACCPlatformPluginBluetooth performInit](self, "performInit");
  btEventQueue = self->_btEventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__ACCPlatformPluginBluetooth_nameForMacAddress___block_invoke;
  block[3] = &unk_24D5BE4B0;
  block[4] = self;
  dispatch_sync(btEventQueue, block);
  if (!self->_btSession)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v9 = "ERROR - NULL BT Session.";
    goto LABEL_44;
  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  if (BTDeviceAddressFromString())
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v9 = "Failed to get device address from string.";
LABEL_44:
    _os_log_impl(&dword_216886000, v6, OS_LOG_TYPE_INFO, v9, buf, 2u);
LABEL_45:

    goto LABEL_46;
  }
  if (BTDeviceFromAddress())
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v9 = "Failed to get device from address.";
    goto LABEL_44;
  }
  v12 = malloc_type_calloc(0xF9uLL, 1uLL, 0x100004077774924uLL);
  if (!v12)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v9 = "Failed to allocate memory for name.";
    goto LABEL_44;
  }
  v13 = v12;
  Name = BTDeviceGetName();
  if (!Name)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    free(v13);
    goto LABEL_47;
  }
  v15 = Name;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v16 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginBluetooth accessoryAttached:].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v20 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v26 = v15;
    _os_log_impl(&dword_216886000, v16, OS_LOG_TYPE_INFO, "No Address. Result = %d.", buf, 8u);
  }

  free(v13);
LABEL_46:
  v18 = 0;
LABEL_47:

  return v18;
}

void __48__ACCPlatformPluginBluetooth_nameForMacAddress___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (!v1[2])
    _AttachToBTServer(v1);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (BOOL)btUpdatesStarted
{
  return self->_btUpdatesStarted;
}

- (void)setBtUpdatesStarted:(BOOL)a3
{
  self->_btUpdatesStarted = a3;
}

- (BTSessionImpl)btSession
{
  return self->_btSession;
}

- (void)setBtSession:(BTSessionImpl *)a3
{
  self->_btSession = a3;
}

- (OS_dispatch_queue)btEventQueue
{
  return self->_btEventQueue;
}

- (void)setBtEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_btEventQueue, a3);
}

- (NSMutableDictionary)accessoryList
{
  return self->_accessoryList;
}

- (void)setAccessoryList:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryList, 0);
  objc_storeStrong((id *)&self->_btEventQueue, 0);
}

- (void)accessoryAttached:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216886000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
