@implementation BMBiomeXPCSchedulerInner

void __43___BMBiomeXPCSchedulerInner_requestDemand___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id WeakRetained;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v8 && v9)
  {
    if (v11)
    {
      v15 = 138412802;
      v16 = v7;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v8;
      _os_log_debug_impl(&dword_18D810000, v10, OS_LOG_TYPE_DEBUG, "BMBiomeScheduler received callback from subscription %@, publishing event %@ for stream %@", (uint8_t *)&v15, 0x20u);
    }

    v12 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v9, "timestamp");
    objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInitialBookmarkTimestamp:", v13);

    objc_msgSend(*(id *)(a1 + 32), "switchToPublisherWithStreamIdentifier:storeEvent:", v8, v9);
  }
  else
  {
    if (v11)
      __43___BMBiomeXPCSchedulerInner_requestDemand___block_invoke_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "switchToUpdatedPublisher");

  }
}

uint64_t __42___BMBiomeXPCSchedulerInner_receiveInput___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "receiveInput:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __43___BMBiomeXPCSchedulerInner_requestDemand___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_18D810000, v0, OS_LOG_TYPE_DEBUG, "BMBiomeScheduler received callback from subscription %@, reading bookmark and subscribing to DSL graph publisher", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
