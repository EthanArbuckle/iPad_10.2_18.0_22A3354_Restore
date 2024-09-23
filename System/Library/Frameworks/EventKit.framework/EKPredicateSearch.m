@implementation EKPredicateSearch

void __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  int v23;
  int v24;

  v5 = a3;
  if (a2)
  {
    v6 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke_cold_2(a1, a2, v6);
    v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_DWORD *)(v8 + 52);
    *(_DWORD *)(v8 + 52) = v9 + 1;
    objc_sync_exit(v7);

    if (v9 < 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_startProcessingWithCompletion:synchronous:processor:queue:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 68), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
      goto LABEL_12;
    }
    v10 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke_cold_1(v10);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke_55;
  v17[3] = &unk_1E47863C8;
  v12 = v5;
  v13 = *(_QWORD *)(a1 + 32);
  v18 = v12;
  v19 = v13;
  v21 = *(id *)(a1 + 56);
  v14 = v11;
  v20 = v14;
  v23 = a2;
  v22 = *(id *)(a1 + 48);
  v24 = *(_DWORD *)(a1 + 64);
  v15 = (void (**)(_QWORD))MEMORY[0x1A85849D4](v17);
  v16 = v15;
  if (*(_BYTE *)(a1 + 68))
    v15[2](v15);
  else
    dispatch_async(*(dispatch_queue_t *)(a1 + 40), v15);

LABEL_12:
}

void __66__EKPredicateSearch__startActualWithCompletion_synchronous_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  EKReminder *v14;
  void *v15;
  EKEvent *v16;
  void *v17;
  void *v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "loadedValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v12 = a1 + 32;
  objc_msgSend(*(id *)(v11 + 32), "registerFetchedObjectWithID:withDefaultLoadedPropertyKeys:values:", v9, v10, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (objc_msgSend(v9, "entityType") == 2)
    {
      v14 = (EKReminder *)v5;
      -[EKReminder occurrenceDate](v14, "occurrenceDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[EKEvent initWithPersistentObject:occurrenceDate:]([EKEvent alloc], "initWithPersistentObject:occurrenceDate:", v13, v15);
      if (v16)
      {
        -[EKReminder nextReminderOccurrenceDate](v14, "nextReminderOccurrenceDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          -[EKEvent _setNextCachedReminderOccurrenceDate:](v16, "_setNextCachedReminderOccurrenceDate:", v17);
        objc_msgSend(v6, "addObject:", v16);

      }
LABEL_13:

      goto LABEL_14;
    }
    if (objc_msgSend(v9, "entityType") == 3)
    {
      v14 = -[EKReminder initWithPersistentObject:]([EKReminder alloc], "initWithPersistentObject:", v13);
      if (v14)
        objc_msgSend(v6, "addObject:", v14);
      goto LABEL_13;
    }
  }
  else
  {
    v18 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __66__EKPredicateSearch__startActualWithCompletion_synchronous_queue___block_invoke_cold_1(v12, v18, (uint64_t)v9);
  }
LABEL_14:

}

void __37__EKPredicateSearch_runSynchronously__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __68__EKPredicateSearch__startActivityWithCompletion_synchronous_queue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "signpostStart");
  return objc_msgSend(*(id *)(a1 + 32), "_startActualWithCompletion:synchronous:queue:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)signpostStart
{
  NSObject *v3;
  os_signpost_id_t v4;
  char v5;
  NSPredicate *predicate;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[EKPredicateSearch signpostHandle](EKPredicateSearch, "signpostHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  v5 = objc_opt_respondsToSelector();
  predicate = self->_predicate;
  if ((v5 & 1) != 0)
  {
    +[EKPredicateSearch signpostHandle](EKPredicateSearch, "signpostHandle");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[NSPredicate beginSignpostWithHandle:signpostID:](predicate, "beginSignpostWithHandle:signpostID:");

  }
  else
  {
    -[NSPredicate predicateFormat](self->_predicate, "predicateFormat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKPredicateSearch signpostHandle](EKPredicateSearch, "signpostHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 138412546;
      v13 = (id)objc_opt_class();
      v14 = 2112;
      v15 = v7;
      v10 = v13;
      _os_signpost_emit_with_name_impl(&dword_1A2318000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v4, "EKPredicateSearch", "predicateClass=%@; predicateFormat=%@",
        buf,
        0x16u);

    }
  }
}

- (void)signpostEndWithError:(int)a3 count:(unint64_t)a4
{
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[EKPredicateSearch signpostHandle](EKPredicateSearch, "signpostHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);

  +[EKPredicateSearch signpostHandle](EKPredicateSearch, "signpostHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v11[0] = 67109376;
    v11[1] = a3;
    v12 = 2048;
    v13 = a4;
    _os_signpost_emit_with_name_impl(&dword_1A2318000, v10, OS_SIGNPOST_INTERVAL_END, v8, "EKPredicateSearch", "error=%i; foundItems=%lu",
      (uint8_t *)v11,
      0x12u);
  }

}

+ (id)signpostHandle
{
  if (signpostHandle_onceToken != -1)
    dispatch_once(&signpostHandle_onceToken, &__block_literal_global_44);
  return (id)signpostHandle_signpostHandle;
}

void __35__EKPredicateSearch_signpostHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(ekSubSystem, "EKPredicateSearch");
  v1 = (void *)signpostHandle_signpostHandle;
  signpostHandle_signpostHandle = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationToken, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong(&self->_callback, 0);
}

- (id)runSynchronously
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__12;
  v9 = __Block_byref_object_dispose__12;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__EKPredicateSearch_runSynchronously__block_invoke;
  v4[3] = &unk_1E47864C0;
  v4[4] = &v5;
  -[EKPredicateSearch _startActivityWithCompletion:synchronous:queue:](self, "_startActivityWithCompletion:synchronous:queue:", v4, 1, 0);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_startActivityWithCompletion:(id)a3 synchronous:(BOOL)a4 queue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[EKPredicateSearch _createOSActivity](self, "_createOSActivity");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__EKPredicateSearch__startActivityWithCompletion_synchronous_queue___block_invoke;
  block[3] = &unk_1E47863A0;
  v14 = v9;
  v15 = v8;
  v16 = a4;
  block[4] = self;
  v11 = v9;
  v12 = v8;
  os_activity_apply(v10, block);

}

- (id)_createOSActivity
{
  NSPredicate **p_predicate;
  const char *v3;
  void *v4;

  p_predicate = &self->_predicate;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = "CADEventPredicate";
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = "CADNotifiableEventsPredicate";
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v3 = "CADEventsForAssistantSearchPredicate";
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = "CADNotificationCenterVisibleEventsPredicate";
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v3 = "CADUnacknowledgedEventsPredicate";
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v3 = "CADUnalertedEventsPredicate";
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v3 = "CADRespondedEventsPredicate";
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v3 = "CADUpcomingEventsPredicate";
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v3 = "EKMasterEventsPredicate";
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v3 = "EKScheduleAgentClientEventsPredicate";
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v3 = "CADTravelEventsPredicate";
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v3 = "CADUpNextEventsPredicate";
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v3 = "CADContactEventsPredicate";
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v3 = "CADEventCreatedFromSuggestionPredicate";
                            }
                            else
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v3 = "CADCalendarItemsWithExternalIdentifierPredicate";
                              }
                              else
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v3 = "CADPropertySearchPredicate";
                                }
                                else
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v3 = "CADEventTimeWindowPredicate";
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v3 = "CADNaturalLanguageSuggestedEventsSearchPredicate";
                                    }
                                    else
                                    {
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v3 = "CADEventsForConferenceURLPredicate";
                                      }
                                      else
                                      {
                                        v4 = (void *)EKLogHandle;
                                        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
                                          -[EKPredicateSearch _createOSActivity].cold.1((uint64_t)p_predicate, v4);
                                        v3 = "Unknown Predicate Search";
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return _os_activity_create(&dword_1A2318000, v3, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (id)searchWithEntityClass:(Class)a3 predicate:(id)a4 store:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEntityClass:predicate:store:", a3, v9, v8);

  return v10;
}

- (EKPredicateSearch)initWithEntityClass:(Class)a3 predicate:(id)a4 store:(id)a5
{
  id v9;
  id v10;
  EKPredicateSearch *v11;
  EKPredicateSearch *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EKPredicateSearch;
  v11 = -[EKPredicateSearch init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_entityClass = a3;
    objc_storeStrong((id *)&v11->_predicate, a4);
    objc_storeStrong((id *)&v12->_store, a5);
  }

  return v12;
}

- (void)_startActualWithCompletion:(id)a3 synchronous:(BOOL)a4 queue:(id)a5
{
  _BOOL8 v5;
  NSPredicate *predicate;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v5 = a4;
  predicate = self->_predicate;
  v9 = a5;
  v10 = a3;
  -[NSPredicate defaultPropertiesToLoad](predicate, "defaultPropertiesToLoad");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__EKPredicateSearch__startActualWithCompletion_synchronous_queue___block_invoke;
  v13[3] = &unk_1E4786498;
  v13[4] = self;
  v14 = v11;
  v12 = v11;
  -[EKPredicateSearch _startProcessingWithCompletion:synchronous:processor:queue:](self, "_startProcessingWithCompletion:synchronous:processor:queue:", v10, v5, v13, v9);

}

- (void)_startProcessingWithCompletion:(id)a3 synchronous:(BOOL)a4 processor:(id)a5 queue:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  Class entityClass;
  Class v15;
  Class v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  int v29;
  BOOL v30;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(self->_cancellationToken, "unsignedIntValue");
  entityClass = self->_entityClass;
  if (entityClass == (Class)objc_opt_class())
  {
    v17 = 2;
  }
  else
  {
    v15 = self->_entityClass;
    if (v15 == (Class)objc_opt_class())
    {
      v17 = 3;
    }
    else
    {
      v16 = self->_entityClass;
      if (v16 == (Class)objc_opt_class())
      {
        v17 = 101;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Unknown entity type"), CFSTR("Didn't recognize entity class %@"), self->_entityClass);
        v17 = 0xFFFFFFFFLL;
      }
    }
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke;
  v25[3] = &unk_1E47863F0;
  v25[4] = self;
  v18 = v10;
  v27 = v18;
  v30 = v8;
  v19 = v11;
  v28 = v19;
  v20 = v12;
  v26 = v20;
  v29 = v13;
  v21 = (void *)MEMORY[0x1A85849D4](v25);
  -[EKEventStore connection](self->_store, "connection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v8)
    objc_msgSend(v22, "CADOperationProxySync");
  else
    objc_msgSend(v22, "CADOperationProxy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "CADDatabaseFetchCalendarItemsWithPredicate:entityType:fetchIdentifier:synchronous:reply:", self->_predicate, v17, v13, v8, v21);
}

- (void)terminate
{
  self->_finished = 1;
}

- (void)_startFetchObjectIDsActivityWithCompletion:(id)a3 synchronous:(BOOL)a4 queue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[EKPredicateSearch _createOSActivity](self, "_createOSActivity");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__EKPredicateSearch__startFetchObjectIDsActivityWithCompletion_synchronous_queue___block_invoke;
  block[3] = &unk_1E47863A0;
  v14 = v9;
  v15 = v8;
  v16 = a4;
  block[4] = self;
  v11 = v9;
  v12 = v8;
  os_activity_apply(v10, block);

}

uint64_t __82__EKPredicateSearch__startFetchObjectIDsActivityWithCompletion_synchronous_queue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "signpostStart");
  return objc_msgSend(*(id *)(a1 + 32), "_fetchObjectIDsActualWithCompletion:synchronous:queue:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke_55(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v5)
        objc_enumerationMutation(v2);
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 49))
        break;
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "eventAccessLevel", (_QWORD)v17);
  v8 = objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E60901FFFFFFFFLL);
  v9 = v7 != 2 || v8 == 0;
  if (!v9 && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "conformsToProtocol:", &unk_1EE697D20))
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 32);
    v12 = *(id *)(v10 + 24);
    objc_msgSend(v11, "objectsPendingCommit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "deletedObjectIDsPendingCommit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "expandWithObjectsPendingCommit:deletedObjectIDs:andResultArray:", v13, v14, *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 40), "filterSkippedReminders:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "signpostEndWithError:count:", *(unsigned int *)(a1 + 72), objc_msgSend(*(id *)(a1 + 48), "count"));
  v15 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v15 + 49))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v15 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend(*(id *)(v15 + 32), "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeCancellableRemoteOperation:", *(unsigned int *)(a1 + 76));

}

- (void)filterSkippedReminders:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[NSPredicate excludeSkippedReminders](self->_predicate, "excludeSkippedReminders")
    && -[EKEventStore showsIntegrations](self->_store, "showsIntegrations"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_66);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filterUsingPredicate:", v4);

  }
}

BOOL __44__EKPredicateSearch_filterSkippedReminders___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = !objc_msgSend(v2, "isReminderIntegrationEvent") || objc_msgSend(v2, "reminderOccurrenceType") != 1;

  return v3;
}

- (void)_fetchObjectIDsActualWithCompletion:(id)a3 synchronous:(BOOL)a4 queue:(id)a5
{
  -[EKPredicateSearch _startProcessingWithCompletion:synchronous:processor:queue:](self, "_startProcessingWithCompletion:synchronous:processor:queue:", a3, a4, &__block_literal_global_68, a5);
}

void __75__EKPredicateSearch__fetchObjectIDsActualWithCompletion_synchronous_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a2, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v6);
}

- (id)startWithCompletion:(id)a3 queue:(id)a4
{
  EKEventFetchRequestToken *v4;
  EKEventStore *store;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id cancellationToken;

  if (self->_isCancelled)
  {
    v4 = 0;
  }
  else
  {
    store = self->_store;
    v8 = a4;
    v9 = a3;
    -[EKEventStore connection](store, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "addCancellableRemoteOperation:", self);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    cancellationToken = self->_cancellationToken;
    self->_cancellationToken = v12;

    self->_retryCount = 0;
    -[EKPredicateSearch _startActivityWithCompletion:synchronous:queue:](self, "_startActivityWithCompletion:synchronous:queue:", v9, 0, v8);

    v4 = -[EKEventFetchRequestToken initWithEventStore:token:]([EKEventFetchRequestToken alloc], "initWithEventStore:token:", self->_store, v11);
  }
  return v4;
}

- (id)fetchObjectIDs
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__12;
  v9 = __Block_byref_object_dispose__12;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__EKPredicateSearch_fetchObjectIDs__block_invoke;
  v4[3] = &unk_1E47864C0;
  v4[4] = &v5;
  -[EKPredicateSearch _startFetchObjectIDsActivityWithCompletion:synchronous:queue:](self, "_startFetchObjectIDsActivityWithCompletion:synchronous:queue:", v4, 1, 0);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__EKPredicateSearch_fetchObjectIDs__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)cancel
{
  void *v3;
  void *v4;
  id cancellationToken;

  self->_isCancelled = 1;
  -[EKEventStore connection](self->_store, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CADOperationProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADDatabaseCancelFetchRequestWithIdentifier:", objc_msgSend(self->_cancellationToken, "unsignedIntValue"));

  cancellationToken = self->_cancellationToken;
  self->_cancellationToken = 0;

}

- (void)_createOSActivity
{
  NSObject *v2;
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl(&dword_1A2318000, v2, OS_LOG_TYPE_ERROR, "Unexpected predicate class: %@", (uint8_t *)&v4, 0xCu);

}

void __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "All retries exhausted for CADDatabaseFetchCalendarItemsWithPredicate", v1, 2u);
}

void __80__EKPredicateSearch__startProcessingWithCompletion_synchronous_processor_queue___block_invoke_cold_2(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 52) + 1;
  v4[0] = 67109632;
  v4[1] = a2;
  v5 = 1024;
  v6 = v3;
  v7 = 1024;
  v8 = 3;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Error (%d) in reply block for CADDatabaseFetchCalendarItemsWithPredicate attempt %d/%d", (uint8_t *)v4, 0x14u);
}

void __66__EKPredicateSearch__startActualWithCompletion_synchronous_queue___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v6 = 138412546;
  v7 = (id)objc_opt_class();
  v8 = 2112;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_1A2318000, v4, OS_LOG_TYPE_ERROR, "%@: failed to register result object with objectID: %@", (uint8_t *)&v6, 0x16u);

}

@end
