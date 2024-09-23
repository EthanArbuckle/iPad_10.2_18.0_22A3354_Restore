@implementation DKComplicationMonitor

void __31___DKComplicationMonitor_start__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "asyncUpdateCurrentActiveComplicationsContext");

}

void __31___DKComplicationMonitor_start__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  dispatch_time_t v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[19];
    v4 = WeakRetained;
    v3 = dispatch_walltime(0, 2000000000);
    dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    WeakRetained = v4;
  }

}

uint64_t __31___DKComplicationMonitor_start__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "asyncUpdateCurrentActiveComplicationsContext");
}

uint64_t __51___DKComplicationMonitor_fetchActiveComplications___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __51___DKComplicationMonitor_fetchActiveComplications___block_invoke_cold_1((uint64_t)v6, v7);

    v8 = 0;
  }
  else if (v5)
  {
    objc_msgSend(v5, "companionAppBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v5, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    v8 = 1;
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = *(id *)(a1 + 40);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((objc_msgSend(v18, "isEqual:", &stru_24DA67840) & 1) == 0)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v18);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = (void *)v19;
            if (v19)
              v21 = (__CFString *)v19;
            else
              v21 = &stru_24DA67840;
            v22 = v21;

            objc_msgSend(v12, "addObject:", v22);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v15);
    }

    objc_msgSend(*(id *)(a1 + 32), "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      _os_log_impl(&dword_219056000, v23, OS_LOG_TYPE_DEFAULT, "New list of active complications: %@\n", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v8 = 0;
    v5 = 0;
  }

  return v8;
}

void __70___DKComplicationMonitor_asyncUpdateCurrentActiveComplicationsContext__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE1B170];
  v4 = a2;
  objc_msgSend(v3, "userContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForActiveComplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 152));
}

void __51___DKComplicationMonitor_fetchActiveComplications___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_219056000, a2, OS_LOG_TYPE_ERROR, "failed to fetch list of installed applications on watch: %@\n", (uint8_t *)&v2, 0xCu);
}

@end
