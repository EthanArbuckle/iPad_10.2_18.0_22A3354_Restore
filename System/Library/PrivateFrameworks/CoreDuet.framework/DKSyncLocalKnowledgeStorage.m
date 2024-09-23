@implementation DKSyncLocalKnowledgeStorage

uint64_t __109___DKSyncLocalKnowledgeStorage_sortedEventsFromSyncWindows_streamNames_compatibility_limit_fetchOrder_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __84___DKSyncLocalKnowledgeStorage_tombstonesSinceDate_streamNames_limit_endDate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __87___DKSyncLocalKnowledgeStorage__updateEventStatsWithFetchEventsTotal_streamNameCounts___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_fetch_local_events_total"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsTotalCounter;
  _updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsTotalCounter = v0;

  v2 = objc_opt_new();
  v3 = (void *)_updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsCountersByStreamName;
  _updateEventStatsWithFetchEventsTotal_streamNameCounts__fetchEventsCountersByStreamName = v2;

}

void __91___DKSyncLocalKnowledgeStorage__updateEventStatsWithFetchTombstonesTotal_streamNameCounts___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_fetch_local_tombstones_total"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesTotalCounter;
  _updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesTotalCounter = v0;

  v2 = objc_opt_new();
  v3 = (void *)_updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesCountersByStreamName;
  _updateEventStatsWithFetchTombstonesTotal_streamNameCounts__fetchTombstonesCountersByStreamName = v2;

}

uint64_t __95___DKSyncLocalKnowledgeStorage_sortedSyncDownWindowsOverlappingBetweenDate_andDate_peer_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __84___DKSyncLocalKnowledgeStorage_lastSyncDownDeletionDateForPeer_transportName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __87___DKSyncLocalKnowledgeStorage_syncHistoryForPeer_streamName_transportName_type_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __87___DKSyncLocalKnowledgeStorage_syncHistoryForPeer_streamName_transportName_type_error___block_invoke_68(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

@end
