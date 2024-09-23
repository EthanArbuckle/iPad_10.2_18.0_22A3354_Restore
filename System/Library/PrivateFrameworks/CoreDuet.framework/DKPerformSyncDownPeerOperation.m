@implementation DKPerformSyncDownPeerOperation

void __70___DKPerformSyncDownPeerOperation__updateEventStatsWithTransportType___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_rapport_vs_cloud"), CFSTR("transport"), &unk_1E272BBA8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithTransportType__rapportVsCloudOptimizationCounter;
  _updateEventStatsWithTransportType__rapportVsCloudOptimizationCounter = v0;

}

@end
