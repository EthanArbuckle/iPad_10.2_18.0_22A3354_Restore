@implementation DKPerformSyncUpHistoryAdditionsOperation

void __74___DKPerformSyncUpHistoryAdditionsOperation_performSyncUpHistoryAdditions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithAdditionsHighWaterMark:orError:](*(void **)(a1 + 32), a2, a3);
}

void __100___DKPerformSyncUpHistoryAdditionsOperation_performSyncUpHistoryAdditionsWithPreviousHighWaterMark___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  +[_DKPerformSyncUpHistoryAdditionsOperation _updateEventStatsWithTotal:streamNameCounts:transportType:]((uint64_t)_DKPerformSyncUpHistoryAdditionsOperation, objc_msgSend(v3, "count"), *(void **)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 304), "transportType"));
  -[_DKPerformSyncUpHistoryAdditionsOperation handleUpdateStorageWithFetchedWindow:eventsCount:error:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 56), *(_QWORD *)(a1 + 64), v4);

}

void __97___DKPerformSyncUpHistoryAdditionsOperation__updateEventStatsWithPreviousSyncDate_transportType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[_DKEventTypeStatsTimerCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsTimerCounter, CFSTR("coreduet_sync2"), CFSTR("sync_up_history_additions_cadence"), CFSTR("transport"), &unk_1E272BE00);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_0;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter_0 = v0;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("coreduet_sync2"), CFSTR("sync_up_history_additions_cadence"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_0;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter_0 = v2;

}

void __100___DKPerformSyncUpHistoryAdditionsOperation_handleUpdateStorageWithFetchedWindow_eventsCount_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  -[_DKSyncType urgency](*(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[_DKPerformSyncUpHistoryAdditionsOperation performSyncUpHistoryAdditionsWithPreviousHighWaterMark:](v1, v2);

}

void __103___DKPerformSyncUpHistoryAdditionsOperation__updateEventStatsWithTotal_streamNameCounts_transportType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_up_history_additions_total"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsTotalCounter;
  _updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsTotalCounter = v0;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_up_history_additions_total_by_transport"), CFSTR("transport"), &unk_1E272BE18);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsTotalByTransportCounter;
  _updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsTotalByTransportCounter = v2;

  v4 = objc_opt_new();
  v5 = (void *)_updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsCountersByStreamName;
  _updateEventStatsWithTotal_streamNameCounts_transportType__syncUpHistoryAdditionsCountersByStreamName = v4;

}

@end
