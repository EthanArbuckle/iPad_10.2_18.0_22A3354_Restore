@implementation DKPerformSyncDownPeerDeletionsOperation

void __72___DKPerformSyncDownPeerDeletionsOperation_performSyncDownPeerDeletions__block_invoke(uint64_t a1, void *a2)
{
  -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithDidPrewarm:orError:](*(_QWORD *)(a1 + 32), 1, a2);
}

void __94___DKPerformSyncDownPeerDeletionsOperation_performSyncDownPeerDeletionsWithPreviousUntilDate___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a1[4];
  v10 = v7;
  if (v7)
  {
    objc_msgSend(v8, "errors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    objc_msgSend(a1[4], "endOperation");
  }
  else
  {
    -[_DKPerformSyncDownPeerDeletionsOperation handleFetchedDeletedEventIDs:startDate:endDate:untilDate:]((uint64_t)v8, a2, a1[5], a1[6], a3);
  }

}

void __96___DKPerformSyncDownPeerDeletionsOperation__updateEventStatsWithPreviousSyncDate_transportType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[_DKEventTypeStatsTimerCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsTimerCounter, CFSTR("coreduet_sync2"), CFSTR("sync_down_deletions_cadence"), CFSTR("transport"), &unk_1E272BD88);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceByTransportCounter = v0;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("coreduet_sync2"), CFSTR("sync_down_deletions_cadence"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter;
  _updateEventStatsWithPreviousSyncDate_transportType__syncCadenceCounter = v2;

}

uint64_t __101___DKPerformSyncDownPeerDeletionsOperation_handleFetchedDeletedEventIDs_startDate_endDate_untilDate___block_invoke(uint64_t a1)
{
  return -[_DKPerformSyncDownPeerDeletionsOperation performSyncDownPeerDeletionsWithPreviousUntilDate:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __85___DKPerformSyncDownPeerDeletionsOperation__updateEventStatsWithTotal_transportType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_down_deletions_total"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithTotal_transportType__syncDownDeletionsTotalCounter;
  _updateEventStatsWithTotal_transportType__syncDownDeletionsTotalCounter = v0;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_down_deletions_total_by_transport"), CFSTR("transport"), &unk_1E272BDA0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_updateEventStatsWithTotal_transportType__syncDownDeletionsTotalByTransportCounter;
  _updateEventStatsWithTotal_transportType__syncDownDeletionsTotalByTransportCounter = v2;

  v4 = objc_opt_new();
  v5 = (void *)_updateEventStatsWithTotal_transportType__syncDownDeletionsCountersByStreamName;
  _updateEventStatsWithTotal_transportType__syncDownDeletionsCountersByStreamName = v4;

}

@end
