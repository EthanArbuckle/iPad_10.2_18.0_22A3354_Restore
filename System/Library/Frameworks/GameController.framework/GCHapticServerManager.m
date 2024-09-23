@implementation GCHapticServerManager

void __40___GCHapticServerManager_sharedInstance__block_invoke()
{
  _GCHapticServerManager *v0;
  void *v1;

  v0 = objc_alloc_init(_GCHapticServerManager);
  v1 = (void *)+[_GCHapticServerManager sharedInstance]::hapticServerManager;
  +[_GCHapticServerManager sharedInstance]::hapticServerManager = (uint64_t)v0;

}

void __30___GCHapticServerManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  NSObject **v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[12];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __30___GCHapticServerManager_init__block_invoke_2;
    v7[3] = &unk_24D2B4670;
    v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

void __30___GCHapticServerManager_init__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v26 = v16;
      _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "App state changed %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE089F0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v18, "intValue");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 40) + 88);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v5 = *(_QWORD *)v21;
    v6 = *MEMORY[0x24BE089E8];
    *(_QWORD *)&v4 = 138412290;
    v17 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7), v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if (v11)
        {
          if ((_DWORD)v2 == 2)
          {
            if (gc_isInternalBuild())
            {
              getGCHapticsLogger();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v17;
                v26 = v8;
                _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "Application backgrounded, muting %@", buf, 0xCu);
              }

            }
            objc_msgSend(v8, "setMute:forReason:", 1, 3);
            objc_msgSend(v8, "notifyClientOnStopWithReason:error:", 2, 0);
          }
          else if ((_DWORD)v2 == 8)
          {
            if (gc_isInternalBuild())
            {
              getGCHapticsLogger();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v17;
                v26 = v8;
                _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "Application foregrounded, unmuting %@", buf, 0xCu);
              }

            }
            objc_msgSend(v8, "setMute:forReason:", 0, 3);
          }
          objc_msgSend(v8, "setApplicationState:", v2);
        }

        ++v7;
      }
      while (v3 != v7);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v3 = v14;
    }
    while (v14);
  }

}

void __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3)
  {
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 138412546;
        v7 = WeakRetained;
        v8 = 2048;
        v9 = objc_msgSend(v4, "clientID");
        _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "%@ has lost its connection to haptic client %lu.", (uint8_t *)&v6, 0x16u);
      }

    }
    objc_msgSend(WeakRetained, "removeHapticClient:", v4);
  }

}

void __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  _QWORD *v12;
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained && v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE089E8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBundleIdentifier:", v7);

    +[NSMutableArray array](&off_254DEBB20, "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = WeakRetained[12];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke_2;
    v11[3] = &unk_24D2B4670;
    v12 = WeakRetained;
    v13 = v8;
    v10 = v8;
    dispatch_async(v9, v11);

  }
}

uint64_t __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v16;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v5));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = *(void **)(a1 + 40);
          objc_msgSend(v6, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9);

          if ((v8 & 1) == 0)
          {
            v10 = *(void **)(a1 + 40);
            objc_msgSend(v6, "bundleIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v11);

          }
        }

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v3);
  }

  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_DEFAULT, "Monitoring application state changes for %@", buf, 0xCu);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "updateInterestedBundleIDs:", *(_QWORD *)(a1 + 40));
}

void __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke_15(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = v3;
  if (WeakRetained && v3)
  {
    objc_msgSend(v3, "addInvalidationHandler:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)WeakRetained[7];
    +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v7);

    v8 = (void *)WeakRetained[11];
    +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v4, v9);

    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = WeakRetained[11];
        v13 = 138412546;
        v14 = v11;
        v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_INFO, "%@ clients: %@", (uint8_t *)&v13, 0x16u);
      }

    }
  }

}

void __45___GCHapticServerManager_removeHapticClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t);
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(void **)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_DEFAULT, "%@ remove haptic client: %@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v2;
      _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_INFO, "client controller identifier: %@", buf, 0xCu);
    }

  }
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterHapticClient:", *(_QWORD *)(a1 + 40));
    if ((objc_msgSend(v3, "hasClients") & 1) == 0)
    {
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          __45___GCHapticServerManager_removeHapticClient___block_invoke_cold_3((uint64_t)v3, v19);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", v2);
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __45___GCHapticServerManager_removeHapticClient___block_invoke_cold_2();

      }
      objc_msgSend(v3, "stopAllHaptics");
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "teardownAndReleaseChannels");
  +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "clientID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "clientID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "clientID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
  v9 = (void *)objc_opt_new();
  v11 = *(_QWORD *)(a1 + 32);
  v10 = (id *)(a1 + 32);
  v12 = *(void **)(v11 + 64);
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __45___GCHapticServerManager_removeHapticClient___block_invoke_17;
  v24 = &unk_24D2B4738;
  v25 = v10[1];
  v13 = v9;
  v26 = v13;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", &v21);
  objc_msgSend(*((id *)*v10 + 8), "removeObjectsForKeys:", v13, v21, v22, v23, v24);
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __45___GCHapticServerManager_removeHapticClient___block_invoke_cold_1();

  }
}

void __45___GCHapticServerManager_removeHapticClient___block_invoke_17(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (*(_QWORD *)(a3 + 48) == *(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __55___GCHapticServerManager_logicalDeviceWasUnregistered___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  id obj;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 40) + 48);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v15 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", v5);
        v6 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6[1], "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (v9)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);

          goto LABEL_11;
        }

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_DEFAULT, "Unregistered haptic logical device: %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }

}

void __55___GCHapticServerManager_logicalDeviceWasUnregistered___block_invoke_23(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)))
        {
          objc_msgSend(v6, "notifyClientOnStopWithReason:error:", 3, 0);
          objc_msgSend(v6, "invalidateDueToControllerDisconnect");
        }

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

void __55___GCHapticServerManager_notifyPlayerNoLongerRetained___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "isActiveAtTime:", (double)mach_absolute_time() * 0.0000000416666667) & 1) == 0)
  {
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_INFO, "%@ no longer retained by client and is not active - it will be safely released", (uint8_t *)&v10, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "hapticLogicalDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2 == 0;

    if (!v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "hapticLogicalDevice");
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4[4], "removeObject:", *(_QWORD *)(a1 + 32));

    }
    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
}

void __38___GCHapticServerManager_enterRunloop__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  char v4;
  char v5;

  v2 = (void *)MEMORY[0x2199DE97C]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "readClientDataForStartTime:endTime:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v4 = objc_msgSend(*(id *)(a1 + 32), "playersHaveImpendingCommandsForStartTime:endTime:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  if ((v3 & 1) != 0)
    v5 = 0;
  else
    v5 = (objc_msgSend(*(id *)(a1 + 32), "activeEvents") | v4) ^ 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count") != 0;
  objc_autoreleasePoolPop(v2);
}

void __38___GCHapticServerManager_enterRunloop__block_invoke_24(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x2199DE97C]();
  objc_msgSend(*(id *)(a1 + 32), "processScheduledCommandsForStartTime:endTime:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

void __38___GCHapticServerManager_enterRunloop__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t i;
  _BYTE *v10;
  _BYTE *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199DE97C]();
  objc_msgSend(*(id *)(a1 + 32), "processActiveEventsForStartTime:endTime:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v3 - v4;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v10 = (_BYTE *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10[8])
        {
          objc_msgSend(v10, "addActiveTime:", v7);
          v11[8] = 0;
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(v2);
}

void __38___GCHapticServerManager_enterRunloop__block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x2199DE97C]();
  objc_msgSend(*(id *)(a1 + 32), "identifyCompletedClients");
  objc_autoreleasePoolPop(v2);
}

void __45___GCHapticServerManager_removeHapticClient___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_11(&dword_215181000, v0, v1, "%@ clients: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_10();
}

void __45___GCHapticServerManager_removeHapticClient___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_11(&dword_215181000, v0, v1, "%@ logical haptic devices: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_10();
}

void __45___GCHapticServerManager_removeHapticClient___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_215181000, a2, OS_LOG_TYPE_DEBUG, "%@ no longer has clients, removing...", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_10();
}

@end
