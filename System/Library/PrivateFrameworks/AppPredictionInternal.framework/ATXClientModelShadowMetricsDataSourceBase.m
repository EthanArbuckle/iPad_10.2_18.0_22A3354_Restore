@implementation ATXClientModelShadowMetricsDataSourceBase

uint64_t __84___ATXClientModelShadowMetricsDataSourceBase_predictionCachePublisherFromStartDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientModelId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_eventBodyDateForEvent:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_eventBodyDateForEvent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

void __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_metrics();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_2_cold_1(v2, v4);

  }
}

BOOL __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int isKindOfClass;
  void *v11;
  NSObject *v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_eventBodyDateForEvent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "laterDate:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EF9D33B8);

    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 48);
LABEL_6:
      objc_msgSend(v3, "eventBody");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);

      goto LABEL_10;
    }
    objc_msgSend(v3, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = *(_QWORD *)(a1 + 56);
      goto LABEL_6;
    }
    __atxlog_handle_metrics();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_64_cold_1(v3, v12);

  }
LABEL_10:

  return v5 != v4;
}

void __92___ATXClientModelShadowMetricsDataSourceBase_enumeratePredictionsInCache_ofType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "executableType") == *(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXClientModelShadowMetricsDataSourceBase: Biome query completed with error %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

void __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_64_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = objc_opt_class();
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "ATXClientModelShadowMetricsDataSourceBase: unexpected event of class %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

@end
