@implementation ATXDailyPhubbingAccumulator

- (ATXDailyPhubbingAccumulator)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  ATXDailyPhubbingAccumulator *v17;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchPeopleWithProximityFromStartDate:toEndDate:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "Device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ScreenLocked");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  BiomeLibrary();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "App");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "InFocus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v3, 0, 0, 0, 0);
  v14 = *MEMORY[0x1E0CF9398];
  objc_msgSend(v9, "publisherWithUseCase:options:", *MEMORY[0x1E0CF9398], v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publisherWithUseCase:options:", v14, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ATXDailyPhubbingAccumulator initWithProximityEventPublisher:screenLockedPublisher:appLaunchPublisher:](self, "initWithProximityEventPublisher:screenLockedPublisher:appLaunchPublisher:", v6, v15, v16);

  return v17;
}

- (ATXDailyPhubbingAccumulator)initWithProximityEventPublisher:(id)a3 screenLockedPublisher:(id)a4 appLaunchPublisher:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXDailyPhubbingAccumulator *v12;
  ATXDailyPhubbingAccumulator *v13;
  uint64_t v14;
  NSMutableArray *phubbingSessionEvents;
  uint64_t v16;
  NSMutableArray *appInFocusStartingEvents;
  uint64_t v18;
  NSMutableArray *appSessionsWithinPhubbingEvent;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXDailyPhubbingAccumulator;
  v12 = -[ATXDailyPhubbingAccumulator init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_proximityPublisher, a3);
    objc_storeStrong((id *)&v13->_deviceScreenLockedPublisher, a4);
    objc_storeStrong((id *)&v13->_appLaunchPublisher, a5);
    v14 = objc_opt_new();
    phubbingSessionEvents = v13->_phubbingSessionEvents;
    v13->_phubbingSessionEvents = (NSMutableArray *)v14;

    v16 = objc_opt_new();
    appInFocusStartingEvents = v13->_appInFocusStartingEvents;
    v13->_appInFocusStartingEvents = (NSMutableArray *)v16;

    v18 = objc_opt_new();
    appSessionsWithinPhubbingEvent = v13->_appSessionsWithinPhubbingEvent;
    v13->_appSessionsWithinPhubbingEvent = (NSMutableArray *)v18;

  }
  return v13;
}

- (BOOL)successfullyAccumulatedPhubbingEvents
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BPSPublisher *proximityPublisher;
  BPSPublisher *appLaunchPublisher;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *p_super;
  NSObject *v16;
  NSMutableArray *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  uint8_t buf[4];
  const char *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allInstalledAppsKnownToSpringBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  proximityPublisher = self->_proximityPublisher;
  appLaunchPublisher = self->_appLaunchPublisher;
  v28[0] = self->_deviceScreenLockedPublisher;
  v28[1] = appLaunchPublisher;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke;
  v25[3] = &unk_1E82DBFF8;
  v25[4] = self;
  -[BPSPublisher orderedMergeWithOthers:comparator:](proximityPublisher, "orderedMergeWithOthers:comparator:", v9, v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23[0] = &v22;
  v23[1] = 0x3032000000;
  v23[2] = __Block_byref_object_copy__71;
  v23[3] = __Block_byref_object_dispose__71;
  v24 = 0;
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_11;
  v21[3] = &unk_1E82DB658;
  v21[4] = &v22;
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_2;
  v19[3] = &unk_1E82DD4A0;
  v19[4] = self;
  v12 = v6;
  v20 = v12;
  v13 = (id)objc_msgSend(v11, "sinkWithCompletion:receiveInput:", v21, v19);
  v14 = *(_QWORD *)(v23[0] + 40);
  if (v14)
  {
    __atxlog_handle_usage_insights();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      -[ATXDailyPhubbingAccumulator successfullyAccumulatedPhubbingEvents].cold.1((uint64_t)v23, p_super);
  }
  else
  {
    __atxlog_handle_usage_insights();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[ATXDailyPhubbingAccumulator successfullyAccumulatedPhubbingEvents]";
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_INFO, "%s: Successfully accumulated phubbing session events", buf, 0xCu);
    }

    v17 = self->_phubbingSessionEvents;
    p_super = &self->_phubbingSessions->super;
    self->_phubbingSessions = &v17->super;
  }

  _Block_object_dispose(&v22, 8);
  return v14 == 0;
}

uint64_t __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromPeopleEvent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromScreenLockEvent:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromAppInFocusEvent:", v5);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v12;

  }
  objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromPeopleEvent:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromScreenLockEvent:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "dateIntervalFromAppInFocusEvent:", v6);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v18;

  }
  if (v9)
  {
    if (v15)
      goto LABEL_22;
    goto LABEL_19;
  }
  __atxlog_handle_usage_insights();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_cold_1((uint64_t)v5, v19, v20, v21, v22, v23, v24, v25);

  if (!v15)
  {
LABEL_19:
    __atxlog_handle_usage_insights();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_cold_1((uint64_t)v6, v26, v27, v28, v29, v30, v31, v32);

  }
LABEL_22:
  objc_msgSend(v9, "startDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "timeIntervalSinceReferenceDate");
  v35 = v34;

  objc_msgSend(v15, "startDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "timeIntervalSinceReferenceDate");
  v38 = v37;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v39, "compare:", v40);

  return v41;
}

void __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "trackMostRecentDiscoveredPeopleEvent:", v13);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v13;
    objc_msgSend(v3, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v3, "eventBody");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "starting") & 1) != 0)
      {
        if (objc_msgSend(v6, "starting"))
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v6);
          objc_msgSend(*(id *)(a1 + 32), "trackScreenEndingEvent:", v3);
        }
      }
      else
      {
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "starting"))
          objc_msgSend(*(id *)(a1 + 32), "trackScreenStartingEvent:", v3);
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v6);
      }

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v13;
    objc_msgSend(v7, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v7, "eventBody");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v10, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v11, "containsObject:", v12);

      if ((_DWORD)v11)
      {
        if (objc_msgSend(v10, "starting"))
        {
          objc_msgSend(*(id *)(a1 + 32), "recordAppLaunchStartEvent:", v10);
        }
        else if ((objc_msgSend(v10, "starting") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "recordAppLaunchEndEvent:", v10);
        }
      }

    }
  }

}

- (id)dateIntervalFromPeopleEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v4, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "endDate");
    else
      objc_msgSend(v4, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v9);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)dateIntervalFromScreenLockEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v4, "timestamp");
      v8 = (void *)objc_msgSend(v7, "initWithTimeIntervalSinceReferenceDate:");
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dateIntervalFromAppInFocusEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "eventBody");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v7, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:", v9, v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)trackScreenStartingEvent:(id)a3
{
  void *v4;
  id v5;
  NSDate *v6;
  NSDate *phubbingStartTime;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "starting") & 1) == 0
    && -[ATXDailyPhubbingAccumulator screenEventOccured:whileNearPeople:](self, "screenEventOccured:whileNearPeople:", v8, self->_mostRecentProximityPeopleEvent))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v8, "timestamp");
    v6 = (NSDate *)objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:");
    phubbingStartTime = self->_phubbingStartTime;
    self->_phubbingStartTime = v6;

  }
}

- (void)trackScreenEndingEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  NSDate *phubbingStartTime;
  NSDate *phubbingEndTime;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *appSessionsWithinPhubbingEvent;
  NSDate *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "starting")
    && self->_phubbingStartTime
    && -[ATXDailyPhubbingAccumulator screenEventOccured:whileNearPeople:](self, "screenEventOccured:whileNearPeople:", v16, self->_mostRecentProximityPeopleEvent))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v16, "timestamp");
    v6 = (void *)objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:");
    objc_storeStrong((id *)&self->_phubbingEndTime, v6);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", self->_phubbingStartTime, self->_phubbingEndTime);
    if (-[RTProximityEvent relationship](self->_mostRecentProximityPeopleEvent, "relationship") == 1)
    {
      v8 = CFSTR("Family");
    }
    else if (-[RTProximityEvent relationship](self->_mostRecentProximityPeopleEvent, "relationship") == 2)
    {
      v8 = CFSTR("Friend");
    }
    else
    {
      v8 = CFSTR("Unknown");
    }
    v9 = objc_alloc(MEMORY[0x1E0CF9190]);
    phubbingStartTime = self->_phubbingStartTime;
    phubbingEndTime = self->_phubbingEndTime;
    objc_msgSend(v7, "duration");
    v12 = (void *)objc_msgSend(v9, "initWithRelationshipType:startTime:endTime:duration:appSessions:", v8, phubbingStartTime, phubbingEndTime, self->_appSessionsWithinPhubbingEvent);
    -[NSMutableArray addObject:](self->_phubbingSessionEvents, "addObject:", v12);
    v13 = (NSMutableArray *)objc_opt_new();
    appSessionsWithinPhubbingEvent = self->_appSessionsWithinPhubbingEvent;
    self->_appSessionsWithinPhubbingEvent = v13;

    v15 = self->_phubbingStartTime;
    self->_phubbingStartTime = 0;

  }
}

- (void)recordAppLaunchStartEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (-[ATXDailyPhubbingAccumulator appInFocusEventOccured:whileNearPeople:](self, "appInFocusEventOccured:whileNearPeople:")&& self->_phubbingStartTime)
  {
    -[NSMutableArray addObject:](self->_appInFocusStartingEvents, "addObject:", v4);
  }

}

- (void)recordAppLaunchEndEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_appInFocusStartingEvents, "copy");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v4, "bundleID", (_QWORD)v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          if (-[ATXDailyPhubbingAccumulator appInFocusEventOccured:whileNearPeople:](self, "appInFocusEventOccured:whileNearPeople:", v4, self->_mostRecentProximityPeopleEvent))
          {
            v15 = objc_alloc(MEMORY[0x1E0CB3588]);
            objc_msgSend(v11, "absoluteTimestamp");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "absoluteTimestamp");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v16, v17);

            objc_msgSend(v4, "bundleID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "launchReason");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "absoluteTimestamp");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "absoluteTimestamp");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "duration");
            -[ATXDailyPhubbingAccumulator addAppSession:launchReason:startTime:endTime:duration:](self, "addAppSession:launchReason:startTime:endTime:duration:", v19, v20, v21, v22);

          }
          -[NSMutableArray removeObject:](self->_appInFocusStartingEvents, "removeObject:", v11);
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)addAppSession:(id)a3 launchReason:(id)a4 startTime:(id)a5 endTime:(id)a6 duration:(double)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  v18 = objc_alloc(MEMORY[0x1E0CF9178]);
  objc_msgSend(MEMORY[0x1E0CF9178], "usageInsightsAppLaunchReasonFromBMAppInFocus:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (id)objc_msgSend(v18, "initWithBundleID:category:launchReason:startTime:endTime:duration:", v15, v17, v19, v13, v12, a7);
  -[NSMutableArray addObject:](self->_appSessionsWithinPhubbingEvent, "addObject:", v20);

}

- (void)trackMostRecentDiscoveredPeopleEvent:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentProximityPeopleEvent, a3);
}

- (BOOL)screenEventOccured:(id)a3 whileNearPeople:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  BOOL v20;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99D68];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "timestamp");
  v10 = v9;

  v11 = (void *)objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:", v10);
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = v12;
  objc_msgSend(v5, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  if (v13 <= v15)
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(v11, "timeIntervalSince1970");
    v17 = v16;
    objc_msgSend(v5, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSince1970");
    v20 = v17 < v19;

  }
  return v20;
}

- (BOOL)appInFocusEventOccured:(id)a3 whileNearPeople:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  BOOL v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "absoluteTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;
  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  if (v9 <= v11)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v5, "absoluteTimestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v14 = v13;
    objc_msgSend(v6, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    v17 = v14 < v16;

  }
  return v17;
}

- (RTProximityEvent)mostRecentProximityPeopleEvent
{
  return self->_mostRecentProximityPeopleEvent;
}

- (NSArray)phubbingSessions
{
  return self->_phubbingSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phubbingSessions, 0);
  objc_storeStrong((id *)&self->_mostRecentProximityPeopleEvent, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_deviceScreenLockedPublisher, 0);
  objc_storeStrong((id *)&self->_proximityPublisher, 0);
  objc_storeStrong((id *)&self->_lastLoggedScreenEvent, 0);
  objc_storeStrong((id *)&self->_appSessionsWithinPhubbingEvent, 0);
  objc_storeStrong((id *)&self->_appInFocusStartingEvents, 0);
  objc_storeStrong((id *)&self->_phubbingEndTime, 0);
  objc_storeStrong((id *)&self->_phubbingStartTime, 0);
  objc_storeStrong((id *)&self->_phubbingSessionEvents, 0);
}

- (void)successfullyAccumulatedPhubbingEvents
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 136315394;
  v4 = "-[ATXDailyPhubbingAccumulator successfullyAccumulatedPhubbingEvents]";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%s: Error from merged publishers: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __68__ATXDailyPhubbingAccumulator_successfullyAccumulatedPhubbingEvents__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXDailyPhubbingAccumulator: During ordered merge, encountered unknown event: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
