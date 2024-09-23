@implementation ATXUpdatePredictions

void __ATXUpdatePredictions_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;

  v3 = a3;
  __atxlog_handle_lock_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5)
      __ATXUpdatePredictions_block_invoke_cold_2((uint64_t)v3, v4, v6);
  }
  else if (v5)
  {
    __ATXUpdatePredictions_block_invoke_cold_1(v4);
  }

}

void __ATXUpdatePredictions_block_invoke_20(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:](ATXUpdatePredictionsReasons, "stringForUpdatePredictionsReason:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXUpdatePredictions: cache age %lf, reason %@", (uint8_t *)&v7, 0x16u);

  }
  _ATXInitializeInOwnerProcess();
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  +[ATXUpdatePredictionsManager sharedInstance](ATXUpdatePredictionsManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateBehavioralPredictionsIfOlderThan:reason:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 32));

  objc_autoreleasePoolPop(v5);
  atomic_store(0, ATXUpdatePredictions_updateInProgress);
}

void __ATXUpdatePredictions_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "successfully regenerated gallery after process restart due to language change", v1, 2u);
}

void __ATXUpdatePredictions_block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "error regenerating gallery after process restart due to language change: %@", (uint8_t *)&v3);
}

@end
