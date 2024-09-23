@implementation DKSyncCoordinatorLogging

void __48___DKSyncCoordinatorLogging_portraitStreamNames__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  +[_CDPortraitStreams topicStream](_CDPortraitStreams, "topicStream");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  +[_CDPortraitStreams entityStream](_CDPortraitStreams, "entityStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)portraitStreamNames_portraitStreamNames_0;
  portraitStreamNames_portraitStreamNames_0 = v6;

}

void __53___DKSyncCoordinatorLogging_typeValueWithStreamName___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  +[_CDPortraitStreams entityStream](_CDPortraitStreams, "entityStream");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v7[0] = CFSTR("entity");
  +[_CDPortraitStreams topicStream](_CDPortraitStreams, "topicStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  v7[1] = CFSTR("topic");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)typeValueWithStreamName__typeValueByStreamName;
  typeValueWithStreamName__typeValueByStreamName = v4;

}

void __91___DKSyncCoordinatorLogging__sendDistributedNotificationName_object_throttledActivityName___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:deliverImmediately:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

void __94___DKSyncCoordinatorLogging_syncCoordinator_didInsertLocalAdditionEventsWithStreamNameCounts___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("portraitknowledge"), CFSTR("sync_up"), CFSTR("type"), &unk_1E272C070);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)syncCoordinator_didInsertLocalAdditionEventsWithStreamNameCounts__syncCounter;
  syncCoordinator_didInsertLocalAdditionEventsWithStreamNameCounts__syncCounter = v0;

}

void __91___DKSyncCoordinatorLogging_syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("portraitknowledge"), CFSTR("sync_down"), CFSTR("type"), &unk_1E272C088);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__syncCounter;
  syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__syncCounter = v0;

  +[_DKEventTypeStatsTimerCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsTimerCounter, CFSTR("portraitknowledge"), CFSTR("addition_sync_latency"), CFSTR("type"), &unk_1E272C0A0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__additionSyncLatencyTimerCounter;
  syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__additionSyncLatencyTimerCounter = v2;

}

void __76___DKSyncCoordinatorLogging_syncCoordinator_didDeleteRemoteEventsWithCount___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("portraitknowledge"), CFSTR("delete"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)syncCoordinator_didDeleteRemoteEventsWithCount__syncCounter;
  syncCoordinator_didDeleteRemoteEventsWithCount__syncCounter = v0;

}

void __70___DKSyncCoordinatorLogging__syncCoordinatorDidCreateChangeSetOfType___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("portraitknowledge"), CFSTR("create_changeset"), CFSTR("type"), &unk_1E272C0B8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_syncCoordinatorDidCreateChangeSetOfType__syncCounter;
  _syncCoordinatorDidCreateChangeSetOfType__syncCounter = v0;

}

@end
