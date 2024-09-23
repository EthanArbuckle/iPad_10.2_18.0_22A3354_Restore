@implementation ARPCorrelationTask

- (ARPCorrelationTask)initWithCorrelationsFile:(id)a3 knowledgeStore:(id)a4
{
  id v6;
  id v7;
  ARPCorrelationTask *v8;
  uint64_t v9;
  NSString *file;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ARPCorrelationTask;
  v8 = -[ARPCorrelationTask init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    file = v8->_file;
    v8->_file = (NSString *)v9;

    objc_storeStrong((id *)&v8->_knowledgeStore, a4);
  }

  return v8;
}

- (id)queryForMicroLocationsFromStartTime:(id)a3 endTime:(id)a4 maxEvents:(unint64_t)a5 overlappingNowPlayingEvents:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _BYTE *v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  uint8_t v42[4];
  uint64_t v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v28 = a4;
  v10 = a6;
  ARPLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = objc_msgSend(v10, "count");
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a5;
    _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "queryForMicroLocationsFromStartTime: nowPlayingEvents.count: %lu, maxEvents: %lu", buf, 0x16u);
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v28;
    _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "queryForMicroLocationsFromStartTime: startTime: %@, endTime: %@", buf, 0x16u);
  }

  if (objc_msgSend(v10, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(getBMDKEventStreamClass()), "initWithDKStreamIdentifier:contentProtection:", CFSTR("/inferred/microLocationVisit"), *MEMORY[0x1E0CB2AC0]);
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v28, "timeIntervalSinceReferenceDate");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", v14, v16, 0, 0, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v17 == 0;
      _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "queryForMicroLocationsFromStartTime: publisherNil?:%d", buf, 8u);
    }

    +[ARPRoutingSession microLocationCorrelationGracePeriod](ARPRoutingSession, "microLocationCorrelationGracePeriod");
    v19 = v18;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "queryForMicroLocationsFromStartTime: microLocationCorrelationGracePeriod:%f", buf, 0xCu);
    }

    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__0;
    v46 = __Block_byref_object_dispose__0;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v47 = (id)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __104__ARPCorrelationTask_queryForMicroLocationsFromStartTime_endTime_maxEvents_overlappingNowPlayingEvents___block_invoke_2;
    v29[3] = &unk_1EA7D45D8;
    v35 = v19;
    v32 = buf;
    v33 = v41;
    v30 = v10;
    v21 = v20;
    v31 = v21;
    v34 = &v37;
    v36 = a5;
    v22 = (id)objc_msgSend(v17, "sinkWithCompletion:shouldContinue:", &__block_literal_global_73, v29);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v23 = v38[3];
      *(_DWORD *)v42 = 134217984;
      v43 = v23;
      _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "queryForMicroLocationsFromStartTime: found %lu microLocationEvents", v42, 0xCu);
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v24 = objc_msgSend(v21, "count");
      *(_DWORD *)v42 = 134217984;
      v43 = v24;
      _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "queryForMicroLocationsFromStartTime: results.count: %lu", v42, 0xCu);
    }

    v25 = v31;
    v26 = v21;

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v41, 8);
  }
  else
  {
    v26 = (id)MEMORY[0x1E0C9AA60];
  }

  return v26;
}

BOOL __104__ARPCorrelationTask_queryForMicroLocationsFromStartTime_endTime_maxEvents_overlappingNowPlayingEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  _BOOL8 v21;
  uint64_t v22;
  unint64_t v23;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dkEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;
    v10 = *(double *)(a1 + 72);

    if (v9 <= v10)
      break;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(_QWORD *)(v11 + 24) + 1;
    *(_QWORD *)(v11 + 24) = v12;
    if (v12 == objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v21 = 0;
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  objc_msgSend(v5, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", v17);
  v19 = v18;
  v20 = *(double *)(a1 + 72);

  if (v19 <= v20)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v23 = *(_QWORD *)(v22 + 24) + 1;
    *(_QWORD *)(v22 + 24) = v23;
    v21 = v23 < *(_QWORD *)(a1 + 80);
  }
  else
  {
    v21 = 1;
  }
LABEL_9:

  return v21;
}

- (void)execute
{
  NSObject *v3;
  os_activity_scope_state_s v4;

  v3 = _os_activity_create(&dword_1DD793000, "Duet: ARPCorrelationTask execute", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  os_activity_scope_leave(&v4);

  -[ARPCorrelationTask execute:microLocationEvents:](self, "execute:microLocationEvents:", 0, 0);
}

- (void)execute:(id)a3 microLocationEvents:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  ARPCorrelationTask *v46;
  id v47;
  id v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  double v54;
  void *v55;
  void *v56;
  _QWORD v57[5];

  v57[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0x1EA7D3000uLL;
  if (v6)
  {
    v10 = v6;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D15AD0];
    objc_msgSend(MEMORY[0x1E0D15AA0], "playing");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateForObjectsWithMetadataKey:andIntegerValue:", v15, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[ARPCorrelationTask longFormVideoAppBundleIDs](self, "longFormVideoAppBundleIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStringValueInValues:", v16);
    v46 = self;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[ARPRoutingSession minimumRoutingEventDuration](ARPRoutingSession, "minimumRoutingEventDuration");
    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithMinimumDuration:");
    v11 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3528];
    v57[0] = v17;
    v57[1] = v13;
    v57[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0D15A08];
    objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v8;
    v55 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v20, v23, 0, 512, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARPCorrelationTask.m");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByAppendingFormat:", CFSTR(":%d"), 283);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setClientName:", v27);

    objc_msgSend(v25, "setTracker:", &__block_literal_global_85);
    -[ARPCorrelationTask knowledgeStore](v46, "knowledgeStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    objc_msgSend(v28, "executeQuery:error:", v25, &v48);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v29 = v48;

    if (v29)
    {
      ARPLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[ARPCorrelationTask execute:microLocationEvents:].cold.3();

      v8 = v45;
      v6 = 0;
      goto LABEL_28;
    }

    v8 = v45;
    v6 = 0;
    v9 = 0x1EA7D3000;
    self = v46;
  }
  ARPLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    v50 = v12;
    _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "-[ARPCorrelationTask execute:microLocationEvents:] nowPlayingEvents.count:%lu", buf, 0xCu);
  }

  if (v7)
  {
    v13 = v7;
  }
  else if (objc_msgSend(v10, "count"))
  {
    v31 = v8;
    objc_msgSend(*(id *)(v9 + 3176), "microLocationCorrelationGracePeriod");
    v33 = v32;
    objc_msgSend(v10, "lastObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "startDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dateByAddingTimeInterval:", -v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "startDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dateByAddingTimeInterval:", v33);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "Calling queryForMicroLocationsFromStartTime v1.0a:", buf, 2u);
    }

    -[ARPCorrelationTask queryForMicroLocationsFromStartTime:endTime:maxEvents:overlappingNowPlayingEvents:](self, "queryForMicroLocationsFromStartTime:endTime:maxEvents:overlappingNowPlayingEvents:", v39, v36, 2 * objc_msgSend(v10, "count"), v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v31;
    v9 = 0x1EA7D3000;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(*(id *)(v9 + 3176), "routingSessionTimeout");
  v41 = v40;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v42 = objc_msgSend(v10, "count");
    v43 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 134218496;
    v50 = v42;
    v51 = 2048;
    v52 = v43;
    v53 = 2048;
    v54 = v41;
    _os_log_impl(&dword_1DD793000, v11, OS_LOG_TYPE_INFO, "nowPlayingEventsArg microLocationEvents: nowPlayingEvents.count: %lu microLocationEvents.count: %lu, routingSessionTimeout: %f", buf, 0x20u);
  }

  if (objc_msgSend(v10, "count") && objc_msgSend(v13, "count"))
  {
    objc_msgSend(*(id *)(v9 + 3176), "routingSessionsFromNowPlayingEvents:microLocationEvents:routingSessionTimeout:", v10, v13, v41);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[ARPCorrelationTask file](self, "file");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ARPCorrelationTask execute:microLocationEvents:].cold.2(v16, (uint64_t)v17, v11);

  v44 = *(void **)(v9 + 3176);
  v47 = 0;
  objc_msgSend(v44, "writeSessions:routingSessionTimeout:file:error:", v16, v17, &v47, v41);
  v29 = v47;
  if (v29)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ARPCorrelationTask execute:microLocationEvents:].cold.1();
LABEL_28:

  }
}

uint64_t __50__ARPCorrelationTask_execute_microLocationEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)longFormVideoAppBundleIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15A08], "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v4, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ARPCorrelationTask.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(":%d"), 340);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientName:", v7);

  objc_msgSend(v5, "setTracker:", &__block_literal_global_86);
  objc_msgSend(v5, "setGroupByProperties:", &unk_1EA7D7910);
  objc_msgSend(v5, "setResultType:", 3);
  -[ARPCorrelationTask knowledgeStore](self, "knowledgeStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v8, "executeQuery:error:", v5, &v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v26;

  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (v10)
  {
    ARPLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ARPCorrelationTask longFormVideoAppBundleIDs].cold.1();
  }
  else
  {
    v21 = v4;
    -[objc_class sharedAVSystemController](getAVSystemControllerClass(), "sharedAVSystemController");
    v12 = objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v9, "valueForKey:", CFSTR("valueString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (-[NSObject hasRouteSharingPolicyLongFormVideo:](v12, "hasRouteSharingPolicyLongFormVideo:", v18))objc_msgSend(v11, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v15);
    }

    v4 = v21;
  }

  objc_msgSend(v11, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __47__ARPCorrelationTask_longFormVideoAppBundleIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (NSString)file
{
  return self->_file;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

- (void)execute:microLocationEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD793000, v0, v1, "Error archiving sessions to file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)execute:(NSObject *)a3 microLocationEvents:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1DD793000, a3, OS_LOG_TYPE_DEBUG, "Archiving %@ sessions to %@ for correlation task.", v6, 0x16u);

}

- (void)execute:microLocationEvents:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD793000, v0, v1, "Error fetching now playing for correlation task: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)longFormVideoAppBundleIDs
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD793000, v0, v1, "Error fetching long form video bundle IDs from knowledge store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
