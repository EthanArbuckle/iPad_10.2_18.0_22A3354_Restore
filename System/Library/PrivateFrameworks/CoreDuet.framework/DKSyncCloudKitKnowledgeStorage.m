@implementation DKSyncCloudKitKnowledgeStorage

void __49___DKSyncCloudKitKnowledgeStorage_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = v0;

}

void __69___DKSyncCloudKitKnowledgeStorage_finishStartBecauseCloudIsAvailable__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  -[_DKSyncCloudKitKnowledgeStorage unregisterUpdateSourceDeviceIdentifiersPeriodicJob](v3);
  -[_DKSyncCloudKitKnowledgeStorage finishStartOrError:](*(_QWORD *)(a1 + 32), v4);

}

uint64_t __75___DKSyncCloudKitKnowledgeStorage_startShouldUpdateSourceDeviceIdentifiers__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __71___DKSyncCloudKitKnowledgeStorage__registerDatabaseChangesSubscription__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a4;
  if (v7)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __71___DKSyncCloudKitKnowledgeStorage__registerDatabaseChangesSubscription__block_invoke_cold_2();
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setBool:forKey:", 1, CFSTR("DidRegisterDatabaseChangesSubscription"));
  if (objc_msgSend(v6, "count") != 1)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __71___DKSyncCloudKitKnowledgeStorage__registerDatabaseChangesSubscription__block_invoke_cold_1();
    goto LABEL_7;
  }
LABEL_8:

}

void __67___DKSyncCloudKitKnowledgeStorage__cloudSyncAvailabilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_6;
  if ((*(_BYTE *)(v2 + 152) & 1) == 0)
    goto LABEL_5;
  v3 = +[_DKCloudUtilities isSyncAvailableAndEnabled](_DKCloudUtilities, "isSyncAvailableAndEnabled");
  v2 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    if (v2)
    {
LABEL_5:
      if ((*(_BYTE *)(v2 + 152) & 1) != 0)
        return;
    }
LABEL_6:
    if (+[_DKCloudUtilities isSyncAvailableAndEnabled](_DKCloudUtilities, "isSyncAvailableAndEnabled"))
      -[_DKSyncCloudKitKnowledgeStorage finishStartBecauseCloudIsAvailable](*(id **)(a1 + 32));
    return;
  }
  if (v2)
    *(_BYTE *)(v2 + 152) = 0;
  +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:userInfo:sender:", CFSTR("_DKCloudTransportAvailablityChangedNotification"), 0, *(_QWORD *)(a1 + 32));

}

void __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("coreduet_cloud_kit"), CFSTR("unrecoverable_decryption_error"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorCounter;
  _handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorCounter = v0;

  +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, CFSTR("coreduet_cloud_kit"), CFSTR("unrecoverable_decryption_error_repeat"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorRepeatCounter;
  _handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorRepeatCounter = v2;

}

void __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_67_cold_1();

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_68;
  v8[3] = &unk_1E26E3580;
  v8[4] = v6;
  v8[5] = v7;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  -[_DKSyncCloudKitKnowledgeStorage _createZoneWithZoneID:completion:](v6, v7, v8);

}

void __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_68_cold_1(a1, v3, v6);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_INFO, "%{public}@: Recreated zone %{public}@ due to unrecoverable decryption error", buf, 0x16u);

    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqual:", *(_QWORD *)(a1 + 48)))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setBool:forKey:", 1, CFSTR("HaveCreatedMyZone"));
  }
  objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 40));
  v9 = objc_msgSend(*(id *)(a1 + 56), "count");
  if (v9 == objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_69;
    v10[3] = &unk_1E26E2F20;
    v10[4] = *(_QWORD *)(a1 + 32);
    +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v10);
  }

}

uint64_t __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_69(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_18DDBE000, v2, OS_LOG_TYPE_INFO, "%{public}@: Fetching source device identifiers after handling unrecoverable decryption errors", buf, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_70;
  v9 = &unk_1E26E3118;
  v10 = v4;
  return -[_DKSyncCloudKitKnowledgeStorage performUpdateSourceDeviceIdentifiersWithCompletion:]();
}

void __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_70(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_70_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_INFO, "%{public}@: Done fetching source device identifiers after handling unrecoverable decryption errors", (uint8_t *)&v6, 0xCu);

  }
}

void __97___DKSyncCloudKitKnowledgeStorage__queueOperationForPrivateCloudDatabase_dependent_policy_error___block_invoke(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "associateWithCompletedOperation:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "submitEventMetric:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __97___DKSyncCloudKitKnowledgeStorage__queueOperationForPrivateCloudDatabase_dependent_policy_error___block_invoke_cold_1();

  }
}

void __86___DKSyncCloudKitKnowledgeStorage_performUpdateSourceDeviceIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
  -[_DKSyncCloudKitKnowledgeStorage _performThrottledUpdateSourceDeviceIdentifiersWithCompletion:](*(void **)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __86___DKSyncCloudKitKnowledgeStorage_performUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2;
  v10[3] = &unk_1E26E35D0;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  objc_copyWeak(&v16, (id *)(a1 + 64));
  v10[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  v14 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 40);
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);

}

void __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  char v18;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v3 = objc_loadWeakRetained((id *)(a1 + 80));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudKitMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "syncType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v9, 4, v7, v8, objc_msgSend(*(id *)(a1 + 40), "count") == 0);

  }
  v10 = *(id *)(a1 + 48);
  if (*(_QWORD *)(a1 + 48))
  {
    if ((+[_DKCKError isIgnorableError:]((uint64_t)_DKCKError, *(void **)(a1 + 48)) & 1) == 0)
    {
      v11 = objc_msgSend(*(id *)(a1 + 40), "count");
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (v11)
      {
        if (v13)
          __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2_cold_2();
      }
      else if (v13)
      {
        __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2_cold_1();
      }

    }
    -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:](WeakRetained, *(void **)(a1 + 48));
    v14 = objc_claimAutoreleasedReturnValue();

    -[_DKSyncCloudKitKnowledgeStorage scheduleRetryUpdateSourceDeviceIdentifiers]((uint64_t)WeakRetained);
    v10 = (id)v14;
  }
  +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID](_DKSyncCloudKitKnowledgeStorage, "mySyncZoneID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v16 = *(void **)(a1 + 40);
    v17 = *(void (***)(_QWORD, _QWORD))(a1 + 64);
LABEL_18:
    -[_DKSyncCloudKitKnowledgeStorage updateSourceDeviceIdentifiersWithRecordZonesByZoneID:completion:](WeakRetained, v16, v17);
    goto LABEL_19;
  }
  v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "containsObject:", v15);
  v17 = *(void (***)(_QWORD, _QWORD))(a1 + 64);
  if ((v18 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_18;
  }
  if (v17)
    ((void (**)(_QWORD, id))v17)[2](*(_QWORD *)(a1 + 64), v10);
LABEL_19:

}

void __99___DKSyncCloudKitKnowledgeStorage_updateSourceDeviceIdentifiersWithRecordZonesByZoneID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __99___DKSyncCloudKitKnowledgeStorage_updateSourceDeviceIdentifiersWithRecordZonesByZoneID_completion___block_invoke_cold_1(a1, v3, v4);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setBool:forKey:", 1, CFSTR("HaveCreatedMyZone"));
  }
  -[_DKSyncCloudKitKnowledgeStorage finishUpdatingSourceDeviceIdentifiersWithZoneIDsBySourceDeviceID:orError:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48), v3, *(void **)(a1 + 56));

}

uint64_t __77___DKSyncCloudKitKnowledgeStorage_scheduleRetryUpdateSourceDeviceIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __77___DKSyncCloudKitKnowledgeStorage_scheduleRetryUpdateSourceDeviceIdentifiers__block_invoke_2;
  v6 = &unk_1E26E3118;
  v7 = v1;
  return -[_DKSyncCloudKitKnowledgeStorage performUpdateSourceDeviceIdentifiersWithCompletion:]();
}

void __77___DKSyncCloudKitKnowledgeStorage_scheduleRetryUpdateSourceDeviceIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (!a2)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __77___DKSyncCloudKitKnowledgeStorage_scheduleRetryUpdateSourceDeviceIdentifiers__block_invoke_2_cold_1();

  }
}

void __68___DKSyncCloudKitKnowledgeStorage__createZoneWithZoneID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v10);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68___DKSyncCloudKitKnowledgeStorage__createZoneWithZoneID_completion___block_invoke_2;
  v14[3] = &unk_1E26E3648;
  objc_copyWeak(&v20, (id *)(a1 + 64));
  v11 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v11;
  v12 = v7;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  v19 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 48);
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v14);

  objc_destroyWeak(&v20);
}

void __68___DKSyncCloudKitKnowledgeStorage__createZoneWithZoneID_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "metrics");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cloudKitMetrics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "syncType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v6, 8, v4, v5, objc_msgSend(*(id *)(a1 + 40), "count") == 0);

  }
  -[_DKSyncCloudKitKnowledgeStorage _storeZoneIDFromRecords:orError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56));
  v7 = *(_QWORD *)(a1 + 72);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 56));

}

void __68___DKSyncCloudKitKnowledgeStorage__deleteZoneWithZoneID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v10);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68___DKSyncCloudKitKnowledgeStorage__deleteZoneWithZoneID_completion___block_invoke_2;
  v13[3] = &unk_1E26E3698;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  v11 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v11;
  v17 = *(id *)(a1 + 56);
  v12 = v9;
  v15 = v12;
  v16 = *(id *)(a1 + 48);
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v13);

  objc_destroyWeak(&v18);
}

void __68___DKSyncCloudKitKnowledgeStorage__deleteZoneWithZoneID_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "metrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudKitMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "syncType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v8, 8, v6, v7, objc_msgSend(*(id *)(a1 + 40), "count") == 0);

    v3 = v10;
  }
  v9 = *(_QWORD *)(a1 + 64);
  if (v9)
  {
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 48));
    v3 = v10;
  }

}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2;
  v5[3] = &unk_1E26E36C0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v6 = v4;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v5);
  objc_destroyWeak(&v7);

}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id WeakRetained;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_18DDBE000, v2, OS_LOG_TYPE_INFO, "%{public}@: Zone %{public}@ has changes.", (uint8_t *)&v9, 0x16u);

  }
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID](_DKSyncCloudKitKnowledgeStorage, "mySyncZoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[_DKSyncCloudKitKnowledgeStorage setHasZoneAdditionChanges:forZone:](*(_QWORD *)(a1 + 32), 1, *(void **)(a1 + 40));
      -[_DKSyncCloudKitKnowledgeStorage setHasZoneDeletionChanges:forZone:](*(_QWORD *)(a1 + 32), 1, *(void **)(a1 + 40));
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[_DKSyncCloudKitKnowledgeStorage addSourceDeviceIdentifierWithRecordZoneID:]((uint64_t)WeakRetained, *(void **)(a1 + 40));

  }
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_140(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_141;
  v5[3] = &unk_1E26E36C0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v6 = v4;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v5);
  objc_destroyWeak(&v7);

}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_141(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id *WeakRetained;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_18DDBE000, v2, OS_LOG_TYPE_INFO, "%{public}@: Zone %{public}@ was deleted.", (uint8_t *)&v7, 0x16u);

  }
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    -[_DKSyncCloudKitKnowledgeStorage setHasZoneAdditionChanges:forZone:](*(_QWORD *)(a1 + 32), 0, v5);
    -[_DKSyncCloudKitKnowledgeStorage setHasZoneDeletionChanges:forZone:](*(_QWORD *)(a1 + 32), 0, *(void **)(a1 + 40));
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    -[_DKSyncCloudKitKnowledgeStorage removeSourceDeviceIdentifierWithRecordZoneID:](WeakRetained, *(void **)(a1 + 40));

  }
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_142(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_143;
  v6[3] = &unk_1E26E3250;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v6);

}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_143(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;

  v2 = *(_QWORD *)(a1 + 32);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
      __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_143_cold_2();

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 128), *(id *)(a1 + 32));
    -[_DKSyncCloudKitKnowledgeStorage commitFetchDatabaseChangesServerChangeToken](*(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v4)
      __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_143_cold_1();

  }
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_145(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v6 = a2;
  v7 = a4;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_146;
  v11[3] = &unk_1E26E3738;
  objc_copyWeak(&v17, (id *)(a1 + 64));
  v11[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  v12 = v9;
  v10 = v6;
  v13 = v10;
  objc_copyWeak(&v18, (id *)(a1 + 72));
  v14 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 48);
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v11);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);

}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_146(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "metrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudKitMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "syncType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v8, 4, v6, v7, 0);

  }
  v9 = *(id *)(a1 + 40);
  if (*(_QWORD *)(a1 + 40))
  {
    if (+[_DKCKError isChangeTokenExpiredError:]((uint64_t)_DKCKError, *(void **)(a1 + 40)))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_146_cold_4();

      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 128);
      *(_QWORD *)(v11 + 128) = 0;

      objc_msgSend(*(id *)(a1 + 56), "removeObjectForKey:", CFSTR("FetchDatabaseChangesServerChangeToken"));
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_146_cold_3();
    }
    else
    {
      if ((+[_DKCKError isIgnorableError:]((uint64_t)_DKCKError, *(void **)(a1 + 40)) & 1) == 0)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_146_cold_5();

      }
      v13 = objc_loadWeakRetained((id *)(a1 + 88));
      -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:]((id *)&v13->isa, *(void **)(a1 + 40));
      v18 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v18;
    }
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v16)
        __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_146_cold_2();

      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 48));
      -[_DKSyncCloudKitKnowledgeStorage commitFetchDatabaseChangesServerChangeToken](*(_QWORD *)(a1 + 32));
    }
    else
    {
      if (v16)
        __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_146_cold_1();

    }
    v13 = objc_loadWeakRetained((id *)(a1 + 88));
    -[_DKSyncCloudKitKnowledgeStorage setPrewarmedFlag]((uint64_t)v13);
  }

  v19 = *(_QWORD *)(a1 + 72);
  if (v19)
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v9);

}

void __74___DKSyncCloudKitKnowledgeStorage_configurePeerWithSourceDeviceID_zoneID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  if (!a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[_DKSyncCloudKitKnowledgeStorage fastForwardPastDeletionsInNewZone:sourceDeviceID:](*(_QWORD *)(a1 + 32), v3, *(void **)(a1 + 48));

  }
}

void __65___DKSyncCloudKitKnowledgeStorage_hasZoneAdditionChangesForZone___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "dataForKey:", CFSTR("ZoneIDsWithAdditionChanges"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v5, v2, &v17);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v17;
    v8 = *(void **)(*(_QWORD *)v1 + 104);
    *(_QWORD *)(*(_QWORD *)v1 + 104) = v6;

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __65___DKSyncCloudKitKnowledgeStorage_hasZoneAdditionChangesForZone___block_invoke_cold_1();

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = objc_claimAutoreleasedReturnValue();
      v10 = *(NSObject **)(*(_QWORD *)v1 + 104);
      *(_QWORD *)(*(_QWORD *)v1 + 104) = v11;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)v1 + 104), "valueForKeyPath:", CFSTR("zoneName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _CDPrettyPrintCollection(v15, 0, 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_INFO, "%{public}@: Unarchived _zoneIDsWithAdditionChanges: %@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(*(_QWORD *)v1 + 104);
    *(_QWORD *)(*(_QWORD *)v1 + 104) = v12;

  }
}

void __65___DKSyncCloudKitKnowledgeStorage_hasZoneDeletionChangesForZone___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "dataForKey:", CFSTR("ZoneIDsWithDeletionChanges"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v5, v2, &v17);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v17;
    v8 = *(void **)(*(_QWORD *)v1 + 112);
    *(_QWORD *)(*(_QWORD *)v1 + 112) = v6;

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __65___DKSyncCloudKitKnowledgeStorage_hasZoneDeletionChangesForZone___block_invoke_cold_1();

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = objc_claimAutoreleasedReturnValue();
      v10 = *(NSObject **)(*(_QWORD *)v1 + 112);
      *(_QWORD *)(*(_QWORD *)v1 + 112) = v11;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)v1 + 112), "valueForKeyPath:", CFSTR("zoneName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _CDPrettyPrintCollection(v15, 0, 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_INFO, "%{public}@: Unarchived _zoneIDsWithDeletionChanges: %@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(*(_QWORD *)v1 + 112);
    *(_QWORD *)(*(_QWORD *)v1 + 112) = v12;

  }
}

void __116___DKSyncCloudKitKnowledgeStorage_fetchEventsFromPeer_windows_streamNames_limit_fetchOrder_highPriority_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, id, id))(v10 + 16))(v10, v11, v7, v8);

}

void __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_2;
  v6[3] = &unk_1E26E3250;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v6);

}

uint64_t __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

void __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25[3];

  v5 = a2;
  v6 = a3;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    goto LABEL_4;
  v9 = objc_msgSend(v6, "code");

  if (v9 == 11)
  {
    v8 = v6;
    v6 = 0;
LABEL_4:

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_4;
  v15[3] = &unk_1E26E3800;
  v10 = v5;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v16 = v10;
  v17 = v11;
  v18 = v12;
  v19 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 56);
  objc_copyWeak(&v24, (id *)(a1 + 80));
  v25[1] = *(id *)(a1 + 96);
  v13 = v6;
  v14 = *(void **)(a1 + 104);
  v21 = v13;
  v25[2] = v14;
  v23 = *(id *)(a1 + 72);
  objc_copyWeak(v25, (id *)(a1 + 88));
  v22 = *(id *)(a1 + 64);
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v15);

  objc_destroyWeak(v25);
  objc_destroyWeak(&v24);

}

void __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _DKEventCKConverter *v32;
  void *v33;
  _DKEventCKConverter *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _BYTE v42[22];
  __int16 v43;
  void *v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v47 = *MEMORY[0x1E0C80C00];
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v3 = *(_QWORD *)(a1 + 32);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_4_cold_3(a1, v3 != 0, (uint64_t)v4, v5, v6, v7, v8, v9, *(__int128 *)v42, *(int *)&v42[16], *(__int16 *)&v42[20], v43, (uint64_t)v44, v45, v46, v47, v48, v49, v50,
      v51,
      v52,
      v53,
      v54,
      v55);

  v10 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_4_cold_2(a1, (uint64_t)v10, (uint64_t)v11, v12, v13, v14, v15, v16, *(__int128 *)v42, *(int *)&v42[16], *(__int16 *)&v42[20], v43, v44, v45, v46, v47, v48, v49, v50,
      v51,
      v52,
      v53,
      v54,
      v55);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  v18 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 112) == 1)
      v19 = 8;
    else
      v19 = 4;
    objc_msgSend(WeakRetained, "metrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cloudKitMetrics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "startDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "syncType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v24, v19, v22, v23, objc_msgSend(v10, "count") == 0);

  }
  v25 = *(void **)(a1 + 72);
  if (v25)
  {
    if ((+[_DKCKError isIgnorableError:]((uint64_t)_DKCKError, v25) & 1) == 0)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_4_cold_1(a1, a1 + 72, v26);

    }
    v27 = (id *)objc_loadWeakRetained((id *)(a1 + 104));
    -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:](v27, *(void **)(a1 + 72));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = *(_QWORD *)(a1 + 88);
    if (v29)
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v29 + 16))(v29, 0, 0, v28);

    v30 = 0;
    v31 = 0;
  }
  else
  {
    if (objc_msgSend(v10, "count"))
    {
      v32 = [_DKEventCKConverter alloc];
      +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID](_DKSyncCloudKitKnowledgeStorage, "mySyncZoneID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[_DKEventCKConverter initWithZoneID:](v32, "initWithZoneID:", v33);

      -[_DKEventCKConverter eventsFromRecords:](v34, "eventsFromRecords:", v10);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v10, "count");
      if (v35 != objc_msgSend(v31, "count"))
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count") - objc_msgSend(v31, "count"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)v42 = 138544130;
          *(_QWORD *)&v42[4] = v38;
          *(_WORD *)&v42[12] = 2112;
          *(_QWORD *)&v42[14] = v39;
          v43 = 2112;
          v44 = v40;
          LOWORD(v45) = 2114;
          *(_QWORD *)((char *)&v45 + 2) = v41;
          _os_log_debug_impl(&dword_18DDBE000, v36, OS_LOG_TYPE_DEBUG, "%{public}@: Unable to convert %@ of %@ records from %{public}@", v42, 0x2Au);

        }
      }

    }
    else
    {
      v31 = (void *)objc_opt_new();
    }
    +[_DKSyncWindow completedWindowsWithSortedEvents:windows:fetchOrder:fillOrder:hitLimit:]((uint64_t)_DKSyncWindow, v31, *(void **)(a1 + 64), *(_QWORD *)(a1 + 120), 2, v3 != 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *(_QWORD *)(a1 + 88);
    if (v37)
      (*(void (**)(uint64_t, void *, void *, _QWORD))(v37 + 16))(v37, v31, v30, 0);
  }

}

void __116___DKSyncCloudKitKnowledgeStorage_fetchDeletedEventIDsFromPeer_sinceDate_streamNames_limit_highPriority_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v8 = v10;
    if (v5)
    {
      v8 = 0;
      v9 = v5;
    }
    else
    {
      v9 = 0;
    }
    (*(void (**)(uint64_t, id, _QWORD, id))(v7 + 16))(v7, v8, 0, v9);
  }

}

void __83___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_completion___block_invoke(uint64_t a1, void *a2)
{
  _DKEventCKConverter *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = -[_DKEventCKConverter initWithZoneID:]([_DKEventCKConverter alloc], "initWithZoneID:", *(_QWORD *)(a1 + 40));
    -[_DKEventCKConverter eventIDsFromRecordIDsAndTypes:](v3, "eventIDsFromRecordIDsAndTypes:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v4, v6);

}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_2;
  v10[3] = &unk_1E26E35A8;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v10);

}

uint64_t __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v14);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_4;
  v18[3] = &unk_1E26E38C8;
  v15 = v13;
  v19 = v15;
  v16 = v11;
  v20 = v16;
  objc_copyWeak(&v22, (id *)(a1 + 32));
  v17 = v10;
  v21 = v17;
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v18);

  objc_destroyWeak(&v22);
}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_4(void **a1)
{
  NSObject *v2;
  id *WeakRetained;
  id v4;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (a1[4])
  {
    WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
    -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:](WeakRetained, a1[4]);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!a1[5])
      return;
    v4 = objc_loadWeakRetained(a1 + 7);
    -[_DKSyncCloudKitKnowledgeStorage _setPreviousServerChangeToken:forRecordZoneID:]((uint64_t)v4, a1[5], a1[6]);
  }

}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14[2];

  v3 = a2;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_6;
  v8[3] = &unk_1E26E3918;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  objc_copyWeak(v14, (id *)(a1 + 64));
  v14[1] = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v8);

  objc_destroyWeak(v14);
}

void __95___DKSyncCloudKitKnowledgeStorage_syncUpToCloudWithRecordsToSave_recordIDsToDelete_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v10);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95___DKSyncCloudKitKnowledgeStorage_syncUpToCloudWithRecordsToSave_recordIDsToDelete_completion___block_invoke_2;
  v13[3] = &unk_1E26E3990;
  objc_copyWeak(&v19, (id *)(a1 + 72));
  v11 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v11;
  v15 = *(id *)(a1 + 48);
  v12 = v9;
  v16 = v12;
  objc_copyWeak(&v20, (id *)(a1 + 80));
  v18 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 56);
  +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v13);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);

}

void __95___DKSyncCloudKitKnowledgeStorage_syncUpToCloudWithRecordsToSave_recordIDsToDelete_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  id v11;
  void *v12;
  NSObject *v13;
  id *v14;
  uint64_t v15;
  uint64_t v16;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudKitMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "syncType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
      v10 = 0;
    else
      v10 = objc_msgSend(*(id *)(a1 + 48), "count") == 0;
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v9, 8, v7, v8, v10);

  }
  v11 = *(id *)(a1 + 56);
  v12 = *(void **)(a1 + 56);
  if (v12)
  {
    if ((+[_DKCKError isIgnorableError:]((uint64_t)_DKCKError, v12) & 1) == 0)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __95___DKSyncCloudKitKnowledgeStorage_syncUpToCloudWithRecordsToSave_recordIDsToDelete_completion___block_invoke_2_cold_1();

    }
    v14 = (id *)objc_loadWeakRetained((id *)(a1 + 88));
    -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:](v14, *(void **)(a1 + 56));
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v15;
  }
  v16 = *(_QWORD *)(a1 + 72);
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v11);

}

void __98___DKSyncCloudKitKnowledgeStorage_registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[_DKSyncCloudKitKnowledgeStorage runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:]((uint64_t)WeakRetained, *(void **)(a1 + 40));
  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __98___DKSyncCloudKitKnowledgeStorage_registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_1();

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
  }

}

void __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;

  v3 = a2;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_3();

  if (*(_QWORD *)(a1 + 40))
  {
    if ((+[_DKCKError isShouldDeferError:]((uint64_t)_DKCKError, v3) & 1) != 0
      || xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 40)))
    {
      if (xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
        goto LABEL_11;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_2();

    }
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5);
  }
LABEL_11:
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_1();

}

void __71___DKSyncCloudKitKnowledgeStorage__registerDatabaseChangesSubscription__block_invoke_cold_1()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)objc_opt_class(), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v0, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5_2(&dword_18DDBE000, v3, v4, "%{public}@: Incorrect number of saved subscriptions (%@): %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_1();
}

void __71___DKSyncCloudKitKnowledgeStorage__registerDatabaseChangesSubscription__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Failed to save database subscription: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_67_cold_1()
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
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Ignoring error while deleting zone: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_70_cold_1()
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
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Failed fetching source device identifiers after handling unrecoverable decryption errors: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void __97___DKSyncCloudKitKnowledgeStorage__queueOperationForPrivateCloudDatabase_dependent_policy_error___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Failed to associate event metric with operation", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2_cold_1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_55(), "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Failed to fetch record zones: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2_cold_2()
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
  objc_msgSend((id)OUTLINED_FUNCTION_55(), "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Failed to fetch some record zones: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void __77___DKSyncCloudKitKnowledgeStorage_scheduleRetryUpdateSourceDeviceIdentifiers__block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: After retrying, successfully fetched record zones", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_143_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_34(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Ignoring empty token %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_143_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_34(), "description");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_44(&dword_18DDBE000, v1, v2, "%{public}@: Holding token %{public}@: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7_1();
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_146_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Ignoring empty token %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_146_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_44(&dword_18DDBE000, v1, v2, "%{public}@: Holding token %{public}@: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7_1();
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_146_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_45(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Resetting token %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_146_cold_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Change token %{public}@ expired", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_146_cold_5()
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
  objc_msgSend((id)OUTLINED_FUNCTION_55(), "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Failed to fetch changed zones: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void __65___DKSyncCloudKitKnowledgeStorage_hasZoneAdditionChangesForZone___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_45(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Failed to unarchive _zoneIDsWithAdditionChanges: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

void __65___DKSyncCloudKitKnowledgeStorage_hasZoneDeletionChangesForZone___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_45(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Failed to unarchive _zoneIDsWithDeletionChanges: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

void __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_4_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, int a10, __int16 a11, __int16 a12, void *a13, __int128 a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;

  OUTLINED_FUNCTION_6_2();
  a23 = v24;
  a24 = v25;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend((id)OUTLINED_FUNCTION_32(), "description");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v31 + 56), "zoneName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  _DKSyncLoggingWindowsDescription(*(void **)(v31 + 64));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a9) = 138544130;
  *(_QWORD *)((char *)&a9 + 4) = v32;
  WORD6(a9) = 2112;
  *(_QWORD *)((char *)&a9 + 14) = v33;
  a12 = 2114;
  a13 = v34;
  LOWORD(a14) = 2114;
  *(_QWORD *)((char *)&a14 + 2) = v35;
  OUTLINED_FUNCTION_42(&dword_18DDBE000, v27, v36, "%{public}@: Synced down %@ events from %{public}@ in windows %{public}@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_22();
}

void __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_4_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, int a10, __int16 a11, __int16 a12, uint64_t a13, __int128 a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;

  OUTLINED_FUNCTION_6_2();
  a23 = v24;
  a24 = v25;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend((id)OUTLINED_FUNCTION_32(), "description");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v31 + 48), "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v31 + 56), "zoneName");
  v34 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v34;
  v37 = &stru_1E26E9728;
  LODWORD(a9) = 138544130;
  WORD6(a9) = 2112;
  *(_QWORD *)((char *)&a9 + 4) = v32;
  if ((v29 & 1) != 0)
    v37 = CFSTR(" and hit limit");
  *(_QWORD *)((char *)&a9 + 14) = v33;
  a12 = 2114;
  a13 = v34;
  LOWORD(a14) = 2114;
  *(_QWORD *)((char *)&a14 + 2) = v37;
  OUTLINED_FUNCTION_42(&dword_18DDBE000, v27, v35, "%{public}@: Synced down %@ events from %{public}@%{public}@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_22();
}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_6_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_34(), "description");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Exceeded maximum retries, unable to sync down deletions for %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_6_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  NSObject *v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;

  OUTLINED_FUNCTION_6_2();
  a23 = v26;
  a24 = v27;
  OUTLINED_FUNCTION_4_2();
  objc_msgSend((id)OUTLINED_FUNCTION_32(), "description");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v25, "domain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_29_0(&dword_18DDBE000, v24, v30, "%{public}@: Failed to sync down deletions for %@: %{public}@:%lld (%@)", &a9);

  OUTLINED_FUNCTION_22();
}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_6_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  NSObject *v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;

  OUTLINED_FUNCTION_6_2();
  a23 = v26;
  a24 = v27;
  OUTLINED_FUNCTION_4_2();
  objc_msgSend((id)OUTLINED_FUNCTION_32(), "description");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v25, "domain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_29_0(&dword_18DDBE000, v24, v30, "%{public}@: Error to sync down deletions for %@: %{public}@:%lld (%@)", &a9);

  OUTLINED_FUNCTION_22();
}

void __95___DKSyncCloudKitKnowledgeStorage_fetchAdditionsHighWaterMarkWithPeer_highPriority_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint8_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id *v34;
  id *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;

  OUTLINED_FUNCTION_41();
  a27 = v28;
  a28 = v29;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  a18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](v33);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_49();
  v38 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_40(), "identifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[5], "model");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v35[5], "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v41, "stringWithFormat:", CFSTR(" (%@)"));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_29_0(&dword_18DDBE000, v31, v42, "%{public}@: Found additions high water mark %@ for %{public}@peer %{public}@%{public}@", &a11);
  if (v40)
  {

  }
  OUTLINED_FUNCTION_19();
}

void __95___DKSyncCloudKitKnowledgeStorage_fetchAdditionsHighWaterMarkWithPeer_highPriority_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint8_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id *v34;
  id *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;

  OUTLINED_FUNCTION_41();
  a27 = v28;
  a28 = v29;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  a18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_49();
  v37 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_40(), "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[5], "model");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v35[5], "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v40, "stringWithFormat:", CFSTR(" (%@)"));
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[NSDate dk_localtimeString](v33);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_29_0(&dword_18DDBE000, v31, v42, "%{public}@: Found no additions high water mark for %{public}@peer %{public}@%{public}@, using %@", &a11);
  if (v39)
  {

  }
  OUTLINED_FUNCTION_19();
}

void __95___DKSyncCloudKitKnowledgeStorage_fetchDeletionsHighWaterMarkWithPeer_highPriority_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint8_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id *v34;
  id *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;

  OUTLINED_FUNCTION_41();
  a27 = v28;
  a28 = v29;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  a18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate dk_localtimeString](v33);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_49();
  v38 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_40(), "identifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[5], "model");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v35[5], "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v41, "stringWithFormat:", CFSTR(" (%@)"));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_29_0(&dword_18DDBE000, v31, v42, "%{public}@: Found deletions high water mark %@ for %{public}@peer %{public}@%{public}@", &a11);
  if (v40)
  {

  }
  OUTLINED_FUNCTION_19();
}

void __95___DKSyncCloudKitKnowledgeStorage_fetchDeletionsHighWaterMarkWithPeer_highPriority_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint8_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id *v34;
  id *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;

  OUTLINED_FUNCTION_41();
  a27 = v28;
  a28 = v29;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  a18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_49();
  v37 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_40(), "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35[5], "model");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v35[5], "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_56();
    objc_msgSend(v40, "stringWithFormat:", CFSTR(" (%@)"));
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[NSDate dk_localtimeString](v33);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_29_0(&dword_18DDBE000, v31, v42, "%{public}@: Found no deletions high water mark for %{public}@peer %{public}@%{public}@, using %@", &a11);
  if (v39)
  {

  }
  OUTLINED_FUNCTION_19();
}

void __95___DKSyncCloudKitKnowledgeStorage_syncUpToCloudWithRecordsToSave_recordIDsToDelete_completion___block_invoke_2_cold_1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_55(), "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Failed to sync to the cloud: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

void __98___DKSyncCloudKitKnowledgeStorage_registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Failed to run periodic job: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Finished cleanup for periodic job: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Failed to defer activity for periodic job: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Done running periodic job: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

@end
