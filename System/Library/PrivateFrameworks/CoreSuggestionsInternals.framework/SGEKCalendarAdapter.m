@implementation SGEKCalendarAdapter

- (SGEKCalendarAdapter)initWithSGSqlEntityStore:(id)a3
{
  return -[SGEKCalendarAdapter initWithSGSqlEntityStore:andEKStore:](self, "initWithSGSqlEntityStore:andEKStore:", a3, 0);
}

- (SGEKCalendarAdapter)initWithSGSqlEntityStore:(id)a3 andEKStore:(id)a4
{
  id v6;
  id v7;
  SGEKCalendarAdapter *v8;
  SGEKCalendarAdapter *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _PASLazyResult *lazyEKStoreLock;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SGEKCalendarAdapter;
  v8 = -[SGEKCalendarAdapter init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_store, v6);
    if (v7)
    {
      v10 = objc_alloc(MEMORY[0x1E0D815E8]);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v7);
      v12 = objc_msgSend(v10, "initWithResult:", v11);

    }
    else
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:", &__block_literal_global_34976);
    }
    lazyEKStoreLock = v9->_lazyEKStoreLock;
    v9->_lazyEKStoreLock = (_PASLazyResult *)v12;

  }
  return v9;
}

- (void)_runWithEKEventStore:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SGEKCalendarAdapter__runWithEKEventStore___block_invoke;
  v7[3] = &unk_1E7DB7578;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "runWithWriteLockAcquired:", v7);

}

- (void)addEvent:(id)a3 commit:(BOOL)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  _QWORD v19[5];
  id v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "eventIsCancelled:", v6))
    {
      sgEventsLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:

        goto LABEL_12;
      }
      objc_msgSend(v6, "loggingIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v10;
      v11 = "SGEKCalendarAdapter addEvent: Skipping event already known to be cancelled. [SGStorageEvent (%{public}@)]";
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSince1970");
      v14 = v13;

      if ((objc_msgSend(MEMORY[0x1E0D198F0], "showPastEvents") & 1) != 0)
        goto LABEL_11;
      objc_msgSend(v6, "when");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "absoluteRange");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "end");
      v18 = v17;

      if (v14 <= v18)
      {
LABEL_11:
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __39__SGEKCalendarAdapter_addEvent_commit___block_invoke;
        v19[3] = &unk_1E7DB75A0;
        v19[4] = self;
        v20 = v6;
        v21 = v8;
        v22 = a4;
        -[SGEKCalendarAdapter _runWithEKEventStore:](self, "_runWithEKEventStore:", v19);

        goto LABEL_12;
      }
      sgEventsLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_6;
      objc_msgSend(v6, "loggingIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v10;
      v11 = "SGEKCalendarAdapter addEvent: Skipping event that has already passed. [SGStorageEvent (%{public}@)]";
    }
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);

    goto LABEL_6;
  }
LABEL_12:

}

- (void)addEvent:(id)a3
{
  -[SGEKCalendarAdapter addEvent:commit:](self, "addEvent:commit:", a3, 1);
}

- (void)addEvents:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SGEKCalendarAdapter *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__SGEKCalendarAdapter_addEvents___block_invoke;
  v6[3] = &unk_1E7DB75C8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[SGEKCalendarAdapter _runWithEKEventStore:](self, "_runWithEKEventStore:", v6);

}

- (void)_updateEvent:(id)a3 withValuesFrom:(id)a4 ekStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  BOOL v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  if (WeakRetained)
  {
    objc_msgSend(v8, "eventIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eventWithIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      sgEventsLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "eventIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "loggingIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v44 = v38;
        v45 = 2114;
        v46 = v39;
        _os_log_error_impl(&dword_1C3607000, v14, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter _updateEvent: Calendar Event missing from store for identifier: %@. [SGStorageEvent (%{public}@)]", buf, 0x16u);

      }
      goto LABEL_16;
    }
    objc_msgSend(v9, "convertToEvent:", WeakRetained);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "confirmedFieldValuesForEvent:", v9);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject mergeIntoEKEvent:withStore:preservingValuesDifferentFrom:](v14, "mergeIntoEKEvent:withStore:preservingValuesDifferentFrom:", v13, v10);
    -[SGEKCalendarAdapter _updateEventMetadataInModifiedEvent:withExistingCheckInShortcutInOriginalEvent:ifTeamIdentifierIsDifferentInStorageEvent:](self, "_updateEventMetadataInModifiedEvent:withExistingCheckInShortcutInOriginalEvent:ifTeamIdentifierIsDifferentInStorageEvent:", v13, v8, v9);
    objc_msgSend(v13, "setLocalCustomObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D19DF8]);
    objc_msgSend(v13, "structuredLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "radius");
    v17 = v16;
    objc_msgSend(v8, "structuredLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "radius");
    v20 = v19;

    if (v17 != v20)
    {
      objc_msgSend(v13, "structuredLocation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "copy");

      objc_msgSend(v8, "structuredLocation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "radius");
      objc_msgSend(v22, "setRadius:");

      objc_msgSend(v8, "structuredLocation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v22, "isEqualToLocation:", v24);

      if (v25)
      {
        objc_msgSend(v8, "structuredLocation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "radius");
        v28 = v27;
        objc_msgSend(v13, "structuredLocation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setRadius:", v28);

      }
    }
    v42 = 0;
    v30 = -[SGEKCalendarAdapter _updateEKEvent:withEvent:ekStore:error:](self, "_updateEKEvent:withEvent:ekStore:error:", v8, v13, v10, &v42);
    v31 = v42;
    sgEventsLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v30)
    {
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      objc_msgSend(v9, "loggingIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v34;
      v35 = "SGEKCalendarAdapter _updateEvent: Successfully updated event. [SGStorageEvent (%{public}@)]";
      v36 = v33;
      v37 = 12;
    }
    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "loggingIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v44 = v31;
        v45 = 2114;
        v46 = v40;
        _os_log_error_impl(&dword_1C3607000, v33, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter _updateEvent: Unable to update event: %@. [SGStorageEvent (%{public}@)]", buf, 0x16u);

      }
      sgPrivateLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        goto LABEL_15;
      objc_msgSend(v13, "description");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v44 = v34;
      v45 = 2112;
      v46 = v31;
      v35 = "SGEKCalendarAdapter _updateEKEvent: Unable to update event; description: %@, error: %@";
      v36 = v33;
      v37 = 22;
    }
    _os_log_debug_impl(&dword_1C3607000, v36, OS_LOG_TYPE_DEBUG, v35, buf, v37);

    goto LABEL_15;
  }
LABEL_17:

}

- (void)cancelEvent:(id)a3 commit:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__SGEKCalendarAdapter_cancelEvent_commit___block_invoke;
  v8[3] = &unk_1E7DB75F0;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[SGEKCalendarAdapter _runWithEKEventStore:](self, "_runWithEKEventStore:", v8);

}

- (void)cancelEvent:(id)a3
{
  -[SGEKCalendarAdapter cancelEvent:commit:](self, "cancelEvent:commit:", a3, 1);
}

- (void)cancelEvents:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SGEKCalendarAdapter *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__SGEKCalendarAdapter_cancelEvents___block_invoke;
  v6[3] = &unk_1E7DB75C8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[SGEKCalendarAdapter _runWithEKEventStore:](self, "_runWithEKEventStore:", v6);

}

- (void)confirmEventFromThisDevice:(id)a3
{
  -[SGEKCalendarAdapter _removeEvent:commit:](self, "_removeEvent:commit:", a3, 1);
}

- (void)confirmEventFromOtherDevice:(id)a3
{
  -[SGEKCalendarAdapter _removeEvent:commit:](self, "_removeEvent:commit:", a3, 1);
}

- (void)rejectEventFromThisDevice:(id)a3
{
  -[SGEKCalendarAdapter _removeEvent:commit:](self, "_removeEvent:commit:", a3, 1);
}

- (void)rejectEventFromOtherDevice:(id)a3
{
  -[SGEKCalendarAdapter _removeEvent:commit:](self, "_removeEvent:commit:", a3, 1);
}

- (void)orphanEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SGEKCalendarAdapter_orphanEvent___block_invoke;
  v6[3] = &unk_1E7DB75C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SGEKCalendarAdapter _runWithEKEventStore:](self, "_runWithEKEventStore:", v6);

}

- (id)_eventsAssociatedWithStorageEvent:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  SGEKCalendarAdapter *v34;
  SEL v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "heuristicUpdatingEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_store);
    if (WeakRetained)
    {
      objc_msgSend(v8, "eventsWithSameOpaqueKeyAsStorageEvent:harvestStore:", v7, WeakRetained);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "count"))
      {
        objc_msgSend(v8, "eventsWithSameAlternativeOpaqueKeyAsStorageEvent:harvestStore:", v7, WeakRetained);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          v29 = MEMORY[0x1E0C809B0];
          v30 = 3221225472;
          v31 = __63__SGEKCalendarAdapter__eventsAssociatedWithStorageEvent_store___block_invoke;
          v32 = &unk_1E7DB7618;
          v34 = self;
          v35 = a2;
          v33 = v7;
          sgMapAndFilter();
          v12 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v12;
        }

      }
      if (!objc_msgSend(v10, "count"))
      {
        objc_msgSend(v7, "recordId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "loadEntityByRecordId:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = (void *)objc_opt_new();
          v24 = MEMORY[0x1E0C809B0];
          v25 = 3221225472;
          v26 = __63__SGEKCalendarAdapter__eventsAssociatedWithStorageEvent_store___block_invoke_2;
          v27 = &unk_1E7DB7640;
          v16 = v15;
          v28 = v16;
          +[SGDeduper enumerateEKEventsForPseudoEventBySimilarStartAndEndTime:store:usingBlock:](SGDeduper, "enumerateEKEventsForPseudoEventBySimilarStartAndEndTime:store:usingBlock:", v14, v8, &v24);
          v17 = v16;

          if (objc_msgSend(v17, "count", v24, v25, v26, v27))
          {
            sgEventsLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v7, "loggingIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v37 = (uint64_t)v23;
              _os_log_debug_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdatper _eventsAssociatedWithStorageEvent: Located associated event based on content rather than pseudoevent key match. [SGStorageEvent (%{public}@)]", buf, 0xCu);

            }
          }

          v10 = v17;
        }

      }
      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        sgEventsLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v21 = objc_msgSend(v10, "count");
          objc_msgSend(v7, "loggingIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v37 = v21;
          v38 = 2114;
          v39 = v22;
          _os_log_debug_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdatper _eventsAssociatedWithStorageEvent: More than one matching event found (%lu). [SGStorageEvent (%{public}@)]", buf, 0x16u);

        }
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (void)_addEKEventToCalendar:(id)a3 storageEvent:(id)a4 ekStore:(id)a5 commit:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  _QWORD block[4];
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v52 = a6;
  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  sgEventsLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "loggingIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v61 = v12;
    _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter _addEKEventToCalendar: Adding event via EK. [SGEvent (%{public}@)]", buf, 0xCu);

  }
  objc_msgSend(v8, "toEKEventWithStore:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "isNaturalLanguageEvent");
  sgEventsLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  v51 = v10;
  if (v14)
  {
    if (v16)
    {
      objc_msgSend(v8, "loggingIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v61 = v42;
      _os_log_debug_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter _addEKEventToCalendar: Adding event to naturalLanguageSuggestedEventCalendar. [SGEvent (%{public}@)]", buf, 0xCu);

    }
    objc_msgSend(v10, "naturalLanguageSuggestedEventCalendar");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v16)
    {
      objc_msgSend(v8, "loggingIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v61 = v43;
      _os_log_debug_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter _addEKEventToCalendar: Adding event to suggestedEventCalendar. [SGEvent (%{public}@)]", buf, 0xCu);

    }
    objc_msgSend(v10, "suggestedEventCalendar");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  objc_msgSend(v13, "setCalendar:", v17, self);

  +[SGStructuredEventTrialClientWrapper sharedInstance](SGStructuredEventTrialClientWrapper, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "notificationsAllowListOverride");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v8;
  v21 = objc_msgSend(v8, "shouldAllowNotificationsInCalendarWithAllowListOverride:", v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLocalCustomObject:forKey:", v22, *MEMORY[0x1E0D19DF8]);

  v23 = objc_alloc(MEMORY[0x1E0CAA168]);
  v24 = v9;
  objc_msgSend(v9, "opaqueKey");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "duplicateKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "serialize");
  v26 = v13;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "duplicateKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "parentKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "messageKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "uniqueIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v23, "initWithEventStore:opaqueKey:uniqueKey:extractionGroupIdentifier:", v51, v50, v27, v31);
  objc_msgSend(v26, "setSuggestionInfo:", v32);

  objc_msgSend(v24, "creationTimestamp");
  v34 = v33;
  objc_msgSend(v26, "suggestionInfo");
  v35 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v35, "setTimestamp:", v34);

  v59 = 0;
  LOBYTE(v35) = objc_msgSend(v51, "saveEvent:span:commit:error:", v26, 0, v52, &v59);
  v36 = v59;
  sgEventsLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if ((v35 & 1) != 0)
  {
    v39 = v53;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v53, "loggingIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "eventIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v44;
      v62 = 2114;
      v63 = v45;
      _os_log_debug_impl(&dword_1C3607000, v38, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter _addEKEventToCalendar: Successfully saved event in event store. [SGEvent (%{public}@)], [EKEvent (%{public}@)]", buf, 0x16u);

    }
    if (_addEKEventToCalendar_storageEvent_ekStore_commit___pasOnceToken35 != -1)
      dispatch_once(&_addEKEventToCalendar_storageEvent_ekStore_commit___pasOnceToken35, &__block_literal_global_34_34922);
    v40 = (void *)_addEKEventToCalendar_storageEvent_ekStore_commit___pasExprOnceResult;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__SGEKCalendarAdapter__addEKEventToCalendar_storageEvent_ekStore_commit___block_invoke_2;
    block[3] = &unk_1E7DB77B0;
    v55 = v53;
    v56 = v26;
    v57 = v49;
    v58 = v24;
    v41 = v40;
    dispatch_async(v41, block);

  }
  else
  {
    v39 = v53;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v53, "loggingIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v61 = v36;
      v62 = 2114;
      v63 = v46;
      _os_log_error_impl(&dword_1C3607000, v38, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter _addEKEventToCalendar: Unable to save event in event store: %@. [SGEvent (%{public}@)]", buf, 0x16u);

    }
    sgPrivateLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v26, "description");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v61 = v47;
      v62 = 2112;
      v63 = v36;
      _os_log_debug_impl(&dword_1C3607000, v41, OS_LOG_TYPE_DEBUG, "Unable to save event in event store; description: %@, error: %@",
        buf,
        0x16u);

    }
  }

}

- (BOOL)_updateEKEvent:(id)a3 withEvent:(id)a4 ekStore:(id)a5 error:(id *)a6
{
  id v7;
  id v8;
  NSObject *v9;
  char v10;
  uint8_t v12[16];

  v7 = a4;
  v8 = a3;
  sgEventsLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter: Calling _updateEKEvent", v12, 2u);
  }

  v10 = objc_msgSend(v8, "updateEventToEvent:", v7);
  return v10;
}

- (BOOL)_cancelEKEvent:(id)a3 ekStore:(id)a4 error:(id *)a5
{
  id v5;
  NSObject *v6;
  char v7;
  uint8_t v9[16];

  v5 = a3;
  sgEventsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter: Calling _cancelEKEvent", v9, 2u);
  }

  v7 = objc_msgSend(v5, "updateEventToEvent:", 0);
  return v7;
}

- (BOOL)_isEKEventFromSuggestedCalendar:(id)a3 ekStore:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSuggestedEventCalendar");

  return v5;
}

- (BOOL)_isEKEventFromNLEventsCalendar:(id)a3 ekStore:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNaturalLanguageSuggestedEventCalendar");

  return v5;
}

- (void)_removeEvent:(id)a3 commit:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__SGEKCalendarAdapter__removeEvent_commit___block_invoke;
  v8[3] = &unk_1E7DB75F0;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[SGEKCalendarAdapter _runWithEKEventStore:](self, "_runWithEKEventStore:", v8);

}

- (void)_updateEventMetadataInModifiedEvent:(id)a3 withExistingCheckInShortcutInOriginalEvent:(id)a4 ifTeamIdentifierIsDifferentInStorageEvent:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  char v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  id v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D19818], "eventMetadataFromEKEvent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v10, "eventActivities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v56;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v56 != v14)
          objc_enumerationMutation(v11);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "type") == 1)
        {
          v16 = 1;
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      if (v13)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  objc_msgSend(MEMORY[0x1E0D19818], "eventMetadataFromEKEvent:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v17, "eventActivities");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (!v19)
  {
    v24 = 0;
    goto LABEL_37;
  }
  v20 = v19;
  v48 = v8;
  v49 = v9;
  v21 = *(_QWORD *)v52;
  while (2)
  {
    for (j = 0; j != v20; ++j)
    {
      if (*(_QWORD *)v52 != v21)
        objc_enumerationMutation(v18);
      v23 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
      if (objc_msgSend(v23, "type") == 1)
      {
        v24 = v23;

        if (v24)
          v25 = v16;
        else
          v25 = 1;
        if ((v25 & 1) != 0)
        {
          v8 = v48;
          v9 = v49;
          goto LABEL_38;
        }
        objc_msgSend(v49, "duplicateKey");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "parentKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "bundleId");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v50 = 0;
          objc_msgSend(MEMORY[0x1E0CA5870], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v28, 0, &v50);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v50;
          if (v29)
          {
LABEL_33:
            v47 = v7;
            objc_msgSend(v29, "teamIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "teamIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v31, "isEqualToString:", v32);

            if ((v33 & 1) == 0)
            {
              v44 = objc_alloc(MEMORY[0x1E0D19818]);
              v43 = objc_msgSend(v10, "type");
              objc_msgSend(v10, "categoryDescription");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "originBundleId");
              v45 = v31;
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "confidence");
              v36 = v35;
              objc_msgSend(v10, "schemaOrg");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "participants");
              v46 = v28;
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "eventActivities");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = (void *)objc_msgSend(v44, "initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:eventActivities:", v43, v42, v34, v37, v38, v39, v36);

              v28 = v46;
              v31 = v45;

              objc_msgSend(v40, "jsonObject");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setCustomObject:forKey:", v41, *MEMORY[0x1E0D19D68]);

            }
            v7 = v47;
            goto LABEL_36;
          }
        }
        else
        {
          v18 = 0;
        }
        sgLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v18;
          _os_log_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEFAULT, "SGEkCalendarAdapter: no bundle record found: %@", buf, 0xCu);
        }

        v29 = 0;
        goto LABEL_33;
      }
    }
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (v20)
      continue;
    break;
  }
  v24 = 0;
LABEL_36:
  v8 = v48;
  v9 = v49;
LABEL_37:

LABEL_38:
}

- (void)_removeEKEvent:(id)a3 store:(id)a4 commit:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v13 = 0;
  v8 = objc_msgSend(a4, "removeEvent:span:commit:error:", v7, 0, v5, &v13);
  v9 = v13;
  sgEventsLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter _removeEKEvent: Successfully removed event.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter _removeEKEvent: Unable to remove event. EKStore commit error: %@", buf, 0xCu);
    }

    sgPrivateLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v9;
      _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "SGEKCalendar _removeEKEvent: AdapterUnable to remove event; description: %@, error: %@",
        buf,
        0x16u);

    }
  }

}

- (SGSqlEntityStore)store
{
  return (SGSqlEntityStore *)objc_loadWeakRetained((id *)&self->_store);
}

- (void)setStore:(id)a3
{
  objc_storeWeak((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_lazyEKStoreLock, 0);
}

void __43__SGEKCalendarAdapter__removeEvent_commit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_eventsAssociatedWithStorageEvent:store:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "calendar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isSuggestedEventCalendar"))
        {

        }
        else
        {
          objc_msgSend(v9, "calendar");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isNaturalLanguageSuggestedEventCalendar");

          if (!v12)
            continue;
        }
        objc_msgSend(*(id *)(a1 + 32), "_removeEKEvent:store:commit:", v9, v3, *(unsigned __int8 *)(a1 + 48));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

void __73__SGEKCalendarAdapter__addEKEventToCalendar_storageEvent_ekStore_commit___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isNaturalLanguageEvent"))
  {
    objc_msgSend(MEMORY[0x1E0D198B8], "recordInteractionForEventWithInterface:actionType:harvestedEKEvent:curatedEKEvent:", 0, 1, *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 16));
    objc_msgSend(*(id *)(a1 + 56), "recordId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "loadEntityByRecordId:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventInteractionForEntity:interface:actionType:", v5, 0, 1);

  }
}

void __73__SGEKCalendarAdapter__addEKEventToCalendar_storageEvent_ekStore_commit___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "_addEKEventToCalendar", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_addEKEventToCalendar_storageEvent_ekStore_commit___pasExprOnceResult;
  _addEKEventToCalendar_storageEvent_ekStore_commit___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __63__SGEKCalendarAdapter__eventsAssociatedWithStorageEvent_store___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  SGPseudoEventKey *v9;
  void *v10;
  void *v11;
  SGPseudoEventKey *v12;
  id v13;
  void *v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "duplicateKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pseudoEventKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDropoff");

  if (v6)
  {
    objc_msgSend(v3, "suggestionInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "opaqueKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("SGEKCalendarAdapter.m"), 387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("foundEvent.suggestionInfo.opaqueKey"));

    }
    v9 = [SGPseudoEventKey alloc];
    objc_msgSend(v3, "suggestionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "opaqueKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SGPseudoEventKey initWithSerialized:](v9, "initWithSerialized:", v11);

    if (-[SGPseudoEventKey isDropoff](v12, "isDropoff"))
      v13 = v3;
    else
      v13 = 0;

  }
  else
  {
    v13 = v3;
  }

  return v13;
}

void __63__SGEKCalendarAdapter__eventsAssociatedWithStorageEvent_store___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "suggestionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __35__SGEKCalendarAdapter_orphanEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_eventsAssociatedWithStorageEvent:store:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v4;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = v6;
      v20 = v3;
      obj = v5;
      v19 = v4;
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v10, "suggestionInfo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uniqueKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "duplicateKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "serialize");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "isEqualToString:", v14);

          if (v15)
          {
            if ((objc_msgSend(*(id *)(a1 + 32), "_isEKEventFromSuggestedCalendar:ekStore:", v10, v20) & 1) != 0
              || objc_msgSend(*(id *)(a1 + 32), "_isEKEventFromNLEventsCalendar:ekStore:", v10, v20))
            {
              objc_msgSend(*(id *)(a1 + 32), "_removeEKEvent:store:commit:", v10, v20, 1);
            }
            else
            {
              sgEventsLogHandle();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v28 = v17;
                _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter orphanEvent: Orphaned event is on a curated calendar; not removing. [SGStorageEvent (%{public}@)]",
                  buf,
                  0xCu);

              }
            }
          }
        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
      v3 = v20;
      v5 = obj;
      v4 = v19;
    }
  }
  else
  {
    sgEventsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v18;
      _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter orphanEvent: No existing event found. [SGStorageEvent (%{public}@)]", buf, 0xCu);

    }
  }

}

void __36__SGEKCalendarAdapter_cancelEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "cancelEvent:commit:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8++), 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v6);
  }

  v18 = 0;
  v9 = objc_msgSend(v3, "commit:", &v18);
  v10 = v18;
  sgEventsLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("loggingIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_pas_componentsJoinedByString:", CFSTR(","));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter cancelEvents: Successfully removed events. [SGStorageEvent (%{public}@)]", buf, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("loggingIdentifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_pas_componentsJoinedByString:", CFSTR(","));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      v25 = 2114;
      v26 = v16;
      _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter cancelEvents: Unable to remove events. EKStore commit error: %@. [SGStorageEvent (%{public}@)]", buf, 0x16u);

    }
    sgPrivateLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      v25 = 2112;
      v26 = v10;
      _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "Unable to remove events; description: %@, error: %@",
        buf,
        0x16u);

    }
  }

}

void __42__SGEKCalendarAdapter_cancelEvent_commit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_eventsAssociatedWithStorageEvent:store:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = v4;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v6)
    {
      v7 = v6;
      v28 = v4;
      v8 = *(_QWORD *)v32;
      v29 = *MEMORY[0x1E0D19DF8];
      while (1)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
          if ((objc_msgSend(*(id *)(a1 + 32), "_isEKEventFromSuggestedCalendar:ekStore:", v10, v3) & 1) != 0
            || objc_msgSend(*(id *)(a1 + 32), "_isEKEventFromNLEventsCalendar:ekStore:", v10, v3))
          {
            objc_msgSend(*(id *)(a1 + 32), "_removeEKEvent:store:commit:", v10, v3, *(unsigned __int8 *)(a1 + 48));
            goto LABEL_10;
          }
          objc_msgSend(*(id *)(a1 + 40), "tags");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D197F0], "naturalLanguageEvent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "containsObject:", v12);

          if (!v13)
          {
            objc_msgSend(v10, "setLocalCustomObject:forKey:", MEMORY[0x1E0C9AAA0], v29);
            v15 = *(void **)(a1 + 32);
            v30 = 0;
            v16 = objc_msgSend(v15, "_cancelEKEvent:ekStore:error:", v10, v3, &v30);
            v17 = v30;
            sgEventsLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if ((v16 & 1) != 0)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v36 = v20;
                v21 = v19;
                v22 = "SGEKCalendarAdapter _updateEvent: Successfully Removed event in a curated calendar. [SGStorageEvent (%{public}@)]";
                v23 = 12;
                goto LABEL_24;
              }
            }
            else
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v36 = v17;
                v37 = 2114;
                v38 = v25;
                _os_log_error_impl(&dword_1C3607000, v19, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter _updateEvent: Unable to save event cancellation: %@. [SGStorageEvent (%{public}@)]", buf, 0x16u);

              }
              sgPrivateLogHandle();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v10, "description");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v36 = v20;
                v37 = 2112;
                v38 = v17;
                v21 = v19;
                v22 = "SGEKCalendarAdapter _updateEvent: Unable to save event cancellation; description: %@, error: %@";
                v23 = 22;
LABEL_24:
                _os_log_debug_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEBUG, v22, buf, v23);

              }
            }

            goto LABEL_10;
          }
          sgEventsLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v36 = v24;
            _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter cancelEvent: NL Event cancelled. [SGStorageEvent (%{public}@)]", buf, 0xCu);

          }
LABEL_10:
          ++v9;
        }
        while (v7 != v9);
        v26 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        v7 = v26;
        if (!v26)
        {
          v4 = v28;
          break;
        }
      }
    }
  }
  else
  {
    sgEventsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v27;
      _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter cancelEvent: No existing event found. [SGStorageEvent (%{public}@)]", buf, 0xCu);

    }
  }

}

void __33__SGEKCalendarAdapter_addEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "addEvent:commit:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8++), 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v6);
  }

  v14 = 0;
  v9 = objc_msgSend(v3, "commit:", &v14);
  v10 = v14;
  sgEventsLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter addEvents: Successfully saved events in event store", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGEKCalendarAdapter addEvents: Unable to save events in event store. EKStore commit error: %@", buf, 0xCu);
    }

    sgPrivateLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v13;
      v21 = 2112;
      v22 = v10;
      _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "SGEKCalendarAdapter addEvents: Unable to save events in event store; description: %@, error: %@",
        buf,
        0x16u);

    }
  }

}

void __39__SGEKCalendarAdapter_addEvent_commit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  int v52;
  NSObject *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_eventsAssociatedWithStorageEvent:store:", *(_QWORD *)(a1 + 40), v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "tags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "naturalLanguageEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (!v7)
  {
LABEL_29:
    if (objc_msgSend(v4, "count"))
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v13 = v4;
      v32 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      if (v32)
      {
        v34 = v32;
        v35 = *(_QWORD *)v57;
        *(_QWORD *)&v33 = 138543362;
        v55 = v33;
        while (2)
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v57 != v35)
              objc_enumerationMutation(v13);
            v37 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            objc_msgSend(v37, "suggestionInfo", v55, (_QWORD)v56);
            v38 = objc_claimAutoreleasedReturnValue();
            if (!v38
              || (v39 = (void *)v38,
                  objc_msgSend(v37, "suggestionInfo"),
                  v40 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v40, "timestamp"),
                  v42 = v41,
                  v40,
                  v39,
                  v42 == 0.0))
            {
              sgEventsLogHandle();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v55;
                v72 = v50;
                _os_log_impl(&dword_1C3607000, v49, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter addEvent: Skipping event-associated-with-storage-event with missing suggestionInfo. [SGStorageEvent (%{public}@)]", buf, 0xCu);

              }
              goto LABEL_48;
            }
            objc_msgSend(v37, "suggestionInfo");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "timestamp");
            v45 = v44;

            objc_msgSend(*(id *)(a1 + 40), "creationTimestamp");
            if (v46 <= v45)
            {
              sgEventsLogHandle();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v55;
                v72 = v48;
                _os_log_impl(&dword_1C3607000, v47, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter addEvent: Skipping event which is not more recent than preexisting EKEvent. [SGStorageEvent (%{public}@)]", buf, 0xCu);

              }
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "_updateEvent:withValuesFrom:ekStore:", v37, *(_QWORD *)(a1 + 40), v3);
            }
          }
          v34 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
          if (v34)
            continue;
          break;
        }
      }
LABEL_48:
      v4 = v13;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "convertToEvent:", *(_QWORD *)(a1 + 48));
      v13 = objc_claimAutoreleasedReturnValue();
      +[SGSuggestHistory sharedSuggestHistory](SGSuggestHistory, "sharedSuggestHistory");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "isValidNewEvent:", v13);

      if (v52)
        objc_msgSend(*(id *)(a1 + 32), "_addEKEventToCalendar:storageEvent:ekStore:commit:", v13, *(_QWORD *)(a1 + 40), v3, *(unsigned __int8 *)(a1 + 56));
    }
    goto LABEL_54;
  }
  objc_msgSend(*(id *)(a1 + 40), "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    sgEventsLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v19;
      _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter addEvent: Skipping NLEvent with empty title. [SGStorageEvent (%{public}@)]", buf, 0xCu);

    }
    goto LABEL_54;
  }
  objc_msgSend(*(id *)(a1 + 40), "duplicateKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parentKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "entityType");

  if (v12 != 13)
  {
LABEL_20:
    v13 = objc_opt_new();
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v4 = v4;
    v24 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v61;
      while (2)
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v61 != v26)
            objc_enumerationMutation(v4);
          v28 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
          objc_msgSend(v28, "calendar");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isNaturalLanguageSuggestedEventCalendar");

          if (!v30)
          {
            sgEventsLogHandle();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v72 = v54;
              _os_log_impl(&dword_1C3607000, v53, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter addEvent: Skipping NL Event with associated event in EKEventStore. [SGStorageEvent (%{public}@)]", buf, 0xCu);

            }
            goto LABEL_54;
          }
          -[NSObject addObject:](v13, "addObject:", v28);
        }
        v25 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        if (v25)
          continue;
        break;
      }
    }

    v31 = -[NSObject copy](v13, "copy");
    v4 = (id)v31;
    goto LABEL_29;
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "tags");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (!v14)
  {
LABEL_19:

    goto LABEL_20;
  }
  v15 = v14;
  v16 = *(_QWORD *)v65;
LABEL_6:
  v17 = 0;
  while (1)
  {
    if (*(_QWORD *)v65 != v16)
      objc_enumerationMutation(v13);
    v18 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v17);
    if (objc_msgSend(v18, "isNaturalLanguageEventAttributes"))
      break;
    if (v15 == ++v17)
    {
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      if (v15)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  objc_msgSend(v18, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "longLongValue");

  if ((v21 & 0x20) != 0)
    goto LABEL_19;
  sgEventsLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "loggingIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v72 = v23;
    _os_log_impl(&dword_1C3607000, v22, OS_LOG_TYPE_DEFAULT, "SGEKCalendarAdapter addEvent: Skipping NLEvent that is not status Confirmed. [SGStorageEvent (%{public}@)]", buf, 0xCu);

  }
LABEL_54:

}

void __44__SGEKCalendarAdapter__runWithEKEventStore___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "result");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runWithLockAcquired:", *(_QWORD *)(a1 + 40));

}

id __59__SGEKCalendarAdapter_initWithSGSqlEntityStore_andEKStore___block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0D815F0]);
  objc_msgSend(MEMORY[0x1E0CAA078], "sg_newStore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithGuardedData:", v1);

  return v2;
}

@end
