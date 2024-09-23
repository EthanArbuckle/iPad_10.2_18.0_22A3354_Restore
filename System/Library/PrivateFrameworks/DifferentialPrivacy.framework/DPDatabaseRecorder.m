@implementation DPDatabaseRecorder

void __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "credit:amount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

void __53___DPDatabaseRecorder_recordNumbersVectors_metadata___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "credit:amount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

void __48___DPDatabaseRecorder_recordBitValues_metadata___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "credit:amount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

void __49___DPDatabaseRecorder_recordBitVectors_metadata___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "credit:amount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

void __51___DPDatabaseRecorder_recordFloatVectors_metadata___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "credit:amount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

uint64_t __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "blacklistSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((_DWORD)v5)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke_cold_1();

  }
  return v5;
}

void __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke_34(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "credit:amount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

void __35___DPDatabaseRecorder_recordWords___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "credit:amount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

void __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  v1 = (const char *)OUTLINED_FUNCTION_11(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v3, v4, "%@: failed to save records with error = %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_3(&dword_1D3FAA000, v0, v1, "\"%@\" : was in the do-not-send list : not recording in DB", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
