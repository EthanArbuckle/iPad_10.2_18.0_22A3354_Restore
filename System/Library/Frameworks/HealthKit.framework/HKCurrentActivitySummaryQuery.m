@implementation HKCurrentActivitySummaryQuery

void __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke_2;
    v15[3] = &unk_1E37E8738;
    v16 = v3;
    v7 = v2;
    v17 = *(_QWORD *)(a1 + 32);
    v18 = v7;
    objc_msgSend(v5, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v6, 0, v15);

  }
  else
  {
    _HKInitializeLogging();
    v8 = HKLogQuery;
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEBUG))
      __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke_cold_1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
  }

}

uint64_t __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _HKInitializeLogging();
  v2 = HKLogQuery;
  if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEBUG))
    __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __53___HKCurrentActivitySummaryQuery_queue_deliverError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

void __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_19A0E6000, a2, a3, "No update handler set. newActivitySummary: %@", a5, a6, a7, a8, 2u);
}

void __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_19A0E6000, a2, a3, "Calling update handler with activitySummary: %@", a5, a6, a7, a8, 2u);
}

@end
