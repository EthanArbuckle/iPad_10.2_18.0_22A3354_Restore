@implementation _DKSyncCloudKitKnowledgeStorage

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_initialized_0 != -1)
    dispatch_once(&sharedInstance_initialized_0, &__block_literal_global_10);
  return (id)sharedInstance_sharedInstance_0;
}

+ (id)mySyncZoneID
{
  return (id)_DKMySyncZoneID;
}

+ (void)setMySyncZoneID:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)_DKMySyncZoneID;
  _DKMySyncZoneID = (uint64_t)v2;

}

+ (id)zoneIDWithDeviceID:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("source-device-id:"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C95098]);
  v5 = (void *)objc_msgSend(v4, "initWithZoneName:ownerName:", v3, *MEMORY[0x1E0C94928]);

  return v5;
}

+ (id)deviceIDFromZoneID:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("source-device-id:"));

  if (v5)
  {
    objc_msgSend(v3, "zoneName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("source-device-id:"), "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_DKSyncCloudKitKnowledgeStorage)init
{
  _DKSyncCloudKitKnowledgeStorage *v2;
  uint64_t v3;
  NSMutableDictionary *recordZonesByZoneID;
  uint64_t v5;
  NSHashTable *outstandingOperations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DKSyncCloudKitKnowledgeStorage;
  v2 = -[_DKSyncCloudKitKnowledgeStorage init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recordZonesByZoneID = v2->_recordZonesByZoneID;
    v2->_recordZonesByZoneID = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    outstandingOperations = v2->_outstandingOperations;
    v2->_outstandingOperations = (NSHashTable *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKSyncCloudKitKnowledgeStorage _unregisterCloudSyncAvailablityObserver]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_DKSyncCloudKitKnowledgeStorage;
  -[_DKSyncCloudKitKnowledgeStorage dealloc](&v3, sel_dealloc);
}

- (void)_unregisterCloudSyncAvailablityObserver
{
  id v2;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("_DKCloudSyncAvailablityChangedNotification"), 0);
      *(_BYTE *)(a1 + 48) = 0;

    }
  }
}

- (void)start
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Starting Cloud Transport", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_registerCloudSyncAvailablityObserver
{
  id v2;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__cloudSyncAvailabilityDidChange_, CFSTR("_DKCloudSyncAvailablityChangedNotification"), 0);
      *(_BYTE *)(a1 + 48) = 1;

    }
  }
}

- (void)finishStartBecauseCloudIsAvailable
{
  _QWORD v2[5];

  if (a1)
  {
    if (-[_DKSyncCloudKitKnowledgeStorage startShouldUpdateSourceDeviceIdentifiers]((uint64_t)a1))
    {
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __69___DKSyncCloudKitKnowledgeStorage_finishStartBecauseCloudIsAvailable__block_invoke;
      v2[3] = &unk_1E26E3118;
      v2[4] = a1;
      -[_DKSyncCloudKitKnowledgeStorage registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:](a1, v2);
    }
    else
    {
      -[_DKSyncCloudKitKnowledgeStorage finishStartOrError:]((uint64_t)a1, 0);
    }
  }
}

- (void)_createPushConnection
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPrettyPrintCollection(&unk_1E272BB30, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v2, v3, "%{public}@: Created connection for topics: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

- (uint64_t)startShouldUpdateSourceDeviceIdentifiers
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v1 = a1;
  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isSingleDevice"))
    {
      objc_msgSend(*(id *)(v1 + 16), "numberForKey:", CFSTR("HaveCreatedMyZone"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      if (v2 && objc_msgSend(v2, "BOOLValue"))
      {
        v9 = 0;
        v10 = &v9;
        v11 = 0x2020000000;
        v12 = 0;
        v4 = *(void **)(v1 + 24);
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __75___DKSyncCloudKitKnowledgeStorage_startShouldUpdateSourceDeviceIdentifiers__block_invoke;
        v8[3] = &unk_1E26E3530;
        v8[4] = &v9;
        objc_msgSend(v4, "performNoMoreOftenInDaysThan:name:activityBlock:", CFSTR("SingleDeviceUpdateSourceDeviceIdentifiers"), v8, 7.0);
        v5 = *((unsigned __int8 *)v10 + 24);
        if (*((_BYTE *)v10 + 24))
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            objc_claimAutoreleasedReturnValue();
            -[_DKSyncCloudKitKnowledgeStorage startShouldUpdateSourceDeviceIdentifiers].cold.1();
          }

        }
        _Block_object_dispose(&v9, 8);
        v1 = v5 != 0;
      }
      else
      {
        v1 = 1;
      }

    }
    else
    {
      return 1;
    }
  }
  return v1;
}

- (void)unregisterUpdateSourceDeviceIdentifiersPeriodicJob
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Unscheduling periodic job: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)finishStartOrError:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    if (v3)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[_DKSyncCloudKitKnowledgeStorage finishStartOrError:].cold.1();
    }
    else
    {
      +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID](_DKSyncCloudKitKnowledgeStorage, "mySyncZoneID");
      v5 = objc_claimAutoreleasedReturnValue();
      -[_DKSyncCloudKitKnowledgeStorage configureCloudPseudoPeerWithMySyncZoneID:](a1, v5);
      if ((objc_msgSend(*(id *)(a1 + 16), "BOOLForKey:", CFSTR("DidRegisterDatabaseChangesSubscription")) & 1) == 0)
        -[_DKSyncCloudKitKnowledgeStorage _registerDatabaseChangesSubscription](a1);
      if ((*(_BYTE *)(a1 + 152) & 1) == 0)
      {
        *(_BYTE *)(a1 + 152) = 1;
        +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "postNotificationName:userInfo:sender:", CFSTR("_DKCloudTransportAvailablityChangedNotification"), 0, a1);

      }
    }

  }
}

- (void)registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:(id *)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id *v16;
  id v17;
  id v18;
  id location;

  v3 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    if (!a1[5])
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[_DKSyncCloudKitKnowledgeStorage registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:].cold.1();

      objc_initWeak(&location, a1);
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __98___DKSyncCloudKitKnowledgeStorage_registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke;
      v15 = &unk_1E26E39E0;
      objc_copyWeak(&v18, &location);
      v16 = a1;
      v17 = v3;
      v6 = (void *)MEMORY[0x193FEEAF4](&v12);
      -[_DKSyncCloudKitKnowledgeStorage executionCriteriaForUpdateSourceDeviceIdentifiersPeriodicJob]((uint64_t)a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue", v12, v13, v14, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDPeriodicSchedulerJob jobWithInterval:schedulerJobName:queue:asynchronousHandler:handler:](_CDPeriodicSchedulerJob, "jobWithInterval:schedulerJobName:queue:asynchronousHandler:handler:", CFSTR("com.apple.coreduet.sync.update-source-device-identifiers"), v8, 1, v6, 30.0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[5];
      a1[5] = (id)v9;

      objc_msgSend(a1[5], "setExecutionCriteria:", v7);
      +[_CDPeriodicScheduler sharedInstance](_CDPeriodicScheduler, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "registerJob:", a1[5]);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }

}

- (void)_registerDatabaseChangesSubscription
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Queuing operation to register a database changes subscription", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)cancelOutstandingOperations
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[NSHashTable allObjects](self->_outstandingOperations, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[NSHashTable removeAllObjects](self->_outstandingOperations, "removeAllObjects");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isFinished", (_QWORD)v12) & 1) == 0 && (objc_msgSend(v11, "isCancelled") & 1) == 0)
          objc_msgSend(v11, "cancel");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (uint64_t)_queueOperationForPrivateCloudDatabase:(int)a3 dependent:(void *)a4 policy:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id WeakRetained;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  const __CFString *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  id *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NSObject *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  id v68;
  uint64_t v69;
  unsigned __int8 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  if (!a1)
  {
    v20 = 0;
    goto LABEL_70;
  }
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (a5)
    *a5 = 0;
  v12 = *(void **)(a1 + 56);
  if (!v12)
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setUseZoneWidePCS:", 1);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.knowledgestore4"), 1);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v14, v13);
    v16 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v15;

    if (!*(_QWORD *)(a1 + 56))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:].cold.1();

      if (a5)
      {
        +[_DKSyncErrors disabled](_DKSyncErrors, "disabled");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

LABEL_37:
      v20 = 0;
      goto LABEL_69;
    }

    v12 = *(void **)(a1 + 56);
  }
  objc_msgSend(v12, "privateCloudDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v60 = v10;
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setContainer:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v17, "setTimeoutIntervalForResource:", 1800.0);
    objc_msgSend(v17, "setAutomaticallyRetryNetworkFailures:", 0);
    +[_DKSyncUrgencyTracker sharedInstance]();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[_DKEventData version]((uint64_t)v57) > 9)
    {
      objc_msgSend(v17, "setAllowsCellularAccess:", 1);
      objc_msgSend(v17, "setQualityOfService:", 17);
      v18 = 0;
    }
    else
    {
      objc_msgSend(v17, "setAllowsCellularAccess:", 0);
      v18 = 2;
    }
    objc_msgSend(v17, "setDiscretionaryNetworkBehavior:", v18);
    objc_msgSend(*(id *)(a1 + 160), "syncType");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
    {
      -[_DKSyncType xpcActivity](v21);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!*(_QWORD *)(a1 + 40))
        goto LABEL_22;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_22;
      objc_msgSend(*(id *)(a1 + 40), "activity");
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v23;
    if (v23)
    {
      objc_msgSend(v17, "setXpcActivity:", v23);

    }
LABEL_22:
    v58 = v17;
    objc_msgSend(v9, "setConfiguration:", v17);
    objc_msgSend(v9, "setDatabase:", v13);
    if (a3)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 136));
      v26 = WeakRetained;
      if (WeakRetained && (objc_msgSend(WeakRetained, "isFinished") & 1) == 0)
        objc_msgSend(v9, "addDependency:", v26);
      objc_storeWeak((id *)(a1 + 136), v9);

    }
    v59 = v13;
    v27 = objc_alloc(MEMORY[0x1E0C94D88]);
    objc_msgSend(v9, "group");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v27, "initWithEventName:", v29);

    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __97___DKSyncCloudKitKnowledgeStorage__queueOperationForPrivateCloudDatabase_dependent_policy_error___block_invoke;
    v66[3] = &unk_1E26E35A8;
    v31 = v30;
    v67 = v31;
    v32 = v9;
    v68 = v32;
    v69 = a1;
    +[_DKSyncBlockOperation blockOperationWithBlock:](_DKSyncBlockOperation, "blockOperationWithBlock:", v66);
    v55 = v32;
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addDependency:", v32);
    if (!v22)
      goto LABEL_59;
    if (-[_DKSyncType forceSync]((_BOOL8)v22))
    {
      v33 = CFSTR("forced");
    }
    else if (-[_DKSyncType isPeriodicSync]((_BOOL8)v22))
    {
      v33 = CFSTR("periodic");
    }
    else if (-[_DKSyncType isTriggeredSync]((_BOOL8)v22))
    {
      v33 = CFSTR("triggered");
    }
    else
    {
      if (!-[_DKSyncType isInitialSync]((_BOOL8)v22))
        goto LABEL_43;
      v33 = CFSTR("initial");
    }
    objc_msgSend(v31, "setMetricValue:forKey:", v33, CFSTR("type"));
LABEL_43:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncType urgency]((uint64_t)v22));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setMetricValue:forKey:", v35, CFSTR("urgency"));

    if (-[_DKSyncType isPeriodicSync]((_BOOL8)v22))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -[_DKSyncType periodicSyncInterval]((uint64_t)v22));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setMetricValue:forKey:", v36, CFSTR("interval"));

    }
    if (!-[_DKSyncType isTriggeredSync]((_BOOL8)v22))
      goto LABEL_55;
    if (-[_DKSyncType didActivatePeer]((_BOOL8)v22))
    {
      v37 = CFSTR("didActivatePeer");
    }
    else if (-[_DKSyncType didReceivePush]((_BOOL8)v22))
    {
      v37 = CFSTR("didReceivePush");
    }
    else if (-[_DKSyncType didAddSyncedEvents]((_BOOL8)v22))
    {
      v37 = CFSTR("didAddSyncedEvents");
    }
    else
    {
      if (!-[_DKSyncType didDeleteSyncedEvents]((_BOOL8)v22))
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:].cold.3();

        goto LABEL_55;
      }
      v37 = CFSTR("didDeleteSyncedEvents");
    }
    objc_msgSend(v31, "setMetricValue:forKey:", v37, CFSTR("reason"));
LABEL_55:
    if (-[_DKSyncToggle isEnabled]((_BOOL8)v22))
      v38 = CFSTR("YES");
    else
      v38 = CFSTR("NO");
    objc_msgSend(v31, "setMetricValue:forKey:", v38, CFSTR("isSingleDevice"));
LABEL_59:
    v61 = v9;
    +[_DKSyncUrgencyTracker sharedInstance]();
    v39 = (id *)objc_claimAutoreleasedReturnValue();
    -[_DKSyncUrgencyTracker allUrgencies](v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v41 = v40;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v63 != v44)
            objc_enumerationMutation(v41);
          v46 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v41, "objectForKeyedSubscript:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clientUrgency: %@"), v46);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setMetricValue:forKey:", v47, v48);

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      }
      while (v43);
    }

    +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", 4);
    v49 = objc_claimAutoreleasedReturnValue();
    +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", 8);
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 | v50)
    {
      objc_msgSend((id)v49, "version");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setMetricValue:forKey:", v51, CFSTR("version(down)"));

      objc_msgSend((id)v50, "version");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setMetricValue:forKey:", v52, CFSTR("version(up)"));

    }
    +[_DKSyncSerializer addOperation:](_DKSyncSerializer, "addOperation:", v55);
    objc_msgSend(*(id *)(a1 + 144), "addObject:", v55);
    +[_DKSyncSerializer addOperation:](_DKSyncSerializer, "addOperation:", v56);
    objc_msgSend(*(id *)(a1 + 144), "addObject:", v56);
    v70 = 1;

    v20 = v70;
    v10 = v60;
    v9 = v61;
    v13 = v59;
    goto LABEL_69;
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:].cold.2();

  if (!a5)
    goto LABEL_37;
  +[_DKSyncErrors disabled](_DKSyncErrors, "disabled");
  v20 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_69:

LABEL_70:
  return v20;
}

- (void)_cloudSyncAvailabilityDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67___DKSyncCloudKitKnowledgeStorage__cloudSyncAvailabilityDidChange___block_invoke;
  v3[3] = &unk_1E26E2F20;
  v3[4] = self;
  +[_DKSyncSerializer performAsyncBlock:](_DKSyncSerializer, "performAsyncBlock:", v3);
}

- (__CFString)_handleAnySpecialnessWithOperationError:(id *)a1
{
  id v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  __CFString *v35;
  uint64_t v36;
  id v37;
  _UNKNOWN **v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  __CFString *v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  __CFString *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  _QWORD v62[6];
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  NSObject *v76;
  __int16 v77;
  const __CFString *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  const __CFString *v82;
  __int16 v83;
  __CFString *v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v5 = 0;
    goto LABEL_60;
  }
  v5 = (__CFString *)v3;
  if (+[_DKCKError isUnrecoverableDecryptionError:]((uint64_t)_DKCKError, v5))
  {
    if (_handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorCounterInitialized != -1)
      dispatch_once(&_handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorCounterInitialized, &__block_literal_global_52);
    v52 = v4;
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:].cold.1();

    v51 = v5;
    +[_DKCKError zoneIDsWithUnrecoverableDecryptionError:]((uint64_t)_DKCKError, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v9 = objc_claimAutoreleasedReturnValue();
      _CDPrettyPrintCollection(v7, 0, 0, 0);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v76 = v9;
      v77 = 2114;
      v78 = v10;
      _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_INFO, "%{public}@: Zones with unrecoverable decryption errors: %{public}@", buf, 0x16u);

    }
    +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID](_DKSyncCloudKitKnowledgeStorage, "mySyncZoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v13 = v7;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
    v61 = v13;
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v71;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v71 != v16)
            objc_enumerationMutation(v13);
          v18 = *(__CFString **)(*((_QWORD *)&v70 + 1) + 8 * v17);
          if (!-[__CFString isEqual:](v18, "isEqual:", v11))
          {
            +[_DKSyncCloudKitKnowledgeStorage deviceIDFromZoneID:](_DKSyncCloudKitKnowledgeStorage, "deviceIDFromZoneID:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              objc_msgSend(a1[4], "existingPeerWithSourceDeviceID:", v20);
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = v21;
              if (v21)
              {
                -[NSObject zoneName](v21, "zoneName");
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                if (v23)
                {
                  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend((id)objc_opt_class(), "description");
                    v60 = objc_claimAutoreleasedReturnValue();
                    v27 = -[NSObject me](v22, "me");
                    v28 = CFSTR("pseudo ");
                    if (!v27)
                      v28 = &stru_1E26E9728;
                    v56 = v28;
                    -[NSObject identifier](v22, "identifier");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject model](v22, "model");
                    v29 = objc_claimAutoreleasedReturnValue();
                    v30 = &stru_1E26E9728;
                    v57 = (void *)v29;
                    if (v29)
                    {
                      v54 = (void *)MEMORY[0x1E0CB3940];
                      -[NSObject model](v22, "model");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "stringWithFormat:", CFSTR(" (%@)"), v55);
                      v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      v30 = v53;
                    }
                    *(_DWORD *)buf = 138544386;
                    v76 = v60;
                    v77 = 2114;
                    v78 = v56;
                    v79 = 2114;
                    v80 = (uint64_t)v58;
                    v81 = 2114;
                    v82 = v30;
                    v83 = 2114;
                    v84 = v18;
                    _os_log_error_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Deactivating %{public}@peer %{public}@%{public}@ due to unrecoverable decryption error for zone %{public}@", buf, 0x34u);
                    if (v57)
                    {

                    }
                  }

                  objc_msgSend(a1[4], "removeActiveTransports:fromPeer:", 4, v22);
                  objc_msgSend(a1, "setHasAdditionsFlag:forPeer:", 0, v22);
                  objc_msgSend(a1, "setHasDeletionsFlag:forPeer:", 0, v22);
                  goto LABEL_29;
                }
              }
              +[_CDLogging syncChannel](_CDLogging, "syncChannel");
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend((id)objc_opt_class(), "description");
                v59 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v76 = v59;
                v77 = 2114;
                v78 = v18;
                _os_log_debug_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring unrecoverable decryption error for unknown peer zone %{public}@", buf, 0x16u);

              }
LABEL_27:

            }
            else
            {
              +[_CDLogging syncChannel](_CDLogging, "syncChannel");
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend((id)objc_opt_class(), "description");
                v25 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v76 = v25;
                v77 = 2114;
                v78 = v18;
                _os_log_debug_impl(&dword_18DDBE000, v22, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring unrecoverable decryption error for non-peer zone %{public}@", buf, 0x16u);
                goto LABEL_27;
              }
            }
LABEL_29:

            v13 = v61;
            goto LABEL_30;
          }
          -[_DKEventStatsCounter incrementCountByNumber:](_handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorCounter, 1);
          if (objc_msgSend(a1[15], "containsObject:", v18))
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              v26 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v76 = v26;
              v77 = 2114;
              v78 = v18;
              _os_log_error_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Repeating unrecoverable decryption error fix for zone %{public}@", buf, 0x16u);

            }
            -[_DKEventStatsCounter incrementCountByNumber:](_handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorRepeatCounter, 1);
          }
          objc_msgSend(v12, "addObject:", v18);
LABEL_30:
          ++v17;
        }
        while (v15 != v17);
        v31 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
        v15 = v31;
      }
      while (v31);
    }

    v32 = a1[15];
    if (v32)
    {
      objc_msgSend(v32, "unionSet:", v13);
    }
    else
    {
      v36 = -[NSObject mutableCopy](v13, "mutableCopy");
      v37 = a1[15];
      a1[15] = (id)v36;

    }
    v38 = &off_1E26E0000;
    v39 = (void *)objc_opt_new();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v40 = v12;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v67 != v43)
            objc_enumerationMutation(v40);
          v45 = *(__CFString **)(*((_QWORD *)&v66 + 1) + 8 * i);
          objc_msgSend(v38[247], "syncChannel");
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v47 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v76 = v47;
            v77 = 2114;
            v78 = v45;
            _os_log_impl(&dword_18DDBE000, v46, OS_LOG_TYPE_INFO, "%{public}@: Fixing unrecoverable decryption error for zone %{public}@", buf, 0x16u);

            v38 = &off_1E26E0000;
          }

          if (-[__CFString isEqual:](v45, "isEqual:", v11))
            objc_msgSend(a1[2], "setBool:forKey:", 0, CFSTR("HaveCreatedMyZone"));
          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_67;
          v62[3] = &unk_1E26E3580;
          v62[4] = a1;
          v62[5] = v45;
          v63 = v11;
          v64 = v39;
          v48 = v40;
          v65 = v48;
          -[_DKSyncCloudKitKnowledgeStorage _deleteZoneWithZoneID:completion:]((uint64_t)a1, v45, v62);

        }
        v42 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      }
      while (v42);
    }

    +[_DKCKError errorMinusUnrecoverableDecryptionErrorsFromPartialError:]((uint64_t)_DKCKError, v51);
    v49 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v49;
    v4 = v52;
    v33 = v61;
    goto LABEL_59;
  }
  if (+[_DKCKError isIgnorableError:]((uint64_t)_DKCKError, v5))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v34 = objc_claimAutoreleasedReturnValue();
      -[__CFString domain](v5, "domain");
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v76 = v34;
      v77 = 2114;
      v78 = v35;
      v79 = 2048;
      v80 = -[__CFString code](v5, "code");
      v81 = 2112;
      v82 = v5;
      _os_log_impl(&dword_18DDBE000, v33, OS_LOG_TYPE_INFO, "%{public}@: Failure is temporary, ignoring : %{public}@:%lld (%@)", buf, 0x2Au);

    }
LABEL_59:

  }
LABEL_60:

  return v5;
}

- (void)performUpdateSourceDeviceIdentifiersWithCompletion:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    v5 = *(void **)(a1 + 24);
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86___DKSyncCloudKitKnowledgeStorage_performUpdateSourceDeviceIdentifiersWithCompletion___block_invoke;
    v10[3] = &unk_1E26E2FC0;
    v10[4] = a1;
    v11 = v3;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __86___DKSyncCloudKitKnowledgeStorage_performUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2;
    v8[3] = &unk_1E26E3448;
    v9 = v11;
    objc_msgSend(v5, "performNoMoreOftenInMinutesThan:name:queue:activityBlock:throttleBlock:", CFSTR("UpdateSourceDeviceIdentifiers"), v6, v10, v8, 60.0);

  }
}

- (void)_createZoneWithZoneID:(void *)a3 completion:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _DKModifyRecordZonesOperation *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  char v18;
  id v19;
  char v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v21 = a3;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v7 = (void *)os_transaction_create();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v5);
    v29[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[_DKSyncCloudKitKnowledgeStorage _createZoneWithZoneID:completion:].cold.2();

    v11 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]([_DKModifyRecordZonesOperation alloc], "initWithRecordZonesToSave:recordZoneIDsToDelete:", v9, 0);
    v12 = (void *)objc_opt_new();
    -[_DKModifyRecordZonesOperation setGroup:](v11, "setGroup:", v12);

    -[_DKModifyRecordZonesOperation group](v11, "group");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", CFSTR("CreateZone"));

    objc_initWeak(&location, v11);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __68___DKSyncCloudKitKnowledgeStorage__createZoneWithZoneID_completion___block_invoke;
    v23[3] = &unk_1E26E3670;
    objc_copyWeak(&v27, &location);
    v23[4] = a1;
    v14 = v9;
    v24 = v14;
    v15 = v21;
    v26 = v15;
    v16 = v7;
    v25 = v16;
    -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:](v11, "setModifyRecordZonesCompletionBlock:", v23);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncCloudKitKnowledgeStorage _createZoneWithZoneID:completion:].cold.1();
    }

    v22 = 0;
    v18 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:](a1, v11, 1, 0, &v22);
    v19 = v22;
    if (v15)
      v20 = v18;
    else
      v20 = 1;
    if ((v20 & 1) == 0)
      (*((void (**)(id, id))v15 + 2))(v15, v19);
    if ((objc_msgSend(*(id *)(a1 + 16), "BOOLForKey:", CFSTR("DidRegisterDatabaseChangesSubscription"), v21) & 1) == 0)
      -[_DKSyncCloudKitKnowledgeStorage _registerDatabaseChangesSubscription](a1);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
}

- (void)_deleteZoneWithZoneID:(void *)a3 completion:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _DKModifyRecordZonesOperation *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  char v19;
  id v20;
  char v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id location;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    v8 = (void *)os_transaction_create();
    v33[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v11;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_INFO, "%{public}@: Deleting zone %@", buf, 0x16u);

    }
    v12 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]([_DKModifyRecordZonesOperation alloc], "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v9);
    v13 = (void *)objc_opt_new();
    -[_DKModifyRecordZonesOperation setGroup:](v12, "setGroup:", v13);

    -[_DKModifyRecordZonesOperation group](v12, "group");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setName:", CFSTR("DeleteZone"));

    objc_initWeak(&location, v12);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __68___DKSyncCloudKitKnowledgeStorage__deleteZoneWithZoneID_completion___block_invoke;
    v23[3] = &unk_1E26E3670;
    objc_copyWeak(&v27, &location);
    v23[4] = a1;
    v15 = v9;
    v24 = v15;
    v16 = v6;
    v26 = v16;
    v17 = v8;
    v25 = v17;
    -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:](v12, "setModifyRecordZonesCompletionBlock:", v23);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncCloudKitKnowledgeStorage _deleteZoneWithZoneID:completion:].cold.1();
    }

    v22 = 0;
    v19 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:](a1, v12, 1, 0, &v22);
    v20 = v22;
    if (v16)
      v21 = v19;
    else
      v21 = 1;
    if ((v21 & 1) == 0)
      (*((void (**)(id, id))v16 + 2))(v16, v20);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
}

- (void)_performThrottledUpdateSourceDeviceIdentifiersWithCompletion:(void *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  char v13;
  id v14;
  char v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id from;
  id location[5];

  location[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    v5 = (void *)os_transaction_create();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_DKSyncCloudKitKnowledgeStorage _performThrottledUpdateSourceDeviceIdentifiersWithCompletion:].cold.2();

    +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation](_DKFetchRecordZonesOperation, "fetchAllRecordZonesOperation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "setGroup:", v8);

    objc_msgSend(v7, "group");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", CFSTR("UpdateSourceDeviceIdentifiers"));

    objc_initWeak(location, a1);
    objc_initWeak(&from, v7);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke;
    v17[3] = &unk_1E26E35F8;
    objc_copyWeak(&v20, location);
    objc_copyWeak(&v21, &from);
    v17[4] = a1;
    v10 = v3;
    v19 = v10;
    v11 = v5;
    v18 = v11;
    objc_msgSend(v7, "setFetchRecordZonesCompletionBlock:", v17);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncCloudKitKnowledgeStorage _performThrottledUpdateSourceDeviceIdentifiersWithCompletion:].cold.1();
    }

    v16 = 0;
    v13 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]((uint64_t)a1, v7, 1, 0, &v16);
    v14 = v16;
    if (v10)
      v15 = v13;
    else
      v15 = 1;
    if ((v15 & 1) == 0)
      (*((void (**)(id, id))v10 + 2))(v10, v14);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);

  }
}

- (uint64_t)scheduleRetryUpdateSourceDeviceIdentifiers
{
  double v1;
  double v2;
  BOOL v3;
  double v4;
  _QWORD v5[5];

  if (result)
  {
    v1 = *(double *)(result + 72);
    v2 = v1 + v1;
    v3 = v1 == 0.0;
    v4 = 3600.0;
    if (!v3)
      v4 = v2;
    *(double *)(result + 72) = v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __77___DKSyncCloudKitKnowledgeStorage_scheduleRetryUpdateSourceDeviceIdentifiers__block_invoke;
    v5[3] = &unk_1E26E2F20;
    v5[4] = result;
    return +[_DKSyncSerializer performAfter:block:](_DKSyncSerializer, "performAfter:block:", v5);
  }
  return result;
}

- (void)updateSourceDeviceIdentifiersWithRecordZonesByZoneID:(void *)a3 completion:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  char v26;
  void *v27;
  id obj;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[_DKSyncCloudKitKnowledgeStorage updateSourceDeviceIdentifiersWithRecordZonesByZoneID:completion:].cold.2();
    v23 = v6;

    +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID](_DKSyncCloudKitKnowledgeStorage, "mySyncZoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v24 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v9)
    {
      v10 = v9;
      v26 = 0;
      v11 = *(_QWORD *)v34;
      v27 = v8;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v13, "zoneName", v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "hasPrefix:", CFSTR("source-device-id:")))
          {
            +[_DKSyncCloudKitKnowledgeStorage deviceIDFromZoneID:](_DKSyncCloudKitKnowledgeStorage, "deviceIDFromZoneID:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "isEqual:", v8))
            {
              +[_CDLogging syncChannel](_CDLogging, "syncChannel");
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend((id)objc_opt_class(), "description");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v38 = v19;
                v39 = 2112;
                v40 = v15;
                _os_log_debug_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Found local device id %@", buf, 0x16u);

                v8 = v27;
              }
              v26 = 1;
            }
            else
            {
              v17 = objc_msgSend(v15, "length");
              +[_CDLogging syncChannel](_CDLogging, "syncChannel");
              v16 = objc_claimAutoreleasedReturnValue();
              v18 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
              if (v17)
              {
                if (v18)
                {
                  objc_msgSend((id)objc_opt_class(), "description");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v38 = v20;
                  v39 = 2112;
                  v40 = v15;
                  _os_log_debug_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Found peer source device id %@", buf, 0x16u);

                }
                objc_msgSend(v25, "setObject:forKeyedSubscript:", v13, v15);
                objc_msgSend(obj, "objectForKeyedSubscript:", v13);
                v16 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1[11], "setObject:forKeyedSubscript:", v16, v13);
              }
              else if (v18)
              {
                objc_msgSend((id)objc_opt_class(), "description");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v38 = v21;
                v39 = 2112;
                v40 = v14;
                _os_log_debug_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Invalid source device id from zone name: %@", buf, 0x16u);

              }
              v8 = v27;
            }

          }
          objc_msgSend(a1[15], "removeObject:", v13);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v10);
    }
    else
    {
      v26 = 0;
    }

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[_DKSyncCloudKitKnowledgeStorage updateSourceDeviceIdentifiersWithRecordZonesByZoneID:completion:].cold.1();

    v6 = v23;
    v5 = v24;
    if ((v26 & 1) != 0)
    {
      -[_DKSyncCloudKitKnowledgeStorage finishUpdatingSourceDeviceIdentifiersWithZoneIDsBySourceDeviceID:orError:completion:]((uint64_t)a1, v25, 0, v23);
    }
    else
    {
      objc_msgSend(a1[2], "setBool:forKey:", 0, CFSTR("HaveCreatedMyZone"));
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __99___DKSyncCloudKitKnowledgeStorage_updateSourceDeviceIdentifiersWithRecordZonesByZoneID_completion___block_invoke;
      v29[3] = &unk_1E26E3620;
      v29[4] = a1;
      v30 = v8;
      v31 = v25;
      v32 = v23;
      -[_DKSyncCloudKitKnowledgeStorage _createZoneWithZoneID:completion:]((uint64_t)a1, v30, v29);

    }
  }

}

- (void)finishUpdatingSourceDeviceIdentifiersWithZoneIDsBySourceDeviceID:(void *)a3 orError:(void *)a4 completion:
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (a1)
  {
    if (!v7)
    {
      *(_QWORD *)(a1 + 72) = 0;
      -[_DKSyncCloudKitKnowledgeStorage setZoneIDsBySourceDeviceID:](a1, v10);
      if (!v9)
        goto LABEL_5;
      goto LABEL_4;
    }
    if (v8)
LABEL_4:
      ((void (**)(_QWORD, id))v9)[2](v9, v7);
  }
LABEL_5:

}

- (void)setZoneIDsBySourceDeviceID:(uint64_t)a1
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 80), a2);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSyncCloudKitKnowledgeStorage configurePeerWithSourceDeviceID:zoneID:](a1, v10, v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)configurePeerWithSourceDeviceID:(void *)a3 zoneID:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "existingPeerWithSourceDeviceID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && (objc_msgSend(v7, "zoneName"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "activeTransportsForPeer:", v8) & 4) == 0)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = &stru_1E26E9728;
          if (objc_msgSend(v8, "me"))
            v13 = CFSTR("pseudo ");
          else
            v13 = &stru_1E26E9728;
          objc_msgSend(v8, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "model");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v8, "model");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringWithFormat:", CFSTR(" (%@)"), v18);
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v6, "zoneName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v24 = v19;
          v25 = 2114;
          v26 = v13;
          v27 = 2114;
          v28 = v14;
          v29 = 2114;
          v30 = v12;
          v31 = 2112;
          v32 = v17;
          _os_log_debug_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Instantiated existing %{public}@peer %{public}@%{public}@ with zone name %@", buf, 0x34u);

          if (v15)
          {

          }
        }

        -[_DKSyncCloudKitKnowledgeStorage populateLastSeenDateIfNeededByPeer:](a1, v8);
        objc_msgSend(*(id *)(a1 + 32), "addActiveTransports:toPeer:", 4, v8);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[_DKSyncCloudKitKnowledgeStorage fastForwardPastDeletionsInNewZone:sourceDeviceID:](a1, v11, v5);
      }
      else
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __74___DKSyncCloudKitKnowledgeStorage_configurePeerWithSourceDeviceID_zoneID___block_invoke;
        v20[3] = &unk_1E26E3788;
        v20[4] = a1;
        v21 = v6;
        v22 = v5;
        -[_DKSyncCloudKitKnowledgeStorage performUpdateSourceDeviceIdentifiersWithCompletion:](a1, v20);

      }
    }

  }
}

- (void)_storeZoneIDFromRecords:(void *)a3 orError:
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_DKSyncCloudKitKnowledgeStorage _storeZoneIDFromRecords:orError:].cold.2();

      -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:](a1, v6);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[_DKSyncCloudKitKnowledgeStorage _storeZoneIDFromRecords:orError:].cold.1();
      v10 = 0;
      v6 = v9;
    }

    v6 = (id)v10;
  }

}

- (void)fetchChangedZonesWithCompletion:(id *)a1
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  _BOOL4 v14;
  _DKFetchDatabaseChangesOperation *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  char v23;
  id v24;
  char v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  id from;
  id location;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v27 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    v4 = (void *)os_transaction_create();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_DKSyncCloudKitKnowledgeStorage fetchChangedZonesWithCompletion:].cold.5();

    v6 = a1[2];
    v7 = a1[16];
    if (!v7)
    {
      objc_msgSend(v6, "dataForKey:", CFSTR("FetchDatabaseChangesServerChangeToken"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v42 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v42);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v9 = v42;
        v10 = v9;
        if (v7)
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v44 = v26;
            v45 = 2114;
            v46 = CFSTR("FetchDatabaseChangesServerChangeToken");
            v47 = 2112;
            v48 = v7;
            v49 = 2112;
            v50 = v8;
            _os_log_debug_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Token %{public}@ is %@ (%@)", buf, 0x2Au);

          }
          objc_storeStrong(a1 + 16, v7);
        }
        else
        {
          v12 = v9 == 0;
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
          if (v12)
          {
            if (v14)
              -[_DKSyncCloudKitKnowledgeStorage fetchChangedZonesWithCompletion:].cold.3();
          }
          else if (v14)
          {
            -[_DKSyncCloudKitKnowledgeStorage fetchChangedZonesWithCompletion:].cold.4((uint64_t)a1, v10);
          }

          objc_msgSend(a1[2], "removeObjectForKey:", CFSTR("FetchDatabaseChangesServerChangeToken"));
        }
      }
      else
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[_DKSyncCloudKitKnowledgeStorage fetchChangedZonesWithCompletion:].cold.2();
        v7 = 0;
      }

    }
    v15 = -[_DKFetchDatabaseChangesOperation initWithPreviousServerChangeToken:]([_DKFetchDatabaseChangesOperation alloc], "initWithPreviousServerChangeToken:", v7);
    v16 = (void *)objc_opt_new();
    -[_DKFetchDatabaseChangesOperation setGroup:](v15, "setGroup:", v16);

    -[_DKFetchDatabaseChangesOperation group](v15, "group");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setName:", CFSTR("FetchChangedZones"));

    -[_DKFetchDatabaseChangesOperation setFetchAllChanges:](v15, "setFetchAllChanges:", 1);
    objc_initWeak(&location, a1);
    objc_initWeak(&from, v15);
    v18 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke;
    v38[3] = &unk_1E26E36E8;
    v38[4] = a1;
    objc_copyWeak(&v39, &location);
    -[_DKFetchDatabaseChangesOperation setRecordZoneWithIDChangedBlock:](v15, "setRecordZoneWithIDChangedBlock:", v38);
    v36[0] = v18;
    v36[1] = 3221225472;
    v36[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_140;
    v36[3] = &unk_1E26E36E8;
    v36[4] = a1;
    objc_copyWeak(&v37, &location);
    -[_DKFetchDatabaseChangesOperation setRecordZoneWithIDWasDeletedBlock:](v15, "setRecordZoneWithIDWasDeletedBlock:", v36);
    v35[0] = v18;
    v35[1] = 3221225472;
    v35[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_142;
    v35[3] = &unk_1E26E3710;
    v35[4] = a1;
    -[_DKFetchDatabaseChangesOperation setChangeTokenUpdatedBlock:](v15, "setChangeTokenUpdatedBlock:", v35);
    v29[0] = v18;
    v29[1] = 3221225472;
    v29[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_145;
    v29[3] = &unk_1E26E3760;
    objc_copyWeak(&v33, &from);
    v29[4] = a1;
    objc_copyWeak(&v34, &location);
    v19 = v6;
    v30 = v19;
    v20 = v27;
    v32 = v20;
    v21 = v4;
    v31 = v21;
    -[_DKFetchDatabaseChangesOperation setFetchDatabaseChangesCompletionBlock:](v15, "setFetchDatabaseChangesCompletionBlock:", v29);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncCloudKitKnowledgeStorage fetchChangedZonesWithCompletion:].cold.1();
    }

    v28 = 0;
    v23 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]((uint64_t)a1, v15, 0, 0, &v28);
    v24 = v28;
    if (v20)
      v25 = v23;
    else
      v25 = 1;
    if ((v25 & 1) == 0)
      (*((void (**)(id, id))v20 + 2))(v20, v24);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

- (void)setHasZoneAdditionChanges:(void *)a3 forZone:
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a1)
    goto LABEL_14;
  v6 = -[_DKSyncCloudKitKnowledgeStorage hasZoneAdditionChangesForZone:](a1, v5);
  if ((a2 & 1) != 0 || !v6)
  {
    if (((a2 ^ 1 | v6) & 1) != 0)
      goto LABEL_14;
    objc_msgSend(*(id *)(a1 + 104), "addObject:", v5);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    objc_msgSend((id)objc_opt_class(), "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 104), "valueForKeyPath:", CFSTR("zoneName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPrettyPrintCollection(v10, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v19 = v8;
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v11;
    v12 = "%{public}@: Adding %@ to additions changed zone list, now %@ changed zones: %@";
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 104), "removeObject:", v5);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 104), "valueForKeyPath:", CFSTR("zoneName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPrettyPrintCollection(v10, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v19 = v8;
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v11;
    v12 = "%{public}@: Removing %@ from additions changed zone list, %@ changed zones remain: %@";
LABEL_16:
    _os_log_debug_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_DEBUG, v12, buf, 0x2Au);

  }
LABEL_8:

  v13 = *(_QWORD *)(a1 + 104);
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v17;
  if (v15)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[_DKSyncCloudKitKnowledgeStorage setHasZoneAdditionChanges:forZone:].cold.1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 16), "setData:forKey:", v14, CFSTR("ZoneIDsWithAdditionChanges"));
  }

LABEL_14:
}

- (void)setHasZoneDeletionChanges:(void *)a3 forZone:
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a1)
    goto LABEL_14;
  v6 = -[_DKSyncCloudKitKnowledgeStorage hasZoneDeletionChangesForZone:](a1, v5);
  if ((a2 & 1) != 0 || !v6)
  {
    if (((a2 ^ 1 | v6) & 1) != 0)
      goto LABEL_14;
    objc_msgSend(*(id *)(a1 + 112), "addObject:", v5);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    objc_msgSend((id)objc_opt_class(), "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 112), "valueForKeyPath:", CFSTR("zoneName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPrettyPrintCollection(v10, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v19 = v8;
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v11;
    v12 = "%{public}@: Adding %@ to deletions changed zone list, now %@ changed zones: %@";
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 112), "removeObject:", v5);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 112), "valueForKeyPath:", CFSTR("zoneName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPrettyPrintCollection(v10, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v19 = v8;
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v11;
    v12 = "%{public}@: Removing %@ from deletions changed zone list, %@ changed zones remain: %@";
LABEL_16:
    _os_log_debug_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_DEBUG, v12, buf, 0x2Au);

  }
LABEL_8:

  v13 = *(_QWORD *)(a1 + 112);
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v17;
  if (v15)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[_DKSyncCloudKitKnowledgeStorage setHasZoneDeletionChanges:forZone:].cold.1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 16), "setData:forKey:", v14, CFSTR("ZoneIDsWithDeletionChanges"));
  }

LABEL_14:
}

- (void)addSourceDeviceIdentifierWithRecordZoneID:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v3 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    objc_msgSend(v3, "zoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("source-device-id:")))
    {
      +[_DKSyncCloudKitKnowledgeStorage deviceIDFromZoneID:](_DKSyncCloudKitKnowledgeStorage, "deviceIDFromZoneID:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID](_DKSyncCloudKitKnowledgeStorage, "mySyncZoneID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        if ((objc_msgSend(v3, "isEqual:", v7) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v8)
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              -[_DKSyncCloudKitKnowledgeStorage addSourceDeviceIdentifierWithRecordZoneID:].cold.1();

            objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v3, v6);
            -[_DKSyncCloudKitKnowledgeStorage configurePeerWithSourceDeviceID:zoneID:](a1, v6, v3);
          }
        }
      }

    }
  }

}

- (void)removeSourceDeviceIdentifierWithRecordZoneID:(id *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    objc_msgSend(v3, "zoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("source-device-id:")))
    {
      +[_DKSyncCloudKitKnowledgeStorage deviceIDFromZoneID:](_DKSyncCloudKitKnowledgeStorage, "deviceIDFromZoneID:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID](_DKSyncCloudKitKnowledgeStorage, "mySyncZoneID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        if ((objc_msgSend(v3, "isEqual:", v7) & 1) == 0)
        {
          objc_msgSend(a1[10], "objectForKeyedSubscript:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              -[_DKSyncCloudKitKnowledgeStorage removeSourceDeviceIdentifierWithRecordZoneID:].cold.1();

            objc_msgSend(a1[10], "setObject:forKeyedSubscript:", 0, v6);
            objc_msgSend(a1[11], "setObject:forKeyedSubscript:", 0, v3);
            v10 = a1[4];
            objc_msgSend(v3, "zoneName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "peerWithZoneName:sourceDeviceID:", v11, v6);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(a1[4], "removeActiveTransports:fromPeer:", 4, v12);
            objc_msgSend(a1, "setHasAdditionsFlag:forPeer:", 0, v12);
            objc_msgSend(a1, "setHasDeletionsFlag:forPeer:", 0, v12);
            if (!objc_msgSend(a1[4], "activeTransportsForPeer:", v12))
              objc_msgSend(a1[4], "removePeer:", v12);

          }
        }
      }

    }
  }

}

- (void)commitFetchDatabaseChangesServerChangeToken
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Done processing changed zones and ready to commit token %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)setPrewarmedFlag
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Setting prewarm flag", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)fastForwardPastDeletionsInNewZone:(void *)a3 sourceDeviceID:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = a3;
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    objc_msgSend(v5, "zoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_DKSyncCloudKitKnowledgeStorage fastForwardPastDeletionsInNewZone:sourceDeviceID:].cold.2();

    objc_msgSend(v5, "currentServerChangeToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[_DKSyncCloudKitKnowledgeStorage _setPreviousServerChangeToken:forRecordZoneID:](a1, v10, v8);
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_DKSyncCloudKitKnowledgeStorage fastForwardPastDeletionsInNewZone:sourceDeviceID:].cold.1();

    }
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v8, "zoneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "peerWithZoneName:sourceDeviceID:", v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "me");
      v17 = &stru_1E26E9728;
      v18 = CFSTR("pseudo ");
      if (!v16)
        v18 = &stru_1E26E9728;
      v24 = v18;
      objc_msgSend(v14, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "model");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "model");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR(" (%@)"), v23);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "zoneName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v27 = v25;
      v28 = 2114;
      v29 = v24;
      v30 = 2114;
      v31 = v19;
      v32 = 2114;
      v33 = v17;
      v34 = 2114;
      v35 = v22;
      _os_log_debug_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Instantiated %{public}@peer %{public}@%{public}@ from new zone with name %{public}@", buf, 0x34u);

      if (v20)
      {

      }
    }

    -[_DKSyncCloudKitKnowledgeStorage populateLastSeenDateIfNeededByPeer:](a1, v14);
    objc_msgSend(*(id *)(a1 + 32), "addActiveTransports:toPeer:", 4, v14);

  }
}

- (void)populateLastSeenDateIfNeededByPeer:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v7 = v3;
    objc_msgSend(v3, "lastSeenDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_5:

      v4 = v7;
      goto LABEL_6;
    }
    v6 = objc_msgSend(v7, "me");
    v4 = v7;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1296000.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setLastSeenDate:onPeer:", v5, v7);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)_setPreviousServerChangeToken:(void *)a3 forRecordZoneID:
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    -[_DKSyncCloudKitKnowledgeStorage _previousServerChangeTokenKeyForRecordZoneID:](a1, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[_DKSyncCloudKitKnowledgeStorage _setPreviousServerChangeToken:forRecordZoneID:].cold.1();
      goto LABEL_10;
    }
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 16), "setData:forKey:", v7, v6);
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v15 = v10;
        v16 = 2114;
        v17 = v6;
        v18 = 2112;
        v19 = v5;
        v20 = 2112;
        v21 = (uint64_t)v7;
        _os_log_debug_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Setting token %{public}@ to %@ (%@)", buf, 0x2Au);
LABEL_13:

      }
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject domain](v8, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSObject code](v8, "code");
        *(_DWORD *)buf = 138544386;
        v15 = v10;
        v16 = 2114;
        v17 = v6;
        v18 = 2114;
        v19 = v11;
        v20 = 2048;
        v21 = v12;
        v22 = 2112;
        v23 = v8;
        _os_log_error_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Error archiving token %{public}@: %{public}@:%lld (%@)", buf, 0x34u);

        goto LABEL_13;
      }
    }

LABEL_10:
  }

}

- (uint64_t)hasZoneAdditionChangesForZone:(uint64_t)a1
{
  id v3;
  _QWORD block[5];

  v3 = a2;
  if (a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65___DKSyncCloudKitKnowledgeStorage_hasZoneAdditionChangesForZone___block_invoke;
    block[3] = &unk_1E26E2F20;
    block[4] = a1;
    if (hasZoneAdditionChangesForZone__onceToken != -1)
      dispatch_once(&hasZoneAdditionChangesForZone__onceToken, block);
    a1 = objc_msgSend(*(id *)(a1 + 104), "containsObject:", v3);
  }

  return a1;
}

- (uint64_t)hasZoneDeletionChangesForZone:(uint64_t)a1
{
  id v3;
  _QWORD block[5];

  v3 = a2;
  if (a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65___DKSyncCloudKitKnowledgeStorage_hasZoneDeletionChangesForZone___block_invoke;
    block[3] = &unk_1E26E2F20;
    block[4] = a1;
    if (hasZoneDeletionChangesForZone__onceToken != -1)
      dispatch_once(&hasZoneDeletionChangesForZone__onceToken, block);
    a1 = objc_msgSend(*(id *)(a1 + 112), "containsObject:", v3);
  }

  return a1;
}

- (BOOL)hasAdditionsFlagForPeer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(v4, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C95098]);
    v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", v5, *MEMORY[0x1E0C94928]);
    v8 = -[_DKSyncCloudKitKnowledgeStorage hasZoneAdditionChangesForZone:]((uint64_t)self, v7);

  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (void)setHasAdditionsFlag:(BOOL)a3 forPeer:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  v6 = a4;
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C95098]);
    objc_msgSend(v6, "zoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithZoneName:ownerName:", v9, *MEMORY[0x1E0C94928]);

    -[_DKSyncCloudKitKnowledgeStorage setHasZoneAdditionChanges:forZone:]((uint64_t)self, v4, v10);
  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:].cold.1();

  }
}

- (BOOL)hasDeletionsFlagForPeer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(v4, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C95098]);
    v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", v5, *MEMORY[0x1E0C94928]);
    v8 = -[_DKSyncCloudKitKnowledgeStorage hasZoneDeletionChangesForZone:]((uint64_t)self, v7);

  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (void)setHasDeletionsFlag:(BOOL)a3 forPeer:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  v6 = a4;
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C95098]);
    objc_msgSend(v6, "zoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithZoneName:ownerName:", v9, *MEMORY[0x1E0C94928]);

    -[_DKSyncCloudKitKnowledgeStorage setHasZoneDeletionChanges:forZone:]((uint64_t)self, v4, v10);
  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:].cold.1();

  }
}

- (void)clearPrewarmedFlag
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Clearing prewarm flag", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)prewarmFetchWithCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (self->_isPrewarmed)
  {
    v5 = v7;
    if (v7)
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_8:
      v5 = v7;
    }
  }
  else
  {
    if (+[_DKCloudUtilities isSyncAvailableAndEnabled](_DKCloudUtilities, "isSyncAvailableAndEnabled"))
    {
      -[_DKSyncCloudKitKnowledgeStorage fetchChangedZonesWithCompletion:]((id *)&self->super.isa, v7);
      goto LABEL_8;
    }
    v5 = v7;
    if (v7)
    {
      +[_DKSyncErrors disabled](_DKSyncErrors, "disabled");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v6);

      goto LABEL_8;
    }
  }

}

- (void)fetchEventsFromPeer:(id)a3 windows:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 fetchOrder:(int64_t)a7 highPriority:(BOOL)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a9;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  if (+[_DKCloudUtilities isSyncAvailableAndEnabled](_DKCloudUtilities, "isSyncAvailableAndEnabled"))
  {
    objc_msgSend(v14, "zoneName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = objc_alloc(MEMORY[0x1E0C95098]);
      v21 = (void *)objc_msgSend(v20, "initWithZoneName:ownerName:", v19, *MEMORY[0x1E0C94928]);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __116___DKSyncCloudKitKnowledgeStorage_fetchEventsFromPeer_windows_streamNames_limit_fetchOrder_highPriority_completion___block_invoke;
      v24[3] = &unk_1E26E37B0;
      v25 = v17;
      -[_DKSyncCloudKitKnowledgeStorage syncDownAdditionsFromCloudWithZoneID:windows:streamNames:limit:fetchOrder:completion:](self, v21, v15, v16, a6, (void *)a7, v24);

    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:].cold.1();

      if (!v17)
        goto LABEL_11;
      +[_DKSyncErrors invalidRequest](_DKSyncErrors, "invalidRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v17 + 2))(v17, 0, 0, v21);
    }

LABEL_11:
    goto LABEL_12;
  }
  if (v17)
  {
    +[_DKSyncErrors disabled](_DKSyncErrors, "disabled");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v17 + 2))(v17, 0, 0, v22);

  }
LABEL_12:

}

- (void)syncDownAdditionsFromCloudWithZoneID:(void *)a3 windows:(void *)a4 streamNames:(unint64_t)a5 limit:(void *)a6 fetchOrder:(void *)a7 completion:
{
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  unint64_t v32;
  unint64_t v33;
  void *v36;
  _DKQueryOperation *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  char v47;
  id v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id val;
  id v67;
  id v68;
  id v69;
  _QWORD v70[5];
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77[3];
  _QWORD v78[4];
  id v79;
  id from;
  id location;
  void *v82;
  _QWORD v83[2];
  _QWORD v84[2];
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  id v90;
  __int16 v91;
  id v92;
  __int16 v93;
  id v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v67 = a2;
  v68 = a3;
  v64 = a4;
  v65 = a7;
  val = a1;
  if (a1)
  {
    v63 = (void *)os_transaction_create();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v68, "count"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      _CDPrettyPrintCollection(v64, 0, 0, 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v86 = v50;
      v87 = 2112;
      v88 = v51;
      v89 = 2112;
      v90 = v67;
      v91 = 2114;
      v92 = v52;
      _os_log_debug_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Syncing down records in %@ windows from %@ for streams %{public}@", buf, 0x2Au);

    }
    if (objc_msgSend(v68, "count"))
    {
      if ((unint64_t)objc_msgSend(v68, "count") < 2)
      {
        objc_msgSend(v68, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v68, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKSyncWindow startDate]((uint64_t)v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKSyncType urgency]((uint64_t)v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v13, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v68, "count"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          _CDPrettyPrintCollection(v64, 0, 0, 0);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v86 = v53;
          v87 = 2112;
          v88 = v54;
          v89 = 2114;
          v90 = v16;
          v91 = 2114;
          v92 = v68;
          v93 = 2112;
          v94 = v67;
          v95 = 2114;
          v96 = v55;
          _os_log_error_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Combining sync down request windows into 1 of %@ windows (%{public}@ instead of %{public}@) from %@ for streams %{public}@", buf, 0x3Eu);

        }
      }
      -[_DKSyncWindow startDate]((uint64_t)v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKSyncType urgency]((uint64_t)v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (a6 == (void *)2)
        v20 = CFSTR("%K >= %@");
      else
        v20 = CFSTR("%K > %@");
      if (a6 == (void *)2)
        v21 = CFSTR("%K < %@");
      else
        v21 = CFSTR("%K <= %@");
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v20, CFSTR("eventCreationDate"), v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v21, CFSTR("eventCreationDate"), v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB3528];
      v84[0] = v22;
      v84[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "andPredicateWithSubpredicates:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("streamName"), v64);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB3528];
      v83[0] = v26;
      v83[1] = v59;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "andPredicateWithSubpredicates:", v28);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("eventCreationDate"), a6 != (void *)2);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("DKEvent"), v62);
      v82 = v58;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setSortDescriptors:", v30);

      v31 = CFSTR("SyncDownAdditionsFromCloud");
      if (a5 == 1)
        v31 = CFSTR("QueryRecordFromCloud");
      v57 = v31;
      v32 = *MEMORY[0x1E0C94988];
      if (a5)
        v33 = a5;
      else
        v33 = *MEMORY[0x1E0C94988];
      if (v33 > v32 && v32 != 0 && v33 > 1)
        v36 = (void *)*MEMORY[0x1E0C94988];
      else
        v36 = (void *)v33;
      v37 = -[CKQueryOperation initWithQuery:]([_DKQueryOperation alloc], "initWithQuery:", v29);
      v38 = (void *)objc_opt_new();
      -[_DKQueryOperation setGroup:](v37, "setGroup:", v38);

      -[_DKQueryOperation group](v37, "group");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setName:", v57);

      -[_DKQueryOperation setAllowsCellularAccess:](v37, "setAllowsCellularAccess:", 0);
      -[CKQueryOperation setResultsLimit:](v37, "setResultsLimit:", v36);
      -[CKQueryOperation setZoneID:](v37, "setZoneID:", v67);
      objc_initWeak(&location, val);
      objc_initWeak(&from, v37);
      v40 = (void *)objc_opt_new();
      v41 = MEMORY[0x1E0C809B0];
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke;
      v78[3] = &unk_1E26E37D8;
      v42 = v40;
      v79 = v42;
      -[CKQueryOperation setRecordFetchedBlock:](v37, "setRecordFetchedBlock:", v78);
      v70[0] = v41;
      v70[1] = 3221225472;
      v70[2] = __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_3;
      v70[3] = &unk_1E26E3828;
      v70[4] = val;
      v43 = v42;
      v71 = v43;
      v72 = v67;
      v73 = v68;
      objc_copyWeak(&v76, &from);
      v77[1] = v36;
      v77[2] = a6;
      v44 = v65;
      v75 = v44;
      objc_copyWeak(v77, &location);
      v74 = v63;
      -[CKQueryOperation setQueryCompletionBlock:](v37, "setQueryCompletionBlock:", v70);
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncCloudKitKnowledgeStorage syncDownAdditionsFromCloudWithZoneID:windows:streamNames:limit:fetchOrder:completion:].cold.1();
      }

      +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", 4);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0;
      v47 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]((uint64_t)val, v37, 1, v46, &v69);
      v48 = v69;
      if (v44)
        v49 = v47;
      else
        v49 = 1;
      if ((v49 & 1) == 0)
        (*((void (**)(id, _QWORD, _QWORD, id))v44 + 2))(v44, 0, 0, v48);

      objc_destroyWeak(v77);
      objc_destroyWeak(&v76);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
    else if (v65)
    {
      +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v65 + 2))(v65, 0, 0, v61);

    }
  }

}

- (void)fetchDeletedEventIDsFromPeer:(id)a3 sinceDate:(id)a4 streamNames:(id)a5 limit:(unint64_t)a6 highPriority:(BOOL)a7 completion:(id)a8
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;

  v10 = a3;
  v11 = a8;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if (+[_DKCloudUtilities isSyncAvailableAndEnabled](_DKCloudUtilities, "isSyncAvailableAndEnabled"))
  {
    objc_msgSend(v10, "zoneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0C95098]);
      v15 = (void *)objc_msgSend(v14, "initWithZoneName:ownerName:", v13, *MEMORY[0x1E0C94928]);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __116___DKSyncCloudKitKnowledgeStorage_fetchDeletedEventIDsFromPeer_sinceDate_streamNames_limit_highPriority_completion___block_invoke;
      v17[3] = &unk_1E26E3850;
      v18 = v11;
      -[_DKSyncCloudKitKnowledgeStorage syncDownDeletionsFromCloudWithZoneID:completion:](self, v15, v17);

    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[_DKSyncCloudKitKnowledgeStorage hasAdditionsFlagForPeer:].cold.1();

      if (!v11)
        goto LABEL_11;
      +[_DKSyncErrors invalidRequest](_DKSyncErrors, "invalidRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v15);
    }

LABEL_11:
    goto LABEL_12;
  }
  if (v11)
  {
    +[_DKSyncErrors disabled](_DKSyncErrors, "disabled");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v13);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)syncDownDeletionsFromCloudWithZoneID:(void *)a3 completion:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = (void *)os_transaction_create();
    v8 = (void *)objc_opt_new();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_completion___block_invoke;
    v11[3] = &unk_1E26E3878;
    v12 = v8;
    v13 = v5;
    v14 = v7;
    v15 = v6;
    v9 = v7;
    v10 = v8;
    -[_DKSyncCloudKitKnowledgeStorage syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:](a1, v13, v10, 1, v11);

  }
}

- (void)syncDownDeletionsFromCloudWithZoneID:(void *)a3 deletedRecordIDsAndTypes:(uint64_t)a4 attempt:(void *)a5 completion:
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _DKFetchRecordZoneChangesOperation *v12;
  void *v13;
  _DKFetchRecordZoneChangesOperation *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  char v22;
  id v23;
  char v24;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35[2];
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v29 = a3;
  v28 = a5;
  if (a1)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[_DKSyncCloudKitKnowledgeStorage syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:].cold.3();

      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setDesiredKeys:", MEMORY[0x1E0C9AA60]);
      -[_DKSyncCloudKitKnowledgeStorage _previousServerChangeTokenForRecordZoneID:]((uint64_t)a1, v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        objc_msgSend(v10, "setPreviousServerChangeToken:", v27);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v8);
      v12 = [_DKFetchRecordZoneChangesOperation alloc];
      v41[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_DKFetchRecordZoneChangesOperation initWithRecordZoneIDs:optionsByRecordZoneID:](v12, "initWithRecordZoneIDs:optionsByRecordZoneID:", v13, v11);

      v15 = (void *)objc_opt_new();
      -[_DKFetchRecordZoneChangesOperation setGroup:](v14, "setGroup:", v15);

      -[_DKFetchRecordZoneChangesOperation group](v14, "group");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setName:", CFSTR("SyncDownDeletionsFromCloud"));

      -[_DKFetchRecordZoneChangesOperation setFetchAllChanges:](v14, "setFetchAllChanges:", 1);
      objc_initWeak(&location, a1);
      v17 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke;
      v38[3] = &unk_1E26E38A0;
      v18 = v29;
      v39 = v18;
      -[_DKFetchRecordZoneChangesOperation setRecordWithIDWasDeletedBlock:](v14, "setRecordWithIDWasDeletedBlock:", v38);
      v36[0] = v17;
      v36[1] = 3221225472;
      v36[2] = __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_3;
      v36[3] = &unk_1E26E38F0;
      objc_copyWeak(&v37, &location);
      -[_DKFetchRecordZoneChangesOperation setRecordZoneFetchCompletionBlock:](v14, "setRecordZoneFetchCompletionBlock:", v36);
      v31[0] = v17;
      v31[1] = 3221225472;
      v31[2] = __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_5;
      v31[3] = &unk_1E26E3940;
      v31[4] = a1;
      v32 = v8;
      objc_copyWeak(v35, &location);
      v35[1] = v26;
      v33 = v18;
      v19 = v28;
      v34 = v19;
      -[_DKFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:](v14, "setFetchRecordZoneChangesCompletionBlock:", v31);
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncCloudKitKnowledgeStorage syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:].cold.2();
      }

      +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v22 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]((uint64_t)a1, v14, 1, v21, &v30);
      v23 = v30;
      if (v19)
        v24 = v22;
      else
        v24 = 1;
      if ((v24 & 1) == 0)
        (*((void (**)(id, id))v19 + 2))(v19, v23);

      objc_destroyWeak(v35);
      objc_destroyWeak(&v37);

      objc_destroyWeak(&location);
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[_DKSyncCloudKitKnowledgeStorage syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:].cold.1();
    }

  }
}

- (id)_previousServerChangeTokenKeyForRecordZoneID:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a2, "zoneName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("FetchRecordZoneChangesPreviousServerChangeToken/%@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_previousServerChangeTokenForRecordZoneID:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[_DKSyncCloudKitKnowledgeStorage _previousServerChangeTokenKeyForRecordZoneID:](a1, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 16), "dataForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[_DKSyncCloudKitKnowledgeStorage _previousServerChangeTokenForRecordZoneID:].cold.1();
      v5 = 0;
      goto LABEL_15;
    }
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    if (v5)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v17 = v14;
        v18 = 2114;
        v19 = v3;
        v20 = 2112;
        v21 = v5;
        v22 = 2112;
        v23 = (uint64_t)v4;
        _os_log_debug_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: Token %{public}@ is %@ (%@)", buf, 0x2Au);

      }
      goto LABEL_15;
    }
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v9)
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject domain](v6, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSObject code](v6, "code");
        *(_DWORD *)buf = 138544386;
        v17 = v10;
        v18 = 2114;
        v19 = v3;
        v20 = 2114;
        v21 = v11;
        v22 = 2048;
        v23 = v12;
        v24 = 2112;
        v25 = v6;
        _os_log_error_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error unarchiving token %{public}@: %{public}@:%lld (%@)", buf, 0x34u);

LABEL_17:
      }
    }
    else if (v9)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2114;
      v19 = v3;
      v20 = 2112;
      v21 = v4;
      _os_log_error_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchive token %{public}@: %@", buf, 0x20u);
      goto LABEL_17;
    }

    objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", v3);
LABEL_15:

    return v5;
  }
  return 0;
}

- (void)_resetPreviousServerChangeTokenForRecordZoneID:(uint64_t)a1
{
  void *v3;
  NSObject *v4;

  if (a1)
  {
    -[_DKSyncCloudKitKnowledgeStorage _previousServerChangeTokenKeyForRecordZoneID:](a1, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", v3);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[_DKSyncCloudKitKnowledgeStorage _resetPreviousServerChangeTokenForRecordZoneID:].cold.1();

  }
}

- (void)fetchAdditionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void *v22;
  _QWORD v23[2];

  v6 = a4;
  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "sourceDeviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncMetadataStorage windowStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __95___DKSyncCloudKitKnowledgeStorage_fetchAdditionsHighWaterMarkWithPeer_highPriority_completion___block_invoke;
  v19[3] = &unk_1E26E3968;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v17 = v9;
  v18 = v8;
  -[_DKSyncCloudKitKnowledgeStorage fetchEventsFromPeer:windows:streamNames:limit:fetchOrder:highPriority:completion:](self, "fetchEventsFromPeer:windows:streamNames:limit:fetchOrder:highPriority:completion:", v18, v15, v16, 1, 2, v6, v19);

}

- (void)fetchDeletionsHighWaterMarkWithPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void *v22;
  _QWORD v23[2];

  v6 = a4;
  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "sourceDeviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncMetadataStorage bookmarkStreamNameWithSourceDeviceID:]((uint64_t)_DKSyncMetadataStorage, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncWindow syncWindowWithStartDate:endDate:]((uint64_t)_DKSyncWindow, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __95___DKSyncCloudKitKnowledgeStorage_fetchDeletionsHighWaterMarkWithPeer_highPriority_completion___block_invoke;
  v19[3] = &unk_1E26E3968;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v17 = v9;
  v18 = v8;
  -[_DKSyncCloudKitKnowledgeStorage fetchEventsFromPeer:windows:streamNames:limit:fetchOrder:highPriority:completion:](self, "fetchEventsFromPeer:windows:streamNames:limit:fetchOrder:highPriority:completion:", v18, v15, v16, 1, 2, v6, v19);

}

- (void)fetchSourceDeviceIDFromPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a5;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v12, "sourceDeviceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

    if (v10)
    {
      (*((void (**)(id, void *, _QWORD, _QWORD))v6 + 2))(v6, v10, 0, 0);
    }
    else
    {
      +[_DKSyncErrors invalidData](_DKSyncErrors, "invalidData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v11);

    }
  }

}

- (void)setFetchDelegate:(id)a3
{
  _DKSyncRemoteKnowledgeStorageFetchDelegate *v4;
  NSObject *v5;
  _DKSyncRemoteKnowledgeStorageFetchDelegate *delegate;

  v4 = (_DKSyncRemoteKnowledgeStorageFetchDelegate *)a3;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  delegate = self->_delegate;
  self->_delegate = v4;

}

- (void)updateStorageWithAddedEvents:(id)a3 deletedEventIDs:(id)a4 highPriority:(BOOL)a5 completion:(id)a6
{
  id v8;
  id *v9;
  id v10;
  _UNKNOWN **v11;
  _DKEventCKConverter *v12;
  void *v13;
  _DKEventCKConverter *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _UNKNOWN **v21;
  void *v22;
  _DKEventCKConverter *v23;
  id *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v41;
  void *v42;
  id obj;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (id *)a4;
  v10 = a6;
  if (objc_msgSend(v8, "count") || -[_DKSyncDeletedEventIDs count]((uint64_t)v9))
  {
    v11 = &off_1E26E0000;
    if (objc_msgSend(v8, "count"))
    {
      v12 = [_DKEventCKConverter alloc];
      +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID](_DKSyncCloudKitKnowledgeStorage, "mySyncZoneID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_DKEventCKConverter initWithZoneID:](v12, "initWithZoneID:", v13);

      -[_DKEventCKConverter recordsFromEvents:](v14, "recordsFromEvents:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    if (-[_DKSyncDeletedEventIDs count]((uint64_t)v9))
    {
      v37 = v15;
      v38 = v10;
      v39 = v8;
      v42 = (void *)objc_opt_new();
      -[_DKSyncDeletedEventIDs sourceDeviceIDs](v9);
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v16)
      {
        v17 = v16;
        v44 = *(_QWORD *)v46;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v46 != v44)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v18);
            v20 = (void *)MEMORY[0x193FEE914]();
            v21 = v11;
            objc_msgSend(v11[463], "zoneIDWithDeviceID:", v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[_DKEventCKConverter initWithZoneID:]([_DKEventCKConverter alloc], "initWithZoneID:", v22);
            v24 = v9;
            -[_DKSyncDeletedEventIDs deletedEventIDsForSourceDeviceID:](v9, v19);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "count"))
            {
              -[_DKEventCKConverter recordIDsFromEventIDs:](v23, "recordIDsFromEventIDs:", v25);
              v26 = objc_claimAutoreleasedReturnValue();
              if (-[NSObject count](v26, "count"))
                objc_msgSend(v42, "addObjectsFromArray:", v26);
            }
            else
            {
              +[_CDLogging syncChannel](_CDLogging, "syncChannel");
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend((id)objc_opt_class(), "description");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v50 = v41;
                v51 = 2112;
                v52 = v19;
                _os_log_error_impl(&dword_18DDBE000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find deleted event ids for %@", buf, 0x16u);

              }
            }

            objc_autoreleasePoolPop(v20);
            ++v18;
            v9 = v24;
            v11 = v21;
          }
          while (v17 != v18);
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v17);
      }

      v10 = v38;
      v8 = v39;
      v15 = v37;
    }
    else
    {
      v42 = 0;
    }
    v27 = objc_msgSend(v15, "count");
    if (v27 != objc_msgSend(v8, "count"))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count") - objc_msgSend(v15, "count"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v50 = v31;
        v51 = 2112;
        v52 = (uint64_t)v32;
        v53 = 2112;
        v54 = v33;
        _os_log_error_impl(&dword_18DDBE000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Unable to convert %@ of %@ added events", buf, 0x20u);

      }
    }
    v29 = objc_msgSend(v42, "count");
    if (v29 != -[_DKSyncDeletedEventIDs count]((uint64_t)v9))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncDeletedEventIDs count]((uint64_t)v9) - objc_msgSend(v42, "count"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DKSyncDeletedEventIDs count]((uint64_t)v9));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v50 = v34;
        v51 = 2112;
        v52 = (uint64_t)v35;
        v53 = 2112;
        v54 = v36;
        _os_log_error_impl(&dword_18DDBE000, v30, OS_LOG_TYPE_ERROR, "%{public}@: Unable to convert %@ of %@ deleted events", buf, 0x20u);

      }
    }
    -[_DKSyncCloudKitKnowledgeStorage syncUpToCloudWithRecordsToSave:recordIDsToDelete:completion:](self, v15, v42, v10);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)syncUpToCloudWithRecordsToSave:(void *)a3 recordIDsToDelete:(void *)a4 completion:
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _DKModifyRecordsOperation *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  char v18;
  id v19;
  char v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id from;
  id location[5];

  location[4] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v21 = a4;
  if (a1)
  {
    v9 = (void *)os_transaction_create();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[_DKSyncCloudKitKnowledgeStorage syncUpToCloudWithRecordsToSave:recordIDsToDelete:completion:].cold.2();

    v11 = -[_DKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]([_DKModifyRecordsOperation alloc], "initWithRecordsToSave:recordIDsToDelete:", v7, v8);
    v12 = (void *)objc_opt_new();
    -[_DKModifyRecordsOperation setGroup:](v11, "setGroup:", v12);

    -[_DKModifyRecordsOperation group](v11, "group");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", CFSTR("SyncUpToCloud"));

    -[_DKModifyRecordsOperation setSavePolicy:](v11, "setSavePolicy:", 1);
    -[_DKModifyRecordsOperation setAtomic:](v11, "setAtomic:", 1);
    objc_initWeak(location, a1);
    objc_initWeak(&from, v11);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __95___DKSyncCloudKitKnowledgeStorage_syncUpToCloudWithRecordsToSave_recordIDsToDelete_completion___block_invoke;
    v23[3] = &unk_1E26E39B8;
    objc_copyWeak(&v28, &from);
    v23[4] = a1;
    v24 = v7;
    v25 = v8;
    objc_copyWeak(&v29, location);
    v14 = v21;
    v27 = v14;
    v15 = v9;
    v26 = v15;
    -[_DKModifyRecordsOperation setModifyRecordsCompletionBlock:](v11, "setModifyRecordsCompletionBlock:", v23);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncCloudKitKnowledgeStorage syncUpToCloudWithRecordsToSave:recordIDsToDelete:completion:].cold.1();
    }

    +[_DKSync2Policy policyForSyncTransportType:](_DKSync2Policy, "policyForSyncTransportType:", 8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v18 = -[_DKSyncCloudKitKnowledgeStorage _queueOperationForPrivateCloudDatabase:dependent:policy:error:]((uint64_t)a1, v11, 1, v17, &v22);
    v19 = v22;
    if (v14)
      v20 = v18;
    else
      v20 = 1;
    if ((v20 & 1) == 0)
      (*((void (**)(id, id))v14 + 2))(v14, v19);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);

  }
}

- (id)name
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Should not be called"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (int64_t)transportType
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Should not be called"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_DKSyncCloudKitKnowledgeStorage runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:].cold.1();

    objc_msgSend(*(id *)(a1 + 40), "activity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke;
    v8[3] = &unk_1E26E3A08;
    v8[4] = a1;
    v9 = v6;
    v10 = v3;
    v7 = v6;
    -[_DKSyncCloudKitKnowledgeStorage performUpdateSourceDeviceIdentifiersWithCompletion:](a1, v8);

  }
}

- (id)executionCriteriaForUpdateSourceDeviceIdentifiersPeriodicJob
{
  char *v1;
  char *v2;
  char *v3;
  xpc_object_t v4;
  uint64_t i;
  xpc_object_t values[6];
  char *keys[7];

  keys[6] = *(char **)MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = (char *)*MEMORY[0x1E0C80790];
  keys[0] = *(char **)MEMORY[0x1E0C80760];
  keys[1] = v1;
  v2 = (char *)*MEMORY[0x1E0C808C8];
  keys[2] = *(char **)MEMORY[0x1E0C80898];
  keys[3] = v2;
  v3 = (char *)*MEMORY[0x1E0C808B8];
  keys[4] = *(char **)MEMORY[0x1E0C80878];
  keys[5] = v3;
  values[0] = xpc_int64_create(0);
  values[1] = xpc_int64_create(1);
  values[2] = xpc_BOOL_create(0);
  values[3] = xpc_BOOL_create(1);
  values[4] = xpc_string_create((const char *)*MEMORY[0x1E0C80888]);
  values[5] = xpc_BOOL_create(1);
  v4 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
  for (i = 5; i != -1; --i)

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_outstandingOperations, 0);
  objc_destroyWeak((id *)&self->_previousDependentOperation);
  objc_storeStrong((id *)&self->_fetchDatabaseChangesServerChangeToken, 0);
  objc_storeStrong((id *)&self->_zoneIDsWithUnrecoverableDecryptionErrors, 0);
  objc_storeStrong((id *)&self->_zoneIDsWithDeletionChanges, 0);
  objc_storeStrong((id *)&self->_zoneIDsWithAdditionChanges, 0);
  objc_storeStrong((id *)&self->_recordZonesByZoneID, 0);
  objc_storeStrong((id *)&self->_zoneIDsBySourceDeviceID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_updateSourceDeviceIdentifiersPeriodicJob, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_activityThrottler, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_DKSync2Coordinator(APSConnectionDelegate) connection:didReceivePublicToken:].cold.1();

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  v5 = a4;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_DKSync2Coordinator(APSConnectionDelegate) connection:didReceiveIncomingMessage:].cold.1();

  -[_DKKeyValueStore setBool:forKey:](self->_keyValueStore, "setBool:forKey:", 1, CFSTR("DatabaseChangesExist"));
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_DKSyncCloudKitKnowledgeStorage(APSConnectionDelegate) connection:didReceiveIncomingMessage:].cold.2();

  if (-[_DKSyncPeerStatusTracker isSingleDevice](self->_tracker, "isSingleDevice"))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_DKSyncCloudKitKnowledgeStorage(APSConnectionDelegate) connection:didReceiveIncomingMessage:].cold.1();

    -[_DKSyncCloudKitKnowledgeStorage performUpdateSourceDeviceIdentifiersWithCompletion:]((uint64_t)self, 0);
  }

}

- (void)startShouldUpdateSourceDeviceIdentifiers
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Single device should update synced device identifiers", v4);

  OUTLINED_FUNCTION_33();
}

- (void)finishStartOrError:.cold.1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_28(*MEMORY[0x1E0C80C00]), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Failed to finish start: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

- (void)registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Scheduling periodic job: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)configureCloudPseudoPeerWithMySyncZoneID:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11, int a12, __int16 a13, __int16 a14, void *a15, __int128 a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;

  OUTLINED_FUNCTION_41();
  a27 = v28;
  a28 = v29;
  v31 = v30;
  v33 = v32;
  a18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = &stru_1E26E9728;
  if (objc_msgSend(v33, "me"))
    v36 = CFSTR("pseudo ");
  else
    v36 = &stru_1E26E9728;
  objc_msgSend(v33, "identifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "model");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v33, "model");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringWithFormat:", CFSTR(" (%@)"));
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  LODWORD(a11) = 138544130;
  *(_QWORD *)((char *)&a11 + 4) = v34;
  WORD6(a11) = 2114;
  *(_QWORD *)((char *)&a11 + 14) = v36;
  a14 = 2114;
  a15 = v37;
  LOWORD(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 2) = v35;
  OUTLINED_FUNCTION_42(&dword_18DDBE000, v31, v38, "%{public}@: Configured %{public}@peer %{public}@%{public}@", (uint8_t *)&a11);
  if (v39)
  {

  }
  OUTLINED_FUNCTION_19();
}

- (void)_queueOperationForPrivateCloudDatabase:dependent:policy:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Unable to instantiate container: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_queueOperationForPrivateCloudDatabase:dependent:policy:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v1, v2, "%{public}@: Unable to instantiate private cloud database", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_queueOperationForPrivateCloudDatabase:dependent:policy:error:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v1, v2, "%{public}@: Missing trigger reason", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_handleAnySpecialnessWithOperationError:.cold.1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_28(*MEMORY[0x1E0C80C00]), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Unrecoverable decryption error: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

- (void)_createZoneWithZoneID:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Queuing operation to create zone", v4);

  OUTLINED_FUNCTION_33();
}

- (void)_createZoneWithZoneID:completion:.cold.2()
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
  objc_msgSend((id)objc_opt_class(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Creating zone %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)_deleteZoneWithZoneID:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Queuing operation to delete zone", v4);

  OUTLINED_FUNCTION_33();
}

- (void)_performThrottledUpdateSourceDeviceIdentifiersWithCompletion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Queuing operation to fetch sync device identifiers", v4);

  OUTLINED_FUNCTION_33();
}

- (void)_performThrottledUpdateSourceDeviceIdentifiersWithCompletion:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Fetching sync device identifiers", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)updateSourceDeviceIdentifiersWithRecordZonesByZoneID:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Done fetching zone identifiers", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)updateSourceDeviceIdentifiersWithRecordZonesByZoneID:completion:.cold.2()
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
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v0, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v3, v4, "%{public}@: Fetched %@ record zones", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)_storeZoneIDFromRecords:orError:.cold.1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v2, v3, "%{public}@: Zone added: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)_storeZoneIDFromRecords:orError:.cold.2()
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
  objc_msgSend((id)OUTLINED_FUNCTION_28(*MEMORY[0x1E0C80C00]), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_8_2(&dword_18DDBE000, v2, v3, "%{public}@: Failed to create zone: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

- (void)fetchChangedZonesWithCompletion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2(&dword_18DDBE000, v6, v4, "%{public}@: Queuing operation to fetch changed zones from token %{public}@", v5);

  OUTLINED_FUNCTION_33();
}

- (void)fetchChangedZonesWithCompletion:.cold.2()
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
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: No previous token %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)fetchChangedZonesWithCompletion:.cold.3()
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
  objc_msgSend((id)objc_opt_class(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5_2(&dword_18DDBE000, v1, v2, "%{public}@: Failed to unarchive token %{public}@: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7_1();
}

- (void)fetchChangedZonesWithCompletion:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "code");
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_21_0(&dword_18DDBE000, v5, v6, "%{public}@: Error unarchiving token %{public}@: %{public}@:%lld (%@)", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_12();
}

- (void)fetchChangedZonesWithCompletion:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Fetching changed zones", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)setHasZoneAdditionChanges:forZone:.cold.1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Error serializing _zoneIDsWithAdditionChanges - %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)setHasZoneDeletionChanges:forZone:.cold.1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v1, v2, "%{public}@: Error serializing _zoneIDsWithDeletionChanges - %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)addSourceDeviceIdentifierWithRecordZoneID:.cold.1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Adding peer source device id %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)removeSourceDeviceIdentifierWithRecordZoneID:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Deleting peer source device id %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)fastForwardPastDeletionsInNewZone:sourceDeviceID:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "zoneName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v2, v3, "%{public}@: Unable to fast forward past deletions in zone with name %{public}@ due to missing currentServerChangeToken", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)fastForwardPastDeletionsInNewZone:sourceDeviceID:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "zoneName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v2, v3, "%{public}@: Fast forwarding past deletions in zone with name %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)_setPreviousServerChangeToken:forRecordZoneID:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Ignoring empty token %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)hasAdditionsFlagForPeer:.cold.1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_18(&dword_18DDBE000, v1, v2, "%{public}@: Peer is missing zoneName: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)syncDownAdditionsFromCloudWithZoneID:windows:streamNames:limit:fetchOrder:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2(&dword_18DDBE000, v6, v4, "%{public}@: Queuing operation to sync down records from %{public}@", v5);

  OUTLINED_FUNCTION_33();
}

- (void)syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18DDBE000, v1, v2, "%{public}@: Failed to sync down deletions from the cloud due to missing zoneID", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  *(_DWORD *)v1 = 138543618;
  *(_QWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2112;
  *(_QWORD *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_2(&dword_18DDBE000, v5, v1, "%{public}@: Queuing operation to sync down deletions from the cloud for %@", v4);

  OUTLINED_FUNCTION_33();
}

- (void)syncDownDeletionsFromCloudWithZoneID:deletedRecordIDsAndTypes:attempt:completion:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Syncing down deletions from %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)_previousServerChangeTokenForRecordZoneID:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: No previous token %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)_resetPreviousServerChangeTokenForRecordZoneID:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Resetting token %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)syncUpToCloudWithRecordsToSave:recordIDsToDelete:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Queuing operation to sync to the cloud", v4);

  OUTLINED_FUNCTION_33();
}

- (void)syncUpToCloudWithRecordsToSave:recordIDsToDelete:completion:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Syncing to the cloud", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Running periodic job: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

@end
