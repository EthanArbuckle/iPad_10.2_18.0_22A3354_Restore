@implementation DPPrivacyBudget

void __30___DPPrivacyBudget_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v1 = (void *)gAllBudgets;
  gAllBudgets = v0;

}

void __46___DPPrivacyBudget_fetchBudgetRecordFrom_key___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;

  v8 = a3;
  v9 = a4;
  if ((a2 & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __46___DPPrivacyBudget_fetchBudgetRecordFrom_key___block_invoke_cold_1(a1);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __44___DPPrivacyBudget_fetchBudgetKeyNamesFrom___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;

  v8 = a3;
  v9 = a4;
  if ((a2 & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __46___DPPrivacyBudget_fetchBudgetRecordFrom_key___block_invoke_cold_1(a1);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __87___DPPrivacyBudget_createDatabaseRecordIfMissingIn_key_balance_cohortAggregateBalance___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __87___DPPrivacyBudget_createDatabaseRecordIfMissingIn_key_balance_cohortAggregateBalance___block_invoke_cold_1(a1);

  }
}

void __46___DPPrivacyBudget_fetchBudgetRecordFrom_key___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v2, v3, "%@: record fetch failed with %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __87___DPPrivacyBudget_createDatabaseRecordIfMissingIn_key_balance_cohortAggregateBalance___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v2, v3, "%@: record save failed with %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
