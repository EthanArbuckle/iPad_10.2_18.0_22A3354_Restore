@implementation CDInteractionCache

void __80___CDInteractionCache_initWithInteractionStore_size_queryPredicate_filterBlock___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 15;
    v3 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 15);
    -[os_unfair_lock_s _refetch](v3, "_refetch");
    os_unfair_lock_unlock(v2);
    WeakRetained = v3;
  }

}

void __31___CDInteractionCache__refetch__block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x193FEE914]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("CDInteractionCache refetch", v1);
  v3 = (void *)_refetch__pasExprOnceResult;
  _refetch__pasExprOnceResult = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

void __31___CDInteractionCache__refetch__block_invoke_154(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "interactionStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "size");
  v13 = 0;
  objc_msgSend(v2, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v3, v4, v5, &v13);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __31___CDInteractionCache__refetch__block_invoke_154_cold_1((uint64_t)v7, v10);

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = MEMORY[0x1E0C9AA60];

  }
}

void __76___CDInteractionCache__updateMostRecentInteractionsWithInteraction_deleted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v9 = v3;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (*(_BYTE *)(a1 + 48))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isEqual:", v4))
      {
        +[_CDUncachedSentinel sharedInstance]();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v9);

      }
    }
    else if (!v4
           || (objc_msgSend(v4, "isUncachedSentinel") & 1) == 0
           && (objc_msgSend(v5, "interactionIfCached"),
               v7 = (void *)objc_claimAutoreleasedReturnValue(),
               v8 = _CDStartDateCompare(v7, *(void **)(a1 + 40)),
               v7,
               v8 == -1))
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), v9);
    }

    v3 = v9;
  }

}

void __31___CDInteractionCache__refetch__block_invoke_154_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_ERROR, "Error fetching interactions for interaction cache: %@", (uint8_t *)&v2, 0xCu);
}

@end
