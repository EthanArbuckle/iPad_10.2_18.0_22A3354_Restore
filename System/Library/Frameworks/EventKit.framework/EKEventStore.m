@implementation EKEventStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriSuggestionsAllDayAlarmOffset, 0);
  objc_storeStrong((id *)&self->_siriSuggestionsTimedAlarmOffset, 0);
  objc_storeStrong((id *)&self->_defaultAllDayAlarm, 0);
  objc_storeStrong((id *)&self->_defaultTimedAlarm, 0);
  objc_storeStrong((id *)&self->_eventSourceIDToReminderSourceIDMapping, 0);
  objc_storeStrong((id *)&self->_reminderSourceIDToEventSourceIDMapping, 0);
  objc_storeStrong((id *)&self->_reminderStore, 0);
  objc_storeStrong((id *)&self->_registeredObjects, 0);
  objc_storeStrong((id *)&self->__cachedNotificationCollections, 0);
  objc_storeStrong((id *)&self->__cachedConstraints, 0);
  objc_storeStrong((id *)&self->__cachedDefaultConstraints, 0);
  objc_storeStrong((id *)&self->_dataProtectionObserver, 0);
  objc_storeStrong((id *)&self->_notificationCollectionCacheQueue, 0);
  objc_storeStrong((id *)&self->_constraintsCacheQueue, 0);
  objc_storeStrong((id *)&self->_dbChangedQueue, 0);
  objc_storeStrong((id *)&self->_unsavedChangesQueue, 0);
  objc_storeStrong((id *)&self->_registeredQueue, 0);
  objc_storeStrong((id *)&self->_calendarSourcesAndDefaultsQueue, 0);
  objc_storeStrong((id *)&self->_lastDatabaseNotificationTimestamp, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_objectsPendingSave, 0);
  objc_storeStrong((id *)&self->_uncommittableObjects, 0);
  objc_storeStrong((id *)&self->_updatedObjects, 0);
  objc_storeStrong((id *)&self->_deletedObjects, 0);
  objc_storeStrong((id *)&self->_insertedObjects, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_lastSequenceToken, 0);
  objc_storeStrong((id *)&self->_deletedEventUniqueIdentifiersCache, 0);
  objc_storeStrong((id *)&self->_notificationAccumulatingQueue, 0);
  objc_storeStrong((id *)&self->_asynchronousSearchQueue, 0);
  objc_storeStrong((id *)&self->_authStatusChecker, 0);
  objc_storeStrong((id *)&self->_showCompletedRemindersNumber, 0);
  objc_storeStrong((id *)&self->_showDeclinedEventsNumber, 0);
  objc_storeStrong((id *)&self->_defaultAllDayAlarmOffset, 0);
  objc_storeStrong((id *)&self->_defaultTimedAlarmOffset, 0);
  objc_storeStrong((id *)&self->_databaseWaitTimestamps, 0);
  objc_storeStrong((id *)&self->_databaseWaitCallbacks, 0);
  objc_storeStrong((id *)&self->_rebaseTempObjectIDReverseMap, 0);
  objc_storeStrong((id *)&self->_lastCommitTempToPermanentObjectIDMap, 0);
  objc_storeStrong((id *)&self->_eventsNeedsGeocoding, 0);
  objc_storeStrong((id *)&self->_objectsPendingCommit, 0);
  objc_storeStrong((id *)&self->_pendingIntegrationEvents, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_cachedValidatedAddresses, 0);
  objc_storeStrong((id *)&self->_calendarsByIdentifier, 0);
  objc_storeStrong((id *)&self->_personaIDByDatabaseID, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
  objc_storeStrong((id *)&self->_subscribedCalendarsSourceID, 0);
  objc_storeStrong((id *)&self->_naturalLanguageSuggestedEventCalendarID, 0);
  objc_storeStrong((id *)&self->_suggestedEventCalendarID, 0);
  objc_storeStrong((id *)&self->_defaultCalendarsForNewEventsIDBySourceID, 0);
  objc_storeStrong((id *)&self->_birthdaySourceID, 0);
  objc_storeStrong((id *)&self->_initializationOptions, 0);
}

void __81__EKEventStore_registerFetchedObjectWithID_withDefaultLoadedPropertyKeys_values___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_addFetchedObjectWithID:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)_addFetchedObjectWithID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_msgSend(v6, "classForEntityName:", v7);

  if (!v8)
  {
    v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT))
      -[EKEventStore _addFetchedObjectWithID:].cold.1(v9, v5);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKEventStore.m"), 6609, CFSTR("Unknown entity name %@ for objectID: %@ with entity type: %d"), v11, v5, objc_msgSend(v5, "entityType"));

  }
  v12 = objc_alloc_init(v8);
  -[EKEventStore database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setObjectID:inDatabaseRestoreGeneration:", v5, objc_msgSend(v13, "databaseRestoreGeneration"));

  -[EKEventStore _registerObjectImmediate:](self, "_registerObjectImmediate:", v12);
  return v12;
}

- (EKDaemonConnection)database
{
  return self->_database;
}

+ (Class)classForEntityName:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = classForEntityName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&classForEntityName__onceToken, &__block_literal_global_77);
  objc_msgSend((id)classForEntityName__sClassMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (void)_registerObjectImmediate:(id)a3
{
  void *v5;
  void *v6;
  NSMutableDictionary *registeredObjects;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKEventStore.m"), 6513, CFSTR("Object is not an EKPersistentObject"));

  }
  objc_msgSend(v10, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[EKObjectID temporaryObjectIDWithEntityType:](EKObjectID, "temporaryObjectIDWithEntityType:", objc_msgSend(v10, "entityType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setObjectID:inDatabaseRestoreGeneration:", v6, 0xFFFFFFFFLL);

  }
  registeredObjects = self->_registeredObjects;
  objc_msgSend(v10, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](registeredObjects, "setObject:forKey:", v10, v8);

  objc_msgSend(v10, "_setEventStore:", self);
}

- (id)publicObjectWithPersistentObject:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "meltedClass")), "initWithPersistentObject:", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKEventStore.m"), 6683, CFSTR("Object is not an EKObject"));

  }
  return v6;
}

void __60__EKEventStore_defaultCalendarForNewEventsInDelegateSource___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, int, void *);
  void *v17;
  uint64_t v18;
  id v19;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_opt_new();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CADOperationProxySync");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __60__EKEventStore_defaultCalendarForNewEventsInDelegateSource___block_invoke_2;
    v17 = &unk_1E47887A0;
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 32);
    v19 = v9;
    objc_msgSend(v8, "CADDatabaseGetDefaultCalendarForNewEventsInDelegateSource:withReply:", v10, &v14);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40), v14, v15, v16, v17, v18);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

void __44__EKEventStore_insertSuggestedEventCalendar__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "CADDatabaseInsertSuggestedEventCalendarWithReply:", &__block_literal_global_321);

}

- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5 loadDefaultProperties:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    _NSMethodExceptionProem();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "raise:format:", v21, CFSTR("%@: startDate is nil"), v22);

    if (v11)
      goto LABEL_3;
  }
  v23 = (void *)MEMORY[0x1E0C99DA0];
  v24 = *MEMORY[0x1E0C99778];
  _NSMethodExceptionProem();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "raise:format:", v24, CFSTR("%@: endDate is nil"), v25);

LABEL_3:
  v26 = v11;
  restrictDateRange(v10, &v26);
  v13 = v26;

  +[EKEventStore calendarObjectIDsForPredicate:](EKEventStore, "calendarObjectIDsForPredicate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v15 = _predicatePropertyLoadMode;
  else
    v15 = 0;
  v16 = (void *)MEMORY[0x1E0D0A078];
  -[EKEventStore timeZone](self, "timeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateWithStartDate:endDate:timeZone:calendars:propertyLoadMode:", v10, v13, v17, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)calendarObjectIDsForPredicate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  id v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    v4 = 0;
    goto LABEL_18;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v6)
    goto LABEL_15;
  v7 = v6;
  v17 = v3;
  v8 = 0;
  v9 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_msgSend(v11, "backingObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v11, "CADObjectID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v14);

      }
      else
      {
        v8 = 1;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v7);

  if ((v8 & 1) == 0)
  {
    v3 = v17;
    goto LABEL_18;
  }
  v3 = v17;
  if (!objc_msgSend(v4, "count"))
  {
    v15 = objc_alloc(MEMORY[0x1E0D0BAF8]);
    v5 = (id)objc_msgSend(v15, "initWithEntityType:entityID:databaseID:", 1, 0x80000000, *MEMORY[0x1E0D0BE78]);
    objc_msgSend(v4, "addObject:", v5);
LABEL_15:

  }
LABEL_18:

  return v4;
}

- (id)occurrenceCacheGetOccurrenceCountsForCalendars:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__23;
  v27 = __Block_byref_object_dispose__23;
  v28 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "CADObjectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v7);
  }

  -[EKEventStore connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CADOperationProxySync");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__EKEventStore_occurrenceCacheGetOccurrenceCountsForCalendars___block_invoke;
  v16[3] = &unk_1E4786AF0;
  v13 = v5;
  v17 = v13;
  v18 = &v23;
  objc_msgSend(v12, "CADOccurrenceCacheGetOccurrenceCountsForCalendars:reply:", v13, v16);

  v14 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v14;
}

- (id)eventForObjectID:(id)a3 occurrenceDate:(id)a4 checkValid:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  EKEvent *v15;
  EKEvent *v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v8 && objc_msgSend(v8, "entityType") == 2)
  {
    if (v5)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      -[EKEventStore database](self, "database");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "CADObjectIDWithGeneration:", objc_msgSend(v10, "databaseRestoreGeneration"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKEventStore connection](self, "connection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "CADOperationProxySync");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __59__EKEventStore_eventForObjectID_occurrenceDate_checkValid___block_invoke;
      v18[3] = &unk_1E4787938;
      v18[4] = &v19;
      objc_msgSend(v13, "CADObjectExists:reply:", v11, v18);

      if (*((_BYTE *)v20 + 24))
      {
        -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

      _Block_object_dispose(&v19, 8);
      if (!v14)
        goto LABEL_13;
    }
    else
    {
      -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
LABEL_13:
        v16 = 0;
        goto LABEL_14;
      }
    }
    v16 = -[EKEvent initWithPersistentObject:occurrenceDate:]([EKEvent alloc], "initWithPersistentObject:occurrenceDate:", v14, v9);
LABEL_14:
    v15 = v16;

    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKEventStore eventForObjectID:occurrenceDate:checkValid:].cold.1();
  v15 = 0;
LABEL_15:

  return v15;
}

- (id)registerFetchedObjectWithID:(id)a3 withDefaultLoadedPropertyKeys:(id)a4 values:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *registeredQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__23;
  v22 = __Block_byref_object_dispose__23;
  v23 = 0;
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__EKEventStore_registerFetchedObjectWithID_withDefaultLoadedPropertyKeys_values___block_invoke;
  block[3] = &unk_1E4785298;
  v17 = &v18;
  block[4] = self;
  v12 = v8;
  v16 = v12;
  dispatch_sync(registeredQueue, block);
  if (v9 && v10)
    objc_msgSend((id)v19[5], "takeValuesForDefaultPropertyKeys:values:", v9, v10);
  v13 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (id)registerFetchedObjectWithID:(id)a3
{
  return -[EKEventStore registerFetchedObjectWithID:withDefaultLoadedPropertyKeys:values:](self, "registerFetchedObjectWithID:withDefaultLoadedPropertyKeys:values:", a3, 0, 0);
}

- (id)occurrenceCacheGetOccurrencesForCalendars:(id)a3 onDay:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__23;
  v30 = __Block_byref_object_dispose__23;
  v31 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "CADObjectID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v10);
  }

  -[EKEventStore connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "CADOperationProxySync");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __64__EKEventStore_occurrenceCacheGetOccurrencesForCalendars_onDay___block_invoke;
  v19[3] = &unk_1E4786AF0;
  v16 = v8;
  v20 = v16;
  v21 = &v26;
  objc_msgSend(v15, "CADOccurrenceCacheGetOccurrencesForCalendars:onDay:reply:", v16, v7, v19);

  v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

- (EKDaemonConnection)connection
{
  return self->_database;
}

- (NSTimeZone)timeZone
{
  NSTimeZone *timeZone;

  timeZone = self->_timeZone;
  if (timeZone)
    return (NSTimeZone *)(id)-[NSTimeZone copy](timeZone, "copy");
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  return (NSTimeZone *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __31__EKEventStore_delegateSources__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDelegate");
}

- (id)calendarsForEntityType:(unint64_t)a3 inSource:(id)a4
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *calendarSourcesAndDefaultsQueue;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[5];
  id v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (a3 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKEventStore.m"), 2646, CFSTR("Invalid entity type passed"));

LABEL_3:
    if ((objc_msgSend(v8, "allowsTasks") & 1) != 0)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      if (a3 == 1 && -[EKEventStore returnReminderResults](self, "returnReminderResults"))
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        -[EKReminderStore calendars](self->_reminderStore, "calendars", 0);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
              objc_msgSend(v15, "source");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqual:", v8);

              if (v17)
                objc_msgSend(v9, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
          }
          while (v12);
        }
        goto LABEL_19;
      }
      goto LABEL_21;
    }
LABEL_20:
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (a3)
    goto LABEL_3;
  if ((objc_msgSend(v7, "allowsEvents") & 1) == 0)
    goto LABEL_20;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (-[EKEventStore returnEventResults](self, "returnEventResults"))
  {
    objc_msgSend(v8, "backingObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__EKEventStore_calendarsForEntityType_inSource___block_invoke;
    block[3] = &unk_1E4785400;
    block[4] = self;
    v27 = v18;
    v9 = v9;
    v28 = v9;
    v10 = v18;
    dispatch_sync(calendarSourcesAndDefaultsQueue, block);

LABEL_19:
  }
LABEL_21:

  return v9;
}

- (id)cachedConstraintsForCalendar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (-[EKEventStore eventAccessLevel](self, "eventAccessLevel") != 1 || !objc_msgSend(v4, "allowEvents"))
  {
    objc_msgSend(v4, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore cachedConstraintsForSource:](self, "cachedConstraintsForSource:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v5 = (void *)v7;

    goto LABEL_9;
  }
  if (!objc_msgSend(v4, "isNew"))
  {
    objc_msgSend(v4, "CADObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore cachedConstraintsForEventOrSourceWithCADObjectID:](self, "cachedConstraintsForEventOrSourceWithCADObjectID:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT))
    -[EKEventStore cachedConstraintsForCalendar:].cold.1();
  v5 = 0;
LABEL_9:

  return v5;
}

- (NSArray)calendarsForEntityType:(EKEntityType)entityType
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (entityType >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKEventStore.m"), 2620, CFSTR("Invalid entity type passed"));

  }
  -[EKEventStore _allCalendars](self, "_allCalendars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        if (entityType == EKEntityTypeReminder)
        {
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "allowedEntityTypes", (_QWORD)v20) & 2) != 0)
          {
            objc_msgSend(v12, "source");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "allowsTasks");

            if (v16)
LABEL_15:
              objc_msgSend(v6, "addObject:", v12, (_QWORD)v20);
          }
        }
        else if (entityType == EKEntityTypeEvent
               && (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "allowedEntityTypes") & 1) != 0)
        {
          objc_msgSend(v12, "source");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "allowsEvents");

          if ((v14 & 1) != 0)
            goto LABEL_15;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return (NSArray *)v6;
}

- (BOOL)accessGrantedForEntityType:(unint64_t)a3
{
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 == 1)
  {
    if (!denyAccessToReminders)
    {
      LOBYTE(v4) = -[EKAuthStatusChecker hasAccessToReminders](self->_authStatusChecker, "hasAccessToReminders");
      return v4;
    }
    goto LABEL_6;
  }
  if (a3)
  {
    v5 = EKLogHandle;
    v4 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR);
    if (!v4)
      return v4;
    -[EKEventStore accessGrantedForEntityType:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);
    goto LABEL_6;
  }
  if (denyAccessToEvents)
  {
LABEL_6:
    LOBYTE(v4) = 0;
    return v4;
  }
  LOBYTE(v4) = -[EKAuthStatusChecker eventAccessLevel](self->_authStatusChecker, "eventAccessLevel") != 0;
  return v4;
}

- (id)sourceIdentifierForEvent:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = -[EKEventStore eventAccessLevel](self, "eventAccessLevel");
  objc_msgSend(v4, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1)
  {

    if (v7)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__23;
      v19 = __Block_byref_object_dispose__23;
      v20 = 0;
      -[EKEventStore connection](self, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "CADOperationProxySync");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "CADObjectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __41__EKEventStore_sourceIdentifierForEvent___block_invoke;
      v14[3] = &unk_1E47883D0;
      v14[4] = &v15;
      objc_msgSend(v9, "CADDatabaseGetSourceIdentifierForEventWithObjectID:reply:", v10, v14);

      v11 = (id)v16[5];
      _Block_object_dispose(&v15, 8);

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    objc_msgSend(v6, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sourceIdentifier");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (int)eventAccessLevel
{
  return -[EKAuthStatusChecker eventAccessLevel](self->_authStatusChecker, "eventAccessLevel");
}

void __58__EKEventStore_Reminders__combinedReminderAndEventSources__block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  objc_msgSend(*(id *)(a1 + 32), "eventSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "returnEventResults"))
    v3 = v2 == 0;
  else
    v3 = 0;
  if (v3)
  {
    v9 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __58__EKEventStore_Reminders__combinedReminderAndEventSources__block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "reminderSources");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "returnReminderResults"))
      v5 = v4 == 0;
    else
      v5 = 0;
    if (v5)
    {
      v17 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        __58__EKEventStore_Reminders__combinedReminderAndEventSources__block_invoke_cold_2(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_combineEventSources:withReminderSources:", v2, v4);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }

}

- (NSArray)delegateSources
{
  void *v2;
  void *v3;
  void *v4;

  -[EKEventStore eventSources](self, "eventSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_204);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)cachedConstraintsForSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[EKEventStore returnEventResults](self, "returnEventResults") && objc_msgSend(v4, "allowsEvents"))
    goto LABEL_7;
  if (-[EKEventStore returnReminderResults](self, "returnReminderResults")
    && objc_msgSend(v4, "allowsTasks"))
  {
    -[EKReminderStore cachedConstraintsForSource:](self->_reminderStore, "cachedConstraintsForSource:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isPrimaryLocalSource"))
  {
LABEL_7:
    objc_msgSend(v4, "CADObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore cachedConstraintsForEventOrSourceWithCADObjectID:](self, "cachedConstraintsForEventOrSourceWithCADObjectID:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
LABEL_9:
  objc_msgSend(v4, "remAccountObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "setAllowsTasks:", 1);
  if (!v5)
  {
    v8 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore cachedConstraintsForSource:].cold.1(v8);
  }

  return v5;
}

- (id)eventSources
{
  NSObject *calendarSourcesAndDefaultsQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  if (-[EKEventStore returnEventResults](self, "returnEventResults"))
  {
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __28__EKEventStore_eventSources__block_invoke;
    v6[3] = &unk_1E47850A0;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  }
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_allCalendars
{
  NSObject *calendarSourcesAndDefaultsQueue;
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__23;
  v16 = __Block_byref_object_dispose__23;
  v17 = 0;
  if (-[EKEventStore returnEventResults](self, "returnEventResults"))
  {
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __29__EKEventStore__allCalendars__block_invoke;
    v11[3] = &unk_1E47850A0;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(calendarSourcesAndDefaultsQueue, v11);
  }
  v4 = -[EKEventStore returnReminderResults](self, "returnReminderResults");
  v5 = (void *)v13[5];
  if (v4)
  {
    -[EKReminderStore calendars](self->_reminderStore, "calendars");
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v6);

      v7 = (id)objc_msgSend((id)v13[5], "copy");
    }
    else
    {
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)MEMORY[0x1E0C9AA60];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (BOOL)returnEventResults
{
  return !CalIsReminderBridgeEnabled()
      || -[EKEventStore accessGrantedForEntityType:](self, "accessGrantedForEntityType:", 0);
}

- (BOOL)returnReminderResults
{
  int IsReminderBridgeEnabled;

  IsReminderBridgeEnabled = CalIsReminderBridgeEnabled();
  if (IsReminderBridgeEnabled)
    LOBYTE(IsReminderBridgeEnabled) = -[EKEventStore accessGrantedForEntityType:](self, "accessGrantedForEntityType:", 1);
  return IsReminderBridgeEnabled;
}

- (id)reminderSourceForEventSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[EKEventStore reminderStore](self, "reminderStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore eventSourceMap](self, "eventSourceMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0D0B820]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "sourceWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)eventSourceMap
{
  id v3;

  v3 = 0;
  -[EKEventStore getMapsWithReminderSourceMap:eventSourceMap:](self, "getMapsWithReminderSourceMap:eventSourceMap:", 0, &v3);
  return v3;
}

- (void)getMapsWithReminderSourceMap:(id *)a3 eventSourceMap:(id *)a4
{
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__11;
  v17 = __Block_byref_object_dispose__11;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__EKEventStore_Reminders__getMapsWithReminderSourceMap_eventSourceMap___block_invoke;
  v6[3] = &unk_1E4785338;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  -[EKEventStore performHoldingReminderSourceMapLock:](self, "performHoldingReminderSourceMapLock:", v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v8[5]);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

- (EKReminderStore)reminderStore
{
  return self->_reminderStore;
}

- (id)cachedConstraintsForEventOrSourceWithCADObjectID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (objc_msgSend(v4, "entityType") == 2
    && -[EKEventStore eventAccessLevel](self, "eventAccessLevel") != 1)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore cachedConstraintsForEventOrSourceWithCADObjectID:].cold.1();
    v6 = 0;
  }
  else
  {
    if (objc_msgSend(v4, "isTemporary"))
      v5 = objc_msgSend(v4, "entityType") == 2;
    else
      v5 = 0;
    if (objc_msgSend(v4, "isTemporary") && objc_msgSend(v4, "entityType") == 6)
    {
      v6 = (id)objc_opt_new();
    }
    else
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__23;
      v17 = __Block_byref_object_dispose__23;
      v18 = 0;
      -[EKEventStore constraintsCacheQueue](self, "constraintsCacheQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __65__EKEventStore_cachedConstraintsForEventOrSourceWithCADObjectID___block_invoke;
      v9[3] = &unk_1E4785428;
      v12 = v5;
      v11 = &v13;
      v9[4] = self;
      v10 = v4;
      dispatch_sync(v7, v9);

      v6 = (id)v14[5];
      _Block_object_dispose(&v13, 8);

    }
  }

  return v6;
}

- (OS_dispatch_queue)constraintsCacheQueue
{
  return self->_constraintsCacheQueue;
}

void __48__EKEventStore_calendarsForEntityType_inSource___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  EKCalendar *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_loadCalendarsIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = *MEMORY[0x1E0D0B578];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "valueForKey:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 40)))
        {
          v10 = -[EKObject initWithPersistentObject:]([EKCalendar alloc], "initWithPersistentObject:", v8);
          if ((-[EKCalendar allowedEntityTypes](v10, "allowedEntityTypes") & 1) != 0)
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __29__EKEventStore__allCalendars__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  EKCalendar *v13;
  EKCalendar *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_loadCalendarsIfNeeded");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    objc_msgSend(v2, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          v13 = [EKCalendar alloc];
          v14 = -[EKObject initWithPersistentObject:](v13, "initWithPersistentObject:", v12, (_QWORD)v15);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (void)_loadCalendarsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *calendars;
  NSMutableDictionary *v11;
  NSMutableDictionary *calendarsByIdentifier;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  int v17;
  _QWORD v18[6];
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  if (!self->_calendars)
  {
    +[EKPersistentCalendar defaultPropertiesToLoad](EKPersistentCalendar, "defaultPropertiesToLoad");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__23;
    v25 = __Block_byref_object_dispose__23;
    v26 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__23;
    v19[4] = __Block_byref_object_dispose__23;
    v20 = 0;
    -[EKEventStore connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CADOperationProxySync");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __38__EKEventStore__loadCalendarsIfNeeded__block_invoke;
    v18[3] = &unk_1E4788420;
    v18[4] = &v21;
    v18[5] = v19;
    objc_msgSend(v5, "CADDatabaseGetCalendarsWithFaultedProperties:reply:", v3, v18);

    if (v22[5])
    {
      -[EKEventStore database](self, "database");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "databaseRestoreGeneration");

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)v22[5], "count"));
      v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      calendars = self->_calendars;
      self->_calendars = v9;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)v22[5], "count"));
      v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      calendarsByIdentifier = self->_calendarsByIdentifier;
      self->_calendarsByIdentifier = v11;

      v13 = (void *)v22[5];
      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = __38__EKEventStore__loadCalendarsIfNeeded__block_invoke_234;
      v14[3] = &unk_1E4788448;
      v17 = v8;
      v14[4] = self;
      v16 = v19;
      v15 = v3;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

    }
    _Block_object_dispose(v19, 8);

    _Block_object_dispose(&v21, 8);
  }
}

void __28__EKEventStore_eventSources__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  EKSource *v11;
  EKSource *v12;
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
  objc_msgSend(*(id *)(a1 + 32), "_loadSourcesIfNeeded");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
  {
    objc_msgSend(v2, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
          v11 = [EKSource alloc];
          v12 = -[EKObject initWithPersistentObject:](v11, "initWithPersistentObject:", v10, (_QWORD)v16);
          objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v13 = objc_msgSend(v4, "copy");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

- (void)_loadSourcesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *sources;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  int v15;
  _QWORD v16[6];
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  if (!self->_sources)
  {
    +[EKPersistentSource defaultPropertiesToLoad](EKPersistentSource, "defaultPropertiesToLoad");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__23;
    v23 = __Block_byref_object_dispose__23;
    v24 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__23;
    v17[4] = __Block_byref_object_dispose__23;
    v18 = 0;
    -[EKEventStore connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CADOperationProxySync");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __36__EKEventStore__loadSourcesIfNeeded__block_invoke;
    v16[3] = &unk_1E4788420;
    v16[4] = &v19;
    v16[5] = v17;
    objc_msgSend(v5, "CADDatabaseGetSourcesWithFaultedProperties:reply:", v3, v16);

    if (v20[5])
    {
      -[EKEventStore database](self, "database");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "databaseRestoreGeneration");

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)v20[5], "count"));
      v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      sources = self->_sources;
      self->_sources = v9;

      v11 = (void *)v20[5];
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __36__EKEventStore__loadSourcesIfNeeded__block_invoke_198;
      v12[3] = &unk_1E4788448;
      v15 = v8;
      v12[4] = self;
      v14 = v17;
      v13 = v3;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

    }
    _Block_object_dispose(v17, 8);

    _Block_object_dispose(&v19, 8);
  }
}

- (id)_combineEventSources:(id)a3 withReminderSources:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EKEventStore _rebuildSourceMapsWithEventSources:reminderSources:](self, "_rebuildSourceMapsWithEventSources:reminderSources:", v6, v7);
  -[EKEventStore reminderSourceIDToEventSourceIDMapping](self, "reminderSourceIDToEventSourceIDMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    v18 = v6;
LABEL_15:
    v9 = v18;
    goto LABEL_16;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v18 = v7;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  objc_msgSend(v9, "addObjectsFromArray:", v6);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "sourceIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  v6 = v20;
LABEL_16:

  return v9;
}

- (void)_rebuildSourceMapsWithEventSources:(id)a3 reminderSources:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  NSObject *v33;
  EKEventStore *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count") && objc_msgSend(v6, "count"))
  {
    v35 = self;
    v37 = v7;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v36 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v10)
    {
      v11 = v10;
      v40 = 0;
      v12 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v14, "externalID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);
          }
          else if (objc_msgSend(v14, "isPrimaryLocalSource")
                 && objc_msgSend(v14, "isWritable"))
          {
            v16 = v14;

            v40 = v16;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      }
      while (v11);
    }
    else
    {
      v40 = 0;
    }

    v18 = objc_msgSend(v7, "count");
    v19 = objc_msgSend(v9, "count");
    if (v18 >= v19)
      v18 = v19;
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v18);
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v18);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v20 = v7;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v42 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v25, "externalID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v25, "externalID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "removeObjectForKey:", v28);

LABEL_27:
            objc_msgSend(v27, "sourceIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "sourceIdentifier");
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v30;
            if (v29)
              v32 = v30 == 0;
            else
              v32 = 1;
            if (v32)
            {
              v33 = EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413058;
                v50 = v29;
                v51 = 2112;
                v52 = v31;
                v53 = 2112;
                v54 = v27;
                v55 = 2112;
                v56 = v25;
                _os_log_error_impl(&dword_1A2318000, v33, OS_LOG_TYPE_ERROR, "Event or reminder source without ID: eventSourceID=%@, reminderSourceID=%@, eventSource=%@, reminderSource=%@", buf, 0x2Au);
              }
            }
            else
            {
              objc_msgSend(v39, "setObject:forKeyedSubscript:", v29, v30);
              objc_msgSend(v38, "setObject:forKeyedSubscript:", v31, v29);
            }

            continue;
          }
          if (!objc_msgSend(v25, "sourceType"))
          {
            v27 = v40;
            if (objc_msgSend(v25, "isWritable") && v40 != 0)
            {
              v40 = 0;
              goto LABEL_27;
            }
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
      }
      while (v22);
    }

    -[EKEventStore setReminderSourceIDToEventSourceIDMapping:](v35, "setReminderSourceIDToEventSourceIDMapping:", v39);
    -[EKEventStore setEventSourceIDToReminderSourceIDMapping:](v35, "setEventSourceIDToReminderSourceIDMapping:", v38);

    v6 = v36;
    v7 = v37;
  }
  else
  {
    v17 = MEMORY[0x1E0C9AA70];
    -[EKEventStore setReminderSourceIDToEventSourceIDMapping:](self, "setReminderSourceIDToEventSourceIDMapping:", MEMORY[0x1E0C9AA70]);
    -[EKEventStore setEventSourceIDToReminderSourceIDMapping:](self, "setEventSourceIDToReminderSourceIDMapping:", v17);
  }

}

- (void)setReminderSourceIDToEventSourceIDMapping:(id)a3
{
  objc_storeStrong((id *)&self->_reminderSourceIDToEventSourceIDMapping, a3);
}

- (void)setEventSourceIDToReminderSourceIDMapping:(id)a3
{
  objc_storeStrong((id *)&self->_eventSourceIDToReminderSourceIDMapping, a3);
}

- (id)reminderSources
{
  void *v3;

  if (-[EKEventStore returnReminderResults](self, "returnReminderResults"))
  {
    -[EKReminderStore sources](self->_reminderStore, "sources");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_cacheSourceWithCADObjectID:(id)a3 withDefaultLoadedPropertyValues:(id)a4 forKeys:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *sources;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  sources = self->_sources;
  if (sources)
  {
    -[NSMutableDictionary objectForKey:](sources, "objectForKey:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v9 || !v12)
    {
      +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventStore registerFetchedObjectWithID:withDefaultLoadedPropertyKeys:values:](self, "registerFetchedObjectWithID:withDefaultLoadedPropertyKeys:values:", v14, v10, v9);
      v15 = objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[NSMutableDictionary setObject:forKey:](self->_sources, "setObject:forKey:", v15, v8);
        v13 = (void *)v15;
      }
      else
      {
        v13 = 0;
      }
    }

  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore _cacheSourceWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:].cold.1();
  }

}

void __134__EKEventStore_eventNotificationsAfterDate_excludingUncheckedCalendars_filteredByShowsNotificationsFlag_earliestExpiringNotification___block_invoke(_QWORD *a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _UNKNOWN **v21;
  _UNKNOWN **v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _UNKNOWN **v28;
  _QWORD *v29;
  id v30;
  id v31;
  _UNKNOWN **v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id obj;
  uint64_t v38;
  id v39;
  void *v40;

  v11 = a3;
  v12 = a4;
  v39 = a5;
  v13 = a6;
  v14 = v13;
  if (a2)
  {
    v15 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __134__EKEventStore_eventNotificationsAfterDate_excludingUncheckedCalendars_filteredByShowsNotificationsFlag_earliestExpiringNotification___block_invoke_cold_1(v15);
  }
  else
  {
    v36 = v13;
    obj = a6;
    v16 = objc_msgSend(v12, "count");
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v16);
    v18 = *(_QWORD *)(a1[5] + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    if (v16)
    {
      v20 = 0;
      v21 = &off_1E4782000;
      v22 = &off_1E4782000;
      v38 = v16;
      do
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "intValue");

        objc_msgSend(v12, "objectAtIndexedSubscript:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21[410], "objectIDWithCADObjectID:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24 > 1)
        {
          v35 = (void *)objc_msgSend(objc_alloc((Class)v22[361]), "initWithType:objectID:eventStore:", v24, v26, a1[4]);
        }
        else
        {
          v27 = objc_alloc(MEMORY[0x1E0C99D68]);
          objc_msgSend(v39, "objectAtIndexedSubscript:", v20);
          v40 = v25;
          v28 = v22;
          v29 = a1;
          v30 = v12;
          v31 = v11;
          v32 = v21;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          v34 = (void *)objc_msgSend(v27, "initWithTimeIntervalSinceReferenceDate:");

          v21 = v32;
          v11 = v31;
          v12 = v30;
          a1 = v29;
          v22 = v28;
          v25 = v40;
          v35 = (void *)objc_msgSend(objc_alloc((Class)v22[361]), "initWithType:objectID:date:eventStore:", v24, v26, v34, a1[4]);

          v16 = v38;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v35);

        ++v20;
      }
      while (v16 != v20);
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
    v14 = v36;
  }

}

- (void)_cacheCalendarWithCADObjectID:(id)a3 withDefaultLoadedPropertyValues:(id)a4 forKeys:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *calendars;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  EKCalendar *v16;
  EKCalendar *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  calendars = self->_calendars;
  if (calendars)
  {
    -[NSMutableDictionary objectForKey:](calendars, "objectForKey:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v9 || !v12)
    {
      +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventStore registerFetchedObjectWithID:withDefaultLoadedPropertyKeys:values:](self, "registerFetchedObjectWithID:withDefaultLoadedPropertyKeys:values:", v14, v10, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = -[EKObject initWithPersistentObject:]([EKCalendar alloc], "initWithPersistentObject:", v15);
      v17 = v16;
      if (!v13 && !-[EKCalendar isHidden](v16, "isHidden"))
      {
        -[NSMutableDictionary setObject:forKey:](self->_calendars, "setObject:forKey:", v15, v8);
        -[EKCalendar calendarIdentifier](v17, "calendarIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[NSMutableDictionary setObject:forKey:](self->_calendarsByIdentifier, "setObject:forKey:", v15, v18);
        }
        else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          -[EKEventStore _cacheCalendarWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:].cold.2();
        }

      }
    }

  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore _cacheCalendarWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:].cold.1();
  }

}

- (id)cachedConstraintsForEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  objc_msgSend(v4, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[EKEventStore eventAccessLevel](self, "eventAccessLevel") == 1)
    {
      objc_msgSend(v4, "CADObjectID");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rebasedFrom");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isTemporary") && v7)
      {
        v8 = MEMORY[0x1E0C809B0];
        do
        {
          v9 = v7;

          -[EKEventStore objectsPendingCommit](self, "objectsPendingCommit");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = v8;
          v15[1] = 3221225472;
          v15[2] = __42__EKEventStore_cachedConstraintsForEvent___block_invoke;
          v15[3] = &unk_1E4788BB0;
          v16 = v9;
          v6 = v9;
          objc_msgSend(v10, "CalFirstObjectPassingTest:", v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "rebasedFrom");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        while (objc_msgSend(v6, "isTemporary") && v7);
      }
      -[EKEventStore cachedConstraintsForEventOrSourceWithCADObjectID:](self, "cachedConstraintsForEventOrSourceWithCADObjectID:", v6);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "calendar");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "source");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventStore cachedConstraintsForSource:](self, "cachedConstraintsForSource:", v7);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __64__EKEventStore_occurrenceCacheGetOccurrencesForCalendars_onDay___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __64__EKEventStore_occurrenceCacheGetOccurrencesForCalendars_onDay___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(v5, "CalMap:", &__block_literal_global_312);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (BOOL)showDeclinedEvents
{
  NSNumber *showDeclinedEventsNumber;
  NSNumber *v4;
  NSNumber *v5;

  showDeclinedEventsNumber = self->_showDeclinedEventsNumber;
  if (!showDeclinedEventsNumber)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CalShowDeclinedEvents());
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_showDeclinedEventsNumber;
    self->_showDeclinedEventsNumber = v4;

    showDeclinedEventsNumber = self->_showDeclinedEventsNumber;
  }
  return -[NSNumber BOOLValue](showDeclinedEventsNumber, "BOOLValue");
}

- (EKEventStore)initWithEKOptions:(unint64_t)a3
{
  return -[EKEventStore initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:](self, "initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:", a3, 0, 0, 1, 1);
}

+ (EKAuthorizationStatus)authorizationStatusForEntityType:(EKEntityType)entityType
{
  EKAuthorizationStatus v3;

  v3 = objc_msgSend(a1, "realAuthorizationStatusForEntityType:", entityType);
  if (v3 == EKAuthorizationStatusWriteOnly && (_shouldUseLegacyAccessBehavior() & 1) != 0)
    return 3;
  return v3;
}

+ (int64_t)realAuthorizationStatusForEntityType:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;

  +[EKDaemonConnection anyAvailableDaemonConnection](EKDaemonConnection, "anyAvailableDaemonConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a3 == 1)
  {
    v8 = objc_msgSend(v6, "remindersAuthorization");
    goto LABEL_8;
  }
  if (!a3)
  {
    v8 = objc_msgSend(v6, "eventAuthorization");
LABEL_8:
    v9 = v8;
    goto LABEL_10;
  }
  v9 = 0;
LABEL_10:
  if (objc_msgSend(a1, "_staticAccessFlagSaysDeniedForEntityType:", a3))
    v10 = 2;
  else
    v10 = v9;

  return v10;
}

- (id)init
{
  return -[EKEventStore initWithOptions:path:](self, "initWithOptions:path:", 0, 0);
}

+ (BOOL)_staticAccessFlagSaysDeniedForEntityType:(unint64_t)a3
{
  if (!a3 && denyAccessToEvents)
    return 1;
  return a3 == 1 && denyAccessToReminders != 0;
}

- (EKEventStore)initWithOptions:(int)a3 path:(id)a4 allowDelegateSources:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  EKEventStore *v9;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = -[EKEventStore initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:](self, "initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:", +[EKEventStore ekEventStoreInitOptionsFromCalDatabaseInitOptions:](EKEventStore, "ekEventStoreInitOptionsFromCalDatabaseInitOptions:", v6), v8, 0, 1, v5);

  return v9;
}

- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 changeTrackingClientId:(id)a5 enablePropertyModificationLogging:(BOOL)a6 allowDelegateSources:(BOOL)a7
{
  return -[EKEventStore initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:allowedSourceIdentifiers:](self, "initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:allowedSourceIdentifiers:", a3, a4, a5, a6, a7, 0);
}

+ (unint64_t)ekEventStoreInitOptionsFromCalDatabaseInitOptions:(int)a3
{
  return a3 & 0x3F;
}

- (EKEventStore)initWithOptions:(int)a3 path:(id)a4
{
  return -[EKEventStore initWithOptions:path:allowDelegateSources:](self, "initWithOptions:path:allowDelegateSources:", *(_QWORD *)&a3, a4, 1);
}

- (id)eventNotificationsExcludingUncheckedCalendars:(BOOL)a3 filteredByShowsNotificationsFlag:(BOOL)a4 earliestExpiringNotification:(id *)a5
{
  return -[EKEventStore eventNotificationsAfterDate:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:earliestExpiringNotification:](self, "eventNotificationsAfterDate:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:earliestExpiringNotification:", 0, a3, a4, a5);
}

- (id)eventNotificationsAfterDate:(id)a3 excludingUncheckedCalendars:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 earliestExpiringNotification:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__23;
  v26 = __Block_byref_object_dispose__23;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__23;
  v20 = __Block_byref_object_dispose__23;
  v21 = 0;
  -[EKEventStore connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CADOperationProxySync");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __134__EKEventStore_eventNotificationsAfterDate_excludingUncheckedCalendars_filteredByShowsNotificationsFlag_earliestExpiringNotification___block_invoke;
  v15[3] = &unk_1E4788AE8;
  v15[4] = self;
  v15[5] = &v22;
  v15[6] = &v16;
  objc_msgSend(v12, "CADDatabaseGetEventNotificationItemsAfterDate:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:reply:", v10, v8, v7, v15);

  if (a6)
    *a6 = objc_retainAutorelease((id)v17[5]);
  v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (BOOL)isDataProtected
{
  void *v2;
  char v3;

  -[EKEventStore dataProtectionObserver](self, "dataProtectionObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dataIsAccessible") ^ 1;

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EKDaemonConnection setDelegate:](self->_database, "setDelegate:", 0);
  if (-[CADDatabaseInitializationOptions unitTesting](self->_initializationOptions, "unitTesting"))
  {
    -[EKDaemonConnection CADOperationProxySync](self->_database, "CADOperationProxySync");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "CADTestingCloseDatabase:", &__block_literal_global_152);

  }
  -[EKDaemonConnection disconnect](self->_database, "disconnect");
  v4.receiver = self;
  v4.super_class = (Class)EKEventStore;
  -[EKEventStore dealloc](&v4, sel_dealloc);
}

- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 changeTrackingClientId:(id)a5 enablePropertyModificationLogging:(BOOL)a6 allowDelegateSources:(BOOL)a7 allowedSourceIdentifiers:(id)a8
{
  return -[EKEventStore initWithEKOptions:path:containerProvider:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:allowedSourceIdentifiers:](self, "initWithEKOptions:path:containerProvider:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:allowedSourceIdentifiers:", a3, a4, 0, a5, a6, a7, a8);
}

- (EKDataProtectionObserver)dataProtectionObserver
{
  return self->_dataProtectionObserver;
}

- (void)initializeEKEventStorePlusReminders
{
  *(_DWORD *)-[EKEventStore reminderSourceMapLock](self, "reminderSourceMapLock") = 0;
}

- (void)setDataProtectionObserver:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionObserver, a3);
}

- (BOOL)allowAccessToEventsOnly
{
  if ((self->_options & 0x80) != 0
    || (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsCalendarDaemon") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsDataAccess");
  }
}

+ (int)calDatabaseInitOptionsFromEKEventStoreInitOptions:(unint64_t)a3
{
  return a3 & 0x3B;
}

- (void)_updateDefaultDelayForThrottleEventStoreChangedNotifications
{
  double v3;

  objc_msgSend((id)objc_opt_class(), "_defaultDelayForThrottledNotificationsWithInitializationOptions:", self->_initializationOptions);
  self->_defaultDelayForThrottledNotifications = v3;
}

+ (double)_defaultDelayForThrottledNotificationsWithInitializationOptions:(id)a3
{
  double v3;

  v3 = 0.0;
  if ((objc_msgSend(a3, "unitTesting") & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsCalendarDaemon") & 1) == 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement"))
      return 0.0;
    else
      return 1.0;
  }
  return v3;
}

+ (NSString)eventStoreChangedDistributedNotificationName
{
  return (NSString *)(id)*MEMORY[0x1E0D0BE60];
}

- (void)performHoldingReminderSourceMapLock:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(-[EKEventStore reminderSourceMapLock](self, "reminderSourceMapLock"));
  v4[2](v4);

  os_unfair_lock_unlock(-[EKEventStore reminderSourceMapLock](self, "reminderSourceMapLock"));
}

- (os_unfair_lock_s)reminderSourceMapLock
{
  return &self->_reminderSourceMapLock;
}

void __71__EKEventStore_Reminders__getMapsWithReminderSourceMap_eventSourceMap___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "reminderSourceIDToEventSourceIDMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventSources");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "reminderSources");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_rebuildSourceMapsWithEventSources:reminderSources:", v3, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "reminderSourceIDToEventSourceIDMapping");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "eventSourceIDToReminderSourceIDMapping");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (NSDictionary)reminderSourceIDToEventSourceIDMapping
{
  return self->_reminderSourceIDToEventSourceIDMapping;
}

- (NSDictionary)eventSourceIDToReminderSourceIDMapping
{
  return self->_eventSourceIDToReminderSourceIDMapping;
}

void __35__EKEventStore_classForEntityName___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = objc_alloc(MEMORY[0x1E0C99D80]);
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_msgSend(v20, "initWithObjectsAndKeys:", v19, CFSTR("Source"), v18, CFSTR("Calendar"), v17, CFSTR("Event"), v16, CFSTR("Alarm"), v15, CFSTR("Attachment"), v14, CFSTR("Attendee"), v13, CFSTR("Organizer"), v12, CFSTR("RecurrenceRule"), v0,
          CFSTR("ExceptionDate"),
          v1,
          CFSTR("EventAction"),
          v2,
          CFSTR("Location"),
          v3,
          CFSTR("Sharee"),
          v4,
          CFSTR("ResourceChange"),
          v5,
          CFSTR("SuggestionNotification"),
          v6,
          CFSTR("InviteReplyNotification"),
          v7,
          CFSTR("SuggestedEventInfo"),
          v8,
          CFSTR("Error"),
          v9,
          CFSTR("Image"),
          objc_opt_class(),
          CFSTR("Color"),
          0);
  v11 = (void *)classForEntityName__sClassMap;
  classForEntityName__sClassMap = v10;

}

void __44__EKEventStore_insertSuggestedEventCalendar__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    if (a2 == 1020)
    {
      v2 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        __44__EKEventStore_insertSuggestedEventCalendar__block_invoke_2_cold_2(v2, v3, v4);
    }
    else
    {
      v5 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        __44__EKEventStore_insertSuggestedEventCalendar__block_invoke_2_cold_1(v5);
    }
  }
}

void __44__EKEventStore_insertSuggestedEventCalendar__block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[EKEventStore insertSuggestedEventCalendar]_block_invoke_2";
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, a1, a3, "%s: Could not insert the Found in Mail calendar because it already exists.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

+ (void)setPredicatePropertyLoadMode:(unint64_t)a3
{
  _predicatePropertyLoadMode = a3;
}

- (void)insertSuggestedEventCalendar
{
  NSObject *calendarSourcesAndDefaultsQueue;
  _QWORD block[5];

  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__EKEventStore_insertSuggestedEventCalendar__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(calendarSourcesAndDefaultsQueue, block);
}

- (NSArray)objectsPendingCommit
{
  NSObject *unsavedChangesQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__EKEventStore_objectsPendingCommit__block_invoke;
  v5[3] = &unk_1E4785190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(unsavedChangesQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSSet)deletedObjectIDsPendingCommit
{
  NSObject *unsavedChangesQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__EKEventStore_deletedObjectIDsPendingCommit__block_invoke;
  v5[3] = &unk_1E4785190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(unsavedChangesQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (id)defaultCalendarForNewEventsInDelegateSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *calendarSourcesAndDefaultsQueue;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  EKEventStore *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isDelegate") & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore defaultCalendarForNewEventsInDelegateSource:].cold.1();
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "CADObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__23;
    v26 = __Block_byref_object_dispose__23;
    v27 = 0;
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __60__EKEventStore_defaultCalendarForNewEventsInDelegateSource___block_invoke;
    v17 = &unk_1E47887C8;
    v18 = self;
    v11 = v8;
    v19 = v11;
    v12 = v7;
    v20 = v12;
    v21 = &v22;
    dispatch_sync(calendarSourcesAndDefaultsQueue, &v14);
    -[EKEventStore calendarWithCADID:](self, "calendarWithCADID:", v23[5], v14, v15, v16, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v22, 8);
  }

  return v9;
}

- (id)calendarWithCADID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "restoreGeneration") == -1
     || (v6 = objc_msgSend(v5, "restoreGeneration"),
         -[EKEventStore database](self, "database"),
         v7 = (void *)objc_claimAutoreleasedReturnValue(),
         v8 = objc_msgSend(v7, "databaseRestoreGeneration"),
         v7,
         v6 == v8)))
  {
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore calendarWithID:](self, "calendarWithID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)calendarWithID:(id)a3
{
  void *v3;
  EKCalendar *v4;

  -[EKEventStore objectWithObjectID:](self, "objectWithObjectID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[EKObject initWithPersistentObject:]([EKCalendar alloc], "initWithPersistentObject:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)objectWithObjectID:(id)a3
{
  id v4;
  NSObject *registeredQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__23;
  v16 = __Block_byref_object_dispose__23;
  v17 = 0;
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__EKEventStore_objectWithObjectID___block_invoke;
  block[3] = &unk_1E4785298;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(registeredQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __35__EKEventStore_objectWithObjectID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "objectWithIDExists:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 32), "_addFetchedObjectWithID:", *(_QWORD *)(a1 + 40));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
  }
}

void __65__EKEventStore_cachedConstraintsForEventOrSourceWithCADObjectID___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_cachedDefaultConstraints");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;
  }
  else
  {
    objc_msgSend(v3, "_cachedConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v10 = *(_BYTE *)(a1 + 56) ? 0 : *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_fetchConstraintsForObjectWithCADObjectID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v14 = *(void **)(a1 + 32);
      if (*(_BYTE *)(a1 + 56))
      {
        objc_msgSend(v14, "set_cachedDefaultConstraints:");
      }
      else
      {
        objc_msgSend(v14, "_cachedConstraints");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "set_cachedConstraints:", v16);

        }
        objc_msgSend(*(id *)(a1 + 32), "_cachedConstraints");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));

      }
    }
  }
}

- (NSMutableDictionary)_cachedConstraints
{
  return self->__cachedConstraints;
}

- (void)set_cachedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->__cachedConstraints, a3);
}

- (id)_fetchConstraintsForObjectWithCADObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EKSourceConstraints *v7;
  EKSourceConstraints *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__23;
  v15 = __Block_byref_object_dispose__23;
  v16 = 0;
  -[EKEventStore connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADOperationProxySync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__EKEventStore__fetchConstraintsForObjectWithCADObjectID___block_invoke;
  v10[3] = &unk_1E4785988;
  v10[4] = &v11;
  objc_msgSend(v6, "CADObjectGetConstraints:reply:", v4, v10);

  v7 = [EKSourceConstraints alloc];
  v8 = -[EKSourceConstraints initWithData:](v7, "initWithData:", v12[5]);
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __58__EKEventStore__fetchConstraintsForObjectWithCADObjectID___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __58__EKEventStore__fetchConstraintsForObjectWithCADObjectID___block_invoke_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

void __36__EKEventStore_objectsPendingCommit__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __45__EKEventStore_deletedObjectIDsPendingCommit__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "valueForKey:", CFSTR("objectID"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setTimeZone:(id)a3
{
  NSTimeZone *v4;
  NSTimeZone *timeZone;

  if (self->_timeZone != a3)
  {
    v4 = (NSTimeZone *)objc_msgSend(a3, "copy");
    timeZone = self->_timeZone;
    self->_timeZone = v4;

  }
}

void __35__EKEventStore_objectWithIDExists___block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __35__EKEventStore_objectWithIDExists___block_invoke_cold_1();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
}

- (BOOL)objectWithIDExists:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (v4)
  {
    -[EKEventStore connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CADOperationProxySync");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CADObjectIDWithGeneration:", 0xFFFFFFFFLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __35__EKEventStore_objectWithIDExists___block_invoke;
    v10[3] = &unk_1E4786AC8;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v6, "CADObjectExists:reply:", v7, v10);

  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore objectWithIDExists:].cold.1();
  }
  v8 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __63__EKEventStore_occurrenceCacheGetOccurrenceCountsForCalendars___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __63__EKEventStore_occurrenceCacheGetOccurrenceCountsForCalendars___block_invoke_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (NSArray)eventsMatchingPredicate:(NSPredicate *)predicate
{
  NSPredicate *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = predicate;
  -[EKEventStore _validateEventPredicate:](self, "_validateEventPredicate:", v4);
  -[EKEventStore _implicitUpgradeToFullAccessIfNeededWithReason:](self, "_implicitUpgradeToFullAccessIfNeededWithReason:", 7);
  mach_absolute_time();
  +[EKPredicateSearch searchWithEntityClass:predicate:store:](EKPredicateSearch, "searchWithEntityClass:predicate:store:", objc_opt_class(), v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runSynchronously");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  mach_absolute_time();
  CalAnalyticsTimeIntervalFromMachTimes();
  v10 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CalAnalyticsSendEvent();

  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    -[EKEventStore eventsMatchingPredicate:].cold.1();

  return (NSArray *)v6;
}

- (void)_validateEventPredicate:(id)a3
{
  id v3;

  v3 = a3;
  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("predicate is nil"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("predicate was not created with EKCalendarStore methods"));

}

- (void)_implicitUpgradeToFullAccessIfNeededWithReason:(int64_t)a3
{
  if (-[EKEventStore eventAccessLevel](self, "eventAccessLevel") == 1)
  {
    if (_shouldUseLegacyAccessBehavior())
      -[EKEventStore requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:](self, "requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:", 0, 1, 0, 1, a3, 0);
  }
}

void __60__EKEventStore_defaultCalendarForNewEventsInDelegateSource___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __60__EKEventStore_defaultCalendarForNewEventsInDelegateSource___block_invoke_2_cold_1(v7);
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stampedCopyWithGeneration:", objc_msgSend(v8, "databaseRestoreGeneration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));

  }
}

void __38__EKEventStore__loadCalendarsIfNeeded__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if (a2)
  {
    v10 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __38__EKEventStore__loadCalendarsIfNeeded__block_invoke_cold_1(v10);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }

}

void __36__EKEventStore__loadSourcesIfNeeded__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if (a2)
  {
    v10 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __36__EKEventStore__loadSourcesIfNeeded__block_invoke_cold_1(v10);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }

}

- (id)combinedReminderAndEventSources
{
  void *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__EKEventStore_Reminders__combinedReminderAndEventSources__block_invoke;
  v5[3] = &unk_1E47850A0;
  v5[4] = self;
  v5[5] = &v6;
  -[EKEventStore performHoldingReminderSourceMapLock:](self, "performHoldingReminderSourceMapLock:", v5);
  v2 = (void *)v7[5];
  if (!v2)
  {
    v7[5] = MEMORY[0x1E0C9AA60];

    v2 = (void *)v7[5];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)combineEventCalendars:(id)a3 withReminderCalendars:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v6;
    }
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (id)eventSourceForReminderSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore eventSourceIDForReminderSourceID:](self, "eventSourceIDForReminderSourceID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[EKEventStore sourceWithIdentifier:](self, "sourceWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)eventSourceIDForReminderSourceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EKEventStore reminderSourceMap](self, "reminderSourceMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)reminderSourceMap
{
  id v3;

  v3 = 0;
  -[EKEventStore getMapsWithReminderSourceMap:eventSourceMap:](self, "getMapsWithReminderSourceMap:eventSourceMap:", &v3, 0);
  return v3;
}

- (void)invalidateReminderSourceMaps
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__EKEventStore_Reminders__invalidateReminderSourceMaps__block_invoke;
  v2[3] = &unk_1E4785078;
  v2[4] = self;
  -[EKEventStore performHoldingReminderSourceMapLock:](self, "performHoldingReminderSourceMapLock:", v2);
}

uint64_t __55__EKEventStore_Reminders__invalidateReminderSourceMaps__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setReminderSourceIDToEventSourceIDMapping:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setEventSourceIDToReminderSourceIDMapping:", 0);
}

- (BOOL)restoreGenerationChanged
{
  EKEventStore *v2;
  os_unfair_lock_s *p_flagsLock;

  v2 = self;
  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  LOBYTE(v2) = *(_BYTE *)&v2->_flags & 1;
  os_unfair_lock_unlock(p_flagsLock);
  return (char)v2;
}

- (void)setRestoreGenerationChanged:(BOOL)a3
{
  os_unfair_lock_s *p_flagsLock;

  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
  os_unfair_lock_unlock(p_flagsLock);
}

- (BOOL)setRestoreGenerationChangedAndGetPreviousValue:(BOOL)a3
{
  os_unfair_lock_s *p_flagsLock;
  char flags;

  p_flagsLock = &self->_flagsLock;
  os_unfair_lock_lock(&self->_flagsLock);
  flags = (char)self->_flags;
  *(_BYTE *)&self->_flags = flags & 0xFE | a3;
  os_unfair_lock_unlock(p_flagsLock);
  return flags & 1;
}

+ (id)reminderStoreContainerTokenProvider
{
  return (id)MEMORY[0x1A85849D4](_reminderStoreContainerTokenProvider, a2);
}

+ (void)setReminderStoreContainerTokenProvider:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x1A85849D4](a3, a2);
  v4 = (void *)_reminderStoreContainerTokenProvider;
  _reminderStoreContainerTokenProvider = v3;

}

- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 sources:(id)a5
{
  id v8;
  void *v9;
  EKEventStore *v10;

  v8 = a4;
  objc_msgSend(a5, "valueForKey:", CFSTR("sourceIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EKEventStore initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:allowedSourceIdentifiers:](self, "initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:allowedSourceIdentifiers:", a3, v8, 0, 1, 1, v9);

  return v10;
}

- (EKEventStore)initWithSources:(NSArray *)sources
{
  return -[EKEventStore initWithEKOptions:path:sources:](self, "initWithEKOptions:path:sources:", 0, 0, sources);
}

- (EKEventStore)initWithBirthdayCalendarModifications
{
  EKEventStore *result;

  result = -[EKEventStore initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:](self, "initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:", 4, 0, 0, 0, 1);
  if (result)
    result->_allowsBirthdayCalendarModifications = 1;
  return result;
}

- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 containerProvider:(id)a5 changeTrackingClientId:(id)a6 enablePropertyModificationLogging:(BOOL)a7 allowDelegateSources:(BOOL)a8 allowedSourceIdentifiers:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = a8;
  return -[EKEventStore initWithEKOptions:path:containerProvider:tccPermissionChecker:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:allowedSourceIdentifiers:](self, "initWithEKOptions:path:containerProvider:tccPermissionChecker:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:allowedSourceIdentifiers:", a3, a4, a5, 0, a6, a7, v10, a9);
}

- (EKEventStore)initWithEKOptions:(unint64_t)a3 path:(id)a4 containerProvider:(id)a5 tccPermissionChecker:(id)a6 changeTrackingClientId:(id)a7 enablePropertyModificationLogging:(BOOL)a8 allowDelegateSources:(BOOL)a9 allowedSourceIdentifiers:(id)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  EKEventStore *v21;
  void *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *calendarSourcesAndDefaultsQueue;
  dispatch_queue_t v25;
  OS_dispatch_queue *registeredQueue;
  dispatch_queue_t v27;
  OS_dispatch_queue *unsavedChangesQueue;
  dispatch_queue_t v29;
  OS_dispatch_queue *dbChangedQueue;
  NSObject *v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *asynchronousSearchQueue;
  dispatch_queue_t v34;
  OS_dispatch_queue *constraintsCacheQueue;
  dispatch_queue_t v36;
  OS_dispatch_queue *notificationCollectionCacheQueue;
  uint64_t v38;
  NSMutableArray *databaseWaitCallbacks;
  uint64_t v40;
  NSMutableArray *databaseWaitTimestamps;
  uint64_t v42;
  CADInMemoryChangeTimestamp *lastDatabaseNotificationTimestamp;
  EKDataProtectionObserver *v44;
  uint64_t v45;
  void *v46;
  CADDatabaseInitializationOptions *v47;
  CADDatabaseInitializationOptions *initializationOptions;
  void *v49;
  void *v50;
  void *v51;
  EKLocalXPCConnectionFactory *v52;
  EKDaemonConnection *v53;
  EKDaemonConnection *database;
  NSMutableDictionary *v55;
  NSMutableDictionary *registeredObjects;
  uint64_t v57;
  NSHashTable *eventsNeedsGeocoding;
  NSCache *v59;
  NSCache *deletedEventUniqueIdentifiersCache;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  CalAccumulatingQueue *notificationAccumulatingQueue;
  void *v66;
  void *v67;
  EKStaticAuthStatusChecker *v68;
  EKAuthStatusChecker *authStatusChecker;
  NSObject *v70;
  void *v71;
  EKReminderStore *v72;
  EKReminderStore *reminderStore;
  id v75;
  id v76;
  uint8_t buf[8];
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  id location;
  objc_super v85;

  v10 = a8;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a10;
  v85.receiver = self;
  v85.super_class = (Class)EKEventStore;
  v21 = -[EKEventStore init](&v85, sel_init);
  if (v21)
  {
    EKLogInitIfNeeded();
    v22 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKEventStore initWithEKOptions:path:containerProvider:tccPermissionChecker:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:allowedSourceIdentifiers:].cold.1((uint64_t)v21, v22);
    v76 = v20;
    v21->_options = a3;
    objc_msgSend(MEMORY[0x1E0D0A0D0], "setValidator:", objc_opt_class());
    v23 = dispatch_queue_create("com.apple.eventkit.eventstore.calendars", 0);
    calendarSourcesAndDefaultsQueue = v21->_calendarSourcesAndDefaultsQueue;
    v21->_calendarSourcesAndDefaultsQueue = (OS_dispatch_queue *)v23;

    v25 = dispatch_queue_create("com.apple.eventkit.eventstore.registered", 0);
    registeredQueue = v21->_registeredQueue;
    v21->_registeredQueue = (OS_dispatch_queue *)v25;

    v27 = dispatch_queue_create("com.apple.eventkit.eventstore.unsaved", 0);
    unsavedChangesQueue = v21->_unsavedChangesQueue;
    v21->_unsavedChangesQueue = (OS_dispatch_queue *)v27;

    v29 = dispatch_queue_create("com.apple.eventkit.eventstore.dbchanged", 0);
    dbChangedQueue = v21->_dbChangedQueue;
    v21->_dbChangedQueue = (OS_dispatch_queue *)v29;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create("com.apple.eventkit.EKPredicateSearch", v31);
    asynchronousSearchQueue = v21->_asynchronousSearchQueue;
    v21->_asynchronousSearchQueue = (OS_dispatch_queue *)v32;

    v34 = dispatch_queue_create("com.apple.eventkit.eventstore.constraintsCache", 0);
    constraintsCacheQueue = v21->_constraintsCacheQueue;
    v21->_constraintsCacheQueue = (OS_dispatch_queue *)v34;

    v36 = dispatch_queue_create("com.apple.eventkit.eventstore.notificationCollectionCache", 0);
    notificationCollectionCacheQueue = v21->_notificationCollectionCacheQueue;
    v21->_notificationCollectionCacheQueue = (OS_dispatch_queue *)v36;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = objc_claimAutoreleasedReturnValue();
    databaseWaitCallbacks = v21->_databaseWaitCallbacks;
    v21->_databaseWaitCallbacks = (NSMutableArray *)v38;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = objc_claimAutoreleasedReturnValue();
    databaseWaitTimestamps = v21->_databaseWaitTimestamps;
    v21->_databaseWaitTimestamps = (NSMutableArray *)v40;

    objc_msgSend(MEMORY[0x1E0D0A0A0], "timestampForNow");
    v42 = objc_claimAutoreleasedReturnValue();
    lastDatabaseNotificationTimestamp = v21->_lastDatabaseNotificationTimestamp;
    v21->_lastDatabaseNotificationTimestamp = (CADInMemoryChangeTimestamp *)v42;

    objc_initWeak(&location, v21);
    v44 = objc_alloc_init(EKDataProtectionObserver);
    -[EKEventStore setDataProtectionObserver:](v21, "setDataProtectionObserver:", v44);

    v45 = MEMORY[0x1E0C809B0];
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke;
    v82[3] = &unk_1E4785050;
    objc_copyWeak(&v83, &location);
    -[EKEventStore dataProtectionObserver](v21, "dataProtectionObserver");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setStateChangedCallback:", v82);

    v47 = (CADDatabaseInitializationOptions *)objc_alloc_init(MEMORY[0x1E0D0A060]);
    initializationOptions = v21->_initializationOptions;
    v21->_initializationOptions = v47;

    -[CADDatabaseInitializationOptions setDatabaseInitOptions:](v21->_initializationOptions, "setDatabaseInitOptions:", +[EKEventStore calDatabaseInitOptionsFromEKEventStoreInitOptions:](EKEventStore, "calDatabaseInitOptionsFromEKEventStoreInitOptions:", a3));
    objc_msgSend(v19, "CADChangeTrackingClientId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (!v49)
      v50 = (void *)objc_opt_new();
    -[CADDatabaseInitializationOptions setChangeTrackingClientId:](v21->_initializationOptions, "setChangeTrackingClientId:", v50);
    if (!v49)

    -[CADDatabaseInitializationOptions setEnablePropertyModificationLogging:](v21->_initializationOptions, "setEnablePropertyModificationLogging:", v10);
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v16);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = 0;
    }
    -[CADDatabaseInitializationOptions setDatabaseDirectory:](v21->_initializationOptions, "setDatabaseDirectory:", v51);
    if (v16)

    -[CADDatabaseInitializationOptions setCalendarDataContainerProvider:](v21->_initializationOptions, "setCalendarDataContainerProvider:", v17);
    -[CADDatabaseInitializationOptions setAllowDelegateSources:](v21->_initializationOptions, "setAllowDelegateSources:", a9);
    -[CADDatabaseInitializationOptions setAllowedSourceIdentifiers:](v21->_initializationOptions, "setAllowedSourceIdentifiers:", v76);
    -[CADDatabaseInitializationOptions setUnitTesting:](v21->_initializationOptions, "setUnitTesting:", (a3 >> 12) & 1);
    -[CADDatabaseInitializationOptions setAllowIntegrations:](v21->_initializationOptions, "setAllowIntegrations:", (a3 >> 13) & 1);
    v21->_flagsLock._os_unfair_lock_opaque = 0;
    if (objc_msgSend((id)objc_opt_class(), "_shouldUseInProcessXPCWithInitOptions:", a3))
    {
      if (!v18)
        v18 = (id)objc_opt_new();
      v52 = -[EKLocalXPCConnectionFactory initWithTCCPermissionChecker:]([EKLocalXPCConnectionFactory alloc], "initWithTCCPermissionChecker:", v18);
      -[CADDatabaseInitializationOptions setDatabaseInitOptions:](v21->_initializationOptions, "setDatabaseInitOptions:", -[CADDatabaseInitializationOptions databaseInitOptions](v21->_initializationOptions, "databaseInitOptions") | 0x2000);
    }
    else
    {
      +[EKRemoteXPCConnectionFactory sharedInstance](EKRemoteXPCConnectionFactory, "sharedInstance");
      v52 = (EKLocalXPCConnectionFactory *)objc_claimAutoreleasedReturnValue();
    }
    v53 = -[EKDaemonConnection initWithConnectionFactory:]([EKDaemonConnection alloc], "initWithConnectionFactory:", v52);
    database = v21->_database;
    v21->_database = v53;

    -[EKDaemonConnection setDelegate:](v21->_database, "setDelegate:", v21);
    -[EKDaemonConnection setInitializationOptions:](v21->_database, "setInitializationOptions:", v21->_initializationOptions);
    v55 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    registeredObjects = v21->_registeredObjects;
    v21->_registeredObjects = v55;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 5);
    v57 = objc_claimAutoreleasedReturnValue();
    eventsNeedsGeocoding = v21->_eventsNeedsGeocoding;
    v21->_eventsNeedsGeocoding = (NSHashTable *)v57;

    if ((a3 & 0x200) != 0)
    {
      v59 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
      deletedEventUniqueIdentifiersCache = v21->_deletedEventUniqueIdentifiersCache;
      v21->_deletedEventUniqueIdentifiersCache = v59;

      -[NSCache setCountLimit:](v21->_deletedEventUniqueIdentifiersCache, "setCountLimit:", 1000);
    }
    -[EKEventStore _updateDefaultDelayForThrottleEventStoreChangedNotifications](v21, "_updateDefaultDelayForThrottleEventStoreChangedNotifications");
    v61 = objc_alloc(MEMORY[0x1E0D0C250]);
    v75 = v17;
    v62 = MEMORY[0x1E0C80D38];
    v63 = MEMORY[0x1E0C80D38];
    v80[0] = v45;
    v80[1] = 3221225472;
    v80[2] = __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_133;
    v80[3] = &unk_1E47861C0;
    objc_copyWeak(&v81, &location);
    v78[0] = v45;
    v78[1] = 3221225472;
    v78[2] = __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_2;
    v78[3] = &unk_1E4788150;
    objc_copyWeak(&v79, &location);
    v64 = objc_msgSend(v61, "initWithQueue:andBlock:throttle:", v62, v80, v78);
    notificationAccumulatingQueue = v21->_notificationAccumulatingQueue;
    v21->_notificationAccumulatingQueue = (CalAccumulatingQueue *)v64;

    if ((a3 & 0x104) == 0)
    {
      v66 = (void *)MEMORY[0x1E0D0C2E0];
      objc_msgSend((id)objc_opt_class(), "eventStoreChangedDistributedNotificationName");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "addObserver:selector:name:", v21, sel__handleExternalDatabaseChangedNotificationAsynchronously_, v67);

      if ((a3 & 0x40) != 0)
        objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", v21, sel__handleExternalDatabaseChangedNotificationAsynchronously_, *MEMORY[0x1E0D0BE70]);
      if ((a3 & 0x2000) != 0)
        objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", v21, sel__handleExternalDatabaseChangedNotificationAsynchronously_, *MEMORY[0x1E0D0BE68]);
      objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", v21, sel__handleExternalDatabaseChangedNotificationAsynchronously_, *MEMORY[0x1E0D0BEB8]);
      objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", v21, sel__handleExternalDatabaseChangedNotificationAsynchronously_, CFSTR("com.apple.calendar.defaultAlarmChangedNotification"));
      objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", v21, sel__handleExternalDatabaseChangedNotificationAsynchronously_, *MEMORY[0x1E0D0A828]);
      objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", v21, sel_showDeclinedEventsChanged_, CFSTR("com.apple.mobilecal.showdeclinedchanged"));
      objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", v21, sel_showCompletedRemindersChanged_, CFSTR("com.apple.mobilecal.showCompletedRemindersChanged"));
    }
    if (!_CFExecutableLinkedOnOrAfter())
      -[EKEventStore _implicitlyRequestEventAccessForOlderApps](v21, "_implicitlyRequestEventAccessForOlderApps");
    -[EKEventStore initializeEKEventStorePlusReminders](v21, "initializeEKEventStorePlusReminders");
    if (-[EKEventStore allowAccessToEventsOnly](v21, "allowAccessToEventsOnly"))
    {
      v68 = -[EKStaticAuthStatusChecker initWithEventAccessLevel:hasAccessToReminders:]([EKStaticAuthStatusChecker alloc], "initWithEventAccessLevel:hasAccessToReminders:", 2, 0);
      authStatusChecker = v21->_authStatusChecker;
      v21->_authStatusChecker = (EKAuthStatusChecker *)v68;

      v70 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2318000, v70, OS_LOG_TYPE_DEFAULT, "Initialized event store with access to events only", buf, 2u);
      }
    }
    else
    {
      objc_storeStrong((id *)&v21->_authStatusChecker, v21->_database);
      if (_reminderStoreContainerTokenProvider)
      {
        (*(void (**)(void))(_reminderStoreContainerTokenProvider + 16))();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v71 = 0;
      }
      v72 = -[EKReminderStore initWithEventStore:token:]([EKReminderStore alloc], "initWithEventStore:token:", v21, v71);
      reminderStore = v21->_reminderStore;
      v21->_reminderStore = v72;

    }
    objc_destroyWeak(&v79);
    objc_destroyWeak(&v81);

    objc_destroyWeak(&v83);
    objc_destroyWeak(&location);
    v17 = v75;
    v20 = v76;
  }

  return v21;
}

void __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  char v4;
  _BOOL4 v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dataProtectionObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "dataIsAccessible");

    v5 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG);
    if ((v4 & 1) != 0)
    {
      if (v5)
        __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_cold_1();
      objc_msgSend(v2, "_accessStatusChanged");
    }
    else if (v5)
    {
      __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_cold_2();
    }
  }

}

void __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_postEventStoreChangedNotificationWithTags:context:", v6, v5);

}

double __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  double v8;
  double v9;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_throttleDelayForEventStoreChangedNotificationWithTags:context:", v6, v5);
  v9 = v8;

  return v9;
}

- (EKEventStore)initWithOptions:(int)a3 path:(id)a4 changeTrackingClientId:(id)a5 enablePropertyModificationLogging:(BOOL)a6 allowDelegateSources:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v10;
  id v12;
  id v13;
  EKEventStore *v14;

  v7 = a7;
  v8 = a6;
  v10 = *(_QWORD *)&a3;
  v12 = a5;
  v13 = a4;
  v14 = -[EKEventStore initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:](self, "initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:", +[EKEventStore ekEventStoreInitOptionsFromCalDatabaseInitOptions:](EKEventStore, "ekEventStoreInitOptionsFromCalDatabaseInitOptions:", v10), v13, v12, v8, v7);

  return v14;
}

void __23__EKEventStore_dealloc__block_invoke(uint64_t a1, int a2)
{
  void *v2;

  if (a2)
  {
    v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __23__EKEventStore_dealloc__block_invoke_cold_1(v2);
  }
}

+ (BOOL)shouldUseInProcessXPCByDefault
{
  return objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessUsesInProcessEventStores");
}

+ (BOOL)_shouldUseInProcessXPCWithInitOptions:(unint64_t)a3
{
  if ((a3 & 0x800) != 0)
    return 0;
  if ((a3 & 0x400) != 0)
    return 1;
  return objc_msgSend(a1, "shouldUseInProcessXPCByDefault");
}

+ (int64_t)authorizationStatusWithAuditToken:(id *)a3 entityType:(unint64_t)a4
{
  _QWORD *v4;
  uint64_t v5;
  int64_t result;

  if (a4)
  {
    if (a4 != 1)
      return 0;
    v4 = (_QWORD *)MEMORY[0x1E0DB1198];
  }
  else
  {
    v4 = (_QWORD *)MEMORY[0x1E0DB10E8];
  }
  if (!*v4)
    return 0;
  v5 = tcc_authorization_check_audit_token();
  result = 3;
  switch(v5)
  {
    case 0:
      if (TCCAccessRestricted())
        result = 1;
      else
        result = 2;
      break;
    case 1:
      result = TCCAccessRestricted() != 0;
      break;
    case 2:
      return result;
    case 4:
      result = 4;
      break;
    default:
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        +[EKEventStore authorizationStatusWithAuditToken:entityType:].cold.1();
      result = 2;
      break;
  }
  return result;
}

- (void)_implicitlyRequestEventAccessForOlderApps
{
  if (+[EKEventStore realAuthorizationStatusForEntityType:](EKEventStore, "realAuthorizationStatusForEntityType:", 0) <= 2)-[EKEventStore requestWriteOnlyAccessToEventsWithCompletion:](self, "requestWriteOnlyAccessToEventsWithCompletion:", &__block_literal_global_158);
}

- (void)requestAccessToEntityType:(EKEntityType)entityType completion:(EKEventStoreRequestAccessCompletionHandler)completion
{
  -[EKEventStore requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:](self, "requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:", entityType, 1, 0, 0, 0, completion);
}

- (void)requestFullAccessToEventsWithCompletion:(EKEventStoreRequestAccessCompletionHandler)completion
{
  -[EKEventStore requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:](self, "requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:", 0, 1, 0, 0, 1, completion);
}

- (void)requestWriteOnlyAccessToEventsWithCompletion:(EKEventStoreRequestAccessCompletionHandler)completion
{
  -[EKEventStore requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:](self, "requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:", 0, 0, 0, 0, 2, completion);
}

- (void)requestFullAccessToRemindersWithCompletion:(EKEventStoreRequestAccessCompletionHandler)completion
{
  -[EKEventStore requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:](self, "requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:", 1, 1, 0, 0, 3, completion);
}

- (void)requestAccessToEntityType:(unint64_t)a3 desiredFullAccess:(BOOL)a4 testing:(BOOL)a5 synchronous:(BOOL)a6 reason:(int64_t)a7 completion:(id)a8
{
  _BOOL4 v10;
  _BOOL8 v11;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  _QWORD *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[5];
  void (**v26)(_QWORD, _QWORD, _QWORD);
  unint64_t v27;
  int64_t v28;
  BOOL v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v10 = a5;
  v11 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v14 = a8;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  if (a3)
  {
    if (a3 != 1)
      goto LABEL_9;
    v16 = (_QWORD *)MEMORY[0x1E0DB1198];
  }
  else
  {
    v16 = (_QWORD *)MEMORY[0x1E0DB10E8];
  }
  if (*v16)
  {
    v17 = +[EKEventStore realAuthorizationStatusForEntityType:](EKEventStore, "realAuthorizationStatusForEntityType:", a3);
    if (v10)
    {
      if (a3 == 1)
        +[EKEventStore setDenyAccessToReminders:](EKEventStore, "setDenyAccessToReminders:", 0);
      else
        +[EKEventStore setDenyAccessToEvents:](EKEventStore, "setDenyAccessToEvents:", 0);
    }
    -[EKEventStore connection](self, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a6)
    {
      objc_msgSend(v19, "CADOperationProxySync");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    }
    else
    {
      objc_msgSend(v19, "CADOperationProxy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
    }
    v22 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v23 = CFSTR("write-only");
      if (v11)
        v23 = CFSTR("full");
      v24 = CFSTR("events");
      if (a3)
        v24 = CFSTR("reminders");
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2114;
      v33 = v24;
      _os_log_impl(&dword_1A2318000, v22, OS_LOG_TYPE_DEFAULT, "Requesting %{public}@ access to %{public}@", buf, 0x16u);
    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __98__EKEventStore_requestAccessToEntityType_desiredFullAccess_testing_synchronous_reason_completion___block_invoke;
    v25[3] = &unk_1E47881B8;
    v27 = a3;
    v28 = v17;
    v25[4] = self;
    v29 = v11;
    v26 = v15;
    objc_msgSend(v18, "CADDatabaseRequestAccessForEntityType:desiredFullAccess:isBlockingUIThread:reason:reply:", a3, v11, v21, a7, v25);

LABEL_24:
    goto LABEL_25;
  }
LABEL_9:
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:].cold.1();
    ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v18);
    goto LABEL_24;
  }
LABEL_25:

}

void __98__EKEventStore_requestAccessToEntityType_desiredFullAccess_testing_synchronous_reason_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 67109376;
    v11 = a3;
    v12 = 1024;
    v13 = a2;
    _os_log_impl(&dword_1A2318000, v6, OS_LOG_TYPE_DEFAULT, "Access request result: %d, error = %d", (uint8_t *)&v10, 0xEu);
  }
  if (+[EKEventStore _staticAccessFlagSaysDeniedForEntityType:](EKEventStore, "_staticAccessFlagSaysDeniedForEntityType:", *(_QWORD *)(a1 + 48)))
  {
    v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      a3 = 2;
      _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_DEFAULT, "Coercing access request result to denied due to static access flags", (uint8_t *)&v10, 2u);
    }
    else
    {
      a3 = 2;
    }
  }
  if (*(_QWORD *)(a1 + 56) != a3)
    objc_msgSend(*(id *)(a1 + 32), "_accessStatusChanged");
  if (*(_BYTE *)(a1 + 64) && (_shouldUseLegacyAccessBehavior() & 1) == 0)
    v8 = a3 == 3;
  else
    v8 = a3 > 2;
  if (*(_QWORD *)(a1 + 40))
  {
    v9 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 67109120;
      v11 = v8;
      _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_DEFAULT, "Calling request access completion handler with result: %{BOOL}d", (uint8_t *)&v10, 8u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)_accessStatusChanged
{
  _QWORD block[5];

  -[EKEventStore reset](self, "reset");
  -[EKAuthStatusChecker clearCachedAuthStatus](self->_authStatusChecker, "clearCachedAuthStatus");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__EKEventStore__accessStatusChanged__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __36__EKEventStore__accessStatusChanged__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("EKEventStoreChangedNotification"), *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)canModifyCalendarDatabase
{
  return 1;
}

- (NSString)databasePath
{
  void *v2;
  void *v3;

  -[CADDatabaseInitializationOptions databaseDirectory](self->_initializationOptions, "databaseDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)allowDelegateSources
{
  return -[CADDatabaseInitializationOptions allowDelegateSources](self->_initializationOptions, "allowDelegateSources");
}

- (BOOL)allowsBirthdayModifications
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasBirthdayModificationEntitlement");
  if (v3)
    LOBYTE(v3) = self->_allowsBirthdayCalendarModifications;
  return v3;
}

+ (void)setDenyAccessToEvents:(BOOL)a3
{
  denyAccessToEvents = a3;
}

+ (void)setDenyAccessToReminders:(BOOL)a3
{
  denyAccessToReminders = a3;
}

- (void)setSourceAccountManagement:(int)a3
{
  -[EKEventStore setSourceAccountManagement:withBundleID:](self, "setSourceAccountManagement:withBundleID:", *(_QWORD *)&a3, 0);
}

- (void)setSourceAccountManagement:(int)a3 withBundleID:(id)a4
{
  uint64_t v4;
  CADDatabaseInitializationOptions *initializationOptions;
  id v7;
  CADDatabaseInitializationOptions *v8;
  id v9;

  v4 = *(_QWORD *)&a3;
  initializationOptions = self->_initializationOptions;
  v7 = a4;
  -[CADDatabaseInitializationOptions setManagement:](initializationOptions, "setManagement:", v4);
  -[CADDatabaseInitializationOptions setManagementBundleIdentifier:](self->_initializationOptions, "setManagementBundleIdentifier:", v7);

  v8 = self->_initializationOptions;
  -[EKEventStore connection](self, "connection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInitializationOptions:", v8);

}

- (void)setRemoteClientIdentity:(id)a3
{
  CADDatabaseInitializationOptions *initializationOptions;
  id v5;

  -[CADDatabaseInitializationOptions setRemoteClientIdentity:](self->_initializationOptions, "setRemoteClientIdentity:", a3);
  initializationOptions = self->_initializationOptions;
  -[EKEventStore connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInitializationOptions:", initializationOptions);

}

- (void)_setIsUnitTesting:(BOOL)a3
{
  uint64_t v4;
  CADDatabaseInitializationOptions *initializationOptions;
  void *v6;

  v4 = 4096;
  if (!a3)
    v4 = 0;
  self->_options = self->_options & 0xFFFFFFFFFFFFEFFFLL | v4;
  -[CADDatabaseInitializationOptions setUnitTesting:](self->_initializationOptions, "setUnitTesting:");
  initializationOptions = self->_initializationOptions;
  -[EKEventStore connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInitializationOptions:", initializationOptions);

  -[EKEventStore _updateDefaultDelayForThrottleEventStoreChangedNotifications](self, "_updateDefaultDelayForThrottleEventStoreChangedNotifications");
}

- (BOOL)_isUnitTesting
{
  return -[CADDatabaseInitializationOptions unitTesting](self->_initializationOptions, "unitTesting");
}

- (void)setPrivacyClientIdentity:(id)a3
{
  CADDatabaseInitializationOptions *initializationOptions;
  id v5;

  -[CADDatabaseInitializationOptions setPrivacyClientIdentity:](self->_initializationOptions, "setPrivacyClientIdentity:", a3);
  initializationOptions = self->_initializationOptions;
  -[EKEventStore connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInitializationOptions:", initializationOptions);

}

- (void)_simulateDaemonCrashForUnitTests
{
  void *v2;
  id v3;

  -[EKEventStore connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CADOperationProxySync");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADTestingSimulateDaemonCrash");

}

- (void)_setMockPermissions:(id)a3
{
  id v4;
  void *v5;
  CADDatabaseInitializationOptions *initializationOptions;
  void *v7;
  id v8;

  v8 = a3;
  -[CADDatabaseInitializationOptions mockPermissions](self->_initializationOptions, "mockPermissions");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 != v8)
  {
    -[CADDatabaseInitializationOptions setMockPermissions:](self->_initializationOptions, "setMockPermissions:", v8);
    initializationOptions = self->_initializationOptions;
    -[EKEventStore connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInitializationOptions:", initializationOptions);

    v5 = v8;
  }

}

- (int)sequenceNumber
{
  void *v2;
  int v3;

  -[EKEventStore sequenceToken](self, "sequenceToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sequenceForDatabaseID:", *MEMORY[0x1E0D0BE78]);

  return v3;
}

- (id)sequenceToken
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  -[EKEventStore connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__EKEventStore_sequenceToken__block_invoke;
  v6[3] = &unk_1E47881E0;
  v6[4] = &v7;
  objc_msgSend(v3, "CADDatabaseGetSequenceToken:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __29__EKEventStore_sequenceToken__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __29__EKEventStore_sequenceToken__block_invoke_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (void)changesSinceSequenceToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[EKEventStore connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADOperationProxySync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__EKEventStore_changesSinceSequenceToken_completion___block_invoke;
  v11[3] = &unk_1E4788208;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "CADDatabaseGetChangesSinceSequenceToken:reply:", v7, v11);

}

void __53__EKEventStore_changesSinceSequenceToken_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __53__EKEventStore_changesSinceSequenceToken_completion___block_invoke_cold_1(v9);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_invalidCADObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  v18 = 0;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[EKEventStore connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CADOperationProxySync");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__EKEventStore__invalidCADObjectIDs___block_invoke;
    v10[3] = &unk_1E4788230;
    v12 = &v13;
    v11 = v5;
    objc_msgSend(v7, "CADObjectsExist:reply:", v11, v10);

  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    -[EKEventStore _invalidCADObjectIDs:].cold.1();
  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __37__EKEventStore__invalidCADObjectIDs___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (a2)
  {
    if (a2 == 1010)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        __37__EKEventStore__invalidCADObjectIDs___block_invoke_cold_2();
      v7 = objc_msgSend(*(id *)(a1 + 32), "copy");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    else
    {
      v10 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        __37__EKEventStore__invalidCADObjectIDs___block_invoke_cold_1(v10);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (void)reminderStoreChanged
{
  _QWORD v3[4];
  id v4;
  id location;

  -[EKEventStore invalidateReminderSourceMaps](self, "invalidateReminderSourceMaps");
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__EKEventStore_reminderStoreChanged__block_invoke;
  v3[3] = &unk_1E4785050;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __36__EKEventStore_reminderStoreChanged__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4[0] = CFSTR("EKEventStoreRemindersDataChangedUserInfoKey");
    v4[1] = CFSTR("EKEventStoreCalendarDataChangedUserInfoKey");
    v5[0] = MEMORY[0x1E0C9AAB0];
    v5[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("EKEventStoreChangedNotification"), WeakRetained, v2);

  }
}

- (void)handleExternalDatabaseChangeNotification:(id)a3
{
  -[EKEventStore _handleExternalDatabaseChangeNotification:synchronously:](self, "_handleExternalDatabaseChangeNotification:synchronously:", a3, 1);
}

- (void)_handleExternalDatabaseChangedNotificationAsynchronously:(id)a3
{
  -[EKEventStore _handleExternalDatabaseChangeNotification:synchronously:](self, "_handleExternalDatabaseChangeNotification:synchronously:", a3, 0);
}

- (void)_handleExternalDatabaseChangeNotification:(id)a3 synchronously:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (_handleExternalDatabaseChangeNotification_synchronously__onceToken != -1)
    dispatch_once(&_handleExternalDatabaseChangeNotification_synchronously__onceToken, &__block_literal_global_172);
  objc_msgSend((id)_handleExternalDatabaseChangeNotification_synchronously__notificationToAction, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, EKEventStore *, _BOOL8))(v7 + 16))(v7, self, v4);
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore _handleExternalDatabaseChangeNotification:synchronously:].cold.1();
  }

}

void __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0BE70];
  v5[0] = *MEMORY[0x1E0D0BE60];
  v5[1] = v0;
  v6[0] = &__block_literal_global_174;
  v6[1] = &__block_literal_global_175;
  v1 = *MEMORY[0x1E0D0BEB8];
  v5[2] = *MEMORY[0x1E0D0BE68];
  v5[3] = v1;
  v6[2] = &__block_literal_global_176;
  v6[3] = &__block_literal_global_177;
  v2 = *MEMORY[0x1E0D0A828];
  v5[4] = CFSTR("com.apple.calendar.defaultAlarmChangedNotification");
  v5[5] = v2;
  v6[4] = &__block_literal_global_178;
  v6[5] = &__block_literal_global_179;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_handleExternalDatabaseChangeNotification_synchronously__notificationToAction;
  _handleExternalDatabaseChangeNotification_synchronously__notificationToAction = v3;

}

uint64_t __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "_databaseChangedExternally:processSynchronously:", 1, a3);
}

uint64_t __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "_databaseChangedExternally:processSynchronously:", 2, a3);
}

uint64_t __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "_databaseChangedExternally:processSynchronously:", 1, a3);
}

uint64_t __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_defaultCalendarChangedExternally");
}

uint64_t __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_defaultAlarmChangedExternally");
}

void __72__EKEventStore__handleExternalDatabaseChangeNotification_synchronously___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CB37D0];
  v3 = a2;
  objc_msgSend(v2, "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("EKEventStoreIdleChangeTrackingClientWasPurgedNotification"), v3);

}

- (void)_databaseChangedExternally:(unint64_t)a3 processSynchronously:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  char v8;
  void *v9;
  NSObject *dbChangedQueue;
  _QWORD v11[5];

  v4 = a4;
  if ((-[CADDatabaseInitializationOptions databaseInitOptions](self->_initializationOptions, "databaseInitOptions") & 4) == 0
    && -[EKEventStore eventAccessLevel](self, "eventAccessLevel") == 2)
  {
    -[EKEventStore connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasEverConnected");

    if ((v8 & 1) != 0)
    {
      if (-[EKEventStore returnEventResults](self, "returnEventResults"))
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __64__EKEventStore__databaseChangedExternally_processSynchronously___block_invoke;
        v11[3] = &unk_1E4785078;
        v11[4] = self;
        v9 = (void *)MEMORY[0x1A85849D4](v11);
        dbChangedQueue = self->_dbChangedQueue;
        if (v4)
          dispatch_sync(dbChangedQueue, v9);
        else
          dispatch_async(dbChangedQueue, v9);

      }
    }
    else
    {
      -[EKEventStore _postEventStoreChangedNotificationWithChangeType:changedObjectIDs:forceImmediate:](self, "_postEventStoreChangedNotificationWithChangeType:changedObjectIDs:forceImmediate:", a3, 0, 0);
    }
  }
}

void __64__EKEventStore__databaseChangedExternally_processSynchronously___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[9];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__23;
  v27 = __Block_byref_object_dispose__23;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__23;
  v21 = __Block_byref_object_dispose__23;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__23;
  v15 = __Block_byref_object_dispose__23;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 352);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__EKEventStore__databaseChangedExternally_processSynchronously___block_invoke_2;
  v6[3] = &unk_1E4788338;
  v6[4] = v4;
  v6[5] = &v17;
  v6[6] = &v11;
  v6[7] = &v23;
  v6[8] = &v7;
  objc_msgSend(v3, "CADDatabaseGetChangedEntityIDsSinceTimestamp:reply:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "_processExternalChangesWithLatestTimestamp:changedObjectIDsData:deletedObjectIDOffsets:changesWereSyncStatusOnly:forceImmediateNotification:", v24[5], v18[5], v12[5], *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

}

void __64__EKEventStore__databaseChangedExternally_processSynchronously___block_invoke_2(_QWORD *a1, int a2, void *a3, void *a4, void *a5, char a6)
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a2)
  {
    v15 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __64__EKEventStore__databaseChangedExternally_processSynchronously___block_invoke_2_cold_1((uint64_t)a1, v15);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a5);
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = a6;
  }

}

+ (void)EKObjectIDsFromData:(id)a3 deletedObjectIDOffsets:(id)a4 outChangedIDs:(id *)a5 outDeletedIDs:(id *)a6
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unsigned int *v29;
  void *v30;
  unint64_t v31;
  unsigned int *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id obj;
  unint64_t v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v50 != v13)
          objc_enumerationMutation(v7);
        v15 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "unsignedIntegerValue");
        v12 += v18;
        v11 = v11 - v18 + ((unint64_t)objc_msgSend(v16, "length") >> 3);

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v7;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v46;
    v39 = v8;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v46 != v38)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        objc_msgSend(obj, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v22);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v44, "unsignedIntegerValue");
        v42 = objc_msgSend(v23, "length");
        v25 = objc_msgSend(v22, "intValue");
        v43 = objc_retainAutorelease(v23);
        v26 = objc_msgSend(v43, "bytes");
        v27 = v26;
        v28 = v24;
        if (v24)
        {
          v29 = (unsigned int *)(v26 + 4);
          do
          {
            +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", *(v29 - 1), *v29, v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v30);

            v29 += 2;
            --v24;
          }
          while (v24);
        }
        v31 = (v42 >> 3) - v28;
        if (v42 >> 3 > v28)
        {
          v32 = (unsigned int *)(v27 + 8 * v28 + 4);
          do
          {
            +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", *(v32 - 1), *v32, v25);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v33);

            v32 += 2;
            --v31;
          }
          while (v31);
        }

        v8 = v39;
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v40);
  }

  v34 = objc_retainAutorelease(v19);
  *a5 = v34;
  v35 = objc_retainAutorelease(v20);
  *a6 = v35;

}

- (void)_processExternalChangesWithLatestTimestamp:(id)a3 changedObjectIDsData:(id)a4 deletedObjectIDOffsets:(id)a5 changesWereSyncStatusOnly:(BOOL)a6 forceImmediateNotification:(BOOL)a7
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  NSObject *registeredQueue;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  NSObject *calendarSourcesAndDefaultsQueue;
  uint64_t v34;
  NSObject *unsavedChangesQueue;
  char isKindOfClass;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  NSMutableArray *databaseWaitCallbacks;
  NSObject *v50;
  void *v51;
  void *v52;
  unint64_t m;
  void *v54;
  CADInMemoryChangeTimestamp *v55;
  int v56;
  NSObject *v57;
  _BOOL4 v58;
  NSMutableArray *v59;
  void *v60;
  CADInMemoryChangeTimestamp *lastDatabaseNotificationTimestamp;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  _BOOL4 v69;
  _BOOL4 v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[5];
  id v80;
  uint64_t *v81;
  BOOL v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[5];
  id v88;
  uint64_t *v89;
  BOOL v90;
  _QWORD v91[4];
  id v92;
  EKEventStore *v93;
  _QWORD v94[6];
  _QWORD v95[7];
  int v96;
  _QWORD v97[7];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  char v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD block[6];
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint8_t buf[4];
  CADInMemoryChangeTimestamp *v120;
  __int16 v121;
  CADInMemoryChangeTimestamp *v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v69 = a7;
  v70 = a6;
  v126 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v73 = a4;
  v72 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbChangedQueue);
  v71 = v11;
  if (v11)
    objc_storeStrong((id *)&self->_lastDatabaseNotificationTimestamp, a3);
  if (-[EKEventStore setRestoreGenerationChangedAndGetPreviousValue:](self, "setRestoreGenerationChangedAndGetPreviousValue:", 0))
  {
    -[EKEventStore _resetAndNotifyAfterDatabaseRestoreGenerationChanged](self, "_resetAndNotifyAfterDatabaseRestoreGenerationChanged");
  }
  else
  {
    if (v73)
    {
      v118 = 0;
      v117 = 0;
      +[EKEventStore EKObjectIDsFromData:deletedObjectIDOffsets:outChangedIDs:outDeletedIDs:](EKEventStore, "EKObjectIDsFromData:deletedObjectIDOffsets:outChangedIDs:outDeletedIDs:");
      v12 = (unint64_t)0;
      v13 = (unint64_t)0;
      v74 = (void *)v12;
      if (!(v12 | v13))
        goto LABEL_70;
      v14 = (void *)v13;
    }
    else
    {
      v111 = 0;
      v112 = &v111;
      v113 = 0x3032000000;
      v114 = __Block_byref_object_copy__23;
      v115 = __Block_byref_object_dispose__23;
      v116 = 0;
      registeredQueue = self->_registeredQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke;
      block[3] = &unk_1E4785190;
      block[5] = &v111;
      block[4] = self;
      dispatch_sync(registeredQueue, block);
      objc_msgSend((id)v112[5], "valueForKey:", CFSTR("CADObjectID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventStore _invalidCADObjectIDs:](self, "_invalidCADObjectIDs:", v16);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count") - objc_msgSend(v68, "count"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v68, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v107;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v107 != v20)
              objc_enumerationMutation(v18);
            v22 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i);
            +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "containsObject:", v22))
              v24 = v14;
            else
              v24 = v74;
            objc_msgSend(v24, "addObject:", v23);

          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
        }
        while (v19);
      }

      _Block_object_dispose(&v111, 8);
    }
    v25 = -[EKEventStore eventAccessLevel](self, "eventAccessLevel");
    v102 = 0;
    v103 = &v102;
    v104 = 0x2020000000;
    v105 = 0;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v26 = v14;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v98, v124, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v99;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v99 != v28)
            objc_enumerationMutation(v26);
          v30 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j);
          v111 = 0;
          v112 = &v111;
          v113 = 0x3032000000;
          v114 = __Block_byref_object_copy__23;
          v115 = __Block_byref_object_dispose__23;
          v116 = 0;
          v31 = self->_registeredQueue;
          v97[0] = MEMORY[0x1E0C809B0];
          v97[1] = 3221225472;
          v97[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_2;
          v97[3] = &unk_1E4785298;
          v97[6] = &v111;
          v97[4] = self;
          v97[5] = v30;
          dispatch_sync(v31, v97);
          v32 = (void *)v112[5];
          if (v32 && (objc_msgSend(v32, "isNew") & 1) == 0)
          {
            -[EKEventStore _cacheDeletedEventIdentifierIfNeededForObject:](self, "_cacheDeletedEventIdentifierIfNeededForObject:", v112[5]);
            calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
            v34 = MEMORY[0x1E0C809B0];
            v95[0] = MEMORY[0x1E0C809B0];
            v95[1] = 3221225472;
            v95[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_3;
            v95[3] = &unk_1E4788360;
            v95[4] = self;
            v95[5] = &v111;
            v96 = v25;
            v95[6] = &v102;
            dispatch_sync(calendarSourcesAndDefaultsQueue, v95);
            unsavedChangesQueue = self->_unsavedChangesQueue;
            v94[0] = v34;
            v94[1] = 3221225472;
            v94[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_4;
            v94[3] = &unk_1E47850A0;
            v94[4] = self;
            v94[5] = &v111;
            dispatch_sync(unsavedChangesQueue, v94);
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            v37 = v112[5];
            if ((isKindOfClass & 1) != 0)
              -[EKEventStore _detachObject:](self, "_detachObject:", v37);
            else
              -[EKEventStore _unregisterObject:](self, "_unregisterObject:", v37);
          }
          _Block_object_dispose(&v111, 8);

        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v98, v124, 16);
      }
      while (v27);
    }

    v38 = self->_unsavedChangesQueue;
    v39 = MEMORY[0x1E0C809B0];
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_5;
    v91[3] = &unk_1E47853B0;
    v67 = v26;
    v92 = v67;
    v93 = self;
    dispatch_sync(v38, v91);
    v111 = 0;
    v112 = &v111;
    v113 = 0x3032000000;
    v114 = __Block_byref_object_copy__23;
    v115 = __Block_byref_object_dispose__23;
    v116 = 0;
    v40 = self->_registeredQueue;
    v87[0] = v39;
    v87[1] = 3221225472;
    v87[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_6;
    v87[3] = &unk_1E4785428;
    v90 = v73 != 0;
    v89 = &v111;
    v87[4] = self;
    v75 = v74;
    v88 = v75;
    dispatch_sync(v40, v87);
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v41 = (id)v112[5];
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v83, v123, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v84;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v84 != v43)
            objc_enumerationMutation(v41);
          v45 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * k);
          v46 = (void *)MEMORY[0x1A85847F4]();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_msgSend(v45, "isNew") & 1) == 0)
          {
            objc_msgSend(v45, "refresh");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & (v25 != 1)) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & (v25 == 1)) == 1))
            {
              objc_msgSend(v45, "CADObjectID");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              -[EKEventStore _clearCachedConstraintsForObjectWithCADObjectID:](self, "_clearCachedConstraintsForObjectWithCADObjectID:", v47);

            }
          }
          objc_autoreleasePoolPop(v46);
        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v83, v123, 16);
      }
      while (v42);
    }

    v48 = self->_calendarSourcesAndDefaultsQueue;
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_7;
    v79[3] = &unk_1E4788388;
    v82 = v73 != 0;
    v79[4] = self;
    v76 = v75;
    v80 = v76;
    v81 = &v102;
    dispatch_sync(v48, v79);
    if (*((_BYTE *)v103 + 24))
      -[EKEventStore invalidateReminderSourceMaps](self, "invalidateReminderSourceMaps");
    -[EKEventStore _checkPendingIntegrationEvents:changedIDsValid:](self, "_checkPendingIntegrationEvents:changedIDsValid:", v76, v73 != 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    databaseWaitCallbacks = self->_databaseWaitCallbacks;
    if (databaseWaitCallbacks && -[NSMutableArray count](databaseWaitCallbacks, "count"))
    {
      v50 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2318000, v50, OS_LOG_TYPE_DEFAULT, "EKEventStore - Should loop _databaseWaitCallbacks", buf, 2u);
      }
      v51 = (void *)-[NSMutableArray copy](self->_databaseWaitCallbacks, "copy", v66);
      v52 = (void *)-[NSMutableArray copy](self->_databaseWaitTimestamps, "copy");
      for (m = 0; m < objc_msgSend(v51, "count"); ++m)
      {
        objc_msgSend(v51, "objectAtIndexedSubscript:", m);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectAtIndexedSubscript:", m);
        v55 = (CADInMemoryChangeTimestamp *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(MEMORY[0x1E0D0A0A0], "doesTimestamp:includeAllChangesVisibleToTimestamp:", self->_lastDatabaseNotificationTimestamp, v55);
        v57 = EKLogHandle;
        v58 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT);
        if (v56)
        {
          if (v58)
          {
            *(_DWORD *)buf = 138412290;
            v120 = v55;
            _os_log_impl(&dword_1A2318000, v57, OS_LOG_TYPE_DEFAULT, "Triggering database wait callback for timestamp: %@", buf, 0xCu);
          }
          v59 = self->_databaseWaitCallbacks;
          v60 = (void *)MEMORY[0x1A85849D4](v54);
          -[NSMutableArray removeObject:](v59, "removeObject:", v60);

          -[NSMutableArray removeObject:](self->_databaseWaitTimestamps, "removeObject:", v55);
          v77[0] = MEMORY[0x1E0C809B0];
          v77[1] = 3221225472;
          v77[2] = __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_188;
          v77[3] = &unk_1E47868A0;
          v78 = v54;
          dispatch_async(MEMORY[0x1E0C80D38], v77);

        }
        else if (v58)
        {
          lastDatabaseNotificationTimestamp = self->_lastDatabaseNotificationTimestamp;
          *(_DWORD *)buf = 138412546;
          v120 = lastDatabaseNotificationTimestamp;
          v121 = 2112;
          v122 = v55;
          _os_log_impl(&dword_1A2318000, v57, OS_LOG_TYPE_DEFAULT, "Timestamp after DB refresh is still older than timestamp it's waiting on. This is might be an error unless there are multiple waiting callbacks. currTimestamp: %@. waitOnTimestamp: %@", buf, 0x16u);
        }

      }
    }
    if (!v70 || -[EKEventStore enableSourceSyncStatusChanges](self, "enableSourceSyncStatusChanges"))
    {
      if (v73)
      {
        objc_msgSend(v76, "arrayByAddingObjectsFromArray:", v67);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v62;
        if (v66)
        {
          objc_msgSend(v62, "arrayByAddingObjectsFromArray:");
          v64 = objc_claimAutoreleasedReturnValue();

          v63 = (void *)v64;
        }
      }
      else
      {
        v63 = 0;
      }
      if (v70)
        v65 = 2;
      else
        v65 = 1;
      -[EKEventStore _postEventStoreChangedNotificationWithChangeType:changedObjectIDs:forceImmediate:](self, "_postEventStoreChangedNotificationWithChangeType:changedObjectIDs:forceImmediate:", v65, v63, v69, v66);

    }
    _Block_object_dispose(&v111, 8);

    _Block_object_dispose(&v102, 8);
  }
LABEL_70:

}

void __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 440), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "CADObjectID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_removeCachedCalendarWithCADID:", v5);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_clearCachedSources");
      v3 = *(void **)(a1 + 32);
      if (*(_DWORD *)(a1 + 56) == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "_clearAllCachedConstraints");
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "CADObjectID");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_clearCachedConstraintsForObjectWithCADObjectID:", v4);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

uint64_t __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_setPendingInsert:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_setPendingUpdate:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_setPendingDelete:", 0);
}

void __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count") && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 40) + 112);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "objectID", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v2, "containsObject:", v10);

          if (v11)
            objc_msgSend(v3, "addIndex:", v7 + v9);
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v7 += v9;
      }
      while (v6);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "removeObjectsAtIndexes:", v3);
  }
}

void __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectsForKeys:notFoundMarker:", v3, v10);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = (void *)v10;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "allValues");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }

}

void __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_7(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(_QWORD **)(a1 + 32);
  if (v2 && (v3[7] || v3[8]))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (!v5)
      goto LABEL_22;
    v6 = v5;
    v7 = *(_QWORD *)v20;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "entityType", (_QWORD)v19);
        v11 = *(_QWORD **)(a1 + 32);
        if (v10 == 6)
        {
          objc_msgSend(v11, "_clearCachedCalendars");
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          v12 = *(_QWORD **)(a1 + 32);
          if (!v12[8])
            continue;
          objc_msgSend(v12, "database");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "CADObjectIDWithGeneration:", objc_msgSend(v13, "databaseRestoreGeneration"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
            objc_msgSend(*(id *)(a1 + 32), "_clearCachedSources");
          goto LABEL_19;
        }
        if (v10 == 1 && v11[7] != 0)
        {
          objc_msgSend(v11, "database");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "CADObjectIDWithGeneration:", objc_msgSend(v17, "databaseRestoreGeneration"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            objc_msgSend(*(id *)(a1 + 32), "_cacheCalendarWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:", v14, 0, 0);
LABEL_19:

          continue;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v6)
      {
LABEL_22:

        return;
      }
    }
  }
  objc_msgSend(v3, "_clearCachedSources");
  objc_msgSend(*(id *)(a1 + 32), "_clearCachedCalendars");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
}

uint64_t __156__EKEventStore__processExternalChangesWithLatestTimestamp_changedObjectIDsData_deletedObjectIDOffsets_changesWereSyncStatusOnly_forceImmediateNotification___block_invoke_188(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_checkPendingIntegrationEvents:(id)a3 changedIDsValid:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t n;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ii;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  id v46;
  NSMutableDictionary *obj;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t m;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(uint64_t, int, void *);
  void *v82;
  void *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t v99[128];
  uint8_t buf[4];
  void *v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v4 = a4;
  v107 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbChangedQueue);
  if (v4)
  {
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v6 = v46;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v96;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v96 != v8)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "entityType", v46) == 2)
          {

            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
        if (v7)
          continue;
        break;
      }
    }
    goto LABEL_83;
  }
LABEL_12:
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = self->_pendingIntegrationEvents;
  v50 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
  if (!v50)
  {

    v6 = 0;
LABEL_83:
    v55 = 0;
    goto LABEL_84;
  }
  v55 = 0;
  v48 = *(_QWORD *)v92;
  v49 = 0;
  do
  {
    for (j = 0; j != v50; ++j)
    {
      if (*(_QWORD *)v92 != v48)
        objc_enumerationMutation(obj);
      v53 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingIntegrationEvents, "objectForKeyedSubscript:", v46);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventStore removeEmptyTablesInArray:](self, "removeEmptyTablesInArray:", v52);
      if (objc_msgSend(v52, "count"))
      {
        v85 = 0;
        v86 = &v85;
        v87 = 0x3032000000;
        v88 = __Block_byref_object_copy__23;
        v89 = __Block_byref_object_dispose__23;
        v90 = 0;
        -[EKEventStore connection](self, "connection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "CADOperationProxySync");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = MEMORY[0x1E0C809B0];
        v80 = 3221225472;
        v81 = __63__EKEventStore__checkPendingIntegrationEvents_changedIDsValid___block_invoke;
        v82 = &unk_1E4786AF0;
        v83 = v53;
        v84 = &v85;
        objc_msgSend(v11, "CADDatabaseGetAllEventsWithUniqueID:reply:");

        v12 = objc_msgSend((id)v86[5], "count");
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v13 = (id)v86[5];
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v75, v104, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v76;
            do
            {
              for (k = 0; k != v14; ++k)
              {
                if (*(_QWORD *)v76 != v15)
                  objc_enumerationMutation(v13);
                +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[EKEventStore publicObjectWithFetchedObjectID:](self, "publicObjectWithFetchedObjectID:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                  objc_msgSend(v61, "addObject:", v18);

              }
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v75, v104, 16);
            }
            while (v14);
          }

          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v54 = v52;
          v58 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v71, v103, 16);
          if (v58)
          {
            v60 = 0;
            v56 = *(_QWORD *)v72;
            do
            {
              for (m = 0; m != v58; ++m)
              {
                if (*(_QWORD *)v72 != v56)
                  objc_enumerationMutation(v54);
                v19 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * m);
                objc_msgSend(v19, "anyObject");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20)
                {
                  v57 = v19;
                  v69 = 0u;
                  v70 = 0u;
                  v67 = 0u;
                  v68 = 0u;
                  v21 = v61;
                  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v67, v102, 16);
                  if (v22)
                  {
                    v23 = *(_QWORD *)v68;
                    while (2)
                    {
                      for (n = 0; n != v22; ++n)
                      {
                        if (*(_QWORD *)v68 != v23)
                          objc_enumerationMutation(v21);
                        v25 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * n);
                        objc_msgSend(v25, "calendar");
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v20, "calendar");
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        v28 = objc_msgSend(v26, "isEqual:", v27);

                        if (v28)
                        {
                          v29 = (id)EKLogHandle;
                          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                          {
                            objc_msgSend(v20, "privacySafeIntegrationEventDescription");
                            v30 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543362;
                            v101 = v30;
                            _os_log_impl(&dword_1A2318000, v29, OS_LOG_TYPE_INFO, "Pending integration event has been matched; removing it: %{public}@",
                              buf,
                              0xCu);

                          }
                          objc_msgSend(v20, "objectID");
                          v59 = (void *)objc_claimAutoreleasedReturnValue();
                          v65 = 0u;
                          v66 = 0u;
                          v63 = 0u;
                          v64 = 0u;
                          v31 = v57;
                          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v63, v99, 16);
                          if (v32)
                          {
                            v33 = *(_QWORD *)v64;
                            do
                            {
                              for (ii = 0; ii != v32; ++ii)
                              {
                                if (*(_QWORD *)v64 != v33)
                                  objc_enumerationMutation(v31);
                                v35 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * ii);
                                objc_msgSend(v35, "backingObject");
                                v36 = (void *)objc_claimAutoreleasedReturnValue();
                                -[EKEventStore _objectDidReset:](self, "_objectDidReset:", v36);

                                objc_msgSend(v25, "backingObject");
                                v37 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v35, "setBackingObject:", v37);

                                objc_msgSend(v35, "_resetAfterUpdatingChangeSetOrBackingObject");
                              }
                              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v63, v99, 16);
                            }
                            while (v32);
                          }

                          v38 = v55;
                          if (!v55)
                            v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                          v55 = v38;
                          objc_msgSend(v38, "addObject:", v59);
                          v39 = v60;
                          if (!v60)
                            v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                          v60 = v39;
                          objc_msgSend(v39, "addObject:", v31);

                          goto LABEL_57;
                        }
                      }
                      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v67, v102, 16);
                      if (v22)
                        continue;
                      break;
                    }
                  }
LABEL_57:

                }
                else
                {
                  v40 = EKLogHandle;
                  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138543362;
                    v101 = v53;
                    _os_log_impl(&dword_1A2318000, v40, OS_LOG_TYPE_INFO, "Discarding empty pending integration event table for: %{public}@", buf, 0xCu);
                  }
                  v41 = v60;
                  if (!v60)
                    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v60 = v41;
                  objc_msgSend(v41, "addObject:", v19);
                }

              }
              v58 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v71, v103, 16);
            }
            while (v58);
          }
          else
          {
            v60 = 0;
          }

          v43 = v49;
          v44 = objc_msgSend(v60, "count");
          if (v44 == objc_msgSend(v54, "count"))
          {
            if (!v49)
              v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v43, "addObject:", v53);
          }
          else if (v60)
          {
            objc_msgSend(v54, "removeObjectsInArray:");
          }
          v49 = v43;

        }
        _Block_object_dispose(&v85, 8);

      }
      else
      {
        v42 = v49;
        if (!v49)
          v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v49 = v42;
        objc_msgSend(v42, "addObject:", v53);
      }

    }
    v50 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
  }
  while (v50);

  if (v49)
  {
    -[NSMutableDictionary removeObjectsForKeys:](self->_pendingIntegrationEvents, "removeObjectsForKeys:");
    v6 = v49;
  }
  else
  {
    v6 = 0;
  }
LABEL_84:

  return v55;
}

void __63__EKEventStore__checkPendingIntegrationEvents_changedIDsValid___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __63__EKEventStore__checkPendingIntegrationEvents_changedIDsValid___block_invoke_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (void)removeEmptyTablesInArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "anyObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          if (!v7)
            v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
          objc_msgSend(v7, "addIndex:", v6 + i);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 += i;
    }
    while (v5);
    if (v7)
    {
      objc_msgSend(v3, "removeObjectsAtIndexes:", v7);

    }
  }

}

- (void)_cacheDeletedEventIdentifierIfNeededForObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSCache *deletedEventUniqueIdentifiersCache;
  void *v9;
  char v10;

  v4 = a3;
  if (self->_deletedEventUniqueIdentifiersCache)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "propertyKeyForUniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      objc_msgSend(v4, "loadedOrUpdatedPropertyValue:wasAvailable:", v5, &v10);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v10 && v6)
      {
        deletedEventUniqueIdentifiersCache = self->_deletedEventUniqueIdentifiersCache;
        objc_msgSend(v4, "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache setObject:forKey:](deletedEventUniqueIdentifiersCache, "setObject:forKey:", v7, v9);

      }
    }
  }

}

+ (id)_contextForNotificationWithChangeType:(unint64_t)a3 changedObjectIDs:(id)a4
{
  id v5;
  id v6;
  uint64_t *v7;

  v5 = a4;
  if (_contextForNotificationWithChangeType_changedObjectIDs__onceToken != -1)
    dispatch_once(&_contextForNotificationWithChangeType_changedObjectIDs__onceToken, &__block_literal_global_189);
  if (a3 != 2)
  {
    v7 = &_contextForNotificationWithChangeType_changedObjectIDs__contextForNonSyncOnlyWithKnownChanges;
    if (!v5)
      v7 = &_contextForNotificationWithChangeType_changedObjectIDs__contextForNonSyncOnlyWithUnknownChanges;
    goto LABEL_10;
  }
  if (!v5)
  {
    v7 = &_contextForNotificationWithChangeType_changedObjectIDs__contextForSyncOnlyWithUnknownChanges;
LABEL_10:
    v6 = (id)*v7;
    goto LABEL_11;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

void __71__EKEventStore__contextForNotificationWithChangeType_changedObjectIDs___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[2];
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("EKEventStoreUnknownChangeKey");
  v0 = MEMORY[0x1E0C9AAB0];
  v12[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_contextForNotificationWithChangeType_changedObjectIDs__contextForSyncOnlyWithUnknownChanges;
  _contextForNotificationWithChangeType_changedObjectIDs__contextForSyncOnlyWithUnknownChanges = v1;

  v9 = CFSTR("EKEventStoreNonSyncOnlyChangeKey");
  v10 = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_contextForNotificationWithChangeType_changedObjectIDs__contextForNonSyncOnlyWithKnownChanges;
  _contextForNotificationWithChangeType_changedObjectIDs__contextForNonSyncOnlyWithKnownChanges = v3;

  v7[0] = CFSTR("EKEventStoreUnknownChangeKey");
  v7[1] = CFSTR("EKEventStoreNonSyncOnlyChangeKey");
  v8[0] = v0;
  v8[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_contextForNotificationWithChangeType_changedObjectIDs__contextForNonSyncOnlyWithUnknownChanges;
  _contextForNotificationWithChangeType_changedObjectIDs__contextForNonSyncOnlyWithUnknownChanges = v5;

}

- (void)_postEventStoreChangedNotificationWithChangeType:(unint64_t)a3 changedObjectIDs:(id)a4 forceImmediate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v5 = a5;
  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "_contextForNotificationWithChangeType:changedObjectIDs:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (v9)
    {
      v11 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("EKEventStoreForceImmediateChangeKey"));

      v10 = v11;
    }
    else
    {
      v12 = CFSTR("EKEventStoreForceImmediateChangeKey");
      v13[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[CalAccumulatingQueue updateTagsAndExecuteBlock:withContext:](self->_notificationAccumulatingQueue, "updateTagsAndExecuteBlock:withContext:", v8, v10);

}

- (void)_postEventStoreChangedNotificationWithTags:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v8 = CalMonotonicTime();
  self->_lastFiredEventStoreChangedNotificationTime = v8;
  v9 = v6;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EKEventStoreUnknownChangeKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = v9;
  if (v11)
  {

    v12 = 0;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EKEventStoreNonSyncOnlyChangeKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (!v14)
  {
    v15 = 2;
    if (v12)
      goto LABEL_5;
LABEL_7:
    v23[0] = CFSTR("EKEventStoreChangeTypeUserInfoKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    v24[1] = MEMORY[0x1E0C9AAB0];
    v23[1] = CFSTR("EKEventStoreCalendarDataChangedUserInfoKey");
    v23[2] = CFSTR("EKEventStoreRemindersDataChangedUserInfoKey");
    v24[2] = MEMORY[0x1E0C9AAA0];
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = v24;
    v19 = v23;
    v20 = 3;
    goto LABEL_8;
  }
  self->_lastFiredNonSyncOnlyEventStoreChangedNotificationTime = v8;
  v15 = 1;
  if (!v12)
    goto LABEL_7;
LABEL_5:
  v26[0] = v12;
  v25[0] = CFSTR("EKEventStoreChangedObjectIDsUserInfoKey");
  v25[1] = CFSTR("EKEventStoreChangeTypeUserInfoKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  v26[2] = MEMORY[0x1E0C9AAB0];
  v25[2] = CFSTR("EKEventStoreCalendarDataChangedUserInfoKey");
  v25[3] = CFSTR("EKEventStoreRemindersDataChangedUserInfoKey");
  v26[3] = MEMORY[0x1E0C9AAA0];
  v17 = (void *)MEMORY[0x1E0C99D80];
  v18 = v26;
  v19 = v25;
  v20 = 4;
LABEL_8:
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("EKEventStoreChangedNotification"), self, v21);

}

- (double)_throttleDelayForEventStoreChangedNotificationWithTags:(id)a3 context:(id)a4
{
  id v5;
  double v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  uint64_t v11;
  double v12;

  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v6 = 0.0;
  if (self->_defaultDelayForThrottledNotifications != 0.0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EKEventStoreForceImmediateChangeKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EKEventStoreNonSyncOnlyChangeKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      v11 = 256;
      if (v10)
        v11 = 264;
      objc_msgSend((id)objc_opt_class(), "_throttleDelayForEventStoreChangedNotificationWithLastFiredTime:delay:", *(Class *)((char *)&self->super.isa + v11), self->_defaultDelayForThrottledNotifications);
      v6 = v12;
    }
  }

  return v6;
}

+ (double)_throttleDelayForEventStoreChangedNotificationWithLastFiredTime:(unint64_t)a3 delay:(double)a4
{
  uint64_t v6;
  double result;
  mach_timebase_info info;

  if (!a3)
    return 0.0;
  info = 0;
  mach_timebase_info(&info);
  v6 = CalMonotonicTime();
  result = 0.0;
  if ((double)((v6 - a3) * info.numer / info.denom / 0x3B9ACA00) <= a4)
    return a4;
  return result;
}

- (void)_defaultCalendarChangedExternally
{
  NSObject *v3;
  void *v4;
  _QWORD block[5];

  -[EKEventStore calendarSourcesAndDefaultsQueue](self, "calendarSourcesAndDefaultsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__EKEventStore__defaultCalendarChangedExternally__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(v3, block);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("EKEventStoreCalendarsChangedNotification"), self);

}

void __49__EKEventStore__defaultCalendarChangedExternally__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (void)_defaultAlarmChangedExternally
{
  NSObject *v3;
  _QWORD block[5];

  -[EKEventStore calendarSourcesAndDefaultsQueue](self, "calendarSourcesAndDefaultsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__EKEventStore__defaultAlarmChangedExternally__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __46__EKEventStore__defaultAlarmChangedExternally__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 160);
  *(_QWORD *)(v2 + 160) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 168);
  *(_QWORD *)(v4 + 168) = 0;

}

- (void)daemonRestarted
{
  void *v3;
  int v4;

  -[EKEventStore dataProtectionObserver](self, "dataProtectionObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dataIsAccessible");

  if (v4)
    -[EKEventStore _databaseChangedExternally:processSynchronously:](self, "_databaseChangedExternally:processSynchronously:", 0, 0);
}

- (void)databaseRestoreGenerationChangedExternally:(int)a3
{
  _QWORD block[5];

  if (-[EKEventStore ignoreExternalChanges](self, "ignoreExternalChanges", *(_QWORD *)&a3))
  {
    if (databaseRestoreGenerationChangedExternally__onceToken != -1)
      dispatch_once(&databaseRestoreGenerationChangedExternally__onceToken, &__block_literal_global_191);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__EKEventStore_databaseRestoreGenerationChangedExternally___block_invoke_2;
    block[3] = &unk_1E4785078;
    block[4] = self;
    dispatch_async((dispatch_queue_t)databaseRestoreGenerationChangedExternally__autoResetQueue, block);
  }
  else
  {
    -[EKEventStore setRestoreGenerationChanged:](self, "setRestoreGenerationChanged:", 1);
  }
}

void __59__EKEventStore_databaseRestoreGenerationChangedExternally___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_DEFAULT, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.eventkit.autoreset", attr);
  v2 = (void *)databaseRestoreGenerationChangedExternally__autoResetQueue;
  databaseRestoreGenerationChangedExternally__autoResetQueue = (uint64_t)v1;

}

uint64_t __59__EKEventStore_databaseRestoreGenerationChangedExternally___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetAndNotifyAfterDatabaseRestoreGenerationChanged");
}

- (NSString)eventStoreIdentifier
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  -[EKEventStore connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__EKEventStore_eventStoreIdentifier__block_invoke;
  v6[3] = &unk_1E47883D0;
  v6[4] = &v7;
  objc_msgSend(v3, "CADDatabaseGetUUID:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __36__EKEventStore_eventStoreIdentifier__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __36__EKEventStore_eventStoreIdentifier__block_invoke_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (BOOL)automaticLocationGeocodingAllowed
{
  return +[EKFeatureSet automaticGeocodingEnabled](EKFeatureSet, "automaticGeocodingEnabled");
}

- (unint64_t)lastConfirmedSplashScreenVersion
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[EKEventStore connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__EKEventStore_lastConfirmedSplashScreenVersion__block_invoke;
  v6[3] = &unk_1E47883F8;
  v6[4] = &v7;
  objc_msgSend(v3, "CADDatabaseLastConfirmedSplashScreenVersion:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__EKEventStore_lastConfirmedSplashScreenVersion__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  return result;
}

- (BOOL)clientCanModifySources
{
  if (-[EKEventStore skipModificationValidation](self, "skipModificationValidation")
    || (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasTestingEntitlement") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsCalendarDaemon") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsPreferences") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsAutomator");
  }
}

- (id)_sourceWithID:(id)a3
{
  void *v3;
  EKSource *v4;

  -[EKEventStore objectWithObjectID:](self, "objectWithObjectID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[EKObject initWithPersistentObject:]([EKSource alloc], "initWithPersistentObject:", v3);
  else
    v4 = 0;

  return v4;
}

void __36__EKEventStore__loadSourcesIfNeeded__block_invoke_198(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "stampedCopyWithGeneration:", *(unsigned int *)(a1 + 56));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cacheSourceWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:", v7, v6, *(_QWORD *)(a1 + 40));

}

- (id)sourcesEnabledForEntityType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[EKEventStore sources](self, "sources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__EKEventStore_sourcesEnabledForEntityType___block_invoke;
  v8[3] = &__block_descriptor_40_e35_B24__0__EKSource_8__NSDictionary_16l;
  v8[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __44__EKEventStore_sourcesEnabledForEntityType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  v8 = (uint64_t *)(a1 + 32);
  v7 = v9;
  if (v9 == 1)
  {
    v10 = objc_msgSend(v5, "allowsTasks");
    goto LABEL_5;
  }
  if (!v7)
  {
    v10 = objc_msgSend(v5, "allowsEvents");
LABEL_5:
    v11 = v10;
    goto LABEL_9;
  }
  v12 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    __44__EKEventStore_sourcesEnabledForEntityType___block_invoke_cold_1(v8, v12);
  v11 = 0;
LABEL_9:

  return v11;
}

- (id)_deletableSources
{
  NSObject *calendarSourcesAndDefaultsQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = (id)objc_opt_new();
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__EKEventStore__deletableSources__block_invoke;
  v6[3] = &unk_1E47850A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __33__EKEventStore__deletableSources__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__23;
  v20 = __Block_byref_object_dispose__23;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __33__EKEventStore__deletableSources__block_invoke_2;
  v15[3] = &unk_1E4788490;
  v15[4] = &v16;
  objc_msgSend(v3, "CADDatabaseGetDeletableSources:", v15);

  v4 = (void *)v17[5];
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_sourceWithID:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
      }
      while (v6);
    }

  }
  _Block_object_dispose(&v16, 8);

}

void __33__EKEventStore__deletableSources__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __33__EKEventStore__deletableSources__block_invoke_2_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (id)getSubscribedCalendarsSourceCreateIfNeededWithError:(id *)a3
{
  NSObject *calendarSourcesAndDefaultsQueue;
  void *v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__23;
  v19 = __Block_byref_object_dispose__23;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__23;
  v13 = __Block_byref_object_dispose__23;
  v14 = 0;
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__EKEventStore_getSubscribedCalendarsSourceCreateIfNeededWithError___block_invoke;
  block[3] = &unk_1E4785338;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(calendarSourcesAndDefaultsQueue, block);
  if (v16[5])
  {
    -[EKEventStore publicObjectWithFetchedObjectID:](self, "publicObjectWithFetchedObjectID:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    if (a3)
      *a3 = objc_retainAutorelease((id)v10[5]);
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __68__EKEventStore_getSubscribedCalendarsSourceCreateIfNeededWithError___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  __int128 v9;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[6])
    goto LABEL_3;
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CADOperationProxySync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__EKEventStore_getSubscribedCalendarsSourceCreateIfNeededWithError___block_invoke_2;
  v8[3] = &unk_1E4787960;
  v9 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v4, "CADDatabaseGetOrCreateSubscribedCalendarsSource:", v8);

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
LABEL_3:
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __68__EKEventStore_getSubscribedCalendarsSourceCreateIfNeededWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __68__EKEventStore_getSubscribedCalendarsSourceCreateIfNeededWithError___block_invoke_2_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stampedCopyWithGeneration:", objc_msgSend(v9, "databaseRestoreGeneration"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 48);
    *(_QWORD *)(v11 + 48) = v10;

  }
}

- (id)localBirthdayCalendarCreateIfNeededWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *calendarSourcesAndDefaultsQueue;
  void *v9;
  void *v10;
  _QWORD block[6];
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__23;
  v24 = __Block_byref_object_dispose__23;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__23;
  v18 = __Block_byref_object_dispose__23;
  v19 = 0;
  -[EKEventStore connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADOperationProxySync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__EKEventStore_localBirthdayCalendarCreateIfNeededWithError___block_invoke;
  v13[3] = &unk_1E47884B8;
  v13[5] = &v20;
  v13[6] = &v14;
  v13[4] = self;
  objc_msgSend(v6, "CADDatabaseGetOrCreateBirthdayCalendar:", v13);

  if (v15[5])
  {
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __61__EKEventStore_localBirthdayCalendarCreateIfNeededWithError___block_invoke_203;
    block[3] = &unk_1E47850A0;
    block[4] = self;
    block[5] = &v14;
    dispatch_sync(calendarSourcesAndDefaultsQueue, block);
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v15[5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore publicObjectWithFetchedObjectID:](self, "publicObjectWithFetchedObjectID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease((id)v21[5]);
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __61__EKEventStore_localBirthdayCalendarCreateIfNeededWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __61__EKEventStore_localBirthdayCalendarCreateIfNeededWithError___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stampedCopyWithGeneration:", objc_msgSend(v9, "databaseRestoreGeneration"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

uint64_t __61__EKEventStore_localBirthdayCalendarCreateIfNeededWithError___block_invoke_203(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cacheCalendarWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0, 0);
}

- (id)delegateSourcesForSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[EKEventStore eventSources](self, "eventSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__EKEventStore_delegateSourcesForSource___block_invoke;
  v11[3] = &unk_1E4788520;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "predicateWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __41__EKEventStore_delegateSourcesForSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "isDelegate"))
  {
    objc_msgSend(v3, "delegatedAccountOwnerStoreID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "externalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)parentSourceForDelegateSource:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "delegatedAccountOwnerStoreID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[EKEventStore eventSources](self, "eventSources", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "externalID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", v4);

          if (v11)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore parentSourceForDelegateSource:].cold.1();
    v6 = 0;
  }

  return v6;
}

- (void)fetchGrantedDelegatesForSource:(id)a3 results:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  -[EKEventStore connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADOperationProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CADObjectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__EKEventStore_fetchGrantedDelegatesForSource_results___block_invoke;
  v12[3] = &unk_1E4788548;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "CADSourceGetGrantedDelegatesList:reply:", v10, v12);

}

void __55__EKEventStore_fetchGrantedDelegatesForSource_results___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __55__EKEventStore_fetchGrantedDelegatesForSource_results___block_invoke_cold_1(v6);
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_8:
      v8();
    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_8;
    }
  }

}

- (void)updateGrantedDelegate:(id)a3 action:(int64_t)a4 source:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[EKEventStore connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "CADOperationProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CADObjectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__EKEventStore_updateGrantedDelegate_action_source_completion___block_invoke;
  v17[3] = &unk_1E4788570;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v14, "CADSourceUpdateGrantedDelegate:action:sourceID:reply:", v12, a4, v15, v17);

}

void __63__EKEventStore_updateGrantedDelegate_action_source_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if ((_DWORD)a2)
  {
    v4 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __63__EKEventStore_updateGrantedDelegate_action_source_completion___block_invoke_cold_1(v4);
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
}

- (void)addExchangeDelegateWithName:(id)a3 emailAddress:(id)a4 toSource:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(void *, _QWORD, uint64_t, void *);
  void (**v14)(void *, _QWORD, uint64_t, void *);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  _QWORD v21[5];
  void (**v22)(void *, _QWORD, uint64_t, void *);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(void *, _QWORD, uint64_t, void *))a6;
  if (v13)
    v14 = v13;
  else
    v14 = (void (**)(void *, _QWORD, uint64_t, void *))&__block_literal_global_206;
  if (!v11)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = CFSTR("No emailAddress given");
LABEL_11:
    objc_msgSend(v18, "errorWithEKErrorCode:description:", 63, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, -1, v20);

    goto LABEL_12;
  }
  if (!v12)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = CFSTR("No source given");
    goto LABEL_11;
  }
  if (objc_msgSend(v12, "sourceType") != 1)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = CFSTR("Given source is not an Exchange source");
    goto LABEL_11;
  }
  -[EKEventStore connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "CADOperationProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CADObjectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__EKEventStore_addExchangeDelegateWithName_emailAddress_toSource_completion___block_invoke_2;
  v21[3] = &unk_1E47885D8;
  v21[4] = self;
  v22 = v14;
  objc_msgSend(v16, "CADSourceAddExchangeDelegateWithName:emailAddress:toSourceWithID:reply:", v10, v11, v17, v21);

LABEL_12:
}

void __77__EKEventStore_addExchangeDelegateWithName_emailAddress_toSource_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v12 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "database");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stampedCopyWithGeneration:", objc_msgSend(v8, "databaseRestoreGeneration"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_cacheSourceWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:", v9, 0, 0);
      v10 = *(void **)(a1 + 32);
      +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_sourceWithID:", v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

- (void)removeExchangeDelegate:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(void *, _QWORD, id);
  void (**v8)(void *, _QWORD, id);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(void *, _QWORD, id);

  v6 = a3;
  v7 = (void (**)(void *, _QWORD, id))a4;
  if (v7)
    v8 = v7;
  else
    v8 = (void (**)(void *, _QWORD, id))&__block_literal_global_214;
  if (!v6)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = CFSTR("No delegate given");
LABEL_11:
    objc_msgSend(v13, "errorWithEKErrorCode:description:", 63, v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
    goto LABEL_12;
  }
  if ((objc_msgSend(v6, "isDelegate") & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = CFSTR("Given source is not a delegate");
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "sourceType") != 1)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = CFSTR("Given delegate is not an Exchange source");
    goto LABEL_11;
  }
  objc_msgSend(v6, "CADObjectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CADOperationProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__EKEventStore_removeExchangeDelegate_completion___block_invoke_2;
  v15[3] = &unk_1E4788620;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v12 = v9;
  objc_msgSend(v11, "CADSourceRemoveExchangeDelegateWithID:reply:", v12, v15);

LABEL_12:
}

void __50__EKEventStore_removeExchangeDelegate_completion___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = a1[4];
    v5 = (void *)a1[5];
    v6 = *(NSObject **)(v4 + 360);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__EKEventStore_removeExchangeDelegate_completion___block_invoke_3;
    block[3] = &unk_1E47853B0;
    block[4] = v4;
    v9 = v5;
    dispatch_sync(v6, block);

    v3 = 0;
  }
  v7 = (id)v3;
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __50__EKEventStore_removeExchangeDelegate_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_clearCachedSources");
  return objc_msgSend(*(id *)(a1 + 32), "_clearCachedConstraintsForObjectWithCADObjectID:", *(_QWORD *)(a1 + 40));
}

- (id)_localSourceWithEnableIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  EKSource *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  EKSource *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a3;
  +[EKSource primaryLocalSourceID](EKSource, "primaryLocalSourceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKObject initWithPersistentObject:]([EKSource alloc], "initWithPersistentObject:", v6);
  v8 = -[EKSource isEnabledForEvents](v7, "isEnabledForEvents");
  v9 = -[EKSource sourceType](v7, "sourceType");
  v10 = v9;
  if (v3 & ~v8 || v9)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__23;
    v21 = __Block_byref_object_dispose__23;
    v22 = 0;
    -[EKEventStore connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CADOperationProxySync");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __47__EKEventStore__localSourceWithEnableIfNeeded___block_invoke;
    v16[3] = &unk_1E4788648;
    v16[4] = &v17;
    objc_msgSend(v13, "CADDatabaseGetLocalSourceWithEnableIfNeeded:reply:", v3, v16);

    if (v10)
      -[EKEventStore _clearAllCaches](self, "_clearAllCaches");
    if (v18[5])
    {
      -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:");
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = -[EKObject initWithPersistentObject:]([EKSource alloc], "initWithPersistentObject:", v14);
      v6 = (void *)v14;
    }
    else
    {
      v11 = 0;
    }
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

void __47__EKEventStore__localSourceWithEnableIfNeeded___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __36__EKEventStore__loadSourcesIfNeeded__block_invoke_cold_1(v6);
  }
  else
  {
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)localSource
{
  return -[EKEventStore _localSourceWithEnableIfNeeded:](self, "_localSourceWithEnableIfNeeded:", 0);
}

- (id)localSourceEnableIfNeeded
{
  return -[EKEventStore _localSourceWithEnableIfNeeded:](self, "_localSourceWithEnableIfNeeded:", 1);
}

- (id)localBirthdayCalendarSource
{
  NSObject *calendarSourcesAndDefaultsQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__EKEventStore_localBirthdayCalendarSource__block_invoke;
  v6[3] = &unk_1E47850A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  if (v8[5])
  {
    -[EKEventStore _sourceWithID:](self, "_sourceWithID:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __43__EKEventStore_localBirthdayCalendarSource__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2])
    goto LABEL_3;
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CADOperationProxySync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__EKEventStore_localBirthdayCalendarSource__block_invoke_2;
  v8[3] = &unk_1E4788670;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "CADDatabaseGetLocalBirthdaySource:", v8);

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
LABEL_3:
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __43__EKEventStore_localBirthdayCalendarSource__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __36__EKEventStore__loadSourcesIfNeeded__block_invoke_cold_1(v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stampedCopyWithGeneration:", objc_msgSend(v7, "databaseRestoreGeneration"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 16);
    *(_QWORD *)(v9 + 16) = v8;

  }
}

- (EKSource)sourceWithIdentifier:(NSString *)identifier
{
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = identifier;
  if (-[EKEventStore returnEventResults](self, "returnEventResults"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[EKEventStore sources](self, "sources", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v10, "sourceIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if ((v12 & 1) != 0)
          {
            v13 = v10;

            goto LABEL_15;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  if (-[EKEventStore returnReminderResults](self, "returnReminderResults"))
  {
    -[EKReminderStore sourceWithIdentifier:](self->_reminderStore, "sourceWithIdentifier:", v4);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_15:

  return (EKSource *)v13;
}

- (id)sourceWithExternalID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EKEventStore sources](self, "sources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "externalID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)primaryAppleAccountSource
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[EKEventStore eventSources](self, "eventSources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isPrimaryAppleAccount") & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)saveSource:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  EKEventStore *v10;
  _BOOL4 v11;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (a5)
    *a5 = 0;
  if (!v8)
    goto LABEL_12;
  objc_msgSend(v8, "eventStore");
  v10 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  if (v10 != self)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 11);
      LOBYTE(v11) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    LOBYTE(v11) = 0;
    goto LABEL_13;
  }
  if (!objc_msgSend(v9, "validate:", a5) || !objc_msgSend(v9, "save:", a5))
    goto LABEL_12;
  -[EKEventStore _addObjectToPendingCommits:](self, "_addObjectToPendingCommits:", v9);
  v11 = -[EKEventStore save:](self, "save:", a5);
  if (v11 && v6)
    LOBYTE(v11) = -[EKEventStore commitWithRollback:](self, "commitWithRollback:", a5);
LABEL_13:

  return v11;
}

- (BOOL)removeSource:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  EKEventStore *v10;
  BOOL v11;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (a5)
    *a5 = 0;
  if (!v8)
    goto LABEL_11;
  objc_msgSend(v8, "eventStore");
  v10 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  if (v10 != self)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 11);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v9, "remove:", a5))
    goto LABEL_11;
  -[EKEventStore _addObjectToPendingCommits:](self, "_addObjectToPendingCommits:", v9);
  if (!-[EKEventStore save:](self, "save:", a5))
    goto LABEL_11;
  objc_msgSend(v9, "markAsDeleted");
  v11 = !v6 || -[EKEventStore commitWithRollback:](self, "commitWithRollback:", a5);
LABEL_12:

  return v11;
}

- (void)_clearCachedSources
{
  NSMutableDictionary *sources;

  sources = self->_sources;
  self->_sources = 0;

}

- (BOOL)isSourceManaged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, char);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  if (-[EKEventStore returnEventResults](self, "returnEventResults") && objc_msgSend(v4, "allowsEvents"))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    objc_msgSend(v4, "externalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&isSourceManaged__cacheLock);
      objc_msgSend((id)isSourceManaged__kIsManagedCache, "objectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        -[EKEventStore connection](self, "connection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "CADOperationProxySync");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "CADObjectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = MEMORY[0x1E0C809B0];
        v16 = 3221225472;
        v17 = __32__EKEventStore_isSourceManaged___block_invoke;
        v18 = &unk_1E4786AC8;
        v19 = v4;
        v20 = &v21;
        objc_msgSend(v8, "CADObjectIsManaged:reply:", v9, &v15);

        if (!isSourceManaged__kIsManagedCache)
        {
          v10 = objc_alloc_init(MEMORY[0x1E0C99D38]);
          v11 = (void *)isSourceManaged__kIsManagedCache;
          isSourceManaged__kIsManagedCache = (uint64_t)v10;

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v22 + 24), v15, v16, v17, v18);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)isSourceManaged__kIsManagedCache, "setObject:forKey:", v6, v5);

      }
      os_unfair_lock_unlock((os_unfair_lock_t)&isSourceManaged__cacheLock);
      v12 = objc_msgSend(v6, "BOOLValue");

    }
    else
    {
      v12 = 0;
    }

    _Block_object_dispose(&v21, 8);
  }
  else if (-[EKEventStore returnReminderResults](self, "returnReminderResults")
         && objc_msgSend(v4, "allowsTasks"))
  {
    v12 = -[EKReminderStore isSourceManaged:](self->_reminderStore, "isSourceManaged:", v4);
  }
  else
  {
    v13 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore isSourceManaged:].cold.1(v13, v4);
    v12 = 0;
  }

  return v12;
}

void __32__EKEventStore_isSourceManaged___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  void *v5;

  if ((_DWORD)a2)
  {
    v5 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __32__EKEventStore_isSourceManaged___block_invoke_cold_1(a1, v5, a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
}

- (id)dbStatsBySource
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  -[EKEventStore connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__EKEventStore_dbStatsBySource__block_invoke;
  v6[3] = &unk_1E4788490;
  v6[4] = &v7;
  objc_msgSend(v3, "CADDatabaseStatsBySource:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__EKEventStore_dbStatsBySource__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __31__EKEventStore_dbStatsBySource__block_invoke_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (id)personaIdentifierForDatabaseID:(int)a3
{
  NSObject *calendarSourcesAndDefaultsQueue;
  id v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (!a3)
    return 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__23;
  v12 = __Block_byref_object_dispose__23;
  v13 = 0;
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke;
  block[3] = &unk_1E4785168;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(calendarSourcesAndDefaultsQueue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, int, void *);
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CADOperationProxySync");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_DWORD *)(a1 + 48);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke_2;
    v19 = &unk_1E47886B0;
    LODWORD(v21) = v9;
    v20 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "CADPersonaIdentifierForDatabaseID:reply:", MEMORY[0x1E0C809B0], 3221225472, __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke_2, &unk_1E47886B0, v20, v21);

    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v10)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      if (!v11)
      {
        v12 = objc_opt_new();
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(void **)(v13 + 72);
        *(_QWORD *)(v13 + 72) = v12;

        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v11 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v15);

    }
  }
}

void __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke_2_cold_1(a1, v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (void)_resetCachedPersonaIdentifiers
{
  NSMutableDictionary *personaIDByDatabaseID;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_calendarSourcesAndDefaultsQueue);
  personaIDByDatabaseID = self->_personaIDByDatabaseID;
  self->_personaIDByDatabaseID = 0;

}

- (NSArray)calendars
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[EKEventStore _allCalendars](self, "_allCalendars");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
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
        if ((objc_msgSend(v9, "allowedEntityTypes", (_QWORD)v13) & 1) != 0)
        {
          objc_msgSend(v9, "source");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "allowsEvents");

          if (v11)
            objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)hideCalendarsFromNotificationCenter:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  EKEventStore *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v20;
  id obj;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if (a4)
      *a4 = 0;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = v6;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v34;
LABEL_6:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v9);
        if (!v10)
          break;
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v9), "eventStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        if (v12)
          goto LABEL_22;
        objc_msgSend(v10, "eventStore");
        v13 = (EKEventStore *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == self;

        if (!v14)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 11);
            LOBYTE(v10) = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            break;
          }
LABEL_22:
          LOBYTE(v10) = 0;
          break;
        }
        v29 = 0;
        v30 = &v29;
        v31 = 0x2020000000;
        v32 = 0;
        v23 = 0;
        v24 = &v23;
        v25 = 0x3032000000;
        v26 = __Block_byref_object_copy__23;
        v27 = __Block_byref_object_dispose__23;
        v28 = 0;
        -[EKEventStore connection](self, "connection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "CADOperationProxySync");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "CADObjectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __58__EKEventStore_hideCalendarsFromNotificationCenter_error___block_invoke;
        v22[3] = &unk_1E47886D8;
        v22[4] = v10;
        v22[5] = &v23;
        v22[6] = &v29;
        objc_msgSend(v16, "CADCalendarSetClearedFromNotificationCenter:error:", v17, v22);

        if (a4)
          *a4 = objc_retainAutorelease((id)v24[5]);
        v18 = *((_BYTE *)v30 + 24) == 0;
        _Block_object_dispose(&v23, 8);

        _Block_object_dispose(&v29, 8);
        if (v18)
          goto LABEL_22;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          LOBYTE(v10) = 1;
          if (v7)
            goto LABEL_6;
          break;
        }
      }
    }
    else
    {
      LOBYTE(v10) = 1;
    }

    v6 = v20;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

void __58__EKEventStore_hideCalendarsFromNotificationCenter_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if ((_DWORD)a2)
  {
    v4 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __58__EKEventStore_hideCalendarsFromNotificationCenter_error___block_invoke_cold_1(a1, v4, a2);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __38__EKEventStore__loadCalendarsIfNeeded__block_invoke_234(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "stampedCopyWithGeneration:", *(unsigned int *)(a1 + 56));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cacheCalendarWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:", v7, v6, *(_QWORD *)(a1 + 40));

}

- (id)_deletableCalendars
{
  NSObject *calendarSourcesAndDefaultsQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = (id)objc_opt_new();
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__EKEventStore__deletableCalendars__block_invoke;
  v6[3] = &unk_1E47850A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__EKEventStore__deletableCalendars__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__23;
  v20 = __Block_byref_object_dispose__23;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __35__EKEventStore__deletableCalendars__block_invoke_2;
  v15[3] = &unk_1E4788490;
  v15[4] = &v16;
  objc_msgSend(v3, "CADDatabaseGetDeletableCalendars:", v15);

  v4 = (void *)v17[5];
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "calendarWithID:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
      }
      while (v6);
    }

  }
  _Block_object_dispose(&v16, 8);

}

void __35__EKEventStore__deletableCalendars__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __35__EKEventStore__deletableCalendars__block_invoke_2_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (BOOL)_calendar:(id)a3 supportsEntityType:(unint64_t)a4
{
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v12;

  v7 = a3;
  if (a4 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKEventStore.m"), 2814, CFSTR("Invalid entity type passed"));

  }
  if ((objc_msgSend(v7, "allowedEntityTypes") & (1 << a4)) != 0)
  {
    if (a4 == 1)
    {
      objc_msgSend(v7, "source");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "allowsTasks");
      goto LABEL_9;
    }
    if (!a4)
    {
      objc_msgSend(v7, "source");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "allowsEvents");
LABEL_9:
      v10 = v9;

      goto LABEL_10;
    }
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (int)readWriteCalendarCountForEntityType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EKEventStore _allCalendars](self, "_allCalendars", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[EKEventStore _calendar:supportsEntityType:](self, "_calendar:supportsEntityType:", v11, a3))
          v8 += objc_msgSend(v11, "allowsContentModifications");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)readWriteCalendarsForEntityType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EKEventStore _allCalendars](self, "_allCalendars", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[EKEventStore _calendar:supportsEntityType:](self, "_calendar:supportsEntityType:", v11, a3)
          && objc_msgSend(v11, "allowsContentModifications"))
        {
          if (!v8)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v8, "addObject:", v11);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_addRemovedObjectToPendingCommits:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "persistentObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNew");

  if ((v5 & 1) == 0)
    -[EKEventStore _addObjectToPendingCommits:](self, "_addObjectToPendingCommits:", v6);

}

- (void)_addObjectToPendingCommits:(id)a3
{
  id v4;
  NSObject *unsavedChangesQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__EKEventStore__addObjectToPendingCommits___block_invoke;
  block[3] = &unk_1E47853B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(unsavedChangesQueue, block);

}

uint64_t __43__EKEventStore__addObjectToPendingCommits___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 112))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v2 + 336))
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 336);
    *(_QWORD *)(v7 + 336) = v6;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 112), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "addObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)saveCalendar:(id)a3 error:(id *)a4
{
  return -[EKEventStore saveCalendar:commit:error:](self, "saveCalendar:commit:error:", a3, 1, a4);
}

- (BOOL)removeCalendar:(id)a3 error:(id *)a4
{
  return -[EKEventStore removeCalendar:commit:error:](self, "removeCalendar:commit:error:", a3, 1, a4);
}

- (BOOL)saveCalendar:(EKCalendar *)calendar commit:(BOOL)commit error:(NSError *)error
{
  _BOOL4 v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[8];
  id v12;

  v12 = 0;
  v6 = -[EKEventStore _saveCalendar:commit:error:](self, "_saveCalendar:commit:error:", calendar, commit, &v12);
  v7 = v12;
  v8 = v7;
  if (error)
    *error = (NSError *)objc_retainAutorelease(v7);
  v9 = EKLogHandle;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_INFO, "Saved calendar successfully", v11, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore saveCalendar:commit:error:].cold.1();
  }

  return v6;
}

- (BOOL)_saveCalendar:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  _BOOL4 v9;

  v6 = a4;
  v8 = a3;
  if (-[EKEventStore shouldSaveCalendarAsEventCalendar:](self, "shouldSaveCalendarAsEventCalendar:", v8)
    && !-[EKEventStore _saveCalendar:error:](self, "_saveCalendar:error:", v8, a5))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    if (-[EKEventStore shouldSaveCalendarAsReminderCalendar:](self, "shouldSaveCalendarAsReminderCalendar:", v8))
    {
      v9 = -[EKReminderStore saveCalendar:error:](self->_reminderStore, "saveCalendar:error:", v8, a5);
      if (!v9)
        goto LABEL_10;
    }
    else
    {
      LOBYTE(v9) = 1;
    }
    if (v6)
      LOBYTE(v9) = -[EKEventStore commitWithRollbackForNewClients:](self, "commitWithRollbackForNewClients:", a5);
  }
LABEL_10:

  return v9;
}

- (BOOL)_saveCalendar:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  EKEventStore *v9;
  id v10;
  void *v12;
  BOOL v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  v6 = a3;
  if (!a4)
  {
    if (!-[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase"))
      goto LABEL_14;
LABEL_5:
    if (-[EKEventStore eventAccessLevel](self, "eventAccessLevel") == 1 && objc_msgSend(v6, "isNew"))
    {
      if (a4)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = 17;
        goto LABEL_13;
      }
LABEL_14:
      LOBYTE(v10) = 0;
      goto LABEL_15;
    }
    if (!v6)
      goto LABEL_14;
    objc_msgSend(v6, "eventStore");
    v9 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

    if (v9 != self)
    {
      if (a4)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = 11;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    objc_msgSend(v6, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "allowEvents")
      && objc_msgSend(v12, "isPrimaryLocalSource")
      && (objc_msgSend(v12, "isEnabledForEvents") & 1) == 0
      && -[EKEventStore clientCanModifySources](self, "clientCanModifySources"))
    {
      objc_msgSend(v12, "setAllowsEvents:", 1);
      v17 = 0;
      v13 = -[EKEventStore saveSource:commit:error:](self, "saveSource:commit:error:", v12, 0, &v17);
      v10 = v17;
      if (!v13)
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          -[EKEventStore _saveCalendar:error:].cold.1();
          if (!a4)
            goto LABEL_29;
        }
        else if (!a4)
        {
          goto LABEL_29;
        }
        v10 = objc_retainAutorelease(v10);
        *a4 = v10;
        goto LABEL_29;
      }
      objc_msgSend(v6, "constraints");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAllowsEvents:", 1);

      v15 = 0;
    }
    else
    {
      v15 = 1;
    }
    if (objc_msgSend(v6, "validate:", a4) && objc_msgSend(v6, "save:", a4))
    {
      -[EKEventStore _addObjectToPendingCommits:](self, "_addObjectToPendingCommits:", v6);
      LODWORD(v10) = -[EKEventStore save:](self, "save:", a4);
    }
    else
    {
      LODWORD(v10) = 0;
    }
    if (((v15 | v10) & 1) != 0)
      goto LABEL_30;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore rollbackObjectsWithIdentifiers:](self, "rollbackObjectsWithIdentifiers:", v16);

    objc_msgSend(v12, "CADObjectID");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[EKEventStore _clearCachedConstraintsForObjectWithCADObjectID:](self, "_clearCachedConstraintsForObjectWithCADObjectID:", v10);
LABEL_29:

    LOBYTE(v10) = 0;
LABEL_30:

    goto LABEL_15;
  }
  *a4 = 0;
  if (-[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase"))
    goto LABEL_5;
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = 30;
LABEL_13:
  objc_msgSend(v7, "errorWithEKErrorCode:", v8);
  LOBYTE(v10) = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return (char)v10;
}

- (BOOL)removeCalendar:(EKCalendar *)calendar commit:(BOOL)commit error:(NSError *)error
{
  _BOOL4 v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[8];
  id v12;

  v12 = 0;
  v6 = -[EKEventStore _removeCalendar:commit:error:](self, "_removeCalendar:commit:error:", calendar, commit, &v12);
  v7 = v12;
  v8 = v7;
  if (error)
    *error = (NSError *)objc_retainAutorelease(v7);
  v9 = EKLogHandle;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_INFO, "Removed calendar successfully", v11, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore removeCalendar:commit:error:].cold.1();
  }

  return v6;
}

- (BOOL)_removeCalendar:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  _BOOL4 v9;

  v6 = a4;
  v8 = a3;
  if (!-[EKEventStore shouldSaveCalendarAsEventCalendar:](self, "shouldSaveCalendarAsEventCalendar:", v8)
    || (LOBYTE(v9) = 0,
        -[EKEventStore _removeEventCalendar:commit:error:](self, "_removeEventCalendar:commit:error:", v8, 0, a5)))
  {
    if (-[EKEventStore shouldSaveCalendarAsReminderCalendar:](self, "shouldSaveCalendarAsReminderCalendar:", v8))
    {
      v9 = -[EKReminderStore removeCalendar:error:](self->_reminderStore, "removeCalendar:error:", v8, a5);
      if (!v9)
        goto LABEL_9;
    }
    else
    {
      LOBYTE(v9) = 1;
    }
    if (v6)
      LOBYTE(v9) = -[EKEventStore commitWithRollbackForNewClients:](self, "commitWithRollbackForNewClients:", a5);
  }
LABEL_9:

  return v9;
}

- (BOOL)_removeEventCalendar:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  BOOL v9;
  BOOL v10;
  EKEventStore *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  v8 = a3;
  if (a5)
  {
    *a5 = 0;
    if (!-[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase"))
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = 30;
LABEL_11:
      objc_msgSend(v12, "errorWithEKErrorCode:", v13);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if (!v8)
      goto LABEL_16;
  }
  else
  {
    v9 = -[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase");
    v10 = 0;
    if (!v8 || !v9)
      goto LABEL_17;
  }
  objc_msgSend(v8, "eventStore");
  v11 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  if (v11 != self)
  {
    if (!a5)
    {
LABEL_16:
      v10 = 0;
      goto LABEL_17;
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 11;
    goto LABEL_11;
  }
  if (!objc_msgSend(v8, "remove:", a5))
    goto LABEL_16;
  -[EKEventStore _addRemovedObjectToPendingCommits:](self, "_addRemovedObjectToPendingCommits:", v8);
  if (!-[EKEventStore save:](self, "save:", a5))
    goto LABEL_16;
  objc_msgSend(v8, "markAsDeleted");
  v10 = !v6 || -[EKEventStore commitWithRollbackForNewClients:](self, "commitWithRollbackForNewClients:", a5);
LABEL_17:

  return v10;
}

- (BOOL)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  BOOL v10;
  EKEventStore *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  BOOL v15;

  v8 = a3;
  if (a5)
  {
    *a5 = 0;
    if (!-[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase"))
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = 30;
LABEL_11:
      objc_msgSend(v12, "errorWithEKErrorCode:", v13);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if (!v8)
      goto LABEL_12;
  }
  else
  {
    v9 = -[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase");
    v10 = 0;
    if (!v8 || !v9)
      goto LABEL_17;
  }
  objc_msgSend(v8, "eventStore");
  v11 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  if (v11 != self)
  {
    if (!a5)
    {
LABEL_12:
      v10 = 0;
      goto LABEL_17;
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 11;
    goto LABEL_11;
  }
  v14 = objc_msgSend(v8, "allowedEntityTypes") & ~a4;
  if (v14)
  {
    objc_msgSend(v8, "setAllowedEntityTypes:", v14);
    v15 = -[EKEventStore saveCalendar:commit:error:](self, "saveCalendar:commit:error:", v8, 1, a5);
  }
  else
  {
    v15 = -[EKEventStore removeCalendar:commit:error:](self, "removeCalendar:commit:error:", v8, 1, a5);
  }
  v10 = v15;
LABEL_17:

  return v10;
}

- (BOOL)eventsExistOnCalendar:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  -[EKEventStore predicateForCalendarItemsOfType:inCalendar:](self, "predicateForCalendarItemsOfType:inCalendar:", 1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore eventsMatchingPredicate:](self, "eventsMatchingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (BOOL)futureScheduledEventsExistOnCalendar:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v20;
  id obj;
  EKEventStore *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[EKEventStore predicateForEventsWithAttendeesInCalendar:](self, "predicateForEventsWithAttendeesInCalendar:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self;
  -[EKEventStore eventsMatchingPredicate:](self, "eventsMatchingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v7)
  {
    v18 = 0;
    goto LABEL_19;
  }
  v8 = v7;
  v20 = v4;
  v9 = *(_QWORD *)v24;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v24 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(v11, "endDateUnadjustedForLegacyClients");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "compare:", v12) == -1)
      {

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventStore doEvents:haveOccurrencesAfterDate:](v22, "doEvents:haveOccurrencesAfterDate:", v13, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");

        if (v16 != 1)
          continue;
      }
      objc_msgSend(v11, "selfAttendee");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {

LABEL_17:
        v18 = 1;
        goto LABEL_18;
      }
      if ((objc_msgSend(v11, "isSelfOrganized") & 1) != 0)
        goto LABEL_17;
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
      continue;
    break;
  }
  v18 = 0;
LABEL_18:
  v4 = v20;
LABEL_19:

  return v18;
}

- (BOOL)eventsMarkedScheduleAgentClientExistOnCalendar:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[EKEventStore predicateForScheduleAgentClientEventsInCalendar:](self, "predicateForScheduleAgentClientEventsInCalendar:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore eventsMatchingPredicate:](self, "eventsMatchingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v19 = v4;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v12, "suppressNotificationForChanges") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEventStore doEvents:haveOccurrencesAfterDate:](self, "doEvents:haveOccurrencesAfterDate:", v13, v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "integerValue");

          if (v16 == 1)
          {
            v17 = 1;
            goto LABEL_12;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
    v17 = 0;
LABEL_12:
    v4 = v19;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)eventsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[EKEventStore eventWithIdentifier:](self, "eventWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)eventWithRecurrenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  EKEvent *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  EKRecurrenceGenerator *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  uint64_t v32;
  EKEvent *v33;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "localUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore calendarItemWithIdentifier:](self, "calendarItemWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recurrenceDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/RID=%lu"), v9, (unint64_t)v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEventStore eventWithUniqueId:](self, "eventWithUniqueId:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v4, "recurrenceDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && objc_msgSend(v7, "hasRecurrenceRules"))
    {
      objc_msgSend(v7, "exceptionDates");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", v16);

      if ((v18 & 1) != 0)
      {
        v15 = 0;
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(v7, "timeZone");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v21 = v19;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      v22 = v21;

      v37 = v16;
      objc_msgSend(MEMORY[0x1E0D0C420], "calendarDateWithDate:timeZone:", v16, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc_init(EKRecurrenceGenerator);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(v7, "recurrenceRules");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v26)
      {
        v27 = v26;
        v35 = v22;
        v36 = v12;
        v28 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v39 != v28)
              objc_enumerationMutation(v25);
            if (-[EKRecurrenceGenerator occurrenceDate:matchesRecurrenceRule:forEvent:includeDetachedEventsInSeries:](v24, "occurrenceDate:matchesRecurrenceRule:forEvent:includeDetachedEventsInSeries:", v23, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), v7, 0))
            {

              v12 = v36;
              v14 = 0;
              v16 = v37;
              goto LABEL_22;
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          if (v27)
            continue;
          break;
        }

        v15 = 0;
        v22 = v35;
        v12 = v36;
      }
      else
      {

        v15 = 0;
      }
      v16 = v37;
      v14 = 0;
    }
    else
    {
LABEL_22:
      objc_msgSend(v7, "timeZone");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        -[EKEventStore timeZone](self, "timeZone");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dateInTimeZone:fromTimeZone:", v31, 0);
        v32 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v32;
      }
      v33 = [EKEvent alloc];
      objc_msgSend(v7, "persistentObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[EKEvent initWithPersistentObject:occurrenceDate:](v33, "initWithPersistentObject:occurrenceDate:", v22, v16);
    }

    goto LABEL_26;
  }
  v15 = 0;
LABEL_28:

  return v15;
}

- (EKEvent)eventWithIdentifier:(NSString *)identifier
{
  NSString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = identifier;
  if (v4)
  {
    -[EKEventStore _implicitUpgradeToFullAccessIfNeededWithReason:](self, "_implicitUpgradeToFullAccessIfNeededWithReason:", 6);
    -[NSString rangeOfString:](v4, "rangeOfString:", *MEMORY[0x1E0D0C518]);
    if (v5)
    {
      -[EKEventStore _eventWithEventIdentifier:](self, "_eventWithEventIdentifier:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[EKRecurrenceIdentifier recurrenceIdentifierWithString:](EKRecurrenceIdentifier, "recurrenceIdentifierWithString:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventStore eventWithRecurrenceIdentifier:](self, "eventWithRecurrenceIdentifier:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[EKEventStore _apiExpectedEventForEvent:](self, "_apiExpectedEventForEvent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (EKEvent *)v7;
}

- (id)validatedNonDeletedPersistentObjectWithObjectID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *unsavedChangesQueue;
  id v15;
  id v16;
  _QWORD block[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_16;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[EKEventStore objectsPendingCommit](self, "objectsPendingCommit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
      objc_msgSend(v10, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v7)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
    objc_msgSend(v10, "persistentObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_13;
  }
  else
  {
LABEL_10:

  }
  -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
LABEL_13:
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    unsavedChangesQueue = self->_unsavedChangesQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__EKEventStore_validatedNonDeletedPersistentObjectWithObjectID___block_invoke;
    block[3] = &unk_1E4785298;
    v20 = &v21;
    block[4] = self;
    v15 = v13;
    v19 = v15;
    dispatch_sync(unsavedChangesQueue, block);
    v16 = 0;
    if (!*((_BYTE *)v22 + 24))
      v16 = v15;

    _Block_object_dispose(&v21, 8);
  }
  else
  {
LABEL_16:
    v16 = 0;
  }

  return v16;
}

uint64_t __64__EKEventStore_validatedNonDeletedPersistentObjectWithObjectID___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 312), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)validatedNonDeletedPublicObjectWithObjectID:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[EKEventStore validatedNonDeletedPersistentObjectWithObjectID:](self, "validatedNonDeletedPersistentObjectWithObjectID:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[EKEventStore publicObjectWithPersistentObject:](self, "publicObjectWithPersistentObject:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_eventWithEventIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, int, void *);
  void *v22;
  id v23;
  uint64_t *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__23;
    v33 = __Block_byref_object_dispose__23;
    v34 = 0;
    if (-[EKEventStore eventAccessLevel](self, "eventAccessLevel") == 2)
    {
      -[EKEventStore objectsPendingCommit](self, "objectsPendingCommit");
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v26 != v7)
              objc_enumerationMutation(v5);
            v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v9, "eventIdentifier");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v4, "isEqual:", v10);

              if (v11)
              {
                objc_msgSend(v9, "objectID");
                v13 = objc_claimAutoreleasedReturnValue();
                v14 = (void *)v30[5];
                v30[5] = v13;

                goto LABEL_15;
              }
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_15:

    }
    v15 = v30[5];
    if (!v15)
    {
      -[EKEventStore connection](self, "connection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "CADOperationProxySync");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __42__EKEventStore__eventWithEventIdentifier___block_invoke;
      v22 = &unk_1E4788700;
      v23 = v4;
      v24 = &v29;
      objc_msgSend(v17, "CADDatabaseGetEventWithEventIdentifier:reply:", v23, &v19);

      v15 = v30[5];
    }
    -[EKEventStore validatedNonDeletedPublicObjectWithObjectID:](self, "validatedNonDeletedPublicObjectWithObjectID:", v15, v19, v20, v21, v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __42__EKEventStore__eventWithEventIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __42__EKEventStore__eventWithEventIdentifier___block_invoke_cold_1();
  }
  else
  {
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (BOOL)_parseURI:(id)a3 expectedScheme:(id)a4 identifier:(id *)a5 options:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
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
  unint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  id v37;
  BOOL v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id *v51;

  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", v10))
  {
    objc_msgSend(v9, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v11, "length") + 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("?"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "count"))
    {
      v38 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v51 = a6;
    objc_msgSend(v14, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "pathComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("x-apple-calevent")))
    {
      if (objc_msgSend(v16, "count") == 2)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v16, "objectAtIndex:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByRemovingPercentEncoding");
        v46 = v15;
        v48 = v16;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndex:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByRemovingPercentEncoding");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@:%@"), v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v46;
        if (v22)
        {
LABEL_6:
          if (a5)
            *a5 = objc_retainAutorelease(v22);
          v16 = v48;
          if (v51)
          {
            v45 = v22;
            *v51 = 0;
            objc_msgSend(v9, "query");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v23)
            {
              v47 = v15;
              v44 = v14;
              objc_msgSend(v23, "componentsSeparatedByString:", CFSTR("&"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
              v50 = (id)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v25, "count"))
              {
                v26 = 0;
                v27 = CFSTR("=");
                v49 = v24;
                do
                {
                  objc_msgSend(v24, "componentsSeparatedByString:", v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v28, "count") == 2)
                  {
                    objc_msgSend(v28, "objectAtIndex:", 0);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "objectAtIndex:", 1);
                    v30 = v11;
                    v31 = v9;
                    v32 = v10;
                    v33 = v25;
                    v34 = v27;
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "stringByRemovingPercentEncoding");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                    v27 = v34;
                    v25 = v33;
                    v10 = v32;
                    v9 = v31;
                    v11 = v30;
                    objc_msgSend(v50, "setObject:forKey:", v36, v29);

                    v24 = v49;
                  }

                  ++v26;
                }
                while (v26 < objc_msgSend(v25, "count"));
              }
              v37 = objc_retainAutorelease(v50);
              *v51 = v37;

              v14 = v44;
              v15 = v47;
              v16 = v48;
            }

            v38 = 1;
            v22 = v45;
          }
          else
          {
            v38 = 1;
          }
          goto LABEL_29;
        }
        goto LABEL_27;
      }
LABEL_28:
      v22 = 0;
      v38 = 0;
      goto LABEL_29;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("x-apple-calendar")))
    {
      if (objc_msgSend(v16, "count") != 1)
        goto LABEL_28;
      v48 = v16;
      v39 = v16;
      v40 = 0;
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("x-apple-reminderkit")))
        goto LABEL_28;
      if (objc_msgSend(v16, "count") != 2)
        goto LABEL_28;
      objc_msgSend(v16, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("REMCDReminder"));

      if (!v42)
        goto LABEL_28;
      v48 = v16;
      v39 = v16;
      v40 = 1;
    }
    objc_msgSend(v39, "objectAtIndex:", v40);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      goto LABEL_6;
LABEL_27:
    v38 = 0;
    v16 = v48;
LABEL_29:

    v13 = v15;
    goto LABEL_30;
  }
  v38 = 0;
LABEL_31:

  return v38;
}

- (id)eventWithExternalURI:(id)a3
{
  return -[EKEventStore _eventWithURI:checkValid:](self, "_eventWithURI:checkValid:", a3, 1);
}

- (id)_eventWithURI:(id)a3 checkValid:(BOOL)a4
{
  id v6;
  BOOL v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  EKEvent *v15;
  void *v16;
  void *v17;
  void *v18;
  EKEvent *v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, int, void *);
  void *v25;
  id v26;
  uint64_t *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__23;
  v34 = __Block_byref_object_dispose__23;
  v35 = 0;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKEventStore.m"), 3426, CFSTR("Nil URI passed"));

  }
  v28 = 0;
  v29 = 0;
  v7 = -[EKEventStore _parseURI:expectedScheme:identifier:options:](self, "_parseURI:expectedScheme:identifier:options:", v6, CFSTR("x-apple-calevent"), &v29, &v28);
  v8 = v29;
  v9 = v28;
  v10 = v9;
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("o"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
    -[EKEventStore connection](self, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "CADOperationProxySync");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __41__EKEventStore__eventWithURI_checkValid___block_invoke;
    v25 = &unk_1E4788700;
    v26 = v6;
    v27 = &v30;
    objc_msgSend(v17, "CADDatabaseGetEventWithEventIdentifier:reply:", v8, &v22);

    if (v31[5])
    {
      -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v22, v23, v24, v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        v19 = -[EKEvent initWithPersistentObject:occurrenceDate:]([EKEvent alloc], "initWithPersistentObject:occurrenceDate:", v18, v14);
      else
        v19 = 0;

    }
    else
    {
      v19 = 0;
    }
    v15 = v19;

  }
  else
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore _eventWithURI:checkValid:].cold.1();
    v15 = 0;
  }

  _Block_object_dispose(&v30, 8);
  return v15;
}

void __41__EKEventStore__eventWithURI_checkValid___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __41__EKEventStore__eventWithURI_checkValid___block_invoke_cold_1();
  }
  else
  {
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (id)_eventOccurrenceWithURI:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, int, void *);
  void *v23;
  id v24;
  uint64_t *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__23;
  v32 = __Block_byref_object_dispose__23;
  v33 = 0;
  v26 = 0;
  v27 = 0;
  v5 = -[EKEventStore _parseURI:expectedScheme:identifier:options:](self, "_parseURI:expectedScheme:identifier:options:", v4, CFSTR("x-apple-calevent"), &v27, &v26);
  v6 = v27;
  v7 = v26;
  v8 = v7;
  if (v5)
  {
    if (!v7)
      goto LABEL_11;
    objc_msgSend(v7, "objectForKey:", CFSTR("o"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
      goto LABEL_11;
    v11 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[EKEventStore connection](self, "connection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "CADOperationProxySync");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __40__EKEventStore__eventOccurrenceWithURI___block_invoke;
      v23 = &unk_1E4788700;
      v24 = v4;
      v25 = &v28;
      objc_msgSend(v14, "CADDatabaseGetEventWithEventIdentifier:reply:", v6, &v20);

      if (v29[5])
      {
        objc_msgSend(v12, "timeIntervalSinceReferenceDate", v20, v21, v22, v23);
        -[EKEventStore closestCachedOccurrenceToDate:forEventObjectID:](self, "closestCachedOccurrenceToDate:forEventObjectID:", v29[5]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToDate:", v12);

        if (v17)
          v18 = v15;
        else
          v18 = 0;

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
LABEL_11:
      -[EKEventStore _eventWithURI:checkValid:](self, "_eventWithURI:checkValid:", v4, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore _eventWithURI:checkValid:].cold.1();
    v18 = 0;
  }

  _Block_object_dispose(&v28, 8);
  return v18;
}

void __40__EKEventStore__eventOccurrenceWithURI___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __41__EKEventStore__eventWithURI_checkValid___block_invoke_cold_1();
  }
  else
  {
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (id)eventForUID:(id)a3 occurrenceDate:(id)a4
{
  return -[EKEventStore eventForUID:occurrenceDate:checkValid:](self, "eventForUID:occurrenceDate:checkValid:", a3, a4, 1);
}

- (id)eventForUID:(id)a3 occurrenceDate:(id)a4 checkValid:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  EKEvent *v15;
  uint64_t v16;
  void *v17;
  EKEvent *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    if (v5)
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:", 2, objc_msgSend(v8, "intValue"));
      -[EKEventStore connection](self, "connection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "CADOperationProxySync");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __54__EKEventStore_eventForUID_occurrenceDate_checkValid___block_invoke;
      v20[3] = &unk_1E4787938;
      v20[4] = &v21;
      objc_msgSend(v12, "CADObjectExists:reply:", v10, v20);

      if (*((_BYTE *)v22 + 24))
      {
        +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }

      _Block_object_dispose(&v21, 8);
      if (!v14)
        goto LABEL_10;
    }
    else
    {
      v16 = objc_msgSend(v8, "intValue");
      +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", 2, v16, *MEMORY[0x1E0D0BE78]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
LABEL_10:
        v18 = 0;
        goto LABEL_11;
      }
    }
    v18 = -[EKEvent initWithPersistentObject:occurrenceDate:]([EKEvent alloc], "initWithPersistentObject:occurrenceDate:", v14, v9);
LABEL_11:
    v15 = v18;

    goto LABEL_12;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

void __54__EKEventStore_eventForUID_occurrenceDate_checkValid___block_invoke(uint64_t a1, int a2, char a3)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __54__EKEventStore_eventForUID_occurrenceDate_checkValid___block_invoke_cold_1(v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)eventForObjectID:(id)a3 occurrenceDate:(id)a4
{
  return -[EKEventStore eventForObjectID:occurrenceDate:checkValid:](self, "eventForObjectID:occurrenceDate:checkValid:", a3, a4, 1);
}

void __59__EKEventStore_eventForObjectID_occurrenceDate_checkValid___block_invoke(uint64_t a1, int a2, char a3)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __59__EKEventStore_eventForObjectID_occurrenceDate_checkValid___block_invoke_cold_1(v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)eventWithUniqueId:(id)a3
{
  return -[EKEventStore eventWithUniqueId:occurrenceDate:](self, "eventWithUniqueId:occurrenceDate:", a3, 0);
}

- (id)eventWithUniqueId:(id)a3 occurrenceDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  EKEvent *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__23;
  v34 = __Block_byref_object_dispose__23;
  v35 = 0;
  if (v6)
  {
    -[EKEventStore objectsPendingCommit](self, "objectsPendingCommit");
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "uniqueIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v6, "isEqual:", v12);

            if (v13)
            {
              objc_msgSend(v11, "objectID");
              v15 = objc_claimAutoreleasedReturnValue();
              v16 = (void *)v31[5];
              v31[5] = v15;

              goto LABEL_14;
            }
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

    v17 = v31[5];
    if (!v17)
    {
      -[EKEventStore connection](self, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "CADOperationProxySync");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __49__EKEventStore_eventWithUniqueId_occurrenceDate___block_invoke;
      v23[3] = &unk_1E4788700;
      v24 = v6;
      v25 = &v30;
      objc_msgSend(v19, "CADDatabaseGetEventWithUniqueID:reply:", v24, v23);

      v17 = v31[5];
    }
    -[EKEventStore validatedNonDeletedPersistentObjectWithObjectID:](self, "validatedNonDeletedPersistentObjectWithObjectID:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      v14 = -[EKEvent initWithPersistentObject:occurrenceDate:]([EKEvent alloc], "initWithPersistentObject:occurrenceDate:", v20, v22);
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }
  _Block_object_dispose(&v30, 8);

  return v14;
}

void __49__EKEventStore_eventWithUniqueId_occurrenceDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __49__EKEventStore_eventWithUniqueId_occurrenceDate___block_invoke_cold_1();
  }
  else
  {
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (id)eventWithUUID:(id)a3 occurrenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  EKEvent *v12;
  EKEvent *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, int, void *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__23;
    v25 = __Block_byref_object_dispose__23;
    v26 = 0;
    -[EKEventStore connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CADOperationProxySync");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __45__EKEventStore_eventWithUUID_occurrenceDate___block_invoke;
    v18 = &unk_1E4788700;
    v19 = v6;
    v20 = &v21;
    objc_msgSend(v9, "CADDatabaseGetCalendarItemWithUUID:reply:", v19, &v15);

    if (v22[5])
    {
      +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v15, v16, v17, v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v12 = -[EKEvent initWithPersistentObject:occurrenceDate:]([EKEvent alloc], "initWithPersistentObject:occurrenceDate:", v11, v7);
      else
        v12 = 0;

    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __45__EKEventStore_eventWithUUID_occurrenceDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __45__EKEventStore_eventWithUUID_occurrenceDate___block_invoke_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (id)_entityWrappersForEventUUIDs:(id)a3 inCalendars:(id)a4 propertiesToLoad:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "valueForKey:", CFSTR("CADObjectID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__23;
  v24 = __Block_byref_object_dispose__23;
  v25 = 0;
  -[EKEventStore connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CADOperationProxySync");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__EKEventStore__entityWrappersForEventUUIDs_inCalendars_propertiesToLoad___block_invoke;
  v17[3] = &unk_1E4786AF0;
  v14 = v8;
  v18 = v14;
  v19 = &v20;
  objc_msgSend(v13, "CADDatabaseGetCalendarItemsWithUUIDs:inCalendars:propertiesToLoad:reply:", v14, v11, v10, v17);

  v15 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v15;
}

void __74__EKEventStore__entityWrappersForEventUUIDs_inCalendars_propertiesToLoad___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __74__EKEventStore__entityWrappersForEventUUIDs_inCalendars_propertiesToLoad___block_invoke_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (BOOL)eventWithUUID:(id)a3 isInCalendars:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventStore _entityWrappersForEventUUIDs:inCalendars:propertiesToLoad:](self, "_entityWrappersForEventUUIDs:inCalendars:propertiesToLoad:", v9, v7, MEMORY[0x1E0C9AA60], v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v10, "count") != 0;
  return (char)v8;
}

- (id)eventsWithUUIDToOccurrenceDateMap:(id)a3 inCalendars:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  EKEvent *v27;
  void *v29;
  id v30;
  id obj;
  EKEventStore *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _QWORD v47[7];

  v47[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = *MEMORY[0x1E0D0B308];
    v47[0] = *MEMORY[0x1E0D0B820];
    v47[1] = v8;
    v9 = *MEMORY[0x1E0D0B680];
    v47[2] = *MEMORY[0x1E0D0B3D0];
    v47[3] = v9;
    v47[4] = *MEMORY[0x1E0D0B360];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 5);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v10;
    -[EKEventStore _entityWrappersForEventUUIDs:inCalendars:propertiesToLoad:](self, "_entityWrappersForEventUUIDs:inCalendars:propertiesToLoad:", v12, v7, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v29 = v13;
      v30 = v7;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      obj = v13;
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v36)
      {
        v33 = v6;
        v34 = *(_QWORD *)v42;
        v32 = self;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v42 != v34)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v15, "loadedValues", v29, v30);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "firstObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "objectID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "loadedValues");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEventStore registerFetchedObjectWithID:withDefaultLoadedPropertyKeys:values:](self, "registerFetchedObjectWithID:withDefaultLoadedPropertyKeys:values:", v19, v35, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              v39 = 0u;
              v40 = 0u;
              v37 = 0u;
              v38 = 0u;
              objc_msgSend(v6, "objectForKeyedSubscript:", v17);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v38;
                do
                {
                  for (j = 0; j != v24; ++j)
                  {
                    if (*(_QWORD *)v38 != v25)
                      objc_enumerationMutation(v22);
                    v27 = -[EKEvent initWithPersistentObject:occurrenceDate:]([EKEvent alloc], "initWithPersistentObject:occurrenceDate:", v21, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
                    objc_msgSend(v11, "addObject:", v27);

                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                }
                while (v24);
              }

              self = v32;
              v6 = v33;
            }

          }
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v36);
      }

      v13 = v29;
      v7 = v30;
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (id)allEventsWithUniqueId:(id)a3 occurrenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  EKEvent *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = (id)objc_opt_new();
  if (v6)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__23;
    v30 = __Block_byref_object_dispose__23;
    v31 = 0;
    -[EKEventStore connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CADOperationProxySync");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __53__EKEventStore_allEventsWithUniqueId_occurrenceDate___block_invoke;
    v23[3] = &unk_1E4786AF0;
    v24 = v6;
    v25 = &v26;
    objc_msgSend(v9, "CADDatabaseGetAllEventsWithUniqueID:reply:", v24, v23);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = (id)v27[5];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v10);
          if (*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i))
          {
            +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              v16 = -[EKEvent initWithPersistentObject:occurrenceDate:]([EKEvent alloc], "initWithPersistentObject:occurrenceDate:", v15, v7);
              objc_msgSend(v18, "addObject:", v16);

            }
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
      }
      while (v11);
    }

    _Block_object_dispose(&v26, 8);
  }

  return v18;
}

void __53__EKEventStore_allEventsWithUniqueId_occurrenceDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __53__EKEventStore_allEventsWithUniqueId_occurrenceDate___block_invoke_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (id)_apiExpectedEventForEvent:(id)a3
{
  return a3;
}

- (id)_apiExpectedEventsForEvents:(id)a3
{
  return a3;
}

- (BOOL)saveEvent:(EKEvent *)event span:(EKSpan)span error:(NSError *)error
{
  return -[EKEventStore saveEvent:span:commit:error:](self, "saveEvent:span:commit:error:", event, span, 1, error);
}

- (BOOL)removeEvent:(EKEvent *)event span:(EKSpan)span error:(NSError *)error
{
  return -[EKEventStore removeEvent:span:commit:error:](self, "removeEvent:span:commit:error:", event, span, 1, error);
}

- (BOOL)saveEvent:(EKEvent *)event span:(EKSpan)span commit:(BOOL)commit error:(NSError *)error
{
  _BOOL8 v7;
  NSObject *v10;
  EKEvent *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint8_t v22[16];
  uint8_t v23[8];
  id v24;
  uint8_t buf[16];

  v7 = commit;
  v10 = EKSavingSignpostsHandle;
  v11 = event;
  v12 = os_signpost_id_generate(v10);
  v13 = (id)EKSavingSignpostsHandle;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2318000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "saveEvent", ", buf, 2u);
  }

  v24 = 0;
  v15 = -[EKEventStore _saveEvent:span:commit:error:](self, "_saveEvent:span:commit:error:", v11, span, v7, &v24);

  v16 = v24;
  v17 = v16;
  if (error)
    *error = (NSError *)objc_retainAutorelease(v16);
  v18 = EKLogHandle;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1A2318000, v18, OS_LOG_TYPE_INFO, "Saved event successfully", v23, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore saveEvent:span:commit:error:].cold.1();
  }
  v19 = (id)EKSavingSignpostsHandle;
  v20 = v19;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2318000, v20, OS_SIGNPOST_INTERVAL_END, v12, "saveEvent", ", v22, 2u);
  }

  return v15;
}

- (BOOL)_saveEvent:(id)a3 span:(int64_t)a4 commit:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  BOOL v11;
  BOOL v12;
  EKEventStore *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  char v20;
  void *v21;
  int v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  void *v26;

  v7 = a5;
  v10 = a3;
  if (a6)
  {
    *a6 = 0;
    if (!-[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase"))
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = 30;
      goto LABEL_11;
    }
    if (!v10)
      goto LABEL_31;
LABEL_7:
    objc_msgSend(v10, "eventStore");
    v13 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

    if (v13 != self)
    {
      if (a6)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = 11;
LABEL_11:
        objc_msgSend(v14, "errorWithEKErrorCode:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
        v12 = 0;
        *a6 = v16;
        goto LABEL_32;
      }
LABEL_31:
      v12 = 0;
      goto LABEL_32;
    }
    if ((objc_msgSend(v10, "isNew") & 1) == 0)
    {
      objc_msgSend(v10, "persistentObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "_isPendingInsert"))
      {

      }
      else
      {
        objc_msgSend(v10, "persistentObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[EKEventStore _isRegisteredObject:](self, "_isRegisteredObject:", v18);

        if (!v19)
        {
          if (a6)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", 1010);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
          goto LABEL_31;
        }
      }
    }
    if (!objc_msgSend(v10, "validateWithSpan:error:", a4, a6))
      goto LABEL_31;
    v20 = objc_msgSend(v10, "hasChanges");
    if (objc_msgSend(v10, "saveWithSpan:error:", a4, a6))
    {
      if ((v20 & 1) != 0
        || (objc_msgSend(v10, "persistentObject"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "_isPendingInsert"),
            v21,
            v22))
      {
        -[EKEventStore _addObjectToPendingCommits:](self, "_addObjectToPendingCommits:", v10);
      }
      v23 = -[EKEventStore save:](self, "save:", a6);
      if (v23 && v7)
      {
        if (-[EKEventStore commitWithRollbackForNewClients:](self, "commitWithRollbackForNewClients:", a6))
        {
LABEL_25:
          v12 = 1;
          goto LABEL_32;
        }
      }
      else if (v23)
      {
        goto LABEL_25;
      }
    }
    objc_msgSend(v10, "persistentObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "_isPendingInsert");

    if (v25)
    {
      objc_msgSend(v10, "persistentObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventStore _deleteObject:](self, "_deleteObject:", v26);

    }
    goto LABEL_31;
  }
  v11 = -[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase");
  v12 = 0;
  if (v10 && v11)
    goto LABEL_7;
LABEL_32:

  return v12;
}

- (BOOL)removeEvent:(EKEvent *)event span:(EKSpan)span commit:(BOOL)commit error:(NSError *)error
{
  _BOOL8 v7;
  NSObject *v10;
  EKEvent *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint8_t v22[16];
  uint8_t v23[8];
  id v24;
  uint8_t buf[16];

  v7 = commit;
  v10 = EKSavingSignpostsHandle;
  v11 = event;
  v12 = os_signpost_id_generate(v10);
  v13 = (id)EKSavingSignpostsHandle;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2318000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "removeEvent", ", buf, 2u);
  }

  v24 = 0;
  v15 = -[EKEventStore _removeEvent:span:commit:error:](self, "_removeEvent:span:commit:error:", v11, span, v7, &v24);

  v16 = v24;
  v17 = v16;
  if (error)
    *error = (NSError *)objc_retainAutorelease(v16);
  v18 = EKLogHandle;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1A2318000, v18, OS_LOG_TYPE_INFO, "Removed event successfully", v23, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore removeEvent:span:commit:error:].cold.1();
  }
  v19 = (id)EKSavingSignpostsHandle;
  v20 = v19;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2318000, v20, OS_SIGNPOST_INTERVAL_END, v12, "removeEvent", ", v22, 2u);
  }

  return v15;
}

- (BOOL)_removeEvent:(id)a3 span:(int64_t)a4 commit:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  BOOL v11;
  _BOOL4 v12;
  void *v13;
  EKEventStore *v14;
  void *v15;
  uint64_t v16;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v7 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (a6)
  {
    *a6 = 0;
    if (!-[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase"))
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = 30;
      goto LABEL_13;
    }
    if (!v10)
      goto LABEL_11;
  }
  else
  {
    v11 = -[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase");
    LOBYTE(v12) = 0;
    if (!v10 || !v11)
      goto LABEL_14;
  }
  objc_msgSend(v10, "eventStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_11;
  objc_msgSend(v10, "eventStore");
  v14 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  if (v14 != self)
  {
    if (a6)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = 11;
LABEL_13:
      objc_msgSend(v15, "errorWithEKErrorCode:", v16);
      LOBYTE(v12) = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_11:
    LOBYTE(v12) = 0;
    goto LABEL_14;
  }
  v18 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v10, "persistentObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithPersistentObject:objectForCopy:", v19, v10);

  if (objc_msgSend(v10, "_hasChangesForKey:", *MEMORY[0x1E0D0B328])
    && (objc_msgSend(v10, "virtualConference"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v20, "virtualConference"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v21, "isEqual:", v22),
        v22,
        v21,
        (v23 & 1) == 0))
  {
    objc_msgSend(v10, "virtualConference");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }
  v39 = v20;
  objc_msgSend(v20, "virtualConference");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "joinMethods");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v45 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "URL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "invalidateVirtualConferenceURLIfNeededOnCommit:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v26);
  }

  if (objc_msgSend(v39, "removeWithSpan:error:", a4, a6))
  {
    -[EKEventStore _addRemovedObjectToPendingCommits:](self, "_addRemovedObjectToPendingCommits:", v10);
    v30 = v37;
    if (-[EKEventStore save:](self, "save:", a6))
    {
      objc_msgSend(v10, "markAsDeleted");
      v12 = !v7 || -[EKEventStore commitWithRollbackForNewClients:](self, "commitWithRollbackForNewClients:", a6);
      if (v12 && v37)
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v37, "joinMethods");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v41 != v34)
                objc_enumerationMutation(v31);
              objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "URL");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              +[EKConferenceUtils invalidateConferenceURL:](EKConferenceUtils, "invalidateConferenceURL:", v36);

            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          }
          while (v33);
        }

        LOBYTE(v12) = 1;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
    v30 = v37;
  }

LABEL_14:
  return v12;
}

- (BOOL)setInvitationStatus:(unint64_t)a3 forEvent:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (a5)
    *a5 = 0;
  if (v8)
  {
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[EKEventStore setInvitationStatus:forEvents:error:](self, "setInvitationStatus:forEvents:error:", a3, v10, a5);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)setInvitationStatus:(unint64_t)a3 forEvents:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  EKEventStore *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  BOOL v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (a5)
    *a5 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__23;
  v45 = __Block_byref_object_dispose__23;
  v46 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v14, "eventStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

        if (v16)
          goto LABEL_26;
        objc_msgSend(v14, "eventStore");
        v17 = (EKEventStore *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == self;

        if (!v18)
        {
          if (a5)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 11);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_26:

          v26 = 0;
          goto LABEL_27;
        }
        objc_msgSend(v14, "CADObjectID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v19);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      if (v11)
        continue;
      break;
    }
  }

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  -[EKEventStore connection](self, "connection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "CADOperationProxySync");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __52__EKEventStore_setInvitationStatus_forEvents_error___block_invoke;
  v32[3] = &unk_1E4788728;
  v32[4] = &v41;
  v32[5] = &v33;
  objc_msgSend(v21, "CADEventSetInvitationStatus:forEvents:error:", a3, v9, v32);

  if (a5)
    *a5 = objc_retainAutorelease((id)v42[5]);
  if (*((_BYTE *)v34 + 24))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = v10;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v47, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "clearInvitationStatus", (_QWORD)v28);
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v47, 16);
      }
      while (v23);
    }

  }
  _Block_object_dispose(&v33, 8);
  v26 = 1;
LABEL_27:

  _Block_object_dispose(&v41, 8);
  return v26;
}

void __52__EKEventStore_setInvitationStatus_forEvents_error___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __52__EKEventStore_setInvitationStatus_forEvents_error___block_invoke_cold_1(v3);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 5);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)creatorTeamIdentifierForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  objc_msgSend(v4, "CADObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__23;
  v15 = __Block_byref_object_dispose__23;
  v16 = 0;
  -[EKEventStore connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CADOperationProxySync");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__EKEventStore_creatorTeamIdentifierForEvent___block_invoke;
  v10[3] = &unk_1E47883D0;
  v10[4] = &v11;
  objc_msgSend(v7, "CADDatabaseGetCreatorTeamIdentifierForEventWithObjectID:reply:", v5, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __46__EKEventStore_creatorTeamIdentifierForEvent___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __52__EKEventStore_setInvitationStatus_forEvents_error___block_invoke_cold_1(v6);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (BOOL)isCurrentProcessCreatorOfEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  objc_msgSend(v4, "CADObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[EKEventStore connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CADOperationProxySync");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__EKEventStore_isCurrentProcessCreatorOfEvent___block_invoke;
  v9[3] = &unk_1E4788750;
  v9[4] = &v10;
  objc_msgSend(v7, "CADDatabaseIsCurrentProcessCreatorOfEventWithObjectID:reply:", v5, v9);

  LOBYTE(v6) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v6;
}

uint64_t __47__EKEventStore_isCurrentProcessCreatorOfEvent___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)importICS:(id)a3 intoCalendar:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  if (!v8 || !objc_msgSend(v8, "length"))
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    _NSMethodExceptionProem();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise:format:", v11, CFSTR("%@: path is empty or nil"), v12);

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v8);
  if (v13)
  {
    -[EKEventStore importICSData:intoCalendar:options:](self, "importICSData:intoCalendar:options:", v13, v9, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)importICSData:(id)a3 intoCalendars:(id)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(a4, "valueForKey:", CFSTR("CADObjectID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore _importEventsWithExternalIDs:fromICSData:intoCalendarsWithIDs:options:batchSize:](self, "_importEventsWithExternalIDs:fromICSData:intoCalendarsWithIDs:options:batchSize:", 0, v8, v9, a5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)importEventsWithExternalIDs:(id)a3 fromICSData:(id)a4 intoCalendars:(id)a5 options:(unint64_t)a6 batchSize:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v7 = *(_QWORD *)&a7;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a5, "valueForKey:", CFSTR("CADObjectID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore _importEventsWithExternalIDs:fromICSData:intoCalendarsWithIDs:options:batchSize:](self, "_importEventsWithExternalIDs:fromICSData:intoCalendarsWithIDs:options:batchSize:", v13, v12, v14, a6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_importEventsWithExternalIDs:(id)a3 fromICSData:(id)a4 intoCalendarsWithIDs:(id)a5 options:(unint64_t)a6 batchSize:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  EKEventStore *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v7 = *(_QWORD *)&a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__23;
  v28 = __Block_byref_object_dispose__23;
  v29 = 0;
  -[EKEventStore connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "CADOperationProxySync");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__EKEventStore__importEventsWithExternalIDs_fromICSData_intoCalendarsWithIDs_options_batchSize___block_invoke;
  v20[3] = &unk_1E4788778;
  v17 = v14;
  v22 = self;
  v23 = &v24;
  v21 = v17;
  objc_msgSend(v16, "CADDatabaseImportEvents:fromICSData:intoCalendarsWithIDs:optionsMask:batchSize:reply:", v12, v13, v17, a6, v7, v20);

  v18 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v18;
}

void __96__EKEventStore__importEventsWithExternalIDs_fromICSData_intoCalendarsWithIDs_options_batchSize___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  EKEvent *v19;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __96__EKEventStore__importEventsWithExternalIDs_fromICSData_intoCalendarsWithIDs_options_batchSize___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = v6;
    obj = v6;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v23)
    {
      v22 = *(_QWORD *)v30;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(obj);
          v24 = v10;
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v12);
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          +[EKObjectID EKObjectIDsFromCADObjectIDs:](EKObjectID, "EKObjectIDsFromCADObjectIDs:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v26;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v26 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(a1 + 40), "registerFetchedObjectWithID:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v17));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v19 = -[EKEvent initWithPersistentObject:]([EKEvent alloc], "initWithPersistentObject:", v18);
                    objc_msgSend(v12, "addObject:", v19);

                  }
                }

                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v15);
          }

          v10 = v24 + 1;
        }
        while (v24 + 1 != v23);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v23);
    }

    v6 = v20;
  }

}

- (id)importICSData:(id)a3 intoCalendar:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      objc_msgSend(v9, "CADObjectID");
    else
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore _importEventsWithExternalIDs:fromICSData:intoCalendarsWithIDs:options:batchSize:](self, "_importEventsWithExternalIDs:fromICSData:intoCalendarsWithIDs:options:batchSize:", 0, v13, v14, a5, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)ICSDataForCalendarItems:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__23;
  v26 = __Block_byref_object_dispose__23;
  v27 = 0;
  v7 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "CADObjectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v9);
  }

  -[EKEventStore connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "CADOperationProxySync");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __48__EKEventStore_ICSDataForCalendarItems_options___block_invoke;
  v17[3] = &unk_1E4785988;
  v17[4] = &v22;
  objc_msgSend(v14, "CADDatabaseExportICSDataForCalendarItems:options:reply:", v7, a4, v17);

  v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __48__EKEventStore_ICSDataForCalendarItems_options___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (id)ICSDataForCalendarItems:(id)a3 preventLineFolding:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 2;
  else
    v4 = 0;
  return -[EKEventStore ICSDataForCalendarItems:options:](self, "ICSDataForCalendarItems:options:", a3, v4);
}

- (id)importVCSData:(id)a3 intoCalendars:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  id *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (v12 = objc_msgSend(v9, "count"), v12 == objc_msgSend(v8, "count")))
  {
    v35 = v11;
    if (objc_msgSend(v8, "count"))
    {
      v13 = 0;
      v32 = a5;
      v33 = v9;
      v34 = v8;
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v10 + 3560), "array");
        v16 = v8;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)v14;
        objc_msgSend(MEMORY[0x1E0DDB890], "parseVCSData:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");
        v20 = v19;
        v38 = v18;
        if (v19)
        {
          v36 = v19;
          v37 = v13;
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          obj = v18;
          v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
          if (v42)
          {
            v41 = *(_QWORD *)v49;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v49 != v41)
                  objc_enumerationMutation(obj);
                v43 = v21;
                v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v21);
                v44 = 0u;
                v45 = 0u;
                v46 = 0u;
                v47 = 0u;
                objc_msgSend(v22, "children");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
                if (v24)
                {
                  v25 = v24;
                  v26 = *(_QWORD *)v45;
                  do
                  {
                    for (i = 0; i != v25; ++i)
                    {
                      if (*(_QWORD *)v45 != v26)
                        objc_enumerationMutation(v23);
                      v28 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
                      if (objc_msgSend(v28, "entityType") == 2)
                      {
                        +[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", self);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "updateWithVCSEntity:inCalendar:", v28, v15);
                        objc_msgSend(v17, "addObject:", v29);

                      }
                    }
                    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
                  }
                  while (v25);
                }

                v21 = v43 + 1;
              }
              while (v43 + 1 != v42);
              v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
            }
            while (v42);
          }

          objc_msgSend(v35, "addObject:", v17);
          v9 = v33;
          v8 = v34;
          a5 = v32;
          v10 = 0x1E0C99000;
          v20 = v36;
          v13 = v37;
        }
        else
        {
          v8 = v16;
          v10 = 0x1E0C99000;
          if (a5)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 0, 0);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
        }

        if (!v20)
          goto LABEL_32;
      }
      while (objc_msgSend(v8, "count") > (unint64_t)++v13);
    }
    if (!-[EKEventStore commitWithRollback:](self, "commitWithRollback:", a5))
    {
LABEL_32:
      v30 = 0;
      v11 = v35;
      goto LABEL_33;
    }
    v11 = v35;
    v30 = v35;
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKICSImportErrorDomain"), 3, 0);
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
LABEL_33:

  return v30;
}

- (CGColor)copyCGColorForNewCalendar
{
  const __CFString *v2;
  __CFString *v3;
  CGColorSpace *DeviceRGB;
  CGColor *v5;
  int v7;
  uint64_t v8;
  CGFloat components[2];
  double v10;
  uint64_t v11;
  char buffer[100];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[EKEventStore colorStringForNewCalendar](self, "colorStringForNewCalendar");
  v2 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  v3 = (__CFString *)v2;
  if (v2)
  {
    v8 = 0;
    v7 = 0;
    CFStringGetCString(v2, buffer, 100, 0x8000100u);
    sscanf(buffer, "#%02X%02X%02X", (char *)&v8 + 4, &v8, &v7);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(float64x2_t *)components = vcvtq_f64_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(v8, HIDWORD(v8))), (float32x2_t)vdup_n_s32(0x437F0000u)));
    v10 = (float)((float)v7 / 255.0);
    v11 = 0x3FF0000000000000;
    v5 = CGColorCreate(DeviceRGB, components);
    CFRelease(DeviceRGB);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)colorStringForNewCalendar
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t j;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[EKEventStore calendarsForEntityType:](self, "calendarsForEntityType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isHidden") & 1) == 0)
        {
          objc_msgSend(v9, "colorString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

  EKGetDefaultCalendarColors();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    v17 = -1;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        v20 = objc_msgSend(v3, "countForObject:", v19, (_QWORD)v24);
        if (v20 < v17)
        {
          v21 = v20;
          v22 = v19;

          v17 = v21;
          v12 = v22;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v15);
  }

  return v12;
}

- (id)defaultLocalCalendar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__23;
  v13 = __Block_byref_object_dispose__23;
  v14 = 0;
  -[EKEventStore connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CADOperationProxySync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__EKEventStore_defaultLocalCalendar__block_invoke;
  v8[3] = &unk_1E4788648;
  v8[4] = &v9;
  objc_msgSend(v4, "CADDatabaseGetDefaultLocalCalendarWithReply:", v8);

  if (v10[5])
  {
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore calendarWithID:](self, "calendarWithID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __36__EKEventStore_defaultLocalCalendar__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __36__EKEventStore_defaultLocalCalendar__block_invoke_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (void)setDefaultCalendar:(id)a3 forNewEventsInDelegateSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *calendarSourcesAndDefaultsQueue;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type") == 6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore setDefaultCalendar:forNewEventsInDelegateSource:].cold.1();
    goto LABEL_17;
  }
  if (!v7)
  {
    v17 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v17;
      objc_msgSend(v6, "objectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v12;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_1A2318000, v11, OS_LOG_TYPE_DEFAULT, "Setting default calendar for new events to %{public}@ (\"%@\")", buf, 0x16u);
      goto LABEL_11;
    }
LABEL_12:
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__EKEventStore_setDefaultCalendar_forNewEventsInDelegateSource___block_invoke;
    block[3] = &unk_1E4785400;
    block[4] = self;
    v19 = v7;
    v26 = v19;
    v20 = v6;
    v27 = v20;
    dispatch_sync(calendarSourcesAndDefaultsQueue, block);
    -[EKEventStore connection](self, "connection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "CADOperationProxySync");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "CADObjectID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "CADObjectID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "CADDatabaseSetDefaultCalendarForNewEvents:delegateSource:reply:", v23, v24, &__block_literal_global_271);

    goto LABEL_17;
  }
  if ((objc_msgSend(v7, "isDelegate") & 1) != 0)
  {
    objc_msgSend(v6, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    v10 = (void *)EKLogHandle;
    if ((v9 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        objc_msgSend(v6, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "externalID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v29 = v12;
        v30 = 2112;
        v31 = v13;
        v32 = 2114;
        v33 = v14;
        v34 = 2114;
        v35 = v15;
        v36 = 2112;
        v37 = v16;
        _os_log_impl(&dword_1A2318000, v11, OS_LOG_TYPE_DEFAULT, "Setting default calendar for new events to %{public}@ (\"%@\") in source %{public}@ (%{public}@ - \"%@\")", buf, 0x34u);

LABEL_11:
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore setDefaultCalendar:forNewEventsInDelegateSource:].cold.2();
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore setDefaultCalendar:forNewEventsInDelegateSource:].cold.3();
  }
LABEL_17:

}

void __64__EKEventStore_setDefaultCalendar_forNewEventsInDelegateSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 48), "CADObjectID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
    objc_msgSend(v2, "CADObjectID");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v4);

}

void __64__EKEventStore_setDefaultCalendar_forNewEventsInDelegateSource___block_invoke_2(uint64_t a1, int a2)
{
  void *v2;

  if (a2)
  {
    v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __64__EKEventStore_setDefaultCalendar_forNewEventsInDelegateSource___block_invoke_2_cold_1(v2);
  }
}

- (EKCalendar)defaultCalendarForNewEvents
{
  return (EKCalendar *)-[EKEventStore defaultCalendarForNewEventsInDelegateSource:](self, "defaultCalendarForNewEventsInDelegateSource:", 0);
}

- (void)setDefaultCalendarForNewEvents:(id)a3
{
  -[EKEventStore setDefaultCalendar:forNewEventsInDelegateSource:](self, "setDefaultCalendar:forNewEventsInDelegateSource:", a3, 0);
}

- (EKCalendar)defaultCalendarForNewReminders
{
  void *v3;

  if (-[EKEventStore returnReminderResults](self, "returnReminderResults"))
  {
    -[EKReminderStore defaultCalendarForNewReminders](self->_reminderStore, "defaultCalendarForNewReminders");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (EKCalendar *)v3;
}

- (void)_clearCachedCalendars
{
  NSMutableDictionary *calendars;
  NSMutableDictionary *calendarsByIdentifier;
  NSMutableDictionary *defaultCalendarsForNewEventsIDBySourceID;
  CADGenerationStampedObjectID *suggestedEventCalendarID;
  CADGenerationStampedObjectID *naturalLanguageSuggestedEventCalendarID;

  calendars = self->_calendars;
  self->_calendars = 0;

  calendarsByIdentifier = self->_calendarsByIdentifier;
  self->_calendarsByIdentifier = 0;

  defaultCalendarsForNewEventsIDBySourceID = self->_defaultCalendarsForNewEventsIDBySourceID;
  self->_defaultCalendarsForNewEventsIDBySourceID = 0;

  suggestedEventCalendarID = self->_suggestedEventCalendarID;
  self->_suggestedEventCalendarID = 0;

  naturalLanguageSuggestedEventCalendarID = self->_naturalLanguageSuggestedEventCalendarID;
  self->_naturalLanguageSuggestedEventCalendarID = 0;

}

- (void)_removeCachedCalendarFromSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  CADGenerationStampedObjectID *suggestedEventCalendarID;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  CADGenerationStampedObjectID *naturalLanguageSuggestedEventCalendarID;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  if (self->_defaultCalendarsForNewEventsIDBySourceID)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v4;
    objc_msgSend(v28, "CADObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v6;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_defaultCalendarsForNewEventsIDBySourceID, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            -[EKEventStore calendarWithCADID:](self, "calendarWithCADID:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "source");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "persistentObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v28);

            if (v16)
              -[NSMutableDictionary removeObjectForKey:](self->_defaultCalendarsForNewEventsIDBySourceID, "removeObjectForKey:", v11);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v8);
    }

  }
  if (self->_suggestedEventCalendarID)
  {
    -[EKEventStore calendarWithCADID:](self, "calendarWithCADID:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "source");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "persistentObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqual:", v28);

    if (v20)
    {
      suggestedEventCalendarID = self->_suggestedEventCalendarID;
      self->_suggestedEventCalendarID = 0;

    }
  }
  if (self->_naturalLanguageSuggestedEventCalendarID)
  {
    -[EKEventStore calendarWithCADID:](self, "calendarWithCADID:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "source");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "persistentObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqual:", v28);

    if (v25)
    {
      naturalLanguageSuggestedEventCalendarID = self->_naturalLanguageSuggestedEventCalendarID;
      self->_naturalLanguageSuggestedEventCalendarID = 0;

    }
  }

}

- (void)_removeCachedCalendarWithCADID:(id)a3
{
  id v4;
  NSMutableDictionary *calendarsByIdentifier;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  CADGenerationStampedObjectID *suggestedEventCalendarID;
  CADGenerationStampedObjectID *naturalLanguageSuggestedEventCalendarID;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary removeObjectForKey:](self->_calendars, "removeObjectForKey:", v4);
  calendarsByIdentifier = self->_calendarsByIdentifier;
  self->_calendarsByIdentifier = 0;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allKeys](self->_defaultCalendarsForNewEventsIDBySourceID, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_defaultCalendarsForNewEventsIDBySourceID, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:", v4))
          -[NSMutableDictionary removeObjectForKey:](self->_defaultCalendarsForNewEventsIDBySourceID, "removeObjectForKey:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (-[CADGenerationStampedObjectID isEqual:](self->_suggestedEventCalendarID, "isEqual:", v4))
  {
    suggestedEventCalendarID = self->_suggestedEventCalendarID;
    self->_suggestedEventCalendarID = 0;

  }
  if (-[CADGenerationStampedObjectID isEqual:](self->_naturalLanguageSuggestedEventCalendarID, "isEqual:", v4))
  {
    naturalLanguageSuggestedEventCalendarID = self->_naturalLanguageSuggestedEventCalendarID;
    self->_naturalLanguageSuggestedEventCalendarID = 0;

  }
}

- (BOOL)saveDraftOfEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0D0C400];
  v5 = a3;
  objc_msgSend(v4, "eventsPendingChangesPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[EKEventStore _saveDraftOfEvent:toDirectory:](self, "_saveDraftOfEvent:toDirectory:", v5, v6);

  return (char)self;
}

- (BOOL)_saveDraftOfEvent:(id)a3 toDirectory:(id)a4
{
  return -[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:](self, "_saveDraftOfEvent:toDirectory:withVersion:", a3, a4, CFSTR("3.0"));
}

- (BOOL)_saveDraftOfEvent:(id)a3 toDirectory:(id)a4 withVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  EKEventStore *v25;
  void *v26;
  void *v27;
  EKEventStore *v28;
  EKEventStore *v29;
  int v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  EKEventStore *v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  EKEventStore *v47;
  __int16 v48;
  EKEventStore *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "eventOccurrenceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasChanges") && (objc_msgSend(v8, "isDeleted") & 1) == 0)
  {
    v15 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v41 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
      v42 = 2114;
      v43 = v11;
      v44 = 2112;
      v45 = v9;
      v46 = 2112;
      v47 = self;
      _os_log_impl(&dword_1A2318000, v15, OS_LOG_TYPE_DEFAULT, "%s: Serializing %{public}@ to path %@ for event store %@", buf, 0x2Au);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v9, 0) & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        -[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:].cold.3();
      v39 = 0;
      v17 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v39);
      v18 = v39;
      v19 = v18;
      if ((v17 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          -[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:].cold.2();

        goto LABEL_30;
      }

    }
    objc_msgSend(v8, "eventOccurrenceID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore _draftPathForEventWithOccurrenceID:draftDirectory:](self, "_draftPathForEventWithOccurrenceID:draftDirectory:", v20, v9);
    v36 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      objc_msgSend(v8, "attendees");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "changeSet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "summary");
      v25 = (EKEventStore *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v41 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
      v42 = 2114;
      v43 = v11;
      v44 = 2112;
      v45 = v23;
      v46 = 2112;
      v47 = v25;
      v48 = 2112;
      v49 = v36;
      _os_log_impl(&dword_1A2318000, v22, OS_LOG_TYPE_DEFAULT, "%s: Serializing event %{public}@ with attendees %@ and with changeset %@ to file %@", buf, 0x34u);

    }
    +[EKDefaultSerializerFactory createSerializerWithEventStore:withVersion:](EKDefaultSerializerFactory, "createSerializerWithEventStore:withVersion:", self, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v26, "serializeEvent:error:", v8, &v38);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (EKEventStore *)v38;
    v29 = v28;
    if (v27)
    {

      v37 = 0;
      v30 = objc_msgSend(v27, "writeToFile:options:error:", v36, 1, &v37);
      v29 = (EKEventStore *)v37;
      v31 = EKLogHandle;
      if (!v30)
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          v33 = v31;
          objc_msgSend(v8, "changeSet");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "summary");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316162;
          v41 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
          v42 = 2114;
          v43 = v11;
          v44 = 2112;
          v45 = v34;
          v46 = 2112;
          v47 = v36;
          v48 = 2112;
          v49 = v29;
          _os_log_error_impl(&dword_1A2318000, v33, OS_LOG_TYPE_ERROR, "%s: Failed to serialize changeset event %{public}@ with changeset %@ to file %@: %@", buf, 0x34u);

        }
        v13 = 0;
LABEL_29:

        if (v27)
          goto LABEL_6;
LABEL_30:
        v13 = 0;
        goto LABEL_6;
      }
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
        _os_log_impl(&dword_1A2318000, v31, OS_LOG_TYPE_DEFAULT, "%s: Serialization successful", buf, 0xCu);
      }
    }
    else
    {
      v32 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        -[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:].cold.1((uint64_t)v29, v8, v32);
    }
    v13 = 1;
    goto LABEL_29;
  }
  v12 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
    v42 = 2114;
    v43 = v11;
    _os_log_impl(&dword_1A2318000, v12, OS_LOG_TYPE_DEFAULT, "%s: Event %{public}@ has no changes (or was deleted).  Not serializing", buf, 0x16u);
  }
  v13 = 1;
LABEL_6:

  return v13;
}

- (id)loadDraftOfEventWithOccurrenceID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D0C400];
  v5 = a3;
  objc_msgSend(v4, "eventsPendingChangesPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:](self, "_loadDraftOfEventWithOccurrenceID:fromDirectory:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_loadDraftOfEventWithOccurrenceID:(id)a3 fromDirectory:(id)a4
{
  return -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:](self, "_loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:", a3, a4, 0);
}

- (id)_loadDraftOfEventWithOccurrenceID:(id)a3 fromDirectory:(id)a4 withVersion:(id)a5
{
  char *v8;
  id v9;
  id v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  char *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  char *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  EKEventStore *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  v11 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v58 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
    v59 = 2114;
    v60 = v8;
    v61 = 2112;
    v62 = v9;
    v63 = 2112;
    v64 = self;
    _os_log_impl(&dword_1A2318000, v11, OS_LOG_TYPE_DEFAULT, "%s: Loading event with occurrenceID %{public}@ from path %@ for event store %@", buf, 0x2Au);
  }
  -[EKEventStore _draftPathForEventWithOccurrenceID:draftDirectory:](self, "_draftPathForEventWithOccurrenceID:draftDirectory:", v8, v9);
  v12 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v12, 0))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v12);
    if (v14)
    {
      +[EKDefaultSerializerFactory createSerializerWithEventStore:withVersion:](EKDefaultSerializerFactory, "createSerializerWithEventStore:withVersion:", self, CFSTR("3.0"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v10)
      {
        v17 = v10;
      }
      else
      {
        objc_msgSend(v15, "version");
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v54 = v17;
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("3.0")) & 1) != 0)
      {
        v55 = 0;
        v56 = 0;
        v51 = v16;
        objc_msgSend(v16, "deserializeData:isNew:error:", v14, &v56, &v55);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v56;
        v50 = v55;
        v53 = v20;
        if (v20)
        {
          -[EKEventStore _deleteDraft:](self, "_deleteDraft:", v12);
          objc_msgSend(v20, "calendar");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            -[EKEventStore eventWithIdentifier:](self, "eventWithIdentifier:", v8);
            v22 = objc_claimAutoreleasedReturnValue();
            v49 = (void *)v22;
            if (v22)
            {
              v23 = (void *)v22;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
                -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:].cold.5();
              objc_msgSend(v23, "diffWithObject:", v20);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
                -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:].cold.4(v25);
              v47 = v24;
              objc_msgSend(v24, "changeSetForDiff");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "changedKeys");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)objc_msgSend(v26, "mutableCopy");

              objc_msgSend(v53, "changeSet");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "changedKeys");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "minusSet:", v29);

              v46 = v27;
              objc_msgSend(v27, "allObjects");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "rollbackChangesForKeys:", v30);

              v31 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
                -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:].cold.3(v31);
              v32 = v49;
              objc_msgSend(v49, "applyChanges:", v48);
              v33 = (void *)EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                v34 = v33;
                objc_msgSend(v49, "changeSet");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "summary");
                v36 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v58 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
                v59 = 2112;
                v60 = v36;
                _os_log_impl(&dword_1A2318000, v34, OS_LOG_TYPE_DEFAULT, "%s: Applied changes to event: %@", buf, 0x16u);

                v32 = v49;
              }
              v19 = v32;

              v37 = v32;
              v16 = v51;
              v38 = v52;
              v39 = v50;
            }
            else
            {
              v38 = v52;
              if (v52 && !objc_msgSend(v52, "BOOLValue"))
              {
                v44 = EKLogHandle;
                v16 = v51;
                if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v58 = v8;
                  _os_log_impl(&dword_1A2318000, v44, OS_LOG_TYPE_DEFAULT, "Discarding draft for event %{public}@ because the draft was for an event that has been deleted.", buf, 0xCu);
                }
                v19 = 0;
              }
              else
              {
                v41 = (void *)EKLogHandle;
                if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
                {
                  v42 = v41;
                  objc_msgSend(v20, "attendees");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315650;
                  v58 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
                  v59 = 2112;
                  v60 = (char *)v20;
                  v61 = 2112;
                  v62 = v43;
                  _os_log_impl(&dword_1A2318000, v42, OS_LOG_TYPE_DEFAULT, "%s: Return deserialized event %@ with attendees %@", buf, 0x20u);

                }
                objc_msgSend(v20, "markAsNew");
                v19 = v20;
                v16 = v51;
                v38 = v52;
              }
              v37 = 0;
              v39 = v50;
            }

          }
          else
          {
            v40 = EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v58 = v8;
              _os_log_impl(&dword_1A2318000, v40, OS_LOG_TYPE_DEFAULT, "Discarding draft for event %{public}@ because the draft was on a calendar that has been deleted.", buf, 0xCu);
            }
            v19 = 0;
            v16 = v51;
            v38 = v52;
            v39 = v50;
          }
        }
        else
        {
          v39 = v50;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
            -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:].cold.2();
          -[EKEventStore _deleteDraft:](self, "_deleteDraft:", v12);
          v19 = 0;
          v16 = v51;
          v38 = v52;
        }

      }
      else
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:].cold.6();
        -[EKEventStore _deleteDraft:](self, "_deleteDraft:", v12);
        v19 = 0;
      }

    }
    else
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        -[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:].cold.1();
      v19 = 0;
    }

  }
  else
  {
    v18 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v58 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
      v59 = 2112;
      v60 = v12;
      _os_log_impl(&dword_1A2318000, v18, OS_LOG_TYPE_DEFAULT, "%s: No file exists at path %@", buf, 0x16u);
    }
    v19 = 0;
  }

  return v19;
}

- (void)deleteDraftOfEventWithOccurrenceID:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D0C400];
  v5 = a3;
  objc_msgSend(v4, "eventsPendingChangesPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventStore _deleteDraftOfEventWithOccurrenceID:fromDirectory:](self, "_deleteDraftOfEventWithOccurrenceID:fromDirectory:", v5, v6);

}

- (void)_deleteDraftOfEventWithOccurrenceID:(id)a3 fromDirectory:(id)a4
{
  id v5;

  -[EKEventStore _draftPathForEventWithOccurrenceID:draftDirectory:](self, "_draftPathForEventWithOccurrenceID:draftDirectory:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventStore _deleteDraft:](self, "_deleteDraft:", v5);

}

- (void)_deleteDraft:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v7);
  v6 = v7;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKEventStore _deleteDraft:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore _deleteDraft:].cold.2();
  }

}

- (id)_draftPathForEventWithOccurrenceID:(id)a3 draftDirectory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)saveReminder:(id)a3 error:(id *)a4
{
  return -[EKEventStore saveReminder:commit:error:](self, "saveReminder:commit:error:", a3, 1, a4);
}

- (BOOL)saveReminder:(EKReminder *)reminder commit:(BOOL)commit error:(NSError *)error
{
  _BOOL4 v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[8];
  id v12;

  v12 = 0;
  v6 = -[EKEventStore _saveReminder:commit:error:](self, "_saveReminder:commit:error:", reminder, commit, &v12);
  v7 = v12;
  v8 = v7;
  if (error)
    *error = (NSError *)objc_retainAutorelease(v7);
  v9 = EKLogHandle;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_INFO, "Saved reminder successfully", v11, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore saveReminder:commit:error:].cold.1();
  }

  return v6;
}

- (BOOL)_saveReminder:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  EKEventStore *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "eventStore");
  v9 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  if (v9 != self)
  {
    if (a5)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = 11;
LABEL_11:
      objc_msgSend(v10, "errorWithEKErrorCode:", v11);
      LOBYTE(v12) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    LOBYTE(v12) = 0;
    goto LABEL_14;
  }
  if (!-[EKEventStore returnReminderResults](self, "returnReminderResults"))
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKEventStore _saveReminder:commit:error:].cold.1();
      if (!a5)
        goto LABEL_13;
    }
    else if (!a5)
    {
      goto LABEL_13;
    }
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = 29;
    goto LABEL_11;
  }
  v12 = -[EKReminderStore saveReminder:error:](self->_reminderStore, "saveReminder:error:", v8, a5);
  if (v12 && v6)
    LOBYTE(v12) = -[EKEventStore commit:](self, "commit:", a5);
LABEL_14:

  return v12;
}

- (BOOL)removeReminder:(id)a3 error:(id *)a4
{
  return -[EKEventStore removeReminder:commit:error:](self, "removeReminder:commit:error:", a3, 1, a4);
}

- (BOOL)removeReminder:(EKReminder *)reminder commit:(BOOL)commit error:(NSError *)error
{
  _BOOL4 v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[8];
  id v12;

  v12 = 0;
  v6 = -[EKEventStore _removeReminder:commit:error:](self, "_removeReminder:commit:error:", reminder, commit, &v12);
  v7 = v12;
  v8 = v7;
  if (error)
    *error = (NSError *)objc_retainAutorelease(v7);
  v9 = EKLogHandle;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A2318000, v9, OS_LOG_TYPE_INFO, "Removed reminder successfully", v11, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore removeReminder:commit:error:].cold.1();
  }

  return v6;
}

- (BOOL)_removeReminder:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  _BOOL4 v9;

  v6 = a4;
  v8 = a3;
  if (-[EKEventStore returnReminderResults](self, "returnReminderResults"))
  {
    v9 = -[EKReminderStore removeReminder:error:](self->_reminderStore, "removeReminder:error:", v8, a5);
    if (v9 && v6)
      LOBYTE(v9) = -[EKEventStore commitWithRollbackForNewClients:](self, "commitWithRollbackForNewClients:", a5);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)reminderWithExternalURI:(id)a3
{
  id v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v10;
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKEventStore.m"), 4672, CFSTR("Nil URI passed"));

  }
  v11 = 0;
  v6 = -[EKEventStore _parseURI:expectedScheme:identifier:options:](self, "_parseURI:expectedScheme:identifier:options:", v5, CFSTR("x-apple-reminderkit"), &v11, 0);
  v7 = v11;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore reminderWithExternalURI:].cold.2();
    goto LABEL_11;
  }
  if (objc_msgSend(0, "isEqualToString:", CFSTR("Reminder")))
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore reminderWithExternalURI:].cold.1();
    goto LABEL_11;
  }
  -[EKEventStore calendarItemWithIdentifier:](self, "calendarItemWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_11:
    v8 = 0;
  }

  return v8;
}

- (id)reminderWithUniqueId:(id)a3
{
  if (!a3)
    return 0;
  -[EKReminderStore reminderWithUniqueId:](self->_reminderStore, "reminderWithUniqueId:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)eventsWithSameRecurrenceSetAsEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "recurrenceSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v5 = (void *)objc_opt_new();
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__23;
    v29 = __Block_byref_object_dispose__23;
    v30 = 0;
    -[EKEventStore connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CADOperationProxySync");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recurrenceSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "calendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CADObjectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __51__EKEventStore_eventsWithSameRecurrenceSetAsEvent___block_invoke;
    v22[3] = &unk_1E4786AF0;
    v23 = v4;
    v24 = &v25;
    objc_msgSend(v7, "CADDatabaseGetCalendarItemsWithRecurrenceSet:inCalendar:reply:", v8, v10, v22);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = (id)v26[5];
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEventStore publicObjectWithFetchedObjectID:](self, "publicObjectWithFetchedObjectID:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v5, "addObject:", v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
      }
      while (v12);
    }

    _Block_object_dispose(&v25, 8);
  }

  return v5;
}

void __51__EKEventStore_eventsWithSameRecurrenceSetAsEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if ((_DWORD)a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __51__EKEventStore_eventsWithSameRecurrenceSetAsEvent___block_invoke_cold_1(a1, v7, a2);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (id)calendarItemsWithUniqueIdentifier:(id)a3 inCalendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = a4;
  v7 = (void *)objc_opt_new();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__23;
  v31 = __Block_byref_object_dispose__23;
  v32 = 0;
  -[EKEventStore connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADOperationProxySync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "CADObjectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __61__EKEventStore_calendarItemsWithUniqueIdentifier_inCalendar___block_invoke;
  v24[3] = &unk_1E4786AF0;
  v11 = v6;
  v25 = v11;
  v26 = &v27;
  objc_msgSend(v9, "CADDatabaseGetCalendarItemsWithUniqueIdentifier:inCalendar:reply:", v11, v10, v24);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = (id)v28[5];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventStore publicObjectWithFetchedObjectID:](self, "publicObjectWithFetchedObjectID:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v7, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
    }
    while (v13);
  }

  _Block_object_dispose(&v27, 8);
  return v7;
}

void __61__EKEventStore_calendarItemsWithUniqueIdentifier_inCalendar___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __61__EKEventStore_calendarItemsWithUniqueIdentifier_inCalendar___block_invoke_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (id)reminderWithIdentifier:(id)a3
{
  return -[EKReminderStore reminderWithIdentifier:](self->_reminderStore, "reminderWithIdentifier:", a3);
}

- (EKCalendarItem)calendarItemWithIdentifier:(NSString *)identifier
{
  NSString *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, int, void *);
  void *v23;
  NSString *v24;
  uint64_t *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = identifier;
  if (!-[EKEventStore returnReminderResults](self, "returnReminderResults")
    || (-[EKReminderStore reminderWithIdentifier:](self->_reminderStore, "reminderWithIdentifier:", v4),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (-[EKEventStore returnEventResults](self, "returnEventResults"))
    {
      v30 = 0;
      v31 = &v30;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__23;
      v34 = __Block_byref_object_dispose__23;
      v35 = 0;
      -[EKEventStore objectsPendingCommit](self, "objectsPendingCommit");
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v27 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v10, "uniqueIdentifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = -[NSString isEqual:](v4, "isEqual:", v11);

              if (v12)
              {
                objc_msgSend(v10, "objectID");
                v13 = objc_claimAutoreleasedReturnValue();
                v14 = (void *)v31[5];
                v31[5] = v13;

                goto LABEL_16;
              }
            }
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_16:

      v15 = v31[5];
      if (!v15)
      {
        -[EKEventStore _implicitUpgradeToFullAccessIfNeededWithReason:](self, "_implicitUpgradeToFullAccessIfNeededWithReason:", 4);
        -[EKEventStore connection](self, "connection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "CADOperationProxySync");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = MEMORY[0x1E0C809B0];
        v21 = 3221225472;
        v22 = __43__EKEventStore_calendarItemWithIdentifier___block_invoke;
        v23 = &unk_1E4788700;
        v24 = v4;
        v25 = &v30;
        objc_msgSend(v17, "CADDatabaseGetCalendarItemWithUUID:reply:", v24, &v20);

        v15 = v31[5];
      }
      -[EKEventStore validatedNonDeletedPublicObjectWithObjectID:](self, "validatedNonDeletedPublicObjectWithObjectID:", v15, v20, v21, v22, v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[EKEventStore _apiExpectedEventForEvent:](self, "_apiExpectedEventForEvent:", v18);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

      _Block_object_dispose(&v30, 8);
    }
    else
    {
      v5 = 0;
    }
  }

  return (EKCalendarItem *)v5;
}

void __43__EKEventStore_calendarItemWithIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __45__EKEventStore_eventWithUUID_occurrenceDate___block_invoke_cold_1();
  }
  else
  {
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (id)_calendarItemsWithExternalIdentifier:(id)a3 inCalendars:(id)a4 entityTypes:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("externalIdentifier must be an instance of NSString"));
  if (objc_msgSend(v8, "length"))
  {
    if (v9)
    {
LABEL_6:
      +[EKEventStore calendarObjectIDsForPredicate:](EKEventStore, "calendarObjectIDsForPredicate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("externalIdentifier is empty"));
    if (v9)
      goto LABEL_6;
  }
  v10 = 0;
LABEL_10:
  v11 = (void *)objc_opt_new();
  if ((v5 & 2) != 0 && -[EKEventStore returnReminderResults](self, "returnReminderResults"))
  {
    -[EKReminderStore remindersWithExternalIdentifier:](self->_reminderStore, "remindersWithExternalIdentifier:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);

  }
  if ((v5 & 1) != 0 && -[EKEventStore returnEventResults](self, "returnEventResults"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A040]), "initWithExternalIdentifier:entityType:", v8, 2);
    objc_msgSend(v13, "setCalendars:", v10);
    -[EKEventStore _calendarItemsMatchingPredicate:](self, "_calendarItemsMatchingPredicate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore _apiExpectedEventsForEvents:](self, "_apiExpectedEventsForEvents:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObjectsFromArray:", v15);
  }
  if (!objc_msgSend(v11, "count"))
  {
    -[EKEventStore calendarItemWithIdentifier:](self, "calendarItemWithIdentifier:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if (!v9
        || (objc_msgSend(v16, "calendar"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v18, "CADObjectID"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = objc_msgSend(v10, "containsObject:", v19),
            v19,
            v18,
            v20))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[EKEventStore _apiExpectedEventForEvent:](self, "_apiExpectedEventForEvent:", v17);
          v21 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v21;
        }
        objc_msgSend(v11, "addObject:", v17);
      }
    }

  }
LABEL_25:

  return v11;
}

- (NSArray)calendarItemsWithExternalIdentifier:(NSString *)externalIdentifier
{
  NSString *v4;
  void *v5;

  v4 = externalIdentifier;
  -[EKEventStore _implicitUpgradeToFullAccessIfNeededWithReason:](self, "_implicitUpgradeToFullAccessIfNeededWithReason:", 5);
  -[EKEventStore calendarItemsWithExternalIdentifier:inCalendars:](self, "calendarItemsWithExternalIdentifier:inCalendars:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)calendarItemsWithExternalIdentifier:(id)a3 inCalendars:(id)a4
{
  return -[EKEventStore _calendarItemsWithExternalIdentifier:inCalendars:entityTypes:](self, "_calendarItemsWithExternalIdentifier:inCalendars:entityTypes:", a3, a4, 3);
}

- (id)eventsWithExternalIdentifier:(id)a3 inCalendars:(id)a4
{
  return -[EKEventStore _calendarItemsWithExternalIdentifier:inCalendars:entityTypes:](self, "_calendarItemsWithExternalIdentifier:inCalendars:entityTypes:", a3, a4, 1);
}

- (id)remindersWithExternalIdentifier:(id)a3 inCalendars:(id)a4
{
  return -[EKEventStore _calendarItemsWithExternalIdentifier:inCalendars:entityTypes:](self, "_calendarItemsWithExternalIdentifier:inCalendars:entityTypes:", a3, a4, 2);
}

- (id)_calendarItemsMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("predicate is nil"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("predicate is not a calendar item predicate created through EKEventStore"));
  +[EKPredicateSearch searchWithEntityClass:predicate:store:](EKPredicateSearch, "searchWithEntityClass:predicate:store:", objc_opt_class(), v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runSynchronously");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)remindersMatchingPredicate:(id)a3
{
  return -[EKReminderStore remindersMatchingPredicate:](self->_reminderStore, "remindersMatchingPredicate:", a3);
}

- (id)fetchRemindersMatchingPredicate:(NSPredicate *)predicate completion:(void *)completion
{
  NSPredicate *v6;
  void *v7;
  EKReminderStore *reminderStore;
  void *v9;
  _QWORD v11[5];
  id v12;

  v6 = predicate;
  v7 = completion;
  if (-[EKEventStore returnReminderResults](self, "returnReminderResults"))
  {
    reminderStore = self->_reminderStore;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__EKEventStore_fetchRemindersMatchingPredicate_completion___block_invoke;
    v11[3] = &unk_1E4788810;
    v11[4] = self;
    v12 = v7;
    -[EKReminderStore fetchRemindersMatchingPredicate:completion:](reminderStore, "fetchRemindersMatchingPredicate:completion:", v6, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    (*((void (**)(void *, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60]);
    +[EKNullFetchRequestToken sharedToken](EKNullFetchRequestToken, "sharedToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t __59__EKEventStore_fetchRemindersMatchingPredicate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSPredicate)predicateForRemindersInCalendars:(NSArray *)calendars
{
  return (NSPredicate *)-[EKReminderStore predicateForRemindersInCalendars:](self->_reminderStore, "predicateForRemindersInCalendars:", calendars);
}

- (id)predicateForCalendarStoreForRemindersInCalendars:(id)a3
{
  return -[EKReminderStore predicateForCalendarStoreForRemindersInCalendars:](self->_reminderStore, "predicateForCalendarStoreForRemindersInCalendars:", a3);
}

- (id)predicateForRemindersInCalendars:(id)a3 preloadProperties:(id)a4
{
  return 0;
}

- (NSPredicate)predicateForIncompleteRemindersWithDueDateStarting:(NSDate *)startDate ending:(NSDate *)endDate calendars:(NSArray *)calendars
{
  return (NSPredicate *)-[EKReminderStore predicateForIncompleteRemindersWithDueDateStarting:ending:calendars:](self->_reminderStore, "predicateForIncompleteRemindersWithDueDateStarting:ending:calendars:", startDate, endDate, calendars);
}

- (NSPredicate)predicateForCompletedRemindersWithCompletionDateStarting:(NSDate *)startDate ending:(NSDate *)endDate calendars:(NSArray *)calendars
{
  return (NSPredicate *)-[EKReminderStore predicateForCompletedRemindersWithCompletionDateStarting:ending:calendars:](self->_reminderStore, "predicateForCompletedRemindersWithCompletionDateStarting:ending:calendars:", startDate, endDate, calendars);
}

- (BOOL)ignoreExternalChanges
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (BOOL)enableSourceSyncStatusChanges
{
  return (self->_options & 0x44) == 64;
}

- (BOOL)shouldSaveCalendarAsEventCalendar:(id)a3
{
  id v3;
  _BOOL8 v4;

  v3 = a3;
  if (CalIsReminderBridgeEnabled())
    v4 = objc_msgSend(v3, "allowedEntityTypes") & 1;
  else
    LOBYTE(v4) = 1;

  return v4;
}

- (BOOL)shouldSaveCalendarAsReminderCalendar:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (CalIsReminderBridgeEnabled())
    v4 = ((unint64_t)objc_msgSend(v3, "allowedEntityTypes") >> 1) & 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)closestCachedOccurrenceToDate:(double)a3 forEventObjectID:(id)a4
{
  return -[EKEventStore closestCachedOccurrenceToDate:forEventObjectID:prefersForwardSearch:](self, "closestCachedOccurrenceToDate:forEventObjectID:prefersForwardSearch:", a4, 0, a3);
}

- (id)closestCachedOccurrenceToDate:(double)a3 forEventObjectID:(id)a4 prefersForwardSearch:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  EKEvent *v15;
  EKEvent *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  id v22;
  EKEventStore *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v5 = a5;
  v8 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__23;
  v36 = __Block_byref_object_dispose__23;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__23;
  v30 = __Block_byref_object_dispose__23;
  v31 = 0;
  -[EKEventStore database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADObjectIDWithGeneration:", objc_msgSend(v9, "databaseRestoreGeneration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventStore connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CADOperationProxySync");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __84__EKEventStore_closestCachedOccurrenceToDate_forEventObjectID_prefersForwardSearch___block_invoke;
  v21 = &unk_1E4788838;
  v14 = v8;
  v22 = v14;
  v23 = self;
  v24 = &v32;
  v25 = &v26;
  objc_msgSend(v12, "CADOccurrenceCacheGetOccurrenceDateOfEventWithObjectID:nearestDate:prefersForwardSearch:reply:", v10, v13, v5, &v18);

  if (v33[5] && v27[5])
  {
    v15 = [EKEvent alloc];
    v16 = -[EKEvent initWithPersistentObject:occurrenceDate:](v15, "initWithPersistentObject:occurrenceDate:", v33[5], v27[5], v18, v19, v20, v21);
  }
  else
  {
    v16 = 0;
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v16;
}

void __84__EKEventStore_closestCachedOccurrenceToDate_forEventObjectID_prefersForwardSearch___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if ((_DWORD)a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __84__EKEventStore_closestCachedOccurrenceToDate_forEventObjectID_prefersForwardSearch___block_invoke_cold_1(a1, v7, a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "registerFetchedObjectWithID:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    }

  }
}

- (int)countOfEventsFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[EKEventStore connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADOperationProxySync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__EKEventStore_countOfEventsFromStartDate_toEndDate___block_invoke;
  v11[3] = &unk_1E4788860;
  v11[4] = &v12;
  objc_msgSend(v9, "CADOccurrenceCacheGetOccurrenceCountWithStartDate:endDate:reply:", v6, v7, v11);

  LODWORD(v8) = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return (int)v8;
}

void __53__EKEventStore_countOfEventsFromStartDate_toEndDate___block_invoke(uint64_t a1, int a2, int a3)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __53__EKEventStore_countOfEventsFromStartDate_toEndDate___block_invoke_cold_1(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)doEvents:(id)a3 haveOccurrencesAfterDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__23;
  v18 = __Block_byref_object_dispose__23;
  v19 = 0;
  objc_msgSend(v6, "valueForKey:", CFSTR("CADObjectID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CADOperationProxySync");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__EKEventStore_doEvents_haveOccurrencesAfterDate___block_invoke;
  v13[3] = &unk_1E4788490;
  v13[4] = &v14;
  objc_msgSend(v10, "CADOccurrenceCacheDoEvents:haveOccurrencesAfterDate:reply:", v8, v7, v13);

  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __50__EKEventStore_doEvents_haveOccurrencesAfterDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __50__EKEventStore_doEvents_haveOccurrencesAfterDate___block_invoke_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (id)calendarWithUniqueID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[EKEventStore _allCalendars](self, "_allCalendars");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  -[EKEventStore sharedCalendarInvitationsForEntityTypes:](self, "sharedCalendarInvitationsForEntityTypes:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v7;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "uniqueIdentifier", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v4);

        if ((v15 & 1) != 0)
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)calendarWithExternalID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[EKEventStore returnEventResults](self, "returnEventResults"))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[EKEventStore _allCalendars](self, "_allCalendars");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

    -[EKEventStore sharedCalendarInvitationsForEntityTypes:](self, "sharedCalendarInvitationsForEntityTypes:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v7;
    v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "externalID", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v4);

          if ((v15 & 1) != 0)
          {
            v10 = v13;
            goto LABEL_13;
          }
        }
        v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_populateCalendarsByIdentifierIfNeeded
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "CADObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_1A2318000, v7, OS_LOG_TYPE_ERROR, "Cached calendar has no calendarIdentifier: %{public}@", a1, 0xCu);

}

- (id)_eventCalendarWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *calendarSourcesAndDefaultsQueue;
  EKCalendar *v7;
  EKCalendar *v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__23;
    v17 = __Block_byref_object_dispose__23;
    v18 = 0;
    calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__EKEventStore__eventCalendarWithIdentifier___block_invoke;
    block[3] = &unk_1E4785118;
    block[4] = self;
    v12 = &v13;
    v11 = v4;
    dispatch_sync(calendarSourcesAndDefaultsQueue, block);
    if (v14[5])
    {
      v7 = [EKCalendar alloc];
      v8 = -[EKObject initWithPersistentObject:](v7, "initWithPersistentObject:", v14[5]);
    }
    else
    {
      v8 = 0;
    }

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __45__EKEventStore__eventCalendarWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_populateCalendarsByIdentifierIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (EKCalendar)calendarWithIdentifier:(NSString *)identifier
{
  NSString *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = identifier;
  if (-[EKEventStore returnEventResults](self, "returnEventResults"))
  {
    -[EKEventStore _eventCalendarWithIdentifier:](self, "_eventCalendarWithIdentifier:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_16;
    -[EKEventStore sharedCalendarInvitationsForEntityTypes:](self, "sharedCalendarInvitationsForEntityTypes:", 3);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "calendarIdentifier", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if ((v13 & 1) != 0)
          {
            v5 = v11;

            goto LABEL_16;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }

  }
  if (-[EKEventStore returnReminderResults](self, "returnReminderResults", (_QWORD)v15))
  {
    -[EKReminderStore calendarWithIdentifier:](self->_reminderStore, "calendarWithIdentifier:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
LABEL_16:

  return (EKCalendar *)v5;
}

- (id)calendarsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[EKEventStore calendarWithIdentifier:](self, "calendarWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)calendarsWithObjectIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[EKEventStore publicObjectWithObjectID:](self, "publicObjectWithObjectID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (void)familyCalendarsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__EKEventStore_familyCalendarsWithCompletion___block_invoke;
  v6[3] = &unk_1E4788888;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[EKFamilyCircleManager requestFamilyShareesWithCompletion:](EKFamilyCircleManager, "requestFamilyShareesWithCompletion:", v6);

}

void __46__EKEventStore_familyCalendarsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "calendarsForEntityType:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (+[EKFamilyCircleManager isFamilyCalendar:givenFamilySharees:](EKFamilyCircleManager, "isFamilyCalendar:givenFamilySharees:", v10, v3))
          {
            objc_msgSend(v4, "addObject:", v10);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)calendarWithExternalURI:(id)a3
{
  id v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v10;
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKEventStore.m"), 5199, CFSTR("Nil URI passed"));

  }
  v11 = 0;
  v6 = -[EKEventStore _parseURI:expectedScheme:identifier:options:](self, "_parseURI:expectedScheme:identifier:options:", v5, CFSTR("x-apple-calendar"), &v11, 0);
  v7 = v11;
  if (v6)
  {
    -[EKEventStore calendarWithIdentifier:](self, "calendarWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore calendarWithExternalURI:].cold.1();
    v8 = 0;
  }

  return v8;
}

- (id)uniqueIdentifiersForEventsWithObjectIDs:(id)a3
{
  id v3;
  void *v4;
  NSObject *registeredQueue;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t m;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  id obj;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD block[4];
  id v78;
  EKEventStore *v79;
  id v80;
  void *v81;
  _BYTE v82[128];
  void *v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v48 = v3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    registeredQueue = self->_registeredQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke;
    block[3] = &unk_1E4785400;
    v6 = v48;
    v78 = v6;
    v79 = self;
    v7 = v4;
    v80 = v7;
    dispatch_sync(registeredQueue, block);
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    +[EKPersistentCalendarItem propertyKeyForUniqueIdentifier](EKPersistentEvent, "propertyKeyForUniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v74 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend(v15, "loadedOrUpdatedPropertyValue:wasAvailable:", v9, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v10, "addObject:", v16);
            objc_msgSend(v15, "objectID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "removeObject:", v17);

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v8, "count"))
    {
      if (!self->_deletedEventUniqueIdentifiersCache)
        goto LABEL_23;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      objc_msgSend(v8, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v70;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v70 != v20)
              objc_enumerationMutation(v18);
            v22 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j);
            -[NSCache objectForKey:](self->_deletedEventUniqueIdentifiersCache, "objectForKey:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              objc_msgSend(v10, "addObject:", v23);
              objc_msgSend(v8, "removeObject:", v22);
            }

          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
        }
        while (v19);
      }

      if (objc_msgSend(v8, "count"))
      {
LABEL_23:
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventStore database](self, "database");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "databaseRestoreGeneration");

        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v26 = v8;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v66;
          do
          {
            for (k = 0; k != v27; ++k)
            {
              if (*(_QWORD *)v66 != v28)
                objc_enumerationMutation(v26);
              v30 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
              if ((objc_msgSend(v30, "isTemporary") & 1) == 0 && objc_msgSend(v30, "entityType") == 2)
              {
                objc_msgSend(v30, "CADObjectIDWithGeneration:", v25);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "addObject:", v31);

              }
            }
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
          }
          while (v27);
        }

        if (v52)
        {
          v59 = 0;
          v60 = &v59;
          v61 = 0x3032000000;
          v62 = __Block_byref_object_copy__23;
          v63 = __Block_byref_object_dispose__23;
          v64 = 0;
          -[EKEventStore database](self, "database");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "CADOperationProxySync");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke_2;
          v58[3] = &unk_1E4788490;
          v58[4] = &v59;
          objc_msgSend(v33, "CADObjects:getPropertiesWithNames:reply:", v52, v34, v58);

          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          obj = (id)v60[5];
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v82, 16);
          if (v50)
          {
            v49 = *(_QWORD *)v55;
            while (2)
            {
              for (m = 0; m != v50; ++m)
              {
                if (*(_QWORD *)v55 != v49)
                  objc_enumerationMutation(obj);
                v36 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * m);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v44 = 0;
                  goto LABEL_48;
                }
                v37 = v36;
                objc_msgSend(v37, "loadedValues");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "firstObject");
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                if (v39)
                {
                  objc_msgSend(v37, "objectID");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v51);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v81 = v9;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "loadedValues");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = -[EKEventStore registerFetchedObjectWithID:withDefaultLoadedPropertyKeys:values:](self, "registerFetchedObjectWithID:withDefaultLoadedPropertyKeys:values:", v40, v41, v42);

                  objc_msgSend(v10, "addObject:", v39);
                }

              }
              v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v82, 16);
              if (v50)
                continue;
              break;
            }
          }

          v44 = (void *)objc_msgSend(v10, "copy");
LABEL_48:
          _Block_object_dispose(&v59, 8);

        }
        else
        {
          v44 = (void *)objc_msgSend(v10, "copy");
        }

        goto LABEL_53;
      }
      v45 = objc_msgSend(v10, "copy");
    }
    else
    {
      v45 = objc_msgSend(v10, "copy");
    }
    v44 = (void *)v45;
LABEL_53:

    goto LABEL_54;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_54:

  return v44;
}

void __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "entityType", (_QWORD)v9) == 2)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "objectForKeyedSubscript:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  if ((_DWORD)a2)
  {
    v6 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke_2_cold_1(a2, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v5;

}

- (id)uniqueIdentifiersForAllObjectsWithChangesRelatedToObjects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "frozenObject", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  +[EKPersistentObject allObjectsWithChangesRelatedToObjects:](EKPersistentObject, "allObjectsWithChangesRelatedToObjects:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("uniqueIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int)syncErrorCount
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[EKEventStore connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__EKEventStore_syncErrorCount__block_invoke;
  v5[3] = &unk_1E4788860;
  v5[4] = &v6;
  objc_msgSend(v3, "CADDatabaseGetErrorCount:", v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

void __30__EKEventStore_syncErrorCount__block_invoke(uint64_t a1, int a2, int a3)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __30__EKEventStore_syncErrorCount__block_invoke_cold_1(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)eventsWithErrorsPerSourceID
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__23;
  v12 = __Block_byref_object_dispose__23;
  v13 = 0;
  -[EKEventStore connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CADOperationProxySync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__EKEventStore_eventsWithErrorsPerSourceID__block_invoke;
  v7[3] = &unk_1E4788230;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "CADDatabaseGetEventsWithErrorsPerSource:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __43__EKEventStore_eventsWithErrorsPerSourceID__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __43__EKEventStore_eventsWithErrorsPerSourceID__block_invoke_cold_1(v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", (unint64_t)objc_msgSend(v5, "count") >> 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v11);
          +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (v14)
          {
            objc_msgSend(*(id *)(a1 + 32), "publicObjectWithFetchedObjectID:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v19, v14);

            v14 = 0;
          }
          else
          {
            v14 = (void *)v17;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);

    }
  }

}

- (EKImageCache)imageCache
{
  NSObject *registeredQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  registeredQueue = self->_registeredQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__EKEventStore_imageCache__block_invoke;
  v5[3] = &unk_1E4785190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(registeredQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (EKImageCache *)v3;
}

void __26__EKEventStore_imageCache__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_imageCache");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_imageCache
{
  EKImageCache *imageCache;
  EKImageCache *v4;
  EKImageCache *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_registeredQueue);
  imageCache = self->_imageCache;
  if (!imageCache)
  {
    v4 = objc_alloc_init(EKImageCache);
    v5 = self->_imageCache;
    self->_imageCache = v4;

    imageCache = self->_imageCache;
  }
  return imageCache;
}

- (void)_uncacheImage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "entityType") == 28)
  {
    -[EKEventStore _imageCache](self, "_imageCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uncacheImage:", v5);

  }
}

- (void)_clearImageCache
{
  EKImageCache *imageCache;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_registeredQueue);
  imageCache = self->_imageCache;
  self->_imageCache = 0;

}

- (id)colorWithProviderIdentifier:(id)a3 externalIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  v18 = 0;
  -[EKEventStore connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADOperationProxySync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__EKEventStore_colorWithProviderIdentifier_externalIdentifier___block_invoke;
  v12[3] = &unk_1E4788648;
  v12[4] = &v13;
  objc_msgSend(v9, "CADDatabaseGetColorWithProviderIdentifier:externalID:reply:", v6, v7, v12);

  if (v14[5])
  {
    -[EKEventStore publicObjectWithFetchedObjectID:](self, "publicObjectWithFetchedObjectID:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __63__EKEventStore_colorWithProviderIdentifier_externalIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      __63__EKEventStore_colorWithProviderIdentifier_externalIdentifier___block_invoke_cold_1(v6);
      if (!v5)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  if (v5)
  {
LABEL_4:
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
LABEL_5:

}

- (BOOL)saveColor:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  EKEventStore *v10;
  _BOOL4 v11;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (a5)
    *a5 = 0;
  if (!v8)
    goto LABEL_12;
  objc_msgSend(v8, "eventStore");
  v10 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  if (v10 != self)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 11);
      LOBYTE(v11) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    LOBYTE(v11) = 0;
    goto LABEL_13;
  }
  if (!objc_msgSend(v9, "validate:", a5) || !objc_msgSend(v9, "save:", a5))
    goto LABEL_12;
  -[EKEventStore _addObjectToPendingCommits:](self, "_addObjectToPendingCommits:", v9);
  v11 = -[EKEventStore save:](self, "save:", a5);
  if (v11 && v6)
    LOBYTE(v11) = -[EKEventStore commitWithRollback:](self, "commitWithRollback:", a5);
LABEL_13:

  return v11;
}

id __64__EKEventStore_occurrenceCacheGetOccurrencesForCalendars_onDay___block_invoke_310(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nextReminderDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("objectID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("occurrenceDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v15[0] = CFSTR("occurrenceDate");
    v15[1] = CFSTR("objectID");
    v16[0] = v6;
    v16[1] = v5;
    v15[2] = CFSTR("nextReminderDate");
    v16[2] = v3;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = v16;
    v9 = v15;
    v10 = 3;
  }
  else
  {
    v13[0] = CFSTR("occurrenceDate");
    v13[1] = CFSTR("objectID");
    v14[0] = v6;
    v14[1] = v5;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = v14;
    v9 = v13;
    v10 = 2;
  }
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setShowDeclinedEvents:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  v3 = a3;
  -[EKEventStore connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADOperationProxySync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__EKEventStore_setShowDeclinedEvents___block_invoke;
  v6[3] = &__block_descriptor_33_e8_v12__0i8l;
  v7 = v3;
  objc_msgSend(v5, "CADDatabaseSetShowsDeclinedEvents:reply:", v3, v6);

}

void __38__EKEventStore_setShowDeclinedEvents___block_invoke(uint64_t a1, int a2)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __38__EKEventStore_setShowDeclinedEvents___block_invoke_cold_1(a1, v3);
  }
}

- (void)showDeclinedEventsChanged:(id)a3
{
  NSNumber *v4;
  NSNumber *showDeclinedEventsNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CalShowDeclinedEvents());
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  showDeclinedEventsNumber = self->_showDeclinedEventsNumber;
  self->_showDeclinedEventsNumber = v4;

}

- (void)setShowCompletedReminders:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  v3 = a3;
  -[EKEventStore connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADOperationProxySync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__EKEventStore_setShowCompletedReminders___block_invoke;
  v6[3] = &__block_descriptor_33_e8_v12__0i8l;
  v7 = v3;
  objc_msgSend(v5, "CADDatabaseSetShowsCompletedReminders:reply:", v3, v6);

}

void __42__EKEventStore_setShowCompletedReminders___block_invoke(uint64_t a1, int a2)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __42__EKEventStore_setShowCompletedReminders___block_invoke_cold_1(a1, v3);
  }
}

- (BOOL)showCompletedReminders
{
  NSNumber *showCompletedRemindersNumber;
  NSNumber *v4;
  NSNumber *v5;

  showCompletedRemindersNumber = self->_showCompletedRemindersNumber;
  if (!showCompletedRemindersNumber)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CalShowCompletedReminders());
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_showCompletedRemindersNumber;
    self->_showCompletedRemindersNumber = v4;

    showCompletedRemindersNumber = self->_showCompletedRemindersNumber;
  }
  return -[NSNumber BOOLValue](showCompletedRemindersNumber, "BOOLValue");
}

- (void)showCompletedRemindersChanged:(id)a3
{
  NSNumber *v4;
  NSNumber *showCompletedRemindersNumber;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CalShowCompletedReminders());
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  showCompletedRemindersNumber = self->_showCompletedRemindersNumber;
  self->_showCompletedRemindersNumber = v4;

}

- (void)rebuildOccurrenceCache
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Sending request to rebuild the occurrence cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__EKEventStore_rebuildOccurrenceCache__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  _BOOL4 v4;

  v3 = (void *)EKLogHandle;
  v4 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v4)
      __38__EKEventStore_rebuildOccurrenceCache__block_invoke_cold_2(v3);
  }
  else if (v4)
  {
    __38__EKEventStore_rebuildOccurrenceCache__block_invoke_cold_1();
  }
}

- (BOOL)birthdayCalendarEnabled
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[EKEventStore connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__EKEventStore_birthdayCalendarEnabled__block_invoke;
  v5[3] = &unk_1E4787938;
  v5[4] = &v6;
  objc_msgSend(v3, "CADDatabaseGetBirthdayCalendarEnabledWithReply:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __39__EKEventStore_birthdayCalendarEnabled__block_invoke(uint64_t a1, int a2, char a3)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __39__EKEventStore_birthdayCalendarEnabled__block_invoke_cold_1(v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (void)setBirthdayCalendarEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[EKEventStore connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADOperationProxySync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADDatabaseSetBirthdayCalendarEnabled:withReply:", v3, &__block_literal_global_319);

}

void __43__EKEventStore_setBirthdayCalendarEnabled___block_invoke(uint64_t a1, int a2)
{
  void *v2;

  if (a2)
  {
    v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __43__EKEventStore_setBirthdayCalendarEnabled___block_invoke_cold_1(v2);
  }
}

- (int)birthdayCalendarVersion
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  -[EKEventStore connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__EKEventStore_birthdayCalendarVersion__block_invoke;
  v5[3] = &unk_1E4788860;
  v5[4] = &v6;
  objc_msgSend(v3, "CADDatabaseGetBirthdayCalendarVersionWithReply:", v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

void __39__EKEventStore_birthdayCalendarVersion__block_invoke(uint64_t a1, int a2, int a3)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __39__EKEventStore_birthdayCalendarVersion__block_invoke_cold_1(v3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (void)setBirthdayCalendarVersion:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  int v7;

  v3 = *(_QWORD *)&a3;
  -[EKEventStore connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADOperationProxySync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__EKEventStore_setBirthdayCalendarVersion___block_invoke;
  v6[3] = &__block_descriptor_36_e8_v12__0i8l;
  v7 = v3;
  objc_msgSend(v5, "CADDatabaseSetBirthdayCalendarVersion:withReply:", v3, v6);

}

void __43__EKEventStore_setBirthdayCalendarVersion___block_invoke(uint64_t a1, int a2)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __43__EKEventStore_setBirthdayCalendarVersion___block_invoke_cold_1(a1, v3);
  }
}

- (EKCalendar)suggestedEventCalendar
{
  NSObject *calendarSourcesAndDefaultsQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__EKEventStore_suggestedEventCalendar__block_invoke;
  v6[3] = &unk_1E47850A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  if (v8[5])
  {
    -[EKEventStore calendarWithID:](self, "calendarWithID:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return (EKCalendar *)v4;
}

void __38__EKEventStore_suggestedEventCalendar__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[4])
    goto LABEL_5;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__23;
  v14 = __Block_byref_object_dispose__23;
  v15 = 0;
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CADOperationProxySync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__EKEventStore_suggestedEventCalendar__block_invoke_2;
  v9[3] = &unk_1E4787960;
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = &v10;
  objc_msgSend(v4, "CADDatabaseGetSuggestedEventCalendarWithReply:", v9);

  v5 = (void *)v11[5];
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v5);
  _Block_object_dispose(&v10, 8);

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
LABEL_5:
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __38__EKEventStore_suggestedEventCalendar__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __38__EKEventStore_suggestedEventCalendar__block_invoke_2_cold_1(v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stampedCopyWithGeneration:", objc_msgSend(v7, "databaseRestoreGeneration"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (void)removeSuggestedEventCalendar
{
  NSObject *calendarSourcesAndDefaultsQueue;
  _QWORD block[5];

  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__EKEventStore_removeSuggestedEventCalendar__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(calendarSourcesAndDefaultsQueue, block);
}

void __44__EKEventStore_removeSuggestedEventCalendar__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "CADDatabaseRemoveSuggestedEventCalendarWithReply:", &__block_literal_global_323);

}

void __44__EKEventStore_removeSuggestedEventCalendar__block_invoke_2(uint64_t a1, int a2)
{
  void *v2;

  if (a2)
  {
    v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __44__EKEventStore_removeSuggestedEventCalendar__block_invoke_2_cold_1(v2);
  }
}

- (void)confirmSuggestedEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a3, "suggestionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[objc_class serviceForEvents](-[EKEventStore _SGSuggestionsServiceClass](self, "_SGSuggestionsServiceClass"), "serviceForEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__EKEventStore_confirmSuggestedEvent___block_invoke;
    v11[3] = &unk_1E47889F0;
    v12 = v6;
    v7 = v6;
    objc_msgSend(v7, "eventFromUniqueId:withCompletion:", v5, v11);

  }
  else
  {
    v8 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore confirmSuggestedEvent:].cold.1(v8, v9, v10);
  }

}

void __38__EKEventStore_confirmSuggestedEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "recordId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!a3 && v5)
  {
    v7 = (void *)v5;
    objc_msgSend(*(id *)(a1 + 32), "confirmEventByRecordId:withCompletion:", v5, &__block_literal_global_325);
    v6 = v7;
  }

}

void __38__EKEventStore_confirmSuggestedEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    __38__EKEventStore_confirmSuggestedEvent___block_invoke_2_cold_1();

}

- (void)acceptSuggestedEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventStore defaultCalendarForNewEvents](self, "defaultCalendarForNewEvents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventStore acceptSuggestedEvent:placeOnCalendar:](self, "acceptSuggestedEvent:placeOnCalendar:", v4, v5);

}

- (void)acceptSuggestedEvent:(id)a3 placeOnCalendar:(id)a4
{
  id v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  id v10;

  v6 = a3;
  objc_msgSend(v6, "setCalendar:", a4);
  v10 = 0;
  v7 = -[EKEventStore saveEvent:span:error:](self, "saveEvent:span:error:", v6, 0, &v10);
  v8 = v10;
  v9 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    -[EKEventStore acceptSuggestedEvent:placeOnCalendar:].cold.1(v7, (uint64_t)v8, v9);
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v7)
LABEL_3:
    -[EKEventStore confirmSuggestedEvent:](self, "confirmSuggestedEvent:", v6);
LABEL_4:

}

- (void)deleteSuggestedEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "suggestionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v19 = 0;
  v8 = -[EKEventStore removeEvent:span:error:](self, "removeEvent:span:error:", v4, 2, &v19);
  v9 = v19;
  v10 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    -[EKEventStore deleteSuggestedEvent:].cold.3(v8, (uint64_t)v9, v10);
  if (v7)
    v11 = v8;
  else
    v11 = 0;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKEventStore deleteSuggestedEvent:].cold.1();
    -[objc_class serviceForEvents](-[EKEventStore _SGSuggestionsServiceClass](self, "_SGSuggestionsServiceClass"), "serviceForEvents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __37__EKEventStore_deleteSuggestedEvent___block_invoke;
    v17[3] = &unk_1E47889F0;
    v18 = v12;
    v13 = v12;
    objc_msgSend(v13, "eventFromUniqueId:withCompletion:", v7, v17);

  }
  else if (!v7)
  {
    v14 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore deleteSuggestedEvent:].cold.2(v14, v15, v16);
  }

}

void __37__EKEventStore_deleteSuggestedEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "recordId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!a3 && v5)
  {
    v7 = (void *)v5;
    objc_msgSend(*(id *)(a1 + 32), "rejectEventByRecordId:withCompletion:", v5, &__block_literal_global_331);
    v6 = v7;
  }

}

void __37__EKEventStore_deleteSuggestedEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    __37__EKEventStore_deleteSuggestedEvent___block_invoke_2_cold_1();

}

- (Class)_SGSuggestionsServiceClass
{
  return (Class)EKWeakLinkClass();
}

- (BOOL)canModifySuggestedEventCalendar
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  if (canModifySuggestedEventCalendar_onceToken != -1)
    dispatch_once(&canModifySuggestedEventCalendar_onceToken, block);
  return canModifySuggestedEventCalendar_canModifySuggestedEventCalendar;
}

void __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 360);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke_2;
  block[3] = &unk_1E4785078;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "CADDatabaseCanModifySuggestedEventCalendar:", &__block_literal_global_334);

}

void __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke_3(uint64_t a1, int a2, char a3)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke_3_cold_1(v3);
  }
  else
  {
    canModifySuggestedEventCalendar_canModifySuggestedEventCalendar = a3;
  }
}

- (EKCalendar)naturalLanguageSuggestedEventCalendar
{
  NSObject *calendarSourcesAndDefaultsQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__EKEventStore_naturalLanguageSuggestedEventCalendar__block_invoke;
  v6[3] = &unk_1E47850A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  if (v8[5])
  {
    -[EKEventStore calendarWithCADID:](self, "calendarWithCADID:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return (EKCalendar *)v4;
}

void __53__EKEventStore_naturalLanguageSuggestedEventCalendar__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  __int128 v8;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[5];
  if (v3)
  {
    v4 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  else
  {
    objc_msgSend(v2, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CADOperationProxySync");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__EKEventStore_naturalLanguageSuggestedEventCalendar__block_invoke_2;
    v7[3] = &unk_1E4787960;
    v8 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v6, "CADDatabaseGetNaturalLanguageSuggestedEventCalendarWithReply:", v7);

    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v4 = (id *)(*(_QWORD *)(a1 + 32) + 40);
  }
  objc_storeStrong(v4, v3);
}

void __53__EKEventStore_naturalLanguageSuggestedEventCalendar__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __53__EKEventStore_naturalLanguageSuggestedEventCalendar__block_invoke_2_cold_1(v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stampedCopyWithGeneration:", objc_msgSend(v7, "databaseRestoreGeneration"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (BOOL)saveNotification:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  EKEventStore *v10;
  _BOOL4 v11;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (a5)
    *a5 = 0;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil notification passed in to [EKEventStore saveNotification:commit:error:]"));
    goto LABEL_13;
  }
  objc_msgSend(v8, "eventStore");
  v10 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  if (v10 != self)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 11);
      LOBYTE(v11) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    LOBYTE(v11) = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend(v9, "validate:", a5) || !objc_msgSend(v9, "save:", a5))
    goto LABEL_13;
  -[EKEventStore _addObjectToPendingCommits:](self, "_addObjectToPendingCommits:", v9);
  v11 = -[EKEventStore save:](self, "save:", a5);
  if (v11 && v6)
    LOBYTE(v11) = -[EKEventStore commitWithRollback:](self, "commitWithRollback:", a5);
LABEL_14:

  return v11;
}

- (BOOL)saveNotificationCollection:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  EKEventStore *v11;
  _BOOL4 v12;

  v6 = a4;
  v8 = a3;
  if (a5)
  {
    *a5 = 0;
    if (!-[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase"))
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = 30;
LABEL_9:
      objc_msgSend(v9, "errorWithEKErrorCode:", v10);
      LOBYTE(v12) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  else if (!-[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase"))
  {
    goto LABEL_16;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil notification collection passed in to [EKEventStore saveNotificationCollection:commit:error:]"));
    goto LABEL_16;
  }
  objc_msgSend(v8, "eventStore");
  v11 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  if (v11 != self)
  {
    if (a5)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = 11;
      goto LABEL_9;
    }
LABEL_16:
    LOBYTE(v12) = 0;
    goto LABEL_17;
  }
  if (!objc_msgSend(v8, "validate:", a5) || !objc_msgSend(v8, "save:", a5))
    goto LABEL_16;
  -[EKEventStore _addObjectToPendingCommits:](self, "_addObjectToPendingCommits:", v8);
  v12 = -[EKEventStore save:](self, "save:", a5);
  if (v12 && v6)
    LOBYTE(v12) = -[EKEventStore commitWithRollback:](self, "commitWithRollback:", a5);
LABEL_17:

  return v12;
}

- (id)sharedCalendarInvitationsForEntityTypes:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  EKCalendar *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsCalendarDaemon") & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement") & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasCalendarToolEntitlement") & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp") & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasTestingEntitlement"))
  {
    return 0;
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__23;
  v26 = __Block_byref_object_dispose__23;
  v27 = 0;
  -[EKEventStore connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADOperationProxySync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__EKEventStore_sharedCalendarInvitationsForEntityTypes___block_invoke;
  v21[3] = &unk_1E4788A78;
  v21[4] = &v22;
  v21[5] = a3;
  objc_msgSend(v6, "CADDatabaseGetSharedCalendarInvitationsWithReply:", v21);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)v23[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = -[EKObject initWithPersistentObject:]([EKCalendar alloc], "initWithPersistentObject:", v12);
          if ((-[EKCalendar allowedEntityTypes](v13, "allowedEntityTypes") & a3) != 0)
            objc_msgSend(v16, "addObject:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v16, "copy");
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __56__EKEventStore_sharedCalendarInvitationsForEntityTypes___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __56__EKEventStore_sharedCalendarInvitationsForEntityTypes___block_invoke_cold_1(a1, v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (void)respondToSharedCalendarInvitation:(id)a3 withStatus:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore calendarWithID:](self, "calendarWithID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    switch(a4)
    {
      case 0uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unsupported status for responding to shared calendar invitation. Only accept and decline are supported"), 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "raise");

        goto LABEL_4;
      case 1uLL:
LABEL_4:
        v11 = 1;
        break;
      case 2uLL:
        v11 = 2;
        break;
      default:
        v11 = 0;
        break;
    }
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendarIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "externalID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "respondToSharedCalendarInvite:forCalendarWithID:accountID:queue:completionBlock:", v11, v13, v14, MEMORY[0x1E0C80D38], &__block_literal_global_343);

  }
  else
  {
    v15 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore respondToSharedCalendarInvitation:withStatus:].cold.1(v15, v16, v17);
  }

}

void __61__EKEventStore_respondToSharedCalendarInvitation_withStatus___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543874;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl(&dword_1A2318000, v9, OS_LOG_TYPE_ERROR, "Failed to respond to shared calendar invitation with calendar ID %{public}@, account ID %{public}@: %@", (uint8_t *)&v10, 0x20u);
    }
  }

}

- (id)resourceChangesForEntityTypes:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__23;
  v27 = __Block_byref_object_dispose__23;
  v28 = 0;
  -[EKEventStore connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADOperationProxySync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __46__EKEventStore_resourceChangesForEntityTypes___block_invoke;
  v22[3] = &unk_1E4788490;
  v22[4] = &v23;
  objc_msgSend(v6, "CADDatabaseGetResourceChanges:", v22);

  if (v24[5])
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = (id)v24[5];
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(obj);
          +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9), v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            -[EKEventStore publicObjectWithPersistentObject:](self, "publicObjectWithPersistentObject:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "calendarItem");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "calendar");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if ((a3 & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              || (a3 & 2) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              || !v13 && (objc_msgSend(v14, "allowedEntityTypes") & a3) != 0)
            {
              objc_msgSend(v16, "addObject:", v12);
            }

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
      }
      while (v7);
    }

  }
  else
  {
    v16 = 0;
  }
  _Block_object_dispose(&v23, 8);

  return v16;
}

void __46__EKEventStore_resourceChangesForEntityTypes___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __46__EKEventStore_resourceChangesForEntityTypes___block_invoke_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (BOOL)markResourceChangeAlertedAndSave:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  EKEventStore *v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  if (!v6)
    goto LABEL_8;
  objc_msgSend(v6, "eventStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_8;
  objc_msgSend(v7, "eventStore");
  v9 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  if (v9 != self)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 11);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__23;
  v20 = __Block_byref_object_dispose__23;
  v21 = 0;
  -[EKEventStore connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CADOperationProxySync");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CADObjectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__EKEventStore_markResourceChangeAlertedAndSave_error___block_invoke;
  v15[3] = &unk_1E4788728;
  v15[4] = &v16;
  v15[5] = &v22;
  objc_msgSend(v13, "CADResourceChange:setAlertedWithError:", v14, v15);

  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  if (*((_BYTE *)v23 + 24))
  {
    objc_msgSend(v7, "clearAlertedStatus");
    v10 = *((_BYTE *)v23 + 24) != 0;
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
LABEL_9:

  return v10;
}

void __55__EKEventStore_markResourceChangeAlertedAndSave_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __55__EKEventStore_markResourceChangeAlertedAndSave_error___block_invoke_cold_1();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)removeResourceChange:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EKEventStore removeResourceChanges:error:](self, "removeResourceChanges:error:", v7, a4);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 5);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)removeResourceChanges:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  EKEventStore *v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  if (!v6)
    goto LABEL_17;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "eventStore", (_QWORD)v18);
        v14 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

        if (v14 != self)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 11);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_17;
        }
        objc_msgSend(v13, "persistentObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventStore _deleteObject:](self, "_deleteObject:", v15);

        -[EKEventStore _addRemovedObjectToPendingCommits:](self, "_addRemovedObjectToPendingCommits:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (-[EKEventStore save:](self, "save:", a4))
    v16 = -[EKEventStore commitWithRollback:](self, "commitWithRollback:", a4);
  else
LABEL_17:
    v16 = 0;

  return v16;
}

- (BOOL)removeResourceChangesForCalendarItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  -[EKEventStore resourceChangesForEntityTypes:](self, "resourceChangesForEntityTypes:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__EKEventStore_removeResourceChangesForCalendarItem_error___block_invoke;
  v13[3] = &unk_1E4788AC0;
  v14 = v6;
  v9 = v6;
  objc_msgSend(v8, "predicateWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[EKEventStore removeResourceChanges:error:](self, "removeResourceChanges:error:", v11, a4);
  return (char)a4;
}

uint64_t __59__EKEventStore_removeResourceChangesForCalendarItem_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "calendarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "calendarItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (NSArray)eventNotifications
{
  return (NSArray *)-[EKEventStore eventNotificationsAfterDate:](self, "eventNotificationsAfterDate:", 0);
}

- (id)eventNotificationsAfterDate:(id)a3
{
  return -[EKEventStore eventNotificationsAfterDate:filteredByShowsNotificationsFlag:earliestExpiringNotification:](self, "eventNotificationsAfterDate:filteredByShowsNotificationsFlag:earliestExpiringNotification:", a3, 1, 0);
}

- (id)eventNotificationsAfterDate:(id)a3 filteredByShowsNotificationsFlag:(BOOL)a4 earliestExpiringNotification:(id *)a5
{
  return -[EKEventStore eventNotificationsAfterDate:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:earliestExpiringNotification:](self, "eventNotificationsAfterDate:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:earliestExpiringNotification:", a3, 0, a4, a5);
}

- (unint64_t)eventNotificationCount
{
  return -[EKEventStore eventNotificationCountExpanded:](self, "eventNotificationCountExpanded:", 0);
}

- (unint64_t)eventNotificationCountExpanded:(BOOL)a3
{
  return -[EKEventStore eventNotificationCountExcludingUncheckedCalendars:expanded:](self, "eventNotificationCountExcludingUncheckedCalendars:expanded:", 0, a3);
}

- (unint64_t)eventNotificationCountExcludingUncheckedCalendars:(BOOL)a3 expanded:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a4;
  v5 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[EKEventStore connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CADOperationProxySync");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__EKEventStore_eventNotificationCountExcludingUncheckedCalendars_expanded___block_invoke;
  v10[3] = &unk_1E47883F8;
  v10[4] = &v11;
  objc_msgSend(v7, "CADDatabaseGetNotificationCountExcludingUncheckedCalendars:expanded:reply:", v5, v4, v10);

  v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __75__EKEventStore_eventNotificationCountExcludingUncheckedCalendars_expanded___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __75__EKEventStore_eventNotificationCountExcludingUncheckedCalendars_expanded___block_invoke_cold_1(v3);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (unint64_t)eventNotificationCountForSource:(id)a3 excludingDelegateSources:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 excludeObjectIDs:(id)a6
{
  return -[EKEventStore eventNotificationCountForSource:excludingDelegateSources:filteredByShowsNotificationsFlag:excludeObjectIDs:expanded:](self, "eventNotificationCountForSource:excludingDelegateSources:filteredByShowsNotificationsFlag:excludeObjectIDs:expanded:", a3, a4, a5, a6, 0);
}

- (unint64_t)eventNotificationCountForSource:(id)a3 excludingDelegateSources:(BOOL)a4 filteredByShowsNotificationsFlag:(BOOL)a5 excludeObjectIDs:(id)a6 expanded:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v7 = a7;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  -[EKEventStore connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "CADOperationProxySync");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "externalID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __132__EKEventStore_eventNotificationCountForSource_excludingDelegateSources_filteredByShowsNotificationsFlag_excludeObjectIDs_expanded___block_invoke;
  v20[3] = &unk_1E4788B10;
  v17 = v13;
  v21 = v17;
  v22 = &v23;
  objc_msgSend(v15, "CADDatabaseGetNotificationCountForSourceWithExternalIdentifier:excludingDelegateSources:filteredByShowsNotificationsFlag:expanded:reply:", v16, v10, v9, v7, v20);

  v18 = v24[3];
  _Block_object_dispose(&v23, 8);

  return v18;
}

void __132__EKEventStore_eventNotificationCountForSource_excludingDelegateSources_filteredByShowsNotificationsFlag_excludeObjectIDs_expanded___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a2)
  {
    v8 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __75__EKEventStore_eventNotificationCountExcludingUncheckedCalendars_expanded___block_invoke_cold_1(v8);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
LABEL_6:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        if (!a3)
          break;
        a3 -= objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
        if (v11 == v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v11)
            goto LABEL_6;
          break;
        }
      }
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }

}

- (BOOL)acknowledgeNotifications:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "acknowledgeWithEventStore:error:", self, a4, (_QWORD)v13))
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (NSArray)inboxRepliedSectionItems
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  -[EKEventStore connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__EKEventStore_inboxRepliedSectionItems__block_invoke;
  v6[3] = &unk_1E4788B38;
  v6[4] = &v7;
  objc_msgSend(v3, "CADDatabaseGetInboxRepliedSectionItems:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __40__EKEventStore_inboxRepliedSectionItems__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  EKEventOccurrenceInfo *v20;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __40__EKEventStore_inboxRepliedSectionItems__block_invoke_cold_1(v9);
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    if (v10)
    {
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceReferenceDate");
        v18 = v17;

        +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[EKEventOccurrenceInfo initWithObjectID:date:]([EKEventOccurrenceInfo alloc], "initWithObjectID:date:", v19, v18);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v20);

      }
    }
  }

}

- (BOOL)removeInviteReplyNotification:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[EKEventStore removeInviteReplyNotifications:error:](self, "removeInviteReplyNotifications:error:", v6, a4);

  return (char)a4;
}

- (BOOL)removeInviteReplyNotifications:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  EKEventStore *v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  if (!v6)
    goto LABEL_17;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "eventStore", (_QWORD)v18);
        v14 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

        if (v14 != self)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 11);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_17;
        }
        objc_msgSend(v13, "persistentObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventStore _deleteObject:](self, "_deleteObject:", v15);

        -[EKEventStore _addRemovedObjectToPendingCommits:](self, "_addRemovedObjectToPendingCommits:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (-[EKEventStore save:](self, "save:", a4))
    v16 = -[EKEventStore commitWithRollback:](self, "commitWithRollback:", a4);
  else
LABEL_17:
    v16 = 0;

  return v16;
}

- (id)attachmentWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  EKEventStore *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__23;
  v18 = __Block_byref_object_dispose__23;
  v19 = 0;
  -[EKEventStore connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADOperationProxySync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__EKEventStore_attachmentWithUUID___block_invoke;
  v10[3] = &unk_1E4788B60;
  v7 = v4;
  v11 = v7;
  v12 = self;
  v13 = &v14;
  objc_msgSend(v6, "CADDatabaseGetAttachmentWithUUID:reply:", v7, v10);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __35__EKEventStore_attachmentWithUUID___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  EKAttachment *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __35__EKEventStore_attachmentWithUUID___block_invoke_cold_1();
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerFetchedObjectWithID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[EKObject initWithPersistentObject:]([EKAttachment alloc], "initWithPersistentObject:", v8);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }

}

- (BOOL)saveAttachment:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  EKEventStore *v10;
  _BOOL4 v11;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (a5)
    *a5 = 0;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil attachment passed in to [EKEventStore saveAttachment:commit:error:]"));
    goto LABEL_9;
  }
  if (!objc_msgSend(v8, "validateWithOwner:error:", 0, a5))
  {
LABEL_9:
    LOBYTE(v11) = 0;
    goto LABEL_10;
  }
  objc_msgSend(v9, "eventStore");
  v10 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  if (v10 != self)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 11);
      LOBYTE(v11) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (!objc_msgSend(v9, "save:", a5))
    goto LABEL_9;
  -[EKEventStore _addObjectToPendingCommits:](self, "_addObjectToPendingCommits:", v9);
  v11 = -[EKEventStore save:](self, "save:", a5);
  if (v11 && v6)
    LOBYTE(v11) = -[EKEventStore commitWithRollback:](self, "commitWithRollback:", a5);
LABEL_10:

  return v11;
}

- (BOOL)_refreshDASource:(id)a3 isUserRequested:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "externalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (v7)
  {
    -[EKEventStore connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CADOperationProxySync");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CADObjectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__EKEventStore__refreshDASource_isUserRequested___block_invoke;
    v13[3] = &unk_1E4787938;
    v13[4] = &v14;
    objc_msgSend(v9, "CADSourceRefresh:isUserRequested:reply:", v10, v4, v13);

    v11 = *((_BYTE *)v15 + 24) != 0;
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __49__EKEventStore__refreshDASource_isUserRequested___block_invoke(uint64_t a1, int a2, char a3)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __49__EKEventStore__refreshDASource_isUserRequested___block_invoke_cold_1(v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

+ (BOOL)_shouldRefreshSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isEnabled") && objc_msgSend(v4, "sourceType"))
  {
    objc_msgSend(v4, "externalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_refreshFolderListForSource:(id)a3 isUserRequested:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0D1C3F8];
  v6 = a3;
  objc_msgSend(v5, "sharedConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "externalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "updateFolderListForAccountID:andDataclasses:isUserRequested:", v7, 4, v4);
}

- (id)refreshSourcesIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (-[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[EKEventStore eventSources](self, "eventSources", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          if (objc_msgSend((id)objc_opt_class(), "_shouldRefreshSource:", v11)
            && -[EKEventStore _refreshDASource:isUserRequested:](self, "_refreshDASource:isUserRequested:", v11, v3))
          {
            objc_msgSend(v5, "addObject:", v11);
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (void)refreshSourcesIfNecessary
{
  id v2;

  v2 = -[EKEventStore refreshSourcesIfNecessary:](self, "refreshSourcesIfNecessary:", 0);
}

- (id)refreshFolderListsIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EKEventStore eventSources](self, "eventSources", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if (objc_msgSend((id)objc_opt_class(), "_shouldRefreshSource:", v11))
        {
          objc_msgSend((id)objc_opt_class(), "_refreshFolderListForSource:isUserRequested:", v11, v3);
          objc_msgSend(v5, "addObject:", v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)refreshEverythingIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[EKEventStore refreshFolderListsIfNecessary:](self, "refreshFolderListsIfNecessary:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore refreshSourcesIfNecessary:](self, "refreshSourcesIfNecessary:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_registerObject:(id)a3
{
  id v4;
  NSObject *registeredQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__EKEventStore__registerObject___block_invoke;
  block[3] = &unk_1E47853B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(registeredQueue, block);

}

uint64_t __32__EKEventStore__registerObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerObjectImmediate:", *(_QWORD *)(a1 + 40));
}

- (void)_unregisterObject:(id)a3
{
  id v4;
  NSObject *registeredQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__EKEventStore__unregisterObject___block_invoke;
  block[3] = &unk_1E47853B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(registeredQueue, block);

}

uint64_t __34__EKEventStore__unregisterObject___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 440);
  if (v1)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 40), "objectID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeObjectForKey:", v3);

    return objc_msgSend(*(id *)(v2 + 32), "_uncacheImage:", *(_QWORD *)(v2 + 40));
  }
  return result;
}

- (void)_detachObject:(id)a3
{
  id v4;
  NSObject *registeredQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__EKEventStore__detachObject___block_invoke;
  block[3] = &unk_1E47853B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(registeredQueue, block);

}

uint64_t __30__EKEventStore__detachObject___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 440);
  if (v1)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 40), "objectID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeObjectForKey:", v3);

    return objc_msgSend(*(id *)(v2 + 32), "_uncacheImage:", *(_QWORD *)(v2 + 40));
  }
  return result;
}

- (void)_reregisterObject:(id)a3 oldID:(id)a4
{
  id v6;
  id v7;
  NSObject *registeredQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__EKEventStore__reregisterObject_oldID___block_invoke;
  block[3] = &unk_1E4785400;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(registeredQueue, block);

}

void __40__EKEventStore__reregisterObject_oldID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 440), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(*(id *)(a1[4] + 440), "removeObjectForKey:", a1[5]);
    v3 = *(void **)(a1[4] + 440);
    v4 = (void *)a1[6];
    objc_msgSend(v4, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, v5);

    v2 = v6;
  }

}

- (void)_forgetRegisteredObjects
{
  NSObject *registeredQueue;
  _QWORD block[5];

  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__EKEventStore__forgetRegisteredObjects__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(registeredQueue, block);
}

void __40__EKEventStore__forgetRegisteredObjects__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1A85847F4]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", sel__setEventStore_, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_clearImageCache");
  objc_autoreleasePoolPop(v2);
}

- (BOOL)_isRegisteredObject:(id)a3
{
  id v4;
  NSObject *registeredQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  registeredQueue = self->_registeredQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__EKEventStore__isRegisteredObject___block_invoke;
  block[3] = &unk_1E4785118;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(registeredQueue, block);
  LOBYTE(registeredQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)registeredQueue;
}

void __36__EKEventStore__isRegisteredObject___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  id v4;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKey:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3 != 0;

  }
}

- (id)persistentObjectWithEntityName:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;

  v4 = a3;
  v5 = (objc_class *)objc_msgSend((id)objc_opt_class(), "classForEntityName:", v4);

  v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "_setEventStore:", self);
  return v6;
}

- (id)insertedPersistentObjectWithEntityName:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;

  v4 = a3;
  v5 = (objc_class *)objc_msgSend((id)objc_opt_class(), "classForEntityName:", v4);

  v6 = objc_alloc_init(v5);
  -[EKEventStore _insertObject:](self, "_insertObject:", v6);
  return v6;
}

- (id)publicObjectWithObjectID:(id)a3
{
  void *v4;
  void *v5;

  -[EKEventStore objectWithObjectID:](self, "objectWithObjectID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[EKEventStore publicObjectWithPersistentObject:](self, "publicObjectWithPersistentObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)publicObjectWithFetchedObjectID:(id)a3
{
  void *v4;
  void *v5;

  -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore publicObjectWithPersistentObject:](self, "publicObjectWithPersistentObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_trackModifiedObject:(id)a3
{
  id v5;
  NSObject *unsavedChangesQueue;
  id v7;
  _QWORD block[4];
  id v9;
  EKEventStore *v10;
  SEL v11;

  v5 = a3;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EKEventStore__trackModifiedObject___block_invoke;
  block[3] = &unk_1E4788B88;
  v10 = self;
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_sync(unsavedChangesQueue, block);

}

uint64_t __37__EKEventStore__trackModifiedObject___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "_isPendingInsert") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "_isPendingDelete"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("EKEventStore.m"), 6705, CFSTR("Can't add deleted or inserted object to update set"));

  }
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 320);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 320);
    *(_QWORD *)(v4 + 320) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 320);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "_setPendingUpdate:", 1);
}

- (void)_objectDidReset:(id)a3
{
  id v4;
  NSObject *unsavedChangesQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__EKEventStore__objectDidReset___block_invoke;
  block[3] = &unk_1E47853B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(unsavedChangesQueue, block);

}

void __32__EKEventStore__objectDidReset___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = v3;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 40), "objectID", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if ((v14 & 1) == 0)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)_insertObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EKEventStore *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  NSObject *unsavedChangesQueue;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;

  v4 = a3;
  if (!v4)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Attempt to insert a nil object.");
    goto LABEL_12;
  }
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Attempt to insert something that is not a EKPersistentObject.");
LABEL_12:
    objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "eventStore");
    v7 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

    if (v7 != self)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = CFSTR("Attempt to insert an object that belongs to a different event store.");
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(v5, "_setEventStore:", self);
  }
  objc_msgSend(v5, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[EKObjectID temporaryObjectIDWithEntityType:](EKObjectID, "temporaryObjectIDWithEntityType:", objc_msgSend(v5, "entityType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setObjectID:inDatabaseRestoreGeneration:", v12, 0xFFFFFFFFLL);

  }
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__EKEventStore__insertObject___block_invoke;
  block[3] = &unk_1E47853B0;
  block[4] = self;
  v17 = v5;
  v15 = v5;
  dispatch_sync(unsavedChangesQueue, block);

}

void __30__EKEventStore__insertObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 304))
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 304);
    *(_QWORD *)(v3 + 304) = v2;

  }
  if (objc_msgSend(*(id *)(a1 + 40), "_isPendingDelete"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "_setPendingDelete:", 0);
    objc_msgSend(*(id *)(a1 + 40), "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isTemporary");

    if ((v6 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_unregisterObject:", *(_QWORD *)(a1 + 40));
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "_isPendingUpdate"))
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 320);
    if (!v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 320);
      *(_QWORD *)(v9 + 320) = v8;

      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 320);
    }
    objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 40));
  }
  else if ((objc_msgSend(*(id *)(a1 + 40), "_isPendingInsert") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "_setPendingInsert:", 1);
  }
}

- (void)_markObjectUncommittable:(id)a3
{
  id v4;
  NSObject *unsavedChangesQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__EKEventStore__markObjectUncommittable___block_invoke;
  block[3] = &unk_1E47853B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(unsavedChangesQueue, block);

}

uint64_t __41__EKEventStore__markObjectUncommittable___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 328);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 328);
    *(_QWORD *)(v4 + 328) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 328);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isObjectInserted:(id)a3
{
  id v4;
  NSObject *unsavedChangesQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__EKEventStore_isObjectInserted___block_invoke;
  block[3] = &unk_1E4785298;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(unsavedChangesQueue, block);
  LOBYTE(unsavedChangesQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)unsavedChangesQueue;
}

uint64_t __33__EKEventStore_isObjectInserted___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 304), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)_deleteObject:(id)a3
{
  EKEventStore *v4;
  NSObject *unsavedChangesQueue;
  id v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;

  v11 = a3;
  if (!v11)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = CFSTR("Attempt to delete a nil object.");
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = CFSTR("Attempt to delete something that is not a EKPersistentObject.");
LABEL_8:
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  objc_msgSend(v11, "eventStore");
  v4 = (EKEventStore *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[EKEventStore _cacheDeletedEventIdentifierIfNeededForObject:](self, "_cacheDeletedEventIdentifierIfNeededForObject:", v11);
    unsavedChangesQueue = self->_unsavedChangesQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__EKEventStore__deleteObject___block_invoke;
    block[3] = &unk_1E47853B0;
    block[4] = self;
    v6 = v11;
    v13 = v6;
    dispatch_sync(unsavedChangesQueue, block);
    -[EKEventStore _clearPendingChangesForObjectsWithOwner:](self, "_clearPendingChangesForObjectsWithOwner:", v6);

  }
}

void __30__EKEventStore__deleteObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 312))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 312);
    *(_QWORD *)(v3 + 312) = v2;

  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "_isPendingInsert");
  v6 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v6, "_setPendingInsert:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "removeObject:", *(_QWORD *)(a1 + 40));
LABEL_8:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "removeObject:", *(_QWORD *)(a1 + 40));
    goto LABEL_11;
  }
  v7 = objc_msgSend(v6, "_isPendingUpdate");
  v8 = *(void **)(a1 + 40);
  if (v7)
  {
    objc_msgSend(v8, "_setPendingUpdate:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_setPendingDelete:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "removeObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (objc_msgSend(v8, "isNew"))
      goto LABEL_8;
    objc_msgSend(*(id *)(a1 + 40), "_setPendingDelete:", 1);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "addObject:", *(_QWORD *)(a1 + 40));
LABEL_11:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "copy", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "objectID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if (v17)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)rollback
{
  -[EKEventStore rollbackObjectsWithIdentifiers:](self, "rollbackObjectsWithIdentifiers:", 0);
}

- (void)rollbackObjectsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *unsavedChangesQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EKEventStore_rollbackObjectsWithIdentifiers___block_invoke;
  block[3] = &unk_1E47853B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(unsavedChangesQueue, block);

}

void __47__EKEventStore_rollbackObjectsWithIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_filteredObjectsWithIdentifiers:fromObjects:excludingObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_class();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_filteredObjectsWithIdentifiers:fromObjects:excludingObjects:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_class();
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_filteredObjectsWithIdentifiers:fromObjects:excludingObjects:", v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v54 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "_setPendingInsert:", 0);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v16);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v50 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        objc_msgSend(v24, "rollback");
        objc_msgSend(v24, "_setPendingUpdate:", 0);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v21);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v25 = v13;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v46 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
        objc_msgSend(v30, "rollback");
        objc_msgSend(v30, "_setPendingDelete:", 0);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v27);
  }

  v32 = *(_QWORD *)(a1 + 32);
  v31 = *(void **)(a1 + 40);
  v33 = *(void **)(v32 + 112);
  if (v31)
  {
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __47__EKEventStore_rollbackObjectsWithIdentifiers___block_invoke_2;
    v43[3] = &unk_1E4788BB0;
    v44 = v31;
    objc_msgSend(v33, "CalFilterUsingBlock:", v43);

  }
  else
  {
    objc_msgSend(*(id *)(v32 + 112), "removeAllObjects");
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v34 = v14;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v40;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v40 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "removeObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * m), (_QWORD)v39);
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v39, v57, 16);
    }
    while (v36);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "minusSet:", v25);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "minusSet:", v19);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "minusSet:", v34);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "minusSet:", v19);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "minusSet:", v25);

}

uint64_t __47__EKEventStore_rollbackObjectsWithIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (void)_clearAllCaches
{
  uint64_t v3;
  NSObject *unsavedChangesQueue;
  NSObject *calendarSourcesAndDefaultsQueue;
  _QWORD v6[5];
  _QWORD block[5];

  -[NSCache removeAllObjects](self->_deletedEventUniqueIdentifiersCache, "removeAllObjects");
  v3 = MEMORY[0x1E0C809B0];
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EKEventStore__clearAllCaches__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(unsavedChangesQueue, block);
  -[EKEventStore _forgetRegisteredObjects](self, "_forgetRegisteredObjects");
  calendarSourcesAndDefaultsQueue = self->_calendarSourcesAndDefaultsQueue;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __31__EKEventStore__clearAllCaches__block_invoke_2;
  v6[3] = &unk_1E4785078;
  v6[4] = self;
  dispatch_sync(calendarSourcesAndDefaultsQueue, v6);
  -[EKEventStore invalidateReminderSourceMaps](self, "invalidateReminderSourceMaps");
}

uint64_t __31__EKEventStore__clearAllCaches__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 304);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v7, "_setPendingInsert:", 0);
        objc_msgSend(v7, "_setEventStore:", 0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v4);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 320);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(v13, "_setPendingUpdate:", 0);
        objc_msgSend(v13, "_setEventStore:", 0);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = *(id *)(*(_QWORD *)(a1 + 32) + 312);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * k);
        objc_msgSend(v19, "_setPendingDelete:", 0, (_QWORD)v21);
        objc_msgSend(v19, "_setEventStore:", 0);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v16);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeAllObjects");
}

uint64_t __31__EKEventStore__clearAllCaches__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_clearCachedCalendars");
  objc_msgSend(*(id *)(a1 + 32), "_clearCachedSources");
  objc_msgSend(*(id *)(a1 + 32), "_resetCachedPersonaIdentifiers");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clearCachedAuthStatus");
}

- (void)reset
{
  id v3;

  if (-[EKEventStore returnReminderResults](self, "returnReminderResults"))
    -[EKReminderStore reset](self->_reminderStore, "reset");
  -[EKEventStore _clearAllCaches](self, "_clearAllCaches");
  -[EKDaemonConnection CADOperationProxySync](self->_database, "CADOperationProxySync");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CADDatabaseResetWithReply:", &__block_literal_global_374);

}

- (BOOL)save:(id *)a3
{
  NSObject *unsavedChangesQueue;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__23;
  v18 = __Block_byref_object_dispose__23;
  v19 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__EKEventStore_save___block_invoke;
  block[3] = &unk_1E47850A0;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(unsavedChangesQueue, block);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)v15[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "markAsSaved", (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v20, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v14, 8);
  return 1;
}

void __21__EKEventStore_save___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "persistentObject", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isNew")
          || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "containsObject:", v9))
        {
          objc_msgSend(v2, "addObject:", v8);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v2;
  v12 = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "removeAllObjects");
}

- (BOOL)commit:(NSError *)error
{
  _BOOL4 v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[8];
  id v10;

  v10 = 0;
  v4 = -[EKEventStore _commit:](self, "_commit:", &v10);
  v5 = v10;
  v6 = v5;
  if (error)
    *error = (NSError *)objc_retainAutorelease(v5);
  v7 = EKLogHandle;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_DEFAULT, "Committed successfully", v9, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore commit:].cold.1();
  }

  return v4;
}

- (BOOL)_commit:(id *)a3
{
  _BOOL4 v5;
  char v7;

  v5 = -[EKEventStore returnEventResults](self, "returnEventResults");
  if (v5
    && !-[EKEventStore _commitObjectsWithIdentifiers:error:](self, "_commitObjectsWithIdentifiers:error:", 0, a3))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    if (-[EKEventStore returnReminderResults](self, "returnReminderResults"))
      return -[EKReminderStore commit:](self->_reminderStore, "commit:", a3);
    if (a3)
      v7 = v5;
    else
      v7 = 1;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 29);
      LOBYTE(v5) = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (BOOL)commitWithRollback:(id *)a3
{
  BOOL v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  v5 = -[EKEventStore commit:](self, "commit:", &v9);
  v6 = v9;
  v7 = v6;
  if (!v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore commitWithRollback:].cold.1();
    -[EKEventStore rollback](self, "rollback");
  }

  return v5;
}

- (BOOL)commitWithRollbackForNewClients:(id *)a3
{
  if (objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E60901FFFFFFFFLL))
    return -[EKEventStore commitWithRollback:](self, "commitWithRollback:", a3);
  else
    return -[EKEventStore commit:](self, "commit:", a3);
}

- (BOOL)commitObjects:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[8];
  id v18;
  uint8_t buf[16];

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("persistentObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKPersistentObject allObjectsWithChangesRelatedToObjects:](EKPersistentObject, "allObjectsWithChangesRelatedToObjects:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setByAddingObjectsFromSet:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", CFSTR("objectID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v11 = -[EKEventStore _commitObjectsWithIdentifiers:error:](self, "_commitObjectsWithIdentifiers:error:", v10, &v18);
    v12 = v18;
    v13 = v12;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
    v14 = EKLogHandle;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1A2318000, v14, OS_LOG_TYPE_DEFAULT, "Committed successfully", v17, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        -[EKEventStore commitWithRollback:].cold.1();
      -[EKEventStore rollbackObjectsWithIdentifiers:](self, "rollbackObjectsWithIdentifiers:", v10);
    }

  }
  else
  {
    v15 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2318000, v15, OS_LOG_TYPE_DEFAULT, "Committing no objects. Calling it a success and bailing early.", buf, 2u);
    }
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (BOOL)objectsHaveChangesToCommit:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "valueForKey:", CFSTR("persistentObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKPersistentObject allObjectsWithChangesRelatedToObjects:](EKPersistentObject, "allObjectsWithChangesRelatedToObjects:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

+ (id)_filteredObjectsWithIdentifiers:(id)a3 fromObjects:(id)a4 excludingObjects:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v17, "objectID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "containsObject:", v18))
          {
            v19 = objc_msgSend(v10, "containsObject:", v17);

            if ((v19 & 1) == 0)
              objc_msgSend(v11, "addObject:", v17);
          }
          else
          {

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    v20 = (void *)objc_msgSend(v11, "copy");
    v8 = v22;
  }
  else if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "minusSet:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

+ (id)_filteredArrayWithIdentifiers:(id)a3 fromObjects:(id)a4 excludingObjects:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v21 = v8;
    v22 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "objectID", v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v7, "containsObject:", v16) & 1) != 0)
          {
            objc_msgSend(v15, "frozenObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v9, "containsObject:", v17);

            if ((v18 & 1) == 0)
              objc_msgSend(v22, "addObject:", v15);
          }
          else
          {

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    v19 = (void *)objc_msgSend(v22, "copy");
    v8 = v21;
  }
  else
  {
    v19 = (void *)objc_msgSend(v8, "copy");
  }

  return v19;
}

+ (id)_iMIPScheduledEvent:(id)a3
{
  return 0;
}

+ (BOOL)_isConfirmedSuggestedEvent:(id)a3 uniqueKey:(id *)a4
{
  id v5;
  EKEvent *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[EKEvent initWithPersistentObject:]([EKEvent alloc], "initWithPersistentObject:", v5);
    -[EKEvent suggestionInfo](v6, "suggestionInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7
      && (-[EKCalendarItem calendar](v6, "calendar"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isSuggestedEventCalendar"),
          v8,
          (v9 & 1) == 0))
    {
      if (a4)
      {
        -[EKEvent suggestionInfo](v6, "suggestionInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueKey");
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_clearPendingChangesForObjectsWithOwner:(id)a3
{
  void *v4;
  NSObject *unsavedChangesQueue;
  id v6;
  _QWORD block[5];
  id v8;

  objc_msgSend(a3, "ownedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__EKEventStore__clearPendingChangesForObjectsWithOwner___block_invoke;
  block[3] = &unk_1E47853B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(unsavedChangesQueue, block);

}

uint64_t __56__EKEventStore__clearPendingChangesForObjectsWithOwner___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "minusSet:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "minusSet:", *(_QWORD *)(a1 + 40));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "removeObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "minusSet:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_commitObjectsWithIdentifiers:(id)a3 error:(id *)a4
{
  NSObject *unsavedChangesQueue;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  EKiMIPCancel *v23;
  void *v24;
  EKiMIPCancel *v25;
  char isKindOfClass;
  void (**v27)(_QWORD, _QWORD);
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  _BOOL4 v37;
  id v38;
  EKiMIPCancel *v39;
  id v40;
  EKiMIPCancel *v41;
  NSObject *dbChangedQueue;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  BOOL v51;
  NSObject *v53;
  NSObject *v54;
  id v55;
  id *v56;
  id v57;
  uint64_t v58;
  id obj;
  id obja;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[5];
  id v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t *v74;
  _QWORD *v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD *v79;
  _BYTE *v80;
  uint64_t *v81;
  _QWORD v82[3];
  char v83;
  _QWORD v84[5];
  id v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[5];
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[6];
  _QWORD v106[4];
  id v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[5];
  id v114;
  _QWORD *v115;
  uint8_t *v116;
  _QWORD block[5];
  id v118;
  _QWORD *v119;
  uint64_t *v120;
  uint64_t *v121;
  uint64_t *v122;
  _QWORD v123[5];
  id v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t, uint64_t);
  void (*v129)(uint64_t);
  id v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t (*v134)(uint64_t, uint64_t);
  void (*v135)(uint64_t);
  id v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t);
  id v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  char v146;
  _BYTE v147[128];
  uint8_t v148[128];
  _BYTE v149[24];
  uint64_t (*v150)(uint64_t, uint64_t);
  void (*v151)(uint64_t);
  id v152;
  _BYTE v153[128];
  _BYTE v154[128];
  uint8_t v155[128];
  uint8_t buf[8];
  uint8_t *v157;
  uint64_t v158;
  uint64_t (*v159)(uint64_t, uint64_t);
  void (*v160)(uint64_t);
  id v161;
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    -[EKEventStore _commitObjectsWithIdentifiers:error:].cold.2();
  if (a4)
    *a4 = 0;
  v143 = 0;
  v144 = &v143;
  v145 = 0x2020000000;
  v146 = 0;
  if (-[EKEventStore canModifyCalendarDatabase](self, "canModifyCalendarDatabase"))
  {
    v137 = 0;
    v138 = &v137;
    v139 = 0x3032000000;
    v140 = __Block_byref_object_copy__23;
    v141 = __Block_byref_object_dispose__23;
    v142 = 0;
    v131 = 0;
    v132 = &v131;
    v133 = 0x3032000000;
    v134 = __Block_byref_object_copy__23;
    v135 = __Block_byref_object_dispose__23;
    v136 = 0;
    v125 = 0;
    v126 = &v125;
    v127 = 0x3032000000;
    v128 = __Block_byref_object_copy__23;
    v129 = __Block_byref_object_dispose__23;
    v130 = 0;
    v123[0] = 0;
    v123[1] = v123;
    v123[2] = 0x3032000000;
    v123[3] = __Block_byref_object_copy__23;
    v123[4] = __Block_byref_object_dispose__23;
    v124 = 0;
    unsavedChangesQueue = self->_unsavedChangesQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke;
    block[3] = &unk_1E4788BF8;
    v119 = v123;
    block[4] = self;
    v120 = &v137;
    v55 = v57;
    v118 = v55;
    v121 = &v131;
    v122 = &v125;
    dispatch_sync(unsavedChangesQueue, block);
    if (objc_msgSend((id)v138[5], "count") || objc_msgSend((id)v132[5], "count") || objc_msgSend((id)v126[5], "count"))
    {
      v56 = a4;
      v7 = (id)EKLogHandle;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = objc_msgSend((id)v138[5], "count");
        v9 = objc_msgSend((id)v132[5], "count");
        v10 = objc_msgSend((id)v126[5], "count");
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = v8;
        LOWORD(v157) = 1024;
        *(_DWORD *)((char *)&v157 + 2) = v9;
        HIWORD(v157) = 1024;
        LODWORD(v158) = v10;
        _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_INFO, "Committing with %d insertions, %d updates, %d deletions", buf, 0x14u);
      }

      *(_QWORD *)buf = 0;
      v157 = buf;
      v158 = 0x3032000000;
      v159 = __Block_byref_object_copy__23;
      v160 = __Block_byref_object_dispose__23;
      v161 = (id)objc_opt_new();
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      obj = (id)v126[5];
      v11 = 0;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v155, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v110;
        v58 = 136315394;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v110 != v13)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * v14);
            v16 = (void *)objc_opt_class();
            v108 = 0;
            v17 = objc_msgSend(v16, "_isConfirmedSuggestedEvent:uniqueKey:", v15, &v108);
            v18 = v108;
            if (v17)
            {
              v19 = EKLogHandle;
              if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v149 = 136315394;
                *(_QWORD *)&v149[4] = "-[EKEventStore _commitObjectsWithIdentifiers:error:]";
                *(_WORD *)&v149[12] = 2112;
                *(_QWORD *)&v149[14] = v15;
                _os_log_debug_impl(&dword_1A2318000, v19, OS_LOG_TYPE_DEBUG, "%s - Notifying suggestions we have deleted previously confirmed event %@", v149, 0x16u);
              }
              -[objc_class serviceForEvents](-[EKEventStore _SGSuggestionsServiceClass](self, "_SGSuggestionsServiceClass"), "serviceForEvents");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v106[0] = MEMORY[0x1E0C809B0];
              v106[1] = 3221225472;
              v106[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_379;
              v106[3] = &unk_1E47889F0;
              v21 = v20;
              v107 = v21;
              objc_msgSend(v21, "eventFromUniqueId:withCompletion:", v18, v106);

            }
            objc_msgSend((id)objc_opt_class(), "_iMIPScheduledEvent:", v15);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22
              && +[EKiMIPCancel shouldSendEmailForEvent:removedAttendees:](EKiMIPCancel, "shouldSendEmailForEvent:removedAttendees:", v22, 0))
            {
              v23 = [EKiMIPCancel alloc];
              objc_msgSend(v22, "attendees");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = -[EKiMIPCancel initWithEvent:andAttendees:](v23, "initWithEvent:andAttendees:", v22, v24);

              objc_msgSend(*((id *)v157 + 5), "addObject:", v25);
            }
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            v11 |= isKindOfClass;
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v155, 16);
        }
        while (v12);
      }

      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_382;
      v105[3] = &unk_1E4788C40;
      v105[4] = self;
      v105[5] = buf;
      v27 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v105);
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v28 = (id)v138[5];
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v101, v154, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v102 != v30)
              objc_enumerationMutation(v28);
            v27[2](v27, *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i));
          }
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v101, v154, 16);
        }
        while (v29);
      }

      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      obja = (id)v132[5];
      v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v97, v153, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v98;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v98 != v33)
              objc_enumerationMutation(obja);
            v35 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * j);
            if ((v11 & 1) != 0)
            {
              objc_msgSend((id)objc_opt_class(), "_iMIPScheduledEvent:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = 0;
              v37 = +[EKiMIPCancel shouldSendEmailForEvent:removedAttendees:](EKiMIPCancel, "shouldSendEmailForEvent:removedAttendees:", v36, &v96);
              v38 = v96;
              if (v37)
              {
                v39 = [EKiMIPCancel alloc];
                v40 = v38;
                if (!v38)
                {
                  objc_msgSend(v36, "attendees");
                  v58 = objc_claimAutoreleasedReturnValue();
                  v40 = (id)v58;
                }
                v41 = -[EKiMIPCancel initWithEvent:andAttendees:](v39, "initWithEvent:andAttendees:", v36, v40);
                if (!v38)

                objc_msgSend(*((id *)v157 + 5), "addObject:", v41);
              }

            }
            v27[2](v27, v35);
          }
          v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v97, v153, 16);
        }
        while (v32);
      }

      *(_QWORD *)v149 = 0;
      *(_QWORD *)&v149[8] = v149;
      *(_QWORD *)&v149[16] = 0x3032000000;
      v150 = __Block_byref_object_copy__23;
      v151 = __Block_byref_object_dispose__23;
      v152 = 0;
      v90 = 0;
      v91 = &v90;
      v92 = 0x3032000000;
      v93 = __Block_byref_object_copy__23;
      v94 = __Block_byref_object_dispose__23;
      v95 = 0;
      v88[0] = 0;
      v88[1] = v88;
      v88[2] = 0x3032000000;
      v88[3] = __Block_byref_object_copy__23;
      v88[4] = __Block_byref_object_dispose__23;
      v89 = 0;
      v86[0] = 0;
      v86[1] = v86;
      v86[2] = 0x3032000000;
      v86[3] = __Block_byref_object_copy__23;
      v86[4] = __Block_byref_object_dispose__23;
      v87 = 0;
      v84[0] = 0;
      v84[1] = v84;
      v84[2] = 0x3032000000;
      v84[3] = __Block_byref_object_copy__23;
      v84[4] = __Block_byref_object_dispose__23;
      v85 = 0;
      v82[0] = 0;
      v82[1] = v82;
      v82[2] = 0x2020000000;
      v83 = 0;
      dbChangedQueue = self->_dbChangedQueue;
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2_387;
      v69[3] = &unk_1E4788CE0;
      v69[4] = self;
      v71 = &v137;
      v72 = &v131;
      v73 = &v125;
      v74 = &v90;
      v75 = v86;
      v76 = v84;
      v77 = v88;
      v78 = v82;
      v70 = v55;
      v79 = v123;
      v80 = v149;
      v81 = &v143;
      dispatch_sync(dbChangedQueue, v69);
      if (v56)
        *v56 = objc_retainAutorelease((id)v91[5]);
      if (*((_BYTE *)v144 + 24))
      {
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v43 = *((id *)v157 + 5);
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v148, 16);
        if (v44)
        {
          v45 = *(_QWORD *)v66;
          do
          {
            for (k = 0; k != v44; ++k)
            {
              if (*(_QWORD *)v66 != v45)
                objc_enumerationMutation(v43);
              objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * k), "sendEmail");
            }
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v148, 16);
          }
          while (v44);
        }

        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v47 = *(id *)(*(_QWORD *)&v149[8] + 40);
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v61, v147, 16);
        if (v48)
        {
          v49 = *(_QWORD *)v62;
          do
          {
            for (m = 0; m != v48; ++m)
            {
              if (*(_QWORD *)v62 != v49)
                objc_enumerationMutation(v47);
              +[EKMapsUtilities geocodeEventIfNeeded:](EKMapsUtilities, "geocodeEventIfNeeded:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * m));
            }
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v61, v147, 16);
          }
          while (v48);
        }

        v51 = *((_BYTE *)v144 + 24) != 0;
      }
      else
      {
        v51 = 0;
      }

      _Block_object_dispose(v82, 8);
      _Block_object_dispose(v84, 8);

      _Block_object_dispose(v86, 8);
      _Block_object_dispose(v88, 8);

      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(v149, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v53 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2318000, v53, OS_LOG_TYPE_INFO, "Nothing to commit. Bailing early.", buf, 2u);
      }
      *(_QWORD *)buf = 0;
      v157 = buf;
      v158 = 0x3032000000;
      v159 = __Block_byref_object_copy__23;
      v160 = __Block_byref_object_dispose__23;
      v161 = 0;
      v54 = self->_unsavedChangesQueue;
      v113[0] = MEMORY[0x1E0C809B0];
      v113[1] = 3221225472;
      v113[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_378;
      v113[3] = &unk_1E47874D0;
      v113[4] = self;
      v114 = v55;
      v115 = v123;
      v116 = buf;
      dispatch_sync(v54, v113);
      if (objc_msgSend(*((id *)v157 + 5), "count"))
        -[EKEventStore _postEventStoreChangedNotificationWithChangeType:changedObjectIDs:forceImmediate:](self, "_postEventStoreChangedNotificationWithChangeType:changedObjectIDs:forceImmediate:", 1, *((_QWORD *)v157 + 5), 1);

      _Block_object_dispose(buf, 8);
      v51 = 1;
    }

    _Block_object_dispose(v123, 8);
    _Block_object_dispose(&v125, 8);

    _Block_object_dispose(&v131, 8);
    _Block_object_dispose(&v137, 8);

  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 30);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKEventStore _commitObjectsWithIdentifiers:error:].cold.1();
    v51 = 0;
  }
  _Block_object_dispose(&v143, 8);

  return v51;
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 328));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count"))
  {
    +[EKPersistentObject allObjectsWithChangesRelatedToObjects:](EKPersistentObject, "allObjectsWithChangesRelatedToObjects:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  v5 = (void *)objc_opt_class();
  v6 = a1[5];
  objc_msgSend(*(id *)(a1[4] + 304), "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_filteredObjectsWithIdentifiers:fromObjects:excludingObjects:", v6, v7, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = (void *)objc_opt_class();
  v12 = a1[5];
  objc_msgSend(*(id *)(a1[4] + 320), "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_filteredObjectsWithIdentifiers:fromObjects:excludingObjects:", v12, v13, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1[8] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  v17 = (void *)objc_opt_class();
  v18 = a1[5];
  objc_msgSend(*(id *)(a1[4] + 312), "allObjects");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_filteredObjectsWithIdentifiers:fromObjects:excludingObjects:", v18, v22, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(a1[9] + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_378(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_markObjectsWithIdentifiersAsCommitted:excludingObjects:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("objectID"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_clearEventsNeedingGeocodingWithCommittedObjects:", v5);
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_379(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "recordId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!a3 && v5)
  {
    v7 = (void *)v5;
    objc_msgSend(*(id *)(a1 + 32), "deleteEventByRecordId:withCompletion:", v5, &__block_literal_global_380);
    v6 = v7;
  }

}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2_cold_1();

}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_382(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  EKiMIPInvitation *v6;
  __objc2_class *v7;
  EKiMIPInvitation *v8;
  id v9;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_iMIPScheduledEvent:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v9;
  if (v9)
  {
    objc_msgSend(v9, "diffFromCommitted");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[EKiMIPInvitation shouldSendEmailForEvent:withDiff:](EKiMIPInvitation, "shouldSendEmailForEvent:withDiff:", v9, v5))
    {
      v6 = -[EKiMIPInvitation initWithEvent:withDiff:]([EKiMIPInvitation alloc], "initWithEvent:withDiff:", v9, v5);
    }
    else
    {
      if (+[EKiMIPUpdate shouldSendEmailForEvent:withDiff:](EKiMIPUpdate, "shouldSendEmailForEvent:withDiff:", v9, v5))
      {
        v7 = EKiMIPUpdate;
      }
      else
      {
        if (!+[EKiMIPReply shouldSendEmailForEvent:withDiff:](EKiMIPReply, "shouldSendEmailForEvent:withDiff:", v9, v5))
        {
LABEL_10:

          v4 = v9;
          goto LABEL_11;
        }
        v7 = EKiMIPReply;
      }
      v6 = (EKiMIPInvitation *)objc_msgSend([v7 alloc], "initWithEvent:", v9);
    }
    v8 = v6;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);

    goto LABEL_10;
  }
LABEL_11:

}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2_387(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  __int128 v4;
  __int128 v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 376);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_3;
  block[3] = &unk_1E4788CB8;
  v4 = *(_OWORD *)(a1 + 56);
  block[4] = v2;
  v5 = *(_OWORD *)(a1 + 72);
  v10 = v4;
  v11 = v5;
  v12 = *(_OWORD *)(a1 + 88);
  v7 = *(_OWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 104);
  v6 = (id)v7;
  v9 = v7;
  v14 = *(_OWORD *)(a1 + 112);
  v15 = *(_QWORD *)(a1 + 128);
  dispatch_sync(v3, block);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24)
    && (objc_msgSend(*(id *)(a1 + 32), "ignoreExternalChanges") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_processExternalChangesWithLatestTimestamp:changedObjectIDsData:deletedObjectIDOffsets:changesWereSyncStatusOnly:forceImmediateNotification:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), 1);
  }

}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  _QWORD v68[6];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[5];
  char v74;
  char v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD block[6];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(_QWORD *, uint64_t, void *, void *, void *, void *, char);
  void *v92;
  id v93;
  id v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t *v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  char v110;
  _QWORD v111[3];
  int v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "unionSet:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  if (objc_msgSend(v66, "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v3 = v66;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v114;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v114 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
          objc_msgSend(v7, "dirtyPropertiesAndValues");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            objc_msgSend(v7, "CADObjectID");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, v9);

          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
      }
      while (v4);
    }

  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "valueForKey:", CFSTR("CADObjectID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v111[0] = 0;
  v111[1] = v111;
  v111[2] = 0x2020000000;
  v112 = 0;
  v107 = 0;
  v108 = &v107;
  v109 = 0x2020000000;
  v110 = 0;
  v101 = 0;
  v102 = &v101;
  v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__23;
  v105 = __Block_byref_object_dispose__23;
  v106 = 0;
  if ((objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E70901FFFFFFFFLL) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "eventAccessLevel");
  objc_msgSend(*(id *)(a1 + 32), "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CADOperationProxySync");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = MEMORY[0x1E0C809B0];
  v90 = 3221225472;
  v91 = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_4;
  v92 = &unk_1E4788C68;
  v14 = *(_QWORD *)(a1 + 72);
  v95 = v111;
  v96 = v14;
  v93 = v11;
  v94 = v2;
  v97 = &v107;
  v98 = &v101;
  v15 = *(_OWORD *)(a1 + 96);
  v99 = *(_OWORD *)(a1 + 80);
  v100 = v15;
  v64 = v94;
  v65 = v93;
  objc_msgSend(v13, "CADDatabaseCommitDeletes:updatesAndInserts:options:andFetchChangesSinceTimestamp:withReply:", v93);

  if (*((_BYTE *)v108 + 24))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "shouldRecordObjectIDMap"))
    {
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v16 = (id)v102[5];
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v85, v120, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v86;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v86 != v18)
              objc_enumerationMutation(v16);
            v20 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j);
            objc_msgSend((id)v102[5], "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "objectForKeyedSubscript:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
            if (v24)
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, v24);
            else
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, v22);

          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v85, v120, 16);
        }
        while (v17);
      }

    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
    {
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v26 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v81, v119, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v82;
        do
        {
          for (k = 0; k != v27; ++k)
          {
            if (*(_QWORD *)v82 != v28)
              objc_enumerationMutation(v26);
            v30 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * k);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "removeObject:", v30);
            v31 = (void *)v102[5];
            objc_msgSend(v30, "CADObjectID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKey:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "database");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "_setObjectID:inDatabaseRestoreGeneration:", v34, objc_msgSend(v35, "databaseRestoreGeneration"));

              objc_msgSend(*(id *)(a1 + 32), "_registerObject:", v30);
            }
            objc_msgSend(v30, "_setPendingInsert:", 0);
            objc_msgSend(v30, "didCommit");
            v36 = *(_QWORD *)(a1 + 32);
            v37 = *(NSObject **)(v36 + 360);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_389;
            block[3] = &unk_1E47853B0;
            block[4] = v36;
            block[5] = v30;
            dispatch_sync(v37, block);

          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v81, v119, 16);
        }
        while (v27);
      }

    }
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v38 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v39 = 0;
    v40 = 0;
    v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v76, v118, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v77;
      do
      {
        for (m = 0; m != v41; ++m)
        {
          if (*(_QWORD *)v77 != v42)
            objc_enumerationMutation(v38);
          v44 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * m);
          objc_msgSend(v44, "_setPendingUpdate:", 0);
          objc_msgSend(v44, "didCommit");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = 1;
          }
          else
          {
            objc_opt_class();
            v40 |= objc_opt_isKindOfClass();
          }
        }
        v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v76, v118, 16);
      }
      while (v41);
    }

    v45 = MEMORY[0x1E0C809B0];
    if (((v39 | v40) & 1) != 0)
    {
      v46 = *(_QWORD *)(a1 + 32);
      v47 = *(NSObject **)(v46 + 360);
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2_390;
      v73[3] = &unk_1E4788C90;
      v74 = v39 & 1;
      v73[4] = v46;
      v75 = v40 & 1;
      dispatch_sync(v47, v73);
    }
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v48 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v69, v117, 16);
    if (v49)
    {
      v50 = *(_QWORD *)v70;
      do
      {
        for (n = 0; n != v49; ++n)
        {
          if (*(_QWORD *)v70 != v50)
            objc_enumerationMutation(v48);
          v52 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * n);
          objc_msgSend(v52, "_setPendingDelete:", 0);
          objc_msgSend(*(id *)(a1 + 32), "_unregisterObject:", v52);
          v53 = *(_QWORD *)(a1 + 32);
          v54 = *(NSObject **)(v53 + 360);
          v68[0] = v45;
          v68[1] = 3221225472;
          v68[2] = __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_3_391;
          v68[3] = &unk_1E47853B0;
          v68[4] = v52;
          v68[5] = v53;
          dispatch_sync(v54, v68);
        }
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v69, v117, 16);
      }
      while (v49);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "minusSet:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "minusSet:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v55 = *(id *)(a1 + 40);
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "valueForKey:", CFSTR("objectID"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setByAddingObjectsFromSet:", v56);
      v57 = objc_claimAutoreleasedReturnValue();

      v55 = (id)v57;
    }
    objc_msgSend(*(id *)(a1 + 32), "_markObjectsWithIdentifiersAsCommitted:excludingObjects:", v55, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = *(void **)(a1 + 32);
    v67 = 0;
    objc_msgSend(v59, "_fetchAndClearEventsNeedingGeocoding:withCommittedObjects:", &v67, v58);
    v60 = v67;
    v61 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
    v62 = *(void **)(v61 + 40);
    *(_QWORD *)(v61 + 40) = v60;
    v63 = v60;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = 1;
  }

  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v107, 8);
  _Block_object_dispose(v111, 8);

}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_4(_QWORD *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, char a7)
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  id v21;

  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1[7] + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_4_cold_2();
    if ((_DWORD)a2 == 1010 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_4_cold_1();
    v20 = 0;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[9] + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(a1[10] + 8) + 40), a4);
    objc_storeStrong((id *)(*(_QWORD *)(a1[11] + 8) + 40), a5);
    objc_storeStrong((id *)(*(_QWORD *)(a1[12] + 8) + 40), a6);
    *(_BYTE *)(*(_QWORD *)(a1[13] + 8) + 24) = a7;
    v20 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v20;

}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_389(uint64_t a1)
{
  _QWORD *v2;
  char isKindOfClass;
  void *v4;
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[7])
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v2 = *(_QWORD **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "CADObjectID");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_cacheCalendarWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:", v5, 0, 0);
LABEL_7:

      return;
    }
  }
  if (v2[8])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "CADObjectID");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_cacheSourceWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:", v5, 0, 0);
      goto LABEL_7;
    }
  }
}

uint64_t __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2_390(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 40))
    result = objc_msgSend(*(id *)(result + 32), "_clearCachedCalendars");
  if (*(_BYTE *)(v1 + 41))
    return objc_msgSend(*(id *)(v1 + 32), "_clearCachedSources");
  return result;
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_3_391(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "CADObjectID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_removeCachedCalendarWithCADID:");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 40), "_removeCachedCalendarFromSource:", *(_QWORD *)(a1 + 32));
    v3 = *(void **)(a1 + 32);
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
    objc_msgSend(v3, "CADObjectID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:");
  }

}

- (id)_markObjectsWithIdentifiersAsCommitted:(id)a3 excludingObjects:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_unsavedChangesQueue);
  objc_msgSend((id)objc_opt_class(), "_filteredArrayWithIdentifiers:fromObjects:excludingObjects:", v6, self->_objectsPendingCommit, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "markAsCommitted");
        -[NSMutableArray removeObject:](self->_objectsPendingCommit, "removeObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v8;
}

- (void)_clearEventsNeedingGeocodingWithCommittedObjects:(id)a3
{
  -[EKEventStore _fetchAndClearEventsNeedingGeocoding:withCommittedObjects:](self, "_fetchAndClearEventsNeedingGeocoding:withCommittedObjects:", 0, a3);
}

- (void)_fetchAndClearEventsNeedingGeocoding:(id *)a3 withCommittedObjects:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_unsavedChangesQueue);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          if (-[NSHashTable containsObject:](self->_eventsNeedsGeocoding, "containsObject:", v13, (_QWORD)v15))
          {
            -[NSHashTable removeObject:](self->_eventsNeedsGeocoding, "removeObject:", v13);
            if (a3)
            {
              v14 = *a3;
              if (!*a3)
              {
                v14 = (id)objc_opt_new();
                *a3 = v14;
              }
              objc_msgSend(v14, "addObject:", v13);
            }
          }

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)ensureLoadedProperties:(id)a3 forObjects:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  EKEventStore *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v6 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v19 = self;
    v9 = 0;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v13 = v20;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v13);
              if (objc_msgSend(v12, "isPropertyUnavailable:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j)))
              {
                if (!v9)
                {
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
                  else
                    v18 = objc_opt_new();
                  v9 = (void *)v18;
                }
                objc_msgSend(v9, "addObject:", v12);
                goto LABEL_21;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v15)
              continue;
            break;
          }
        }
LABEL_21:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
    if (v9)
    {
      -[EKEventStore _fetchProperties:forObjects:](v19, "_fetchProperties:forObjects:", v13, v9);

    }
  }

}

- (void)_fetchProperties:(id)a3 forObjects:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  EKEventStore *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  if (objc_msgSend(v21, "count"))
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__23;
    v31 = __Block_byref_object_dispose__23;
    v32 = 0;
    v19 = self;
    -[EKDaemonConnection CADOperationProxySync](self->_database, "CADOperationProxySync");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "valueForKey:", CFSTR("CADObjectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __44__EKEventStore__fetchProperties_forObjects___block_invoke;
    v26[3] = &unk_1E4788490;
    v26[4] = &v27;
    objc_msgSend(v6, "CADObjects:getPropertiesWithNames:reply:", v7, v20, v26);

    v8 = objc_msgSend((id)v28[5], "count");
    if (v8 != objc_msgSend(v21, "count") && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore _fetchProperties:forObjects:].cold.1();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = (id)v28[5];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    if (v10)
    {
      v11 = 0;
      v12 = *(_QWORD *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            objc_msgSend(v21, "objectAtIndexedSubscript:", v11 + v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "frozenObjectInStore:", v19);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "loadedValues");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "takeValuesForDefaultPropertyKeys:values:", v20, v18);

          }
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
        v11 += v13;
      }
      while (v10);
    }

    _Block_object_dispose(&v27, 8);
  }

}

void __44__EKEventStore__fetchProperties_forObjects___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  if ((_DWORD)a2)
  {
    v6 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke_2_cold_1(a2, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v5;

}

- (BOOL)isPendingIntegrationEvent:(id)a3
{
  NSMutableDictionary *pendingIntegrationEvents;
  void *v4;
  void *v5;

  pendingIntegrationEvents = self->_pendingIntegrationEvents;
  objc_msgSend(a3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](pendingIntegrationEvents, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(pendingIntegrationEvents) = v5 != 0;

  return (char)pendingIntegrationEvents;
}

- (void)addPendingIntegrationEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *dbChangedQueue;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)EKLogHandle;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKEventStore addPendingIntegrationEvent:].cold.2(v6);
    dbChangedQueue = self->_dbChangedQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__EKEventStore_addPendingIntegrationEvent___block_invoke;
    block[3] = &unk_1E4785400;
    block[4] = self;
    v9 = v5;
    v10 = v4;
    dispatch_sync(dbChangedQueue, block);

  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore addPendingIntegrationEvent:].cold.1();
  }

}

void __43__EKEventStore_addPendingIntegrationEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));
    v6 = (uint64_t)v7;
  }
  v8 = (id)v6;
  objc_msgSend(*(id *)(a1 + 32), "_addPendingIntegrationEvent:toArrayOfHashTables:", *(_QWORD *)(a1 + 48), v6);

}

- (void)_addPendingIntegrationEvent:(id)a3 toArrayOfHashTables:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v8)
  {

LABEL_15:
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    objc_msgSend(v7, "addObject:", v10);
    goto LABEL_16;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v22 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      objc_msgSend(v13, "anyObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v5)
      {
        objc_msgSend(v14, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v20);

        if (v17)
        {
          v19 = v13;

          v10 = v19;
          goto LABEL_12;
        }
      }
      else
      {
        v18 = v13;

        v10 = v18;
      }

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v9);
LABEL_12:

  if (!v10)
    goto LABEL_15;
LABEL_16:
  objc_msgSend(v10, "addObject:", v5);

}

- (void)pendingIntegrationEventChangedIdentifierFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *dbChangedQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_1A2318000, v8, OS_LOG_TYPE_INFO, "Updating pending integration event ID from %{public}@ to %{public}@", buf, 0x16u);
  }
  dbChangedQueue = self->_dbChangedQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__EKEventStore_pendingIntegrationEventChangedIdentifierFrom_to___block_invoke;
  block[3] = &unk_1E4785400;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(dbChangedQueue, block);

}

void __64__EKEventStore_pendingIntegrationEventChangedIdentifierFrom_to___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v2 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v3;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v20 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(a1 + 32), "_addPendingIntegrationEvent:toArrayOfHashTables:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), v2);
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v14);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }

    v4 = v18;
  }
  if (v2)
  {
    v17 = v2;

    v4 = v17;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 48));

}

- (void)removePendingIntegrationEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *dbChangedQueue;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  EKEventStore *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_msgSend(v4, "privacySafeIntegrationEventDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v7;
    _os_log_impl(&dword_1A2318000, v6, OS_LOG_TYPE_INFO, "Removing pending integration event: %{public}@", buf, 0xCu);

  }
  dbChangedQueue = self->_dbChangedQueue;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __46__EKEventStore_removePendingIntegrationEvent___block_invoke;
  v13 = &unk_1E47853B0;
  v14 = v4;
  v15 = self;
  v9 = v4;
  dispatch_sync(dbChangedQueue, &v10);
  objc_msgSend(v9, "reset", v10, v11, v12, v13);

}

void __46__EKEventStore_removePendingIntegrationEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "removeObject:", *(_QWORD *)(a1 + 32), (_QWORD)v14);
        objc_msgSend(v11, "anyObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          objc_msgSend(v4, "addIndex:", v8 + i);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 += i;
    }
    while (v7);
  }

  v13 = objc_msgSend(v4, "count");
  if (v13 == objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setObject:forKeyedSubscript:", 0, v2);
  }
  else if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "removeObjectsAtIndexes:", v4);
  }

}

- (id)reminderIntegrationCalendar
{
  id v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[EKEventStore sources](self, "sources");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "sourceType", (_QWORD)v9) == 6)
        {
          objc_msgSend(v6, "allCalendars");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "anyObject");
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)showsIntegrations
{
  return (BYTE1(self->_options) >> 5) & 1;
}

- (void)requestIntegrationCatchupSync
{
  id v2;

  -[EKDaemonConnection CADOperationProxy](self->_database, "CADOperationProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADCatchUpIntegrationSyncingIfBehind:", &__block_literal_global_395);

}

void __45__EKEventStore_requestIntegrationCatchupSync__block_invoke(uint64_t a1, int a2)
{
  void *v2;

  if (a2)
  {
    v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __45__EKEventStore_requestIntegrationCatchupSync__block_invoke_cold_1(v2);
  }
}

- (void)loadEventIDs:(id *)a3 uniqueIDs:(id *)a4 calendar:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__23;
  v22 = __Block_byref_object_dispose__23;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__23;
  v16 = __Block_byref_object_dispose__23;
  v17 = 0;
  -[EKDaemonConnection CADOperationProxySync](self->_database, "CADOperationProxySync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADObjectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__EKEventStore_loadEventIDs_uniqueIDs_calendar___block_invoke;
  v11[3] = &unk_1E4788420;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend(v9, "CADDatabaseLoadEventsInCalendar:reply:", v10, v11);

  if (a3)
  {
    +[EKObjectID EKObjectIDsFromCADObjectIDs:](EKObjectID, "EKObjectIDsFromCADObjectIDs:", v19[5]);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v13[5]);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
}

void __48__EKEventStore_loadEventIDs_uniqueIDs_calendar___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __45__EKEventStore_requestIntegrationCatchupSync__block_invoke_cold_1(v9);
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v12 = v7;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v8;

}

- (id)redactedMimicSaveEvent:(id)a3 oldToNewObjectIDMap:(id)a4 serializedDictionary:(id)a5 objectIDToChangeSetDictionaryMap:(id)a6 objectIDToPersistentDictionaryMap:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *unsavedChangesQueue;
  uint64_t v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v36;
  _TtC8EventKit26EKRemoteUIObjectSerializer *v37;
  void *v38;
  EKEventStore *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD block[5];
  id v47;
  _BYTE *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE buf[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v43 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v40 = v12;
  if (!v12)
  {
    +[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", self);
    v40 = (id)objc_claimAutoreleasedReturnValue();
  }
  v36 = v15;
  v37 = objc_alloc_init(_TtC8EventKit26EKRemoteUIObjectSerializer);
  v39 = self;
  -[EKRemoteUIObjectSerializer deserializedRepresentationWithSerializedDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:eventStore:occurrenceDate:](v37, "deserializedRepresentationWithSerializedDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:eventStore:occurrenceDate:", v13, v14, v15, self, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "deserializedObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "tempObjectIDMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore _resetAndApplyChangesForRedactedMimicCommitOnObject:usingModifiedObject:](self, "_resetAndApplyChangesForRedactedMimicCommitOnObject:usingModifiedObject:", v40, v38);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v50;
    v20 = v13;
    v21 = v14;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v50 != v19)
          objc_enumerationMutation(v17);
        v23 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v25, v24);
        }
        else
        {
          v26 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v23;
            _os_log_error_impl(&dword_1A2318000, v26, OS_LOG_TYPE_ERROR, "redactedMimicSaveEvent: could not find corresponding remoteUI user committed permanent objectID for hostTempID[%{public}@]. initialTempID[%{public}@]", buf, 0x16u);
          }
        }

        v13 = v20;
        v14 = v21;

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v18);
  }

  v27 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v17, "allValues");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v54 = __Block_byref_object_copy__23;
  v55 = __Block_byref_object_dispose__23;
  v56 = 0;
  unsavedChangesQueue = v39->_unsavedChangesQueue;
  v31 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __147__EKEventStore_redactedMimicSaveEvent_oldToNewObjectIDMap_serializedDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap___block_invoke;
  block[3] = &unk_1E4785298;
  v48 = buf;
  block[4] = v39;
  v32 = v29;
  v47 = v32;
  dispatch_sync(unsavedChangesQueue, block);
  -[EKEventStore _mimicCommitWithOldToNewObjectIDMap:insertedObjectsToCommit:updatedObjectsToCommit:deletedObjectsToCommit:](v39, "_mimicCommitWithOldToNewObjectIDMap:insertedObjectsToCommit:updatedObjectsToCommit:deletedObjectsToCommit:", v42, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 0, 0);
  v33 = v39->_unsavedChangesQueue;
  v44[0] = v31;
  v44[1] = 3221225472;
  v44[2] = __147__EKEventStore_redactedMimicSaveEvent_oldToNewObjectIDMap_serializedDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap___block_invoke_2;
  v44[3] = &unk_1E47853B0;
  v44[4] = v39;
  v45 = v32;
  v34 = v32;
  dispatch_sync(v33, v44);

  _Block_object_dispose(buf, 8);
  return v40;
}

void __147__EKEventStore_redactedMimicSaveEvent_oldToNewObjectIDMap_serializedDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)objc_opt_class();
  v3 = a1[5];
  objc_msgSend(*(id *)(a1[4] + 304), "allObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_filteredObjectsWithIdentifiers:fromObjects:excludingObjects:", v3, v7, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __147__EKEventStore_redactedMimicSaveEvent_oldToNewObjectIDMap_serializedDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_markObjectsWithIdentifiersAsCommitted:excludingObjects:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_resetAndApplyChangesForRedactedMimicCommitOnObject:(id)a3 usingModifiedObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t j;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  id obj;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "setChangeSet:", 0);
  objc_msgSend(v6, "backingObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackingObject:", v7);

  objc_msgSend(v5, "_resetAfterUpdatingChangeSetOrBackingObjectWithForce:", 1);
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v60 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v5, "cachedMeltedObjectForSingleValueKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cachedMeltedObjectForSingleValueKey:", v13);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
          v17 = v15 == 0;
        else
          v17 = 1;
        if (!v17 && (objc_msgSend((id)objc_opt_class(), "isWeakRelationObject:forKey:", v14, v13) & 1) == 0)
          -[EKEventStore _resetAndApplyChangesForRedactedMimicCommitOnObject:usingModifiedObject:](self, "_resetAndApplyChangesForRedactedMimicCommitOnObject:usingModifiedObject:", v14, v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v10);
  }
  v34 = v8;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (v39)
  {
    v36 = *(_QWORD *)v56;
    v37 = v6;
    v38 = v5;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v56 != v36)
          objc_enumerationMutation(obj);
        v40 = v18;
        v19 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v18);
        objc_msgSend(v5, "cachedMeltedObjectsForMultiValueKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cachedMeltedObjectsForMultiValueKey:", v19);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v42 = v20;
        v46 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
        if (v46)
        {
          v43 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v46; ++j)
            {
              if (*(_QWORD *)v52 != v43)
                objc_enumerationMutation(v42);
              v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
              objc_msgSend(v22, "objectID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = 0u;
              v48 = 0u;
              v49 = 0u;
              v50 = 0u;
              v24 = v44;
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
              if (!v25)
              {
                v27 = v24;
                goto LABEL_36;
              }
              v26 = v25;
              v45 = v22;
              v27 = 0;
              v28 = *(_QWORD *)v48;
              do
              {
                for (k = 0; k != v26; ++k)
                {
                  if (*(_QWORD *)v48 != v28)
                    objc_enumerationMutation(v24);
                  v30 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
                  objc_msgSend(v30, "objectID");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "isEqual:", v23);

                  if (v32)
                  {
                    v33 = v30;

                    v27 = v33;
                  }
                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
              }
              while (v26);

              if (v27)
              {
                -[EKEventStore _resetAndApplyChangesForRedactedMimicCommitOnObject:usingModifiedObject:](self, "_resetAndApplyChangesForRedactedMimicCommitOnObject:usingModifiedObject:", v45, v27);
LABEL_36:

              }
            }
            v46 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
          }
          while (v46);
        }

        v18 = v40 + 1;
        v6 = v37;
        v5 = v38;
      }
      while (v40 + 1 != v39);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    }
    while (v39);
  }

}

- (id)mimicSaveAndCommitEvent:(id)a3 oldToNewObjectIDMap:(id)a4 insertedObjectIDs:(id)a5 updatedObjectIDs:(id)a6 deletedObjectIDs:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *unsavedChangesQueue;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  _QWORD v27[5];
  id v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12)
  {
    +[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", self);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[EKEventStore _resetForMimicCommitOnObject:oldToNewObjectIDMap:](self, "_resetForMimicCommitOnObject:oldToNewObjectIDMap:", v12, v13);
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__23;
  v52 = __Block_byref_object_dispose__23;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__23;
  v46 = __Block_byref_object_dispose__23;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__23;
  v40 = __Block_byref_object_dispose__23;
  v41 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v18 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__EKEventStore_mimicSaveAndCommitEvent_oldToNewObjectIDMap_insertedObjectIDs_updatedObjectIDs_deletedObjectIDs___block_invoke;
  block[3] = &unk_1E4788D28;
  v33 = &v48;
  block[4] = self;
  v19 = v14;
  v30 = v19;
  v34 = &v42;
  v20 = v15;
  v31 = v20;
  v35 = &v36;
  v21 = v16;
  v32 = v21;
  dispatch_sync(unsavedChangesQueue, block);
  -[EKEventStore _mimicCommitWithOldToNewObjectIDMap:insertedObjectsToCommit:updatedObjectsToCommit:deletedObjectsToCommit:](self, "_mimicCommitWithOldToNewObjectIDMap:insertedObjectsToCommit:updatedObjectsToCommit:deletedObjectsToCommit:", v13, v49[5], v43[5], v37[5]);
  objc_msgSend(v19, "setByAddingObjectsFromSet:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setByAddingObjectsFromSet:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = self->_unsavedChangesQueue;
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __112__EKEventStore_mimicSaveAndCommitEvent_oldToNewObjectIDMap_insertedObjectIDs_updatedObjectIDs_deletedObjectIDs___block_invoke_2;
  v27[3] = &unk_1E47853B0;
  v27[4] = self;
  v28 = v23;
  v25 = v23;
  dispatch_sync(v24, v27);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v12;
}

void __112__EKEventStore_mimicSaveAndCommitEvent_oldToNewObjectIDMap_insertedObjectIDs_updatedObjectIDs_deletedObjectIDs___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v2 = (void *)objc_opt_class();
  v3 = a1[5];
  objc_msgSend(*(id *)(a1[4] + 304), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_filteredObjectsWithIdentifiers:fromObjects:excludingObjects:", v3, v4, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[8] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = (void *)objc_opt_class();
  v9 = a1[6];
  objc_msgSend(*(id *)(a1[4] + 320), "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_filteredObjectsWithIdentifiers:fromObjects:excludingObjects:", v9, v10, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1[9] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = (void *)objc_opt_class();
  v15 = a1[7];
  objc_msgSend(*(id *)(a1[4] + 312), "allObjects");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_filteredObjectsWithIdentifiers:fromObjects:excludingObjects:", v15, v19, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(a1[10] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

}

id __112__EKEventStore_mimicSaveAndCommitEvent_oldToNewObjectIDMap_insertedObjectIDs_updatedObjectIDs_deletedObjectIDs___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_markObjectsWithIdentifiersAsCommitted:excludingObjects:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_mimicCommitWithOldToNewObjectIDMap:(id)a3 insertedObjectsToCommit:(id)a4 updatedObjectsToCommit:(id)a5 deletedObjectsToCommit:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *dbChangedQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dbChangedQueue = self->_dbChangedQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__EKEventStore__mimicCommitWithOldToNewObjectIDMap_insertedObjectsToCommit_updatedObjectsToCommit_deletedObjectsToCommit___block_invoke;
  block[3] = &unk_1E4785CA0;
  block[4] = self;
  v20 = v11;
  v21 = v10;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v10;
  v18 = v11;
  dispatch_sync(dbChangedQueue, block);

}

void __122__EKEventStore__mimicCommitWithOldToNewObjectIDMap_insertedObjectsToCommit_updatedObjectsToCommit_deletedObjectsToCommit___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 376);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__EKEventStore__mimicCommitWithOldToNewObjectIDMap_insertedObjectsToCommit_updatedObjectsToCommit_deletedObjectsToCommit___block_invoke_2;
  block[3] = &unk_1E4785CA0;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  dispatch_sync(v3, block);

}

uint64_t __122__EKEventStore__mimicCommitWithOldToNewObjectIDMap_insertedObjectsToCommit_updatedObjectsToCommit_deletedObjectsToCommit___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t result;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v34 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "removeObject:", v7);
          v8 = *(void **)(a1 + 48);
          objc_msgSend(v7, "objectID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(*(id *)(a1 + 40), "database");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "_setObjectID:inDatabaseRestoreGeneration:", v10, objc_msgSend(v11, "databaseRestoreGeneration"));

            objc_msgSend(*(id *)(a1 + 40), "_registerObject:", v7);
          }
          objc_msgSend(v7, "_setPendingInsert:", 0);
          objc_msgSend(v7, "didCommit");

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v4);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = *(id *)(a1 + 56);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          objc_msgSend(v17, "_setPendingUpdate:", 0);
          objc_msgSend(v17, "didCommit");
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 320), "minusSet:", *(_QWORD *)(a1 + 56));
  }
  result = objc_msgSend(*(id *)(a1 + 64), "count");
  if (result)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = *(id *)(a1 + 64);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * k);
          objc_msgSend(v24, "_setPendingDelete:", 0, (_QWORD)v25);
          objc_msgSend(*(id *)(a1 + 40), "_unregisterObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v21);
    }

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 312), "minusSet:", *(_QWORD *)(a1 + 64));
  }
  return result;
}

- (void)_resetForMimicCommitOnObject:(id)a3 oldToNewObjectIDMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setChangeSet:", 0);
  objc_msgSend(v6, "backingObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectID");
  v9 = objc_claimAutoreleasedReturnValue();

  v30 = (void *)v9;
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v10;
  if (v10)
  {
    -[EKEventStore registerFetchedObjectWithID:](self, "registerFetchedObjectWithID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackingObject:", v11);
  }
  else
  {
    objc_msgSend(v6, "backingObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reset");
  }

  objc_msgSend(v6, "_resetAfterUpdatingChangeSetOrBackingObjectWithForce:", 1);
  objc_msgSend((id)objc_opt_class(), "knownRelationshipSingleValueKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v6, "cachedMeltedObjectForSingleValueKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 && (objc_msgSend((id)objc_opt_class(), "isWeakRelationObject:forKey:", v18, v17) & 1) == 0)
          -[EKEventStore _resetForMimicCommitOnObject:oldToNewObjectIDMap:](self, "_resetForMimicCommitOnObject:oldToNewObjectIDMap:", v18, v7);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v14);
  }
  v28 = v12;
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(obj);
        objc_msgSend(v6, "cachedMeltedObjectsForMultiValueKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j), v28, v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v33;
          do
          {
            for (k = 0; k != v25; ++k)
            {
              if (*(_QWORD *)v33 != v26)
                objc_enumerationMutation(v23);
              -[EKEventStore _resetForMimicCommitOnObject:oldToNewObjectIDMap:](self, "_resetForMimicCommitOnObject:oldToNewObjectIDMap:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * k), v7);
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
          }
          while (v25);
        }

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v20);
  }

}

- (id)insertedObjectIDs
{
  void *v3;
  NSObject *unsavedChangesQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__EKEventStore_insertedObjectIDs__block_invoke;
  v9[3] = &unk_1E47853B0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(unsavedChangesQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __33__EKEventStore_insertedObjectIDs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "insertedObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "objectID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)updatedObjectIDs
{
  void *v3;
  NSObject *unsavedChangesQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__EKEventStore_updatedObjectIDs__block_invoke;
  v9[3] = &unk_1E47853B0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(unsavedChangesQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __32__EKEventStore_updatedObjectIDs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "updatedObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "objectID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)deletedObjectIDs
{
  void *v3;
  NSObject *unsavedChangesQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__EKEventStore_deletedObjectIDs__block_invoke;
  v9[3] = &unk_1E47853B0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(unsavedChangesQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __32__EKEventStore_deletedObjectIDs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "deletedObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "objectID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)lastCommitTempToPermanentObjectIDMap
{
  NSObject *unsavedChangesQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__EKEventStore_lastCommitTempToPermanentObjectIDMap__block_invoke;
  v5[3] = &unk_1E4785190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(unsavedChangesQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__EKEventStore_lastCommitTempToPermanentObjectIDMap__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

- (void)waitUntilDatabaseUpdatedToTimestamp:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *dbChangedQueue;
  void (**v9)(_QWORD);
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2020000000;
    v20 = 1;
    dbChangedQueue = self->_dbChangedQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__EKEventStore_waitUntilDatabaseUpdatedToTimestamp_callback___block_invoke;
    block[3] = &unk_1E4788D50;
    v16 = buf;
    block[4] = self;
    v14 = v6;
    v9 = v7;
    v15 = v9;
    dispatch_sync(dbChangedQueue, block);
    if (v18[24])
    {
      v10 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1A2318000, v10, OS_LOG_TYPE_DEFAULT, "Immediately triggering database wait callback because database timestamp is up to date", v12, 2u);
      }
      v9[2](v9);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v11 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2318000, v11, OS_LOG_TYPE_DEFAULT, "No timestamp given, immediately triggering database wait callback", buf, 2u);
    }
    v7[2](v7);
  }

}

uint64_t __61__EKEventStore_waitUntilDatabaseUpdatedToTimestamp_callback___block_invoke(_QWORD *a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(MEMORY[0x1E0D0A0A0], "doesTimestamp:includeAllChangesVisibleToTimestamp:", *(_QWORD *)(a1[4] + 352), a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[5];
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A2318000, v3, OS_LOG_TYPE_DEFAULT, "database wait callback must wait until eventStore is refreshed. waitUntilTimestamp: %@", (uint8_t *)&v7, 0xCu);
    }
    v5 = *(void **)(a1[4] + 144);
    v6 = (void *)MEMORY[0x1A85849D4](a1[6]);
    objc_msgSend(v5, "addObject:", v6);

    return objc_msgSend(*(id *)(a1[4] + 152), "addObject:", a1[5]);
  }
  return result;
}

- (id)lastDatabaseTimestampForOOPToWaitOn
{
  NSObject *dbChangedQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  dbChangedQueue = self->_dbChangedQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__EKEventStore_lastDatabaseTimestampForOOPToWaitOn__block_invoke;
  v5[3] = &unk_1E4785190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbChangedQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__EKEventStore_lastDatabaseTimestampForOOPToWaitOn__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 352));
}

- (void)recordObjectRebaseWithOldObjectID:(id)a3 newObjectID:(id)a4
{
  id v6;
  id v7;
  NSObject *unsavedChangesQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__EKEventStore_recordObjectRebaseWithOldObjectID_newObjectID___block_invoke;
  block[3] = &unk_1E4785400;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(unsavedChangesQueue, block);

}

uint64_t __62__EKEventStore_recordObjectRebaseWithOldObjectID_newObjectID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldRecordObjectIDMap");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)startRecordingObjectIDChangeMap
{
  NSObject *unsavedChangesQueue;
  _QWORD block[5];

  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EKEventStore_startRecordingObjectIDChangeMap__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(unsavedChangesQueue, block);
}

void __47__EKEventStore_startRecordingObjectIDChangeMap__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  *(_QWORD *)(v3 + 128) = v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v5;

}

- (void)stopRecordingObjectIDChangeMap
{
  NSObject *unsavedChangesQueue;
  _QWORD block[5];

  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__EKEventStore_stopRecordingObjectIDChangeMap__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(unsavedChangesQueue, block);
}

void __46__EKEventStore_stopRecordingObjectIDChangeMap__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 128);
  *(_QWORD *)(v2 + 128) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 136);
  *(_QWORD *)(v4 + 136) = 0;

}

- (BOOL)shouldRecordObjectIDMap
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_unsavedChangesQueue);
  return self->_lastCommitTempToPermanentObjectIDMap && self->_rebaseTempObjectIDReverseMap != 0;
}

- (id)eventObjectIDsMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EKEventStore _validateEventPredicate:](self, "_validateEventPredicate:", v4);
  +[EKPredicateSearch searchWithEntityClass:predicate:store:](EKPredicateSearch, "searchWithEntityClass:predicate:store:", objc_opt_class(), v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    -[EKEventStore eventsMatchingPredicate:].cold.1();

  return v6;
}

- (void)enumerateEventsMatchingPredicate:(NSPredicate *)predicate usingBlock:(EKEventSearchCallback)block
{
  NSPredicate *v6;
  void (**v7)(EKEventSearchCallback, uint64_t, char *);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = predicate;
  v7 = block;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("block is nil"));
  -[EKEventStore eventsMatchingPredicate:](self, "eventsMatchingPredicate:", v6);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
      v14 = 0;
      v7[2](v7, v13, &v14);
      if (v14)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          goto LABEL_5;
        break;
      }
    }
  }

  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    -[EKEventStore enumerateEventsMatchingPredicate:usingBlock:].cold.1();

}

- (id)fetchEventsMatchingPredicate:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[EKEventStore _validateEventPredicate:](self, "_validateEventPredicate:", v7);
  +[EKPredicateSearch searchWithEntityClass:predicate:store:](EKPredicateSearch, "searchWithEntityClass:predicate:store:", objc_opt_class(), v7, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1A85849D4](v6);
  objc_msgSend(v8, "startWithCompletion:queue:", v9, self->_asynchronousSearchQueue);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)objectsMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[EKPredicateSearch searchWithEntityClass:predicate:store:](EKPredicateSearch, "searchWithEntityClass:predicate:store:", objc_opt_class(), v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "runSynchronously");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)fetchEventCountsInRange:(id)a3 inCalendars:(id)a4 exclusionOptions:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  objc_msgSend(v10, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore predicateForEventsWithStartDate:endDate:calendars:prefetchHint:exclusionOptions:](self, "predicateForEventsWithStartDate:endDate:calendars:prefetchHint:exclusionOptions:", v13, v14, v12, 0, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__EKEventStore_fetchEventCountsInRange_inCalendars_exclusionOptions_completion___block_invoke;
  v19[3] = &unk_1E4788D78;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v16 = v11;
  v17 = v10;
  v18 = -[EKEventStore fetchEventsMatchingPredicate:resultHandler:](self, "fetchEventsMatchingPredicate:resultHandler:", v15, v19);

}

void __80__EKEventStore_fetchEventCountsInRange_inCalendars_exclusionOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(*(id *)(a1 + 32), "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend((id)objc_opt_class(), "_addDaysSpannedByEvent:toCountedSet:inRange:withNSCalendar:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), v4, *(_QWORD *)(a1 + 40), v6, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (void)_addDaysSpannedByEvent:(id)a3 toCountedSet:(id)a4 inRange:(id)a5 withNSCalendar:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v9 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v12, "startOfDayForStartDateInCalendar:", v10);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startOfDayForEndDateInCalendar:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateForDayInTimeZone:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "timeZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dateForDayInTimeZone:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "laterDate:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "earlierDate:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setHour:", 0);
  objc_msgSend(v22, "setMinute:", 0);
  objc_msgSend(v22, "setSecond:", 0);
  objc_msgSend(v9, "addObject:", v20);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __75__EKEventStore__addDaysSpannedByEvent_toCountedSet_inRange_withNSCalendar___block_invoke;
  v26[3] = &unk_1E4788DA0;
  v27 = v21;
  v28 = v9;
  v23 = v9;
  v24 = v21;
  objc_msgSend(v10, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:", v20, v22, 1024, v26);

}

void __75__EKEventStore__addDaysSpannedByEvent_toCountedSet_inRange_withNSCalendar___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v6 = a2;
  v7 = v6;
  if (v6 && (v9 = v6, v8 = objc_msgSend(v6, "CalIsAfterDate:", *(_QWORD *)(a1 + 32)), v7 = v9, !v8))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    v7 = v9;
  }
  else
  {
    *a4 = 1;
  }

}

- (void)cancelFetchRequest:(id)fetchIdentifier
{
  id v3;
  void *v4;

  v3 = fetchIdentifier;
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EE6738C0) & 1) != 0)
  {
    objc_msgSend(v3, "cancel");
  }
  else
  {
    v4 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT))
      -[EKEventStore cancelFetchRequest:].cold.1(v4);
  }

}

- (id)nextEventWithCalendarIdentifiers:(id)a3 exclusionOptions:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        -[EKEventStore calendarWithIdentifier:](self, "calendarWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  -[EKEventStore nextEventWithCalendars:exclusionOptions:](self, "nextEventWithCalendars:exclusionOptions:", v7, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)nextEventWithCalendars:(id)a3 exclusionOptions:(int64_t)a4
{
  void *v4;
  void *v5;

  -[EKEventStore nextEventsWithCalendars:limit:exclusionOptions:](self, "nextEventsWithCalendars:limit:exclusionOptions:", a3, 1, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nextEventsWithCalendars:(id)a3 limit:(unint64_t)a4 exclusionOptions:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  int64_t v14;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__EKEventStore_nextEventsWithCalendars_limit_exclusionOptions___block_invoke;
  v12[3] = &unk_1E4788DC8;
  v12[4] = self;
  v13 = v8;
  v14 = a5;
  v9 = v8;
  -[EKEventStore _nextEventsWithFetchBlock:steps:limit:](self, "_nextEventsWithFetchBlock:steps:limit:", v12, &unk_1E47B5C50, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __63__EKEventStore_nextEventsWithCalendars_limit_exclusionOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "predicateForEventsWithStartDate:endDate:calendars:prefetchHint:exclusionOptions:", v5, v6, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "eventsMatchingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_nextEventsWithFetchBlock:(id)a3 steps:(id)a4 limit:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  void (**v27)(id, void *);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = (void (**)(id, void *))a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v25 = v9;
  if (objc_msgSend(v7, "count"))
  {
    v10 = 0;
    v11 = v9;
    v26 = v7;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      objc_msgSend(MEMORY[0x1E0D0C2B8], "rangeWithStartDate:duration:", v11, (double)(unint64_t)(86400 * v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2](v27, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_417);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v29;
LABEL_5:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v21);
          if (objc_msgSend(v8, "count") >= a5)
            break;
          objc_msgSend(v8, "addObject:", v22);
          if (v19 == ++v21)
          {
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            if (v19)
              goto LABEL_5;
            break;
          }
        }
      }

      if (objc_msgSend(v8, "count") == a5)
        break;
      objc_msgSend(v14, "endDate");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      ++v10;
      v7 = v26;
      v11 = v9;
      if (objc_msgSend(v26, "count") <= v10)
        goto LABEL_15;
    }

    v9 = v11;
    v7 = v26;
  }
LABEL_15:
  v23 = (void *)objc_msgSend(v8, "copy");

  return v23;
}

uint64_t __54__EKEventStore__nextEventsWithFetchBlock_steps_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)alarmWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  EKEventStore *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__23;
    v17 = __Block_byref_object_dispose__23;
    v18 = 0;
    -[EKEventStore connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CADOperationProxySync");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__EKEventStore_alarmWithUUID___block_invoke;
    v9[3] = &unk_1E4788B60;
    v10 = v4;
    v11 = self;
    v12 = &v13;
    objc_msgSend(v6, "CADDatabaseGetAlarmWithUUID:reply:", v10, v9);

    v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __30__EKEventStore_alarmWithUUID___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  EKAlarm *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __30__EKEventStore_alarmWithUUID___block_invoke_cold_1();
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerFetchedObjectWithID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[EKObject initWithPersistentObject:]([EKAlarm alloc], "initWithPersistentObject:", v8);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }

}

- (id)alarmWithExternalID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  EKEventStore *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__23;
    v17 = __Block_byref_object_dispose__23;
    v18 = 0;
    -[EKEventStore connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CADOperationProxySync");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__EKEventStore_alarmWithExternalID___block_invoke;
    v9[3] = &unk_1E4788B60;
    v10 = v4;
    v11 = self;
    v12 = &v13;
    objc_msgSend(v6, "CADDatabaseGetAlarmWithExternalID:reply:", v10, v9);

    v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __36__EKEventStore_alarmWithExternalID___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  EKAlarm *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __36__EKEventStore_alarmWithExternalID___block_invoke_cold_1();
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerFetchedObjectWithID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[EKObject initWithPersistentObject:]([EKAlarm alloc], "initWithPersistentObject:", v8);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }

}

- (id)alarmOccurrencesFromAlarmCache
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  -[EKEventStore connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__EKEventStore_alarmOccurrencesFromAlarmCache__block_invoke;
  v6[3] = &unk_1E4788490;
  v6[4] = &v7;
  objc_msgSend(v3, "CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__EKEventStore_alarmOccurrencesFromAlarmCache__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __46__EKEventStore_alarmOccurrencesFromAlarmCache__block_invoke_cold_1(v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
          v15 = objc_alloc(MEMORY[0x1E0D0A140]);
          v16 = (void *)objc_msgSend(v15, "initWithDictionaryRepresentation:", v14, (_QWORD)v20);
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v17 = objc_msgSend(v8, "copy");
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
}

+ (unint64_t)predicatePropertyLoadMode
{
  return _predicatePropertyLoadMode;
}

- (NSPredicate)predicateForEventsWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate calendars:(NSArray *)calendars
{
  NSDate *v8;
  NSDate *v9;
  NSArray *v10;
  NSDate *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSDate *v23;

  v8 = startDate;
  v9 = endDate;
  v10 = calendars;
  if (!v8)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    _NSMethodExceptionProem();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "raise:format:", v18, CFSTR("%@: startDate is nil"), v19);

    if (v9)
      goto LABEL_3;
LABEL_5:
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    _NSMethodExceptionProem();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "raise:format:", v21, CFSTR("%@: endDate is nil"), v22);

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v23 = v9;
  restrictDateRange(v8, (id *)&v23);
  v11 = v23;

  +[EKEventStore calendarObjectIDsForPredicate:](EKEventStore, "calendarObjectIDsForPredicate:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D0A078];
  -[EKEventStore timeZone](self, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithStartDate:endDate:timeZone:calendars:propertyLoadMode:", v8, v11, v14, v12, _predicatePropertyLoadMode);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v15;
}

- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 uniqueID:(id)a5 calendars:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    _NSMethodExceptionProem();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "raise:format:", v21, CFSTR("%@: startDate is nil"), v22);

    if (v11)
      goto LABEL_3;
LABEL_5:
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    _NSMethodExceptionProem();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "raise:format:", v24, CFSTR("%@: endDate is nil"), v25);

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v26 = v11;
  restrictDateRange(v10, &v26);
  v14 = v26;

  +[EKEventStore calendarObjectIDsForPredicate:](EKEventStore, "calendarObjectIDsForPredicate:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D0A078];
  -[EKEventStore timeZone](self, "timeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateWithStartDate:endDate:timeZone:eventUUID:calendars:", v10, v14, v17, v12, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5 prefetchHint:(int64_t)a6 exclusionOptions:(int64_t)a7
{
  return -[EKEventStore predicateForEventsWithStartDate:endDate:calendars:exclusionOptions:filterdOutTitles:randomize:limit:](self, "predicateForEventsWithStartDate:endDate:calendars:exclusionOptions:filterdOutTitles:randomize:limit:", a3, a4, a5, a7, 0, 0, 0);
}

- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5 exclusionOptions:(int64_t)a6 filterdOutTitles:(id)a7 randomize:(BOOL)a8 limit:(int64_t)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  _BOOL8 v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = v18;
  if (!v15)
  {
    v35 = v18;
    v26 = v17;
    v27 = v9;
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99778];
    _NSMethodExceptionProem();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v28;
    v9 = v27;
    v17 = v26;
    v19 = v35;
    objc_msgSend(v31, "raise:format:", v29, CFSTR("%@: startDate is nil"), v30);

    if (v16)
      goto LABEL_3;
LABEL_5:
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    _NSMethodExceptionProem();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "raise:format:", v33, CFSTR("%@: endDate is nil"), v34);

    goto LABEL_3;
  }
  if (!v16)
    goto LABEL_5;
LABEL_3:
  v36 = v16;
  restrictDateRange(v15, &v36);
  v20 = v36;

  +[EKEventStore calendarObjectIDsForPredicate:](EKEventStore, "calendarObjectIDsForPredicate:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D0A078];
  -[EKEventStore timeZone](self, "timeZone");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "predicateWithStartDate:endDate:timeZone:calendars:propertyLoadMode:", v15, v20, v23, v21, _predicatePropertyLoadMode);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setExcludeTimedEvents:", ((unint64_t)a6 >> 1) & 1);
  objc_msgSend(v24, "setExcludeAllDayEvents:", a6 & 1);
  objc_msgSend(v24, "setExcludeDeclined:", ((unint64_t)a6 >> 2) & 1);
  objc_msgSend(v24, "setExcludeProposed:", ((unint64_t)a6 >> 3) & 1);
  objc_msgSend(v24, "setExcludeDeclinedUnlessProposed:", ((unint64_t)a6 >> 4) & 1);
  objc_msgSend(v24, "setExcludeNoAttendeeEvents:", ((unint64_t)a6 >> 5) & 1);
  objc_msgSend(v24, "setExcludeNoLocationEvents:", ((unint64_t)a6 >> 6) & 1);
  objc_msgSend(v24, "setRandomize:", v9);
  objc_msgSend(v24, "setLimit:", a9);
  objc_msgSend(v24, "setFilteredOutTitles:", v19);

  return v24;
}

- (id)predicateForAssistantEventSearchWithTimeZone:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 notes:(id)a8 participants:(id)a9 calendars:(id)a10 limit:(int64_t)a11
{
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;

  v17 = (objc_class *)MEMORY[0x1E0D0A088];
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = (void *)objc_msgSend([v17 alloc], "initWithTimeZone:startDate:endDate:title:location:notes:participants:limit:", v25, v24, v23, v22, v21, v20, v19, a11);

  +[EKEventStore calendarObjectIDsForPredicate:](EKEventStore, "calendarObjectIDsForPredicate:", v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setCalendars:", v27);
  return v26;
}

- (id)predicateForNotifiableEvents
{
  return (id)objc_msgSend(MEMORY[0x1E0D0A0C0], "predicate");
}

- (id)predicateForNotificationCenterVisibleEvents
{
  return (id)objc_msgSend(MEMORY[0x1E0D0A0C8], "predicate");
}

- (id)predicateForUnacknowledgedEvents
{
  return (id)objc_msgSend(MEMORY[0x1E0D0A110], "predicate");
}

- (id)predicateForUnalertedEvents
{
  return (id)objc_msgSend(MEMORY[0x1E0D0A118], "predicate");
}

- (id)predicateForUpcomingEventsWithLimit:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D0A128], "predicateWithLimit:", *(_QWORD *)&a3);
}

- (id)predicateForMasterEventsInCalendars:(id)a3
{
  void *v3;
  void *v4;

  +[EKEventStore calendarObjectIDsForPredicate:](EKEventStore, "calendarObjectIDsForPredicate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0A148], "predicateWithCalendarIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)predicateForScheduleAgentClientEventsInCalendar:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "CADObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D0A150], "predicateWithCalendarIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasImmediatelyEligibleTravelEvents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore calendarsForEntityType:](self, "calendarsForEntityType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore travelEligibleEventsInCalendars:startDate:endDate:](self, "travelEligibleEventsInCalendars:startDate:endDate:", v5, v3, v4);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "preferredLocation", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hasKnownSpatialData");

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)travelEligibleEventsInCalendars:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[EKEventStore predicateForPotentialTravelEventsInCalendars:startDate:endDate:](self, "predicateForPotentialTravelEventsInCalendars:startDate:endDate:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore eventsMatchingPredicate:](self, "eventsMatchingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v14, "potentiallyEligibleForTravelAdvisories", (_QWORD)v16) & 1) == 0)
          objc_msgSend(v8, "removeObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)predicateForPotentialTravelEventsInCalendars:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore predicateForPotentialTravelEventsInCalendars:startDate:endDate:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKEventStore predicateForPotentialTravelEventsInCalendars:startDate:endDate:].cold.1();
LABEL_6:
  v14 = v9;
  restrictDateRange(v8, &v14);
  v10 = v14;

  +[EKEventStore calendarObjectIDsForPredicate:](EKEventStore, "calendarObjectIDsForPredicate:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A108]), "initWithCalendarIDs:startDate:endDate:", v11, v8, v10);

  return v12;
}

- (id)predicateForUpNextEventsInCalendars:(id)a3 startDate:(id)a4 endDate:(id)a5 startDateRestrictionThreshold:(double)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore predicateForUpNextEventsInCalendars:startDate:endDate:startDateRestrictionThreshold:].cold.2();
    if (v11)
      goto LABEL_6;
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKEventStore predicateForUpNextEventsInCalendars:startDate:endDate:startDateRestrictionThreshold:].cold.1();
LABEL_6:
  v16 = v11;
  restrictDateRange(v10, &v16);
  v12 = v16;

  +[EKEventStore calendarObjectIDsForPredicate:](EKEventStore, "calendarObjectIDsForPredicate:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A120]), "initWithCalendarIDs:startDate:endDate:", v13, v10, v12);

  objc_msgSend(v14, "setStartDateRestrictionThreshold:", a6);
  return v14;
}

- (id)predicateForNaturalLanguageSuggestedEventsWithSearchString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D0A0B0];
  v5 = a3;
  v6 = [v4 alloc];
  -[EKEventStore timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithSearchString:timeZone:", v5, v7);

  return v8;
}

- (id)predicateForNaturalLanguageSuggestedEventsWithSearchString:(id)a3 startDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (!v7)
    v7 = (id)objc_opt_new();
  v8 = objc_alloc(MEMORY[0x1E0D0A0B0]);
  -[EKEventStore timeZone](self, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithSearchString:startDate:timeZone:", v6, v7, v9);

  return v10;
}

- (id)predicateForEventsCreatedFromSuggestion
{
  return (id)objc_msgSend(MEMORY[0x1E0D0A070], "predicateForAllSuggestedEvents");
}

- (id)predicateForEventCreatedFromSuggestionWithOpaqueKey:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D0A070];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithOpaqueKey:", v4);

  return v5;
}

- (id)predicateForEventsCreatedFromSuggestionWithExtractionGroupIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D0A070];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithExtractionGroupIdentifier:", v4);

  return v5;
}

- (id)predicateForEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5 matchingContacts:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[EKEventStore calendarObjectIDsForPredicate:](EKEventStore, "calendarObjectIDsForPredicate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0A058]), "initWithCalendarIDs:startDate:endDate:contacts:", v14, v10, v11, v13);
  }
  else
  {
    -[EKEventStore predicateForEventsWithStartDate:endDate:calendars:](self, "predicateForEventsWithStartDate:endDate:calendars:", v10, v11, v12);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;

  return v16;
}

- (id)predicateForCalendarItemsOfType:(unint64_t)a3 inCalendar:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0D0A0E0];
  v6 = a4;
  v7 = [v5 alloc];
  if (a3 == 2)
    v8 = 3;
  else
    v8 = 101;
  if (a3 == 1)
    v9 = 2;
  else
    v9 = v8;
  objc_msgSend(v6, "CADObjectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v7, "initWithEntityType:filters:calendar:", v9, 0, v10);
  return v11;
}

- (id)predicateForMasterEventsWithExternalTrackingStatusInCalendar:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D0A0D8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithProperty:comparison:integerValue:", 0, 1, 0);
  v6 = objc_alloc(MEMORY[0x1E0D0A0E0]);
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "initWithEntityType:filters:calendar:", 2, v7, v8);
  return v9;
}

- (id)predicateForCalendarItemsOfType:(unint64_t)a3 withUniqueIdentifier:(id)a4 inCalendar:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0D0A0D8];
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithProperty:comparison:stringValue:", 1, 0, v9);

  v11 = objc_alloc(MEMORY[0x1E0D0A0E0]);
  if (a3 == 2)
    v12 = 3;
  else
    v12 = 101;
  if (a3 == 1)
    v13 = 2;
  else
    v13 = v12;
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADObjectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v11, "initWithEntityType:filters:calendar:", v13, v14, v15);
  return v16;
}

- (id)predicateForCalendarItemsOfType:(unint64_t)a3 withUniqueIdentifier:(id)a4 inSource:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0D0A0D8];
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithProperty:comparison:stringValue:", 1, 0, v9);

  v11 = objc_alloc(MEMORY[0x1E0D0A0E0]);
  if (a3 == 2)
    v12 = 3;
  else
    v12 = 101;
  if (a3 == 1)
    v13 = 2;
  else
    v13 = v12;
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADObjectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v11, "initWithEntityType:filters:source:", v13, v14, v15);
  return v16;
}

- (id)predicateForCalendarItemsOfType:(unint64_t)a3 withExternalID:(id)a4 inCalendar:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0D0A0D8];
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithProperty:comparison:stringValue:", 3, 0, v9);

  v11 = objc_alloc(MEMORY[0x1E0D0A0E0]);
  if (a3 == 2)
    v12 = 3;
  else
    v12 = 101;
  if (a3 == 1)
    v13 = 2;
  else
    v13 = v12;
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADObjectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v11, "initWithEntityType:filters:calendar:", v13, v14, v15);
  return v16;
}

- (id)predicateForCalendarItemsOfType:(unint64_t)a3 withExternalID:(id)a4 inSource:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0D0A0D8];
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithProperty:comparison:stringValue:", 3, 0, v9);

  v11 = objc_alloc(MEMORY[0x1E0D0A0E0]);
  if (a3 == 2)
    v12 = 3;
  else
    v12 = 101;
  if (a3 == 1)
    v13 = 2;
  else
    v13 = v12;
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADObjectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v11, "initWithEntityType:filters:source:", v13, v14, v15);
  return v16;
}

- (id)predicateForEventsWithAttendeesInCalendar:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D0A0D8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithProperty:comparison:integerValue:", 12, 0, 1);
  v6 = objc_alloc(MEMORY[0x1E0D0A0E0]);
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "initWithEntityType:filters:calendar:", 2, v7, v8);
  return v9;
}

- (id)predicateForMasterEventsWithStartDate:(id)a3 title:(id)a4 inCalendar:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0D0A0D8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithProperty:comparison:stringValue:", 4, 0, v9);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0D8]), "initWithProperty:comparison:dateValue:", 5, 0, v10);
  v13 = objc_alloc(MEMORY[0x1E0D0A0E0]);
  v18[0] = v11;
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADObjectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v13, "initWithEntityType:filters:calendar:", 2, v14, v15);
  return v16;
}

- (id)predicateForMasterEventsInCalendar:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D0A0E0];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "CADObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithEntityType:filters:calendar:", 2, MEMORY[0x1E0C9AA60], v6);
  return v7;
}

- (id)predicateForRandomMasterEventsWithStartDate:(id)a3 endDate:(id)a4 needToHaveAttendee:(BOOL)a5 needToHaveLocation:(BOOL)a6 allDay:(BOOL)a7 filteredOutTitles:(id)a8 limit:(int64_t)a9 calendars:(id)a10
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _QWORD v56[4];

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v56[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a8;
  v43 = a10;
  v18 = (void *)objc_opt_new();
  if (v13)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0D8]), "initWithProperty:comparison:integerValue:", 12, 0, 1);
    objc_msgSend(v18, "addObject:", v19);

  }
  if (v12)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0D8]), "initWithProperty:comparison:integerValue:", 13, 1, 0);
    objc_msgSend(v18, "addObject:", v20);

  }
  v44 = v16;
  v45 = v15;
  if (v15 && v16)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0D8]), "initWithProperty:comparison:dateValue:", 5, 2, v16);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0D8]), "initWithProperty:comparison:dateValue:", 6, 4, v15);
    v23 = objc_alloc(MEMORY[0x1E0D0A050]);
    v56[0] = v21;
    v56[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithFilters:operation:", v24, 0);

    objc_msgSend(v18, "addObject:", v25);
  }
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0D8]), "initWithProperty:comparison:integerValue:", 14, 0, v11);
  objc_msgSend(v18, "addObject:");
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v26 = v17;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v51 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0D8]), "initWithProperty:comparison:stringValue:", 4, 1, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
        objc_msgSend(v18, "addObject:", v31);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v28);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v32 = v43;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v33)
  {
    v34 = v33;
    v35 = 0;
    v36 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v47 != v36)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
        if (!v35)
          v35 = (void *)objc_opt_new();
        objc_msgSend(v38, "CADObjectID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addObject:", v39);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v34);
  }
  else
  {
    v35 = 0;
  }

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0E0]), "initWithEntityType:filters:calendars:limit:randomize:", 2, v18, v35, a9, 1);
  return v40;
}

- (id)predicateForEventsInSubscribedCalendar:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D0A100];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "CADObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithCalendar:", v6);
  return v7;
}

- (id)predicateForMasterEventsWithOccurrencesWithStartDate:(id)a3 endDate:(id)a4 inCalendar:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0D0A0D8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v27 = (void *)objc_msgSend([v7 alloc], "initWithProperty:comparison:integerValue:", 10, 0, 1);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0D8]), "initWithProperty:comparison:dateValue:", 5, 2, v9);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0D8]), "initWithProperty:comparison:dateValue:", 6, 4, v10);
  v12 = objc_alloc(MEMORY[0x1E0D0A050]);
  v32[0] = v11;
  v32[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithFilters:operation:", v13, 0);

  v15 = objc_alloc(MEMORY[0x1E0D0A050]);
  v31[0] = v11;
  v31[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithFilters:operation:", v16, 0);

  v18 = objc_alloc(MEMORY[0x1E0D0A050]);
  v30[0] = v14;
  v30[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithFilters:operation:", v19, 1);

  v21 = objc_alloc(MEMORY[0x1E0D0A0E0]);
  v29 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADObjectID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_msgSend(v21, "initWithEntityType:filters:calendar:", 2, v22, v23);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A080]), "initWithPredicate:limitWithStartDate:endDate:mustStartInInterval:", v24, v10, v9, 0);

  return v25;
}

- (id)predicateForMasterEventsWithInvitationsAndOccurrencesAfter:(id)a3 inCalendar:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D0A0D8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithProperty:comparison:integerValue:", 10, 0, 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0D8]), "initWithProperty:comparison:integerValue:", 9, 1, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0D8]), "initWithProperty:comparison:dateValue:", 5, 5, v7);
  v11 = objc_alloc(MEMORY[0x1E0D0A050]);
  v23[0] = v8;
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFilters:operation:", v12, 1);

  v14 = objc_alloc(MEMORY[0x1E0D0A0E0]);
  v22[0] = v9;
  v22[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CADObjectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v14, "initWithEntityType:filters:calendar:", 2, v15, v16);
  v18 = objc_alloc(MEMORY[0x1E0D0A080]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithPredicate:limitWithStartDate:endDate:mustStartInInterval:", v17, v7, v19, 0);

  return v20;
}

- (id)predicateForNonrecurringEventsWithStartDate:(id)a3 endDate:(id)a4 calendars:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  +[EKEventStore calendarObjectIDsForPredicate:](EKEventStore, "calendarObjectIDsForPredicate:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A0B8]), "initWithStartDate:endDate:calendarIDs:", v8, v7, v9);

  return v10;
}

- (unint64_t)timeToLeaveLocationAuthorizationStatus
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[EKEventStore connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__EKEventStore_timeToLeaveLocationAuthorizationStatus__block_invoke;
  v6[3] = &unk_1E47883F8;
  v6[4] = &v7;
  objc_msgSend(v3, "CADDatabaseGetTTLLocationAuthorizationStatus:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __54__EKEventStore_timeToLeaveLocationAuthorizationStatus__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __54__EKEventStore_timeToLeaveLocationAuthorizationStatus__block_invoke_cold_1(v3);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)predicateForEventsWithConferenceURL:(id)a3 limit:(int64_t)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0D0A090];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithURL:limit:", v6, a4);

  objc_msgSend(v7, "setCalendars:", MEMORY[0x1E0C9AA60]);
  return v7;
}

- (int64_t)registerForDetailedChangeTracking:(id *)a3
{
  return -[EKEventStore registerForDetailedChangeTrackingInSource:error:](self, "registerForDetailedChangeTrackingInSource:error:", 0, a3);
}

- (int64_t)registerForDetailedChangeTrackingInSource:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  v18 = 0;
  -[EKEventStore connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CADOperationProxySync");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CADObjectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__EKEventStore_registerForDetailedChangeTrackingInSource_error___block_invoke;
  v12[3] = &unk_1E4788728;
  v12[4] = &v13;
  v12[5] = &v19;
  objc_msgSend(v8, "CADDatabaseRegisterForDetailedChangeTrackingInSource:reply:", v9, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v14[5]);
  v10 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __64__EKEventStore_registerForDetailedChangeTrackingInSource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __64__EKEventStore_registerForDetailedChangeTrackingInSource_error___block_invoke_cold_1();
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)unregisterForDetailedChangeTracking:(id *)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__23;
  v13 = __Block_byref_object_dispose__23;
  v14 = 0;
  -[EKEventStore connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADOperationProxySync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__EKEventStore_unregisterForDetailedChangeTracking___block_invoke;
  v8[3] = &unk_1E4784F70;
  v8[4] = &v9;
  objc_msgSend(v5, "CADDatabaseUnregisterForDetailedChangeTracking:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = v10[5] == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __52__EKEventStore_unregisterForDetailedChangeTracking___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __52__EKEventStore_unregisterForDetailedChangeTracking___block_invoke_cold_1();
  }
}

- (void)fetchChangedObjectIDsSinceToken:(int64_t)a3 resultHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  -[EKEventStore connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CADOperationProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__EKEventStore_fetchChangedObjectIDsSinceToken_resultHandler___block_invoke;
  v9[3] = &unk_1E4788E60;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "CADDatabaseFetchChangedObjectIDs:", v9);

}

void __62__EKEventStore_fetchChangedObjectIDsSinceToken_resultHandler___block_invoke(uint64_t a1, int a2, char a3, void *a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  int v19;
  char v20;

  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(17, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__EKEventStore_fetchChangedObjectIDsSinceToken_resultHandler___block_invoke_2;
  block[3] = &unk_1E4788E38;
  v19 = a2;
  v20 = a3;
  v12 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = v10;
  v18 = v12;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, block);

}

void __62__EKEventStore_fetchChangedObjectIDsSinceToken_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v1 = *(unsigned int *)(a1 + 64);
  v2 = *(unsigned __int8 *)(a1 + 68);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__EKEventStore_fetchChangedObjectIDsSinceToken_resultHandler___block_invoke_3;
  v6[3] = &unk_1E4788E10;
  v6[4] = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_processChangedObjectIDsWithErrorCode:changesTruncated:latestToken:changeData:resultHandler:", v1, v2, v4, v5, v6);

}

void __62__EKEventStore_fetchChangedObjectIDsSinceToken_resultHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v10 = a1;
  v11 = *(void **)(a1 + 32);
  v12 = a6;
  v13 = a5;
  v16 = a4;
  v14 = a3;
  objc_msgSend(v11, "recordSequenceTokenForLegacyClients:", v14);
  v15 = *(_QWORD *)(v10 + 40);
  LODWORD(v10) = objc_msgSend(v14, "legacyToken");

  (*(void (**)(uint64_t, uint64_t, _QWORD, id, id, id))(v15 + 16))(v15, a2, (int)v10, v16, v13, v12);
}

- (void)changedObjectIDsSinceToken:(int64_t)a3 resultHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__EKEventStore_changedObjectIDsSinceToken_resultHandler___block_invoke;
  v7[3] = &unk_1E4788E10;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[EKEventStore fetchChangedObjectIDs:](self, "fetchChangedObjectIDs:", v7);

}

void __57__EKEventStore_changedObjectIDsSinceToken_resultHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v10 = a1;
  v11 = *(void **)(a1 + 32);
  v12 = a6;
  v13 = a5;
  v16 = a4;
  v14 = a3;
  objc_msgSend(v11, "recordSequenceTokenForLegacyClients:", v14);
  v15 = *(_QWORD *)(v10 + 40);
  LODWORD(v10) = objc_msgSend(v14, "legacyToken");

  (*(void (**)(uint64_t, uint64_t, _QWORD, id, id, id))(v15 + 16))(v15, a2, (int)v10, v16, v13, v12);
}

- (void)fetchChangedObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[EKEventStore connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADOperationProxySync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__EKEventStore_fetchChangedObjectIDs___block_invoke;
  v8[3] = &unk_1E4788E60;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "CADDatabaseFetchChangedObjectIDs:", v8);

}

uint64_t __38__EKEventStore_fetchChangedObjectIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processChangedObjectIDsWithErrorCode:changesTruncated:latestToken:changeData:resultHandler:", a2, a3, a4, a5, *(_QWORD *)(a1 + 40));
}

- (void)_processChangedObjectIDsWithErrorCode:(int)a3 changesTruncated:(BOOL)a4 latestToken:(id)a5 changeData:(id)a6 resultHandler:(id)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  EKSequenceToken *v16;
  __int128 v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  BOOL v36;
  BOOL v37;
  int v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  EKSequenceToken *v51;
  __int128 v52;
  _BOOL4 v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  EKSequenceToken *v62;
  uint64_t v63;
  int v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  _BYTE v79[128];
  uint64_t v80;

  v9 = a4;
  v80 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v13;
  if (a3)
  {
    v15 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKEventStore _processChangedObjectIDsWithErrorCode:changesTruncated:latestToken:changeData:resultHandler:].cold.1(v15);
    v14[2](v14, 0, 0, 0, 0, 0);
    goto LABEL_52;
  }
  v59 = v13;
  v53 = v9;
  v54 = v12;
  v55 = v11;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v16 = (EKSequenceToken *)v12;
  v63 = -[EKSequenceToken countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
  if (v63)
  {
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v61 = *(_QWORD *)v68;
    *(_QWORD *)&v17 = 134218752;
    v52 = v17;
    v62 = v16;
LABEL_7:
    v21 = 0;
    while (1)
    {
      v65 = v18;
      v66 = v19;
      if (*(_QWORD *)v68 != v61)
        objc_enumerationMutation(v16);
      v22 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v21);
      -[EKSequenceToken objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v22, v52);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("changes"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("inserts"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "unsignedIntegerValue");

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("updates"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "unsignedIntegerValue");

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("deletes"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "unsignedIntegerValue");

      v31 = objc_msgSend(v22, "intValue");
      +[EKObjectID EKObjectIDsFromData:range:databaseID:](EKObjectID, "EKObjectIDsFromData:range:databaseID:", v24, 0, v26, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[EKObjectID EKObjectIDsFromData:range:databaseID:](EKObjectID, "EKObjectIDsFromData:range:databaseID:", v24, v26, v28, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[EKObjectID EKObjectIDsFromData:range:databaseID:](EKObjectID, "EKObjectIDsFromData:range:databaseID:", v24, v28 + v26, v30, v31);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      if (v32)
        v36 = v33 == 0;
      else
        v36 = 1;
      v37 = v36 || v34 == 0;
      v38 = !v37;
      v64 = v38;
      if (v37)
      {
        v60 = v33;
        v41 = (void *)EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          v49 = v41;
          v50 = objc_msgSend(v24, "length");
          *(_DWORD *)buf = v52;
          v72 = v26;
          v73 = 2048;
          v74 = v28;
          v75 = 2048;
          v76 = v30;
          v77 = 2048;
          v78 = v50;
          _os_log_error_impl(&dword_1A2318000, v49, OS_LOG_TYPE_ERROR, "Change data was the wrong size to hold the changes we received. Told of %lu inserts, %lu updates, and %lu deletes, but change data was only %lu bytes long.", buf, 0x2Au);

        }
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v59 + 2))(v59, 0, 0, 0, 0, 0);
        v18 = v65;
        v19 = v66;
        v33 = v60;
        goto LABEL_41;
      }
      if (v20 && objc_msgSend(v20, "count"))
      {
        v19 = v66;
        v39 = v58;
        if (!v58)
        {
          v40 = (id)objc_msgSend(v20, "mutableCopy");

          v39 = v40;
          v20 = v40;
        }
        v18 = v65;
        v58 = v39;
        objc_msgSend(v39, "addObjectsFromArray:", v32);
        if (!v66)
        {
LABEL_35:
          v45 = v33;

          v19 = v45;
          if (!v18)
            goto LABEL_40;
          goto LABEL_36;
        }
      }
      else
      {
        v42 = v32;

        v20 = v42;
        v18 = v65;
        v19 = v66;
        if (!v66)
          goto LABEL_35;
      }
      if (!objc_msgSend(v19, "count"))
        goto LABEL_35;
      v43 = v57;
      if (!v57)
      {
        v44 = (id)objc_msgSend(v19, "mutableCopy");

        v43 = v44;
        v19 = v44;
      }
      v57 = v43;
      objc_msgSend(v43, "addObjectsFromArray:", v33);
      if (!v18)
        goto LABEL_40;
LABEL_36:
      if (objc_msgSend(v18, "count"))
      {
        v46 = v56;
        if (!v56)
        {
          v47 = (id)objc_msgSend(v18, "mutableCopy");

          v46 = v47;
          v18 = v47;
        }
        v56 = v46;
        objc_msgSend(v46, "addObjectsFromArray:", v35);
        goto LABEL_41;
      }
LABEL_40:
      v48 = v35;

      v18 = v48;
LABEL_41:

      if (!v64)
      {
        v12 = v54;
        v11 = v55;
        v51 = v62;
        v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v59;
        goto LABEL_51;
      }
      ++v21;
      v16 = v62;
      if (v63 == v21)
      {
        v63 = -[EKSequenceToken countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
        if (v63)
          goto LABEL_7;
        goto LABEL_47;
      }
    }
  }
  v56 = 0;
  v57 = 0;
  v58 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
LABEL_47:

  v11 = v55;
  if (v55)
    v51 = -[EKSequenceToken initWithCADSequenceToken:]([EKSequenceToken alloc], "initWithCADSequenceToken:", v55);
  else
    v51 = 0;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v59;
  (*((void (**)(id, _BOOL4, EKSequenceToken *, void *, void *, void *))v59 + 2))(v59, v53, v51, v20, v19, v18);
  v12 = v54;
LABEL_51:

LABEL_52:
}

- (void)markChangedObjectIDsConsumedUpToToken:(int64_t)a3
{
  EKSequenceToken *lastSequenceToken;
  uint64_t v6;

  lastSequenceToken = self->_lastSequenceToken;
  if (lastSequenceToken)
    v6 = -[EKSequenceToken legacyToken](lastSequenceToken, "legacyToken");
  else
    v6 = -1;
  if (v6 != a3 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKEventStore markChangedObjectIDsConsumedUpToToken:].cold.1();
  if (self->_lastSequenceToken)
    -[EKEventStore consumeAllChangesUpToToken:](self, "consumeAllChangesUpToToken:");
}

- (void)consumeAllChangesUpToToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[EKEventStore connection](self, "connection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CADOperationProxySync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "CADDatabaseMarkChangedObjectIDsConsumedUpToSequenceToken:reply:", v6, &__block_literal_global_456);
}

void __43__EKEventStore_consumeAllChangesUpToToken___block_invoke(uint64_t a1, int a2)
{
  void *v2;

  if (a2)
  {
    v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __43__EKEventStore_consumeAllChangesUpToToken___block_invoke_cold_1(v2);
  }
}

- (BOOL)consumeAllChangesUpToToken:(id)a3 except:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v8 = a3;
  v9 = a4;
  +[EKObjectChange CADObjectChangeIDsFromEKObjectChanges:](EKObjectChange, "CADObjectChangeIDsFromEKObjectChanges:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[EKEventStore connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CADOperationProxySync");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__EKEventStore_consumeAllChangesUpToToken_except_error___block_invoke;
  v16[3] = &unk_1E4784F70;
  v16[4] = &v17;
  objc_msgSend(v12, "CADDatabaseConsumeAllChangesUpToToken:except:reply:", v13, v10, v16);

  v14 = *((_DWORD *)v18 + 6);
  if (a5 && v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", *((unsigned int *)v18 + 6));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v17, 8);

  return v14 == 0;
}

uint64_t __56__EKEventStore_consumeAllChangesUpToToken_except_error___block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)markIndividualChangesConsumed:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v6 = a3;
  +[EKObjectChange CADObjectChangeIDsFromEKObjectChanges:](EKObjectChange, "CADObjectChangeIDsFromEKObjectChanges:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[EKEventStore connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADOperationProxySync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__EKEventStore_markIndividualChangesConsumed_error___block_invoke;
  v12[3] = &unk_1E4784F70;
  v12[4] = &v13;
  objc_msgSend(v9, "CADDatabaseMarkIndividualChangesConsumed:reply:", v7, v12);

  v10 = *((_DWORD *)v14 + 6);
  if (a4 && v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", *((unsigned int *)v14 + 6));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v13, 8);

  return v10 == 0;
}

uint64_t __52__EKEventStore_markIndividualChangesConsumed_error___block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)recordSequenceTokenForLegacyClients:(id)a3
{
  objc_storeStrong((id *)&self->_lastSequenceToken, a3);
}

- (void)clearSuperfluousChanges
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "Somebody called clearSuperfluousChanges. This call is no longer needed and does nothing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCachedDefaultAlarmOffsetsToNSNotFound
{
  NSNumber *defaultTimedAlarmOffset;
  NSNumber *defaultAllDayAlarmOffset;

  defaultTimedAlarmOffset = self->_defaultTimedAlarmOffset;
  self->_defaultTimedAlarmOffset = (NSNumber *)&unk_1E47B5408;

  defaultAllDayAlarmOffset = self->_defaultAllDayAlarmOffset;
  self->_defaultAllDayAlarmOffset = (NSNumber *)&unk_1E47B5408;

}

- (NSNumber)defaultTimedAlarmOffset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  -[EKEventStore calendarSourcesAndDefaultsQueue](self, "calendarSourcesAndDefaultsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__EKEventStore_defaultTimedAlarmOffset__block_invoke;
  v6[3] = &unk_1E47850A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  if (objc_msgSend((id)v8[5], "integerValue") == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 0;
  else
    v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

void __39__EKEventStore_defaultTimedAlarmOffset__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[20];
  if (!v3)
  {
    objc_msgSend(v2, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CADOperationProxySync");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__EKEventStore_defaultTimedAlarmOffset__block_invoke_2;
    v6[3] = &unk_1E4788EA8;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "CADDatabaseGetDefaultAlarmOffsetForAllDay:reply:", 0, v6);

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

void __39__EKEventStore_defaultTimedAlarmOffset__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __39__EKEventStore_defaultTimedAlarmOffset__block_invoke_2_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), a3);
  }

}

- (NSNumber)defaultAllDayAlarmOffset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  -[EKEventStore calendarSourcesAndDefaultsQueue](self, "calendarSourcesAndDefaultsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__EKEventStore_defaultAllDayAlarmOffset__block_invoke;
  v6[3] = &unk_1E47850A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  if (objc_msgSend((id)v8[5], "integerValue") == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 0;
  else
    v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

void __40__EKEventStore_defaultAllDayAlarmOffset__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[21];
  if (!v3)
  {
    objc_msgSend(v2, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CADOperationProxySync");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__EKEventStore_defaultAllDayAlarmOffset__block_invoke_2;
    v6[3] = &unk_1E4788EA8;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "CADDatabaseGetDefaultAlarmOffsetForAllDay:reply:", 1, v6);

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

void __40__EKEventStore_defaultAllDayAlarmOffset__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __40__EKEventStore_defaultAllDayAlarmOffset__block_invoke_2_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), a3);
  }

}

- (void)purgeChangelog
{
  void *v2;
  id v3;

  -[EKEventStore connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CADOperationProxySync");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADPurgeChangeTrackingReply:", &__block_literal_global_461);

}

void __30__EKEventStore_purgeChangelog__block_invoke(uint64_t a1, int a2)
{
  void *v2;

  if (a2)
  {
    v2 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __30__EKEventStore_purgeChangelog__block_invoke_cold_1(v2);
  }
}

- (void)cacheValidationStatusForAddress:(id)a3 status:(unint64_t)a4
{
  NSMutableDictionary *cachedValidatedAddresses;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  cachedValidatedAddresses = self->_cachedValidatedAddresses;
  if (!cachedValidatedAddresses)
  {
    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v8 = self->_cachedValidatedAddresses;
    self->_cachedValidatedAddresses = v7;

    cachedValidatedAddresses = self->_cachedValidatedAddresses;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](cachedValidatedAddresses, "setObject:forKey:", v9, v10);

}

- (unint64_t)addressValidationStatus:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_cachedValidatedAddresses, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)occurrencesExistInRangeForEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 mustStartInInterval:(BOOL)a6 timezone:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[EKEventStore connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "CADOperationProxySync");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CADObjectID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __95__EKEventStore_occurrencesExistInRangeForEvent_startDate_endDate_mustStartInInterval_timezone___block_invoke;
  v20[3] = &unk_1E4787938;
  v20[4] = &v21;
  objc_msgSend(v17, "CADOccurrencesExistInRangeForEvent:startDate:endDate:mustStartInInterval:timezone:reply:", v18, v13, v14, v8, v15, v20);

  LOBYTE(v8) = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return v8;
}

uint64_t __95__EKEventStore_occurrencesExistInRangeForEvent_startDate_endDate_mustStartInInterval_timezone___block_invoke(uint64_t result, uint64_t a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  return result;
}

- (id)cachedConstraintsForReminder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore cachedConstraintsForSource:](self, "cachedConstraintsForSource:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __42__EKEventStore_cachedConstraintsForEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "CADObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_clearCachedConstraintsForObjectWithCADObjectID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[EKEventStore constraintsCacheQueue](self, "constraintsCacheQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__EKEventStore__clearCachedConstraintsForObjectWithCADObjectID___block_invoke;
  block[3] = &unk_1E47853B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __64__EKEventStore__clearCachedConstraintsForObjectWithCADObjectID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_cachedConstraints");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)_clearAllCachedConstraints
{
  NSObject *v3;
  _QWORD block[5];

  -[EKEventStore constraintsCacheQueue](self, "constraintsCacheQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__EKEventStore__clearAllCachedConstraints__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __42__EKEventStore__clearAllCachedConstraints__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_cachedDefaultConstraints:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "set_cachedConstraints:", 0);
}

- (void)cacheConstraints:(id)a3 forObjectWithCADObjectID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[EKEventStore constraintsCacheQueue](self, "constraintsCacheQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__EKEventStore_cacheConstraints_forObjectWithCADObjectID___block_invoke;
    block[3] = &unk_1E4785400;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_sync(v8, block);

  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventStore cacheConstraints:forObjectWithCADObjectID:].cold.1();
  }

}

void __58__EKEventStore_cacheConstraints_forObjectWithCADObjectID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_cachedConstraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "set_cachedConstraints:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "_cachedConstraints");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __41__EKEventStore_sourceIdentifierForEvent___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __58__EKEventStore__fetchConstraintsForObjectWithCADObjectID___block_invoke_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (id)notificationCollectionForSource:(id)a3
{
  id v4;
  void *v5;
  char v6;
  EKNotificationCollection *v7;
  NSObject *v8;
  EKNotificationCollection *v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTemporary");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__23;
    v18 = __Block_byref_object_dispose__23;
    v19 = 0;
    -[EKEventStore notificationCollectionCacheQueue](self, "notificationCollectionCacheQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__EKEventStore_notificationCollectionForSource___block_invoke;
    block[3] = &unk_1E4785298;
    v13 = &v14;
    block[4] = self;
    v12 = v4;
    dispatch_sync(v8, block);

    if (v15[5])
    {
      v9 = [EKNotificationCollection alloc];
      v7 = -[EKObject initWithPersistentObject:](v9, "initWithPersistentObject:", v15[5]);
    }
    else
    {
      v7 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

void __48__EKEventStore_notificationCollectionForSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "_cachedNotificationCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "CADObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "CADObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_fetchPersistentNotificationCollectionForSourceWithCADObjectID:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_cachedNotificationCollections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "set_cachedNotificationCollections:", v12);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "set_cachedNotificationCollections:", v13);

      }
      objc_msgSend(*(id *)(a1 + 32), "_cachedNotificationCollections");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 40);
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(v14, "CADObjectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v15, v16);

    }
  }
}

- (id)_fetchPersistentNotificationCollectionForSourceWithCADObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  EKEventStore *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__23;
  v18 = __Block_byref_object_dispose__23;
  v19 = 0;
  -[EKEventStore connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADOperationProxySync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__EKEventStore__fetchPersistentNotificationCollectionForSourceWithCADObjectID___block_invoke;
  v10[3] = &unk_1E4788EF0;
  v7 = v4;
  v12 = self;
  v13 = &v14;
  v11 = v7;
  objc_msgSend(v6, "CADSourceGetNotificationCollection:reply:", v7, v10);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __79__EKEventStore__fetchPersistentNotificationCollectionForSourceWithCADObjectID___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __79__EKEventStore__fetchPersistentNotificationCollectionForSourceWithCADObjectID___block_invoke_cold_2(v7);
  }
  else if (v5)
  {
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "registerFetchedObjectWithID:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    __79__EKEventStore__fetchPersistentNotificationCollectionForSourceWithCADObjectID___block_invoke_cold_1();
  }

}

- (BOOL)needsGeocodingForEvent:(id)a3
{
  id v4;
  NSObject *unsavedChangesQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__EKEventStore_needsGeocodingForEvent___block_invoke;
  block[3] = &unk_1E4785298;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(unsavedChangesQueue, block);
  LOBYTE(unsavedChangesQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)unsavedChangesQueue;
}

uint64_t __39__EKEventStore_needsGeocodingForEvent___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 120), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)setNeedsGeocoding:(BOOL)a3 forEvent:(id)a4
{
  id v6;
  NSObject *unsavedChangesQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  unsavedChangesQueue = self->_unsavedChangesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__EKEventStore_setNeedsGeocoding_forEvent___block_invoke;
  block[3] = &unk_1E4788F18;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(unsavedChangesQueue, block);

}

uint64_t __43__EKEventStore_setNeedsGeocoding_forEvent___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  void *v3;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v1)
    return objc_msgSend(v3, "addObject:", v2);
  else
    return objc_msgSend(v3, "removeObject:", v2);
}

- (BOOL)shouldPermitOrganizerEmailFromJunkChecks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[EKEventStore connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADOperationProxySync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__EKEventStore_shouldPermitOrganizerEmailFromJunkChecks___block_invoke;
  v8[3] = &unk_1E4787938;
  v8[4] = &v9;
  objc_msgSend(v6, "CADDatabaseShouldPermitOrganizerEmailFromJunkChecks:reply:", v4, v8);

  LOBYTE(v5) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v5;
}

void __57__EKEventStore_shouldPermitOrganizerEmailFromJunkChecks___block_invoke(uint64_t a1, int a2, char a3)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __57__EKEventStore_shouldPermitOrganizerEmailFromJunkChecks___block_invoke_cold_1(v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (BOOL)shouldPermitOrganizerPhoneNumberFromJunkChecks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[EKEventStore connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADOperationProxySync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__EKEventStore_shouldPermitOrganizerPhoneNumberFromJunkChecks___block_invoke;
  v8[3] = &unk_1E4787938;
  v8[4] = &v9;
  objc_msgSend(v6, "CADDatabaseShouldPermitOrganizerPhoneNumberFromJunkChecks:reply:", v4, v8);

  LOBYTE(v5) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v5;
}

void __63__EKEventStore_shouldPermitOrganizerPhoneNumberFromJunkChecks___block_invoke(uint64_t a1, int a2, char a3)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __63__EKEventStore_shouldPermitOrganizerPhoneNumberFromJunkChecks___block_invoke_cold_1(v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (id)fetchStorageUsage
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  -[EKEventStore connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CADOperationProxySync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__EKEventStore_fetchStorageUsage__block_invoke;
  v6[3] = &unk_1E4788F40;
  v6[4] = &v7;
  objc_msgSend(v3, "CADDatabaseGetStorageUsage:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __33__EKEventStore_fetchStorageUsage__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if (a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __33__EKEventStore_fetchStorageUsage__block_invoke_cold_1(v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (void)analyticsSendEvent:(id)a3 appendingClientBundleIDToPayload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[EKEventStore connection](self, "connection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CADOperationProxySync");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CADAnalyticsSendEvent:appendingClientBundleIDToPayload:", v7, v6);

}

- (void)setCachedEKSourceConstraintObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[EKEventStore _cachedConstraints](self, "_cachedConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[EKEventStore set_cachedConstraints:](self, "set_cachedConstraints:", v9);

  }
  -[EKEventStore _cachedConstraints](self, "_cachedConstraints");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventStore database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CADObjectIDWithGeneration:", objc_msgSend(v10, "databaseRestoreGeneration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKey:", v7, v11);
}

- (void)postSyntheticRouteHypothesis:(id)a3 forEventWithExternalURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1A2318000, v8, OS_LOG_TYPE_DEFAULT, "Posting synthetic route hypothesis for event external url = %{public}@, route hypothesis = %@", buf, 0x16u);
  }
  if (v6)
  {
    +[EKTravelEngineUtilities cadRouteHypothesisForEKTravelEngineHypothesis:](EKTravelEngineUtilities, "cadRouteHypothesisForEKTravelEngineHypothesis:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[EKEventStore connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CADOperationProxySync");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__EKEventStore_postSyntheticRouteHypothesis_forEventWithExternalURL___block_invoke;
  v14[3] = &unk_1E4788F68;
  v15 = v7;
  v16 = v9;
  v12 = v9;
  v13 = v7;
  objc_msgSend(v11, "CADPostSyntheticRouteHypothesis:forEventWithExternalURL:reply:", v12, v13, v14);

}

void __69__EKEventStore_postSyntheticRouteHypothesis_forEventWithExternalURL___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __69__EKEventStore_postSyntheticRouteHypothesis_forEventWithExternalURL___block_invoke_cold_1();
  }
}

- (id)beginCalDAVServerSimulationWithHostname:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (!v3)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.simulated.calendar.apple.com"), v7);
    v5 = objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  v4 = v3;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("simulated.calendar.apple.com")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.simulated.calendar.apple.com"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:

    v4 = (void *)v5;
  }
  objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginCalDAVServerSimulationWithHostname:", v4);

  return v4;
}

- (void)endCalDAVServerSimulation:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D1C3F8];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endCalDAVServerSimulationWithHostname:", v4);

}

- (BOOL)backupDatabaseToDestination:(id)a3 withFormat:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  _QWORD v20[5];
  _QWORD v21[5];
  id obj;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = v8;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__23;
  v27 = __Block_byref_object_dispose__23;
  v28 = 0;
  if (a4 != 2)
  {
    objc_msgSend(v8, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByDeletingLastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:", v14);
    -[EKEventStore connection](self, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "CADOperationProxySync");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke_472;
    v20[3] = &unk_1E4784F70;
    v20[4] = &v23;
    objc_msgSend(v17, "CADBackupDatabaseToFileNamed:inDirectory:includeAttachments:reply:", v13, v15, a4 == 1, v20);

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id *)(v24 + 5);
  obj = (id)v24[5];
  v12 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 0, 0, &obj);
  objc_storeStrong(v11, obj);

  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKEventStore backupDatabaseToDestination:withFormat:error:].cold.1();
      if (a5)
        goto LABEL_11;
    }
    else if (a5)
    {
LABEL_11:
      v18 = 0;
      *a5 = objc_retainAutorelease((id)v24[5]);
      goto LABEL_8;
    }
    v18 = 0;
    goto LABEL_8;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:", v9);
  -[EKEventStore connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "CADOperationProxySync");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke;
  v21[3] = &unk_1E4784F70;
  v21[4] = &v23;
  objc_msgSend(v15, "CADBackupToICBU:reply:", v13, v21);
LABEL_5:

  if (a5)
    *a5 = objc_retainAutorelease((id)v24[5]);
  v18 = v24[5] == 0;
LABEL_8:
  _Block_object_dispose(&v23, 8);

  return v18;
}

void __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke_cold_1();
  }
}

void __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke_472(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke_cold_1();
  }
}

- (void)_resetAndNotifyAfterDatabaseRestoreGenerationChanged
{
  -[EKEventStore _clearAllCaches](self, "_clearAllCaches");
  -[EKEventStore _postEventStoreChangedNotificationWithChangeType:changedObjectIDs:forceImmediate:](self, "_postEventStoreChangedNotificationWithChangeType:changedObjectIDs:forceImmediate:", 0, 0, 1);
}

- (BOOL)restoreDatabaseFromBackup:(id)a3 withFormat:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__23;
  v22 = __Block_byref_object_dispose__23;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__EKEventStore_restoreDatabaseFromBackup_withFormat_error___block_invoke;
  v17[3] = &unk_1E4788F90;
  v17[4] = self;
  v17[5] = &v18;
  v9 = (void *)MEMORY[0x1A85849D4](v17);
  if (a4 == 2)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v8, 1);
    -[EKEventStore connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CADOperationProxySync");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CADRestoreFromICBU:reply:", v10, v9);
  }
  else
  {
    objc_msgSend(v8, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v11, 1);
    -[EKEventStore connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CADOperationProxySync");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "CADRestoreFromDatabaseBackupFileNamed:inDirectory:includeAttachments:reply:", v10, v12, a4 == 1, v9);

  }
  v15 = (void *)v19[5];
  if (a5 && v15)
    *a5 = objc_retainAutorelease(v15);

  _Block_object_dispose(&v18, 8);
  return v15 == 0;
}

void __59__EKEventStore_restoreDatabaseFromBackup_withFormat_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v8;

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __59__EKEventStore_restoreDatabaseFromBackup_withFormat_error___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "databaseRestoreGenerationChangedByThisClient:", a3);

    objc_msgSend(*(id *)(a1 + 32), "_resetAndNotifyAfterDatabaseRestoreGenerationChanged");
  }
}

- (void)setDefaultCalendarForNewReminders:(id)a3
{
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT))
    -[EKEventStore setDefaultCalendarForNewReminders:].cold.1();
}

- (id)predicateForPreloadedIncompleteRemindersWithDueDate:(id)a3 calendars:(id)a4 sortOrder:(int)a5 preloadProperties:(id)a6
{
  return 0;
}

- (id)predicateForPreloadedIncompleteRemindersWithDueDate:(id)a3 calendars:(id)a4 sortOrder:(int)a5 preloadProperties:(id)a6 maxResults:(unint64_t)a7
{
  return 0;
}

- (id)predicateForPreloadedCompletedRemindersWithDueDate:(id)a3 calendars:(id)a4 sortOrder:(int)a5 preloadProperties:(id)a6
{
  return 0;
}

- (id)reminderObjectIDsMatchingPredicate:(id)a3
{
  return 0;
}

- (id)predicateForIncompleteRemindersAndRemindersCompletedAfter:(id)a3 inCalendar:(id)a4
{
  return 0;
}

- (id)predicateForRemindersWithTitle:(id)a3 listTitle:(id)a4 limitToCompletedOrIncomplete:(BOOL)a5 completed:(BOOL)a6 dueAfter:(id)a7 dueBefore:(id)a8 searchTerm:(id)a9 sortOrder:(int)a10 maxResults:(unint64_t)a11
{
  return 0;
}

- (NSHashTable)insertedObjects
{
  return self->_insertedObjects;
}

- (void)setInsertedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_insertedObjects, a3);
}

- (NSMutableSet)deletedObjects
{
  return self->_deletedObjects;
}

- (void)setDeletedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_deletedObjects, a3);
}

- (NSMutableSet)updatedObjects
{
  return self->_updatedObjects;
}

- (void)setUpdatedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_updatedObjects, a3);
}

- (NSMutableSet)uncommittableObjects
{
  return self->_uncommittableObjects;
}

- (void)setUncommittableObjects:(id)a3
{
  objc_storeStrong((id *)&self->_uncommittableObjects, a3);
}

- (NSMutableSet)objectsPendingSave
{
  return self->_objectsPendingSave;
}

- (void)setObjectsPendingSave:(id)a3
{
  objc_storeStrong((id *)&self->_objectsPendingSave, a3);
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (CADInMemoryChangeTimestamp)lastDatabaseNotificationTimestamp
{
  return self->_lastDatabaseNotificationTimestamp;
}

- (void)setLastDatabaseNotificationTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastDatabaseNotificationTimestamp, a3);
}

- (OS_dispatch_queue)calendarSourcesAndDefaultsQueue
{
  return self->_calendarSourcesAndDefaultsQueue;
}

- (OS_dispatch_queue)registeredQueue
{
  return self->_registeredQueue;
}

- (OS_dispatch_queue)unsavedChangesQueue
{
  return self->_unsavedChangesQueue;
}

- (OS_dispatch_queue)dbChangedQueue
{
  return self->_dbChangedQueue;
}

- (OS_dispatch_queue)notificationCollectionCacheQueue
{
  return self->_notificationCollectionCacheQueue;
}

- (EKSourceConstraints)_cachedDefaultConstraints
{
  return self->__cachedDefaultConstraints;
}

- (void)set_cachedDefaultConstraints:(id)a3
{
  objc_storeStrong((id *)&self->__cachedDefaultConstraints, a3);
}

- (NSMutableDictionary)_cachedNotificationCollections
{
  return self->__cachedNotificationCollections;
}

- (void)set_cachedNotificationCollections:(id)a3
{
  objc_storeStrong((id *)&self->__cachedNotificationCollections, a3);
}

- (NSMutableDictionary)registeredObjects
{
  return self->_registeredObjects;
}

- (void)setRegisteredObjects:(id)a3
{
  objc_storeStrong((id *)&self->_registeredObjects, a3);
}

- (BOOL)inboxRepliedSectionHasContent
{
  return self->_inboxRepliedSectionHasContent;
}

- (BOOL)allowsIntegrationModifications
{
  return self->_allowsIntegrationModifications;
}

- (void)setAllowsIntegrationModifications:(BOOL)a3
{
  self->_allowsIntegrationModifications = a3;
}

- (EKAlarm)defaultTimedAlarm
{
  return self->_defaultTimedAlarm;
}

- (EKAlarm)defaultAllDayAlarm
{
  return self->_defaultAllDayAlarm;
}

- (NSNumber)siriSuggestionsTimedAlarmOffset
{
  return self->_siriSuggestionsTimedAlarmOffset;
}

- (NSNumber)siriSuggestionsAllDayAlarmOffset
{
  return self->_siriSuggestionsAllDayAlarmOffset;
}

- (BOOL)skipModificationValidation
{
  return self->_skipModificationValidation;
}

- (void)setSkipModificationValidation:(BOOL)a3
{
  self->_skipModificationValidation = a3;
}

void __58__EKEventStore_Reminders__combinedReminderAndEventSources__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "Failed to fetch any event sources despite having access to events. Skipping reminder sources and returning 0 sources", a5, a6, a7, a8, 0);
}

void __58__EKEventStore_Reminders__combinedReminderAndEventSources__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "Failed to fetch any reminder sources despite having access to reminders. Skipping event sources and returning 0 sources", a5, a6, a7, a8, 0);
}

- (void)initWithEKOptions:(uint64_t)a1 path:(void *)a2 containerProvider:tccPermissionChecker:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:allowedSourceIdentifiers:.cold.1(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3898];
  v4 = a2;
  objc_msgSend(v3, "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v4, v7, "[%@] initialized in process: [%@]", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1_1();
}

void __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Data is not protected.  Saying that protected data became available.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __181__EKEventStore_initWithEKOptions_path_containerProvider_tccPermissionChecker_changeTrackingClientId_enablePropertyModificationLogging_allowDelegateSources_allowedSourceIdentifiers___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Data is protected.  Will not say that protected data became available.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __23__EKEventStore_dealloc__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error closing the database: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

+ (void)authorizationStatusWithAuditToken:entityType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Unexpected tcc_authorization_right_t (int value: %llu): we don't support this kind of authorization.", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)requestAccessToEntityType:desiredFullAccess:testing:synchronous:reason:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "Calling request access completion handler with invalid entity type error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __29__EKEventStore_sequenceToken__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting changes sequence token from daemon: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __53__EKEventStore_changesSinceSequenceToken_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting changes since sequence number from daemon: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)_invalidCADObjectIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v0, v1, "No object IDs given.  Will not validate object IDs: [%@]", v2);
  OUTLINED_FUNCTION_1_0();
}

void __37__EKEventStore__invalidCADObjectIDs___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error validating object IDs from daemon: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __37__EKEventStore__invalidCADObjectIDs___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "Got a not found error when validating an array of objectIDs. Assuming all are invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleExternalDatabaseChangeNotification:synchronously:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Not handling notification \"%@\" because there is no action for that notification name.", v2);
  OUTLINED_FUNCTION_1_0();
}

void __64__EKEventStore__databaseChangedExternally_processSynchronously___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v5, v6, "Error getting changed object IDs since timestamp %{public}@ from daemon: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __63__EKEventStore__checkPendingIntegrationEvents_changedIDsValid___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error getting events with uniqueId %@: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __36__EKEventStore_eventStoreIdentifier__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting UUID: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)_cacheSourceWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "Attempted to cache a source before _sources was initialized. Ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __36__EKEventStore__loadSourcesIfNeeded__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting sources: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __44__EKEventStore_sourcesEnabledForEntityType___block_invoke_cold_1(uint64_t *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *a1;
  v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v6, v7, "Invalid source type passed to sourcesEnabledForEntityType: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

void __33__EKEventStore__deletableSources__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting deletable sources: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __68__EKEventStore_getSubscribedCalendarsSourceCreateIfNeededWithError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to get scubscribed calendars source: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __61__EKEventStore_localBirthdayCalendarCreateIfNeededWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to get local birthday calendar: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)parentSourceForDelegateSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "parentSourceForDelegateSource called with non-delegate source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__EKEventStore_fetchGrantedDelegatesForSource_results___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting granted delegates list: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __63__EKEventStore_updateGrantedDelegate_action_source_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error updating granted delegate: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)isSourceManaged:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend(a2, "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v3, v5, "Cannot check whether source (%{public}@) is managed because we don't have access to the entity type it supports", v6);

  OUTLINED_FUNCTION_19_0();
}

void __32__EKEventStore_isSourceManaged___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "sourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rowID");
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138543874;
  v13 = v7;
  v14 = 1024;
  v15 = v9;
  v16 = 2112;
  v17 = v10;
  OUTLINED_FUNCTION_28(&dword_1A2318000, v6, v11, "Error checking whether source (%{public}@, rowID = %d) is managed: %@", (uint8_t *)&v12);

}

void __31__EKEventStore_dbStatsBySource__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting stats: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __47__EKEventStore_personaIdentifierForDatabaseID___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_16_1(&dword_1A2318000, v5, v6, "Error getting persona identifier for database %i: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

void __58__EKEventStore_hideCalendarsFromNotificationCenter_error___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = OUTLINED_FUNCTION_35(a1, a2);
  objc_msgSend(v3, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v8, v9, "Error clearing calendar %@ from notification center: %@", v10, v11, v12, v13, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_cacheCalendarWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "Attempted to cache a calendar before _calendars was initialized. Ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_cacheCalendarWithCADObjectID:withDefaultLoadedPropertyValues:forKeys:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Cached calendar has no calendarIdentifier: %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __38__EKEventStore__loadCalendarsIfNeeded__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting all calendars: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __35__EKEventStore__deletableCalendars__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting deletable calendars: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)saveCalendar:commit:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to save calendar: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_saveCalendar:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to save local source when attempting to enable events to save a new calendar: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeCalendar:commit:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to remove calendar: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __42__EKEventStore__eventWithEventIdentifier___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error getting event with identifier %@: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_eventWithURI:checkValid:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_25();
  v3 = CFSTR("x-apple-calevent");
  OUTLINED_FUNCTION_2_5(&dword_1A2318000, v0, v1, "Malformed event URI (%@) passed to _eventWithURI. Expected scheme: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __41__EKEventStore__eventWithURI_checkValid___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error getting calendar item with URI %@: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __54__EKEventStore_eventForUID_occurrenceDate_checkValid___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error checking for existence of event in eventForUID: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)eventForObjectID:occurrenceDate:checkValid:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Error: objectID provided is nil or has the wrong entity type %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __59__EKEventStore_eventForObjectID_occurrenceDate_checkValid___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error checking for existence of event in eventForObjectID: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __49__EKEventStore_eventWithUniqueId_occurrenceDate___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error getting event with uniqueId %@: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __45__EKEventStore_eventWithUUID_occurrenceDate___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error getting calendar item with UUID %@: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __74__EKEventStore__entityWrappersForEventUUIDs_inCalendars_propertiesToLoad___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error getting entity wrappers for event uuids %@: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __53__EKEventStore_allEventsWithUniqueId_occurrenceDate___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error getting all events with uniqueId %@: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)saveEvent:span:commit:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to save event: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeEvent:span:commit:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to remove event: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __52__EKEventStore_setInvitationStatus_forEvents_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error setting invitation status for event: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __96__EKEventStore__importEventsWithExternalIDs_fromICSData_intoCalendarsWithIDs_options_batchSize___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error importing ICS data into calendars %@: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __36__EKEventStore_defaultLocalCalendar__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting default local calendar: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)defaultCalendarForNewEventsInDelegateSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "Non-delegate sources do not have their own default calendar.  Pass nil to get the default across all non-delegate sources", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__EKEventStore_defaultCalendarForNewEventsInDelegateSource___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting default calendar for new events: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)setDefaultCalendar:forNewEventsInDelegateSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "The default calendar cannot be an integration calendar", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setDefaultCalendar:forNewEventsInDelegateSource:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "A delegate source's default calendar must be one of its own calendars.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setDefaultCalendar:forNewEventsInDelegateSource:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "You cannot set a default calendar on a non-delegate source.  Pass nil to set the default across all non-delegate sources", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__EKEventStore_setDefaultCalendar_forNewEventsInDelegateSource___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error setting default calendar for new events: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)_saveDraftOfEvent:(uint64_t)a1 toDirectory:(void *)a2 withVersion:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "changeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "summary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 136315906;
  v10 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
  v11 = 2112;
  v12 = a1;
  v13 = 2112;
  v14 = a2;
  v15 = 2112;
  v16 = v7;
  OUTLINED_FUNCTION_33(&dword_1A2318000, v5, v8, "%s: Failed to serialize changeset. Error: [%@]. Event [%@]. Changeset: [%@]", (uint8_t *)&v9);

}

- (void)_saveDraftOfEvent:toDirectory:withVersion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_22(&dword_1A2318000, v0, v1, "%s: Can't create draft event directory %@ with error %@", v2);
  OUTLINED_FUNCTION_19_0();
}

- (void)_saveDraftOfEvent:toDirectory:withVersion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[EKEventStore _saveDraftOfEvent:toDirectory:withVersion:]";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v0, v1, "%s: Creating directory at path %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2_5(&dword_1A2318000, v0, v1, "%s: Unable to read data from path %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_22(&dword_1A2318000, v0, v1, "%s: Failed to deserialize changeset. Error: [%@]. Data: [%@]", v2);
  OUTLINED_FUNCTION_19_0();
}

- (void)_loadDraftOfEventWithOccurrenceID:(void *)a1 fromDirectory:withVersion:.cold.3(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "summary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v1, v3, "%s: Made changeset from diff: %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_19_0();
}

- (void)_loadDraftOfEventWithOccurrenceID:(void *)a1 fromDirectory:withVersion:.cold.4(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "summaryString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v1, v3, "%s: Computed diff from existing event: %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_19_0();
}

- (void)_loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[EKEventStore _loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:]";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v0, v1, "%s: Found existing event: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_loadDraftOfEventWithOccurrenceID:fromDirectory:withVersion:.cold.6()
{
  __int16 v0;
  NSObject *v1;
  int v2[8];
  __int16 v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_15_0();
  v3 = v0;
  v4 = CFSTR("3.0");
  OUTLINED_FUNCTION_33(&dword_1A2318000, v1, (uint64_t)v1, "%s: Draft at path %@ has incorrect version (%@ vs %@).  Deleting", (uint8_t *)v2);
}

- (void)_deleteDraft:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[EKEventStore _deleteDraft:]";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v0, v1, "%s: Removed file at path %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_deleteDraft:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_22(&dword_1A2318000, v0, v1, "%s: Failed to remove file from path %@ with error %@", v2);
  OUTLINED_FUNCTION_19_0();
}

- (void)saveReminder:commit:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to save reminder: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_saveReminder:commit:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "Can't save reminder either because you have no access or you're trying to save using the legacy store, which is no longer supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)removeReminder:commit:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to remove reminder: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)reminderWithExternalURI:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Malformed event URI passed to _reminderWithURI: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)reminderWithExternalURI:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_25();
  v3 = CFSTR("x-apple-reminderkit");
  OUTLINED_FUNCTION_2_5(&dword_1A2318000, v0, v1, "Malformed event URI (%@) passed to _reminderWithURI. Expected scheme: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __51__EKEventStore_eventsWithSameRecurrenceSetAsEvent___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = OUTLINED_FUNCTION_35(a1, a2);
  objc_msgSend(v3, "recurrenceSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v8, v9, "Error getting events with reurrenceSet %@: %@", v10, v11, v12, v13, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __61__EKEventStore_calendarItemsWithUniqueIdentifier_inCalendar___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error getting events with unique identifier %@: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)accessGrantedForEntityType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Invalid entity type in accessGrantedForEntityType: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __84__EKEventStore_closestCachedOccurrenceToDate_forEventObjectID_prefersForwardSearch___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v4 = a1;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  LODWORD(v5) = objc_msgSend(v5, "rowID");
  LODWORD(v4) = objc_msgSend(*(id *)(v4 + 32), "databaseID");
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109634;
  v8[1] = (_DWORD)v5;
  v9 = 1024;
  v10 = v4;
  v11 = 2112;
  v12 = v7;
  _os_log_error_impl(&dword_1A2318000, v6, OS_LOG_TYPE_ERROR, "Error getting closest occurrence date for event with row ID %i, databaseID %i : %@", (uint8_t *)v8, 0x18u);

  OUTLINED_FUNCTION_1_1();
}

void __53__EKEventStore_countOfEventsFromStartDate_toEndDate___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error asking daemon to count occurrences: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __50__EKEventStore_doEvents_haveOccurrencesAfterDate___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error asking daemon if events have occurrences after date: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)calendarWithExternalURI:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Malformed calendar URI passed to calendarWithExternalURI: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __56__EKEventStore_uniqueIdentifiersForEventsWithObjectIDs___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A2318000, a2, a3, "Error fetching unique identifiers: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __30__EKEventStore_syncErrorCount__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Could not fetch error count: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __43__EKEventStore_eventsWithErrorsPerSourceID__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Could not fetch errors by source: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __63__EKEventStore_colorWithProviderIdentifier_externalIdentifier___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Could not fetch color: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __64__EKEventStore_occurrenceCacheGetOccurrencesForCalendars_onDay___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error getting occurrence cache occurrences for calendars %@ from daemon: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __63__EKEventStore_occurrenceCacheGetOccurrenceCountsForCalendars___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error getting occurrence cache counts for calendars %@ from daemon: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __38__EKEventStore_setShowDeclinedEvents___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_16_1(&dword_1A2318000, v5, v6, "The setting for showing declined events was not successfully set to %{BOOL}d.  Error: [%@]", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

void __42__EKEventStore_setShowCompletedReminders___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_16_1(&dword_1A2318000, v5, v6, "The setting for showing completed reminders was not successfully set to %{BOOL}d.  Error: [%@]", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

void __38__EKEventStore_rebuildOccurrenceCache__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "The occurrence cache was rebuilt successfully.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__EKEventStore_rebuildOccurrenceCache__block_invoke_cold_2(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v1, v4, "The occurrence cache was not rebuilt successfully.  Error: [%@]", v5);

  OUTLINED_FUNCTION_1_1();
}

void __39__EKEventStore_birthdayCalendarEnabled__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "%s: Failed find out if birthday calendars are enabled with error %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __43__EKEventStore_setBirthdayCalendarEnabled___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "%s: Unable to set birthday calendars enabled with error %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __39__EKEventStore_birthdayCalendarVersion__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "%s: Failed find out birthday calendar version with error %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __43__EKEventStore_setBirthdayCalendarVersion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[EKEventStore setBirthdayCalendarVersion:]_block_invoke";
  v9 = 1024;
  v10 = v3;
  v11 = 2112;
  v12 = v5;
  OUTLINED_FUNCTION_28(&dword_1A2318000, v2, v6, "%s: Unable to set birthday calendars version to %d with error %@", (uint8_t *)&v7);

}

void __38__EKEventStore_suggestedEventCalendar__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "%s: Failed to get the Found in Mail calendar with error %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __44__EKEventStore_insertSuggestedEventCalendar__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "%s: Could not insert the Found in Mail calendar with error %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __44__EKEventStore_removeSuggestedEventCalendar__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "%s: Could not remove the Found in Mail calendar with error %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)confirmSuggestedEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[EKEventStore confirmSuggestedEvent:]";
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, a1, a3, "%s - event has no suggestions key", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __38__EKEventStore_confirmSuggestedEvent___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[EKEventStore confirmSuggestedEvent:]_block_invoke_2";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2_5(&dword_1A2318000, v0, v1, "%s - confirmEventByRecordId failed with error %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)acceptSuggestedEvent:(NSObject *)a3 placeOnCalendar:.cold.1(char a1, uint64_t a2, NSObject *a3)
{
  const __CFString *v3;
  _BYTE v4[24];

  v3 = CFSTR("FAILED");
  *(_QWORD *)&v4[4] = "-[EKEventStore acceptSuggestedEvent:placeOnCalendar:]";
  *(_DWORD *)v4 = 136315650;
  *(_WORD *)&v4[12] = 2112;
  if ((a1 & 1) != 0)
    v3 = CFSTR("succeeded");
  *(_QWORD *)&v4[14] = v3;
  *(_WORD *)&v4[22] = 2112;
  OUTLINED_FUNCTION_29(&dword_1A2318000, a2, a3, "%s - promoting saveEvent %@ - had error %@", *(_QWORD *)v4, *(_QWORD *)&v4[8], *(_QWORD *)&v4[16], a2);
  OUTLINED_FUNCTION_19_0();
}

- (void)deleteSuggestedEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[EKEventStore deleteSuggestedEvent:]";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v0, v1, "%s - Notifying suggestions we have ignored event %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)deleteSuggestedEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[EKEventStore deleteSuggestedEvent:]";
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, a1, a3, "%s - event has no suggestions key", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)deleteSuggestedEvent:(NSObject *)a3 .cold.3(char a1, uint64_t a2, NSObject *a3)
{
  const __CFString *v3;
  _BYTE v4[24];

  v3 = CFSTR("FAILED");
  *(_QWORD *)&v4[4] = "-[EKEventStore deleteSuggestedEvent:]";
  *(_DWORD *)v4 = 136315650;
  *(_WORD *)&v4[12] = 2112;
  if ((a1 & 1) != 0)
    v3 = CFSTR("succeeded");
  *(_QWORD *)&v4[14] = v3;
  *(_WORD *)&v4[22] = 2112;
  OUTLINED_FUNCTION_29(&dword_1A2318000, a2, a3, "%s - removeEvent %@ - had error %@", *(_QWORD *)v4, *(_QWORD *)&v4[8], *(_QWORD *)&v4[16], a2);
  OUTLINED_FUNCTION_19_0();
}

void __37__EKEventStore_deleteSuggestedEvent___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[EKEventStore deleteSuggestedEvent:]_block_invoke_2";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2_5(&dword_1A2318000, v0, v1, "%s - rejectEventByRecordId failed with error %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

void __47__EKEventStore_canModifySuggestedEventCalendar__block_invoke_3_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error determining if the suggested event calendar is modifiable: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __53__EKEventStore_naturalLanguageSuggestedEventCalendar__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "%s: Failed to get the Natural Language Suggestions calendar with error %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __56__EKEventStore_sharedCalendarInvitationsForEntityTypes___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_1(&dword_1A2318000, v4, v5, "Error getting shared calendar invitations for entity types %i from daemon: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)respondToSharedCalendarInvitation:(uint64_t)a3 withStatus:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, a1, a3, "Error: calendar does not exist when calling respondToSharedCalendarInvitation. calendar: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __46__EKEventStore_resourceChangesForEntityTypes___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting resource changes: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __55__EKEventStore_markResourceChangeAlertedAndSave_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Error marking resource change alerted: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __134__EKEventStore_eventNotificationsAfterDate_excludingUncheckedCalendars_filteredByShowsNotificationsFlag_earliestExpiringNotification___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "EKEventStore: Can't get event notification information. Error: [%@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __75__EKEventStore_eventNotificationCountExcludingUncheckedCalendars_expanded___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "EKEventStore: Can't get event notification count. Error: [%@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __40__EKEventStore_inboxRepliedSectionItems__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting replied event invitation information: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __35__EKEventStore_attachmentWithUUID___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error fetching attachment with UUID. UUID: [%{public}@].  Error: [%@]", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __49__EKEventStore__refreshDASource_isUserRequested___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error refreshing source: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)_addFetchedObjectWithID:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  OUTLINED_FUNCTION_9_0(a1);
  v4[0] = 67109376;
  v4[1] = objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "entityType");
  v5 = 1024;
  v6 = objc_msgSend(a2, "rowID");
  _os_log_fault_impl(&dword_1A2318000, v2, OS_LOG_TYPE_FAULT, "Unknown entity type: %d for object with rowid: %d", (uint8_t *)v4, 0xEu);

  OUTLINED_FUNCTION_1_1();
}

- (void)objectWithIDExists:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "No object ID provided.  Will not find out if the object exists.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __35__EKEventStore_objectWithIDExists___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error encountered while checking for existence of object with ID: [%@]  Error: [%@]", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)commit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to commit: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)commitWithRollback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Rolling back changes after commit error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_commitObjectsWithIdentifiers:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Client not allowed to modify the calendar database.  Will not commit.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_commitObjectsWithIdentifiers:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v0, v1, "Attempting to commit changes in event store: [%@].", v2);
  OUTLINED_FUNCTION_1_0();
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[EKEventStore _commitObjectsWithIdentifiers:error:]_block_invoke_2";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2_5(&dword_1A2318000, v0, v1, "%s - deleteEventByRecordId failed with error %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_4_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_3();
  v4 = 2114;
  v5 = v0;
  OUTLINED_FUNCTION_2_5(&dword_1A2318000, v1, v2, "Failed to delete %{public}@ update/insert %{public}@", v3);
  OUTLINED_FUNCTION_1_0();
}

void __52__EKEventStore__commitObjectsWithIdentifiers_error___block_invoke_4_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Error committing event store: [%@]", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_fetchProperties:forObjects:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_2_5(&dword_1A2318000, v1, (uint64_t)v1, "Got the wrong number of entity wrappers back; asked for %lud things but got %lud",
    v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)addPendingIntegrationEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "New integration events without identifiers cannot be matched with their permanent events.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addPendingIntegrationEvent:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "privacySafeIntegrationEventDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v1, v3, "Adding pending integration event: %{public}@", v4);

  OUTLINED_FUNCTION_19_0();
}

void __45__EKEventStore_requestIntegrationCatchupSync__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error requesting catchup sync: [%@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)eventsMatchingPredicate:.cold.1()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_9_0(v1);
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v0, v2, "%ld events were found for predicate: %@", v3);

  OUTLINED_FUNCTION_1_1();
}

- (void)enumerateEventsMatchingPredicate:usingBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v0, v1, "Enumeration attempt for events that were fetched is complete.  Predicate: [%@]", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)cancelFetchRequest:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  id v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9_0(a1);
  OUTLINED_FUNCTION_7_0();
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  v3 = v2;
  _os_log_fault_impl(&dword_1A2318000, v1, OS_LOG_TYPE_FAULT, "Invalid fetchIdentifier given to cancelFetchRequest. Type: %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_19_0();
}

void __30__EKEventStore_alarmWithUUID___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error fetching alarm with UUID.  UUID: [%@].  Error: [%@]", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __36__EKEventStore_alarmWithExternalID___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error fetching alarm with externalID.  externalID: [%@].  Error: [%@]", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __46__EKEventStore_alarmOccurrencesFromAlarmCache__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting alarm occurrences in range: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)predicateForPotentialTravelEventsInCalendars:startDate:endDate:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_9_0(v1);
  OUTLINED_FUNCTION_26();
  _NSMethodExceptionProem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v3, v4, "%@: Error building fetch predicate for 'Time to Leave' events. End date is nil.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)predicateForPotentialTravelEventsInCalendars:startDate:endDate:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_9_0(v1);
  OUTLINED_FUNCTION_26();
  _NSMethodExceptionProem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v3, v4, "%@: Error building fetch predicate for 'Time to Leave' events. Start date is nil.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)predicateForUpNextEventsInCalendars:startDate:endDate:startDateRestrictionThreshold:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_9_0(v1);
  OUTLINED_FUNCTION_26();
  _NSMethodExceptionProem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v3, v4, "%@: Error building fetch predicate for 'Up Next' events. End date is nil.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)predicateForUpNextEventsInCalendars:startDate:endDate:startDateRestrictionThreshold:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_9_0(v1);
  OUTLINED_FUNCTION_26();
  _NSMethodExceptionProem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v3, v4, "%@: Error building fetch predicate for 'Up Next' events. Start date is nil.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __54__EKEventStore_timeToLeaveLocationAuthorizationStatus__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error fetching location authorization status for TTL: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __64__EKEventStore_registerForDetailedChangeTrackingInSource_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Error registering for detailed change tracking: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __52__EKEventStore_unregisterForDetailedChangeTracking___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Error unregistering for detailed change tracking: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_processChangedObjectIDsWithErrorCode:(void *)a1 changesTruncated:latestToken:changeData:resultHandler:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error fetching changed object IDs: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)markChangedObjectIDsConsumedUpToToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "A client is passing a token other than the one it most recently fetched to -markChangedObjectIDsConsumedUpToToken:. That's no longer supported.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__EKEventStore_consumeAllChangesUpToToken___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error marking changed object IDs as consumed: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __39__EKEventStore_defaultTimedAlarmOffset__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting defaultTimedAlarmOffset: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __40__EKEventStore_defaultAllDayAlarmOffset__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting _defaultAllDayAlarmOffset: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __30__EKEventStore_purgeChangelog__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error in call to _saveWithoutNotify: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)cachedConstraintsForSource:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "sourceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v1, v3, "Cannot get source constraints for source %{public}@ because we don't have access to the entity type it supports", v4);

  OUTLINED_FUNCTION_19_0();
}

- (void)cachedConstraintsForCalendar:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_31(&dword_1A2318000, v0, v1, "Shouldn't call cachedConstraintsForCalendar for new created calendar in limited access, since calendar creation is forbidden in limited access", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)cachedConstraintsForEventOrSourceWithCADObjectID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "This method (cachedConstraintsForEventOrSourceWithCADObjectID:) doesn't intend to handle an event if the client isn't in limited access mode. Use a source instead.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)cacheConstraints:forObjectWithCADObjectID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "Error caching constraints for objectWithCADObjectID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__EKEventStore__fetchConstraintsForObjectWithCADObjectID___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting constraints for source: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __79__EKEventStore__fetchPersistentNotificationCollectionForSourceWithCADObjectID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "NotificationCollectionID requested when it has not yet been created. SourceID: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __79__EKEventStore__fetchPersistentNotificationCollectionForSourceWithCADObjectID___block_invoke_cold_2(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting notificationCollection for source: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __57__EKEventStore_shouldPermitOrganizerEmailFromJunkChecks___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error checking whether to permit email address: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __63__EKEventStore_shouldPermitOrganizerPhoneNumberFromJunkChecks___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error checking whether to permitted phone number: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __33__EKEventStore_fetchStorageUsage__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1A2318000, v4, v5, "Error getting storage usage: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __69__EKEventStore_postSyntheticRouteHypothesis_forEventWithExternalURL___block_invoke_cold_1()
{
  int v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[12];
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_3();
  v4 = 1024;
  v5 = v0;
  v6 = 2112;
  v7 = v1;
  OUTLINED_FUNCTION_28(&dword_1A2318000, v2, (uint64_t)v2, "Could not post synthetic route hypothesis for event with external url = %{public}@, error = %d, route hypothesis = %@", v3);
  OUTLINED_FUNCTION_19_0();
}

- (void)backupDatabaseToDestination:withFormat:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to create destination .icbu: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __61__EKEventStore_backupDatabaseToDestination_withFormat_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to backup: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __59__EKEventStore_restoreDatabaseFromBackup_withFormat_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Failed to restore: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)setDefaultCalendarForNewReminders:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_31(&dword_1A2318000, v0, v1, "Attempt to set the default calendar for new reminders using EventKit. This is unsupported. You must use ReminderKit.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
