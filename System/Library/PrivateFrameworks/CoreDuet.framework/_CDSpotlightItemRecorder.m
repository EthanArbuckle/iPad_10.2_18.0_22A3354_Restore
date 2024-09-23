@implementation _CDSpotlightItemRecorder

- (void)deleteAllUserActivities:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_activity_scope_state_s v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_18DDBE000, "Duet: deleteAllUserActivities:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  os_activity_scope_leave(&v7);

  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v7.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v7.opaque + 4) = (uint64_t)v4;
    _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_DEFAULT, "Deleting user activies with bundleID: %@", (uint8_t *)&v7, 0xCu);
  }

  -[_CDSpotlightItemRecorder _deleteUserActivitiesWithPersistentIdentifiers:bundleID:]((uint64_t)self, 0, v4);
}

- (void)deleteKnowledgeEventsMatchingPredicate:(void *)a3 withCompletion:
{
  id v5;
  void (**v6)(id, BOOL, id);
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_generate(v7);

    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "_CDSpotlightReceieverDeleteKnowledgeEvents", " enableTelemetry=YES ", buf, 2u);
    }

    v11 = *(void **)(a1 + 72);
    v19 = 0;
    v12 = objc_msgSend(v11, "deleteAllEventsMatchingPredicate:error:", v5, &v19);
    v13 = v19;
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:].cold.1(v5, (uint64_t)v13, v15);
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "cd_sanitizeForLogging");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218243;
      v21 = v12;
      v22 = 2113;
      v23 = v16;
      _os_log_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEFAULT, "Successfully deleted %lu knowledge events with predicate %{private}@.", buf, 0x16u);

    }
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18DDBE000, v18, OS_SIGNPOST_INTERVAL_END, v8, "_CDSpotlightReceieverDeleteKnowledgeEvents", (const char *)&unk_18DF6D5CF, buf, 2u);
    }

    if (v6)
      v6[2](v6, v13 == 0, v13);

  }
}

- (void)donateRelevantShortcuts:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _QWORD v42[2];
  _BYTE state[22];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18DDBE000, "Duet: donateRelevantShortcuts:bundleID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v8, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)state = 138412546;
    *(_QWORD *)&state[4] = v10;
    *(_WORD *)&state[12] = 2112;
    *(_QWORD *)&state[14] = v7;
    _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "Donate %@ relevant shortcuts for bundleID: %@", state, 0x16u);

  }
  if (v7)
  {
    +[_DKSystemEventStreams appRelevantShortcutsStream](_DKSystemEventStreams, "appRelevantShortcutsStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForEventsWithStreamName:](_DKQuery, "predicateForEventsWithStreamName:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    +[_DKQuery predicateForEventsWithStringValue:](_DKQuery, "predicateForEventsWithStringValue:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3528];
    v34 = (void *)v14;
    v35 = (void *)v13;
    v42[0] = v13;
    v42[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (self)
      -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:]((uint64_t)self, v17, 0);
    v32 = v17;
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v36 = v6;
    v19 = v6;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v38;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v38 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v23);
          v25 = (void *)MEMORY[0x193FEE914](v20);
          +[_DKEvent eventWithRelevantShortcut:bundleID:](_DKEvent, "eventWithRelevantShortcut:bundleID:", v24, v7, v32);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(v18, "addObject:", v26);

          objc_autoreleasePoolPop(v25);
          ++v23;
        }
        while (v21 != v23);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        v21 = v20;
      }
      while (v20);
    }

    v27 = objc_msgSend(v19, "count");
    if (v27 > objc_msgSend(v18, "count"))
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "count") - objc_msgSend(v18, "count"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)state = 138412546;
        *(_QWORD *)&state[4] = v31;
        *(_WORD *)&state[12] = 2112;
        *(_QWORD *)&state[14] = v7;
        _os_log_error_impl(&dword_18DDBE000, v28, OS_LOG_TYPE_ERROR, "Unable to convert %@ relevant shortcuts for bundleID %@ to knowledge events", state, 0x16u);

      }
    }
    if (objc_msgSend(v18, "count", v32))
    {
      _CDCollectDonationMetricsForEventsInDomain(v18, CFSTR("relevantShortcuts"));
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[_CDSpotlightItemRecorder donateRelevantShortcuts:bundleID:].cold.1(v18, (uint64_t)v7, v29);

      v30 = -[_CDSpotlightItemRecorder getUidOfDonator](self);
      -[_CDSpotlightItemRecorder saveRateLimitedEvents:donatorUid:responseQueue:withCompletion:]((uint64_t)self, v18, v30, 0, &__block_literal_global_508);
    }

    v6 = v36;
  }

}

- (void)_deleteUserActivitiesWithPersistentIdentifiers:(void *)a3 bundleID:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  id v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _CDUserActivityCache *v30;
  void *v31;
  void *v32;
  uint8_t buf[8];
  _QWORD v34[5];
  id v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (!v6)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_CDSpotlightItemRecorder _deleteUserActivitiesWithPersistentIdentifiers:bundleID:].cold.1();
      goto LABEL_28;
    }
    +[_DKSystemEventStreams appActivityStream](_DKSystemEventStreams, "appActivityStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForEventsWithStreamName:](_DKQuery, "predicateForEventsWithStreamName:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    +[_DKSystemEventStreams appLocationActivityStream](_DKSystemEventStreams, "appLocationActivityStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForEventsWithStreamName:](_DKQuery, "predicateForEventsWithStreamName:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3528];
    v37[0] = v10;
    v37[1] = v13;
    v32 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "orPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *(_QWORD *)(a1 + 112);
    v18 = v17 == 0;
    if (v17)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __84___CDSpotlightItemRecorder__deleteUserActivitiesWithPersistentIdentifiers_bundleID___block_invoke;
      v34[3] = &unk_1E26E6EB8;
      v34[4] = a1;
      v35 = v7;
      objc_msgSend(v5, "_pas_filteredArrayWithTest:", v34);
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = v5;
    }
    if (objc_msgSend(v19, "count"))
      v20 = arc4random_uniform(0x64u) == 0;
    else
      v20 = 0;
    v21 = *(void **)(a1 + 112);
    if (v21)
    {
      v22 = objc_msgSend(v21, "count");
      if (v19)
        v23 = v20;
      else
        v23 = 1;
      if (!v22)
        v23 = 0;
      if (v17)
        v18 = v23;
      else
        v18 = 1;
    }
    if (v19)
    {
      if (!objc_msgSend(v19, "count"))
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DDBE000, v26, OS_LOG_TYPE_INFO, "Skipping deletion, all identifiers filterd by cache", buf, 2u);
        }
        goto LABEL_27;
      }
      +[_DKSource spotlightSourceID](_DKSource, "spotlightSourceID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKQuery predicateForEventsWithSourceID:bundleID:itemIDs:](_DKQuery, "predicateForEventsWithSourceID:bundleID:itemIDs:", v24, v7, v19);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_DKSource spotlightSourceID](_DKSource, "spotlightSourceID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKQuery predicateForEventsWithSourceID:bundleID:](_DKQuery, "predicateForEventsWithSourceID:bundleID:", v24, v7);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v26 = v25;

    v27 = (void *)MEMORY[0x1E0CB3528];
    v36[0] = v16;
    v36[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "andPredicateWithSubpredicates:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:](a1, v29, 0);
    if (v18)
    {
      v30 = -[_CDUserActivityCache initWithKnowledgeStore:]([_CDUserActivityCache alloc], "initWithKnowledgeStore:", *(_QWORD *)(a1 + 72));
      -[_CDUserActivityCache populateCache](v30, "populateCache");
      v31 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v30;

    }
LABEL_27:

LABEL_28:
  }

}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *batchExecutionSourceQueue;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  _CDSpotlightCoalescedDeletionManager *coalescedDeletionManager;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[6];
  _QWORD v39[4];
  id v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[5];

  v45[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count");
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.icloud.drive.fileprovider")))
  {

    v8 = (id)MEMORY[0x1E0C9AA60];
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.shortcuts")))
  {
    v12 = objc_alloc(MEMORY[0x1E0D815A0]);
    v45[0] = CFSTR("com.apple.duetexpertd.spotlightZKW");
    v45[1] = CFSTR("spotlightZKW");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithDomainsFromArray:", v13);

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke;
    v39[3] = &unk_1E26E6EE0;
    v40 = v14;
    v15 = v14;
    objc_msgSend(v8, "_pas_filteredArrayWithTest:", v39);
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v16;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilecal"))
         && self->_calendarAddedItemsFilter)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v42 = __Block_byref_object_copy__27;
    v43 = __Block_byref_object_dispose__27;
    v44 = 0;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke_2;
    v38[3] = &unk_1E26E6F08;
    v38[4] = self;
    v38[5] = buf;
    objc_msgSend(v8, "_pas_filteredArrayWithTest:", v38);
    v17 = objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
    v8 = (id)v17;
  }
  if (v11 != objc_msgSend(v8, "count"))
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 - objc_msgSend(v8, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      v42 = (uint64_t (*)(uint64_t, uint64_t))v9;
      _os_log_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring %@ of %@ domain identifiers in call to delete searchable items for bundle %@", buf, 0x20u);

    }
  }
  if (objc_msgSend(v8, "count"))
  {
    v21 = _os_activity_create(&dword_18DDBE000, "Duet: deleteSearchableItemsWithDomainIdentifiers:bundleID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    os_activity_scope_enter(v21, (os_activity_scope_state_t)buf);
    os_activity_scope_leave((os_activity_scope_state_t)buf);

    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v42 = (uint64_t (*)(uint64_t, uint64_t))v8;
      _os_log_impl(&dword_18DDBE000, v22, OS_LOG_TYPE_DEFAULT, "Deleting %lu searchable items for bundleID: %@ with domain identifiers: %@", buf, 0x20u);
    }

    if (self && self->_recorder)
    {
      objc_initWeak((id *)buf, self);
      batchExecutionSourceQueue = self->_batchExecutionSourceQueue;
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke_536;
      v34 = &unk_1E26E6F30;
      objc_copyWeak(&v37, (id *)buf);
      v35 = v9;
      v36 = v8;
      dispatch_sync(batchExecutionSourceQueue, &v31);

      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)buf);
    }
    v25 = objc_msgSend(&unk_1E272BFF8, "containsObject:", v9, v31, v32, v33, v34);
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
    if (v25)
    {
      if (v27)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_18DDBE000, v26, OS_LOG_TYPE_INFO, "Deleting searchable items for bundleId: %@ using coalesced deletion path", buf, 0xCu);
      }

      coalescedDeletionManager = self->_coalescedDeletionManager;
      +[_CDSpotlightDeletionOperation deletionForEventsWithDomainIdentifiers:bundleId:completion:](_CDSpotlightDeletionOperation, "deletionForEventsWithDomainIdentifiers:bundleId:completion:", v8, v9, v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDSpotlightCoalescedDeletionManager processDeletionForOperation:](coalescedDeletionManager, "processDeletionForOperation:", v29);

    }
    else
    {
      if (v27)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_18DDBE000, v26, OS_LOG_TYPE_INFO, "Deleting searchable items for bundleId: %@ using direct deletion path", buf, 0xCu);
      }

      +[_DKQuery predicateForSpotlightEventsWithDomainIdentifiers:bundleID:]((uint64_t)_DKQuery, v8, v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:]((uint64_t)self, v30, v10);

    }
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
  }

}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4
{
  -[_CDSpotlightItemRecorder deleteSearchableItemsWithDomainIdentifiers:bundleID:withCompletion:](self, "deleteSearchableItemsWithDomainIdentifiers:bundleID:withCompletion:", a3, a4, 0);
}

- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4
{
  -[_CDSpotlightItemRecorder deleteAllInteractionsWithBundleID:protectionClass:withCompletion:](self, "deleteAllInteractionsWithBundleID:protectionClass:withCompletion:", a3, a4, 0);
}

+ (void)recordAggdReceiverAction:(void *)a3 bundleID:(uint64_t)a4 count:
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_self();
  switch(a2)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.userAction"), CFSTR("com.apple.coreduet.spotlightreceiver"));
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.deleting.%@"), CFSTR("com.apple.coreduet.spotlightreceiver"), v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", a4, v7);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.deleting"), CFSTR("com.apple.coreduet.spotlightreceiver"));
      goto LABEL_7;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.recording.%@"), CFSTR("com.apple.coreduet.spotlightreceiver"), v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", a4, v6);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.recording"), CFSTR("com.apple.coreduet.spotlightreceiver"));
LABEL_7:
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", a4, v8);

      break;
  }

}

- (void)saveRateLimitedEvents:(unsigned int)a3 donatorUid:(void *)a4 responseQueue:(void *)a5 withCompletion:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  _UNKNOWN **v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  unint64_t v82;
  uint64_t v83;
  int v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  void *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  id v191;
  void *v193;
  id v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  id obj;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  uint64_t v418;
  int v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  unint64_t v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  void *v475;
  void *v476;
  void *v477;
  void *v478;
  void *v479;
  void *v480;
  void *v481;
  uint64_t v482;
  uint64_t v483;
  void *v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  id v498;
  void *v499;
  id v500;
  id v501;
  void *v502;
  id v503;
  id v504;
  void *v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  void *v509;
  void *v510;
  void *v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  _QWORD v516[4];
  id v517;
  id v518;
  uint8_t v519[4];
  uint64_t v520;
  uint8_t v521[128];
  uint8_t buf[4];
  uint64_t v523;
  __int16 v524;
  uint64_t v525;
  uint8_t v526[4];
  unint64_t v527;
  uint64_t v528;

  v528 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a4;
  v10 = a5;
  v418 = a1;
  if (a1)
  {
    if (objc_msgSend(v8, "count"))
    {
      v11 = *(void **)(a1 + 80);
      v193 = v10;
      if (v11)
      {
        objc_msgSend(v11, "filterObjectsByEnforcingRateLimit:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = (void *)objc_msgSend(v8, "copy");
      }
      v195 = v12;
      v13 = objc_msgSend(v12, "count");
      if (v13 != objc_msgSend(v8, "count"))
      {
        v14 = MEMORY[0x1E0C81028];
        v15 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v523 = objc_msgSend(v195, "count");
          v524 = 2048;
          v525 = objc_msgSend(v8, "count");
          _os_log_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "SpotlightRecorder rate limiting kicked in - saving %lu of %lu objects.", buf, 0x16u);
        }

      }
      v194 = v9;
      objc_msgSend(*(id *)(a1 + 88), "enforcePrivacy:", v195);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      if (v17 != objc_msgSend(v8, "count"))
      {
        v18 = MEMORY[0x1E0C81028];
        v19 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v20 = objc_msgSend(v16, "count");
          v21 = objc_msgSend(v195, "count");
          *(_DWORD *)buf = 134218240;
          v523 = v20;
          v524 = 2048;
          v525 = v21;
          _os_log_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "SpotlightRecorder privacy policy kicked in - saving %lu of %lu objects.", buf, 0x16u);
        }

      }
      v191 = v8;
      v22 = *(void **)(a1 + 72);
      v516[0] = MEMORY[0x1E0C809B0];
      v516[1] = 3221225472;
      v516[2] = __90___CDSpotlightItemRecorder_saveRateLimitedEvents_donatorUid_responseQueue_withCompletion___block_invoke_2;
      v516[3] = &unk_1E26E6DB0;
      v518 = v193;
      v23 = v16;
      v517 = v23;
      objc_msgSend(v22, "saveObjects:tracker:responseQueue:withCompletion:", v23, &__block_literal_global_77, v194, v516);
      v190 = (void *)objc_opt_new();
      v24 = (void *)objc_opt_new();
      v512 = 0u;
      v513 = 0u;
      v514 = 0u;
      v515 = 0u;
      obj = v23;
      v483 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v512, v521, 16);
      if (v483)
      {
        v25 = MEMORY[0x1E0C81028];
        v26 = &off_1E26E0000;
        v482 = *(_QWORD *)v513;
        v417 = v24;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v513 != v482)
              objc_enumerationMutation(obj);
            v28 = *(void **)(*((_QWORD *)&v512 + 1) + 8 * v27);
            v29 = v25;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              -[_CDSpotlightItemRecorder saveRateLimitedEvents:donatorUid:responseQueue:withCompletion:].cold.2(v519, (uint64_t)v28, &v520);

            objc_msgSend(v28, "stream");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "name");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26[490], "appIntentsStream");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "name");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v31, "isEqual:", v33);

            if (v34)
            {
              objc_msgSend(v28, "metadata");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_alloc(MEMORY[0x1E0D01E90]);
              objc_msgSend(v28, "startDate");
              v502 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "source");
              v470 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v470, "bundleID");
              v499 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "source");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "sourceID");
              v496 = (void *)objc_claimAutoreleasedReturnValue();
              +[_DKIntentMetadataKey intentClass](_DKIntentMetadataKey, "intentClass");
              v464 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKeyedSubscript:");
              v38 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v458 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v28;
              v443 = v36;
              if ((void *)v38 == v458)
              {
                v479 = 0;
              }
              else
              {
                +[_DKIntentMetadataKey intentClass](_DKIntentMetadataKey, "intentClass");
                v403 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKeyedSubscript:");
                v404 = (void *)objc_claimAutoreleasedReturnValue();
                v479 = v404;
              }
              +[_DKIntentMetadataKey intentVerb](_DKIntentMetadataKey, "intentVerb");
              v56 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKeyedSubscript:", v56);
              v57 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v452 = (void *)v57;
              v449 = (void *)objc_claimAutoreleasedReturnValue();
              if ((void *)v57 == v449)
              {
                v476 = 0;
              }
              else
              {
                +[_DKIntentMetadataKey intentVerb](_DKIntentMetadataKey, "intentVerb");
                v409 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKeyedSubscript:");
                v405 = (void *)objc_claimAutoreleasedReturnValue();
                v476 = v405;
              }
              +[_DKIntentMetadataKey intentType](_DKIntentMetadataKey, "intentType");
              v446 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKeyedSubscript:");
              v58 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v493 = (void *)v58;
              v490 = (void *)objc_claimAutoreleasedReturnValue();
              if ((void *)v58 == v490)
              {
                v59 = 0;
              }
              else
              {
                +[_DKIntentMetadataKey intentType](_DKIntentMetadataKey, "intentType");
                v416 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKeyedSubscript:");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v412 = v59;
              }
              v60 = objc_msgSend(v59, "integerValue");
              v61 = v60;
              if (v60 >= 4)
              {
                +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
                v63 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v526 = 134217984;
                  v527 = v61;
                  _os_log_error_impl(&dword_18DDBE000, v63, OS_LOG_TYPE_ERROR, "unable to convert _INIntentType enum value: %ld", v526, 0xCu);
                }
                v62 = v27;

                v434 = 0;
              }
              else
              {
                v434 = v60;
                v62 = v27;
              }
              +[_DKIntentMetadataKey intentHandlingStatus](_DKIntentMetadataKey, "intentHandlingStatus");
              v64 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKeyedSubscript:", v64);
              v65 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v437 = (void *)v65;
              v487 = (void *)objc_claimAutoreleasedReturnValue();
              v440 = (void *)v64;
              if ((void *)v65 == v487)
              {
                v66 = 0;
              }
              else
              {
                +[_DKIntentMetadataKey intentHandlingStatus](_DKIntentMetadataKey, "intentHandlingStatus");
                v415 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKeyedSubscript:");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v410 = v66;
              }
              v67 = v62;
              v461 = (void *)v38;
              v68 = objc_msgSend(v66, "integerValue");
              v69 = v68;
              if (v68 >= 7)
              {
                +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v526 = 134217984;
                  v527 = v69;
                  _os_log_error_impl(&dword_18DDBE000, v70, OS_LOG_TYPE_ERROR, "unable to convert INIntentHandlingStatus enum value: %ld", v526, 0xCu);
                }

                v419 = 0;
              }
              else
              {
                v419 = v68 + 1;
              }
              +[_DKIntentMetadataKey serializedInteraction](_DKIntentMetadataKey, "serializedInteraction");
              v71 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKeyedSubscript:", v71);
              v72 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v428 = (void *)v72;
              v467 = v37;
              v431 = (void *)v71;
              if ((void *)v72 == v73)
              {
                v473 = 0;
              }
              else
              {
                +[_DKIntentMetadataKey serializedInteraction](_DKIntentMetadataKey, "serializedInteraction");
                v414 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKeyedSubscript:");
                v408 = (void *)objc_claimAutoreleasedReturnValue();
                v473 = v408;
              }
              v511 = v39;
              objc_msgSend(v39, "source");
              v425 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v425, "itemID");
              v484 = (void *)objc_claimAutoreleasedReturnValue();
              +[_DKIntentMetadataKey donatedBySiri](_DKIntentMetadataKey, "donatedBySiri");
              v422 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKeyedSubscript:");
              v74 = v35;
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v506 = v67;
              v455 = (void *)v56;
              if (v75 == v76)
              {
                v77 = 0;
              }
              else
              {
                +[_DKIntentMetadataKey donatedBySiri](_DKIntentMetadataKey, "donatedBySiri");
                v413 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKeyedSubscript:");
                v77 = objc_claimAutoreleasedReturnValue();
                v407 = (void *)v77;
              }
              +[_DKIntentMetadataKey direction](_DKIntentMetadataKey, "direction");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKeyedSubscript:", v78);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v505 = v74;
              if (v79 == v80)
              {
                v81 = 0;
              }
              else
              {
                +[_DKIntentMetadataKey direction](_DKIntentMetadataKey, "direction");
                v411 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "objectForKeyedSubscript:");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v406 = v81;
              }
              v82 = objc_msgSend(v81, "integerValue");
              v83 = v82;
              if (v82 >= 4)
              {
                +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
                v85 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                  -[_CDSpotlightItemRecorder saveRateLimitedEvents:donatorUid:responseQueue:withCompletion:].cold.1(buf, v83, &v523, v85);

                v84 = 0;
              }
              else
              {
                v84 = dword_18DF4CBB0[v82];
              }
              objc_msgSend(v511, "source");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "groupID");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v189) = v84;
              LODWORD(v188) = v419;
              v88 = (void *)objc_msgSend(v443, "initWithAbsoluteTimestamp:bundleID:sourceID:intentClass:intentVerb:intentType:handlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:", v502, v499, v496, v479, v476, v434, v188, v473, v484, v77, v189, v87);

              if (v79 != v80)
              {

              }
              v24 = v417;
              v25 = MEMORY[0x1E0C81028];
              if (v75 != v76)
              {

              }
              v27 = v506;
              if (v428 != v73)
              {

              }
              v26 = &off_1E26E0000;
              if (v437 != v487)
              {

              }
              if (v493 != v490)
              {

              }
              if (v452 != v449)
              {

              }
              if (v461 != v458)
              {

              }
              objc_msgSend(*(id *)(v418 + 144), "sendEvent:", v88);
            }
            else
            {
              objc_msgSend(v28, "stream");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "name");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26[490], "appActivityStream");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "name");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v41, "isEqual:", v43);

              if (v44)
              {
                v509 = v28;
                objc_msgSend(v28, "metadata");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("com.apple.calendarUIKit.userActivity.date"));
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if (v46 == v47)
                {
                  v503 = 0;
                }
                else
                {
                  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("com.apple.calendarUIKit.userActivity.date"));
                  v503 = (id)objc_claimAutoreleasedReturnValue();

                }
                objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("com.apple.calendarUIKit.userActivity.endDate"));
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                if (v89 == v90)
                {
                  v500 = 0;
                }
                else
                {
                  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("com.apple.calendarUIKit.userActivity.endDate"));
                  v500 = (id)objc_claimAutoreleasedReturnValue();

                }
                v91 = objc_alloc(MEMORY[0x1E0D01E80]);
                objc_msgSend(v28, "value");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "stringValue");
                v497 = (void *)objc_claimAutoreleasedReturnValue();
                +[_DKApplicationActivityMetadataKey activityType](_DKApplicationActivityMetadataKey, "activityType");
                v93 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:", v93);
                v94 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v370 = (void *)v94;
                v368 = (void *)objc_claimAutoreleasedReturnValue();
                v354 = v91;
                if ((void *)v94 == v368)
                {
                  v420 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey activityType](_DKApplicationActivityMetadataKey, "activityType");
                  v326 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v322 = (void *)objc_claimAutoreleasedReturnValue();
                  v420 = v322;
                }
                +[_DKApplicationActivityMetadataKey beginningOfActivity](_DKApplicationActivityMetadataKey, "beginningOfActivity");
                v95 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:", v95);
                v96 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v364 = (void *)v96;
                v494 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v96 == v494)
                {
                  v400 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey beginningOfActivity](_DKApplicationActivityMetadataKey, "beginningOfActivity");
                  v325 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v320 = (void *)objc_claimAutoreleasedReturnValue();
                  v400 = v320;
                }
                +[_DKApplicationActivityMetadataKey contentDescription](_DKApplicationActivityMetadataKey, "contentDescription");
                v362 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:");
                v97 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v491 = (void *)v97;
                v488 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v97 == v488)
                {
                  v398 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey contentDescription](_DKApplicationActivityMetadataKey, "contentDescription");
                  v324 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v318 = (void *)objc_claimAutoreleasedReturnValue();
                  v398 = v318;
                }
                +[_DKApplicationActivityMetadataKey expirationDate](_DKApplicationActivityMetadataKey, "expirationDate");
                v360 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:");
                v98 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v485 = (void *)v98;
                v480 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v98 == v480)
                {
                  v396 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey expirationDate](_DKApplicationActivityMetadataKey, "expirationDate");
                  v323 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v316 = (void *)objc_claimAutoreleasedReturnValue();
                  v396 = v316;
                }
                +[_DKApplicationActivityMetadataKey isEligibleForPrediction](_DKApplicationActivityMetadataKey, "isEligibleForPrediction");
                v358 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:");
                v99 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v477 = (void *)v99;
                v474 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v99 == v474)
                {
                  v394 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey isEligibleForPrediction](_DKApplicationActivityMetadataKey, "isEligibleForPrediction");
                  v321 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v314 = (void *)objc_claimAutoreleasedReturnValue();
                  v394 = v314;
                }
                +[_DKApplicationActivityMetadataKey isPubliclyIndexable](_DKApplicationActivityMetadataKey, "isPubliclyIndexable");
                v356 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:");
                v100 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v471 = (void *)v100;
                v468 = (void *)objc_claimAutoreleasedReturnValue();
                v374 = v92;
                if ((void *)v100 == v468)
                {
                  v392 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey isPubliclyIndexable](_DKApplicationActivityMetadataKey, "isPubliclyIndexable");
                  v319 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v312 = (void *)objc_claimAutoreleasedReturnValue();
                  v392 = v312;
                }
                +[_DKApplicationActivityMetadataKey itemIdentifier](_DKApplicationActivityMetadataKey, "itemIdentifier");
                v101 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:", v101);
                v102 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v465 = (void *)v102;
                v462 = (void *)objc_claimAutoreleasedReturnValue();
                v507 = v27;
                v103 = (void *)v93;
                if ((void *)v102 == v462)
                {
                  v390 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey itemIdentifier](_DKApplicationActivityMetadataKey, "itemIdentifier");
                  v317 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v310 = (void *)objc_claimAutoreleasedReturnValue();
                  v390 = v310;
                }
                +[_DKApplicationActivityMetadataKey itemRelatedContentURL](_DKApplicationActivityMetadataKey, "itemRelatedContentURL");
                v104 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:", v104);
                v105 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v459 = (void *)v105;
                v456 = (void *)objc_claimAutoreleasedReturnValue();
                v372 = v103;
                v106 = (void *)v95;
                if ((void *)v105 == v456)
                {
                  v388 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey itemRelatedContentURL](_DKApplicationActivityMetadataKey, "itemRelatedContentURL");
                  v315 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v308 = (void *)objc_claimAutoreleasedReturnValue();
                  v388 = v308;
                }
                +[_DKApplicationActivityMetadataKey itemRelatedUniqueIdentifier](_DKApplicationActivityMetadataKey, "itemRelatedUniqueIdentifier");
                v107 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:", v107);
                v108 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v453 = (void *)v108;
                v450 = (void *)objc_claimAutoreleasedReturnValue();
                v366 = v106;
                if ((void *)v108 == v450)
                {
                  v386 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey itemRelatedUniqueIdentifier](_DKApplicationActivityMetadataKey, "itemRelatedUniqueIdentifier");
                  v313 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v306 = (void *)objc_claimAutoreleasedReturnValue();
                  v386 = v306;
                }
                +[_DKApplicationActivityMetadataKey shortcutAvailability](_DKApplicationActivityMetadataKey, "shortcutAvailability");
                v346 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:");
                v109 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v447 = (void *)v109;
                v444 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v109 == v444)
                {
                  v384 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey shortcutAvailability](_DKApplicationActivityMetadataKey, "shortcutAvailability");
                  v311 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v304 = (void *)objc_claimAutoreleasedReturnValue();
                  v384 = v304;
                }
                +[_DKApplicationActivityMetadataKey suggestedInvocationPhrase](_DKApplicationActivityMetadataKey, "suggestedInvocationPhrase");
                v343 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:");
                v110 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v441 = (void *)v110;
                v438 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v110 == v438)
                {
                  v382 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey suggestedInvocationPhrase](_DKApplicationActivityMetadataKey, "suggestedInvocationPhrase");
                  v309 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v302 = (void *)objc_claimAutoreleasedReturnValue();
                  v382 = v302;
                }
                +[_DKApplicationActivityMetadataKey title](_DKApplicationActivityMetadataKey, "title");
                v111 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:", v111);
                v112 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v435 = (void *)v112;
                v432 = (void *)objc_claimAutoreleasedReturnValue();
                v113 = (void *)v101;
                if ((void *)v112 == v432)
                {
                  v380 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey title](_DKApplicationActivityMetadataKey, "title");
                  v307 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v300 = (void *)objc_claimAutoreleasedReturnValue();
                  v380 = v300;
                }
                +[_DKApplicationActivityMetadataKey userActivityRequiredString](_DKApplicationActivityMetadataKey, "userActivityRequiredString");
                v114 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:", v114);
                v115 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v429 = (void *)v115;
                v426 = (void *)objc_claimAutoreleasedReturnValue();
                v116 = (void *)v104;
                if ((void *)v115 == v426)
                {
                  v378 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey userActivityRequiredString](_DKApplicationActivityMetadataKey, "userActivityRequiredString");
                  v305 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v299 = (void *)objc_claimAutoreleasedReturnValue();
                  v378 = v299;
                }
                +[_DKApplicationActivityMetadataKey userActivityUUID](_DKApplicationActivityMetadataKey, "userActivityUUID");
                v117 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:", v117);
                v118 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v335 = (void *)v118;
                v333 = (void *)objc_claimAutoreleasedReturnValue();
                v352 = v113;
                v350 = v116;
                v348 = (void *)v107;
                v341 = (void *)v111;
                v339 = (void *)v114;
                v337 = (void *)v117;
                if ((void *)v118 == v333)
                {
                  v376 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey userActivityUUID](_DKApplicationActivityMetadataKey, "userActivityUUID");
                  v303 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:");
                  v298 = (void *)objc_claimAutoreleasedReturnValue();
                  v376 = v298;
                }
                objc_msgSend(v509, "source");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "sourceID");
                v329 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v509, "source");
                v327 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v327, "bundleID");
                v423 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v509, "source");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "itemID");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v509, "source");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "groupID");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v124 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(v503, "doubleValue");
                objc_msgSend(v124, "dateWithTimeIntervalSinceReferenceDate:");
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("com.apple.calendarUIKit.userActivity.externalID"));
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                v505 = v45;
                v331 = v119;
                if (v126 == v127)
                {
                  v128 = 0;
                }
                else
                {
                  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("com.apple.calendarUIKit.userActivity.externalID"));
                  v128 = objc_claimAutoreleasedReturnValue();
                  v301 = (void *)v128;
                }
                v129 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(v500, "doubleValue");
                objc_msgSend(v129, "dateWithTimeIntervalSinceReferenceDate:");
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                v131 = (void *)objc_msgSend(v354, "initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:", v497, v420, v400, v398, v396, v394, v392, v390, v388, v386, v384, v382, v380,
                                 v378,
                                 v376,
                                 v329,
                                 v423,
                                 v121,
                                 v123,
                                 v125,
                                 v128,
                                 v130);

                if (v126 != v127)
                v25 = MEMORY[0x1E0C81028];
                if (v335 != v333)
                {

                }
                v26 = &off_1E26E0000;
                v27 = v507;
                if (v429 != v426)
                {

                }
                if (v435 != v432)
                {

                }
                if (v441 != v438)
                {

                }
                if (v447 != v444)
                {

                }
                if (v453 != v450)
                {

                }
                if (v459 != v456)
                {

                }
                if (v465 != v462)
                {

                }
                if (v471 != v468)
                {

                }
                if (v477 != v474)
                {

                }
                if (v485 != v480)
                {

                }
                if (v491 != v488)
                {

                }
                if (v364 != v494)
                {

                }
                if (v370 != v368)
                {

                }
                v132 = *(void **)(v418 + 152);
                objc_msgSend(v509, "startDate");
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v133, "timeIntervalSinceReferenceDate");
                objc_msgSend(v132, "sendEvent:timestamp:", v131);

                v88 = v503;
                v24 = v417;
              }
              else
              {
                objc_msgSend(v28, "stream");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "name");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26[490], "appLocationActivityStream");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "name");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v49, "isEqual:", v51);

                if (!v52)
                  goto LABEL_306;
                v510 = v28;
                objc_msgSend(v28, "metadata");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("com.apple.calendarUIKit.userActivity.date"));
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                if (v54 == v55)
                {
                  v504 = 0;
                }
                else
                {
                  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("com.apple.calendarUIKit.userActivity.date"));
                  v504 = (id)objc_claimAutoreleasedReturnValue();

                }
                objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("com.apple.calendarUIKit.userActivity.endDate"));
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                if (v134 == v135)
                {
                  v501 = 0;
                }
                else
                {
                  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("com.apple.calendarUIKit.userActivity.endDate"));
                  v501 = (id)objc_claimAutoreleasedReturnValue();

                }
                +[_DKLocationApplicationActivityMetadataKey URL](_DKLocationApplicationActivityMetadataKey, "URL");
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:", v136);
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                if (v137 == v138)
                {
                  v140 = 0;
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey URL](_DKLocationApplicationActivityMetadataKey, "URL");
                  v139 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:", v139);
                  v140 = (id)objc_claimAutoreleasedReturnValue();

                }
                if (v140)
                {
                  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v140);
                  v498 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v498 = 0;
                }
                v141 = objc_alloc(MEMORY[0x1E0D01F10]);
                objc_msgSend(v510, "value");
                v277 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v277, "stringValue");
                v495 = (void *)objc_claimAutoreleasedReturnValue();
                +[_DKApplicationActivityMetadataKey activityType](_DKApplicationActivityMetadataKey, "activityType");
                v142 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:", v142);
                v143 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v279 = (void *)objc_claimAutoreleasedReturnValue();
                v280 = (void *)v143;
                if ((void *)v143 == v279)
                {
                  v344 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey activityType](_DKApplicationActivityMetadataKey, "activityType");
                  v246 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v242 = (void *)objc_claimAutoreleasedReturnValue();
                  v344 = v242;
                }
                +[_DKApplicationActivityMetadataKey beginningOfActivity](_DKApplicationActivityMetadataKey, "beginningOfActivity");
                v144 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:", v144);
                v145 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v489 = (void *)objc_claimAutoreleasedReturnValue();
                v492 = (void *)v145;
                if ((void *)v145 == v489)
                {
                  v342 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey beginningOfActivity](_DKApplicationActivityMetadataKey, "beginningOfActivity");
                  v245 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v240 = (void *)objc_claimAutoreleasedReturnValue();
                  v342 = v240;
                }
                +[_DKApplicationActivityMetadataKey contentDescription](_DKApplicationActivityMetadataKey, "contentDescription");
                v276 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v146 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v481 = (void *)objc_claimAutoreleasedReturnValue();
                v486 = (void *)v146;
                if ((void *)v146 == v481)
                {
                  v340 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey contentDescription](_DKApplicationActivityMetadataKey, "contentDescription");
                  v244 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v238 = (void *)objc_claimAutoreleasedReturnValue();
                  v340 = v238;
                }
                +[_DKApplicationActivityMetadataKey expirationDate](_DKApplicationActivityMetadataKey, "expirationDate");
                v275 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v147 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v475 = (void *)objc_claimAutoreleasedReturnValue();
                v478 = (void *)v147;
                if ((void *)v147 == v475)
                {
                  v338 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey expirationDate](_DKApplicationActivityMetadataKey, "expirationDate");
                  v243 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v236 = (void *)objc_claimAutoreleasedReturnValue();
                  v338 = v236;
                }
                +[_DKApplicationActivityMetadataKey isEligibleForPrediction](_DKApplicationActivityMetadataKey, "isEligibleForPrediction");
                v274 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v148 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v469 = (void *)objc_claimAutoreleasedReturnValue();
                v472 = (void *)v148;
                if ((void *)v148 == v469)
                {
                  v336 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey isEligibleForPrediction](_DKApplicationActivityMetadataKey, "isEligibleForPrediction");
                  v241 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v234 = (void *)objc_claimAutoreleasedReturnValue();
                  v336 = v234;
                }
                +[_DKApplicationActivityMetadataKey isPubliclyIndexable](_DKApplicationActivityMetadataKey, "isPubliclyIndexable");
                v273 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v149 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v463 = (void *)objc_claimAutoreleasedReturnValue();
                v466 = (void *)v149;
                if ((void *)v149 == v463)
                {
                  v334 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey isPubliclyIndexable](_DKApplicationActivityMetadataKey, "isPubliclyIndexable");
                  v239 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v232 = (void *)objc_claimAutoreleasedReturnValue();
                  v334 = v232;
                }
                +[_DKApplicationActivityMetadataKey itemIdentifier](_DKApplicationActivityMetadataKey, "itemIdentifier");
                v272 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v150 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v445 = (void *)objc_claimAutoreleasedReturnValue();
                v460 = (void *)v150;
                v278 = (void *)v144;
                if ((void *)v150 == v445)
                {
                  v332 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey itemIdentifier](_DKApplicationActivityMetadataKey, "itemIdentifier");
                  v237 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v230 = (void *)objc_claimAutoreleasedReturnValue();
                  v332 = v230;
                }
                +[_DKApplicationActivityMetadataKey itemRelatedContentURL](_DKApplicationActivityMetadataKey, "itemRelatedContentURL");
                v271 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v151 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v457 = (void *)v151;
                v454 = (void *)objc_claimAutoreleasedReturnValue();
                v267 = v141;
                if ((void *)v151 == v454)
                {
                  v330 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey itemRelatedContentURL](_DKApplicationActivityMetadataKey, "itemRelatedContentURL");
                  v235 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v228 = (void *)objc_claimAutoreleasedReturnValue();
                  v330 = v228;
                }
                +[_DKApplicationActivityMetadataKey itemRelatedUniqueIdentifier](_DKApplicationActivityMetadataKey, "itemRelatedUniqueIdentifier");
                v152 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:", v152);
                v153 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v451 = (void *)v153;
                v448 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v153 == v448)
                {
                  v328 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey itemRelatedUniqueIdentifier](_DKApplicationActivityMetadataKey, "itemRelatedUniqueIdentifier");
                  v233 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v226 = (void *)objc_claimAutoreleasedReturnValue();
                  v328 = v226;
                }
                +[_DKApplicationActivityMetadataKey shortcutAvailability](_DKApplicationActivityMetadataKey, "shortcutAvailability");
                v154 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:", v154);
                v155 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v421 = (void *)objc_claimAutoreleasedReturnValue();
                v442 = (void *)v155;
                if ((void *)v155 == v421)
                {
                  v156 = v140;
                  v297 = 0;
                }
                else
                {
                  v156 = v140;
                  +[_DKApplicationActivityMetadataKey shortcutAvailability](_DKApplicationActivityMetadataKey, "shortcutAvailability");
                  v231 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v224 = (void *)objc_claimAutoreleasedReturnValue();
                  v297 = v224;
                }
                +[_DKApplicationActivityMetadataKey suggestedInvocationPhrase](_DKApplicationActivityMetadataKey, "suggestedInvocationPhrase");
                v268 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v157 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v439 = (void *)v157;
                v436 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v157 == v436)
                {
                  v296 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey suggestedInvocationPhrase](_DKApplicationActivityMetadataKey, "suggestedInvocationPhrase");
                  v229 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v222 = (void *)objc_claimAutoreleasedReturnValue();
                  v296 = v222;
                }
                +[_DKApplicationActivityMetadataKey title](_DKApplicationActivityMetadataKey, "title");
                v266 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v158 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v433 = (void *)v158;
                v430 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v158 == v430)
                {
                  v295 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey title](_DKApplicationActivityMetadataKey, "title");
                  v227 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v219 = (void *)objc_claimAutoreleasedReturnValue();
                  v295 = v219;
                }
                +[_DKApplicationActivityMetadataKey userActivityRequiredString](_DKApplicationActivityMetadataKey, "userActivityRequiredString");
                v265 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v159 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v427 = (void *)v159;
                v424 = (void *)objc_claimAutoreleasedReturnValue();
                v270 = (void *)v152;
                if ((void *)v159 == v424)
                {
                  v294 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey userActivityRequiredString](_DKApplicationActivityMetadataKey, "userActivityRequiredString");
                  v225 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v217 = (void *)objc_claimAutoreleasedReturnValue();
                  v294 = v217;
                }
                +[_DKApplicationActivityMetadataKey userActivityUUID](_DKApplicationActivityMetadataKey, "userActivityUUID");
                v254 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v160 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v401 = (void *)v160;
                v399 = (void *)objc_claimAutoreleasedReturnValue();
                v281 = (void *)v142;
                if ((void *)v160 == v399)
                {
                  v293 = 0;
                }
                else
                {
                  +[_DKApplicationActivityMetadataKey userActivityUUID](_DKApplicationActivityMetadataKey, "userActivityUUID");
                  v223 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v215 = (void *)objc_claimAutoreleasedReturnValue();
                  v293 = v215;
                }
                objc_msgSend(v510, "source");
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v161, "sourceID");
                v397 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v510, "source");
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "bundleID");
                v395 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v510, "source");
                v262 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v262, "itemID");
                v393 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v510, "source");
                v261 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v261, "groupID");
                v391 = (void *)objc_claimAutoreleasedReturnValue();
                v163 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(v504, "doubleValue");
                objc_msgSend(v163, "dateWithTimeIntervalSinceReferenceDate:");
                v389 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("com.apple.calendarUIKit.userActivity.externalID"));
                v164 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v387 = (void *)v164;
                v385 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v164 == v385)
                {
                  v292 = 0;
                }
                else
                {
                  objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("com.apple.calendarUIKit.userActivity.externalID"));
                  v221 = (void *)objc_claimAutoreleasedReturnValue();
                  v292 = v221;
                }
                v165 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(v501, "doubleValue");
                objc_msgSend(v165, "dateWithTimeIntervalSinceReferenceDate:");
                v383 = (void *)objc_claimAutoreleasedReturnValue();
                +[_DKLocationApplicationActivityMetadataKey locationName](_DKLocationApplicationActivityMetadataKey, "locationName");
                v166 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:", v166);
                v167 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v381 = (void *)v167;
                v379 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v167 == v379)
                {
                  v291 = 0;
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey locationName](_DKLocationApplicationActivityMetadataKey, "locationName");
                  v220 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v213 = (void *)objc_claimAutoreleasedReturnValue();
                  v291 = v213;
                }
                +[_DKLocationApplicationActivityMetadataKey latitude](_DKLocationApplicationActivityMetadataKey, "latitude");
                v259 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v168 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v377 = (void *)v168;
                v375 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v168 == v375)
                {
                  v290 = 0;
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey latitude](_DKLocationApplicationActivityMetadataKey, "latitude");
                  v218 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v211 = (void *)objc_claimAutoreleasedReturnValue();
                  v290 = v211;
                }
                +[_DKLocationApplicationActivityMetadataKey longitude](_DKLocationApplicationActivityMetadataKey, "longitude");
                v258 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v169 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v373 = (void *)v169;
                v371 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v169 == v371)
                {
                  v289 = 0;
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey longitude](_DKLocationApplicationActivityMetadataKey, "longitude");
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v209 = (void *)objc_claimAutoreleasedReturnValue();
                  v289 = v209;
                }
                +[_DKLocationApplicationActivityMetadataKey city](_DKLocationApplicationActivityMetadataKey, "city");
                v257 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v170 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v369 = (void *)v170;
                v367 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v170 == v367)
                {
                  v288 = 0;
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey city](_DKLocationApplicationActivityMetadataKey, "city");
                  v214 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v207 = (void *)objc_claimAutoreleasedReturnValue();
                  v288 = v207;
                }
                +[_DKLocationApplicationActivityMetadataKey stateOrProvince](_DKLocationApplicationActivityMetadataKey, "stateOrProvince");
                v256 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v171 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v365 = (void *)v171;
                v363 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v171 == v363)
                {
                  v287 = 0;
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey stateOrProvince](_DKLocationApplicationActivityMetadataKey, "stateOrProvince");
                  v212 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v205 = (void *)objc_claimAutoreleasedReturnValue();
                  v287 = v205;
                }
                +[_DKLocationApplicationActivityMetadataKey country](_DKLocationApplicationActivityMetadataKey, "country");
                v255 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v172 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v361 = (void *)v172;
                v359 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v172 == v359)
                {
                  v286 = 0;
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey country](_DKLocationApplicationActivityMetadataKey, "country");
                  v210 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v203 = (void *)objc_claimAutoreleasedReturnValue();
                  v286 = v203;
                }
                +[_DKLocationApplicationActivityMetadataKey thoroughfare](_DKLocationApplicationActivityMetadataKey, "thoroughfare");
                v253 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v173 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v357 = (void *)v173;
                v355 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v173 == v355)
                {
                  v285 = 0;
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey thoroughfare](_DKLocationApplicationActivityMetadataKey, "thoroughfare");
                  v208 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v201 = (void *)objc_claimAutoreleasedReturnValue();
                  v285 = v201;
                }
                +[_DKLocationApplicationActivityMetadataKey fullyFormattedAddress](_DKLocationApplicationActivityMetadataKey, "fullyFormattedAddress");
                v252 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v174 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v353 = (void *)v174;
                v351 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v174 == v351)
                {
                  v284 = 0;
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey fullyFormattedAddress](_DKLocationApplicationActivityMetadataKey, "fullyFormattedAddress");
                  v206 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v199 = (void *)objc_claimAutoreleasedReturnValue();
                  v284 = v199;
                }
                +[_DKLocationApplicationActivityMetadataKey subThoroughfare](_DKLocationApplicationActivityMetadataKey, "subThoroughfare");
                v251 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v175 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v349 = (void *)v175;
                v347 = (void *)objc_claimAutoreleasedReturnValue();
                if ((void *)v175 == v347)
                {
                  v283 = 0;
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey subThoroughfare](_DKLocationApplicationActivityMetadataKey, "subThoroughfare");
                  v204 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v198 = (void *)objc_claimAutoreleasedReturnValue();
                  v283 = v198;
                }
                v282 = v156;
                +[_DKLocationApplicationActivityMetadataKey postalCode](_DKLocationApplicationActivityMetadataKey, "postalCode");
                v250 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v176 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v249 = (void *)v176;
                v248 = (void *)objc_claimAutoreleasedReturnValue();
                v269 = (void *)v154;
                v263 = v162;
                if ((void *)v176 == v248)
                {
                  v177 = 0;
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey postalCode](_DKLocationApplicationActivityMetadataKey, "postalCode");
                  v202 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v177 = objc_claimAutoreleasedReturnValue();
                  v197 = (void *)v177;
                }
                v508 = v27;
                +[_DKLocationApplicationActivityMetadataKey phoneNumbers](_DKLocationApplicationActivityMetadataKey, "phoneNumbers");
                v247 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:");
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v179 = (void *)objc_claimAutoreleasedReturnValue();
                v264 = v161;
                v260 = (void *)v166;
                if (v178 == v179)
                {
                  v180 = 0;
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey phoneNumbers](_DKLocationApplicationActivityMetadataKey, "phoneNumbers");
                  v200 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:");
                  v180 = objc_claimAutoreleasedReturnValue();
                  v196 = (void *)v180;
                }
                +[_DKLocationApplicationActivityMetadataKey displayName](_DKLocationApplicationActivityMetadataKey, "displayName");
                v181 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKeyedSubscript:", v181);
                v182 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v183 = (void *)objc_claimAutoreleasedReturnValue();
                v505 = v53;
                if (v182 == v183)
                {
                  v345 = (void *)objc_msgSend(v267, "initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:locationName:latitude:longitude:city:stateOrProvince:country:thoroughfare:fullyFormattedAddress:subThoroughfare:postalCode:phoneNumbers:displayName:URL:", v495, v344, v342, v340, v338, v336, v334, v332, v330, v328, v297,
                                   v296,
                                   v295,
                                   v294,
                                   v293,
                                   v397,
                                   v395,
                                   v393,
                                   v391,
                                   v389,
                                   v292,
                                   v383,
                                   v291,
                                   v290,
                                   v289,
                                   v288,
                                   v287,
                                   v286,
                                   v285,
                                   v284,
                                   v283,
                                   v177,
                                   v180,
                                   0,
                                   v498);
                }
                else
                {
                  +[_DKLocationApplicationActivityMetadataKey displayName](_DKLocationApplicationActivityMetadataKey, "displayName");
                  v184 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:", v184);
                  v185 = (void *)objc_claimAutoreleasedReturnValue();
                  v345 = (void *)objc_msgSend(v267, "initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:locationName:latitude:longitude:city:stateOrProvince:country:thoroughfare:fullyFormattedAddress:subThoroughfare:postalCode:phoneNumbers:displayName:URL:", v495, v344, v342, v340, v338, v336, v334, v332, v330, v328, v297,
                                   v296,
                                   v295,
                                   v294,
                                   v293,
                                   v397,
                                   v395,
                                   v393,
                                   v391,
                                   v389,
                                   v292,
                                   v383,
                                   v291,
                                   v290,
                                   v289,
                                   v288,
                                   v287,
                                   v286,
                                   v285,
                                   v284,
                                   v283,
                                   v177,
                                   v180,
                                   v185,
                                   v498);

                }
                v26 = &off_1E26E0000;
                v27 = v508;
                if (v178 != v179)
                {

                }
                v25 = MEMORY[0x1E0C81028];
                if (v249 != v248)
                {

                }
                v24 = v417;
                if (v349 != v347)
                {

                }
                if (v353 != v351)
                {

                }
                if (v357 != v355)
                {

                }
                if (v361 != v359)
                {

                }
                if (v365 != v363)
                {

                }
                if (v369 != v367)
                {

                }
                if (v373 != v371)
                {

                }
                if (v377 != v375)
                {

                }
                if (v381 != v379)
                {

                }
                if (v387 != v385)

                if (v401 != v399)
                {

                }
                if (v427 != v424)
                {

                }
                if (v433 != v430)
                {

                }
                if (v439 != v436)
                {

                }
                if (v442 != v421)
                {

                }
                if (v451 != v448)
                {

                }
                if (v457 != v454)
                {

                }
                if (v460 != v445)
                {

                }
                if (v466 != v463)
                {

                }
                if (v472 != v469)
                {

                }
                if (v478 != v475)
                {

                }
                if (v486 != v481)
                {

                }
                if (v492 != v489)
                {

                }
                if (v280 != v279)
                {

                }
                v186 = *(void **)(v418 + 160);
                objc_msgSend(v510, "startDate");
                v187 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v187, "timeIntervalSinceReferenceDate");
                objc_msgSend(v186, "sendEvent:timestamp:", v345);

                v88 = v504;
              }
            }

LABEL_306:
            ++v27;
          }
          while (v483 != v27);
          v483 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v512, v521, 16);
        }
        while (v483);
      }

      if (objc_msgSend(v190, "count"))
        objc_msgSend(*(id *)(v418 + 168), "publishXPCEventForAppIntents:appActivities:uid:", v190, v24, a3);

      v10 = v193;
      v9 = v194;
      v8 = v191;
    }
    else if (v10)
    {
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0);
    }
  }

}

- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  os_activity_scope_state_s v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18DDBE000, "Duet: deleteAllInteractionsWithBundleID:protectionClass:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v11, &v14);
  os_activity_scope_leave(&v14);

  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v14.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v14.opaque + 4) = (uint64_t)v8;
    _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_DEFAULT, "Deleting interactions with bundleID: %@", (uint8_t *)&v14, 0xCu);
  }

  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB2AB0]) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB2AB8]))
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14.opaque[0]) = 0;
      _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_INFO, "Request to delete items with identifiers with protectionClass A or B when in class C, D.", (uint8_t *)&v14, 2u);
    }

  }
  -[_CDSpotlightItemRecorder deleteAllItemsWithBundleID:completion:](self, v8, v10);

}

- (void)deleteAllItemsWithBundleID:(void *)a3 completion:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (a1[17])
    {
      objc_initWeak(&location, a1);
      v7 = a1[2];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66___CDSpotlightItemRecorder_deleteAllItemsWithBundleID_completion___block_invoke;
      block[3] = &unk_1E26E30F0;
      objc_copyWeak(&v11, &location);
      v10 = v5;
      dispatch_sync(v7, block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    +[_DKQuery predicateForSpotlightEventsWithBundleID:]((uint64_t)_DKQuery, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:]((uint64_t)a1, v8, v6);

  }
}

- (id)getUserNameOfDonator
{
  unsigned int v1;
  NSObject *v2;
  passwd *v3;
  uint64_t *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;

  if (a1)
  {
    v1 = -[_CDSpotlightItemRecorder getUidOfDonator](a1);
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      -[_CDSpotlightItemRecorder getUserNameOfDonator].cold.3(v1, v2);

    v3 = getpwuid(v1);
    if (v3 && (v4 = (uint64_t *)v3, v3->pw_name))
    {
      +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[_CDSpotlightItemRecorder getUserNameOfDonator].cold.2(v4, v5, v6);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[_CDSpotlightItemRecorder getUserNameOfDonator].cold.1();

      NSUserName();
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (void)getUidOfDonator
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Key for UID on current dispatch queue is set.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)addInteractions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _CDSpotlightItemRecorder *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  _CDSpotlightItemRecorder *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  _CDInteraction *v56;
  NSObject *batchExecutionSourceQueue;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  id obj;
  id obja;
  void *v71;
  _QWORD block[4];
  id v73;
  id v74;
  _CDSpotlightItemRecorder *v75;
  id v76;
  _BYTE *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE state[24];
  unsigned int v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = _os_activity_create(&dword_18DDBE000, "Duet: addInteractions:bundleID:protectionClass:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v13, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)state = 138412546;
    *(_QWORD *)&state[4] = v15;
    *(_WORD *)&state[12] = 2112;
    *(_QWORD *)&state[14] = v10;
    _os_log_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_INFO, "Adding %@ interactions for bundleID: %@", state, 0x16u);

  }
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2AB0]) & 1) == 0
    && (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2AB8]) & 1) == 0)
  {
    v16 = v9;
    v17 = v10;
    +[_CDConstants mobileMessagesBundleId]();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v17;
    LODWORD(v17) = objc_msgSend(v17, "isEqualToString:", v18);

    if ((_DWORD)v17)
    {
      v59 = v12;
      v61 = v11;
      v63 = v10;
      v65 = v9;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v58 = v16;
      obj = v16;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, state, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v83 != v22)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
            objc_msgSend(v24, "dateInterval", v58);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "startDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              objc_msgSend(v19, "timeIntervalSinceDate:", v26);
              v28 = v27;
              if (objc_msgSend(v24, "direction") == 2)
              {
                objc_msgSend(v24, "intent");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "_className");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = (objc_class *)objc_opt_class();
                NSStringFromClass(v31);
                v32 = v19;
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v30, "isEqualToString:", v33);

                v19 = v32;
                if (v34)
                {
                  if (v28 > 0.0 && v28 < 180.0)
                  {
                    objc_msgSend(v24, "intent");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    +[_CDSpotlightItemUtils messageContextDictionaryForSendMessageIntent:](_CDSpotlightItemUtils, "messageContextDictionaryForSendMessageIntent:", v35);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v36)
                      objc_msgSend(v66, "addObject:", v36);

                  }
                }
              }
            }

          }
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, state, 16);
        }
        while (v21);
      }

      if (objc_msgSend(v66, "count"))
      {
        -[objc_class ephemeralKeyPathWithKey:](get_CDContextualKeyPathClass(), "ephemeralKeyPathWithKey:", CFSTR("/interactions/messages"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v66, "copy");
        -[objc_class userContext](get_CDClientContextClass(), "userContext");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, v37);

      }
      v10 = v63;
      v9 = v65;
      v12 = v59;
      v11 = v61;
      v16 = v58;
    }
    v40 = v71;

    v41 = (void *)MEMORY[0x193FEE914]();
    v42 = self;
    if (self)
    {
      if (self->_recorder)
      {
        +[_CDConstants mobileMessagesBundleId]();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v71, "isEqualToString:", v43);

        if ((v44 & 1) == 0)
        {
          v67 = v41;
          v60 = v12;
          v62 = v11;
          v64 = v10;
          -[_CDSpotlightItemRecorder getUserNameOfDonator](self);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("intent.cd_saveToPeopleStore = YES"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "filteredArrayUsingPredicate:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v47, "count"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          obja = v47;
          v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
          v50 = self;
          if (v49)
          {
            v51 = v49;
            v52 = *(_QWORD *)v79;
            do
            {
              for (j = 0; j != v51; ++j)
              {
                if (*(_QWORD *)v79 != v52)
                  objc_enumerationMutation(obja);
                v54 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
                +[_CDInteraction shareSheetInteractionFromINInteraction:bundleID:nsUserName:knowledgeStore:](_CDInteraction, "shareSheetInteractionFromINInteraction:bundleID:nsUserName:knowledgeStore:", v54, v71, v45, v50->_knowledgeStore);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                if (v55)
                {
                  objc_msgSend(v48, "addObject:", v55);
                }
                else
                {
                  v56 = -[_CDInteraction initWithINInteraction:bundleID:nsUserName:]([_CDInteraction alloc], "initWithINInteraction:bundleID:nsUserName:", v54, v71, v45);
                  if (v56)
                    objc_msgSend(v48, "addObject:", v56);

                  v50 = self;
                }

              }
              v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
            }
            while (v51);
          }

          v40 = v71;
          -[_CDSpotlightItemRecorder _addOrUpdateCoreDuetInteractions:bundleID:]((uint64_t)v50, v48, v71);

          v10 = v64;
          v12 = v60;
          v11 = v62;
          v42 = v50;
          v41 = v67;
        }
      }
    }
    *(_QWORD *)state = 0;
    *(_QWORD *)&state[8] = state;
    *(_QWORD *)&state[16] = 0x2020000000;
    v88 = 0;
    v88 = -[_CDSpotlightItemRecorder getUidOfDonator](v42);
    batchExecutionSourceQueue = v42->_batchExecutionSourceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84___CDSpotlightItemRecorder_addInteractions_bundleID_protectionClass_withCompletion___block_invoke;
    block[3] = &unk_1E26E6E40;
    v73 = v16;
    v74 = v40;
    v75 = v42;
    v77 = state;
    v76 = v12;
    dispatch_sync(batchExecutionSourceQueue, block);

    _Block_object_dispose(state, 8);
    objc_autoreleasePoolPop(v41);
  }

}

- (void)addInteractions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  -[_CDSpotlightItemRecorder addInteractions:bundleID:protectionClass:withCompletion:](self, "addInteractions:bundleID:protectionClass:withCompletion:", a3, a4, a5, 0);
}

- (void)_addOrUpdateCoreDuetInteractions:(void *)a3 bundleID:
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  CFIndex Length;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  UniChar v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  _CDSpotlightItemRecorderOperation *v39;
  _CDSpotlightItemRecorderOperation *v40;
  id v41;
  id v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  UniChar *v55;
  UniChar buffer[8];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 theString;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  id v75;
  __int16 v76;
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;
  CFRange v80;

  v79 = *MEMORY[0x1E0C80C00];
  v42 = a2;
  v41 = a3;
  if (!a1 || !*(_QWORD *)(a1 + 136))
    goto LABEL_61;
  v46 = a1;
  if (objc_msgSend(v42, "count"))
  {
    if (*(_QWORD *)(a1 + 104) && objc_msgSend(v41, "isEqualToString:", CFSTR("com.apple.mobilecal")))
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      obj = v42;
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
      if (v45)
      {
        v5 = 0;
        v44 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v69 != v44)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "domainIdentifier", v41);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v48;
            if (v48)
            {
              objc_msgSend(*(id *)(v46 + 104), "computeHashesForString:reuse:", v48, v5);
              v7 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(*(id *)(v46 + 104), "setWithHashes:", v7);
              v8 = v48;
              objc_opt_self();
              v9 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v9)
                goto LABEL_41;
              v67 = 0;
              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              theString = 0u;
              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              v58 = 0u;
              *(_OWORD *)buffer = 0u;
              v57 = 0u;
              Length = CFStringGetLength(v8);
              *(_QWORD *)&theString = v8;
              *((_QWORD *)&v65 + 1) = 0;
              *(_QWORD *)&v66 = Length;
              *((_QWORD *)&theString + 1) = CFStringGetCharactersPtr(v8);
              v11 = *((_QWORD *)&theString + 1) ? 0 : CFStringGetCStringPtr(v8, 0x600u);
              *(_QWORD *)&v65 = v11;
              *((_QWORD *)&v66 + 1) = 0;
              v67 = 0;
              if (Length >= 1)
              {
                v12 = 0;
                v13 = 0;
                v14 = 64;
                do
                {
                  if ((unint64_t)v13 >= 4)
                    v15 = 4;
                  else
                    v15 = v13;
                  v16 = v66;
                  if ((uint64_t)v66 <= v13)
                    goto LABEL_38;
                  if (*((_QWORD *)&theString + 1))
                  {
                    v17 = *(_WORD *)(*((_QWORD *)&theString + 1) + 2 * (v13 + *((_QWORD *)&v65 + 1)));
                  }
                  else if ((_QWORD)v65)
                  {
                    v17 = *(char *)(v65 + *((_QWORD *)&v65 + 1) + v13);
                  }
                  else
                  {
                    v18 = *((_QWORD *)&v66 + 1);
                    if (v67 <= v13 || *((_QWORD *)&v66 + 1) > v13)
                    {
                      v20 = v13 - v15;
                      v21 = v15 + v12;
                      v22 = v14 - v15;
                      v23 = v20 + 64;
                      if (v20 + 64 >= (uint64_t)v66)
                        v23 = v66;
                      *((_QWORD *)&v66 + 1) = v20;
                      v67 = v23;
                      if ((uint64_t)v66 >= v22)
                        v16 = v22;
                      v80.length = v16 + v21;
                      v80.location = *((_QWORD *)&v65 + 1) + v20;
                      CFStringGetCharacters((CFStringRef)theString, v80, buffer);
                      v18 = *((_QWORD *)&v66 + 1);
                    }
                    v17 = buffer[v13 - v18];
                  }
                  if (v17 == 46)
                  {
                    v24 = (void *)MEMORY[0x193FEE914]();
                    v25 = *(void **)(v46 + 104);
                    -[__CFString substringToIndex:](v8, "substringToIndex:", v13);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "computeHashesForString:reuse:", v26, v7);
                    v5 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(*(id *)(v46 + 104), "setWithHashes:", v5);
                    objc_autoreleasePoolPop(v24);
                  }
                  else
                  {
LABEL_38:
                    v5 = v7;
                  }
                  ++v13;
                  --v12;
                  ++v14;
                  v7 = v5;
                }
                while (Length != v13);
              }
              else
              {
LABEL_41:
                v5 = v7;
              }

              v6 = v48;
            }

          }
          v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
        }
        while (v45);
      }
      else
      {
        v5 = 0;
      }

    }
    +[_CDConstants mobileMessagesBundleId]();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isEqual:", v41))
    {

LABEL_51:
      v30 = (void *)MEMORY[0x193FEE914]();
      *(_QWORD *)buffer = 0;
      *(_QWORD *)&buffer[4] = buffer;
      *(_QWORD *)&v57 = 0x2020000000;
      BYTE8(v57) = 0;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(void **)(v46 + 128);
      v33 = MEMORY[0x1E0C809B0];
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __70___CDSpotlightItemRecorder__addOrUpdateCoreDuetInteractions_bundleID___block_invoke;
      v51[3] = &unk_1E26E6D60;
      v34 = v41;
      v52 = v34;
      v35 = v42;
      v53 = v35;
      v36 = v31;
      v54 = v36;
      v55 = buffer;
      objc_msgSend(v32, "runWithLockAcquired:", v51);
      if (*(_BYTE *)(*(_QWORD *)&buffer[4] + 24))
      {
        v37 = objc_msgSend(v35, "count");
        v49[0] = v33;
        v49[1] = 3221225472;
        v49[2] = __70___CDSpotlightItemRecorder__addOrUpdateCoreDuetInteractions_bundleID___block_invoke_2;
        v49[3] = &unk_1E26E6D88;
        v50 = v36;
        objc_msgSend(v35, "_pas_filteredArrayWithTest:", v49);
        v42 = (id)objc_claimAutoreleasedReturnValue();

        v38 = objc_msgSend(v42, "count");
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v73 = v37;
          v74 = 2114;
          v75 = v34;
          v76 = 2048;
          v77 = v37 - v38;
          _os_log_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "_addOrUpdateCoreDuetInteractions:(count %tu) bundleID:%{public}@ dropping %tu items due to throttling!", buf, 0x20u);
        }

      }
      else
      {
        v42 = v35;
      }

      _Block_object_dispose(buffer, 8);
      objc_autoreleasePoolPop(v30);
      goto LABEL_57;
    }
    +[_CDConstants contactsAutocompleteBundleId]();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqual:", v41);

    if (v29)
      goto LABEL_51;
  }
LABEL_57:
  if (objc_msgSend(v42, "count", v41))
  {
    v39 = objc_alloc_init(_CDSpotlightItemRecorderOperation);
    v40 = v39;
    if (v39)
      v39->_type = 0;
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v39, v42);
    -[_DKSyncWindow setStartDate:]((uint64_t)v40, v41);
    -[_CDSpotlightItemRecorder submitOperation:]((_QWORD *)v46, v40);

  }
LABEL_61:

}

+ (id)spotlightItemRecorder
{
  void *v3;
  void *v4;

  +[_CDInteractionRecorder interactionRecorder](_CDInteractionRecorder, "interactionRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "spotlightItemRecorderWithInteractionRecorder:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (_CDSpotlightItemRecorder)spotlightItemRecorderWithInteractionRecorder:(id)a3
{
  id v3;
  _CDSpotlightItemRecorder *v4;

  v3 = a3;
  v4 = -[_CDSpotlightItemRecorder initWithInteractionRecorder:]([_CDSpotlightItemRecorder alloc], "initWithInteractionRecorder:", v3);

  return v4;
}

+ (_CDSpotlightItemRecorder)spotlightItemRecorderWithKnowledgeStore:(id)a3
{
  return (_CDSpotlightItemRecorder *)objc_msgSend(a1, "spotlightItemRecorderWithInteractionRecorder:knowledgeStore:", 0, a3);
}

+ (_CDSpotlightItemRecorder)spotlightItemRecorderWithInteractionRecorder:(id)a3 knowledgeStore:(id)a4
{
  id v5;
  id v6;
  _CDSpotlightItemRecorder *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_CDSpotlightItemRecorder initWithInteractionRecorder:knowledgeStore:]([_CDSpotlightItemRecorder alloc], "initWithInteractionRecorder:knowledgeStore:", v6, v5);

  return v7;
}

- (_CDSpotlightItemRecorder)initWithInteractionRecorder:(id)a3
{
  id v4;
  void *v5;
  _CDSpotlightItemRecorder *v6;

  v4 = a3;
  +[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CDSpotlightItemRecorder initWithInteractionRecorder:knowledgeStore:](self, "initWithInteractionRecorder:knowledgeStore:", v4, v5);

  return v6;
}

- (_CDSpotlightItemRecorder)initWithInteractionRecorder:(id)a3 knowledgeStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _CDSpotlightItemRecorder *v9;

  v6 = a4;
  v7 = a3;
  +[_DKRateLimitPolicyEnforcer rateLimitPolicyEnforcer](_DKRateLimitPolicyEnforcer, "rateLimitPolicyEnforcer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_CDSpotlightItemRecorder initWithInteractionRecorder:knowledgeStore:rateLimitEnforcer:](self, "initWithInteractionRecorder:knowledgeStore:rateLimitEnforcer:", v7, v6, v8);

  return v9;
}

- (_CDSpotlightItemRecorder)initWithInteractionRecorder:(id)a3 knowledgeStore:(id)a4 rateLimitEnforcer:(id)a5
{
  return -[_CDSpotlightItemRecorder initWithInteractionRecorder:knowledgeStore:rateLimitEnforcer:deletionManagerOverride:](self, "initWithInteractionRecorder:knowledgeStore:rateLimitEnforcer:deletionManagerOverride:", a3, a4, a5, 0);
}

- (_CDSpotlightItemRecorder)initWithInteractionRecorder:(id)a3 knowledgeStore:(id)a4 rateLimitEnforcer:(id)a5 deletionManagerOverride:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _DKContactsPrivacyMaintainer *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  dispatch_queue_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  dispatch_queue_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  dispatch_queue_t v52;
  void *v53;
  void *v54;
  dispatch_source_t v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  id v59;
  NSObject *v60;
  id v61;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id buf[2];
  _QWORD handler[4];
  id v70;
  id v71;
  id location;
  objc_super v73;

  v11 = a3;
  v64 = a4;
  v63 = a5;
  v12 = a6;
  v73.receiver = self;
  v73.super_class = (Class)_CDSpotlightItemRecorder;
  v13 = -[_CDSpotlightItemRecorder init](&v73, sel_init);
  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0D815F0]);
    v15 = (void *)objc_opt_new();
    v16 = objc_msgSend(v14, "initWithGuardedData:", v15, v63, v64);
    v17 = (void *)*((_QWORD *)v13 + 16);
    *((_QWORD *)v13 + 16) = v16;

    objc_initWeak(&location, v13);
    objc_storeStrong((id *)v13 + 9, a4);
    objc_storeStrong((id *)v13 + 10, a5);
    +[_DKPrivacyPolicyEnforcer privacyPolicyEnforcer](_DKPrivacyPolicyEnforcer, "privacyPolicyEnforcer");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v13 + 11);
    *((_QWORD *)v13 + 11) = v18;

    v20 = [_DKContactsPrivacyMaintainer alloc];
    v21 = *((_QWORD *)v13 + 9);
    v22 = objc_loadWeakRetained(&location);
    v23 = -[_DKContactsPrivacyMaintainer initWithKnowledgeStore:spotlightRecorder:](v20, "initWithKnowledgeStore:spotlightRecorder:", v21, v22);
    v24 = (void *)*((_QWORD *)v13 + 12);
    *((_QWORD *)v13 + 12) = v23;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = dispatch_queue_create("rateLimiterQueue", v25);
    v27 = (void *)*((_QWORD *)v13 + 7);
    *((_QWORD *)v13 + 7) = v26;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)*((_QWORD *)v13 + 8);
    *((_QWORD *)v13 + 8) = v28;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v30, (dispatch_qos_class_t)5u, 0);
    v31 = objc_claimAutoreleasedReturnValue();

    v32 = dispatch_queue_create("batchExecutionSourceQueue", v31);
    v33 = (void *)*((_QWORD *)v13 + 2);
    *((_QWORD *)v13 + 2) = v32;

    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_18DDBE000, v34, OS_LOG_TYPE_DEFAULT, "SpotlightRecorder init biome BMLibrary.App.Intent stream", (uint8_t *)buf, 2u);
    }

    BiomeLibrary();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "App");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "Intent");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "source");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)*((_QWORD *)v13 + 18);
    *((_QWORD *)v13 + 18) = v38;

    BiomeLibrary();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "App");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "LocationActivity");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "source");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)*((_QWORD *)v13 + 20);
    *((_QWORD *)v13 + 20) = v43;

    BiomeLibrary();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "App");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "Activity");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "source");
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)*((_QWORD *)v13 + 19);
    *((_QWORD *)v13 + 19) = v48;

    if (v12)
      objc_storeStrong((id *)v13 + 15, a6);
    if (v11)
    {
      objc_storeStrong((id *)v13 + 17, a3);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)*((_QWORD *)v13 + 4);
      *((_QWORD *)v13 + 4) = v50;

      *((_QWORD *)v13 + 5) = 0;
      v52 = dispatch_queue_create("batchArrayQueue", v31);
      v53 = (void *)*((_QWORD *)v13 + 3);
      *((_QWORD *)v13 + 3) = v52;

      v54 = (void *)*((_QWORD *)v13 + 6);
      *((_QWORD *)v13 + 6) = 0;

      v55 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, *((dispatch_queue_t *)v13 + 2));
      v56 = (void *)*((_QWORD *)v13 + 1);
      *((_QWORD *)v13 + 1) = v55;

      v57 = *((_QWORD *)v13 + 1);
      v58 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke;
      handler[3] = &unk_1E26E6D10;
      v59 = v13;
      v70 = v59;
      objc_copyWeak(&v71, &location);
      dispatch_source_set_event_handler(v57, handler);
      dispatch_resume(*((dispatch_object_t *)v13 + 1));
      v60 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v13 + 7));
      dispatch_source_set_timer(v60, 0, 0x1176592E000uLL, 0x37E11D6000uLL);
      objc_initWeak(buf, *((id *)v13 + 8));
      v65[0] = v58;
      v65[1] = 3221225472;
      v65[2] = __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_453;
      v65[3] = &unk_1E26E30F0;
      objc_copyWeak(&v67, buf);
      v66 = v59;
      dispatch_source_set_event_handler(v60, v65);
      dispatch_resume(v60);

      objc_destroyWeak(&v67);
      objc_destroyWeak(buf);

      objc_destroyWeak(&v71);
    }
    v61 = v13;

    objc_destroyWeak(&location);
  }

  return (_CDSpotlightItemRecorder *)v13;
}

- (void)runOperation:(uint64_t)a1
{
  id *v3;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  uint64_t v25;
  id v26;
  void *v27;
  int v28;
  void *v29;
  unint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1 || !*(_QWORD *)(a1 + 136))
    goto LABEL_30;
  if (v3)
  {
    v5 = v3[3];
    if (v5 != (id)1)
    {
      if (v5)
        goto LABEL_30;
      goto LABEL_6;
    }
    v13 = v3[1];
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v43;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v19);
          if (objc_msgSend(v4[2], "isEqualToString:", CFSTR("com.apple.mobilemail")))
          {
            objc_msgSend(v14, "addObject:", v20);
          }
          else
          {
            +[_CDSpotlightItemUtils interactionUUIDForSearchableItemWithUID:bundleID:](_CDSpotlightItemUtils, "interactionUUIDForSearchableItemWithUID:bundleID:", v20, v4[2]);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v21);

          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v17);
    }

    v22 = v4[2];
    +[_CDConstants mobileMessagesBundleId]();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqualToString:", v23);

    if (v24)
    {
      +[_CDConstants shareSheetTargetBundleIdMessages]();
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = v4[2];
      +[_CDConstants mobileMailBundleId]();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqualToString:", v27);

      if (!v28)
      {
        v30 = 0x1E0C99000uLL;
        goto LABEL_29;
      }
      +[_CDConstants shareSheetTargetBundleIdMail]();
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v29 = (void *)v25;
    v30 = 0x1E0C99000;

    v22 = v29;
LABEL_29:
    v31 = objc_alloc(*(Class *)(v30 + 3560));
    v32 = (void *)MEMORY[0x1E0CB3880];
    v33 = v4[2];
    objc_msgSend(v32, "predicateWithFormat:", CFSTR("mechanism != %@ && bundleId == %@"), &unk_1E272B1B8, v33, (_QWORD)v42);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mechanism == %@ && targetBundleId == %@"), &unk_1E272B1B8, v22);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)objc_msgSend(v31, "initWithObjects:", v34, v35, 0);
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v14);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x1E0CB3528];
    v46[0] = v37;
    v46[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "andPredicateWithSubpredicates:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    +[_CDSpotlightItemRecorder recordAggdReceiverAction:bundleID:count:]((uint64_t)_CDSpotlightItemRecorder, 1, v4[2], objc_msgSend(*(id *)(a1 + 136), "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", v41, MEMORY[0x1E0C9AA60], 0, CFSTR("_CDSpotlightItemRecorderOperationTypeDelete"), 0));
    goto LABEL_30;
  }
LABEL_6:
  +[_CDInteractionPolicies interactionPolicies](_CDInteractionPolicies, "interactionPolicies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    v8 = (uint64_t)v4[1];
  else
    v8 = 0;
  objc_msgSend(v6, "filterAndModifyInteractionsWithPolicies:enforceDataLimits:enforcePrivacy:", v8, 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 136), "recordInteractions:", v9))
  {
    if (v4)
    {
      v10 = v4[2];
      v11 = v4[1];
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    v12 = v11;
    +[_CDSpotlightItemRecorder recordAggdReceiverAction:bundleID:count:]((uint64_t)_CDSpotlightItemRecorder, 0, v10, objc_msgSend(v12, "count"));

  }
LABEL_30:

}

- (void)registerSpotlightRecorderWithServiceName:(id)a3
{
  id v4;
  _CDSpotlightCoalescedDeletionManager *v5;
  _CDSpotlightCoalescedDeletionManager *coalescedDeletionManager;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  __int16 v11;

  v4 = a3;
  if (SpotlightReceiverLibraryCore())
  {
    if (!self->_coalescedDeletionManager)
    {
      v5 = -[_CDSpotlightCoalescedDeletionManager initWithKnowledgeStore:]([_CDSpotlightCoalescedDeletionManager alloc], "initWithKnowledgeStore:", self->_knowledgeStore);
      coalescedDeletionManager = self->_coalescedDeletionManager;
      self->_coalescedDeletionManager = v5;

    }
    cd_SpotlightReceiverRegister(v4, self);
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v8 = "SpotlightReceiver is available, registering receiver";
      v9 = (uint8_t *)&v11;
LABEL_8:
      _os_log_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v8 = "SpotlightReceiver is NOT available";
      v9 = (uint8_t *)&v10;
      goto LABEL_8;
    }
  }

}

- (void)_enqueueOperation:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  if (a1 && *(_QWORD *)(a1 + 136))
  {
    v4 = *(NSObject **)(a1 + 24);
    block[1] = 3221225472;
    block[2] = __46___CDSpotlightItemRecorder__enqueueOperation___block_invoke;
    block[3] = &unk_1E26E3250;
    block[4] = a1;
    v5 = v3;
    block[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    dispatch_sync(v4, block);

    v3 = v5;
  }

}

- (void)submitOperation:(_QWORD *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  v4 = v3;
  if (a1 && a1[17])
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v5 = a1[3];
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44___CDSpotlightItemRecorder_submitOperation___block_invoke;
    block[3] = &unk_1E26E2CA8;
    v15 = &v16;
    block[4] = a1;
    v7 = v3;
    v14 = v7;
    dispatch_sync(v5, block);
    if (*((_BYTE *)v17 + 24))
    {
      objc_initWeak(&location, a1);
      v8 = a1[2];
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __44___CDSpotlightItemRecorder_submitOperation___block_invoke_2;
      v9[3] = &unk_1E26E30F0;
      objc_copyWeak(&v11, &location);
      v10 = v7;
      dispatch_sync(v8, v9);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      -[_CDSpotlightItemRecorder _enqueueOperation:]((uint64_t)a1, v7);
    }

    _Block_object_dispose(&v16, 8);
  }

}

- (void)addOrUpdateSearchableItems:(id)a3
{
  -[_CDSpotlightItemRecorder addOrUpdateSearchableItems:bundleID:](self, "addOrUpdateSearchableItems:bundleID:", a3, &stru_1E26E9728);
}

- (id)supportedUTIs
{
  return +[_CDSpotlightItemUtils expectedSupportedUTIs](_CDSpotlightItemUtils, "expectedSupportedUTIs");
}

- (id)supportedINIntentClassNames
{
  return 0;
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4
{
  -[_CDSpotlightItemRecorder addOrUpdateSearchableItems:bundleID:withCompletion:](self, "addOrUpdateSearchableItems:bundleID:withCompletion:", a3, a4, 0);
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4 withCompletion:(id)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _CDSpotlightItemRecorder *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *batchExecutionSourceQueue;
  void *context;
  id v43;
  void *v45;
  id obj;
  id v47;
  void *v48;
  _QWORD block[4];
  id v50;
  id v51;
  _CDSpotlightItemRecorder *v52;
  id v53;
  _BYTE *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  _BYTE v61[128];
  _BYTE state[24];
  id v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[5];

  v66[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v47 = a4;
  v43 = a5;
  v8 = _os_activity_create(&dword_18DDBE000, "Duet: addOrUpdateSearchableItems:bundleID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v8, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)state = 138412546;
    *(_QWORD *)&state[4] = v10;
    *(_WORD *)&state[12] = 2112;
    *(_QWORD *)&state[14] = v47;
    _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "Adding %@ searchable items for bundleID: %@", state, 0x16u);

  }
  if (objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.mobilesafari"))
    && objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributeSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[objc_class keyPathForMostRecentSafariSpotlightDonation](get_CDContextQueriesClass(), "keyPathForMostRecentSafariSpotlightDonation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class mostRecentSafariSearchableItem](get_CDContextQueriesClass(), "mostRecentSafariSearchableItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v15;
      v66[0] = v11;
      -[objc_class safariURLInMostRecentSearchableItem](get_CDContextQueriesClass(), "safariURLInMostRecentSearchableItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v65[1] = v16;
      v66[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class userContext](get_CDClientContextClass(), "userContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v14);

    }
  }
  v19 = objc_msgSend(v7, "count");
  if ((objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.icloud.drive.fileprovider")) & 1) != 0)
  {
    v45 = (void *)MEMORY[0x1E0C9AA60];
LABEL_12:

    goto LABEL_14;
  }
  if (objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.shortcuts")))
  {
    v20 = objc_alloc(MEMORY[0x1E0D815A0]);
    v64[0] = CFSTR("com.apple.duetexpertd.spotlightZKW");
    v64[1] = CFSTR("spotlightZKW");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithDomainsFromArray:", v21);

    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __79___CDSpotlightItemRecorder_addOrUpdateSearchableItems_bundleID_withCompletion___block_invoke;
    v59[3] = &unk_1E26E6E68;
    v60 = v22;
    v23 = v22;
    objc_msgSend(v7, "_pas_filteredArrayWithTest:", v59);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v23;
    goto LABEL_12;
  }
  v45 = v7;
LABEL_14:
  if (v19 != objc_msgSend(v45, "count"))
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19 - objc_msgSend(v45, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)state = 138412802;
      *(_QWORD *)&state[4] = v25;
      *(_WORD *)&state[12] = 2112;
      *(_QWORD *)&state[14] = v26;
      *(_WORD *)&state[22] = 2112;
      v63 = v47;
      _os_log_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_INFO, "Ignoring %@ of %@ searchable items added for bundleID: %@", state, 0x20u);

    }
  }
  if (objc_msgSend(v45, "count"))
  {
    v27 = self;
    if (self && self->_recorder)
    {
      context = (void *)MEMORY[0x193FEE914]();
      -[_CDSpotlightItemRecorder getUserNameOfDonator](self);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v45, "count"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      obj = v45;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      if (!v29)
        goto LABEL_34;
      v30 = *(_QWORD *)v56;
      while (1)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v56 != v30)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          +[_CDSpotlightItemUtils interactionForSearchableItem:nsUserName:](_CDSpotlightItemUtils, "interactionForSearchableItem:nsUserName:", v32, v28, context);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            objc_msgSend(v48, "addObject:", v33);
            +[_CDConstants mobileMessagesBundleId]();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v47, "isEqualToString:", v34))
            {
              v35 = objc_msgSend(v33, "isGroupChat");

              if (!v35)
                goto LABEL_32;
              +[_CDSpotlightItemUtils interactionForSearchableItem:nsUserName:](_CDSpotlightItemUtils, "interactionForSearchableItem:nsUserName:", v32, v28);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "uniqueIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              +[_CDConstants contactsAutocompleteBundleId]();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              +[_CDSpotlightItemUtils interactionUUIDForSearchableItemWithUID:bundleID:](_CDSpotlightItemUtils, "interactionUUIDForSearchableItemWithUID:bundleID:", v36, v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setUuid:", v38);

              +[_CDConstants contactsAutocompleteBundleId]();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setBundleId:", v39);

              if (v34)
                objc_msgSend(v48, "addObject:", v34);
            }

          }
LABEL_32:

        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
        if (!v29)
        {
LABEL_34:

          -[_CDSpotlightItemRecorder _addOrUpdateCoreDuetInteractions:bundleID:]((uint64_t)self, v48, v47);
          objc_autoreleasePoolPop(context);
          v27 = self;
          break;
        }
      }
    }
    *(_QWORD *)state = 0;
    *(_QWORD *)&state[8] = state;
    *(_QWORD *)&state[16] = 0x2020000000;
    LODWORD(v63) = 0;
    LODWORD(v63) = -[_CDSpotlightItemRecorder getUidOfDonator](v27);
    v40 = (void *)MEMORY[0x193FEE914]();
    batchExecutionSourceQueue = self->_batchExecutionSourceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79___CDSpotlightItemRecorder_addOrUpdateSearchableItems_bundleID_withCompletion___block_invoke_525;
    block[3] = &unk_1E26E6E40;
    v50 = v45;
    v51 = v47;
    v52 = self;
    v54 = state;
    v53 = v43;
    dispatch_sync(batchExecutionSourceQueue, block);

    objc_autoreleasePoolPop(v40);
    _Block_object_dispose(state, 8);
  }
  else if (v43)
  {
    (*((void (**)(id, uint64_t, _QWORD))v43 + 2))(v43, 1, 0);
  }

}

- (void)addUserAction:(id)a3 withItem:(id)a4
{
  -[_CDSpotlightItemRecorder addUserAction:withItem:withCompletion:](self, "addUserAction:withItem:withCompletion:", a3, a4, 0);
}

- (void)_cacheUserActivity:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    if (v4)
    {
      v11 = v3;
      objc_msgSend(v3, "source");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "source");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "itemID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addSourceID:bundleID:itemID:", v6, v8, v10);

      v3 = v11;
    }
  }

}

- (void)addUserAction:(id)a3 withItem:(id)a4 withCompletion:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *activityRateLimiterQueue;
  id v23;
  id v24;
  int v25;
  void *v26;
  id obj;
  unsigned int v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD block[5];
  id v36;
  void *v37;
  id v38;
  os_activity_scope_state_s *p_state;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  os_activity_scope_state_s state;
  uint64_t v46;
  char v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v8 = a4;
  v29 = a5;
  v9 = _os_activity_create(&dword_18DDBE000, "Duet: addUserAction:withItem:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(state.opaque[0]) = 138412290;
    *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v11;
    _os_log_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_INFO, "Adding user action for bundleID: %@", (uint8_t *)&state, 0xCu);

  }
  +[_CDSpotlightItemUtils knowledgeEventsForSearchableItem:userAction:](_CDSpotlightItemUtils, "knowledgeEventsForSearchableItem:userAction:", v8, v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[_CDSpotlightItemRecorder getUidOfDonator](self);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        -[_CDSpotlightItemRecorder _cacheUserActivity:]((uint64_t)self, v16);
        state.opaque[0] = 0;
        state.opaque[1] = (uint64_t)&state;
        v46 = 0x2020000000;
        v47 = 1;
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "bundleID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stream");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@_%@"), v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        activityRateLimiterQueue = self->_activityRateLimiterQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __66___CDSpotlightItemRecorder_addUserAction_withItem_withCompletion___block_invoke;
        block[3] = &unk_1E26E5E60;
        block[4] = self;
        v23 = v21;
        v36 = v23;
        v37 = v16;
        v24 = v8;
        v38 = v24;
        p_state = &state;
        dispatch_sync(activityRateLimiterQueue, block);
        v25 = *(unsigned __int8 *)(state.opaque[1] + 24);
        if (!*(_BYTE *)(state.opaque[1] + 24))
        {

          _Block_object_dispose(&state, 8);
          goto LABEL_14;
        }
        v44 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __66___CDSpotlightItemRecorder_addUserAction_withItem_withCompletion___block_invoke_532;
        v31[3] = &unk_1E26E6E90;
        v32 = v24;
        v33 = v30;
        v34 = v29;
        -[_CDSpotlightItemRecorder saveRateLimitedEvents:donatorUid:responseQueue:withCompletion:]((uint64_t)self, v26, v28, 0, v31);

        _Block_object_dispose(&state, 8);
        if (!v25)
          goto LABEL_14;
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_14:

}

- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  _BYTE v11[18];
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18DDBE000, "Duet: deleteUserActivitiesWithPersistentIdentifiers:bundleID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)v11 = 0;
  *(_QWORD *)&v11[8] = 0;
  os_activity_scope_enter(v8, (os_activity_scope_state_t)v11);
  os_activity_scope_leave((os_activity_scope_state_t)v11);

  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v6, "count");
    *(_DWORD *)v11 = 138412802;
    *(_QWORD *)&v11[4] = v6;
    *(_WORD *)&v11[12] = 1024;
    *(_DWORD *)&v11[14] = v10;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_DEFAULT, "Deleting user activies with persistent identifiers: %@, count: %u, bundleID: %@", v11, 0x1Cu);
  }

  if (v6 && objc_msgSend(v6, "count"))
    -[_CDSpotlightItemRecorder _deleteUserActivitiesWithPersistentIdentifiers:bundleID:]((uint64_t)self, v6, v7);

}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3
{
  -[_CDSpotlightItemRecorder deleteAllSearchableItemsWithBundleID:withCompletion:](self, "deleteAllSearchableItemsWithBundleID:withCompletion:", a3, 0);
}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  int v9;
  double v10;
  _PASBloomFilterForWriting *v11;
  _PASBloomFilterForWriting *calendarAddedItemsFilter;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  os_activity_scope_state_s v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.icloud.drive.fileprovider")))
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    LODWORD(v17.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v17.opaque + 4) = (uint64_t)v6;
    goto LABEL_11;
  }
  v9 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilecal"));
  if (self && v9 && self->_recorder)
  {
    LODWORD(v10) = 953267991;
    objc_msgSend(MEMORY[0x1E0D81538], "bloomFilterInMemoryWithNumberOfValuesN:errorRateP:", 13355, v10);
    v11 = (_PASBloomFilterForWriting *)objc_claimAutoreleasedReturnValue();
    calendarAddedItemsFilter = self->_calendarAddedItemsFilter;
    self->_calendarAddedItemsFilter = v11;

  }
  +[_CDConstants mobileMessagesBundleId]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "isEqualToString:", v13);

  if (v14)
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    LODWORD(v17.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v17.opaque + 4) = (uint64_t)v6;
LABEL_11:
    _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring call to delete all searchable items for %@", (uint8_t *)&v17, 0xCu);
LABEL_12:

    if (v7)
      v7[2](v7, 1, 0);
    goto LABEL_17;
  }
  v15 = _os_activity_create(&dword_18DDBE000, "Duet: deleteAllSearchableItemsWithBundleID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v15, &v17);
  os_activity_scope_leave(&v17);

  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v17.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v17.opaque + 4) = (uint64_t)v6;
    _os_log_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_DEFAULT, "Deleting searchable items with bundleID: %@", (uint8_t *)&v17, 0xCu);
  }

  -[_CDSpotlightItemRecorder deleteAllItemsWithBundleID:completion:](self, v6, v7);
LABEL_17:

}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4
{
  -[_CDSpotlightItemRecorder deleteSearchableItemsWithIdentifiers:bundleID:withCompletion:](self, "deleteSearchableItemsWithIdentifiers:bundleID:withCompletion:", a3, a4, 0);
}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _CDInteractionQuerying *recorder;
  _CDInteractionQuerying *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _CDInteractionQuerying *v36;
  _CDInteractionQuerying *v37;
  void *v38;
  id v39;
  NSObject *v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _CDSpotlightItemRecorderOperation *v64;
  _CDSpotlightItemRecorderOperation *v65;
  void *v66;
  int v67;
  _CDSpotlightItemRecorderOperation *v68;
  _CDSpotlightItemRecorderOperation *v69;
  void *v70;
  void *v71;
  int v72;
  _CDSpotlightItemRecorderOperation *v73;
  _CDSpotlightItemRecorderOperation *v74;
  void *v75;
  int v76;
  NSObject *v77;
  _BOOL4 v78;
  _CDSpotlightCoalescedDeletionManager *coalescedDeletionManager;
  void *v80;
  void *v81;
  NSObject *v82;
  id v83;
  void *v84;
  void (**v85)(id, uint64_t, _QWORD);
  id v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  id obj;
  void *v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE buf[22];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.icloud.drive.fileprovider")))
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring call to delete searchable items for %@ with %@ item identifiers", buf, 0x16u);

    }
    if (v9)
      v9[2](v9, 1, 0);
    goto LABEL_70;
  }
  v12 = _os_activity_create(&dword_18DDBE000, "Duet: deleteSearchableItemsWithIdentifiers:bundleID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  os_activity_scope_enter(v12, (os_activity_scope_state_t)buf);
  os_activity_scope_leave((os_activity_scope_state_t)buf);

  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_DEFAULT, "Deleting seachable items from %@ identifiers with bundleID: %@", buf, 0x16u);

  }
  if (self && self->_recorder)
  {
    +[_CDConstants mobileMailBundleId]();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "containsString:", v15);

    if (!v16)
    {
LABEL_52:
      v64 = objc_alloc_init(_CDSpotlightItemRecorderOperation);
      v65 = v64;
      if (v64)
        v64->_type = 1;
      -[_DKPredictionTimeline setStartDate:]((uint64_t)v64, v7);
      -[_DKSyncWindow setStartDate:]((uint64_t)v65, v8);
      -[_CDSpotlightItemRecorder submitOperation:](self, v65);
      +[_CDConstants mobilePhoneBundleId]();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v8, "isEqualToString:", v66);

      if (v67)
      {
        v68 = objc_alloc_init(_CDSpotlightItemRecorderOperation);
        v69 = v68;
        if (v68)
          v68->_type = 1;
        -[_DKPredictionTimeline setStartDate:]((uint64_t)v68, v7);
        +[_CDConstants facetimeBundleId]();
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKSyncWindow setStartDate:]((uint64_t)v69, v70);

        -[_CDSpotlightItemRecorder submitOperation:](self, v69);
      }
      +[_CDConstants mobileMessagesBundleId]();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v8, "isEqualToString:", v71);

      if (v72)
      {
        v73 = objc_alloc_init(_CDSpotlightItemRecorderOperation);
        v74 = v73;
        if (v73)
          v73->_type = 1;
        -[_DKPredictionTimeline setStartDate:]((uint64_t)v73, v7);
        +[_CDConstants contactsAutocompleteBundleId]();
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKSyncWindow setStartDate:]((uint64_t)v74, v75);

        -[_CDSpotlightItemRecorder submitOperation:](self, v74);
      }

      goto LABEL_63;
    }
    v85 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    obj = v7;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v113, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v108 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i);
          +[_CDSpotlightItemUtils interactionUUIDForSearchableItemWithUID:bundleID:](_CDSpotlightItemUtils, "interactionUUIDForSearchableItemWithUID:bundleID:", v21, v8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "addObject:", v22);
          +[_CDConstants mobileMessagesBundleId]();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v8, "isEqualToString:", v23);

          if (v24)
          {
            +[_CDConstants contactsAutocompleteBundleId]();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            +[_CDSpotlightItemUtils interactionUUIDForSearchableItemWithUID:bundleID:](_CDSpotlightItemUtils, "interactionUUIDForSearchableItemWithUID:bundleID:", v21, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v96, "addObject:", v26);
          }

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v113, 16);
      }
      while (v18);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((bundleId == %@) AND (uuid IN %@))"), v8, v96);
    v27 = objc_claimAutoreleasedReturnValue();
    recorder = self->_recorder;
    v106 = 0;
    v29 = recorder;
    v84 = (void *)v27;
    -[_CDInteractionQuerying queryInteractionsUsingPredicate:sortDescriptors:limit:error:](v29, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v27, 0, 0, &v106);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v106;

    if (v31)
    {
      +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
      v32 = objc_claimAutoreleasedReturnValue();
      v9 = v85;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[_CDSpotlightItemRecorder deleteSearchableItemsWithIdentifiers:bundleID:withCompletion:].cold.2();
    }
    else
    {
      v9 = v85;
      if (!objc_msgSend(v30, "count"))
      {
LABEL_51:
        v7 = (id)objc_msgSend(v96, "copy");

        goto LABEL_52;
      }
      v33 = (void *)MEMORY[0x1E0CB3880];
      +[_CDConstants shareSheetTargetBundleIdMail]();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "predicateWithFormat:", CFSTR("((mechanism == %@) AND (targetBundleId == %@) AND (mailShareSheetDeletionCandidate == %@))"), &unk_1E272B1B8, v34, &unk_1E272B200);
      v35 = objc_claimAutoreleasedReturnValue();

      v36 = self->_recorder;
      v105 = 0;
      v37 = v36;
      v82 = v35;
      -[_CDInteractionQuerying queryInteractionsUsingPredicate:sortDescriptors:limit:error:](v37, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v35, 0, 0, &v105);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v105;

      v83 = v39;
      if (v39)
      {
        +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          -[_CDSpotlightItemRecorder deleteSearchableItemsWithIdentifiers:bundleID:withCompletion:].cold.1();

      }
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v87 = v38;
      v91 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
      if (v91)
      {
        v89 = v8;
        v90 = *(_QWORD *)v102;
        v88 = v30;
        do
        {
          for (j = 0; j != v91; ++j)
          {
            if (*(_QWORD *)v102 != v90)
              objc_enumerationMutation(v87);
            v42 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
            v43 = (void *)MEMORY[0x193FEE914]();
            objc_msgSend(v42, "recipients");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "count");

            if (v45)
            {
              v92 = v43;
              v93 = j;
              v46 = (void *)MEMORY[0x1E0C99E60];
              v95 = v42;
              objc_msgSend(v42, "recipients");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "valueForKey:", CFSTR("identifier"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "setWithArray:", v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              v99 = 0u;
              v100 = 0u;
              v97 = 0u;
              v98 = 0u;
              v50 = v30;
              v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
              if (v51)
              {
                v52 = v51;
                v53 = *(_QWORD *)v98;
                do
                {
                  for (k = 0; k != v52; ++k)
                  {
                    if (*(_QWORD *)v98 != v53)
                      objc_enumerationMutation(v50);
                    v55 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * k);
                    v56 = (void *)MEMORY[0x193FEE914]();
                    if (objc_msgSend(v55, "direction"))
                    {
                      objc_msgSend(v55, "recipients");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      v58 = objc_msgSend(v57, "count");

                      if (v58)
                      {
                        v59 = (void *)MEMORY[0x1E0C99E60];
                        objc_msgSend(v55, "recipients");
                        v60 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v60, "valueForKey:", CFSTR("identifier"));
                        v61 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v59, "setWithArray:", v61);
                        v62 = (void *)objc_claimAutoreleasedReturnValue();

                        if (objc_msgSend(v49, "isEqualToSet:", v62))
                        {
                          objc_msgSend(v95, "uuid");
                          v63 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v96, "addObject:", v63);

                        }
                      }
                    }
                    objc_autoreleasePoolPop(v56);
                  }
                  v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
                }
                while (v52);
              }

              v30 = v88;
              v8 = v89;
              v43 = v92;
              j = v93;
            }
            objc_autoreleasePoolPop(v43);
          }
          v91 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
        }
        while (v91);
      }

      v9 = v85;
      v32 = v82;
      v31 = v83;
    }

    goto LABEL_51;
  }
LABEL_63:
  v76 = objc_msgSend(&unk_1E272C010, "containsObject:", v8);
  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v77 = objc_claimAutoreleasedReturnValue();
  v78 = os_log_type_enabled(v77, OS_LOG_TYPE_INFO);
  if (v76)
  {
    if (v78)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_18DDBE000, v77, OS_LOG_TYPE_INFO, "Deleting searchable items for bundleId: %@ using coalesced deletion path", buf, 0xCu);
    }

    coalescedDeletionManager = self->_coalescedDeletionManager;
    +[_CDSpotlightDeletionOperation deletionForEventsWithItemIdentifiers:bundleId:completion:](_CDSpotlightDeletionOperation, "deletionForEventsWithItemIdentifiers:bundleId:completion:", v7, v8, v9);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDSpotlightCoalescedDeletionManager processDeletionForOperation:](coalescedDeletionManager, "processDeletionForOperation:", v80);

  }
  else
  {
    if (v78)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_18DDBE000, v77, OS_LOG_TYPE_INFO, "Deleting searchable items for bundleId: %@ using direct deletion path", buf, 0xCu);
    }

    +[_DKQuery predicateForSpotlightEventsWithItemIdentifiers:bundleID:]((uint64_t)_DKQuery, v7, v8);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:]((uint64_t)self, v81, v9);

  }
LABEL_70:

}

- (void)deleteSearchableItemsSinceDate:(id)a3 bundleID:(id)a4
{
  -[_CDSpotlightItemRecorder deleteSearchableItemsSinceDate:bundleID:withCompletion:](self, "deleteSearchableItemsSinceDate:bundleID:withCompletion:", a3, a4, 0);
}

- (void)deleteSearchableItemsSinceDate:(id)a3 bundleID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *batchExecutionSourceQueue;
  id v17;
  id v18;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  _BYTE buf[22];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.icloud.drive.fileprovider")))
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      _CDFormattedDate(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring call to delete searchable items for %@ since date %@", buf, 0x16u);

    }
    if (v10)
      v10[2](v10, 1, 0);
  }
  else
  {
    v13 = _os_activity_create(&dword_18DDBE000, "Duet: deleteSearchableItemsSinceDate:bundleID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    os_activity_scope_enter(v13, (os_activity_scope_state_t)buf);
    os_activity_scope_leave((os_activity_scope_state_t)buf);

    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      _CDFormattedDate(v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_DEFAULT, "Deleting searchable items since date %@ with bundleID %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    batchExecutionSourceQueue = self->_batchExecutionSourceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83___CDSpotlightItemRecorder_deleteSearchableItemsSinceDate_bundleID_withCompletion___block_invoke;
    block[3] = &unk_1E26E36C0;
    v17 = v8;
    v21 = v17;
    v18 = v9;
    v22 = v18;
    objc_copyWeak(&v23, (id *)buf);
    dispatch_sync(batchExecutionSourceQueue, block);
    +[_DKQuery predicateForSpotlightEventsWithBundleID:sinceDate:]((uint64_t)_DKQuery, v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:]((uint64_t)self, v19, v10);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

- (void)startIntentDeletionForContactDeletions
{
  -[_DKContactsPrivacyMaintainer registerContactDeletionNotifications](self->_contactsPrivacyMaintainer, "registerContactDeletionNotifications");
  -[_DKContactsPrivacyMaintainer scheduleIntentsPruningXPCActivity](self->_contactsPrivacyMaintainer, "scheduleIntentsPruningXPCActivity");
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  -[_CDSpotlightItemRecorder deleteInteractionsWithIdentifiers:bundleID:protectionClass:withCompletion:](self, "deleteInteractionsWithIdentifiers:bundleID:protectionClass:withCompletion:", a3, a4, a5, 0);
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _BYTE v19[22];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_18DDBE000, "Duet: deleteInteractionsWithIdentifiers:bundleID:protectionClass:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)v19 = 0;
  *(_QWORD *)&v19[8] = 0;
  os_activity_scope_enter(v14, (os_activity_scope_state_t)v19);
  os_activity_scope_leave((os_activity_scope_state_t)v19);

  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v19 = 138412546;
    *(_QWORD *)&v19[4] = v16;
    *(_WORD *)&v19[12] = 2112;
    *(_QWORD *)&v19[14] = v11;
    _os_log_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEFAULT, "Deleting interactions from %@ identifiers with bundleID: %@", v19, 0x16u);

  }
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2AB0]) & 1) != 0
    || objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2AB8]))
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_INFO, "Request to delete items with identifiers with protectionClass A or B when in class C, D.", v19, 2u);
    }

  }
  -[_CDSpotlightItemRecorder deleteSearchableItemsWithIdentifiers:bundleID:withCompletion:](self, "deleteSearchableItemsWithIdentifiers:bundleID:withCompletion:", v10, v11, v13);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v10);
  -[objc_class pruneWithDeletedIntentIdentifiers:bundleId:](getBMLibraryStreamsPrunerClass(), "pruneWithDeletedIntentIdentifiers:bundleId:", v18, v11);

}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  -[_CDSpotlightItemRecorder deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:withCompletion:](self, "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:withCompletion:", a3, a4, a5, 0);
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  _BYTE v21[22];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_18DDBE000, "Duet: deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)v21 = 0;
  *(_QWORD *)&v21[8] = 0;
  os_activity_scope_enter(v14, (os_activity_scope_state_t)v21);
  os_activity_scope_leave((os_activity_scope_state_t)v21);

  +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v21 = 138412546;
    *(_QWORD *)&v21[4] = v10;
    *(_WORD *)&v21[12] = 2112;
    *(_QWORD *)&v21[14] = v11;
    _os_log_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEFAULT, "Deleting interactions with group identifiers %@, bundleID: %@", v21, 0x16u);
  }

  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2AB0]) & 1) != 0
    || objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2AB8]))
  {
    +[_CDLogging spotlightReceiverChannel](_CDLogging, "spotlightReceiverChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_INFO, "Request to delete items with identifiers with protectionClass A or B when in class C, D.", v21, 2u);
    }

  }
  -[_CDSpotlightItemRecorder deleteSearchableItemsWithDomainIdentifiers:bundleID:withCompletion:](self, "deleteSearchableItemsWithDomainIdentifiers:bundleID:withCompletion:", v10, v11, v13);
  +[_CDConstants mobileMessagesBundleId]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v11, "isEqualToString:", v17);

  if (v18)
  {
    +[_CDConstants contactsAutocompleteBundleId]();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDSpotlightItemRecorder deleteSearchableItemsWithDomainIdentifiers:bundleID:withCompletion:](self, "deleteSearchableItemsWithDomainIdentifiers:bundleID:withCompletion:", v10, v19, 0);

  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v10);
  -[objc_class pruneWithDeletedIntentGroupIdentifiers:bundleId:](getBMLibraryStreamsPrunerClass(), "pruneWithDeletedIntentGroupIdentifiers:bundleId:", v20, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverNotifier, 0);
  objc_storeStrong((id *)&self->_appLocationActivitySource, 0);
  objc_storeStrong((id *)&self->_appActivitySource, 0);
  objc_storeStrong((id *)&self->_intentSource, 0);
  objc_storeStrong((id *)&self->_recorder, 0);
  objc_storeStrong((id *)&self->_throttleStateByBundleId, 0);
  objc_storeStrong((id *)&self->_coalescedDeletionManager, 0);
  objc_storeStrong((id *)&self->_userActivityCache, 0);
  objc_storeStrong((id *)&self->_calendarAddedItemsFilter, 0);
  objc_storeStrong((id *)&self->_contactsPrivacyMaintainer, 0);
  objc_storeStrong((id *)&self->_privacyEnforcer, 0);
  objc_storeStrong((id *)&self->_rateLimitEnforcer, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_activityPerBundleRateLimit, 0);
  objc_storeStrong((id *)&self->_activityRateLimiterQueue, 0);
  objc_storeStrong((id *)&self->_pendingOperationsTransaction, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_pendingOperationsQueue, 0);
  objc_storeStrong((id *)&self->_batchExecutionSourceQueue, 0);
  objc_storeStrong((id *)&self->_batchExecutionSource, 0);
}

- (void)getUserNameOfDonator
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_DEBUG, "Spotlight Receiver donator UID is %u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

- (void)saveRateLimitedEvents:(uint8_t *)a1 donatorUid:(uint64_t)a2 responseQueue:(_QWORD *)a3 withCompletion:(NSObject *)a4 .cold.1(uint8_t *a1, uint64_t a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_18DDBE000, a4, OS_LOG_TYPE_ERROR, "unable to convert _CDInteractionDirection enum value: %@", a1, 0xCu);

}

- (void)saveRateLimitedEvents:(_QWORD *)a3 donatorUid:responseQueue:withCompletion:.cold.2(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, MEMORY[0x1E0C81028], (uint64_t)a3, "SpotlightRecorder trying to donate to biome with event: %@", a1);
}

- (void)donateRelevantShortcuts:(NSObject *)a3 bundleID:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_DEBUG, "Saving %@ relevant shortcuts with bundleID %@ to knowledge store", v6, 0x16u);

  OUTLINED_FUNCTION_7();
}

- (void)_deleteUserActivitiesWithPersistentIdentifiers:bundleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Delete user activities failed because the bundleID is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)deleteKnowledgeEventsMatchingPredicate:(NSObject *)a3 withCompletion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "cd_sanitizeForLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "Failed to delete knowledge events with predicate %{private}@. Error = %{public}@.", v6, 0x16u);

  OUTLINED_FUNCTION_7();
}

- (void)deleteSearchableItemsWithIdentifiers:bundleID:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error retrieving share sheet interactions marked as mail special deletion candidates: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)deleteSearchableItemsWithIdentifiers:bundleID:withCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error retrieving mail interactions to delete by identifiers: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
