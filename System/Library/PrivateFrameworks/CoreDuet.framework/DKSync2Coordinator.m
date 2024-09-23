@implementation DKSync2Coordinator

void __39___DKSync2Coordinator_initWithContext___block_invoke(uint64_t a1, void *a2, int a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  -[_DKSync2Coordinator handleDataProtectionChangeFor:willBeAvailable:]((uint64_t)WeakRetained, v5, a3);

}

void __39___DKSync2Coordinator_initWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_DKSync2Coordinator _reregisterPeriodicJob]((uint64_t)WeakRetained);

}

void __39___DKSync2Coordinator_initWithContext___block_invoke_3(uint64_t a1)
{
  -[_DKSync2Coordinator _performSyncTogglesChangedActions](*(_QWORD *)(a1 + 32));
}

uint64_t __45___DKSync2Coordinator__performEnableAndStart__block_invoke(uint64_t a1)
{
  -[_DKSync2Coordinator configureTracker](*(_QWORD **)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setupStorage");
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

void __39___DKSync2Coordinator_configureTracker__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleStatusChangeForPeer:previousTransports:", v5, a3);

}

void __88___DKSync2Coordinator_shouldDeferSyncOperationWithClass_syncType_transport_peer_policy___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("SyncCoordinator"), CFSTR("xpc_activity_should_defer"), CFSTR("result"), &unk_1E272BAE8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldDeferSyncOperationWithClass_syncType_transport_peer_policy__shouldDeferCounter;
  shouldDeferSyncOperationWithClass_syncType_transport_peer_policy__shouldDeferCounter = v0;

}

uint64_t __51___DKSync2Coordinator_fetchSourceDeviceIDFromPeer___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  -[_DKSync2Coordinator handleFetchedSourceDeviceID:version:fromPeer:error:](*(_QWORD *)(a1 + 32), a2, a3, *(void **)(a1 + 40), a4);
  return -[_DKSync2Coordinator removeBusyTransaction:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48));
}

void __37___DKSync2Coordinator_syncWithReply___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id *v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37___DKSync2Coordinator_syncWithReply___block_invoke_2;
  v2[3] = &unk_1E26E2F98;
  v1 = *(void **)(a1 + 40);
  v3 = *(id **)(a1 + 32);
  v4 = v1;
  -[_DKSync2Coordinator _performSyncWithForceSync:completion:](v3, 1, v2);

}

void __37___DKSync2Coordinator_syncWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __37___DKSync2Coordinator_syncWithReply___block_invoke_2_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __37___DKSync2Coordinator_syncWithReply___block_invoke_2_cold_1();
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, BOOL, id))(v6 + 16))(v6, v3 == 0, v3);

}

void __59___DKSync2Coordinator_synchronizeWithUrgency_client_reply___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  unint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(id **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59___DKSync2Coordinator_synchronizeWithUrgency_client_reply___block_invoke_2;
  v4[3] = &unk_1E26E2FE8;
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  -[_DKSync2Coordinator _synchronizeWithUrgency:client:completion:](v1, v3, v2, v4);

}

uint64_t __59___DKSync2Coordinator_synchronizeWithUrgency_client_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

void __65___DKSync2Coordinator__synchronizeWithUrgency_client_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __37___DKSync2Coordinator_syncWithReply___block_invoke_2_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __37___DKSync2Coordinator_syncWithReply___block_invoke_2_cold_1();
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __59___DKSync2Coordinator__performSyncWithSyncType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __59___DKSync2Coordinator__performSyncWithSyncType_completion___block_invoke_cold_2();

  -[_DKSync2State finishWithError:](*(_QWORD *)(a1 + 40), v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (void *)*((_QWORD *)WeakRetained + 12);
    if (v7 == *(void **)(a1 + 40))
    {
      *((_QWORD *)WeakRetained + 12) = 0;

    }
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __59___DKSync2Coordinator__performSyncWithSyncType_completion___block_invoke_cold_1();

}

void __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke()
{
  NSObject *v0;
  NSObject *v1;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v0);

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke_cold_1();

}

void __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke_439(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  id v7;
  _BYTE *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "isCancelled");
    v3 = v9;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v9, "errors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      v3 = v9;
      if (!v6)
      {
        v7 = objc_loadWeakRetained((id *)(a1 + 40));
        v8 = v7;
        if (v7)
        {
          objc_msgSend(*((id *)v7 + 27), "removeObjectForKey:", CFSTR("DeletedSyncedEventCount"));
          v8[201] = 1;
        }

        v3 = v9;
      }
    }
  }

}

void __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke_2(void **a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  -[_DKSync2Coordinator __finishSyncWithTransaction:startDate:completion:]((uint64_t)WeakRetained, a1[4], a1[5], a1[6]);

}

void __53___DKSync2Coordinator__updateEventStatsWithSyncType___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("coreduet_sync2"), CFSTR("sync_is_single_device"), CFSTR("is_single_device"), &unk_1E272BB00);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithSyncType__isSingleDeviceSyncCounter;
  _updateEventStatsWithSyncType__isSingleDeviceSyncCounter = v0;

}

void __77___DKSync2Coordinator__updateEventStatsWithSyncElapsedTimeStartDate_endDate___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("coreduet_sync2"), CFSTR("sync_elapsed_time"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateEventStatsWithSyncElapsedTimeStartDate_endDate__syncElapsedTimeCounter;
  _updateEventStatsWithSyncElapsedTimeStartDate_endDate__syncElapsedTimeCounter = v0;

}

void __50___DKSync2Coordinator__possiblyPerformInitialSync__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  -[_DKSync2Coordinator _performInitialSync](WeakRetained);

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 216);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDate:forKey:", v4, CFSTR("InitialSyncWithCloudDate"));

}

void __42___DKSync2Coordinator__performInitialSync__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42___DKSync2Coordinator__performInitialSync__block_invoke_cold_1();

  }
}

void __42___DKSync2Coordinator__performPeriodicJob__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  -[_DKSync2Coordinator _finishActivityWithError:](*(_QWORD *)(a1 + 32), v3);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42___DKSync2Coordinator__performPeriodicJob__block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __42___DKSync2Coordinator__performPeriodicJob__block_invoke_cold_1();
  }

}

void __56___DKSync2Coordinator__registerPeriodicJobWithInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[_DKSync2Coordinator _performPeriodicJob]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

void __69___DKSync2Coordinator_handleDataProtectionChangeFor_willBeAvailable___block_invoke(uint64_t a1)
{
  -[_DKSync2Coordinator _performSyncTogglesChangedActions](*(_QWORD *)(a1 + 32));
}

void __55___DKSync2Coordinator__cloudSyncAvailabilityDidChange___block_invoke(uint64_t a1)
{
  -[_DKSync2Coordinator _performSyncTogglesChangedActions](*(_QWORD *)(a1 + 32));
}

void __60___DKSync2Coordinator__registerCloudSyncAvailablityObserver__block_invoke(uint64_t a1)
{
  NSObject *v2;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  -[_DKSync2Coordinator _performSyncTogglesChangedActions](*(_QWORD *)(a1 + 32));
}

void __63___DKSync2Coordinator__registerCloudDeviceCountChangedObserver__block_invoke(uint64_t a1)
{
  NSObject *v2;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  -[_DKSync2Coordinator _reregisterPeriodicJob](*(_QWORD *)(a1 + 32));
}

void __58___DKSync2Coordinator__registerRapportAvailablityObserver__block_invoke(uint64_t a1)
{
  NSObject *v2;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  -[_DKSync2Coordinator _performSyncTogglesChangedActions](*(_QWORD *)(a1 + 32));
}

void __60___DKSync2Coordinator__registerRapportLaunchOnDemandHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  const char *string;
  NSObject *v4;
  xpc_object_t reply;

  v2 = a2;
  string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E0C81298]);
  if (string)
  {
    if (!strcmp(string, "OnIncomingRequest"))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __60___DKSync2Coordinator__registerRapportLaunchOnDemandHandler__block_invoke_cold_1();

    }
    if (xpc_dictionary_get_BOOL(v2, "replyRequired"))
    {
      reply = xpc_dictionary_create_reply(v2);
      if (reply)
        xpc_dictionary_send_reply();

    }
  }

}

void __44___DKSync2Coordinator__syncPolicyDidChange___block_invoke(uint64_t a1)
{
  -[_DKSync2Coordinator _performSyncTogglesChangedActions](*(_QWORD *)(a1 + 32));
}

void __77___DKSync2Coordinator__deleteNextBatchOfOurSiriEventsFromCloudWithStartDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;

  v3 = a2;
  if (v3)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77___DKSync2Coordinator__deleteNextBatchOfOurSiriEventsFromCloudWithStartDate___block_invoke_cold_2();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "creationDate");
    v4 = objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_DKSync2Coordinator _deleteNextBatchOfOurSiriEventsFromCloudWithStartDate:](*(_QWORD *)(a1 + 40), v4);
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __77___DKSync2Coordinator__deleteNextBatchOfOurSiriEventsFromCloudWithStartDate___block_invoke_cold_1();

    }
  }

}

void __45___DKSync2Coordinator_removeBusyTransaction___block_invoke(uint64_t a1)
{
  -[_DKSync2Coordinator possiblyUpdateIsBusyProperty](*(_QWORD *)(a1 + 32));
}

void __49___DKSync2Coordinator__runTriggeredSyncActivity___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_DKSync2Coordinator _unregisterTriggeredSyncActivity]((uint64_t)WeakRetained);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __49___DKSync2Coordinator__runTriggeredSyncActivity___block_invoke_cold_1();

}

void __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  _QWORD v5[4];
  _xpc_activity_s *v6;
  id v7;
  _QWORD v8[4];
  _xpc_activity_s *v9;
  id v10;
  char v11;
  uint8_t buf[4];
  _xpc_activity_s *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    if (!state)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke_2;
      v8[3] = &unk_1E26E31E0;
      objc_copyWeak(&v10, (id *)(a1 + 32));
      v9 = v3;
      v11 = *(_BYTE *)(a1 + 40);
      +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v8);

      objc_destroyWeak(&v10);
    }
    goto LABEL_13;
  }
  if (xpc_activity_set_state(v3, 4))
  {
LABEL_12:
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke_495;
    v5[3] = &unk_1E26E30F0;
    objc_copyWeak(&v7, (id *)(a1 + 32));
    v6 = v3;
    +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v5);

    objc_destroyWeak(&v7);
    goto LABEL_13;
  }
  if (!xpc_activity_should_defer(v3))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke_cold_1();
    xpc_activity_set_completion_status();
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Warning: deferring activity '%@' before it started", buf, 0xCu);
  }
  xpc_activity_set_state(v3, 3);
LABEL_13:

}

void __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_DKSync2Coordinator _checkInTriggeredSyncActivity:isStartup:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

void __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke_495(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_DKSync2Coordinator _runTriggeredSyncActivity:](WeakRetained, *(void **)(a1 + 32));

}

void __83___DKSync2Coordinator_APSConnectionDelegate__connection_didReceiveIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;

  v2 = a2;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __83___DKSync2Coordinator_APSConnectionDelegate__connection_didReceiveIncomingMessage___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __83___DKSync2Coordinator_APSConnectionDelegate__connection_didReceiveIncomingMessage___block_invoke_cold_1();
  }

}

void __108___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate___databaseDidDeleteFromStreamNameCounts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __108___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate___databaseDidDeleteFromStreamNameCounts___block_invoke_cold_2(a1, v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __108___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate___databaseDidDeleteFromStreamNameCounts___block_invoke_cold_1();
  }

}

uint64_t __122___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate__knowledgeStorage_didDeleteEventsWithStreamNameCounts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_databaseDidDeleteFromStreamNameCounts:", *(_QWORD *)(a1 + 40));
}

void __37___DKSync2Coordinator_syncWithReply___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_13(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Syncing succeeded", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __37___DKSync2Coordinator_syncWithReply___block_invoke_2_cold_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Syncing failed: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void __59___DKSync2Coordinator__performSyncWithSyncType_completion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_13(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Finished sync", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __59___DKSync2Coordinator__performSyncWithSyncType_completion___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_13(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Finishing sync", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __51___DKSync2Coordinator___performSyncWithCompletion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_13(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Started sync operations", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __42___DKSync2Coordinator__performInitialSync__block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Failed while attempting initial sync: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void __42___DKSync2Coordinator__performPeriodicJob__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)objc_opt_class(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Periodic sync succeeded", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __42___DKSync2Coordinator__performPeriodicJob__block_invoke_cold_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)objc_opt_class(), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Periodic sync failed: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void __60___DKSync2Coordinator__registerRapportLaunchOnDemandHandler__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_13(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Launched by Rapport to service a request", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __77___DKSync2Coordinator__deleteNextBatchOfOurSiriEventsFromCloudWithStartDate___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)objc_opt_class(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_23(&dword_18DDBE000, v1, v2, "%{public}@: Failed to find event creation date while deleting local Siri events", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __77___DKSync2Coordinator__deleteNextBatchOfOurSiriEventsFromCloudWithStartDate___block_invoke_cold_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)objc_opt_class(), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Failed while deleting Siri events from Cloud: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void __49___DKSync2Coordinator__runTriggeredSyncActivity___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_13(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Finished triggered sync", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __67___DKSync2Coordinator__registerTriggeredSyncActivityWithIsStartup___block_invoke_cold_1()
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Failed to set activity '%@' state to continue", v0, 0xCu);
}

void __83___DKSync2Coordinator_APSConnectionDelegate__connection_didReceiveIncomingMessage___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_13(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Push-triggered sync succeeded", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __83___DKSync2Coordinator_APSConnectionDelegate__connection_didReceiveIncomingMessage___block_invoke_cold_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Push-triggered sync failed: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void __108___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate___databaseDidDeleteFromStreamNameCounts___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_30();
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v0 + 40), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v3, v4, "%{public}@: Delete of %@ event streams triggered sync attempt succeeded", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __108___DKSync2Coordinator__DKKnowledgeStorageEventNotificationDelegate___databaseDidDeleteFromStreamNameCounts___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[56];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_17();
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Delete of %@ event stream triggered sync attempt failed: %{public}@:%lld (%@)", v9, 0x34u);

  OUTLINED_FUNCTION_22();
}

@end
