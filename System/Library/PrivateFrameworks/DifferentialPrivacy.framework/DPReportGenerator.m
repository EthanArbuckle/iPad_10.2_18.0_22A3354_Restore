@implementation DPReportGenerator

uint64_t __53___DPReportGenerator_filterNonConformingRecordsFrom___block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EFE36880) ^ 1;
}

void __67___DPReportGenerator_queryRecordCountForKey_withPredicate_storage___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;

  v7 = a4;
  if ((a2 & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  else
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __67___DPReportGenerator_queryRecordCountForKey_withPredicate_storage___block_invoke_cold_1(a1);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __49___DPReportGenerator_queryRecordsForKey_storage___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
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
    +[_DPLog daemon](_DPLog, "daemon");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __46___DPPrivacyBudget_fetchBudgetRecordFrom_key___block_invoke_cold_1(a1);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __50___DPReportGenerator_queryKeysForPattern_storage___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
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
    +[_DPLog daemon](_DPLog, "daemon");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __46___DPPrivacyBudget_fetchBudgetRecordFrom_key___block_invoke_cold_1(a1);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __54___DPReportGenerator_randomizeKeys_andSortByPriority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8256B78]();
  +[_DPKeyProperties keyPropertiesForName:](_DPKeyProperties, "keyPropertiesForName:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPKeyProperties keyPropertiesForName:](_DPKeyProperties, "keyPropertiesForName:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "submissionPriority");
  v10 = objc_msgSend(v8, "submissionPriority");
  v11 = -1;
  if (v9 >= v10)
    v11 = 1;
  if (v9 == v10)
    v12 = 0;
  else
    v12 = v11;

  objc_autoreleasePoolPop(v6);
  return v12;
}

void __59___DPReportGenerator_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  v3 = (void *)os_transaction_create();
  v4 = (void *)MEMORY[0x1D8256B78]();
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "generateReportUsing:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v4);

}

void __67___DPReportGenerator_queryRecordCountForKey_withPredicate_storage___block_invoke_cold_1(uint64_t a1)
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
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v2, v3, "%@: record count fetch failed with %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
