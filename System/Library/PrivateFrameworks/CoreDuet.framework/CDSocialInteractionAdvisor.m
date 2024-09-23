@implementation CDSocialInteractionAdvisor

void __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke_101(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v3;
  float v4;
  unsigned int v5;

  v3 = *(float *)(a2 + 4);
  v4 = *(float *)(a3 + 4);
  if (v3 <= v4)
    v5 = 0;
  else
    v5 = -1;
  if (v3 < v4)
    return 1;
  else
    return v5;
}

void __87___CDSocialInteractionAdvisor_adviseInteractionsForDate_andSeedContacts_usingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __87___CDSocialInteractionAdvisor_adviseInteractionsForDate_andSeedContacts_usingSettings___block_invoke_109(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v3;
  float v4;

  v3 = *(float *)(a2 + 4);
  v4 = *(float *)(a3 + 4);
  if (v3 < v4)
    return 1;
  if (v3 <= v4)
    return (*(_DWORD *)a2 > *(_DWORD *)a3) - (*(_DWORD *)a2 < *(_DWORD *)a3);
  return 0xFFFFFFFFLL;
}

void __66___CDSocialInteractionAdvisor_tuneUsingSettings_heartBeatHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66___CDSocialInteractionAdvisor_tuneUsingSettings_heartBeatHandler___block_invoke_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __66___CDSocialInteractionAdvisor_tuneUsingSettings_heartBeatHandler___block_invoke_113(uint64_t a1, float a2, float a3, float a4, float a5, float a6, uint64_t a7, BOOL *a8)
{
  void *v15;
  id WeakRetained;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  objc_msgSend(*(id *)(a1 + 32), "tuningHeartBeatLambda:w0:threshold:score:progress:");
  v15 = *(void **)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(float *)&v17 = a2;
  *(float *)&v18 = a3;
  *(float *)&v19 = a4;
  *(float *)&v20 = a5;
  *(float *)&v21 = a6;
  objc_msgSend(v15, "modelTuner:heartBeatWithlambda:w0:threshold:score:progress:", WeakRetained, v17, v18, v19, v20, v21);

  *a8 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56) > *(double *)(a1 + 64);
}

void __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __66___CDSocialInteractionAdvisor_tuneUsingSettings_heartBeatHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "While tuning: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
