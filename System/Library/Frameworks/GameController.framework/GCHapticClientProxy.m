@implementation GCHapticClientProxy

void __60___GCHapticClientProxy__initWithConnection_server_clientID___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  objc_msgSend(v1, "invalidate");

}

void __71___GCHapticClientProxy_InvalidationObservable__addInvalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v3 = WeakRetained;
    objc_sync_enter(v3);
    objc_msgSend(v3, "invalidationHandlers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v6 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "removeObject:", v6);

    objc_msgSend(v3, "setInvalidationHandlers:", v5);
    objc_sync_exit(v3);

    WeakRetained = v7;
  }

}

void __62___GCHapticClientProxy_HapticServer__queryCapabilities_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("SupportsAudioPlayback"))
    || objc_msgSend(v3, "isEqualToString:", CFSTR("SupportsAdvancedPatternPlayers")))
  {
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("HapticContinuousTimeLimit")))
  {
    v4 = *(void **)(a1 + 32);
    +[NSNumber numberWithUnsignedInt:](&off_254DED908, "numberWithUnsignedInt:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, v3);
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("UsingInternalHaptics")))
  {
LABEL_7:
    v6 = *(void **)(a1 + 32);
    +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v3);
    goto LABEL_8;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HapticTransientDefaultIntensity")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("HapticTransientDefaultSharpness")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("HapticContinuousDefaultIntensity")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("HapticContinuousDefaultSharpness")) & 1) != 0)
    {
      v7 = &unk_24D30FCC8;
LABEL_17:
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v3);
      goto LABEL_9;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("HapticTransientEventIDs")))
    {
      v8 = *(unsigned __int8 *)(a1 + 48);
      v9 = &unk_24D30FBD8;
      v10 = &unk_24D30FBF0;
      goto LABEL_24;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("HapticContinuousSustainedEventIDs")))
    {
      v8 = *(unsigned __int8 *)(a1 + 48);
      v9 = &unk_24D30FC08;
      v10 = &unk_24D30FC20;
      goto LABEL_24;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("HapticContinuousNonsustainedEventIDs")))
    {
      v8 = *(unsigned __int8 *)(a1 + 48);
      v9 = &unk_24D30FC38;
      v10 = &unk_24D30FC50;
LABEL_24:
      if (v8)
        v7 = v9;
      else
        v7 = v10;
      goto LABEL_17;
    }
  }
LABEL_9:
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v3;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "Set %@ to %@", (uint8_t *)&v13, 0x16u);

    }
  }

}

uint64_t __64___GCHapticClientProxy_HapticServer__teardownAndReleaseChannels__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(v9 + 176);
      v11 = *(_QWORD *)(v9 + 224);
      *(_DWORD *)buf = 134218242;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - teardownAndReleaseChannels: %@", buf, 0x16u);
    }

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 224);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v5), (_QWORD)v12);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "teardown");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "removeAllObjects");
}

uint64_t __53___GCHapticClientProxy_HapticServer__releaseChannels__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
      *(_DWORD *)buf = 134217984;
      v16 = v9;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - releaseChannels", buf, 0xCu);
    }

  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 224);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v5), (_QWORD)v10);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setRetainedByClient:", 0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "removeAllObjects");
}

void __60___GCHapticClientProxy_HapticServer__requestChannels_reply___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1[4] + 176);
      v23 = (void *)a1[6];
      *(_DWORD *)buf = 134218240;
      v38 = v22;
      v39 = 2048;
      v40 = v23;
      _os_log_impl(&dword_215181000, v21, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - requestChannels (count=%lu)", buf, 0x16u);
    }

  }
  v2 = a1[6];
  if (v2 < objc_msgSend(*(id *)(a1[4] + 224), "count"))
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("GCHapticClientProxy.mm"), 564, CFSTR("Client attempting to request fewer channels than already reserved"));

  }
  v3 = a1[6];
  v4 = objc_msgSend(*(id *)(a1[4] + 224), "count");
  +[_GCHapticServerManager sharedInstance](_GCHapticServerManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__onqueue_reserveChannels:forClient:", v3 - v4, a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
        ++*(_DWORD *)(a1[4] + 168);
        v12 = *(void **)(a1[4] + 224);
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v11, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }

  +[NSMutableArray array](&off_254DEBB20, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = *(id *)(a1[4] + 224);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v28;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(a1[4] + 224), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18), (_QWORD)v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v16);
  }

  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(_QWORD *)(a1[4] + 176);
      *(_DWORD *)buf = 134218242;
      v38 = v26;
      v39 = 2112;
      v40 = v14;
      _os_log_impl(&dword_215181000, v25, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - reply requestChannels -> %@", buf, 0x16u);
    }

  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __58___GCHapticClientProxy_HapticServer__removeChannel_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1[4] + 176);
      v10 = a1[6];
      v12 = 134218240;
      v13 = v9;
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - removeChannel, %lu", (uint8_t *)&v12, 0x16u);
    }

  }
  v2 = *(void **)(a1[4] + 224);
  +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "setRetainedByClient:", 0);
    v5 = *(void **)(a1[4] + 224);
    +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", a1[6]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);
    v7 = 0;
  }
  else
  {
    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", CFSTR("Attempting to remove channel that client does not have"), *MEMORY[0x24BDD0FC8]);
    +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("Game Controller Haptics"), -4804, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __58___GCHapticClientProxy_HapticServer__removeChannel_reply___block_invoke_cold_1((uint64_t)(a1 + 4), v11);

  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __58___GCHapticClientProxy_HapticServer__removeChannel_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 176);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 224);
  v4 = 134218242;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_215181000, a2, OS_LOG_TYPE_DEBUG, "HapticClient %lu - removeChannels - channels=%@", (uint8_t *)&v4, 0x16u);
}

@end
