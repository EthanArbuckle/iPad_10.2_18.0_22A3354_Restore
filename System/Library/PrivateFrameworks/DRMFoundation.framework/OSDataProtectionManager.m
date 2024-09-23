@implementation OSDataProtectionManager

void __42___OSDataProtectionManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

void __32___OSDataProtectionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleKeyBagLockNotification");

}

void __56___OSDataProtectionManager_handleKeyBagLockNotification__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDataAvailableForClassA"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  +[_OSDataProtectionStateMonitor dataProtectionClassA](_OSDataProtectionStateMonitor, "dataProtectionClassA");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDataAvailableForClassC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  +[_OSDataProtectionStateMonitor dataProtectionClassC](_OSDataProtectionStateMonitor, "dataProtectionClassC");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

void __56___OSDataProtectionManager_handleKeyBagLockNotification__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v7, (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "BOOLValue");

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");

        if (v9 != (_DWORD)v11)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, v7);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

void __47___OSDataProtectionManager_isDataAvailableFor___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "BOOLValue");
    v2 = v3;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }

}

void __55___OSDataProtectionManager_registerStateChangeHandler___block_invoke(_QWORD *a1)
{
  id v2;

  v2 = (id)MEMORY[0x2207CDC38](a1[6]);
  objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKeyedSubscript:", v2, a1[5]);

}

uint64_t __57___OSDataProtectionManager_deregisterStateChangeHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

@end
