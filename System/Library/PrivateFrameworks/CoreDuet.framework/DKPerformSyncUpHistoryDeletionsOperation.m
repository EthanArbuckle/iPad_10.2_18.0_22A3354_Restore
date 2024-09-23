@implementation DKPerformSyncUpHistoryDeletionsOperation

void __74___DKPerformSyncUpHistoryDeletionsOperation_performSyncUpHistoryDeletions__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithDeletionsHighWaterMark:orError:](*(id **)(a1 + 32), a2, a3);
}

void __100___DKPerformSyncUpHistoryDeletionsOperation_performSyncUpHistoryDeletionsWithPreviousHighWaterMark___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  v5 = a1[7];
  v7 = a2;
  v6 = -[_DKSyncDeletedEventIDs count](v5);
  -[_DKPerformSyncUpHistoryDeletionsOperation handleUpdateStorageWithStartDate:endDate:deletedEventIDsCount:orError:](v2, v3, v4, v6, v7);

}

void __97___DKPerformSyncUpHistoryDeletionsOperation__updateEventStatsWithPreviousSyncDate_transportType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[_DKEventTypeStatsTimerCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsTimerCounter, CFSTR("coreduet_sync2"), CFSTR("sync_up_history_deletions_cadence"), CFSTR("transport"), &unk_1E272BE30);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_1;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_1 = v0;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("coreduet_sync2"), CFSTR("sync_up_history_deletions_cadence"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_1;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_1 = v2;

}

uint64_t __115___DKPerformSyncUpHistoryDeletionsOperation_handleUpdateStorageWithStartDate_endDate_deletedEventIDsCount_orError___block_invoke(uint64_t a1)
{
  return -[_DKPerformSyncUpHistoryDeletionsOperation performSyncUpHistoryDeletionsWithPreviousHighWaterMark:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __86___DKPerformSyncUpHistoryDeletionsOperation__updateEventStatsWithTotal_transportType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_up_history_deletions_total"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsTotalCounter;
  _updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsTotalCounter = v0;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_up_history_deletions_total_by_transport"), CFSTR("transport"), &unk_1E272BE48);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsTotalByTransportCounter;
  _updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsTotalByTransportCounter = v2;

  v4 = objc_opt_new();
  v5 = (void *)_updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsCountersByStreamName;
  _updateEventStatsWithTotal_transportType__syncUpHistoryDeletionsCountersByStreamName = v4;

}

void __74___DKPerformSyncUpHistoryDeletionsOperation_performSyncUpHistoryDeletions__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11, int a12, __int16 a13, __int16 a14, void *a15, __int128 a16, __int128 a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  const __CFString *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;

  OUTLINED_FUNCTION_6_0();
  a30 = v31;
  a31 = v32;
  v34 = v33;
  v36 = v35;
  a19 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](*(void **)(v36 + 40));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](*(void **)(v36 + 48));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = &stru_1E26E9728;
  if (objc_msgSend(*(id *)(*(_QWORD *)(v36 + 32) + 320), "me"))
    v41 = CFSTR("pseudo ");
  else
    v41 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_12_2(), "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12_2(), "model");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_12_2(), "model");
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringWithFormat:", CFSTR(" (%@)"));
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  LODWORD(a11) = 138544642;
  *(_QWORD *)((char *)&a11 + 4) = v37;
  WORD6(a11) = 2114;
  *(_QWORD *)((char *)&a11 + 14) = v38;
  a14 = 2114;
  a15 = v39;
  LOWORD(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 2) = v41;
  WORD5(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 12) = v42;
  WORD2(a17) = 2114;
  *(_QWORD *)((char *)&a17 + 6) = v40;
  OUTLINED_FUNCTION_9_4(&dword_18DDBE000, v34, v43, "%{public}@: Successfully fast forwarded bookmark [%{public}@ ending %{public}@] for %{public}@peer %{public}@%{public}@", (uint8_t *)&a11);
  if (v44)
  {

  }
  OUTLINED_FUNCTION_1_0();
}

void __74___DKPerformSyncUpHistoryDeletionsOperation_performSyncUpHistoryDeletions__block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v3;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[72];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](*(void **)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](*(void **)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_9_4(&dword_18DDBE000, a3, v10, "%{public}@: Did not fast forwarding bookmark [%{public}@ ending %{public}@]: %{public}@:%lld (%@)", v11);

  OUTLINED_FUNCTION_11_3();
}

void __74___DKPerformSyncUpHistoryDeletionsOperation_performSyncUpHistoryDeletions__block_invoke_cold_3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v3;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[72];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](*(void **)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](*(void **)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_2_8();
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed while fast forwarding bookmark [%{public}@ ending %{public}@]: %{public}@:%lld (%@)", v10, 0x3Eu);

  OUTLINED_FUNCTION_11_3();
}

@end
