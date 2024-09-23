@implementation DPTokenFetcher

void __32___DPTokenFetcher_doMaintenance__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __32___DPTokenFetcher_doMaintenance__block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  v13 = +[_DPTokenFetcher getTaskPeriodSeconds](_DPTokenFetcher, "getTaskPeriodSeconds");
  if (v13 != objc_msgSend(*(id *)(a1 + 32), "taskPeriodSeconds"))
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_msgSend(*(id *)(a1 + 32), "taskPeriodSeconds");
      v18 = 134218240;
      v19 = v15;
      v20 = 2048;
      v21 = v13;
      _os_log_impl(&dword_1D3FAA000, v14, OS_LOG_TYPE_INFO, "Token refresh seconds changed from %lud to %lud", (uint8_t *)&v18, 0x16u);
    }

    v16 = *(void **)(a1 + 32);
    objc_msgSend(v16, "taskName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scheduleMaintenanceWithName:database:", v17, 0);

    objc_msgSend(*(id *)(a1 + 32), "setTaskPeriodSeconds:", v13);
  }

}

void __56___DPTokenFetcher_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)os_transaction_create();
  v4 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(*(id *)(a1 + 32), "doMaintenance");
  objc_autoreleasePoolPop(v4);

}

void __32___DPTokenFetcher_doMaintenance__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Failed to fetch tokens with error: %@", a5, a6, a7, a8, 2u);
}

@end
