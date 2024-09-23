@implementation EDMessageRepository

uint64_t __60__EDMessageRepository__resetUpdateThrottlersWithLogMessage___block_invoke()
{
  return +[EDUpdateThrottler resetAllInstances](EDUpdateThrottler, "resetAllInstances");
}

- (void)messageListItemsForObjectIDs:(id)a3 requestID:(unint64_t)a4 observationIdentifier:(id)a5 loadSummaryForAdditionalObjectIDs:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  SEL v31;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = _os_activity_create(&dword_1D2F2C000, "-[EDMessageRepository messageListItemsForObjectIDs:requestID:observationIdentifier:loadSummaryForAdditionalObjectIDs:completionHandler:]", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v17, &state);
  objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v19, OS_SIGNPOST_INTERVAL_BEGIN, a4, "EDMessageRepositoryMessageListItems", "Received by maild", buf, 2u);
  }

  -[EDMessageRepository messageListItemScheduler](self, "messageListItemScheduler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __136__EDMessageRepository_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler___block_invoke;
  v25[3] = &unk_1E949EBD0;
  v25[4] = self;
  v30 = a4;
  v21 = v13;
  v26 = v21;
  v31 = a2;
  v22 = v14;
  v27 = v22;
  v23 = v15;
  v28 = v23;
  v24 = v16;
  v29 = v24;
  objc_msgSend(v20, "performBlock:", v25);

  os_activity_scope_leave(&state);
}

- (EFScheduler)messageListItemScheduler
{
  return self->_messageListItemScheduler;
}

void __136__EDMessageRepository_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __136__EDMessageRepository_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler___block_invoke_2;
  v7[3] = &unk_1E949EBD0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 72);
  v7[4] = v3;
  v7[1] = 3221225472;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 80);
  v8 = v5;
  v13 = v6;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  objc_msgSend(v2, "performDatabaseWorkInBlockWithHighPriority:", v7);

}

- (void)startCountingQuery:(id)a3 includingServerCountsForMailboxScope:(id)a4 withObserver:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  EDMessageCountQueryHandler *v15;
  void *v16;
  void *v17;
  EDMessageCountQueryHandler *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id from;
  id location;
  _QWORD v26[4];
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  -[EDMessageRepository _resetUpdateThrottlersWithLogMessage:](self, "_resetUpdateThrottlersWithLogMessage:", CFSTR("starting count query"));
  v14 = (void *)objc_opt_new();
  v15 = [EDMessageCountQueryHandler alloc];
  -[EDMessageRepository messagePersistence](self, "messagePersistence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepository hookRegistry](self, "hookRegistry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[EDMessageCountQueryHandler initWithQuery:serverCountMailboxScope:messagePersistence:hookRegistry:observer:](v15, "initWithQuery:serverCountMailboxScope:messagePersistence:hookRegistry:observer:", v10, v11, v16, v17, v12);
  objc_msgSend(v14, "addCancelable:", v18);

  v19 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __110__EDMessageRepository_startCountingQuery_includingServerCountsForMailboxScope_withObserver_completionHandler___block_invoke;
  v26[3] = &unk_1E949AEB8;
  v20 = v12;
  v27 = v20;
  objc_msgSend(v14, "addCancelationBlock:", v26);
  os_unfair_lock_lock(&self->_handlersLock);
  -[NSMutableSet addObject:](self->_handlerTokens, "addObject:", v14);
  os_unfair_lock_unlock(&self->_handlersLock);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v14);
  v21[0] = v19;
  v21[1] = 3221225472;
  v21[2] = __110__EDMessageRepository_startCountingQuery_includingServerCountsForMailboxScope_withObserver_completionHandler___block_invoke_2;
  v21[3] = &unk_1E949E7A0;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  objc_msgSend(v14, "addCancelationBlock:", v21);
  v13[2](v13, v14);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

void __136__EDMessageRepository_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  os_unfair_lock_s *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  _QWORD aBlock[5];
  id v59;
  id v60;
  uint64_t v61;
  uint8_t v62[128];
  uint8_t buf[4];
  _BYTE v64[10];
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v3, OS_SIGNPOST_EVENT, v4, "EDMessageRepositoryMessageListItems", "Inside async block", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_resetUpdateThrottlersWithLogMessage:", CFSTR("requesting message list items"));
  objc_msgSend(*(id *)(a1 + 32), "_partitionObjectIDs:", *(_QWORD *)(a1 + 40));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__EDMessageRepository_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler___block_invoke_219;
  aBlock[3] = &unk_1E949EBA8;
  v6 = *(_QWORD *)(a1 + 32);
  v61 = *(_QWORD *)(a1 + 80);
  aBlock[4] = v6;
  v52 = v51;
  v59 = v52;
  v7 = v5;
  v60 = v7;
  v49 = _Block_copy(aBlock);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v50, "threadObjectIDsByScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_enumerateObjectIDsByScope:usingBlock:", v9, v49);

  objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 72);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v11, OS_SIGNPOST_EVENT, v12, "EDMessageRepositoryMessageListItems", "Finished enumerating objectIDs by scope", buf, 2u);
  }

  objc_msgSend(v50, "messageObjectIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "messageObjectIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    objc_msgSend(v15, "messagesForMessageObjectIDs:missedMessageObjectIDs:", v16, &v57);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v57;

    objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = *(_QWORD *)(a1 + 72);
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v20, OS_SIGNPOST_EVENT, v21, "EDMessageRepositoryMessageListItems", "Fetched messages from message persistence", buf, 2u);
    }

    objc_msgSend(v52, "addObjectsFromArray:", v17);
    objc_msgSend(v7, "addEntriesFromDictionary:", v18);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    v22 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 20);
    os_unfair_lock_lock(v22);
    objc_msgSend(*(id *)(a1 + 32), "queryHandlers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v24 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v22);
    v25 = (void *)v24;
  }
  else
  {
    v25 = 0;
  }
  v47 = v25;
  objc_msgSend(*(id *)(a1 + 32), "_requestSummariesIfNeededForMessageListItems:additionalObjectIDs:queryHandler:observationIdentifier:", v52, *(_QWORD *)(a1 + 56));
  v26 = objc_msgSend(v52, "count");
  v27 = objc_msgSend(v7, "count");
  if (v27 + v26 != objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v48 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v52, "ef_compactMapSelector:", sel_objectID);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "removeObjectsInArray:", v28);

    objc_msgSend(v7, "allKeys");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "removeObjectsInArray:", v29);

    +[EDMessageRepository log](EDMessageRepository, "log");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v44 = objc_msgSend(*(id *)(a1 + 40), "count");
      v45 = objc_msgSend(v52, "count");
      v46 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)v64 = v44;
      *(_WORD *)&v64[8] = 2048;
      v65 = v45;
      v66 = 2048;
      v67 = v46;
      v68 = 2114;
      v69 = v48;
      _os_log_error_impl(&dword_1D2F2C000, v30, OS_LOG_TYPE_ERROR, "Incorrect number of message list items (expected %lu, got %lu results + %lu missed). Unaccounted for: %{public}@", buf, 0x2Au);
    }

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v31 = v48;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v54 != v33)
            objc_enumerationMutation(v31);
          v35 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Failed to find message list item or \"missing\" reason"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, v35);

        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v32);
    }

  }
  if (!objc_msgSend(v52, "count"))
  {

    v52 = 0;
  }
  if (!objc_msgSend(v7, "count"))
  {

    v7 = 0;
  }
  +[EDMessageRepository log](EDMessageRepository, "log");
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    -[EDMessageRepository _descriptionStringForMessageListItems:](*(id *)(a1 + 32), v52);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v64 = v38;
    *(_WORD *)&v64[8] = 2114;
    v65 = (uint64_t)v7;
    _os_log_impl(&dword_1D2F2C000, v37, OS_LOG_TYPE_DEFAULT, "Returning results: %{public}@, missed objects: %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = v39;
  v41 = *(_QWORD *)(a1 + 72);
  if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    v42 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v52, "count"));
    v43 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v7, "count"));
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v64 = v42;
    *(_WORD *)&v64[4] = 1026;
    *(_DWORD *)&v64[6] = v43;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v40, OS_SIGNPOST_INTERVAL_END, v41, "EDMessageRepositoryMessageListItems", "Finished processing %{public, name=results}u %{public, name=missedObjectIDs}u", buf, 0xEu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_resetUpdateThrottlersWithLogMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDMessageRepository updateThrottlerResetBlock](self, "updateThrottlerResetBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[EDMessageRepository log](EDMessageRepository, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_INFO, "Already resetting all update throttlers, skipping reset due to %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    +[EDMessageRepository log](EDMessageRepository, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "Resetting all update throttlers due to %{public}@", (uint8_t *)&v9, 0xCu);
    }

    v6 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_BACKGROUND, 0, &__block_literal_global_347);
    -[EDMessageRepository setUpdateThrottlerResetBlock:](self, "setUpdateThrottlerResetBlock:", v6);
    -[EDMessageRepository updateThrottlerResetScheduler](self, "updateThrottlerResetScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performBlock:", v6);

  }
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EDMessageRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_56 != -1)
    dispatch_once(&log_onceToken_56, block);
  return (OS_os_log *)(id)log_log_56;
}

- (id)updateThrottlerResetBlock
{
  return objc_loadWeakRetained(&self->_updateThrottlerResetBlock);
}

- (EFScheduler)updateThrottlerResetScheduler
{
  return self->_updateThrottlerResetScheduler;
}

- (NSMutableDictionary)queryHandlers
{
  return self->_queryHandlers;
}

- (id)_partitionObjectIDs:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _EDPartitionedObjectIDs *v13;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v15;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[EDMessageRepository _threadScopeFromObjectID:](self, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "addObject:", v9);
          }
          else
          {
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v9, 0);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v16, "addObject:", v9);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v13 = -[_EDPartitionedObjectIDs initWithMessageObjectIDs:threadObjectIDsByScope:]([_EDPartitionedObjectIDs alloc], "initWithMessageObjectIDs:threadObjectIDsByScope:", v16, v4);
  return v13;
}

- (id)_threadScopeFromObjectID:(void *)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "threadScope");
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_enumerateObjectIDsByScope:(id)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__EDMessageRepository__enumerateObjectIDsByScope_usingBlock___block_invoke;
  v11[3] = &unk_1E949EB58;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __61__EDMessageRepository__enumerateObjectIDsByScope_usingBlock___block_invoke_2;
  v9[3] = &unk_1E949EB80;
  v9[4] = self;
  v10 = v12;
  v8 = v12;
  -[EDMessageRepository _enumerateObjectIDsAndQueryHandlersForObjectIDsByScope:usingBlock:failureBlock:](self, "_enumerateObjectIDsAndQueryHandlersForObjectIDsByScope:usingBlock:failureBlock:", a3, v11, v9);

}

- (void)_enumerateObjectIDsAndQueryHandlersForObjectIDsByScope:(id)a3 usingBlock:(id)a4 failureBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__EDMessageRepository__enumerateObjectIDsAndQueryHandlersForObjectIDsByScope_usingBlock_failureBlock___block_invoke;
  v12[3] = &unk_1E949EB30;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v12);

}

- (id)_descriptionStringForMessageListItems:(id)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB37A0]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("messageListItems.count:%u items:(\n"), objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v3, "count")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__EDMessageRepository__descriptionStringForMessageListItems___block_invoke;
    v10[3] = &unk_1E949EBF8;
    v7 = v6;
    v11 = v7;
    v12 = v3;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v10);
    objc_msgSend(v7, "appendString:", CFSTR(")"));
    v8 = v12;
    a1 = v7;

  }
  return a1;
}

- (void)_requestSummariesIfNeededForMessageListItems:(id)a3 additionalObjectIDs:(id)a4 queryHandler:(id)a5 observationIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  EDMessageRepository *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[EDMessageRepository asyncWorkScheduler](self, "asyncWorkScheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __123__EDMessageRepository__requestSummariesIfNeededForMessageListItems_additionalObjectIDs_queryHandler_observationIdentifier___block_invoke;
  v19[3] = &unk_1E949C5E8;
  v15 = v10;
  v20 = v15;
  v16 = v11;
  v21 = v16;
  v17 = v12;
  v22 = v17;
  v18 = v13;
  v23 = v18;
  v24 = self;
  objc_msgSend(v14, "performBlock:", v19);

}

- (EFScheduler)asyncWorkScheduler
{
  return self->_asyncWorkScheduler;
}

- (void)setUpdateThrottlerResetBlock:(id)a3
{
  objc_storeWeak(&self->_updateThrottlerResetBlock, a3);
}

void __102__EDMessageRepository__enumerateObjectIDsAndQueryHandlersForObjectIDsByScope_usingBlock_failureBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  os_unfair_lock_s *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  id obj;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v21 = a3;
  v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 20);
  os_unfair_lock_lock(v6);
  v27 = a1;
  v20 = v5;
  objc_msgSend(*(id *)(a1 + 32), "queryHandlersByThreadScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v8, "copy");

  os_unfair_lock_unlock(v6);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v21;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v23 = *(_QWORD *)v33;
    do
    {
      v10 = 0;
      v25 = v9;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(obj);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v11 = v24;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        v26 = v10;
        if (v12)
        {
          v13 = 0;
          v14 = 0;
          v15 = *(_QWORD *)v29;
          while (2)
          {
            v16 = 0;
            v17 = v13;
            v18 = v14;
            do
            {
              if (*(_QWORD *)v29 != v15)
                objc_enumerationMutation(v11);
              v13 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * v16);

              v19 = (*(uint64_t (**)(void))(*(_QWORD *)(v27 + 40) + 16))();
              v14 = v18;

              if (v19)
              {

                goto LABEL_18;
              }
              ++v16;
              v17 = v13;
              v18 = v14;
            }
            while (v12 != v16);
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v12)
              continue;
            break;
          }

        }
        else
        {
          v14 = 0;
        }

        v13 = 0;
        (*(void (**)(void))(*(_QWORD *)(v27 + 48) + 16))();
LABEL_18:

        v10 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v9);
  }

}

- (NSMutableDictionary)queryHandlersByThreadScope
{
  return self->_queryHandlersByThreadScope;
}

uint64_t __61__EDMessageRepository__enumerateObjectIDsByScope_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v13;
  char v14;

  v7 = a2;
  v8 = a3;
  v14 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = 0;
      objc_msgSend(v8, "messageListItemForObjectID:isPersisted:error:", v7, &v14, &v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      if (v9)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        v11 = 1;
        if (!a4)
          goto LABEL_8;
      }
      else
      {
        v11 = 0;
        if (!a4)
          goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  v11 = 0;
  v9 = 0;
  v10 = 0;
  if (a4)
LABEL_7:
    *a4 = objc_retainAutorelease(v10);
LABEL_8:

  return v11;
}

- (EDVIPManager)vipManager
{
  return self->_vipManager;
}

- (EDThreadPersistence)threadPersistence
{
  return self->_threadPersistence;
}

- (EDRemindMeNotificationController)remindMeNotificationController
{
  return self->_remindMeNotificationController;
}

- (EDResumable)observerResumer
{
  return self->_observerResumer;
}

void __26__EDMessageRepository_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_56;
  log_log_56 = (uint64_t)v1;

}

- (void)getURLCacheInformationWithCompletion:(id)a3
{
  void (**v4)(id, void *, uint64_t);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, uint64_t))a3;
  -[EDMessageRepository remoteContentCacheConfiguration](self, "remoteContentCacheConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cacheURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDMessageRepository log](EDMessageRepository, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Remote Content Cache URL: %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F068]), "initWithFileURL:readOnly:", v6, 1);
  -[EDMessageRepository remoteContentCacheConfiguration](self, "remoteContentCacheConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v8, objc_msgSend(v9, "diskCapacity"));

}

- (EDRemoteContentCacheConfiguration)remoteContentCacheConfiguration
{
  return self->_remoteContentCacheConfiguration;
}

void __123__EDMessageRepository__requestSummariesIfNeededForMessageListItems_additionalObjectIDs_queryHandler_observationIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  NSObject *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v37 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v7, "summary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 == 0;

        if (v9)
        {
          objc_msgSend(v7, "displayMessageObjectID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v10);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
    }
    while (v4);
  }

  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  +[EDMessageRepository log](EDMessageRepository, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(a1 + 56);
    v14 = objc_msgSend(v2, "count");
    v15 = objc_msgSend(*(id *)(a1 + 32), "count");
    v16 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 134219010;
    v43 = v13;
    v44 = 2114;
    v45 = v12;
    v46 = 2048;
    v47 = v14;
    v48 = 2048;
    v49 = v15;
    v50 = 2048;
    v51 = v16;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "queryHandler: %p for observation identifier: %{public}@. Requesting summary for (%lu/%lu) messages. summaryLoadObjectIDs: %lu.", buf, 0x34u);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v17 = v2;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(a1 + 48), "requestSummaryForMessageObjectID:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v18);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "messagePersistence");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    +[EDMessageRepository log](EDMessageRepository, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v43 = v22;
      v44 = 2048;
      v45 = v17;
      _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "No query handler found for observation identifier: %@. Requesting summary from messagePersistence %p", buf, 0x16u);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = v2;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v29;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v29 != v25)
            objc_enumerationMutation(v23);
          v27 = (id)objc_msgSend(v17, "requestSummaryForMessageObjectID:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k), (_QWORD)v28);
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v24);
    }

  }
}

void __61__EDMessageRepository__descriptionStringForMessageListItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;

  objc_msgSend(a2, "description");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "length");
  if ((unint64_t)(objc_msgSend(v8, "length") + v7) >> 16)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("    Max length reached. Omit %u items\n"), objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(*(id *)(a1 + 40), "count") - a3));
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("    %@\n"), v8);
  }

}

- (NSConditionLock)performQueryOnSerializationQueue
{
  return self->_performQueryOnSerializationQueue;
}

void __110__EDMessageRepository_startCountingQuery_includingServerCountsForMailboxScope_withObserver_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v2)
    {
      os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 5);
      objc_msgSend(*((id *)WeakRetained + 8), "removeObject:", v2);
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 5);
    }

  }
}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__EDMessageRepository_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_4 != -1)
    dispatch_once(&signpostLog_onceToken_4, block);
  return (id)signpostLog_log_4;
}

void __34__EDMessageRepository_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_4;
  signpostLog_log_4 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (EDMessageRepository)initWithMessagePersistence:(id)a3 conversationPersistence:(id)a4 threadPersistence:(id)a5 remoteContentPersistence:(id)a6 messageChangeManager:(id)a7 richLinkPersistence:(id)a8 attachmentPersistenceManager:(id)a9 categoryPersistence:(id)a10 senderPersistence:(id)a11 activityPersistence:(id)a12 businessPersistence:(id)a13 hookRegistry:(id)a14 mailboxPersistence:(id)a15 searchProvider:(id)a16 userProfileProvider:(id)a17 vipManager:(id)a18 fetchController:(id)a19 observerResumer:(id)a20 remoteContentManager:(id)a21 remoteContentCacheConfiguration:(id)a22 blockedSenderManager:(id)a23 listUnsubscribeHandler:(id)a24 remindMeNotificationController:(id)a25 accountsProvider:(id)a26
{
  EDMessageRepository *v31;
  EDMessageRepository *v32;
  NSMutableSet *v33;
  NSMutableSet *handlerTokens;
  NSMutableDictionary *v35;
  NSMutableDictionary *queryHandlers;
  uint64_t v37;
  EDCategoryCoreAnalyticsLogger *categoryAnalyticsLogger;
  uint64_t v39;
  NSConditionLock *performQueryOnSerializationQueue;
  NSObject *v41;
  NSObject *v42;
  dispatch_queue_t v43;
  OS_dispatch_queue *serializationQueue;
  NSMutableDictionary *v45;
  NSMutableDictionary *queryHandlersByThreadScope;
  uint64_t v47;
  EFScheduler *updateThrottlerResetScheduler;
  uint64_t v49;
  EFScheduler *asyncWorkScheduler;
  uint64_t v51;
  EFScheduler *messageListItemScheduler;
  NSObject *v53;
  NSObject *v54;
  dispatch_queue_t v55;
  OS_dispatch_queue *contentProtectionQueue;
  id v57;
  id v58;
  uint64_t v59;
  EFLocked *oneTimeCodeObservers;
  EMCoreAnalyticsCollector *v61;
  EMCoreAnalyticsCollector *analyticsCollector;
  uint64_t v63;
  NSUserDefaults *sharedOneTimeCodeUserDefaults;
  id v66;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v93;
  objc_super v94;

  v91 = a3;
  v90 = a4;
  v89 = a5;
  v68 = a6;
  v88 = a6;
  v87 = a7;
  v66 = a8;
  v86 = a8;
  v85 = a9;
  v93 = a10;
  v84 = a11;
  v83 = a12;
  v82 = a13;
  v81 = a14;
  v80 = a15;
  v79 = a16;
  v78 = a17;
  v77 = a18;
  v76 = a19;
  v75 = a20;
  v74 = a21;
  v73 = a22;
  v72 = a23;
  v71 = a24;
  v70 = a25;
  v69 = a26;
  v94.receiver = self;
  v94.super_class = (Class)EDMessageRepository;
  v31 = -[EDMessageRepository init](&v94, sel_init);
  v32 = v31;
  if (v31)
  {
    v31->_handlersLock._os_unfair_lock_opaque = 0;
    v33 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    handlerTokens = v32->_handlerTokens;
    v32->_handlerTokens = v33;

    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryHandlers = v32->_queryHandlers;
    v32->_queryHandlers = v35;

    objc_storeStrong((id *)&v32->_hookRegistry, a14);
    objc_storeStrong((id *)&v32->_messagePersistence, a3);
    objc_storeStrong((id *)&v32->_conversationPersistence, a4);
    objc_storeStrong((id *)&v32->_threadPersistence, a5);
    objc_storeStrong((id *)&v32->_remoteContentPersistence, v68);
    objc_storeStrong((id *)&v32->_messageChangeManager, a7);
    objc_storeStrong((id *)&v32->_categoryPersistence, a10);
    objc_msgSend(v93, "analyticsLogger");
    v37 = objc_claimAutoreleasedReturnValue();
    categoryAnalyticsLogger = v32->_categoryAnalyticsLogger;
    v32->_categoryAnalyticsLogger = (EDCategoryCoreAnalyticsLogger *)v37;

    objc_storeStrong((id *)&v32->_senderPersistence, a11);
    objc_storeStrong((id *)&v32->_businessPersistence, a13);
    objc_storeStrong((id *)&v32->_activityPersistence, a12);
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    performQueryOnSerializationQueue = v32->_performQueryOnSerializationQueue;
    v32->_performQueryOnSerializationQueue = (NSConditionLock *)v39;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v41 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v41, QOS_CLASS_USER_INITIATED, 0);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = dispatch_queue_create("com.apple.email.EDMessageRepository.serializationQueue", v42);
    serializationQueue = v32->_serializationQueue;
    v32->_serializationQueue = (OS_dispatch_queue *)v43;

    objc_storeStrong((id *)&v32->_mailboxPersistence, a15);
    objc_storeStrong((id *)&v32->_userProfileProvider, a17);
    objc_storeStrong((id *)&v32->_vipManager, a18);
    objc_storeStrong((id *)&v32->_searchProvider, a16);
    objc_storeStrong((id *)&v32->_fetchController, a19);
    objc_storeStrong((id *)&v32->_observerResumer, a20);
    objc_storeStrong((id *)&v32->_remoteContentManager, a21);
    objc_storeStrong((id *)&v32->_remoteContentCacheConfiguration, a22);
    objc_storeStrong((id *)&v32->_blockedSenderManager, a23);
    objc_storeStrong((id *)&v32->_listUnsubscribeHandler, a24);
    objc_storeStrong((id *)&v32->_remindMeNotificationController, a25);
    objc_storeStrong((id *)&v32->_richLinkPersistence, v66);
    objc_storeStrong((id *)&v32->_attachmentPersistenceManager, a9);
    v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryHandlersByThreadScope = v32->_queryHandlersByThreadScope;
    v32->_queryHandlersByThreadScope = v45;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.EDMessageRepository.updateThrottlerResetQueue"), 9);
    v47 = objc_claimAutoreleasedReturnValue();
    updateThrottlerResetScheduler = v32->_updateThrottlerResetScheduler;
    v32->_updateThrottlerResetScheduler = (EFScheduler *)v47;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.EDMessageRepository.asyncWorkScheduler"), 25);
    v49 = objc_claimAutoreleasedReturnValue();
    asyncWorkScheduler = v32->_asyncWorkScheduler;
    v32->_asyncWorkScheduler = (EFScheduler *)v49;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.EDMessageRepository.messageListItemScheduler"), 25);
    v51 = objc_claimAutoreleasedReturnValue();
    messageListItemScheduler = v32->_messageListItemScheduler;
    v32->_messageListItemScheduler = (EFScheduler *)v51;

    -[EDPersistenceHookRegistry registerAccountChangeHookResponder:](v32->_hookRegistry, "registerAccountChangeHookResponder:", v32);
    -[EDPersistenceHookRegistry registerOneTimeCodeChangeHookResponder:](v32->_hookRegistry, "registerOneTimeCodeChangeHookResponder:", v32);
    -[EDPersistenceHookRegistry registerMessageChangeHookResponder:](v32->_hookRegistry, "registerMessageChangeHookResponder:", v32);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v53 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v53, QOS_CLASS_USER_INITIATED, 0);
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = dispatch_queue_create("com.apple.email.EDMessageRepository.contentProtectionQueue", v54);
    contentProtectionQueue = v32->_contentProtectionQueue;
    v32->_contentProtectionQueue = (OS_dispatch_queue *)v55;

    EFRegisterContentProtectionObserver();
    objc_msgSend(MEMORY[0x1E0D1E268], "addValidSortDescriptorsToEMQuery");
    v32->_remoteContentParserLock._os_unfair_lock_opaque = 0;
    v57 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v59 = objc_msgSend(v57, "initWithObject:", v58);
    oneTimeCodeObservers = v32->_oneTimeCodeObservers;
    v32->_oneTimeCodeObservers = (EFLocked *)v59;

    v61 = (EMCoreAnalyticsCollector *)objc_alloc_init(MEMORY[0x1E0D1E138]);
    analyticsCollector = v32->_analyticsCollector;
    v32->_analyticsCollector = v61;

    objc_storeStrong((id *)&v32->_accountsProvider, a26);
    v63 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.onetimepasscodes"));
    sharedOneTimeCodeUserDefaults = v32->_sharedOneTimeCodeUserDefaults;
    v32->_sharedOneTimeCodeUserDefaults = (NSUserDefaults *)v63;

  }
  return v32;
}

- (void)dealloc
{
  objc_super v3;

  EFUnregisterContentProtectionObserver();
  -[EDMessageRepository cancelAllHandlers](self, "cancelAllHandlers");
  v3.receiver = self;
  v3.super_class = (Class)EDMessageRepository;
  -[EDMessageRepository dealloc](&v3, sel_dealloc);
}

- (void)test_tearDown
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageRepository.m"), 276, CFSTR("%s can only be called from unit tests"), "-[EDMessageRepository test_tearDown]");

  }
  os_unfair_lock_lock(&self->_handlersLock);
  -[EDMessageRepository queryHandlers](self, "queryHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageRepository queryHandlers](self, "queryHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  os_unfair_lock_unlock(&self->_handlersLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "test_tearDown");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)isDataAccessible:(id)a3
{
  uint64_t v3;
  void (**v4)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v3 = EFProtectedDataAvailable();
    v4[2](v4, v3);
  }

}

- (void)performQuery:(id)a3 limit:(int64_t)a4 completionHandler:(id)a5
{
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  int64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v24 = a5;
  -[EDMessageRepository _resetUpdateThrottlersWithLogMessage:](self, "_resetUpdateThrottlersWithLogMessage:", CFSTR("starting one off query"));
  +[EDMessageRepository log](EDMessageRepository, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v25, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v9;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_INFO, "Performing Query %@", buf, 0xCu);

  }
  v10 = (void *)MEMORY[0x1D824B334]();
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "future");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke;
  v32[3] = &unk_1E949CB50;
  v14 = v25;
  v33 = v14;
  v15 = v24;
  v34 = v15;
  objc_msgSend(v12, "addSuccessBlock:", v32);

  objc_msgSend(v11, "future");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke_54;
  v29[3] = &unk_1E949CD40;
  v17 = v14;
  v30 = v17;
  v18 = v15;
  v31 = v18;
  objc_msgSend(v16, "addFailureBlock:", v29);

  if (a4 >= 200)
    v19 = 200;
  else
    v19 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepository messagePersistence](self, "messagePersistence");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke_56;
  v26[3] = &unk_1E949CF88;
  v22 = v20;
  v27 = v22;
  v23 = v11;
  v28 = v23;
  objc_msgSend(v21, "iterateMessagesMatchingQuery:batchSize:firstBatchSize:limit:cancelationToken:handler:", v17, 200, 0, a4, 0, v26);

  objc_msgSend(v23, "finishWithResult:", v22);
  objc_autoreleasePoolPop(v10);

}

void __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EDMessageRepository log](EDMessageRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(v3, "count");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "found %ld messages matching query %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EDMessageRepository log](EDMessageRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke_54_cold_1(v5, v6, (uint64_t)v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = v5;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v7);
  else
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);

}

- (void)performCountQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[EDMessageRepository asyncWorkScheduler](self, "asyncWorkScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__EDMessageRepository_performCountQuery_completionHandler___block_invoke;
  v11[3] = &unk_1E949CCB0;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "performBlock:", v11);

}

void __59__EDMessageRepository_performCountQuery_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__EDMessageRepository_performCountQuery_completionHandler___block_invoke_2;
  v4[3] = &unk_1E949CCB0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performDatabaseWorkInBlockWithHighPriority:", v4);

}

void __59__EDMessageRepository_performCountQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_resetUpdateThrottlersWithLogMessage:", CFSTR("starting one off count query"));
  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryWithExpandedMailboxesFromQuery:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 48);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "countOfMessagesMatchingQuery:", v7));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v6, 0);

}

- (void)performQuery:(id)a3 withObserver:(id)a4 observationIdentifier:(id)a5 helperObserver:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[EDMessageRepository _resetUpdateThrottlersWithLogMessage:](self, "_resetUpdateThrottlersWithLogMessage:", CFSTR("starting query"));
  -[EDMessageRepository performQueryOnSerializationQueue](self, "performQueryOnSerializationQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "tryLockWhenCondition:", 1);

  if (v18)
  {
    -[EDMessageRepository performQueryOnSerializationQueue](self, "performQueryOnSerializationQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unlock");

    -[EDMessageRepository serializationQueue](self, "serializationQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __104__EDMessageRepository_performQuery_withObserver_observationIdentifier_helperObserver_completionHandler___block_invoke;
    v21[3] = &unk_1E949EA28;
    v21[4] = self;
    v22 = v12;
    v23 = v13;
    v24 = v14;
    v25 = v15;
    v26 = v16;
    dispatch_async(v20, v21);

  }
  else
  {
    -[EDMessageRepository _performQuery:withObserver:observationIdentifier:helperObserver:completionHandler:](self, "_performQuery:withObserver:observationIdentifier:helperObserver:completionHandler:", v12, v13, v14, v15, v16);
  }

}

uint64_t __104__EDMessageRepository_performQuery_withObserver_observationIdentifier_helperObserver_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performQuery:withObserver:observationIdentifier:helperObserver:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_performQuery:(id)a3 withObserver:(id)a4 observationIdentifier:(id)a5 helperObserver:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  os_unfair_lock_s *p_handlersLock;
  uint64_t v17;
  EDMessageQueryHandler *v18;
  NSObject *v19;
  EDMessageQueryHandler *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  EDThreadQueryHandler *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  EDMessageQueryHandler *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void (**v53)(id, id);
  void *v54;
  id val;
  id v56;
  _QWORD v57[4];
  id v58;
  EDMessageQueryHandler *v59;
  id v60;
  id v61;
  id v62;
  id location;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE buf[12];
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v50 = a4;
  v56 = a5;
  v48 = a6;
  v53 = (void (**)(id, id))a7;
  v54 = v12;
  v13 = objc_alloc(MEMORY[0x1E0D1EE90]);
  objc_msgSend(v12, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "initWithLabel:", v14);

  p_handlersLock = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  val = (id)v15;
  -[NSMutableSet addObject:](self->_handlerTokens, "addObject:", v15);
  os_unfair_lock_unlock(&self->_handlersLock);
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = objc_msgSend(v12, "targetClass");
  if (v17 == objc_opt_class())
  {
    +[EDMessageRepository log](EDMessageRepository, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      v70 = 2114;
      v71 = v56;
      _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "Creating message query: %{public}@, observation identifier: %{public}@", buf, 0x16u);
    }

    v20 = [EDMessageQueryHandler alloc];
    -[EDMessageRepository messagePersistence](self, "messagePersistence");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepository hookRegistry](self, "hookRegistry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepository remindMeNotificationController](self, "remindMeNotificationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepository searchProvider](self, "searchProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[EDMessageQueryHandler initWithQuery:messagePersistence:hookRegistry:remindMeNotificationController:searchProvider:observer:observationIdentifier:](v20, "initWithQuery:messagePersistence:hookRegistry:remindMeNotificationController:searchProvider:observer:observationIdentifier:", v54, v21, v22, v23, v24, v50, v56);

  }
  else
  {
    if (v17 != objc_opt_class())
    {
      v18 = 0;
      goto LABEL_11;
    }
    +[EDMessageRepository log](EDMessageRepository, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      v70 = 2114;
      v71 = v56;
      _os_log_impl(&dword_1D2F2C000, v25, OS_LOG_TYPE_DEFAULT, "Creating thread query: %{public}@, observation identifier: %{public}@", buf, 0x16u);
    }

    v26 = [EDThreadQueryHandler alloc];
    -[EDMessageRepository messagePersistence](self, "messagePersistence");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepository threadPersistence](self, "threadPersistence");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepository hookRegistry](self, "hookRegistry");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepository vipManager](self, "vipManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepository searchProvider](self, "searchProvider");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepository remindMeNotificationController](self, "remindMeNotificationController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepository observerResumer](self, "observerResumer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[EDThreadQueryHandler initWithQuery:messagePersistence:threadPersistence:hookRegistry:vipManager:searchProvider:remindMeNotificationController:observer:observationIdentifier:helperObserver:delegate:observationResumer:](v26, "initWithQuery:messagePersistence:threadPersistence:hookRegistry:vipManager:searchProvider:remindMeNotificationController:observer:observationIdentifier:helperObserver:delegate:observationResumer:", v54, v27, v28, v29, v30, v31, v32, v50, v56, v48, self, v33);

    -[EDMessageQueryHandler threadScope](v18, "threadScope");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v21);
  }

  p_handlersLock = &self->_handlersLock;
LABEL_11:
  objc_msgSend(val, "addCancelable:", v18);
  os_unfair_lock_lock(p_handlersLock);
  -[EDMessageRepository queryHandlers](self, "queryHandlers");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v34;
  objc_msgSend(v34, "objectForKeyedSubscript:", v56);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    +[EDMessageRepository log](EDMessageRepository, "log");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      -[EDMessageRepository _performQuery:withObserver:observationIdentifier:helperObserver:completionHandler:].cold.1((uint64_t)v56, v35);

    v34 = v51;
    objc_msgSend(v52, "cancel");
  }
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v18, v56);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v36 = v49;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v65 != v38)
          objc_enumerationMutation(v36);
        v40 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
        -[EDMessageRepository queryHandlersByThreadScope](self, "queryHandlersByThreadScope");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(v42, "addObject:", v18);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v18);
          v43 = objc_claimAutoreleasedReturnValue();
          -[EDMessageRepository queryHandlersByThreadScope](self, "queryHandlersByThreadScope");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, v40);

          v42 = (void *)v43;
        }

      }
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    }
    while (v37);
  }

  os_unfair_lock_unlock(&self->_handlersLock);
  -[EDMessageQueryHandler start](v18, "start");
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, val);
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __105__EDMessageRepository__performQuery_withObserver_observationIdentifier_helperObserver_completionHandler___block_invoke;
  v57[3] = &unk_1E949EA50;
  objc_copyWeak(&v61, (id *)buf);
  objc_copyWeak(&v62, &location);
  v45 = v56;
  v58 = v45;
  v46 = v18;
  v59 = v46;
  v47 = v36;
  v60 = v47;
  objc_msgSend(val, "addCancelationBlock:", v57);
  v53[2](v53, val);

  objc_destroyWeak(&v62);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __105__EDMessageRepository__performQuery_withObserver_observationIdentifier_helperObserver_completionHandler___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  os_unfair_lock_s *lock;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 64));
    if (v3)
    {
      +[EDMessageRepository log](EDMessageRepository, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v24 = v5;
        _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Stopping query with observation identifier: %{public}@", buf, 0xCu);
      }

      lock = (os_unfair_lock_s *)(WeakRetained + 20);
      os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 5);
      objc_msgSend(*((id *)WeakRetained + 8), "removeObject:", v3);
      objc_msgSend(WeakRetained, "queryHandlers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 == *(void **)(a1 + 40))
      {
        objc_msgSend(WeakRetained, "queryHandlers", lock);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));

      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = *(id *)(a1 + 48);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
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
            v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
            objc_msgSend(WeakRetained, "queryHandlersByThreadScope", lock);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "removeObject:", *(_QWORD *)(a1 + 40));
            if (!objc_msgSend(v14, "count"))
            {
              objc_msgSend(WeakRetained, "queryHandlersByThreadScope");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v12);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v9);
      }

      os_unfair_lock_unlock(lock);
    }

  }
}

- (void)accountBecameActive:(id)a3
{
  -[EDMessageRepository _accountActiveStateDidChange:stateStringForLogging:](self, "_accountActiveStateDidChange:stateStringForLogging:", a3, CFSTR("activated"));
}

- (void)accountBecameInactive:(id)a3
{
  -[EDMessageRepository _accountActiveStateDidChange:stateStringForLogging:](self, "_accountActiveStateDidChange:stateStringForLogging:", a3, CFSTR("deactivated"));
}

- (void)_accountActiveStateDidChange:(id)a3 stateStringForLogging:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  EDMessageRepository *v13;
  NSObject *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EFCFBCE8) & 1) != 0)
  {
    v8 = v6;
    -[EDMessageRepository asyncWorkScheduler](self, "asyncWorkScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__EDMessageRepository__accountActiveStateDidChange_stateStringForLogging___block_invoke;
    v11[3] = &unk_1E949B390;
    v12 = v7;
    v13 = self;
    v10 = v8;
    v14 = v10;
    objc_msgSend(v9, "performBlock:", v11);

  }
  else
  {
    +[EDMessageRepository log](EDMessageRepository, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Newly %{public}@ account is not EDReceivingAccount.", buf, 0xCu);
    }
  }

}

void __74__EDMessageRepository__accountActiveStateDidChange_stateStringForLogging___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[EDMessageRepository log](EDMessageRepository, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Requesting update of threads for %{public}@ account.", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "threadPersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetThreadScopesForAccount:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_triggerMigrationForThreadScopes:", v5);
}

- (void)threadQueryHandlerStateDidChange:(id)a3
{
  id v4;
  id v5;
  os_unfair_lock_s *p_handlersLock;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  p_handlersLock = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  -[EDMessageRepository queryHandlersByThreadScope](self, "queryHandlersByThreadScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __56__EDMessageRepository_threadQueryHandlerStateDidChange___block_invoke;
  v20[3] = &unk_1E949EA98;
  v8 = v4;
  v21 = v8;
  v9 = v5;
  v22 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v20);

  os_unfair_lock_unlock(p_handlersLock);
  objc_msgSend(v9, "removeObject:", v8);
  +[EDMessageRepository log](EDMessageRepository, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134218240;
    v25 = v8;
    v26 = 1024;
    v27 = v11;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_INFO, "Thread query handler %p completed migration. Will notify %u other thread query handlers about the state change.", buf, 0x12u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "checkIfPrecomputedStateIsAvailable", (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v13);
  }

}

void __56__EDMessageRepository_threadQueryHandlerStateDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "threadScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_44);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "unionSet:", v8);

  }
}

id __56__EDMessageRepository_threadQueryHandlerStateDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)_triggerMigrationForThreadScopes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__20;
  v27 = __Block_byref_object_dispose__20;
  v28 = 0;
  os_unfair_lock_lock(&self->_handlersLock);
  -[EDMessageRepository queryHandlersByThreadScope](self, "queryHandlersByThreadScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __56__EDMessageRepository__triggerMigrationForThreadScopes___block_invoke;
  v20[3] = &unk_1E949EAE0;
  v6 = v4;
  v21 = v6;
  v22 = &v23;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v20);

  os_unfair_lock_unlock(&self->_handlersLock);
  +[EDMessageRepository log](EDMessageRepository, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend((id)v24[5], "count");
    *(_DWORD *)buf = 67109120;
    v31 = v8;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Found %u query handlers that need re-migration for (de-)actived account.", buf, 8u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (id)v24[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        -[EDMessageRepository threadPersistence](self, "threadPersistence", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "threadScope");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setNeedsUpdateForThreadScope:", v15);

        objc_msgSend(v13, "triggerMigration");
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v29, 16);
    }
    while (v10);
  }

  _Block_object_dispose(&v23, 8);
}

void __56__EDMessageRepository__triggerMigrationForThreadScopes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2))
  {
    objc_msgSend(v10, "ef_compactMap:", &__block_literal_global_193);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v6)
    {
      objc_msgSend(v6, "unionSet:", v5);
    }
    else
    {
      v7 = objc_msgSend(v5, "mutableCopy");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }

}

id __56__EDMessageRepository__triggerMigrationForThreadScopes___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)startObservingOneTimeCode:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  EFScheduler *v12;
  EFScheduler *delayedMessageActionScheduler;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id from;
  id location;
  _QWORD v21[4];
  id v22;
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[EDMessageRepository oneTimeCodeObservers](self, "oneTimeCodeObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__EDMessageRepository_startObservingOneTimeCode_completionHandler___block_invoke;
  v21[3] = &unk_1E949CE78;
  v10 = v6;
  v22 = v10;
  objc_msgSend(v8, "performWhileLocked:", v21);

  +[EDMessageRepository log](EDMessageRepository, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "[OTC] Registering one-time code observer: %@", buf, 0xCu);
  }

  if (!self->_delayedMessageActionScheduler)
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.email.EDMessageRepository.delayedMessageActionScheduler"));
    v12 = (EFScheduler *)objc_claimAutoreleasedReturnValue();
    delayedMessageActionScheduler = self->_delayedMessageActionScheduler;
    self->_delayedMessageActionScheduler = v12;

  }
  self->_oneTimeCodeMessageID = *MEMORY[0x1E0D1DC08];
  v14 = (void *)objc_opt_new();
  os_unfair_lock_lock(&self->_handlersLock);
  -[NSMutableSet addObject:](self->_handlerTokens, "addObject:", v14);
  os_unfair_lock_unlock(&self->_handlersLock);
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v14);
  from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v10);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __67__EDMessageRepository_startObservingOneTimeCode_completionHandler___block_invoke_200;
  v15[3] = &unk_1E949EB08;
  objc_copyWeak(&v16, (id *)buf);
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  objc_msgSend(v14, "addCancelationBlock:", v15);
  v7[2](v7, v14);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

uint64_t __67__EDMessageRepository_startObservingOneTimeCode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

void __67__EDMessageRepository_startObservingOneTimeCode_completionHandler___block_invoke_200(id *a1)
{
  id WeakRetained;
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained(a1 + 4);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_loadWeakRetained(a1 + 5);
    if (v3)
    {
      v4 = objc_loadWeakRetained(a1 + 6);
      if (v4)
      {
        objc_msgSend(v6, "oneTimeCodeObservers");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __67__EDMessageRepository_startObservingOneTimeCode_completionHandler___block_invoke_2;
        v7[3] = &unk_1E949CE78;
        v8 = v4;
        objc_msgSend(v5, "performWhileLocked:", v7);

        os_unfair_lock_lock((os_unfair_lock_t)v6 + 5);
        objc_msgSend(*((id *)v6 + 8), "removeObject:", v3);
        os_unfair_lock_unlock((os_unfair_lock_t)v6 + 5);

      }
    }

    WeakRetained = v6;
  }

}

uint64_t __67__EDMessageRepository_startObservingOneTimeCode_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)_broadcastOneTimeCode:(id)a3 timestamp:(id)a4 messageID:(int64_t)a5 subject:(id)a6 senders:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[EDMessageRepository oneTimeCodeObservers](self, "oneTimeCodeObservers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "getObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDMessageRepository log](EDMessageRepository, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v22;
    _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "[OTC] Broadcasting one-time code to observers: %@", buf, 0xCu);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v22;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v21++), "didReceiveOneTimeCode:timestamp:messageID:subject:senders:observers:", v12, v13, a5, v14, v15, objc_msgSend(v18, "count"));
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v19);
  }

}

- (void)didReceiveOneTimeCode:(id)a3 timestamp:(id)a4 messageID:(int64_t)a5 subject:(id)a6 senders:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;

  v15 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  -[EDMessageRepository setOneTimeCodeMessageID:](self, "setOneTimeCodeMessageID:", a5);
  -[EDMessageRepository _broadcastOneTimeCode:timestamp:messageID:subject:senders:](self, "_broadcastOneTimeCode:timestamp:messageID:subject:senders:", v15, v12, a5, v13, v14);

}

- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    v8 = *MEMORY[0x1E0D1DC08];
    v9 = MEMORY[0x1E0C9AA60];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = -[EDMessageRepository oneTimeCodeMessageID](self, "oneTimeCodeMessageID");
        if (v12 == objc_msgSend(v11, "globalMessageID"))
        {
          +[EDMessageRepository log](EDMessageRepository, "log");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "One time code messages are deleted by the user", v15, 2u);
          }

          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDMessageRepository _broadcastOneTimeCode:timestamp:messageID:subject:senders:](self, "_broadcastOneTimeCode:timestamp:messageID:subject:senders:", 0, v14, objc_msgSend(v11, "globalMessageID"), &stru_1E94A4508, v9);

          -[EDMessageRepository setOneTimeCodeMessageID:](self, "setOneTimeCodeMessageID:", v8);
        }
        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (NSSet)test_activeQueryCancelationTokens
{
  os_unfair_lock_s *p_handlersLock;
  void *v5;
  void *v7;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageRepository.m"), 641, CFSTR("%s can only be called from unit tests"), "-[EDMessageRepository test_activeQueryCancelationTokens]");

  }
  p_handlersLock = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  v5 = (void *)-[NSMutableSet copy](self->_handlerTokens, "copy");
  os_unfair_lock_unlock(p_handlersLock);
  return (NSSet *)v5;
}

- (void)cancelAllHandlers
{
  os_unfair_lock_s *p_handlersLock;
  void *v4;
  id v5;

  p_handlersLock = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  -[NSMutableSet allObjects](self->_handlerTokens, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  -[NSMutableSet removeAllObjects](self->_handlerTokens, "removeAllObjects");
  os_unfair_lock_unlock(p_handlersLock);
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_cancel);

}

void __61__EDMessageRepository__enumerateObjectIDsByScope_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v7;
  else
    v10 = 0;
  v11 = v10;
  if (v11
    && (objc_msgSend(*(id *)(a1 + 32), "threadPersistence"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "threadScope"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v12, "persistenceStateForThreadScope:", v13),
        v13,
        v12,
        v14 == 1))
  {
    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "threadPersistence");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v17, "threadForObjectID:originatingQuery:error:", v11, 0, &v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v20;

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_11;
    }
  }
  else if (!v9)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("In-memory thread could not be found"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "em_internalErrorWithReason:", v16);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_11:

}

void __136__EDMessageRepository_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler___block_invoke_219(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  void *v6;
  void *v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("EDMessageRepository.m"), 806, CFSTR("Expecting EMRepositoryObject class"));

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", 0, v22);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = v22;
    else
      v15 = 0;
    v16 = v15;
    v17 = v16;
    v18 = v14;
    if (!v14)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "ef_publicDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Failed to get message list item for objectID: %@"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "em_internalErrorWithReason:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v18, v22);
    if (!v14)
    {

    }
  }

}

- (void)performMessageChangeAction:(id)a3 requestID:(unint64_t)a4 returnUndoAction:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  EDMessageRepository *v17;
  id v18;
  unint64_t v19;
  BOOL v20;

  v10 = a3;
  v11 = a6;
  -[EDMessageRepository _resetUpdateThrottlersWithLogMessage:](self, "_resetUpdateThrottlersWithLogMessage:", CFSTR("performing change action"));
  -[EDMessageRepository serializationQueue](self, "serializationQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__EDMessageRepository_performMessageChangeAction_requestID_returnUndoAction_completionHandler___block_invoke;
  block[3] = &unk_1E949EC20;
  v20 = a5;
  v16 = v10;
  v17 = self;
  v18 = v11;
  v19 = a4;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

void __95__EDMessageRepository_performMessageChangeAction_requestID_returnUndoAction_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "EDMessageRepositoryMessageChangeAction", "Received by maild", (uint8_t *)&v27, 2u);
  }

  +[EDMessageRepository signpostLog](EDMessageRepository, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  +[EDMessageRepository signpostLog](EDMessageRepository, "signpostLog");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "signpostType");
    v10 = *(unsigned __int8 *)(a1 + 64);
    v27 = 134349312;
    v28 = v9;
    v29 = 1026;
    v30 = v10;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EDMessageRepositoryMessageChangeAction", "ChangeActionType=%{public,signpost.telemetry:number1}lu, ReturnUndoAction=%{public,signpost.telemetry.number2}u enableTelemetry=YES ", (uint8_t *)&v27, 0x12u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0;
    objc_msgSend(*(id *)(a1 + 40), "_performMessageFlagChangeAllAction:", *(_QWORD *)(a1 + 32));
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_performMessageFlagChangeAction:returnUndoAction:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64));
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v11 = (void *)v12;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_performMessageReadLaterAction:returnUndoAction:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_performMessageFollowUpAction:returnUndoAction:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_performSenderBlockingAction:returnUndoAction:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0;
    objc_msgSend(*(id *)(a1 + 40), "_performUnsubscribeAction:", *(_QWORD *)(a1 + 32));
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = *(id *)(a1 + 32);
    objc_msgSend(v19, "destinationMailboxURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = *(void **)(a1 + 40);
    if (v20)
      objc_msgSend(v21, "_performMessageTransferAllAction:", v19);
    else
      objc_msgSend(v21, "_performMessageTransferAllActionToSpecialMailbox:", v19);

    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 0;
      objc_msgSend(*(id *)(a1 + 40), "_performMessageDeleteAction:", *(_QWORD *)(a1 + 32));
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 0;
      objc_msgSend(*(id *)(a1 + 40), "_performMessageDeleteAllAction:", *(_QWORD *)(a1 + 32));
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_performMessageConversationFlagChangeAction:returnUndoAction:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64));
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 0;
      objc_msgSend(*(id *)(a1 + 40), "_performSuppressNotAuthenticatedChangeAction:", *(_QWORD *)(a1 + 32));
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_performUndoAction:", *(_QWORD *)(a1 + 32));
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_41:
    v11 = 0;
    goto LABEL_9;
  }
  v22 = *(id *)(a1 + 32);
  objc_msgSend(v22, "destinationMailboxURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = *(void **)(a1 + 40);
  v25 = *(_BYTE *)(a1 + 64) != 0;
  if (v23)
    objc_msgSend(v24, "_performMessageTransferAction:returnUndoAction:", v22, v25);
  else
    objc_msgSend(v24, "_performMessageTransferActionToSpecialMailbox:returnUndoAction:", v22, v25);
  v26 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)v26;
LABEL_19:
  if (*(_BYTE *)(a1 + 64) && v11)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E3A8]), "initWithIndividualActions:origin:actor:", v11, objc_msgSend(*(id *)(a1 + 32), "origin"), objc_msgSend(*(id *)(a1 + 32), "actor"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    goto LABEL_22;
  }
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_22:
  objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 56);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v15, OS_SIGNPOST_INTERVAL_END, v16, "EDMessageRepositoryMessageChangeAction", ", (uint8_t *)&v27, 2u);
  }

  +[EDMessageRepository signpostLog](EDMessageRepository, "signpostLog");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v18, OS_SIGNPOST_INTERVAL_END, v6, "EDMessageRepositoryMessageChangeAction", ", (uint8_t *)&v27, 2u);
  }

}

- (void)performOneTimeCodeMessageDeletionWithObjectID:(id)a3 requestID:(unint64_t)a4 returnUndoAction:(BOOL)a5 afterDelay:(double)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  double v19;
  unint64_t v20;

  v11 = a3;
  v12 = a7;
  _EFLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __125__EDMessageRepository_performOneTimeCodeMessageDeletionWithObjectID_requestID_returnUndoAction_afterDelay_completionHandler___block_invoke;
  v16[3] = &unk_1E949EC70;
  v16[4] = self;
  v14 = v11;
  v17 = v14;
  v19 = a6;
  v20 = a4;
  v15 = v12;
  v18 = v15;
  -[EDMessageRepository mailOnBoardDeleteVerificationCodesMessage:completionHandler:](self, "mailOnBoardDeleteVerificationCodesMessage:completionHandler:", v13, v16);

}

void __125__EDMessageRepository_performOneTimeCodeMessageDeletionWithObjectID_requestID_returnUndoAction_afterDelay_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint8_t buf[8];
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  +[EDMessageRepository log](EDMessageRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Onboarding alert was presented. Sending option selected back to Messages notification and setting default key 'DeleteVerificationCodes'", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v6 = objc_alloc(MEMORY[0x1E0D1E140]);
  v35 = CFSTR("oneTimeCodeEvent");
  v36[0] = CFSTR("filled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithEventName:collectionData:", CFSTR("com.apple.mail.oneTimeCodes"), v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "logOneTimeEvent:", v8);
  if (a2)
  {
    if (a2 == 1)
    {
      +[EDMessageRepository log](EDMessageRepository, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Enable one-time code email deletion", buf, 2u);
      }

      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("EDOneTimeCodeOnboardingAlertUserSelectedEnableNotification"), 0, 0, 1u);
      objc_msgSend(*(id *)(a1 + 32), "sharedOneTimeCodeUserDefaults");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject setBool:forKey:](v9, "setBool:forKey:", 1, CFSTR("DeleteVerificationCodes"));
    }
    else
    {
      if (a2 != 2)
        goto LABEL_15;
      +[EDMessageRepository log](EDMessageRepository, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "No one-time code email deletion preference selected", buf, 2u);
      }
    }
  }
  else
  {
    +[EDMessageRepository log](EDMessageRepository, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Disable one-time code email deletion", buf, 2u);
    }

    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("EDOneTimeCodeOnboardingAlertUserSelectedDisableNotification"), 0, 0, 1u);
    objc_msgSend(*(id *)(a1 + 32), "sharedOneTimeCodeUserDefaults");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject setBool:forKey:](v9, "setBool:forKey:", 0, CFSTR("DeleteVerificationCodes"));
  }

LABEL_15:
  objc_msgSend(MEMORY[0x1E0D1EF58], "transactionWithDescription:", CFSTR("com.apple.email.messageRepository.delayedMessageAction"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    if (a2 != 1)
    {
      v16 = 0;
      goto LABEL_24;
    }
    v13 = objc_alloc(MEMORY[0x1E0D1E288]);
    v34 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E778], "setRead");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithObjectIDs:origin:actor:specialDestinationMailboxType:flagChange:copyMessages:", v14, 7, 1, 3, v15, 0);

    +[EDMessageRepository log](EDMessageRepository, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "Deleting used one time code email";
LABEL_21:
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    }
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x1E0D1E210]);
    v33 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E778], "setRead");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v19, "initWithObjectIDs:origin:actor:flagChange:", v20, 7, 1, v21);

    +[EDMessageRepository log](EDMessageRepository, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "Marking used one time code email as read";
      goto LABEL_21;
    }
  }

LABEL_24:
  objc_msgSend(*(id *)(a1 + 32), "delayedMessageActionScheduler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(double *)(a1 + 56);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __125__EDMessageRepository_performOneTimeCodeMessageDeletionWithObjectID_requestID_returnUndoAction_afterDelay_completionHandler___block_invoke_268;
  v27[3] = &unk_1E949EC48;
  v27[4] = *(_QWORD *)(a1 + 32);
  v28 = v16;
  v31 = *(_QWORD *)(a1 + 64);
  v30 = *(id *)(a1 + 48);
  v24 = v12;
  v29 = v24;
  v25 = v16;
  v26 = (id)objc_msgSend(v22, "afterDelay:performBlock:", v27, v23);

}

uint64_t __125__EDMessageRepository_performOneTimeCodeMessageDeletionWithObjectID_requestID_returnUndoAction_afterDelay_completionHandler___block_invoke_268(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "performMessageChangeAction:requestID:returnUndoAction:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

- (void)mailOnBoardDeleteVerificationCodesMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFDictionary *v17;
  __CFUserNotification *v18;
  void *v19;
  CFOptionFlags responseFlags;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[EDMessageRepository sharedOneTimeCodeUserDefaults](self, "sharedOneTimeCodeUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerForKey:", CFSTR("DeleteVerificationCodesOnboardingVersion"));

  if (v9 < 1)
  {
    _EFLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _EFLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _EFLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99D80];
    -[EDMessageRepository _dictForPasswordsIcon](self, "_dictForPasswordsIcon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v12, *MEMORY[0x1E0C9B800], v6, *MEMORY[0x1E0C9B810], v13, *MEMORY[0x1E0C9B838], v14, *MEMORY[0x1E0C9B830], v16, CFSTR("IconConfiguration"), 0);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v18 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, v17);
    responseFlags = 0xAAAAAAAAAAAAAAAALL;
    CFUserNotificationReceiveResponse(v18, 0.0, &responseFlags);
    -[EDMessageRepository sharedOneTimeCodeUserDefaults](self, "sharedOneTimeCodeUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setInteger:forKey:", 1, CFSTR("DeleteVerificationCodesOnboardingVersion"));

    if (responseFlags < 2 || responseFlags == 3)
      v7[2](v7);

  }
  else
  {
    -[EDMessageRepository sharedOneTimeCodeUserDefaults](self, "sharedOneTimeCodeUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("DeleteVerificationCodes"));

    ((void (*)(void (**)(_QWORD), _QWORD))v7[2])(v7, v11);
  }

}

- (id)_dictForPasswordsIcon
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", CFSTR("com.apple.Passwords-Settings.extension"), CFSTR("ISIconApplicationBundleIdentifier"));
  objc_msgSend(v2, "setObject:forKey:", CFSTR("otpOnboardingIcon.png"), CFSTR("ISIconDecorationType"));
  return v2;
}

- (id)_performMessageFlagChangeAction:(id)a3 returnUndoAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flagChange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepository _changeFlagsForPersistedMessages:flagChange:returnUndoAction:](self, "_changeFlagsForPersistedMessages:flagChange:returnUndoAction:", v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_performMessageFollowUpAction:(id)a3 returnUndoAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "followUp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepository _performMessageFollowUpDate:persistedMessages:returnUndoAction:](self, "_performMessageFollowUpDate:persistedMessages:returnUndoAction:", v8, v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_performMessageFollowUpDate:(id)a3 persistedMessages:(id)a4 returnUndoAction:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v5 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v24 = a4;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v24;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v27;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
          v12 = objc_alloc_init(MEMORY[0x1E0D1E3A0]);
          objc_msgSend(v12, "setActionType:", 3);
          objc_msgSend(v11, "followUp");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v12, "setFollowUp:", v14);

          v15 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v11, "persistentID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v16, "longLongValue"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setMessageDatabaseIDs:", v18);

          objc_msgSend(v7, "addObject:", v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v8);
    }

    v19 = v7;
  }
  else
  {
    v19 = 0;
  }
  -[EDMessageRepository messageChangeManager](self, "messageChangeManager", self);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "applyFollowUp:toMessages:withNegativeFeedbackForSuggestions:", v23, v24, 1);

  return v19;
}

- (id)_performMessageReadLaterAction:(id)a3 returnUndoAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readLaterDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepository _performMessageReadLaterDate:persistedMessages:returnUndoAction:](self, "_performMessageReadLaterDate:persistedMessages:returnUndoAction:", v8, v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_performMessageReadLaterDate:(id)a3 persistedMessages:(id)a4 returnUndoAction:(BOOL)a5
{
  void *v5;
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _BOOL4 v31;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v6 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v31 = v6;
  v34 = v8;
  v35 = v9;
  if (v6)
  {
    v10 = (void *)objc_opt_new();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v43 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v15, "readLater");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "date");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v5;
          }
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v15);
          if (!v17)

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v12);
    }

    v8 = v34;
    v9 = v35;
  }
  else
  {
    v10 = 0;
  }
  -[EDMessageRepository messageChangeManager](self, "messageChangeManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "applyReadLaterDate:displayDate:toMessages:", v8, 0, v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v20 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v21 = v33;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v39 != v23)
            objc_enumerationMutation(v21);
          v25 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
          objc_msgSend(v10, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            v27 = (void *)objc_opt_new();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, v26);
          }
          objc_msgSend(v27, "addObject:", v25);

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v22);
    }

    v28 = (void *)objc_opt_new();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __87__EDMessageRepository__performMessageReadLaterDate_persistedMessages_returnUndoAction___block_invoke;
    v36[3] = &unk_1E949ECD8;
    v29 = v28;
    v37 = v29;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v36);

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

void __87__EDMessageRepository__performMessageReadLaterDate_persistedMessages_returnUndoAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0D1E3A0]);
  objc_msgSend(v6, "setActionType:", 2);
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D1ED90] + 16))())
    v7 = 0;
  else
    v7 = v9;
  objc_msgSend(v6, "setReadLaterDate:", v7);
  objc_msgSend(v5, "ef_map:", &__block_literal_global_281);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessageDatabaseIDs:", v8);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
}

id __87__EDMessageRepository__performMessageReadLaterDate_persistedMessages_returnUndoAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "persistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_performSenderBlockingAction:(id)a3 returnUndoAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepository _performBlockSender:persistedMessages:returnUndoAction:](self, "_performBlockSender:persistedMessages:returnUndoAction:", objc_msgSend(v6, "blockSender"), v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_performBlockSender:(BOOL)a3 persistedMessages:(id)a4 returnUndoAction:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  EMBlockedSenderManager *blockedSenderManager;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  _BOOL4 v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  id v37;
  BOOL v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v29 = a5;
  v5 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  v28 = a4;
  v7 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = v28;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v12, "senders");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v12, "persistentID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v9);
  }

  v16 = (void *)objc_opt_new();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __78__EDMessageRepository__performBlockSender_persistedMessages_returnUndoAction___block_invoke;
  v36[3] = &unk_1E949ED00;
  v36[4] = self;
  v38 = v5;
  v31 = v16;
  v37 = v31;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v36);
  blockedSenderManager = self->_blockedSenderManager;
  if (v5)
    -[EMBlockedSenderManager blockEmailAddresses:](blockedSenderManager, "blockEmailAddresses:", v31);
  else
    -[EMBlockedSenderManager unblockEmailAddresses:](blockedSenderManager, "unblockEmailAddresses:", v31);
  if (v29)
  {
    v30 = (void *)objc_opt_new();
    objc_msgSend(v30, "setActionType:", 4);
    objc_msgSend(v30, "setBlockSender:", !v5);
    v18 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = v31;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v19);
          v23 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "numberWithLongLong:", objc_msgSend(v24, "longLongValue"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v25);

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      }
      while (v20);
    }

    objc_msgSend(v30, "setMessageDatabaseIDs:", v18);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

void __78__EDMessageRepository__performBlockSender_persistedMessages_returnUndoAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(unsigned __int8 *)(a1 + 48) != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "isEmailAddressBlocked:"))objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (void)_performUnsubscribeAction:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = objc_alloc_init(MEMORY[0x1E0D1E1B0]);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "commandForMessage:mailToOnly:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10), 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        -[EDListUnsubscribeHandler unsubscribeWithCommand:completion:](self->_listUnsubscribeHandler, "unsubscribeWithCommand:completion:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), 0, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)_performMessageFlagChangeAllAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mailboxObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_287);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageRepository messageChangeManager](self, "messageChangeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flagChange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyFlagChange:toAllMessagesFromMailboxes:exceptMessages:", v8, v6, v4);

}

id __58__EDMessageRepository__performMessageFlagChangeAllAction___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "url");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_performMessageDeleteAllAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailboxObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_288);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageRepository messageChangeManager](self, "messageChangeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteAllMessageFromMailboxes:exceptMessages:", v6, v4);

}

id __54__EDMessageRepository__performMessageDeleteAllAction___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "url");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_performMessageDeleteAction:(id)a3
{
  void *v4;
  id v5;

  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepository messageChangeManager](self, "messageChangeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteMessages:", v5);

}

- (id)_changeFlagsForPersistedMessages:(id)a3 flagChange:(id)a4 returnUndoAction:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v5 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v33 = v8;
  v34 = v9;
  if (v5)
  {
    v10 = (void *)objc_opt_new();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v43 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v15, "flags");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v15);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v12);
    }

    v8 = v33;
    v17 = v34;
  }
  else
  {
    v17 = v9;
    v10 = 0;
  }
  -[EDMessageRepository messageChangeManager](self, "messageChangeManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applyFlagChange:toMessages:", v17, v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v19 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v32;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
          v24 = (void *)MEMORY[0x1E0D1E778];
          objc_msgSend(v23, "flags");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "changeFrom:to:", v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v28)
          {
            v28 = (void *)objc_opt_new();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, v27);
          }
          objc_msgSend(v28, "addObject:", v23);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v20);
    }

    v29 = (void *)objc_opt_new();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __84__EDMessageRepository__changeFlagsForPersistedMessages_flagChange_returnUndoAction___block_invoke;
    v36[3] = &unk_1E949D8D0;
    v30 = v29;
    v37 = v30;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v36);

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

void __84__EDMessageRepository__changeFlagsForPersistedMessages_flagChange_returnUndoAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0D1E3A0]);
  objc_msgSend(v6, "setActionType:", 1);
  objc_msgSend(v6, "setFlagChange:", v8);
  objc_msgSend(v5, "ef_map:", &__block_literal_global_289);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessageDatabaseIDs:", v7);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
}

id __84__EDMessageRepository__changeFlagsForPersistedMessages_flagChange_returnUndoAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "persistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_performMessageTransferAction:(id)a3 returnUndoAction:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a4;
  v7 = a3;
  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "copyMessages");
  v10 = (void *)objc_opt_new();
  -[EDMessageRepository messageChangeManager](self, "messageChangeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "destinationMailboxURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transferMessages:transferType:destinationMailboxURL:userInitiated:oldMessagesByNewMessage:", v8, v9 ^ 1u, v12, 1, v10);

  if (v4)
  {
    if (!objc_msgSend(v7, "copyMessages"))
    {
      -[EDMessageRepository _undoActionsForMovedMessages:](self, "_undoActionsForMovedMessages:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageRepository.m"), 1327, CFSTR("An undo action was requested for a copy, that's not yet supported"));

  }
  v14 = 0;
LABEL_6:

  return v14;
}

- (void)_performMessageTransferAllAction:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "copyMessages");
  objc_msgSend(v10, "mailboxObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_compactMap:", &__block_literal_global_293);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageRepository messageChangeManager](self, "messageChangeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destinationMailboxURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transferAllMessagesFromMailboxes:exceptMessages:transferType:destinationMailboxURL:userInitiated:", v7, v4, v5 ^ 1u, v9, 1);

}

id __56__EDMessageRepository__performMessageTransferAllAction___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "url");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_performMessageTransferActionToSpecialMailbox:(id)a3 returnUndoAction:(BOOL)a4
{
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  SEL v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a3;
  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "copyMessages");
  v10 = objc_msgSend(v7, "specialDestinationMailboxType");
  objc_msgSend(v8, "ef_groupBy:", &__block_literal_global_295);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__20;
  v27 = __Block_byref_object_dispose__20;
  v28 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__EDMessageRepository__performMessageTransferActionToSpecialMailbox_returnUndoAction___block_invoke_2;
  v16[3] = &unk_1E949EDC8;
  v19 = v10;
  v20 = v9 ^ 1u;
  v16[4] = self;
  v22 = a4;
  v12 = v7;
  v21 = a2;
  v17 = v12;
  v18 = &v23;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);
  objc_msgSend((id)v24[5], "reverseObjectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v23, 8);
  return v14;
}

id __86__EDMessageRepository__performMessageTransferActionToSpecialMailbox_returnUndoAction___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "account");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (objc_msgSend(v3, "isLocalAccount"))
  {
    objc_msgSend(v2, "sendLaterDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v3;
    if (v5)
    {
      objc_msgSend(v2, "accountForSender");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
  }
  if (!v4 || (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFCFBCE8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }

  return v4;
}

void __86__EDMessageRepository__performMessageTransferActionToSpecialMailbox_returnUndoAction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v23, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v23, "mailboxForType:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "messageChangeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v8, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transferMessages:transferType:destinationMailboxURL:userInitiated:oldMessagesByNewMessage:", v5, v11, v12, 1, v9);

    if (*(_BYTE *)(a1 + 80))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "copyMessages"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("EDMessageRepository.m"), 1379, CFSTR("An undo action was requested for a copy, that's not yet supported"));
      }
      else
      {
        v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (!v14)
        {
          v15 = objc_opt_new();
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v17 = *(void **)(v16 + 40);
          *(_QWORD *)(v16 + 40) = v15;

          v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        }
        objc_msgSend(*(id *)(a1 + 32), "_undoActionsForMovedMessages:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObjectsFromArray:", v13);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "flagChange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = *(void **)(a1 + 32);
      objc_msgSend(v9, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "flagChange");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_changeFlagsForPersistedMessages:flagChange:returnUndoAction:", v20, v21, *(unsigned __int8 *)(a1 + 80));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(_BYTE *)(a1 + 80))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v22);

    }
  }

}

- (void)_performMessageTransferAllActionToSpecialMailbox:(id)a3
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v15, "copyMessages");
  v18 = objc_msgSend(v15, "specialDestinationMailboxType");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v15, "mailboxObjectIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v17 = v4 ^ 1u;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v7), "url");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDMessageRepository messageChangeManager](self, "messageChangeManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "accountForMailboxURL:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "mailboxForType:", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDMessageRepository messageChangeManager](self, "messageChangeManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "URL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "transferAllMessagesFromMailboxes:exceptMessages:transferType:destinationMailboxURL:userInitiated:", v13, v19, v17, v14, 1);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

}

- (id)_undoActionsForMovedMessages:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__EDMessageRepository__undoActionsForMovedMessages___block_invoke;
  v11[3] = &unk_1E949EDF0;
  v6 = v4;
  v12 = v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v11);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __52__EDMessageRepository__undoActionsForMovedMessages___block_invoke_2;
  v9[3] = &unk_1E949EE38;
  v7 = (id)objc_opt_new();
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

void __52__EDMessageRepository__undoActionsForMovedMessages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "mailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  objc_msgSend(v7, "addObject:", v8);

}

void __52__EDMessageRepository__undoActionsForMovedMessages___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0D1E3A0]);
  objc_msgSend(v6, "setActionType:", 0);
  objc_msgSend(v6, "setDestinationMailboxURL:", v8);
  objc_msgSend(v5, "ef_map:", &__block_literal_global_298);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessageDatabaseIDs:", v7);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
}

id __52__EDMessageRepository__undoActionsForMovedMessages___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "persistentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_performUndoAction:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  -[EDMessageRepository messagePersistence](self, "messagePersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepository messageChangeManager](self, "messageChangeManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v17, "individualActions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "messageDatabaseIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v10, 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        switch(objc_msgSend(v9, "actionType"))
        {
          case 0:
            v12 = (void *)objc_opt_new();
            objc_msgSend(v9, "destinationMailboxURL");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "transferMessages:transferType:destinationMailboxURL:userInitiated:oldMessagesByNewMessage:", v11, 1, v13, 1, v12);

            -[EDMessageRepository _undoActionsForMovedMessages:](self, "_undoActionsForMovedMessages:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v14);
            goto LABEL_13;
          case 1:
            objc_msgSend(v9, "flagChange");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[EDMessageRepository _changeFlagsForPersistedMessages:flagChange:returnUndoAction:](self, "_changeFlagsForPersistedMessages:flagChange:returnUndoAction:", v11, v12, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v14);
            goto LABEL_13;
          case 2:
            objc_msgSend(v9, "readLaterDate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[EDMessageRepository _performMessageReadLaterDate:persistedMessages:returnUndoAction:](self, "_performMessageReadLaterDate:persistedMessages:returnUndoAction:", v12, v11, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v14);
            goto LABEL_13;
          case 3:
            objc_msgSend(v9, "followUp");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[EDMessageRepository _performMessageFollowUpDate:persistedMessages:returnUndoAction:](self, "_performMessageFollowUpDate:persistedMessages:returnUndoAction:", v12, v11, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v14);
            goto LABEL_13;
          case 4:
            -[EDMessageRepository _performBlockSender:persistedMessages:returnUndoAction:](self, "_performBlockSender:persistedMessages:returnUndoAction:", objc_msgSend(v9, "blockSender"), v11, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v12);
            goto LABEL_14;
          case 5:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "conversationID"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v12;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[EDMessageRepository _performConversationIDs:conversationNotificationLevel:returnUndoAction:](self, "_performConversationIDs:conversationNotificationLevel:returnUndoAction:", v14, objc_msgSend(v9, "conversationNotificationLevel"), 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v15);

LABEL_13:
LABEL_14:

            break;
          default:
            break;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  return v5;
}

- (id)_performMessageConversationFlagChangeAction:(id)a3 returnUndoAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "conversationIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepository _performConversationIDs:conversationNotificationLevel:returnUndoAction:](self, "_performConversationIDs:conversationNotificationLevel:returnUndoAction:", v7, objc_msgSend(v6, "conversationNotificationLevel"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_performConversationIDs:(id)a3 conversationNotificationLevel:(int64_t)a4 returnUndoAction:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int64_t v21;
  EDMessageRepository *v22;
  _BOOL4 v23;
  id v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v5 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  -[EDMessageRepository conversationPersistence](self, "conversationPersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v5;
  v21 = a4;
  v22 = self;
  v9 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v24;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v15 = +[EDConversationPersistence conversationNotificationLevelForConversationFlags:](EDConversationPersistence, "conversationNotificationLevelForConversationFlags:", objc_msgSend(v8, "persistenceConversationFlagsForConversationID:", objc_msgSend(v14, "longLongValue")));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  if (v23)
  {
    v17 = (void *)objc_opt_new();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __94__EDMessageRepository__performConversationIDs_conversationNotificationLevel_returnUndoAction___block_invoke;
    v25[3] = &unk_1E949EE60;
    v18 = v17;
    v26 = v18;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v25);

  }
  else
  {
    v18 = 0;
  }
  -[EDMessageRepository conversationPersistence](v22, "conversationPersistence");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateConversationNotificationLevel:forConversationIDs:", v21, v10);

  return v18;
}

void __94__EDMessageRepository__performConversationIDs_conversationNotificationLevel_returnUndoAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0D1E3A0]);
  objc_msgSend(v6, "setActionType:", 5);
  objc_msgSend(v6, "setConversationID:", objc_msgSend(v7, "longLongValue"));
  objc_msgSend(v6, "setConversationNotificationLevel:", objc_msgSend(v5, "longLongValue"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (void)persistentIDForMessageObjectID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[EDMessageRepository messagePersistence](self, "messagePersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseIDsDictionaryForMessageObjectIDs:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v12);

}

- (void)_performSuppressNotAuthenticatedChangeAction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v5 = a3;
  objc_msgSend(v5, "objectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDMessageRepository _persistedMessagesForMessageChangeAction:](self, "_persistedMessagesForMessageChangeAction:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageRepository.m"), 1697, CFSTR("EMMessageObjectID not found in EMSuppressNotAuthenticatedAction"));

  }
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageRepository.m"), 1698, CFSTR("Cannot find persistedMessage for EMSuppressNotAuthenticatedAction"));

  }
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "authenticationState");

  -[EDMessageRepository messagePersistence](self, "messagePersistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "persistMessageAuthenticationState:forMessageWithGlobalMessageID:", v10 | 0x10000, objc_msgSend(v7, "globalMessageID"));

  if ((v12 & 1) == 0)
  {
    +[EDMessageRepository log](EDMessageRepository, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[EDMessageRepository _performSuppressNotAuthenticatedChangeAction:].cold.1((uint64_t)v7, v13, v14, v15, v16, v17, v18, v19);

  }
}

- (id)_persistedMessagesForMessageChangeAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  EDMessageRepository *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__20;
  v17 = __Block_byref_object_dispose__20;
  v18 = 0;
  -[EDMessageRepository messagePersistence](self, "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__EDMessageRepository__persistedMessagesForMessageChangeAction___block_invoke;
  v9[3] = &unk_1E949CC38;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  objc_msgSend(v5, "performDatabaseWorkInBlockWithHighPriority:", v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __64__EDMessageRepository__persistedMessagesForMessageChangeAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "messagePersistence");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "query");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistedMessagesMatchingQuery:limit:", v3, 0x7FFFFFFFFFFFFFFFLL);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectIDs");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "_persistedMessagesForObjectIDs:includeDuplicates:", v9, objc_opt_isKindOfClass() & 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v3 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }

}

- (id)_persistedMessagesForObjectIDs:(id)a3 includeDuplicates:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[6];

  v4 = a4;
  -[EDMessageRepository _persistedObjectIDsForObjectIDs:](self, "_persistedObjectIDsForObjectIDs:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__EDMessageRepository__persistedMessagesForObjectIDs_includeDuplicates___block_invoke;
    v13[3] = &unk_1E949EE88;
    v13[4] = self;
    v13[5] = a2;
    objc_msgSend(v7, "ef_map:", v13);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  -[EDMessageRepository messagePersistence](self, "messagePersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistedMessagesForObjectIDs:requireProtectedData:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __72__EDMessageRepository__persistedMessagesForObjectIDs_includeDuplicates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0D1E258]);
    objc_msgSend(v3, "collectionItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E1E0], "allMailboxesScope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v4, "initWithCollectionItemID:mailboxScope:", v5, v6);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("EDMessageRepository.m"), 1736, CFSTR("Unknown objectID class"));

      v7 = v3;
      goto LABEL_7;
    }
    v8 = objc_alloc(MEMORY[0x1E0D1E380]);
    objc_msgSend(v3, "collectionItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0D1E390]);
    objc_msgSend(MEMORY[0x1E0D1E1E0], "allMailboxesScope");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadScope");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filterPredicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithMailboxScope:filterPredicate:", v10, v12);
    v7 = (id)objc_msgSend(v8, "initWithCollectionItemID:threadScope:", v5, v13);

  }
LABEL_7:

  return v7;
}

- (id)_persistedObjectIDsForObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[EDMessageRepository _partitionObjectIDs:](self, "_partitionObjectIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v5, "threadObjectIDsByScope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__EDMessageRepository__persistedObjectIDsForObjectIDs___block_invoke;
  v11[3] = &unk_1E949EEB0;
  v9 = v7;
  v12 = v9;
  -[EDMessageRepository _enumerateObjectIDsByScope:usingBlock:](self, "_enumerateObjectIDsByScope:usingBlock:", v8, v11);

  return v9;
}

void __55__EDMessageRepository__persistedObjectIDsForObjectIDs___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v15 = a2;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "inMemoryMessageObjectIDsForThread:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v14);

      }
    }
  }

}

- (void)requestRichLinkMetadataForRichLinkID:(id)a3 messageID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EDMessageRepository serializationQueue](self, "serializationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__EDMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke;
  v15[3] = &unk_1E949EED8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __88__EDMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  EDPersistedRichLinkID *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "basePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[EDMessageRepository log](EDMessageRepository, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 48);
        v28 = 138412546;
        v29 = v9;
        v30 = 2112;
        v31 = v7;
        _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Requesting rich link metadata for rich link id: %@ in base path: %@", (uint8_t *)&v28, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "richLinkPersistence");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[EDPersistedRichLinkID initWithString:]([EDPersistedRichLinkID alloc], "initWithString:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v6, "basePath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "richLinkMetadataDataForPersistentID:basePath:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      +[EDMessageRepository log](EDMessageRepository, "log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __88__EDMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_cold_2((uint64_t)v6, v21, v22, v23, v24, v25, v26, v27);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    +[EDMessageRepository log](EDMessageRepository, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __88__EDMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_cold_1(a1 + 40, v14, v15, v16, v17, v18, v19, v20);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)requestAttachmentMetadataForMessageIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[EDMessageRepository serializationQueue](self, "serializationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__EDMessageRepository_requestAttachmentMetadataForMessageIDs_completionHandler___block_invoke;
  block[3] = &unk_1E949CCB0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __80__EDMessageRepository_requestAttachmentMetadataForMessageIDs_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageIDsWithBasePaths:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "attachmentPersistenceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentURLsForGlobalMessageIDs:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)requestRichLinkURLsForMessageIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EDMessageRepository log](EDMessageRepository, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Fetching rich link URLs for global message IDs: %@", buf, 0xCu);
  }

  -[EDMessageRepository serializationQueue](self, "serializationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__EDMessageRepository_requestRichLinkURLsForMessageIDs_completionHandler___block_invoke;
  block[3] = &unk_1E949CCB0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __74__EDMessageRepository_requestRichLinkURLsForMessageIDs_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "richLinkPersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "richLinkURLsForMessageIDs:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDMessageRepository log](EDMessageRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Found rich link URLs: %@ for global message IDs: %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)requestRepresentationForMessageWithID:(id)a3 requestID:(unint64_t)a4 options:(id)a5 delegate:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  unint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  unint64_t v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v12 = a5;
  v13 = a6;
  v30 = a7;
  objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, a4, "EDMessageRepositoryContentRepresentationRequest", "Received by maild", buf, 2u);
  }

  -[EDMessageRepository _resetUpdateThrottlersWithLogMessage:](self, "_resetUpdateThrottlersWithLogMessage:", CFSTR("requesting content representation"));
  EMLogCategoryMessageLoading();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v43 = v31;
    v44 = 2114;
    v45 = v12;
    _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_INFO, "Requesting content representation for message %{public}@, Options: %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "future");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke;
  v38[3] = &unk_1E949EF00;
  v20 = v31;
  v39 = v20;
  v41 = a4;
  v21 = v30;
  v40 = v21;
  objc_msgSend(v18, "addSuccessBlock:", v38);

  objc_msgSend(v17, "future");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v19;
  v34[1] = 3221225472;
  v34[2] = __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_315;
  v34[3] = &unk_1E949EF28;
  v37 = a4;
  v23 = v20;
  v35 = v23;
  v24 = v21;
  v36 = v24;
  objc_msgSend(v22, "addFailureBlock:", v34);

  -[EDMessageRepository messagePersistence](self, "messagePersistence");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "completionHandlerAdapter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "requestContentForMessageObjectID:requestID:options:delegate:completionHandler:", v23, a4, v12, v13, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addChild:withPendingUnitCount:", v27, 1);
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_317;
    v32[3] = &unk_1E949AEB8;
    v33 = v17;
    objc_msgSend(v28, "setCancellationHandler:", v32);

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

void __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  EMLogCategoryMessageLoading();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "Content representation finished loading: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = a1[6];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v7, OS_SIGNPOST_INTERVAL_END, v8, "EDMessageRepositoryContentRepresentationRequest", "Finished processing with success", (uint8_t *)&v9, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

void __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_315(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v13 = 134349056;
    v14 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v5, OS_SIGNPOST_INTERVAL_END, v6, "EDMessageRepositoryContentRepresentationRequest", "Finished processing with failure %{public, name=errorCode}ld", (uint8_t *)&v13, 0xCu);
  }

  EMLogCategoryMessageLoading();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = a1[4];
    objc_msgSend(v3, "ef_publicDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_315_cold_1(v8, v9, (uint64_t)&v13);
  }

  v10 = a1[5];
  objc_msgSend(v3, "ef_secureCodableError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, v12);
  if (!v11)

}

uint64_t __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_317(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)resetPrecomputedThreadScopesForMailboxScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[EDMessageRepository _resetUpdateThrottlersWithLogMessage:](self, "_resetUpdateThrottlersWithLogMessage:", CFSTR("resetting precomputed threads"));
  -[EDMessageRepository performQueryOnSerializationQueue](self, "performQueryOnSerializationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[EDMessageRepository performQueryOnSerializationQueue](self, "performQueryOnSerializationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlockWithCondition:", 1);

  -[EDMessageRepository serializationQueue](self, "serializationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__EDMessageRepository_resetPrecomputedThreadScopesForMailboxScope___block_invoke;
  v9[3] = &unk_1E949B6D0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __67__EDMessageRepository_resetPrecomputedThreadScopesForMailboxScope___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "threadPersistence");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetThreadScopesForMailboxScope:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "performQueryOnSerializationQueue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(*(id *)(a1 + 32), "performQueryOnSerializationQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlockWithCondition:", 0);

}

- (void)setCachedMetadataJSON:(id)a3 forKey:(id)a4 messageID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EDMessageRepository _resetUpdateThrottlersWithLogMessage:](self, "_resetUpdateThrottlersWithLogMessage:", CFSTR("setting cached metadata"));
  -[EDMessageRepository serializationQueue](self, "serializationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__EDMessageRepository_setCachedMetadataJSON_forKey_messageID___block_invoke;
  v15[3] = &unk_1E949B680;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __62__EDMessageRepository_setCachedMetadataJSON_forKey_messageID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCachedMetadataJSON:forKey:messageID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)getCachedMetadataJSONForKey:(id)a3 messageID:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  -[EDMessageRepository _resetUpdateThrottlersWithLogMessage:](self, "_resetUpdateThrottlersWithLogMessage:", CFSTR("getting cached metadata"));
  -[EDMessageRepository messagePersistence](self, "messagePersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cachedMetadataJSONForKey:messageID:", v12, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v9[2](v9, v11);
}

- (void)metadataForAddresses:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, void *))a4;
  -[EDMessageRepository messagePersistence](self, "messagePersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadataForAddresses:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v8);
}

- (void)messagesInConversationIDs:(id)a3 limit:(int64_t)a4 observationIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  os_unfair_lock_s *p_handlersLock;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  -[EDMessageRepository _resetUpdateThrottlersWithLogMessage:](self, "_resetUpdateThrottlersWithLogMessage:", CFSTR("getting messages in conversationIDs"));
  p_handlersLock = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  -[EDMessageRepository queryHandlers](self, "queryHandlers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_handlersLock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "messagesInConversationIDs:limit:", v16, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v11[2](v11, v15);

}

- (void)predictMailboxForMovingMessages:(id)a3 withObserver:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EDMessageRepository asyncWorkScheduler](self, "asyncWorkScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__EDMessageRepository_predictMailboxForMovingMessages_withObserver_completionHandler___block_invoke;
  v15[3] = &unk_1E949CB00;
  v15[4] = self;
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  objc_msgSend(v11, "performBlock:", v15);

}

void __86__EDMessageRepository_predictMailboxForMovingMessages_withObserver_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__EDMessageRepository_predictMailboxForMovingMessages_withObserver_completionHandler___block_invoke_2;
  v4[3] = &unk_1E949CB00;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "performDatabaseWorkInBlockWithHighPriority:", v4);

}

void __86__EDMessageRepository_predictMailboxForMovingMessages_withObserver_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_resetUpdateThrottlersWithLogMessage:", CFSTR("mailbox prediction"));
  objc_msgSend(*(id *)(a1 + 32), "_persistedObjectIDsForObjectIDs:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mailboxPredictionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__EDMessageRepository_predictMailboxForMovingMessages_withObserver_completionHandler___block_invoke_3;
  v5[3] = &unk_1E949EF50;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "predictMailboxForMovingObjectIDs:completionHandler:", v2, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __86__EDMessageRepository_predictMailboxForMovingMessages_withObserver_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "mailboxWasPredicted:", a2);
}

- (id)mailboxPredictionController
{
  os_unfair_lock_s *p_mailboxPredictionControllerLock;
  EDMailboxPredictionController *mailboxPredictionController;
  EDMailboxPredictionController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EDMailboxPredictionController *v10;
  EDMailboxPredictionController *v11;
  EDMailboxPredictionController *v12;

  p_mailboxPredictionControllerLock = &self->_mailboxPredictionControllerLock;
  os_unfair_lock_lock(&self->_mailboxPredictionControllerLock);
  mailboxPredictionController = self->_mailboxPredictionController;
  if (!mailboxPredictionController)
  {
    v5 = [EDMailboxPredictionController alloc];
    -[EDMessageRepository messagePersistence](self, "messagePersistence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepository mailboxPersistence](self, "mailboxPersistence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepository hookRegistry](self, "hookRegistry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageRepository userProfileProvider](self, "userProfileProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[EDMailboxPredictionController initWithMessagePersistence:mailboxPersistence:hookRegistry:userProfileProvider:](v5, "initWithMessagePersistence:mailboxPersistence:hookRegistry:userProfileProvider:", v6, v7, v8, v9);
    v11 = self->_mailboxPredictionController;
    self->_mailboxPredictionController = v10;

    mailboxPredictionController = self->_mailboxPredictionController;
  }
  v12 = mailboxPredictionController;
  os_unfair_lock_unlock(p_mailboxPredictionControllerLock);
  return v12;
}

- (void)loadOlderMessagesForMailboxes:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDMessageRepository _resetUpdateThrottlersWithLogMessage:](self, "_resetUpdateThrottlersWithLogMessage:", CFSTR("loading older messages"));
  +[EDMessageRepository log](EDMessageRepository, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Loading older messages for %lu mailboxes", (uint8_t *)&v6, 0xCu);
  }

  -[EDFetchController performFetchOfType:mailboxObjectIds:](self->_fetchController, "performFetchOfType:mailboxObjectIds:", 65664, v4);
}

- (void)messageObjectIDForURL:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  -[EDMessageRepository messagePersistence](self, "messagePersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageObjectIDForURL:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("invalid URL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6[2](v6, v8, v9);
  if (!v8)

}

- (void)messageObjectIDsForSearchableItemIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void (**v20)(id, void *, void *, _QWORD);
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = (void (**)(id, void *, void *, _QWORD))a4;
  v6 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
  v22 = (void *)objc_opt_new();
  v21 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v19;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        -[EDMessageRepository messagePersistence](self, "messagePersistence");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "longLongValue");
        v23 = 0;
        v14 = objc_msgSend(v12, "globalIDForMessageWithDatabaseID:mailboxScope:", v13, &v23);
        v15 = v23;

        if (v14 && (objc_msgSend(v6, "containsIndex:", v14) & 1) == 0)
        {
          objc_msgSend(v6, "addIndex:", v14);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E258]), "initWithGlobalMessageID:mailboxScope:", v14, v15);
          objc_msgSend(v22, "addObject:", v16);
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v8);
  }

  +[EDMessageRepository log](EDMessageRepository, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 138543618;
    v29 = v7;
    v30 = 2048;
    v31 = v18;
    _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Mapped spotlight identifiers %{public}@ to %lu message objectIDs", buf, 0x16u);
  }

  v20[2](v20, v22, v21, 0);
}

- (EDWebContentParser)remoteContentParser
{
  os_unfair_lock_s *p_remoteContentParserLock;
  EDWebContentParser *remoteContentParser;
  id v5;
  EDWebContentParser *v6;
  EDWebContentParser *v7;
  EDWebContentParser *v8;

  p_remoteContentParserLock = &self->_remoteContentParserLock;
  os_unfair_lock_lock(&self->_remoteContentParserLock);
  remoteContentParser = self->_remoteContentParser;
  if (!remoteContentParser)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
    v6 = -[EDWebContentParser initWithOptions:cancelationToken:]([EDWebContentParser alloc], "initWithOptions:cancelationToken:", 1, v5);
    v7 = self->_remoteContentParser;
    self->_remoteContentParser = v6;

    remoteContentParser = self->_remoteContentParser;
  }
  v8 = remoteContentParser;
  os_unfair_lock_unlock(p_remoteContentParserLock);
  return v8;
}

- (void)noteViewOfRemoteContentLinks:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDMessageRepository remoteContentManager](self, "remoteContentManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteViewOfRemoteContentLinks:", v5);

}

- (void)getRemoteContentURLInfoOrderedBy:(int64_t)a3 inReverseOrder:(BOOL)a4 limit:(int64_t)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  void (**v10)(id, void *, void *, id);
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a4;
  v10 = (void (**)(id, void *, void *, id))a6;
  -[EDMessageRepository remoteContentPersistence](self, "remoteContentPersistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v11, "getRemoteContentURLInfoOrderedBy:inReverseOrder:limit:error:", a3, v7, a5, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  objc_msgSend(v12, "first");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "second");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v14, v15, v13);

}

- (void)parseRemoteContentURLsFromMessageWithObjectID:(id)a3 requestID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  EDMessageRepository *v17;
  id v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D1E130], "optionsWithRequestedRepresentationType:networkUsage:", *MEMORY[0x1E0D1DBE0], 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMessageRepository messagePersistence](self, "messagePersistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__EDMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_requestID_completionHandler___block_invoke;
  v15[3] = &unk_1E949EFA0;
  v12 = v9;
  v18 = v12;
  v13 = v8;
  v16 = v13;
  v17 = self;
  v14 = (id)objc_msgSend(v11, "requestContentForMessageObjectID:requestID:options:delegate:completionHandler:", v13, a4, v10, 0, v15);

}

void __97__EDMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_requestID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "contentURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v7);
      objc_msgSend(*(id *)(a1 + 40), "remoteContentParser");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __97__EDMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_requestID_completionHandler___block_invoke_2;
      v11[3] = &unk_1E949EF78;
      v12 = *(id *)(a1 + 48);
      objc_msgSend(v9, "parseHTMLData:characterEncodingName:withOptions:forMessage:withSubject:completionHandler:", v8, 0, 1, 0, 0, v11);

    }
    else
    {
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v8);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __97__EDMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_requestID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "remoteContentLinks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

- (void)brandIndicatorForLocation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[EDMessageRepository asyncWorkScheduler](self, "asyncWorkScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__EDMessageRepository_brandIndicatorForLocation_completionHandler___block_invoke;
  v11[3] = &unk_1E949CCB0;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "performVoucherPreservingBlock:", v11);

}

void __67__EDMessageRepository_brandIndicatorForLocation_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__EDMessageRepository_brandIndicatorForLocation_completionHandler___block_invoke_2;
  v4[3] = &unk_1E949CCB0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performDatabaseWorkInBlockWithHighPriority:", v4);

}

void __67__EDMessageRepository_brandIndicatorForLocation_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "brandIndicatorForURL:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)recategorizeMessageSinceDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  EDMessageRepository *v9;

  v4 = a3;
  -[EDMessageRepository asyncWorkScheduler](self, "asyncWorkScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__EDMessageRepository_recategorizeMessageSinceDate___block_invoke;
  v7[3] = &unk_1E949B6D0;
  v6 = v4;
  v8 = v6;
  v9 = self;
  objc_msgSend(v5, "performVoucherPreservingBlock:", v7);

}

void __52__EDMessageRepository_recategorizeMessageSinceDate___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EDMessageAuthenticationAndCategoryMigrator *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  EDMessageAuthenticationAndCategoryMigrator *v18;
  EDMessageAuthenticationAndCategoryMigrator *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  EDMessageAuthenticationAndCategoryMigrator *v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInMailboxWithType:", 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesNewerThanDisplayDate:", *(_QWORD *)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v3 = objc_opt_class();
  v4 = (void *)MEMORY[0x1E0CB3528];
  v26[0] = v21;
  v26[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v2, "initWithTargetClass:predicate:sortDescriptors:", v3, v6, v8);

  v10 = [EDMessageAuthenticationAndCategoryMigrator alloc];
  objc_msgSend(*(id *)(a1 + 40), "categoryPersistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "messageChangeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageCategorizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "messageChangeManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageAuthenticator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "messagePersistence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "activityPersistence");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[EDMessageAuthenticationAndCategoryMigrator initWithCategoryPersistence:categorizer:authenticator:messagePersistence:activityPersistence:reason:](v10, "initWithCategoryPersistence:categorizer:authenticator:messagePersistence:activityPersistence:reason:", v11, v13, v15, v16, v17, 1);

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52__EDMessageRepository_recategorizeMessageSinceDate___block_invoke_2;
  v23[3] = &unk_1E949EFC8;
  v24 = v18;
  v19 = v18;
  v20 = -[EDMessageAuthenticationAndCategoryMigrator startMigrationIfNecessaryWithCategorizationQuery:authenticationQuery:completion:](v19, "startMigrationIfNecessaryWithCategorizationQuery:authenticationQuery:completion:", v9, 0, v23);

}

- (id)messageReconciliationQueries
{
  os_unfair_lock_s *p_handlersLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  p_handlersLock = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  -[EDMessageRepository queryHandlers](self, "queryHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_806);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_flatten");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_handlersLock);
  return v7;
}

- (id)threadReconciliationQueries
{
  os_unfair_lock_s *p_handlersLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  p_handlersLock = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  -[EDMessageRepository queryHandlers](self, "queryHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_807);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_flatten");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_handlersLock);
  return v7;
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  os_unfair_lock_s *p_handlersLock;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  if (!a3)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    p_handlersLock = &self->_handlersLock;
    os_unfair_lock_lock(&self->_handlersLock);
    -[EDMessageRepository queryHandlers](self, "queryHandlers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__EDMessageRepository_contentProtectionStateChanged_previousState___block_invoke;
    v8[3] = &unk_1E949EFF0;
    v8[4] = &v9;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

    os_unfair_lock_unlock(p_handlersLock);
    if (*((_BYTE *)v10 + 24))
    {
      -[EDMessageRepository messagePersistence](self, "messagePersistence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reconcileJournalWithCompletionBlock:", 0);

    }
    _Block_object_dispose(&v9, 8);
  }
}

void __67__EDMessageRepository_contentProtectionStateChanged_previousState___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  char v7;

  objc_msgSend(a3, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "queryOptions");

  if ((v7 & 8) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setQueryHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_queryHandlers, a3);
}

- (void)setQueryHandlersByThreadScope:(id)a3
{
  objc_storeStrong((id *)&self->_queryHandlersByThreadScope, a3);
}

- (NSMutableSet)handlerTokens
{
  return self->_handlerTokens;
}

- (void)setHandlerTokens:(id)a3
{
  objc_storeStrong((id *)&self->_handlerTokens, a3);
}

- (void)setHookRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_hookRegistry, a3);
}

- (void)setMessagePersistence:(id)a3
{
  objc_storeStrong((id *)&self->_messagePersistence, a3);
}

- (EDConversationPersistence)conversationPersistence
{
  return self->_conversationPersistence;
}

- (void)setThreadPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_threadPersistence, a3);
}

- (EDRemoteContentPersistence)remoteContentPersistence
{
  return self->_remoteContentPersistence;
}

- (EDRichLinkPersistence)richLinkPersistence
{
  return self->_richLinkPersistence;
}

- (void)setRichLinkPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_richLinkPersistence, a3);
}

- (EDAttachmentPersistenceManager)attachmentPersistenceManager
{
  return self->_attachmentPersistenceManager;
}

- (void)setAttachmentPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentPersistenceManager, a3);
}

- (EDMessageChangeManager)messageChangeManager
{
  return self->_messageChangeManager;
}

- (void)setMessageChangeManager:(id)a3
{
  objc_storeStrong((id *)&self->_messageChangeManager, a3);
}

- (OS_dispatch_queue)serializationQueue
{
  return self->_serializationQueue;
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (void)setCategoryPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_categoryPersistence, a3);
}

- (EDSenderPersistence)senderPersistence
{
  return self->_senderPersistence;
}

- (void)setSenderPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_senderPersistence, a3);
}

- (EDBusinessPersistence)businessPersistence
{
  return self->_businessPersistence;
}

- (void)setBusinessPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_businessPersistence, a3);
}

- (EDActivityPersistence)activityPersistence
{
  return self->_activityPersistence;
}

- (void)setActivityPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_activityPersistence, a3);
}

- (EDCategoryCoreAnalyticsLogger)categoryAnalyticsLogger
{
  return self->_categoryAnalyticsLogger;
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (EDSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (EDFetchController)fetchController
{
  return self->_fetchController;
}

- (EDRemoteContentManager)remoteContentManager
{
  return self->_remoteContentManager;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (EDListUnsubscribeHandler)listUnsubscribeHandler
{
  return self->_listUnsubscribeHandler;
}

- (EFLocked)oneTimeCodeObservers
{
  return self->_oneTimeCodeObservers;
}

- (void)setOneTimeCodeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_oneTimeCodeObservers, a3);
}

- (EFScheduler)delayedMessageActionScheduler
{
  return self->_delayedMessageActionScheduler;
}

- (int64_t)oneTimeCodeMessageID
{
  return self->_oneTimeCodeMessageID;
}

- (void)setOneTimeCodeMessageID:(int64_t)a3
{
  self->_oneTimeCodeMessageID = a3;
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (NSUserDefaults)sharedOneTimeCodeUserDefaults
{
  return self->_sharedOneTimeCodeUserDefaults;
}

- (void)setSharedOneTimeCodeUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_sharedOneTimeCodeUserDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedOneTimeCodeUserDefaults, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_delayedMessageActionScheduler, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeObservers, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationController, 0);
  objc_storeStrong((id *)&self->_listUnsubscribeHandler, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_destroyWeak(&self->_updateThrottlerResetBlock);
  objc_storeStrong((id *)&self->_updateThrottlerResetScheduler, 0);
  objc_storeStrong((id *)&self->_remoteContentCacheConfiguration, 0);
  objc_storeStrong((id *)&self->_remoteContentManager, 0);
  objc_storeStrong((id *)&self->_observerResumer, 0);
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_categoryAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_activityPersistence, 0);
  objc_storeStrong((id *)&self->_businessPersistence, 0);
  objc_storeStrong((id *)&self->_senderPersistence, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_messageListItemScheduler, 0);
  objc_storeStrong((id *)&self->_asyncWorkScheduler, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_serializationQueue, 0);
  objc_storeStrong((id *)&self->_performQueryOnSerializationQueue, 0);
  objc_storeStrong((id *)&self->_messageChangeManager, 0);
  objc_storeStrong((id *)&self->_attachmentPersistenceManager, 0);
  objc_storeStrong((id *)&self->_richLinkPersistence, 0);
  objc_storeStrong((id *)&self->_remoteContentPersistence, 0);
  objc_storeStrong((id *)&self->_threadPersistence, 0);
  objc_storeStrong((id *)&self->_conversationPersistence, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_handlerTokens, 0);
  objc_storeStrong((id *)&self->_queryHandlersByThreadScope, 0);
  objc_storeStrong((id *)&self->_queryHandlers, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_remoteContentParser, 0);
  objc_storeStrong((id *)&self->_mailboxPredictionController, 0);
}

void __60__EDMessageRepository_performQuery_limit_completionHandler___block_invoke_54_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "received error while querying for messages: %@, %{public}@", v4, v5);

}

- (void)_performQuery:(uint64_t)a1 withObserver:(NSObject *)a2 observationIdentifier:helperObserver:completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_FAULT, "Existing query handler exists for observation identifier: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)_performSuppressNotAuthenticatedChangeAction:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Failed to suppress Not Authenticated warning for objectID:%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __88__EDMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Could not find a message for persistent ID: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __88__EDMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "Message %@ does not have a base path", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __106__EDMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_315_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Content representation failed to load: %{public}@ with error %{public}@", v4, v5);

}

@end
