@implementation ICPortraitPredictionSource

void __37___ICPortraitPredictionSource_warmUp__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _ICProactiveQuickTypeOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_22716D000, v2, OS_LOG_TYPE_INFO, "_ICPPSource warmed up %@", (uint8_t *)&v4, 0xCu);
  }

}

void __35___ICPortraitPredictionSource_init__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  NSObject *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "lock");
    objc_msgSend(*(id *)(a1 + 32), "_makePPQuickTypeBroker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPpBroker:", v4);

    objc_msgSend(v3[1], "broadcast");
    objc_msgSend(v3[1], "unlock");
  }
  _ICProactiveQuickTypeOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __35___ICPortraitPredictionSource_init__block_invoke_cold_1();

}

uint64_t __53___ICPortraitPredictionSource__makePPQuickTypeBroker__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE71B28], "sharedInstance");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_makePPQuickTypeBroker_broker;
  _makePPQuickTypeBroker_broker = v0;

  return objc_msgSend((id)_makePPQuickTypeBroker_broker, "setClientIdentifier:", CFSTR("ICPred"));
}

void __63___ICPortraitPredictionSource__populateError_withExplanations___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BE71B30], "uniqueKeycodeFromExplanation:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

void __84___ICPortraitPredictionSource__quickTypeQueryWithQuery_limit_timeoutInMilliseconds___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (!objc_msgSend(v6, "count"))
  {
    _ICProactiveQuickTypeOSLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_22716D000, v8, OS_LOG_TYPE_INFO, "Portrait returned no results for Me card regions: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __122___ICPortraitPredictionSource__quickTypeQueryWithTrigger_searchContext_limit_timeoutInMilliseconds_errorWithExplanations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id obj;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (!objc_msgSend(v6, "count"))
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v9 + 40);
    objc_msgSend(v8, "_populateError:withExplanations:", &obj, v7);
    objc_storeStrong((id *)(v9 + 40), obj);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __122___ICPortraitPredictionSource__quickTypeQueryWithTrigger_searchContext_limit_timeoutInMilliseconds_errorWithExplanations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id obj;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (!objc_msgSend(v6, "count"))
  {
    _ICProactiveQuickTypeOSLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_22716D000, v8, OS_LOG_TYPE_INFO, "Portrait returned no results for Me card regions: %@", buf, 0xCu);
    }

    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v10 + 40);
    objc_msgSend(v9, "_populateError:withExplanations:", &obj, v7);
    objc_storeStrong((id *)(v10 + 40), obj);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __35___ICPortraitPredictionSource_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22716D000, v0, v1, "PP Broker shared instance retrieved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
