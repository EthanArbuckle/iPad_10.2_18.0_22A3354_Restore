@implementation CDInteractionStoreNotifier

void __45___CDInteractionStoreNotifier_sharedInstance__block_invoke()
{
  void *v0;
  _CDInteractionStoreNotifier *v1;
  void *v2;

  v0 = (void *)MEMORY[0x193FEE914]();
  v1 = objc_alloc_init(_CDInteractionStoreNotifier);
  v2 = (void *)sharedInstance__pasExprOnceResult_3;
  sharedInstance__pasExprOnceResult_3 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __35___CDInteractionStoreNotifier_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleXPCNotificationEvent:", v3);

}

void __35___CDInteractionStoreNotifier_init__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleXPCNotificationEvent:", v3);

}

uint64_t __57___CDInteractionStoreNotifier_filterInteractionsForUser___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "nsUserName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSUserName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

void __40___CDInteractionStoreNotifier_recorded___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v1 = a1;
  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v3)
  {
    v4 = v3;
    v18 = v1;
    LOBYTE(v5) = 0;
    v6 = 0;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      v9 = v5;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v2);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v11 = objc_msgSend(v10, "mechanism");
        v5 = 1;
        if ((v9 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "mechanism"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = objc_msgSend(v12, "isEqual:", &unk_1E272AF60);

        }
        v6 |= 1 << v11;
        ++v8;
        v9 = v5;
      }
      while (v4 != v8);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v4);

    v1 = v18;
    objc_msgSend(*(id *)(v18 + 40), "postPackedMechanisms:", v6);
  }
  else
  {

    v5 = 0;
  }
  objc_msgSend(*(id *)(v1 + 40), "filterInteractionsForUser:", *(_QWORD *)(v1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("_CDInteractionsKey");
    v15 = MEMORY[0x1E0C9AA60];
    if (*(_QWORD *)(v1 + 32))
      v15 = *(_QWORD *)(v1 + 32);
    v24 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("_CDInteractionStoreRecordedInteractionsNotification"), 0, v16);

    objc_msgSend(*(id *)(v1 + 40), "publishRecordedXPCEvent:", v13);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("_CDInteractionStoreRecordedShareSheetInteractionNotification"), 0, 0);

    }
  }

}

void __39___CDInteractionStoreNotifier_deleted___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  const __CFString *v16;
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v5 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "mechanism", (_QWORD)v12);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v4);

    objc_msgSend(*(id *)(a1 + 40), "postPackedMechanisms:", v5);
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 40), "filterInteractionsForUser:", *(_QWORD *)(a1 + 32), (_QWORD)v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("_CDInteractionsKey");
    v10 = MEMORY[0x1E0C9AA60];
    if (*(_QWORD *)(a1 + 32))
      v10 = *(_QWORD *)(a1 + 32);
    v17 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("_CDInteractionStoreDeletedInteractionsNotification"), 0, v11);

    objc_msgSend(*(id *)(a1 + 40), "publishDeletedXPCEvent:", v8);
  }

}

void __38___CDInteractionStoreNotifier_suspend__block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
}

void __55___CDInteractionStoreNotifier_publishRecordedXPCEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55___CDInteractionStoreNotifier_publishRecordedXPCEvent___block_invoke_cold_1(a1);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_DEFAULT, "Successfully sent event to %@", (uint8_t *)&v7, 0xCu);
  }

}

void __54___CDInteractionStoreNotifier_publishDeletedXPCEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55___CDInteractionStoreNotifier_publishRecordedXPCEvent___block_invoke_cold_1(a1);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_DEFAULT, "Successfully sent event to %@", (uint8_t *)&v7, 0xCu);
  }

}

void __55___CDInteractionStoreNotifier_publishRecordedXPCEvent___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_6_9(&dword_18DDBE000, v1, v2, "Failed to event to subscriber %@ for recorded interaction: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

@end
