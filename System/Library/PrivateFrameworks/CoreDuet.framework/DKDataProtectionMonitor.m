@implementation DKDataProtectionMonitor

uint64_t __57___DKDataProtectionMonitor_deregisterStateChangeHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __55___DKDataProtectionMonitor_registerStateChangeHandler___block_invoke(_QWORD *a1)
{
  id v2;

  v2 = (id)MEMORY[0x193FEEAF4](a1[6]);
  objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", v2, a1[5]);

}

void __47___DKDataProtectionMonitor_isDataAvailableFor___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
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

void __42___DKDataProtectionMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v1;

}

void __32___DKDataProtectionMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_DKDataProtectionMonitor handleKeyBagLockNotification]((uint64_t)WeakRetained);

}

uint64_t __35___DKDataProtectionMonitor_dealloc__block_invoke(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

void __56___DKDataProtectionMonitor_handleKeyBagLockNotification__block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1[4] + 24), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_DKDataProtectionMonitor isDataAvailableForClassA](a1[4]));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB2AB0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_DKDataProtectionMonitor isDataAvailableForClassC](a1[4]));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2AC0]);

  objc_msgSend(*(id *)(a1[4] + 8), "allValues");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "objectForKeyedSubscript:", v15, (_QWORD)v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "BOOLValue");

        objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "BOOLValue");

        if (v17 != (_DWORD)v19)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setObject:forKeyedSubscript:", v20, v15);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

@end
