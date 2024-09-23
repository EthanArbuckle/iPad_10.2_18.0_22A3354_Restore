@implementation _DKSyncCoordinatorLogging

- (_DKSyncCoordinatorLogging)init
{
  _DKSyncCoordinatorLogging *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *notificationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DKSyncCoordinatorLogging;
  v2 = -[_DKSyncCoordinatorLogging init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.coreduet.SyncCoordinatorLogging.notificationQueue", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)portraitStreamNames
{
  if (a1)
  {
    if (portraitStreamNames_initialized_0 != -1)
      dispatch_once(&portraitStreamNames_initialized_0, &__block_literal_global_2_1);
    a1 = (id)portraitStreamNames_portraitStreamNames_0;
  }
  return a1;
}

- (id)typeValueWithStreamName:(void *)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    if (typeValueWithStreamName__initialized != -1)
      dispatch_once(&typeValueWithStreamName__initialized, &__block_literal_global_6_0);
    objc_msgSend((id)typeValueWithStreamName__typeValueByStreamName, "objectForKeyedSubscript:", v3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (void)_updateSyncCounter:(void *)a3 streamNameCounts:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[_DKSyncCoordinatorLogging portraitStreamNames](a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v13 = objc_msgSend(v6, "countForObject:", v12, (_QWORD)v16);
          if (v13)
          {
            v14 = v13;
            -[_DKSyncCoordinatorLogging typeValueWithStreamName:](a1, v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:]((uint64_t)v5, v14, v15);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
}

- (void)_sendDistributedNotificationName:(void *)a3 object:(void *)a4 throttledActivityName:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = a4;
    +[_DKThrottledActivity standardInstance](_DKThrottledActivity, "standardInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91___DKSyncCoordinatorLogging__sendDistributedNotificationName_object_throttledActivityName___block_invoke;
    v12[3] = &unk_1E26E3250;
    v13 = v7;
    v14 = v8;
    objc_msgSend(v10, "performWithMinimumIntervalInSecondsOf:name:queue:activityBlock:", v9, v11, v12, 2.0);

  }
}

- (void)_sendDistributedNotificationName:(uint64_t)a1
{
  void *v3;
  id v4;
  id v5;

  if (a1)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = a2;
    objc_msgSend(v3, "stringWithFormat:", CFSTR("_DKSyncCoordinatorLogging%@"), v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:object:throttledActivityName:](a1, v4, 0, v5);

  }
}

- (void)_sendDistributedNotificationName:(void *)a3 streamNameCounts:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[_DKSyncCoordinatorLogging portraitStreamNames](a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v6, "countForObject:", v12))
          {
            -[_DKSyncCoordinatorLogging typeValueWithStreamName:](a1, v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_DKSyncCoordinatorLogging%@%@"), v5, v13, (_QWORD)v15);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:object:throttledActivityName:]((uint64_t)a1, v5, v12, v14);

            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (void)syncCoordinator:(id)a3 didInsertLocalAdditionEventsWithStreamNameCounts:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = syncCoordinator_didInsertLocalAdditionEventsWithStreamNameCounts__syncCounterInitialized;
  v6 = a4;
  v8 = v6;
  if (v5 == -1)
  {
    v7 = v6;
  }
  else
  {
    dispatch_once(&syncCoordinator_didInsertLocalAdditionEventsWithStreamNameCounts__syncCounterInitialized, &__block_literal_global_18_2);
    v7 = v8;
  }
  -[_DKSyncCoordinatorLogging _updateSyncCounter:streamNameCounts:](self, (void *)syncCoordinator_didInsertLocalAdditionEventsWithStreamNameCounts__syncCounter, v7);
  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:streamNameCounts:](self, CFSTR("_DKSyncCoordinatorDidInsertLocalAdditionEventsNotification"), v8);

}

- (void)syncCoordinator:(id)a3 didInsertLocalDeletionEventsWithCount:(unint64_t)a4
{
  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:]((uint64_t)self, CFSTR("_DKSyncCoordinatorDidInsertLocalDeletionEventsNotification"));
}

- (void)syncCoordinator:(id)a3 didAddRemoteEventsWithStreamNameCounts:(id)a4 events:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = v8;
  if (syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__syncCounterInitialized != -1)
    dispatch_once(&syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__syncCounterInitialized, &__block_literal_global_26_0);
  v25 = v9;
  -[_DKSyncCoordinatorLogging _updateSyncCounter:streamNameCounts:](self, (void *)syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__syncCounter, v9);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v17, "stream", v25, v26, (_QWORD)v27);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[_DKSyncCoordinatorLogging typeValueWithStreamName:](self, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v17, "endDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            v23 = v21;
          }
          else
          {
            objc_msgSend(v17, "startDate");
            v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          v24 = v23;

          -[_DKEventTypeStatsTimerCounter addTimingWithStartDate:endDate:typeValue:](syncCoordinator_didAddRemoteEventsWithStreamNameCounts_events__additionSyncLatencyTimerCounter, (uint64_t)v24, v11, v20);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:streamNameCounts:](self, CFSTR("_DKSyncCoordinatorDidAddRemoteEventsNotification"), v25);
}

- (void)syncCoordinator:(id)a3 didDeleteRemoteEventsWithCount:(unint64_t)a4
{
  if (syncCoordinator_didDeleteRemoteEventsWithCount__syncCounterInitialized != -1)
    dispatch_once(&syncCoordinator_didDeleteRemoteEventsWithCount__syncCounterInitialized, &__block_literal_global_37);
  -[_DKEventStatsCounter incrementCountByNumber:](syncCoordinator_didDeleteRemoteEventsWithCount__syncCounter, a4);
  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:]((uint64_t)self, CFSTR("_DKSyncCoordinatorDidDeleteRemoteEventsNotification"));
}

- (void)_syncCoordinatorDidCreateChangeSetOfType:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if (_syncCoordinatorDidCreateChangeSetOfType__syncCounterInitialized != -1)
      dispatch_once(&_syncCoordinatorDidCreateChangeSetOfType__syncCounterInitialized, &__block_literal_global_41);
    -[_DKEventTypeStatsCounter incrementCountWithTypeValue:](_syncCoordinatorDidCreateChangeSetOfType__syncCounter, v5);
    v4 = v5;
  }

}

- (void)syncCoordinator:(id)a3 didCreateAdditionChangeSet:(id)a4
{
  -[_DKSyncCoordinatorLogging _syncCoordinatorDidCreateChangeSetOfType:]((uint64_t)self, CFSTR("addition"));
  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:]((uint64_t)self, CFSTR("_DKSyncCoordinatorDidCreateAdditionChangeSetNotification"));
}

- (void)syncCoordinator:(id)a3 didCreateDeletionChangeSet:(id)a4
{
  -[_DKSyncCoordinatorLogging _syncCoordinatorDidCreateChangeSetOfType:]((uint64_t)self, CFSTR("deletion"));
  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:]((uint64_t)self, CFSTR("_DKSyncCoordinatorDidCreateDeletionChangeSetNotification"));
}

- (void)syncCoordinator:(id)a3 didApplyRemoteAdditionChangeSet:(id)a4
{
  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:]((uint64_t)self, CFSTR("_DKSyncCoordinatorDidApplyRemoteAdditionChangeSetNotification"));
}

- (void)syncCoordinator:(id)a3 didApplyRemoteDeletionChangeSet:(id)a4
{
  -[_DKSyncCoordinatorLogging _sendDistributedNotificationName:]((uint64_t)self, CFSTR("_DKSyncCoordinatorDidApplyRemoteDeletionChangeSetNotification"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end
