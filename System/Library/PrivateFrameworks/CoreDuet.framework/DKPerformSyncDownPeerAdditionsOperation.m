@implementation DKPerformSyncDownPeerAdditionsOperation

void __72___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditions__block_invoke(uint64_t a1, void *a2)
{
  -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithDidPrewarm:orError:](*(_QWORD *)(a1 + 32), 1, a2);
}

void __95___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithDidPrewarm_orError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithHighWaterMark:orError:](*(_QWORD *)(a1 + 32), a2, a3);
}

void __93___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithCompletedWindows___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __93___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithCompletedWindows___block_invoke_cold_2(a1, v9, v10);

    objc_msgSend(*(id *)(a1 + 32), "errors");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v11, "addObject:", v9);
LABEL_10:

    objc_msgSend(*(id *)(a1 + 32), "endOperation");
    goto LABEL_11;
  }
  if (!v7 || !v8)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __93___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithCompletedWindows___block_invoke_cold_1(a1, v11);
    goto LABEL_10;
  }
  -[_DKPerformSyncDownPeerAdditionsOperation handleFetchedEvents:completedWindows:missingWindows:](*(_QWORD *)(a1 + 32), v7, v8, *(void **)(a1 + 40));
LABEL_11:

}

void __87___DKPerformSyncDownPeerAdditionsOperation__updateEventStatsWithIsNewestMissingWindow___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_down_additions_window"), CFSTR("age"), &unk_1E272BEC0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithIsNewestMissingWindow__syncDownAdditionsWindowAgeCounter;
  _updateEventStatsWithIsNewestMissingWindow__syncDownAdditionsWindowAgeCounter = v0;

}

void __96___DKPerformSyncDownPeerAdditionsOperation__updateEventStatsWithPreviousSyncDate_transportType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[_DKEventTypeStatsTimerCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsTimerCounter, CFSTR("coreduet_sync2"), CFSTR("sync_down_additions_cadence"), CFSTR("transport"), &unk_1E272BED8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_2;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_2 = v0;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("coreduet_sync2"), CFSTR("sync_down_additions_cadence"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_2;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_2 = v2;

}

uint64_t __96___DKPerformSyncDownPeerAdditionsOperation_handleFetchedEvents_completedWindows_missingWindows___block_invoke(uint64_t a1)
{
  return -[_DKPerformSyncDownPeerAdditionsOperation performSyncDownPeerAdditionsWithCompletedWindows:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __110___DKPerformSyncDownPeerAdditionsOperation__updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[_DKEventTypeStatsTimerCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsTimerCounter, CFSTR("coreduet_sync2"), CFSTR("sync_down_additions_latency"), CFSTR("transport"), &unk_1E272BEF0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyByTransportCounter;
  _updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyByTransportCounter = v0;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("coreduet_sync2"), CFSTR("sync_down_additions_latency"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyCounter;
  _updateEventStatsWithSyncLatencyOfEvent_ingressDate_transportType__syncDownAdditionsLatencyCounter = v2;

}

void __102___DKPerformSyncDownPeerAdditionsOperation__updateEventStatsWithTotal_streamNameCounts_transportType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_down_additions_total"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsTotalCounter;
  _updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsTotalCounter = v0;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_down_additions_total_by_transport"), CFSTR("transport"), &unk_1E272BF08);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsTotalByTransportCounter;
  _updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsTotalByTransportCounter = v2;

  v4 = objc_opt_new();
  v5 = (void *)_updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsCountersByStreamName;
  _updateEventStatsWithTotal_streamNameCounts_transportType__syncDownAdditionsCountersByStreamName = v4;

}

void __93___DKPerformSyncDownPeerAdditionsOperation_performSyncDownPeerAdditionsWithCompletedWindows___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_21_2(*(_QWORD *)(a1 + 32)) == 8)
    v8 = "up to";
  else
    v8 = "down from";
  v9 = &stru_1E26E9728;
  if (OUTLINED_FUNCTION_22_2(*(_QWORD *)(a1 + 32)))
    v10 = CFSTR("pseudo ");
  else
    v10 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_17_4(*(_QWORD *)(a1 + 32)), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_17_4(*(_QWORD *)(a1 + 32)), "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_17_4(*(_QWORD *)(a1 + 32)), "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v13, "stringWithFormat:", CFSTR(" (%@)"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + *(int *)(v4 + 132)), "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "code");
  *(_DWORD *)buf = 138545410;
  v20 = v7;
  v21 = 2082;
  v22 = v8;
  v23 = 2114;
  v24 = v10;
  OUTLINED_FUNCTION_14_4();
  v25 = v16;
  v26 = v14;
  v27 = v16;
  v28 = v15;
  v29 = 2048;
  v30 = v17;
  v31 = 2112;
  v32 = a2;
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed during additions sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@: %{public}@:%lld (%@)", buf, 0x5Cu);

  if (v12)
  {

  }
}

@end
