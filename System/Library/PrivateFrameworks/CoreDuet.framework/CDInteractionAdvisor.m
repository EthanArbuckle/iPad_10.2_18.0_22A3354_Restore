@implementation CDInteractionAdvisor

void __57___CDInteractionAdvisor_adviseInteractionsUsingSettings___block_invoke_9(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __49___CDInteractionAdvisor_sharedInteractionAdvisor__block_invoke()
{
  _CDInteractionAdvisor *v0;
  void *v1;

  v0 = -[_CDInteractionAdvisor initWithServiceName:]([_CDInteractionAdvisor alloc], "initWithServiceName:", CFSTR("com.apple.coreduetd.people"));
  v1 = (void *)sharedInteractionAdvisor_advisor;
  sharedInteractionAdvisor_advisor = (uint64_t)v0;

}

void __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
}

void __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_7(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57___CDInteractionAdvisor_adviseInteractionsUsingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
}

void __65___CDInteractionAdvisor_adviseInteractionsForDate_usingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
}

void __65___CDInteractionAdvisor_adviseInteractionsForDate_usingSettings___block_invoke_16(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __87___CDInteractionAdvisor_adviseSocialInteractionsForDate_andSeedContacts_usingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
}

void __87___CDInteractionAdvisor_adviseSocialInteractionsForDate_andSeedContacts_usingSettings___block_invoke_17(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __77___CDInteractionAdvisor_adviseInteractionsForKeywordsInString_usingSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
}

void __77___CDInteractionAdvisor_adviseInteractionsForKeywordsInString_usingSettings___block_invoke_18(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __73___CDInteractionAdvisor_tuneSocialAdvisorUsingSettings_heartBeatHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
}

void __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "XPC Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
