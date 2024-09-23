@implementation DKNowPlayingMonitor

uint64_t __28___DKNowPlayingMonitor_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "primaryValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {
    objc_msgSend(v4, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

    v11 = v10 - 1;
  }
  else
  {

    v11 = -1;
  }

  return v11;
}

uint64_t __41___DKNowPlayingMonitor__eventFilterBlock__block_invoke_22(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("unknown"));
  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __41___DKNowPlayingMonitor__eventFilterBlock__block_invoke_22_cold_1(v5);

  }
  return v4;
}

void __47___DKNowPlayingMonitor_outputDevicesDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "outputContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_219056000, v4, OS_LOG_TYPE_INFO, "Output devices in now playing monitor changed, %@ output devices", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  MRMediaRemoteGetActiveOrigin();

}

void __47___DKNowPlayingMonitor_outputDevicesDidChange___block_invoke_34(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_nowPlayingInfoDidChange:outputDevices:", a3, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __47___DKNowPlayingMonitor_outputDevicesDidChange___block_invoke_34_cold_1(v3);

  }
}

void __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_metadataFromInfo:outputDevices:", v5, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE65788]);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE65778]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE657E0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(v15, "BOOLValue");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2_cold_2();
  }
  else
  {
    MRNowPlayingClientGetBundleIdentifier();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = a1 + 48;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v5;

    v4 = MRNowPlayingClientCopyBundleIdentifierHierarchy();
    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2_cold_1(a1 + 48, (uint64_t)v4, v9);

    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 40), "isEqualToString:", CFSTR("com.apple.tvairplayd"))&& (unint64_t)-[NSObject count](v4, "count") >= 2)
    {
      -[NSObject objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 1);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)v6 + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_52(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2_54(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unsigned int v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v3;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_219056000, v2, OS_LOG_TYPE_INFO, "Updated now playing info for %@ with %@ output devices", buf, 0x16u);

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_QWORD *)(v5 + 40))
  {
    *(_QWORD *)(v5 + 40) = &stru_24DA67840;

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    if (objc_msgSend(&unk_24DA70E20, "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 40), "_stripMetadata:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0D8], "playing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

    objc_msgSend((id)objc_opt_class(), "_eventWithBundleIdentifier:metadata:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setCurrentEvent:inferHistoricalState:", v26, 1);
    v24 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x24BE1B0D8], "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x24BE1B0D8], "outputDeviceIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x24BE1B0D8], "mediaType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x24BE1B0D8], "iTunesStoreIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x24BE1B0D8], "iTunesSubscriptionIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKNowPlayingMonitor setPlaybackState:bundleId:track:outputDeviceIDs:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:](_DKNowPlayingMonitor, "setPlaybackState:bundleId:track:outputDeviceIDs:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:", v24, v23, v10, v13, v16, v19, v22);

    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 164) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 40), "saveBMEventWithCurrent:outputDevices:artistStoreIdentifier:albumStoreIdentifier:excludeFromSuggestions:", v26, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));

  }
}

void __41___DKNowPlayingMonitor__eventFilterBlock__block_invoke_22_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_219056000, log, OS_LOG_TYPE_DEBUG, "Now playing monitor filtered out unknown now playing event", v1, 2u);
}

void __47___DKNowPlayingMonitor_outputDevicesDidChange___block_invoke_34_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219056000, log, OS_LOG_TYPE_ERROR, "Failed to fetch active now playing origin after receiving output devices changed notification", v1, 2u);
}

void __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_219056000, log, OS_LOG_TYPE_DEBUG, "Retrived now playing bundle identifier: %@; hierarchy: %@",
    (uint8_t *)&v4,
    0x16u);
}

void __63___DKNowPlayingMonitor__nowPlayingInfoDidChange_outputDevices___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_0(&dword_219056000, v0, v1, "Could not retrieve now playing client. Failed with error: %{public}@", v2);
}

@end
