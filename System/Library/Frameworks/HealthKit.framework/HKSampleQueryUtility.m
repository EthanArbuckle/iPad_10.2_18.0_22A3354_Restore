@implementation HKSampleQueryUtility

void __57___HKSampleQueryUtility_setupQueryWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
      __57___HKSampleQueryUtility_setupQueryWithCompletionHandler___block_invoke_cold_1();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "handleAddedObjects:deletedObjects:queryAnchor:error:resultsHandler:", v10, v11, v12, v13, *(_QWORD *)(a1 + 40));

}

void __42___HKSampleQueryUtility_setUpdateHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *WeakRetained;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v13)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
        __42___HKSampleQueryUtility_setUpdateHandler___block_invoke_cold_1();
    }
    objc_msgSend(WeakRetained, "handleAddedObjects:deletedObjects:queryAnchor:error:resultsHandler:", v10, v11, v12, v13, WeakRetained[8]);
  }

}

uint64_t __92___HKSampleQueryUtility_handleAddedObjects_deletedObjects_queryAnchor_error_resultsHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

void __57___HKSampleQueryUtility_setupQueryWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "Failed to get results for _HKSampleQueryUtility (type: %@) with error: %@");
}

void __42___HKSampleQueryUtility_setUpdateHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "Failed to get update results for _HKSampleQueryUtility (type: %@) with error: %@");
}

@end
