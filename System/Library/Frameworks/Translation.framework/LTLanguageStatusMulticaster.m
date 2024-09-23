@implementation LTLanguageStatusMulticaster

void __38___LTLanguageStatusMulticaster_shared__block_invoke()
{
  _LTLanguageStatusMulticaster *v0;
  void *v1;

  v0 = objc_alloc_init(_LTLanguageStatusMulticaster);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;

}

void __51___LTLanguageStatusMulticaster__removeAllObservers__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(WeakRetained[2], "keyEnumerator", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2[2], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
            objc_msgSend(v2, "removeObserver:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

void __44___LTLanguageStatusMulticaster_addObserver___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[2];
    v16 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v16;
    if (!v5)
    {
      v6 = *(id *)(a1 + 32);
      v7 = objc_msgSend(v6, "observationType");
      v8 = objc_msgSend(v6, "useDedicatedMachPort");

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu:%d"), v7, v8 ^ 1u);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v16 + 4), "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(*((id *)v16 + 3), "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "observations");
          v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v12)[2](v12, v11);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)v16 + 4), "setObject:forKeyedSubscript:", v11, v9);
        objc_msgSend(v16, "_startWithConnectionIdentifier:observationType:useDedicatedMachPort:", v11, objc_msgSend(*(id *)(a1 + 32), "observationType"), objc_msgSend(*(id *)(a1 + 32), "useDedicatedMachPort"));
      }

      v13 = (void *)*((_QWORD *)v16 + 2);
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v14, v15);

      WeakRetained = v16;
    }
  }

}

void __47___LTLanguageStatusMulticaster_removeObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[2], "objectForKey:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v6;
    if (v3)
    {
      objc_msgSend(v6[2], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu:%d"), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56) == 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6[4], "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v6[4], "setObject:forKeyedSubscript:", 0, v4);
        objc_msgSend(v6, "_cancelWithConnectionIdentifier:observationType:useDedicatedMachPort:", v5, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
      }

      WeakRetained = v6;
    }
  }

}

void __80___LTLanguageStatusMulticaster__multicastObservations_observationType_progress___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu:%d"), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[3], "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), v3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(WeakRetained[2], "keyEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(WeakRetained[2], "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            if (objc_msgSend(v10, "observationType") == *(_QWORD *)(a1 + 48)
              && *(unsigned __int8 *)(a1 + 56) != objc_msgSend(v11, "useDedicatedMachPort"))
            {
              objc_msgSend(v11, "observations");
              v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v12[2](v12, *(_QWORD *)(a1 + 32));

            }
          }
          else
          {
            objc_msgSend(WeakRetained[2], "removeObjectForKey:", v9);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
}

void __115___LTLanguageStatusMulticaster__reconnectIfStreamingWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_startWithConnectionIdentifier:observationType:useDedicatedMachPort:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
    WeakRetained = v3;
  }

}

void __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = _LTOSLogAssets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
    objc_msgSend(WeakRetained, "_reconnectIfStreamingWithConnectionIdentifier:observationType:useDedicatedMachPort:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  }

}

void __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16[2];
  char v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_2;
    v12[3] = &unk_250693B28;
    v13 = v5;
    v10 = *(id *)(a1 + 32);
    v11 = *(void **)(a1 + 48);
    v14 = v10;
    v16[1] = v11;
    objc_copyWeak(v16, (id *)(a1 + 40));
    v15 = v6;
    v17 = *(_BYTE *)(a1 + 56);
    dispatch_async(v9, v12);

    objc_destroyWeak(v16);
  }

}

void __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10[2];
  char v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_3;
  v7[3] = &unk_250693B00;
  objc_copyWeak(v10, (id *)(a1 + 56));
  v9 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v6 = *(void **)(a1 + 64);
  v8 = v5;
  v10[1] = v6;
  v11 = *(_BYTE *)(a1 + 72);
  objc_msgSend(v2, "startLanguageStatusChangeObservation:type:completion:", v3, v4, v7);

  objc_destroyWeak(v10);
}

void __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = _LTOSLogAssets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_3_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(WeakRetained, "_reconnectIfStreamingWithConnectionIdentifier:observationType:useDedicatedMachPort:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  }

}

void __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];

  v2 = a2;
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 == (void *)*MEMORY[0x24BDD0B88])
    {
      v6 = objc_msgSend(v3, "code");

      if (v6 == 4099)
      {
        v7 = _LTOSLogAssets();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_235438000, v7, OS_LOG_TYPE_INFO, "Language status observation closed was expected so ignoring hangup error", v15, 2u);
        }
        goto LABEL_9;
      }
    }
    else
    {

    }
    v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_cold_1((uint64_t)v3, v8, v9, v10, v11, v12, v13, v14);
LABEL_9:

  }
}

void __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_2;
    block[3] = &unk_250693B98;
    v11 = v5;
    v12 = *(id *)(a1 + 32);
    v13 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancelLanguageStatusChangeObservation:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a2, a3, "Language status observation connection closed due to error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a2, a3, "Language status observation closed due to error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_235438000, a2, a3, "Failed to cancel language status observations: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
