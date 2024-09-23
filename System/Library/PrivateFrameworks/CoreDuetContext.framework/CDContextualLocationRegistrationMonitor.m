@implementation CDContextualLocationRegistrationMonitor

void __60___CDContextualLocationRegistrationMonitor_addRegistration___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "locationManagerEffectiveBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "registrations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "locationManagerEffectiveBundleID");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "managers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (-[NSObject isEqualToString:](v5, "isEqualToString:", CFSTR("com.apple.shortcuts")))
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", CFSTR("/System/Library/LocationBundles/ShortcutsLocation.bundle"));
        v9 = objc_alloc(MEMORY[0x1E0C9E3C8]);
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v10, "queue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v9, "initWithEffectiveBundle:delegate:onQueue:", v8, v10, v11);

      }
      else
      {
        v12 = objc_alloc(MEMORY[0x1E0C9E3C8]);
        v13 = *(void **)(a1 + 40);
        objc_msgSend(v13, "queue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v12, "initWithEffectiveBundleIdentifier:delegate:onQueue:", v5, v13, v8);
      }

      objc_msgSend(*(id *)(a1 + 40), "managers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, v5);

      objc_msgSend(*(id *)(a1 + 40), "effectiveBundleIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[NSObject copy](v5, "copy");
      objc_msgSend(v15, "setObject:forKey:", v16, v7);

      objc_msgSend(*(id *)(a1 + 40), "effectiveBundleIDRegionInfos");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v19 = objc_alloc_init(MEMORY[0x1E0C99D80]);
        objc_msgSend(*(id *)(a1 + 40), "effectiveBundleIDRegionInfos");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v5);

      }
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(*v2, "predicate", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "circularLocationRegions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v29 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v27, "setNotifyOnEntry:", 1);
          objc_msgSend(v27, "setNotifyOnExit:", 1);
          objc_msgSend(v7, "startMonitoringForRegion:", v27);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v24);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __60___CDContextualLocationRegistrationMonitor_addRegistration___block_invoke_cold_1(v2, v5);
  }

}

void __63___CDContextualLocationRegistrationMonitor_removeRegistration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "locationManagerEffectiveBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "predicate", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "circularLocationRegions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v5, "stopMonitoringForRegion:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

void __60___CDContextualLocationRegistrationMonitor_addRegistration___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18DD73000, a2, OS_LOG_TYPE_ERROR, "Cannot monitor location for contextual registration %@ which has no effective bundleID", (uint8_t *)&v4, 0xCu);

}

@end
