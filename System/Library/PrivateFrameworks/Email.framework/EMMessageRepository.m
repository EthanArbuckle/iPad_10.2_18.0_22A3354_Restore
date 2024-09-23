@implementation EMMessageRepository

id __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

  if (*(_BYTE *)(a1 + 64)
    && (objc_msgSend(*(id *)(a1 + 32), "_existingObservedItemForObjectID:", v3),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        (v8 = v7) != 0))
  {
    objc_msgSend(v7, "summary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v8, "displayMessageObjectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
    +[EMMessageRepository log](EMMessageRepository, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v17 = 134218242;
      v18 = v13;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_1B99BB000, v12, OS_LOG_TYPE_DEFAULT, "<%p> Returning cached result: %{public}@", (uint8_t *)&v17, 0x16u);
    }

    v14 = v8;
    objc_msgSend(v4, "finishWithResult:", v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    v14 = 0;
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v4, v3);
  }
  objc_msgSend(v4, "future");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)messageListItemsForObjectIDs:(id)a3 observationIdentifier:(id)a4
{
  -[EMMessageRepository _messageListItemsForObjectIDs:observationIdentifier:checkCache:](self, "_messageListItemsForObjectIDs:observationIdentifier:checkCache:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_existingObservedItemForObjectID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_messageListItemCacheLock;
  void *v6;

  v4 = a3;
  p_messageListItemCacheLock = &self->_messageListItemCacheLock;
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  -[NSMapTable objectForKey:](self->_observedMessageListItemCache, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_messageListItemCacheLock);

  return v6;
}

- (EMMailboxRepository)mailboxRepository
{
  return self->_mailboxRepository;
}

- (id)_messageListItemsForObjectIDs:(id)a3 observationIdentifier:(id)a4 checkCache:(BOOL)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  void *v36;
  void *v37;
  id v40;
  NSObject *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  EMMessageRepository *v46;
  id v47;
  NSObject *v48;
  _QWORD v49[4];
  id v50;
  NSObject *v51;
  os_signpost_id_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  id v58;
  id v59;
  _QWORD v60[5];
  id v61;
  id v62;
  id v63;
  BOOL v64;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  EMMessageRepository *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v47 = a4;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v41 = _os_activity_create(&dword_1B99BB000, "-[EMMessageRepository _messageListItemsForObjectIDs:observationIdentifier:checkCache:]", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v41, &state);
  v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke;
  v60[3] = &unk_1E70F4AC0;
  v60[4] = self;
  v64 = a5;
  v10 = v8;
  v61 = v10;
  v11 = v43;
  v62 = v11;
  v12 = v44;
  v63 = v12;
  objc_msgSend(v45, "ef_map:", v60);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v57[0] = v9;
  v57[1] = 3221225472;
  v57[2] = __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_251;
  v57[3] = &unk_1E70F4B60;
  v46 = self;
  v57[4] = self;
  v40 = v12;
  v58 = v40;
  v13 = v11;
  v59 = v13;
  v48 = MEMORY[0x1BCCC8C10](v57);
  v14 = (id)MEMORY[0x1E0C9AA60];
  if (objc_msgSend(v13, "count"))
  {
    -[EMMessageRepository _localInMemoryMessageListItemsForObjectIDs:observationIdentifier:](self, "_localInMemoryMessageListItemsForObjectIDs:observationIdentifier:", v13, v47);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v54 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v18, "displayMessageObjectID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v46, CFSTR("EMMessageRepository.m"), 487, CFSTR("Unexpected objectID type"));

          }
          objc_msgSend(v18, "summary");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20 == 0;

          if (v21)
            objc_msgSend(v10, "addObject:", v19);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
      }
      while (v15);
    }

    objc_msgSend(v14, "ef_mapSelector:", sel_objectID);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectsInArray:", v23);

    if (objc_msgSend(v14, "count"))
    {
      if (objc_msgSend(v13, "count"))
      {
        +[EMMessageRepository log](EMMessageRepository, "log");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = objc_msgSend(v14, "count");
          -[EMMessageRepository _descriptionStringForObjectIDs:]((uint64_t)v46, v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v67 = v46;
          v68 = 2048;
          v69 = v25;
          v70 = 2114;
          v71 = v26;
          _os_log_impl(&dword_1B99BB000, v24, OS_LOG_TYPE_DEFAULT, "<%p> Only some message list items found in the inMemory cache. localMessageListItems.count:%lu objectIDsToRequest: %{public}@", buf, 0x20u);

        }
        v27 = v48;
      }
      else
      {
        +[EMMessageRepository log](EMMessageRepository, "log");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          -[EMMessageRepository _descriptionStringForObjectIDs:]((uint64_t)v46, v13);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v67 = v46;
          v68 = 2114;
          v69 = (uint64_t)v29;
          _os_log_impl(&dword_1B99BB000, v28, OS_LOG_TYPE_DEFAULT, "<%p> Found all items in local cache: %{public}@", buf, 0x16u);

        }
        v24 = v48;
        ((void (*)(NSObject *, id, _QWORD, _QWORD, _QWORD))v48[2].isa)(v48, v14, MEMORY[0x1E0C9AA70], 0, 0);
        v27 = 0;
      }

      v48 = v27;
    }
  }
  if (objc_msgSend(v13, "count") || objc_msgSend(v10, "count"))
  {
    v30 = +[EMDaemonInterfaceRequest uniqueRequestID](EMDaemonInterfaceRequest, "uniqueRequestID");
    +[EMMessageRepository log](EMMessageRepository, "log");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      -[EMMessageRepository _descriptionStringForObjectIDs:]((uint64_t)v46, v13);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v67 = v46;
      v68 = 2114;
      v69 = (uint64_t)v32;
      _os_log_impl(&dword_1B99BB000, v31, OS_LOG_TYPE_DEFAULT, "<%p> Requesting message list items: %{public}@", buf, 0x16u);

    }
    +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      v35 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v13, "count"));
      *(_DWORD *)buf = 67240192;
      LODWORD(v67) = v35;
      _os_signpost_emit_with_name_impl(&dword_1B99BB000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v30, "EMMessageRepositoryMessageListItems", "Requesting messages for object IDs %{public, name=count}u", buf, 8u);
    }

    -[EMRepository connection](v46, "connection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "reattemptingRemoteObjectProxy");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_270;
    v49[3] = &unk_1E70F4B88;
    v51 = v48;
    v50 = v14;
    v52 = v30;
    objc_msgSend(v37, "messageListItemsForObjectIDs:requestID:observationIdentifier:loadSummaryForAdditionalObjectIDs:completionHandler:", v13, v30, v47, v10, v49);

  }
  os_activity_scope_leave(&state);

  return v42;
}

void __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_2(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  int v23;
  int v24;
  id obj;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[4];
  int v36;
  __int16 v37;
  int v38;
  _BYTE buf[24];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "prepareRepositoryObjects:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(v2 - 1), "currentObservers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = *v2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v32 != v4)
          objc_enumerationMutation(obj);
        v6 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_cachedItemForItem:observers:validationBlock:", v6, v26, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = *(void **)(a1 + 48);
        objc_msgSend(v7, "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        +[EMMessageRepository log](EMMessageRepository, "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v7, "itemID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "future");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v13;
          *(_WORD *)&buf[22] = 2114;
          v40 = v14;
          _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Finishing future with message list item: %{public}@ -> %{public}@", buf, 0x20u);

        }
        objc_msgSend(v10, "finishWithResult:", v7);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v3);
  }

  v15 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_254;
  v28[3] = &unk_1E70F4AE8;
  v16 = *(void **)(a1 + 56);
  v17 = *(id *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 32);
  v29 = v17;
  v30 = v18;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v28);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v40 = 0;
  v19 = *(void **)(a1 + 48);
  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_256;
  v27[3] = &unk_1E70F4B10;
  v27[4] = *(_QWORD *)(a1 + 32);
  v27[5] = buf;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v27);
  if (*(_BYTE *)(a1 + 80))
  {
    +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = *(_QWORD *)(a1 + 72);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      v23 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(*(id *)(a1 + 64), "count"));
      v24 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
      *(_DWORD *)v35 = 67240448;
      v36 = v23;
      v37 = 1026;
      v38 = v24;
      _os_signpost_emit_with_name_impl(&dword_1B99BB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "EMMessageRepositoryMessageListItems", "Request finished %{public, name=results}u %{public, name=orphaned}u", v35, 0xEu);
    }

  }
  _Block_object_dispose(buf, 8);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EMMessageRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_26 != -1)
    dispatch_once(&log_onceToken_26, block);
  return (OS_os_log *)(id)log_log_26;
}

- (id)startCountingQuery:(id)a3 includingServerCountsForMailboxScope:(id)a4 withObserver:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _EMMessageRepositoryCountingQueryObserver *v12;
  void *v13;
  _EMMessageRepositoryCountingQueryObserver *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  EMMessageRepository *v23;
  _EMMessageRepositoryCountingQueryObserver *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_EMMessageRepositoryCountingQueryObserver initWithRepository:queryIdentifier:includingServerCountsForMailboxScope:observer:]([_EMMessageRepositoryCountingQueryObserver alloc], "initWithRepository:queryIdentifier:includingServerCountsForMailboxScope:observer:", self, v11, v9, v10);
  os_unfair_lock_lock(&self->_observersLock);
  -[NSHashTable addObject:](self->_recoverableObservers, "addObject:", v12);
  os_unfair_lock_unlock(&self->_observersLock);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "addCancelable:", v12);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __92__EMMessageRepository_startCountingQuery_includingServerCountsForMailboxScope_withObserver___block_invoke;
  v22 = &unk_1E70F2070;
  v23 = self;
  v14 = v12;
  v24 = v14;
  objc_msgSend(v13, "addCancelationBlock:", &v19);
  -[EMMessageRepository queryCountCache](self, "queryCountCache", v19, v20, v21, v22, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v10, "messageRepository:query:countDidChange:", self, v8, objc_msgSend(v16, "integerValue"));
  -[EMRepository connection](self, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMMessageRepositoryCountingQueryObserver performWithRemoteConnection:](v14, "performWithRemoteConnection:", v17);

  return v13;
}

- (void)setQueryCount:(id)a3 forQueryIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[EMMessageRepository queryCountCache](self, "queryCountCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v6);

}

- (NSCache)queryCountCache
{
  return self->_queryCountCache;
}

- (void)didStartBlockingMainThreadForFuture:(id)a3
{
  EMRemoteConnectionRecoveryAssertion *v4;
  EMRemoteConnectionRecoveryAssertion *connectionRecoveryAssertion;
  id v6;

  -[EMRepository connection](self, "connection", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestRecoveryAssertion");
  v4 = (EMRemoteConnectionRecoveryAssertion *)objc_claimAutoreleasedReturnValue();
  connectionRecoveryAssertion = self->_connectionRecoveryAssertion;
  self->_connectionRecoveryAssertion = v4;

}

- (NSArray)currentObservers
{
  os_unfair_lock_s *p_observersLock;
  void *v4;
  void *v5;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  -[NSMapTable keyEnumerator](self->_wrappedObserversByActualObserver, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_observersLock);
  return (NSArray *)v5;
}

- (id)_cachedItemForItem:(id)a3 observers:(id)a4 validationBlock:(id)a5
{
  id v8;
  id v9;
  unsigned int (**v10)(void *, id);
  unsigned int (**v11)(void *, id);
  id v12;
  void *v13;
  _BOOL4 v14;
  os_unfair_lock_s *p_messageListItemCacheLock;
  NSMapTable *observedMessageListItemCache;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSMapTable *unobservedMessageListItemCache;
  void *v23;
  void *v24;
  void *v25;
  NSMapTable *v26;
  void *v27;
  void *v28;
  NSMapTable *v29;
  NSMapTable *v30;

  v8 = a3;
  v9 = a4;
  v10 = (unsigned int (**)(void *, id))a5;
  if (v10)
    v11 = v10;
  else
    v11 = (unsigned int (**)(void *, id))&__block_literal_global_289;
  v12 = v8;
  objc_msgSend(v12, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[EMMessageRepository _anyObserver:containsObjectID:](self, "_anyObserver:containsObjectID:", v9, v13);

  p_messageListItemCacheLock = &self->_messageListItemCacheLock;
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  if (!v14)
  {
    unobservedMessageListItemCache = self->_unobservedMessageListItemCache;
    objc_msgSend(v12, "objectID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](unobservedMessageListItemCache, "objectForKey:", v23);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    if (v21 && v11[2](v11, v21))
    {
      if (objc_msgSend(v21, "conformsToProtocol:", &unk_1EF23F670))
      {
        objc_msgSend(v12, "changeFrom:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "applyToMessageListItem:", v21);

      }
      v21 = v21;
      v25 = v12;
      v19 = v21;
    }
    else
    {
      v29 = self->_unobservedMessageListItemCache;
      objc_msgSend(v12, "objectID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](v29, "setObject:forKey:", v12, v25);
      v19 = v12;
    }
    goto LABEL_21;
  }
  observedMessageListItemCache = self->_observedMessageListItemCache;
  objc_msgSend(v12, "objectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](observedMessageListItemCache, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && v11[2](v11, v18))
  {
    v19 = v18;
    v20 = v12;
    v21 = v19;
  }
  else
  {
    v26 = self->_unobservedMessageListItemCache;
    objc_msgSend(v12, "objectID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v26, "objectForKey:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28 && v11[2](v11, v28))
    {
      v19 = v28;
      v28 = v12;
      v21 = v19;
    }
    else
    {
      v21 = 0;
      v19 = v12;
    }

    v30 = self->_observedMessageListItemCache;
    objc_msgSend(v12, "objectID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v30, "setObject:forKey:", v19, v20);
  }

  if (objc_msgSend(v21, "conformsToProtocol:", &unk_1EF23F670))
  {
    objc_msgSend(v12, "changeFrom:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "applyToMessageListItem:", v21);
LABEL_21:

  }
  os_unfair_lock_unlock(p_messageListItemCacheLock);

  return v19;
}

- (BOOL)_anyObserver:(id)a3 containsObjectID:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__EMMessageRepository__anyObserver_containsObjectID___block_invoke;
  v8[3] = &unk_1E70F4CF0;
  v9 = v5;
  v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "ef_any:", v8);

  return (char)a3;
}

- (void)_detectChangesForMatchedAddedObjectIDs:(id)a3 observerationIdentifier:(id)a4 matchedChangesHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v20 = a4;
  v21 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_observedMessageListItemCache, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_messageListItemCacheLock);
  if (objc_msgSend(v9, "count"))
  {
    v16 = (void *)MEMORY[0x1E0D1EEC0];
    objc_msgSend(v9, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageRepository _messageListItemsForObjectIDs:observationIdentifier:checkCache:](self, "_messageListItemsForObjectIDs:observationIdentifier:checkCache:", v17, v20, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "combine:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __108__EMMessageRepository__detectChangesForMatchedAddedObjectIDs_observerationIdentifier_matchedChangesHandler___block_invoke;
    v22[3] = &unk_1E70F5148;
    v23 = v9;
    v24 = v21;
    objc_msgSend(v19, "addSuccessBlock:", v22);

  }
}

uint64_t __53__EMMessageRepository__anyObserver_containsObjectID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "observerContainsObjectID:", *(_QWORD *)(a1 + 32));
}

- (void)didFinishBlockingMainThreadForFuture:(id)a3
{
  EMRemoteConnectionRecoveryAssertion *connectionRecoveryAssertion;

  -[EMRemoteConnectionRecoveryAssertion invalidate](self->_connectionRecoveryAssertion, "invalidate", a3);
  connectionRecoveryAssertion = self->_connectionRecoveryAssertion;
  self->_connectionRecoveryAssertion = 0;

}

+ (id)remoteInterface
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, v28, objc_opt_class(), 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0C99E60];
  v30 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0C99E60];
  v71 = (void *)v31;
  v33 = objc_opt_class();
  objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF23EB98);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FF50);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF24DF00);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_observer_matchedAddedObjectIDs_before_extraInfo_, 1, 0);
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v82, sel_observer_matchedAddedObjectIDs_before_extraInfo_, 3, 0);
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_observer_matchedAddedObjectIDs_after_extraInfo_, 1, 0);
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v82, sel_observer_matchedAddedObjectIDs_after_extraInfo_, 3, 0);
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_observer_matchedMovedObjectIDs_before_extraInfo_, 1, 0);
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v82, sel_observer_matchedMovedObjectIDs_before_extraInfo_, 3, 0);
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_observer_matchedMovedObjectIDs_after_extraInfo_, 1, 0);
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v82, sel_observer_matchedMovedObjectIDs_after_extraInfo_, 3, 0);
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v77, sel_observer_matchedChangesForObjectIDs_, 1, 0);
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_observer_matchedDeletedObjectIDs_, 1, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_observer_replacedExistingObjectID_withNewObjectID_, 1, 0);

  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_observer_replacedExistingObjectID_withNewObjectID_, 2, 0);
  v38 = (void *)MEMORY[0x1E0C99E60];
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  objc_msgSend(v38, "setWithObjects:", v39, v40, objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_observer_matchedOldestItemsUpdatedForMailboxes_, 1, 0);

  objc_msgSend(v36, "setInterface:forSelector:argumentIndex:ofReply:", v79, sel_observer_wasUpdated_, 1, 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FC10);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_performQuery_limit_completionHandler_, 0, 1);
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v76, sel_performMessageChangeAction_requestID_returnUndoAction_completionHandler_, 0, 0);
  v43 = (void *)MEMORY[0x1E0C99E60];
  v44 = objc_opt_class();
  objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_predictMailboxForMovingMessages_withObserver_completionHandler_, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF24E380);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setInterface:forSelector:argumentIndex:ofReply:", v46, sel_predictMailboxForMovingMessages_withObserver_completionHandler_, 1, 0);

  objc_msgSend(v42, "setInterface:forSelector:argumentIndex:ofReply:", v80, sel_predictMailboxForMovingMessages_withObserver_completionHandler_, 0, 1);
  v47 = (void *)MEMORY[0x1E0C99E60];
  v48 = objc_opt_class();
  objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_loadOlderMessagesForMailboxes_, 0, 0);

  v50 = (void *)MEMORY[0x1E0C99E60];
  v51 = objc_opt_class();
  objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v52, sel_messagesInConversationIDs_limit_observationIdentifier_completionHandler_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_messagesInConversationIDs_limit_observationIdentifier_completionHandler_, 2, 0);

  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_messagesInConversationIDs_limit_observationIdentifier_completionHandler_, 0, 1);
  +[EMContentRepresentation contentRequestDelegateInterface](EMContentRepresentation, "contentRequestDelegateInterface");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setInterface:forSelector:argumentIndex:ofReply:", v54, sel_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler_, 3, 0);

  +[EMContentRepresentation distantContentRepresentationInterface](EMContentRepresentation, "distantContentRepresentationInterface");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setInterface:forSelector:argumentIndex:ofReply:", v55, sel_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler_, 0, 1);

  objc_msgSend(v42, "setInterface:forSelector:argumentIndex:ofReply:", v36, sel_performQuery_withObserver_observationIdentifier_helperObserver_completionHandler_, 1, 0);
  objc_msgSend(v42, "setInterface:forSelector:argumentIndex:ofReply:", v80, sel_performQuery_withObserver_observationIdentifier_helperObserver_completionHandler_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF24E6C0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_queryHelperDidFindMessages_, 0, 0);
  objc_msgSend(v56, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_queryHelperDidAddMessages_, 0, 0);
  objc_msgSend(v56, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_queryHelperMessageFlagsDidChangeForMessages_, 0, 0);
  objc_msgSend(v56, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_queryHelperDidUpdateMessages_forKeyPaths_, 0, 0);
  objc_msgSend(v56, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_queryHelperDidUpdateMessages_forKeyPaths_, 1, 0);
  objc_msgSend(v56, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_queryHelperObjectIDDidChangeForMessage_oldObjectID_oldConversationID_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setClasses:forSelector:argumentIndex:ofReply:", v57, sel_queryHelperObjectIDDidChangeForMessage_oldObjectID_oldConversationID_, 1, 0);

  objc_msgSend(v56, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_queryHelperDidDeleteMessages_, 0, 0);
  objc_msgSend(v56, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_queryHelperConversationIDDidChangeForMessages_fromConversationID_, 0, 0);
  objc_msgSend(v42, "setInterface:forSelector:argumentIndex:ofReply:", v56, sel_performQuery_withObserver_observationIdentifier_helperObserver_completionHandler_, 3, 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF24E288);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setInterface:forSelector:argumentIndex:ofReply:", v79, sel_countDidChange_acknowledgementToken_, 1, 0);
  objc_msgSend(v42, "setInterface:forSelector:argumentIndex:ofReply:", v58, sel_startCountingQuery_includingServerCountsForMailboxScope_withObserver_completionHandler_, 2, 0);
  objc_msgSend(v42, "setInterface:forSelector:argumentIndex:ofReply:", v80, sel_startCountingQuery_includingServerCountsForMailboxScope_withObserver_completionHandler_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF24EF00);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setInterface:forSelector:argumentIndex:ofReply:", v59, sel_startObservingOneTimeCode_completionHandler_, 0, 0);
  objc_msgSend(v42, "setInterface:forSelector:argumentIndex:ofReply:", v80, sel_startObservingOneTimeCode_completionHandler_, 0, 1);
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler_, 0, 0);
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler_, 3, 0);
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v75, sel_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler_, 0, 1);
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v73, sel_messageListItemsForObjectIDs_requestID_observationIdentifier_loadSummaryForAdditionalObjectIDs_completionHandler_, 1, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v60, sel_messageObjectIDForURL_completionHandler_, 0, 0);

  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_messageObjectIDForURL_completionHandler_, 0, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v61, sel_messageObjectIDForURL_completionHandler_, 1, 1);

  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_messageObjectIDsForSearchableItemIdentifiers_completionHandler_, 0, 1);
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v74, sel_messageObjectIDsForSearchableItemIdentifiers_completionHandler_, 1, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_messageObjectIDsForSearchableItemIdentifiers_completionHandler_, 2, 1);

  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v78, sel_noteViewOfRemoteContentLinks_, 0, 0);
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v71, sel_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_completionHandler_, 0, 1);
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v71, sel_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_completionHandler_, 1, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_parseRemoteContentURLsFromMessageWithObjectID_requestID_completionHandler_, 0, 0);

  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v78, sel_parseRemoteContentURLsFromMessageWithObjectID_requestID_completionHandler_, 0, 1);
  v64 = (void *)MEMORY[0x1E0C99E60];
  v65 = objc_opt_class();
  objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v66, sel_requestAttachmentMetadataForMessageIDs_completionHandler_, 0, 1);

  v67 = (void *)MEMORY[0x1E0C99E60];
  v68 = objc_opt_class();
  objc_msgSend(v67, "setWithObjects:", v68, objc_opt_class(), 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_requestRichLinkURLsForMessageIDs_completionHandler_, 0, 1);

  return v42;
}

- (EMMessageRepository)initWithRemoteConnection:(id)a3 mailboxRepository:(id)a4 vipManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  EMMessageRepository *v11;
  EMMessageRepository *v12;
  uint64_t v13;
  NSMapTable *observedMessageListItemCache;
  uint64_t v15;
  NSMapTable *unobservedMessageListItemCache;
  uint64_t v17;
  NSMapTable *wrappedObserversByActualObserver;
  uint64_t v19;
  NSMutableSet *inMemoryThreadQueryHandlers;
  uint64_t v21;
  NSHashTable *recoverableObservers;
  NSCache *v23;
  NSCache *queryCountCache;
  EFPromise *v25;
  EFPromise *remoteContentCachePromise;
  EFLazyCache *v27;
  EFLazyCache *brandIndicatorsCache;
  void *v29;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)EMMessageRepository;
  v11 = -[EMRepository initWithRemoteConnection:](&v34, sel_initWithRemoteConnection_, v8);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_vipManager, a5);
    objc_storeStrong((id *)&v12->_mailboxRepository, a4);
    v12->_messageListItemCacheLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    observedMessageListItemCache = v12->_observedMessageListItemCache;
    v12->_observedMessageListItemCache = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    unobservedMessageListItemCache = v12->_unobservedMessageListItemCache;
    v12->_unobservedMessageListItemCache = (NSMapTable *)v15;

    v12->_observersLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    wrappedObserversByActualObserver = v12->_wrappedObserversByActualObserver;
    v12->_wrappedObserversByActualObserver = (NSMapTable *)v17;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    inMemoryThreadQueryHandlers = v12->_inMemoryThreadQueryHandlers;
    v12->_inMemoryThreadQueryHandlers = (NSMutableSet *)v19;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v21 = objc_claimAutoreleasedReturnValue();
    recoverableObservers = v12->_recoverableObservers;
    v12->_recoverableObservers = (NSHashTable *)v21;

    v23 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    queryCountCache = v12->_queryCountCache;
    v12->_queryCountCache = v23;

    v25 = (EFPromise *)objc_alloc_init(MEMORY[0x1E0D1EF60]);
    remoteContentCachePromise = v12->_remoteContentCachePromise;
    v12->_remoteContentCachePromise = v25;

    v27 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E0D1EED8]);
    brandIndicatorsCache = v12->_brandIndicatorsCache;
    v12->_brandIndicatorsCache = v27;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v12, sel__blockedSendersDidChange_, CFSTR("EMBlockedSenderManagerBlockedListDidChangeNotification"), 0);
    objc_msgSend(v29, "addObserver:selector:name:object:", v12, sel__vipsDidChange_, CFSTR("VIPsDidChange"), v12->_vipManager);
    objc_msgSend((id)objc_opt_class(), "addValidSortDescriptorsToEMQuery");
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v12);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __77__EMMessageRepository_initWithRemoteConnection_mailboxRepository_vipManager___block_invoke;
    v31[3] = &unk_1E70F1F78;
    objc_copyWeak(&v32, &location);
    objc_msgSend(v8, "addRecoveryHandler:", v31);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
  return v12;
}

+ (void)addValidSortDescriptorsToEMQuery
{
  if (addValidSortDescriptorsToEMQuery_onceToken != -1)
    dispatch_once(&addValidSortDescriptorsToEMQuery_onceToken, &__block_literal_global_34);
}

void __55__EMMessageRepository_addValidSortDescriptorsToEMQuery__block_invoke()
{
  void *v0;
  _QWORD v1[5];

  v1[4] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("date");
  v1[1] = CFSTR("displayDate");
  v1[2] = CFSTR("readLater.date");
  v1[3] = CFSTR("sendLaterDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMQuery addValidSortDescriptorKeyPaths:forTargetClass:](EMQuery, "addValidSortDescriptorKeyPaths:forTargetClass:", v0, objc_opt_class());
  +[EMQuery addValidSortDescriptorKeyPaths:forTargetClass:](EMQuery, "addValidSortDescriptorKeyPaths:forTargetClass:", v0, objc_opt_class());

}

void __92__EMMessageRepository_startCountingQuery_includingServerCountsForMailboxScope_withObserver___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;

  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 76);
  os_unfair_lock_lock(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock(v2);
}

- (id)performQuery:(id)a3 withObserver:(id)a4
{
  id v6;
  id v7;
  _EMMessageRepositoryQueryObserver *v8;
  void *v9;
  _EMMessageRepositoryQueryObserver *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  EMMessageRepository *v17;
  _EMMessageRepositoryQueryObserver *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[_EMMessageRepositoryQueryObserver initWithRepository:query:observer:queryHandlerStorable:]([_EMMessageRepositoryQueryObserver alloc], "initWithRepository:query:observer:queryHandlerStorable:", self, v6, v7, self);
  os_unfair_lock_lock(&self->_observersLock);
  -[NSMapTable setObject:forKey:](self->_wrappedObserversByActualObserver, "setObject:forKey:", v8, v7);
  -[NSHashTable addObject:](self->_recoverableObservers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_observersLock);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "addCancelable:", v8);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v7);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __49__EMMessageRepository_performQuery_withObserver___block_invoke;
  v16 = &unk_1E70F4D18;
  objc_copyWeak(&v19, &location);
  v17 = self;
  v10 = v8;
  v18 = v10;
  objc_msgSend(v9, "addCancelationBlock:", &v13);
  -[EMRepository connection](self, "connection", v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMMessageRepositoryQueryObserver performWithRemoteConnection:](v10, "performWithRemoteConnection:", v11);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v9;
}

- (void)setUpURLCacheWithMemoryCapacity:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  id location;
  _QWORD v11[5];

  -[EMRepository connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__EMMessageRepository_setUpURLCacheWithMemoryCapacity___block_invoke;
  v11[3] = &unk_1E70F3AD0;
  v11[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __55__EMMessageRepository_setUpURLCacheWithMemoryCapacity___block_invoke_506;
  v8[3] = &unk_1E70F4F68;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  objc_msgSend(v7, "getURLCacheInformationWithCompletion:", v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);

}

- (EFFuture)remoteContentURLCache
{
  void *v2;
  void *v3;

  -[EMMessageRepository remoteContentCachePromise](self, "remoteContentCachePromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "future");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFFuture *)v3;
}

- (EFPromise)remoteContentCachePromise
{
  return self->_remoteContentCachePromise;
}

void __26__EMMessageRepository_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_26;
  log_log_26 = (uint64_t)v1;

}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__EMMessageRepository_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1)
    dispatch_once(&signpostLog_onceToken_0, block);
  return (id)signpostLog_log_0;
}

void __34__EMMessageRepository_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;

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

- (id)initInternal
{
  -[EMMessageRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMMessageRepository initInternal]", "EMMessageRepository.m", 168, "0");
}

void __77__EMMessageRepository_initWithRemoteConnection_mailboxRepository_vipManager___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 18);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = *(id *)&v2[8]._os_unfair_lock_opaque;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_msgSend(*(id *)&v2[8]._os_unfair_lock_opaque, "objectForKey:", v7, (_QWORD)v9);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)&v2[10]._os_unfair_lock_opaque, "setObject:forKey:", v8, v7);

        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }

    objc_msgSend(*(id *)&v2[8]._os_unfair_lock_opaque, "removeAllObjects");
    os_unfair_lock_unlock(v2 + 18);
    -[os_unfair_lock_s _notifyRecoverableObservers](v2, "_notifyRecoverableObservers");
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSURL stopAccessingSecurityScopedResource](self->_cacheURL, "stopAccessingSecurityScopedResource");
  v3.receiver = self;
  v3.super_class = (Class)EMMessageRepository;
  -[EMMessageRepository dealloc](&v3, sel_dealloc);
}

- (void)_notifyRecoverableObservers
{
  os_unfair_lock_s *p_observersLock;
  void *v4;
  id v5;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  -[NSHashTable allObjects](self->_recoverableObservers, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_observersLock);
  -[EMRepository connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:withObject:", sel_recoverWithRemoteConnection_, v4);

}

- (void)isDataAccessible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[EMRepository connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__EMMessageRepository_isDataAccessible___block_invoke;
  v8[3] = &unk_1E70F4A20;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "isDataAccessible:", v8);

}

void __40__EMMessageRepository_isDataAccessible___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "observerScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__EMMessageRepository_isDataAccessible___block_invoke_2;
  v5[3] = &unk_1E70F49F8;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v4, "performBlock:", v5);

}

uint64_t __40__EMMessageRepository_isDataAccessible___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)performQuery:(id)a3 limit:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a3;
  v9 = a5;
  -[EMRepository connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reattemptingRemoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__EMMessageRepository_performQuery_limit_completionHandler___block_invoke;
  v13[3] = &unk_1E70F4A70;
  v13[4] = self;
  v12 = v9;
  v14 = v12;
  objc_msgSend(v11, "performQuery:limit:completionHandler:", v8, a4, v13);

}

void __60__EMMessageRepository_performQuery_limit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "prepareRepositoryObjects:", v5);
  objc_msgSend(*(id *)(a1 + 32), "observerScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__EMMessageRepository_performQuery_limit_completionHandler___block_invoke_2;
  v10[3] = &unk_1E70F4A48;
  v13 = *(id *)(a1 + 40);
  v8 = v5;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v7, "performBlock:", v10);

}

uint64_t __60__EMMessageRepository_performQuery_limit_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)performCountQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[EMRepository connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reattemptingRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__EMMessageRepository_performCountQuery_completionHandler___block_invoke;
  v11[3] = &unk_1E70F4A98;
  objc_copyWeak(&v13, &location);
  v10 = v7;
  v12 = v10;
  objc_msgSend(v9, "performCountQuery:completionHandler:", v6, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __59__EMMessageRepository_performCountQuery_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "observerScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__EMMessageRepository_performCountQuery_completionHandler___block_invoke_2;
    v10[3] = &unk_1E70F4A48;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    objc_msgSend(v9, "performBlock:", v10);

  }
}

uint64_t __59__EMMessageRepository_performCountQuery_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)messageListItemsForObjectIDs:(id)a3
{
  -[EMMessageRepository messageListItemsForObjectIDs:observationIdentifier:](self, "messageListItemsForObjectIDs:observationIdentifier:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_251(id *a1, void *a2, void *a3, char a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;

  v9 = a2;
  v10 = a3;
  if (+[EMForceBlankCellsController shouldBlockXPCQueue](EMForceBlankCellsController, "shouldBlockXPCQueue"))
  {
    +[EMForceBlankCellsController blockForRandomDurationWithMessage:](EMForceBlankCellsController, "blockForRandomDurationWithMessage:", CFSTR("Block _messageListItemsForObjectIDs"));
  }
  objc_msgSend(a1[4], "observerScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_2;
  v14[3] = &unk_1E70F4B38;
  v14[4] = a1[4];
  v12 = v9;
  v15 = v12;
  v16 = a1[5];
  v13 = v10;
  v20 = a4;
  v17 = v13;
  v19 = a5;
  v18 = a1[6];
  objc_msgSend(v11, "performBlock:", v14);

}

void __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_254(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMessageRepository log](EMMessageRepository, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "future");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218498;
    v12 = v9;
    v13 = 2114;
    v14 = v5;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "<%p> Finishing future with error: %{public}@ -> %{public}@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(v7, "finishWithError:", v6);

}

void __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_256(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFinished");

  if ((v8 & 1) == 0)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    +[EMMessageRepository log](EMMessageRepository, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "future");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218498;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_1B99BB000, v9, OS_LOG_TYPE_DEFAULT, "<%p> Found an orphaned promise. Finishing it with an error: %{public}@ -> %{public}@", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Found an orphaned promise"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithError:", v12);

  }
}

- (id)_descriptionStringForObjectIDs:(uint64_t)a1
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "count");
    v6 = v5 - 20;
    if (v5 > 0x14)
    {
      objc_msgSend(v4, "ef_prefix:", 10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ef_prefix:", 10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@, ...<%lu additional items>..., %@"), v8, v6, v9);

    }
    else
    {
      objc_msgSend(v4, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __86__EMMessageRepository__messageListItemsForObjectIDs_observationIdentifier_checkCache___block_invoke_270(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (id)_localInMemoryMessageListItemsForObjectIDs:(id)a3 observationIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[EMMessageRepository _threadCollectionForIdentifier:threadScope:](self, "_threadCollectionForIdentifier:threadScope:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__9;
      v15[4] = __Block_byref_object_dispose__9;
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __88__EMMessageRepository__localInMemoryMessageListItemsForObjectIDs_observationIdentifier___block_invoke;
      v12[3] = &unk_1E70F4BB0;
      v13 = v8;
      v14 = v15;
      objc_msgSend(v6, "ef_compactMap:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(v15, 8);
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

id __88__EMMessageRepository__localInMemoryMessageListItemsForObjectIDs_observationIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id obj;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "messageListItemForObjectID:error:", a2, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    v6 = 0;
  else
    v6 = v5;
  v7 = v6;

  return v7;
}

- (id)_threadCollectionForIdentifier:(id)a3 threadScope:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v21;
  os_unfair_lock_t lock;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23 = v7;
  if ((v7 != 0) == (v8 != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMMessageRepository.m"), 555, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(observationIdentifier && !threadScope) || (!observationIdentifier && threadScope)"));

  }
  os_unfair_lock_lock(&self->_observersLock);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  lock = &self->_observersLock;
  -[NSMapTable objectEnumerator](self->_wrappedObserversByActualObserver, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "observationIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "isEqual:", v14))
        {

LABEL_15:
          v18 = v13;
          goto LABEL_16;
        }
        objc_msgSend(v13, "threadCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "threadScope");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v8, "isEqual:", v16);

        if (v17)
          goto LABEL_15;
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v18 = 0;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_16:

  os_unfair_lock_unlock(lock);
  objc_msgSend(v18, "threadCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_localInMemoryMessageObjectIDsForObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "threadScope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageRepository _threadCollectionForIdentifier:threadScope:](self, "_threadCollectionForIdentifier:threadScope:", 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x3032000000;
      v19[3] = __Block_byref_object_copy__9;
      v19[4] = __Block_byref_object_dispose__9;
      v20 = 0;
      v8 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __66__EMMessageRepository__localInMemoryMessageObjectIDsForObjectIDs___block_invoke;
      v16[3] = &unk_1E70F4BD8;
      v9 = v7;
      v17 = v9;
      v18 = v19;
      objc_msgSend(v4, "ef_compactMap:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __66__EMMessageRepository__localInMemoryMessageObjectIDsForObjectIDs___block_invoke_2;
      v14[3] = &unk_1E70F4C40;
      v15 = v9;
      objc_msgSend(v10, "ef_compactMap:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ef_flatten");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(v19, 8);
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

id __66__EMMessageRepository__localInMemoryMessageObjectIDsForObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id obj;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "messageListItemForObjectID:error:", a2, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    v6 = 0;
  else
    v6 = v5;
  v7 = v6;

  return v7;
}

id __66__EMMessageRepository__localInMemoryMessageObjectIDsForObjectIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "messagesForThread:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_283);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __66__EMMessageRepository__localInMemoryMessageObjectIDsForObjectIDs___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)messageForObjectID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  EMMessageRepository *v21;
  id v22;
  os_signpost_id_t v23;
  os_activity_scope_state_s state;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1B99BB000, "-[EMMessageRepository messageForObjectID:]", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "future");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[EMMessageRepository _existingObservedItemForObjectID:](self, "_existingObservedItemForObjectID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "finishWithResult:", v8);
    }
    else
    {
      v10 = +[EMDaemonInterfaceRequest uniqueRequestID](EMDaemonInterfaceRequest, "uniqueRequestID");
      +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v4;
        _os_signpost_emit_with_name_impl(&dword_1B99BB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "EMMessageRepositoryMessageListItems", "Requesting message %{public, name=objectID}@", buf, 0xCu);
      }

      -[EMRepository connection](self, "connection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reattemptingRemoteObjectProxy");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __42__EMMessageRepository_messageForObjectID___block_invoke;
      v20 = &unk_1E70F4CA8;
      v21 = self;
      v22 = v6;
      v23 = v10;
      objc_msgSend(v14, "messageListItemsForObjectIDs:requestID:observationIdentifier:loadSummaryForAdditionalObjectIDs:completionHandler:", v15, v10, 0, MEMORY[0x1E0C9AA60], &v17);

    }
    objc_msgSend(v6, "future", v17, v18, v19, v20, v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  os_activity_scope_leave(&state);

  return v9;
}

void __42__EMMessageRepository_messageForObjectID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  _DWORD v23[4];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prepareRepositoryObjects:", v11);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "currentObservers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_cachedItemForItem:observers:validationBlock:", v9, v13, &__block_literal_global_286);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "trampoliningObserverForObserver:", *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishWithResult:", v14);

    v16 = 1;
  }
  else
  {
    objc_msgSend(v6, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Failed to get message for objectID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "trampoliningObserverForObserver:", *(_QWORD *)(a1 + 40));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "finishWithError:", v18);

    v16 = 0;
  }
  +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v22 = *(_QWORD *)(a1 + 48);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    v23[0] = 67240192;
    v23[1] = v16;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "EMMessageRepositoryMessageListItems", "Request finished %{public, name=success}d", (uint8_t *)v23, 8u);
  }

}

uint64_t __42__EMMessageRepository_messageForObjectID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __68__EMMessageRepository__cachedItemForItem_observers_validationBlock___block_invoke()
{
  return 1;
}

- (void)addQueryHandler:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSMutableSet addObject:](self->_inMemoryThreadQueryHandlers, "addObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeQueryHandler:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSMutableSet removeObject:](self->_inMemoryThreadQueryHandlers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

void __49__EMMessageRepository_performQuery_withObserver___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 76);
  os_unfair_lock_lock(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", WeakRetained);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock(v2);
  objc_msgSend(*(id *)(a1 + 40), "setInMemoryThreadQueryHandler:", 0);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "currentObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeItemsFromObservedItemsCacheIfNotObservedByObservers:", v4);

}

- (void)refreshQueryWithObserver:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[EMMessageRepository currentObservers](self, "currentObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObject:", v8);
  -[EMMessageRepository _removeItemsFromObservedItemsCacheIfNotObservedByObservers:](self, "_removeItemsFromObservedItemsCacheIfNotObservedByObservers:", v5);
  os_unfair_lock_lock(&self->_observersLock);
  -[NSMapTable objectForKey:](self->_wrappedObserversByActualObserver, "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_observersLock);
  -[EMRepository connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "refreshQueryWithRemoteConnection:", v7);

}

- (void)_removeItemsFromObservedItemsCacheIfNotObservedByObservers:(id)a3
{
  id v4;
  os_unfair_lock_s *p_messageListItemCacheLock;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_messageListItemCacheLock = &self->_messageListItemCacheLock;
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  -[NSMapTable dictionaryRepresentation](self->_observedMessageListItemCache, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_messageListItemCacheLock);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __82__EMMessageRepository__removeItemsFromObservedItemsCacheIfNotObservedByObservers___block_invoke;
  v21[3] = &unk_1E70F4D40;
  v21[4] = self;
  v15 = v4;
  v22 = v15;
  objc_msgSend(v7, "ef_filter:", v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v12 = v7;
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_observedMessageListItemCache, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](self->_unobservedMessageListItemCache, "setObject:forKey:", v14, v13);
        -[NSMapTable removeObjectForKey:](self->_observedMessageListItemCache, "removeObjectForKey:", v13);

        v7 = v12;
        p_messageListItemCacheLock = &self->_messageListItemCacheLock;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_messageListItemCacheLock);
}

uint64_t __82__EMMessageRepository__removeItemsFromObservedItemsCacheIfNotObservedByObservers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_anyObserver:containsObjectID:", *(_QWORD *)(a1 + 40), a2) ^ 1;
}

- (id)startObservingOneTimeCodes:(id)a3
{
  id v4;
  NSObject *v5;
  _EMOneTimeCodeObserver *v6;
  NSObject *v7;
  void *v8;
  _EMOneTimeCodeObserver *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  EMMessageRepository *v16;
  _EMOneTimeCodeObserver *v17;
  uint8_t buf[4];
  EMMessageRepository *v19;
  __int16 v20;
  _EMOneTimeCodeObserver *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@> [OTC] startObservingOneTimeCodes", buf, 0xCu);
  }

  v6 = -[_EMOneTimeCodeObserver initWithObserver:]([_EMOneTimeCodeObserver alloc], "initWithObserver:", v4);
  os_unfair_lock_lock(&self->_observersLock);
  -[NSHashTable addObject:](self->_recoverableObservers, "addObject:", v6);
  +[EMMessageRepository log](EMMessageRepository, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@> [OTC] Adding recoverable one-time codes observer: %@", buf, 0x16u);
  }

  os_unfair_lock_unlock(&self->_observersLock);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "addCancelable:", v6);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __50__EMMessageRepository_startObservingOneTimeCodes___block_invoke;
  v15 = &unk_1E70F2070;
  v16 = self;
  v9 = v6;
  v17 = v9;
  objc_msgSend(v8, "addCancelationBlock:", &v12);
  -[EMRepository connection](self, "connection", v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMOneTimeCodeObserver performWithRemoteConnection:](v9, "performWithRemoteConnection:", v10);

  return v8;
}

void __50__EMMessageRepository_startObservingOneTimeCodes___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 76);
  os_unfair_lock_lock(v2);
  +[EMMessageRepository log](EMMessageRepository, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@> [OTC] Removing recoverable one-time codes observer: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock(v2);
}

- (id)requestRepresentationForMessageWithID:(id)a3 options:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[EMMessageRepository requestRepresentationForMessageWithID:requestID:options:delegate:completionHandler:](self, "requestRepresentationForMessageWithID:requestID:options:delegate:completionHandler:", v10, +[EMDaemonInterfaceRequest uniqueRequestID](EMDaemonInterfaceRequest, "uniqueRequestID"), v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)requestRepresentationForMessageWithID:(id)a3 requestID:(unint64_t)a4 options:(id)a5 delegate:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  unint64_t v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 134349056;
    v34 = objc_msgSend(v12, "hash");
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v17, OS_SIGNPOST_INTERVAL_BEGIN, a4, "EMMessageRepositoryMessageContentRequest", "Requesting representation for message: %{public, name=objectIdHash}lu", buf, 0xCu);
  }

  EMLogCategoryMessageLoading();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v34 = (uint64_t)v12;
    v35 = 2114;
    v36 = v13;
    _os_log_impl(&dword_1B99BB000, v18, OS_LOG_TYPE_DEFAULT, "Requesting content representation for message %{public}@, Options: %{public}@", buf, 0x16u);
  }

  -[EMRepository connection](self, "connection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __106__EMMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke;
  v31[3] = &unk_1E70F2550;
  v21 = v15;
  v32 = v21;
  objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v20;
  v27[1] = 3221225472;
  v27[2] = __106__EMMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_2;
  v27[3] = &unk_1E70F4D68;
  v30 = a4;
  v23 = v12;
  v28 = v23;
  v24 = v21;
  v29 = v24;
  objc_msgSend(v22, "requestRepresentationForMessageWithID:requestID:options:delegate:completionHandler:", v23, a4, v13, v14, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __106__EMMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __106__EMMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7 && v8)
  {
    +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = a1[6];
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B99BB000, v11, OS_SIGNPOST_INTERVAL_END, v12, "EMMessageRepositoryMessageContentRequest", "Success", (uint8_t *)&v21, 2u);
    }

    EMLogCategoryMessageLoading();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = a1[4];
      v21 = 138543362;
      v22 = v14;
      _os_log_impl(&dword_1B99BB000, v13, OS_LOG_TYPE_DEFAULT, "Content representation finished loading: %{public}@", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend(v8, "setDistantContentRepresentation:", v7);
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = a1[6];
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      v21 = 134349056;
      v22 = objc_msgSend(v9, "code");
      _os_signpost_emit_with_name_impl(&dword_1B99BB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "EMMessageRepositoryMessageContentRequest", "Failure %{public, name=errorCode}lu", (uint8_t *)&v21, 0xCu);
    }

    EMLogCategoryMessageLoading();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __106__EMMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_2_cold_1();
    }

    v19 = a1[5];
    v20 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 2048, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v20);
    if (!v9)

  }
}

- (void)requestRichLinkMetadataForRichLinkID:(id)a3 messageID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  EMMessageRepository *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v26 = self;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Requesting rich link metadata for rich link ID: %@", buf, 0x16u);
  }

  -[EMRepository connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __88__EMMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke;
  v22[3] = &unk_1E70F4D90;
  v22[4] = self;
  v14 = v8;
  v23 = v14;
  v15 = v10;
  v24 = v15;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __88__EMMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_481;
  v19[3] = &unk_1E70F4DB8;
  v19[4] = self;
  v17 = v14;
  v20 = v17;
  v18 = v15;
  v21 = v18;
  objc_msgSend(v16, "requestRichLinkMetadataForRichLinkID:messageID:completionHandler:", v17, v9, v19);

}

uint64_t __88__EMMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  +[EMMessageRepository log](EMMessageRepository, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __88__EMMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_cold_1(a1, v2, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __88__EMMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_481(_QWORD *a1, void *a2)
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
  +[EMMessageRepository log](EMMessageRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "<%p> Done requesting rich link metadata for rich link: %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)requestAttachmentURLsForMessageIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  EMMessageRepository *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v17 = self;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "<%p> Requesting attachment metadata for message IDs: %@", buf, 0x16u);
  }

  -[EMRepository connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__EMMessageRepository_requestAttachmentURLsForMessageIDs_completionHandler___block_invoke;
  v13[3] = &unk_1E70F4DE0;
  v13[4] = self;
  v11 = v6;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "requestAttachmentMetadataForMessageIDs:completionHandler:", v11, v13);

}

void __76__EMMessageRepository_requestAttachmentURLsForMessageIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "<%p> Done requesting attachment metadata for message IDs: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "observerScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__EMMessageRepository_requestAttachmentURLsForMessageIDs_completionHandler___block_invoke_483;
  v9[3] = &unk_1E70F3030;
  v9[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v10 = v8;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v7, "performBlock:", v9);

}

uint64_t __76__EMMessageRepository_requestAttachmentURLsForMessageIDs_completionHandler___block_invoke_483(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[EMMessageRepository log](EMMessageRepository, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B99BB000, v2, OS_LOG_TYPE_DEFAULT, "<%p> Attachment metadata received: %@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)requestRichLinkURLsForMessageIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  EMMessageRepository *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v17 = self;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "<%p> Requesting attachment metadata for message IDs: %@", buf, 0x16u);
  }

  -[EMRepository connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__EMMessageRepository_requestRichLinkURLsForMessageIDs_completionHandler___block_invoke;
  v13[3] = &unk_1E70F4DE0;
  v13[4] = self;
  v11 = v6;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "requestRichLinkURLsForMessageIDs:completionHandler:", v11, v13);

}

void __74__EMMessageRepository_requestRichLinkURLsForMessageIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "<%p> Done requesting attachment metadata for message IDs: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "observerScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__EMMessageRepository_requestRichLinkURLsForMessageIDs_completionHandler___block_invoke_485;
  v9[3] = &unk_1E70F2F18;
  v11 = *(id *)(a1 + 48);
  v8 = v3;
  v10 = v8;
  objc_msgSend(v7, "performBlock:", v9);

}

uint64_t __74__EMMessageRepository_requestRichLinkURLsForMessageIDs_completionHandler___block_invoke_485(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)performMessageChangeAction:(id)a3
{
  id v4;
  os_signpost_id_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = +[EMDaemonInterfaceRequest uniqueRequestID](EMDaemonInterfaceRequest, "uniqueRequestID");
  +[EMMessageRepository signpostLog](EMMessageRepository, "signpostLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138543362;
    v18 = (id)objc_opt_class();
    v10 = v18;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "EMMessageRepositoryMessageChangeAction", "%{public, name=ChangeType}@", buf, 0xCu);

  }
  +[EMMessageRepository signpostLog](EMMessageRepository, "signpostLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = (void *)objc_msgSend(v4, "signpostType");
    *(_DWORD *)buf = 134349056;
    v18 = v13;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EMMessageRepositoryMessageChangeAction", "ChangeActionType=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", buf, 0xCu);
  }

  -[EMMessageRepository _updateObserversForAction:](self, "_updateObserversForAction:", v4);
  -[EMRepository connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reattemptingRemoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__EMMessageRepository_performMessageChangeAction___block_invoke;
  v16[3] = &__block_descriptor_48_e29_v16__0__EMUndoMessageAction_8l;
  v16[4] = v7;
  v16[5] = v5;
  objc_msgSend(v15, "performMessageChangeAction:requestID:returnUndoAction:completionHandler:", v4, v5, 0, v16);

}

void __50__EMMessageRepository_performMessageChangeAction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint8_t v8[16];
  uint8_t buf[16];

  +[EMMessageRepository signpostLog](EMMessageRepository, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v3, OS_SIGNPOST_INTERVAL_END, v4, "EMMessageRepositoryMessageChangeAction", ", buf, 2u);
  }

  +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v6, OS_SIGNPOST_INTERVAL_END, v7, "EMMessageRepositoryMessageChangeAction", ", v8, 2u);
  }

}

- (void)performOneTimeCodeMessageDeletionWithObjectID:(id)a3 afterDelay:(double)a4
{
  id v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = +[EMDaemonInterfaceRequest uniqueRequestID](EMDaemonInterfaceRequest, "uniqueRequestID");
  +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138543362;
    v15 = (id)objc_opt_class();
    v10 = v15;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EMMessageRepositoryMessageChangeAction", "%{public, name=ChangeType}@", buf, 0xCu);

  }
  -[EMRepository connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reattemptingRemoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__EMMessageRepository_performOneTimeCodeMessageDeletionWithObjectID_afterDelay___block_invoke;
  v13[3] = &__block_descriptor_40_e29_v16__0__EMUndoMessageAction_8l;
  v13[4] = v7;
  objc_msgSend(v12, "performOneTimeCodeMessageDeletionWithObjectID:requestID:returnUndoAction:afterDelay:completionHandler:", v6, v7, 0, v13, a4);

}

void __80__EMMessageRepository_performOneTimeCodeMessageDeletionWithObjectID_afterDelay___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v3, OS_SIGNPOST_INTERVAL_END, v4, "EMMessageRepositoryMessageChangeAction", ", v5, 2u);
  }

}

- (id)_updateToMessageObjectIDsIfNeeded:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (_os_feature_enabled_impl()
    && (objc_msgSend(v4, "firstObject"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    -[EMMessageRepository _localInMemoryMessageObjectIDsForObjectIDs:](self, "_localInMemoryMessageObjectIDsForObjectIDs:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "count"))
    v8 = v7;
  else
    v8 = v4;
  v9 = v8;

  return v9;
}

- (id)performMessageChangeActionReturningUndoAction:(id)a3
{
  id v4;
  os_signpost_id_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  EMMessageRepository *v26;
  id v27;
  os_signpost_id_t v28;
  os_signpost_id_t v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = +[EMDaemonInterfaceRequest uniqueRequestID](EMDaemonInterfaceRequest, "uniqueRequestID");
  +[EMMessageRepository signpostLog](EMMessageRepository, "signpostLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138543362;
    v31 = (id)objc_opt_class();
    v10 = v31;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "EMMessageRepositoryMessageChangeAction", "%{public, name=ChangeType}@", buf, 0xCu);

  }
  +[EMMessageRepository signpostLog](EMMessageRepository, "signpostLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = (void *)objc_msgSend(v4, "signpostType");
    *(_DWORD *)buf = 134349056;
    v31 = v13;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EMMessageRepositoryMessageChangeAction", "ChangeActionType=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", buf, 0xCu);
  }

  -[EMMessageRepository _updateObserversForAction:](self, "_updateObserversForAction:", v4);
  objc_msgSend(v4, "objectIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessageRepository _updateToMessageObjectIDsIfNeeded:](self, "_updateToMessageObjectIDsIfNeeded:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjectIDs:", v15);

  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMRepository connection](self, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reattemptingRemoteObjectProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __69__EMMessageRepository_performMessageChangeActionReturningUndoAction___block_invoke;
  v25 = &unk_1E70F4E48;
  v26 = self;
  v19 = v16;
  v27 = v19;
  v28 = v7;
  v29 = v5;
  objc_msgSend(v18, "performMessageChangeAction:requestID:returnUndoAction:completionHandler:", v4, v5, 1, &v22);

  objc_msgSend(v19, "future", v22, v23, v24, v25, v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __69__EMMessageRepository_performMessageChangeActionReturningUndoAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "trampoliningObserverForObserver:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v4, "finishWithResult:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ef_notSupportedError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithError:", v5);

  }
  +[EMMessageRepository signpostLog](EMMessageRepository, "signpostLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v7, OS_SIGNPOST_INTERVAL_END, v8, "EMMessageRepositoryMessageChangeAction", ", buf, 2u);
  }

  +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v10, OS_SIGNPOST_INTERVAL_END, v11, "EMMessageRepositoryMessageChangeAction", ", v12, 2u);
  }

}

- (void)_updateObserversForAction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
    {
      v4 = v6;
      if ((objc_msgSend(v4, "copyMessages") & 1) == 0)
      {
        objc_msgSend(v4, "objectIDs");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMMessageRepository _updateObserversForDeletedObjectIDs:](self, "_updateObserversForDeletedObjectIDs:", v5);

      }
    }
    else
    {
      if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
      {
        -[EMMessageRepository _unsubscribeTypeDidChangeForUnsubscribeChangeAction:](self, "_unsubscribeTypeDidChangeForUnsubscribeChangeAction:", v6);
        goto LABEL_11;
      }
      if (!-[EMMessageRepository _shouldActionUpdateObserversForDeletedObjectIDs:](self, "_shouldActionUpdateObserversForDeletedObjectIDs:", v6))goto LABEL_11;
      objc_msgSend(v6, "objectIDs");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[EMMessageRepository _updateObserversForDeletedObjectIDs:](self, "_updateObserversForDeletedObjectIDs:", v4);
    }

    goto LABEL_11;
  }
  -[EMMessageRepository _updateObserversForFlagChangeAction:](self, "_updateObserversForFlagChangeAction:", v6);
LABEL_11:

}

- (BOOL)_shouldActionUpdateObserversForDeletedObjectIDs:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (void)_updateObserversForFlagChangeAction:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id v16;
  void *v17;
  void *k;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  os_unfair_lock_t lock;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  void *v29;
  uint64_t v30;
  EMMessageRepository *v31;
  uint64_t v32;
  void *v33;
  uint64_t i;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const __CFString *v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "flagChange");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessageRepository currentObservers](self, "currentObservers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = self;
  lock = &self->_messageListItemCacheLock;
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v25;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v32)
  {
    v30 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v41 != v30)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        -[NSMapTable objectForKey:](v31->_observedMessageListItemCache, "objectForKey:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          v33 = v6;
          v8 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EF23F670);
          v7 = v33;
          if ((v8 & 1) != 0)
          {
            v39 = 0;
            objc_msgSend(v33, "flags");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "flagsAfterChangingFlags:flagsWereChanged:", v9, &v39);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              +[EMMessageListItemChange changeForFlags:](EMMessageListItemChange, "changeForFlags:", v29);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "applyToMessageListItem:", v33);
              v37 = 0u;
              v38 = 0u;
              v35 = 0u;
              v36 = 0u;
              v11 = v26;
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
              if (v12)
              {
                v13 = *(_QWORD *)v36;
                do
                {
                  for (j = 0; j != v12; ++j)
                  {
                    if (*(_QWORD *)v36 != v13)
                      objc_enumerationMutation(v11);
                    v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                    if ((objc_msgSend(v15, "observerContainsObjectID:", v5) & 1) != 0)
                    {
                      objc_msgSend(v4, "objectForKey:", v15);
                      v16 = (id)objc_claimAutoreleasedReturnValue();
                      if (!v16)
                      {
                        v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                        objc_msgSend(v4, "setObject:forKey:", v16, v15);
                      }
                      objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, v5);

                    }
                  }
                  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
                }
                while (v12);
              }

            }
            v7 = v33;
          }
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v32);
  }

  os_unfair_lock_unlock(lock);
  objc_msgSend(v4, "keyEnumerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  for (k = 0; ; k = v19)
  {
    objc_msgSend(v17, "nextObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      break;
    objc_msgSend(v4, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = CFSTR("changesByObjectID");
    v45 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "queryMatchedChangedObjectIDs:extraInfo:", v22, v21);

  }
}

- (void)_updateObserversForDeletedObjectIDs:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  EMMessageRepository *v16;
  id obj;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  EMMessageRepository *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count") == 0;
  v16 = self;
  -[EMMessageRepository currentObservers](self, "currentObservers");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v18[0] = v8;
        v18[1] = 3221225472;
        v18[2] = __59__EMMessageRepository__updateObserversForDeletedObjectIDs___block_invoke;
        v18[3] = &unk_1E70F46F8;
        v18[4] = v10;
        objc_msgSend(v4, "ef_filter:", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v10, "queryAnticipatesDeletedObjectIDs:", v11);
          v5 = 1;
        }

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v6);
  }

  if (!v5)
  {
    objc_msgSend(obj, "ef_filter:", &__block_literal_global_492);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMMessageRepository log](EMMessageRepository, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(v4, "count");
      v15 = objc_msgSend(obj, "count");
      *(_DWORD *)buf = 134218754;
      v24 = v16;
      v25 = 2048;
      v26 = v14;
      v27 = 2048;
      v28 = v15;
      v29 = 2114;
      v30 = v12;
      _os_log_error_impl(&dword_1B99BB000, v13, OS_LOG_TYPE_ERROR, "<%p> Fail to update observer for deleted objectIDs.count:%lu, observers.count:%lu, observersInRecovery:%{public}@", buf, 0x2Au);
    }

  }
}

uint64_t __59__EMMessageRepository__updateObserversForDeletedObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerContainsObjectID:", a2);
}

uint64_t __59__EMMessageRepository__updateObserversForDeletedObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "isRecovering");
  else
    v3 = 0;

  return v3;
}

- (void)resetAllPrecomputedThreadScopes
{
  void *v2;
  id v3;

  -[EMRepository connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetPrecomputedThreadScopesForMailboxScope:", 0);

}

- (void)setCachedMetadataJSON:(id)a3 forKey:(id)a4 messageID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[EMRepository connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCachedMetadataJSON:forKey:messageID:", v12, v8, v9);

}

- (id)cachedMetadataJSONForKey:(id)a3 messageID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  -[EMRepository connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke;
  v14[3] = &unk_1E70F3AD0;
  v14[4] = self;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke_495;
  v13[3] = &unk_1E70F4EB0;
  v13[4] = &v15;
  objc_msgSend(v10, "getCachedMetadataJSONForKey:messageID:completionHandler:", v6, v7, v13);
  v11 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v11;
}

void __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke_cold_1();
  }

}

void __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke_495(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)getCachedMetadataJSONForKey:(id)a3 messageID:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  EMMessageRepository *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EMRepository connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __69__EMMessageRepository_getCachedMetadataJSONForKey_messageID_handler___block_invoke;
  v17 = &unk_1E70F4ED8;
  v18 = self;
  v12 = v10;
  v19 = v12;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "getCachedMetadataJSONForKey:messageID:completionHandler:", v8, v9, v12, v14, v15, v16, v17, v18);
}

void __69__EMMessageRepository_getCachedMetadataJSONForKey_messageID_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)metadataForAddresses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  EMMessageRepository *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMRepository connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __44__EMMessageRepository_metadataForAddresses___block_invoke;
  v18[3] = &unk_1E70F40D0;
  v18[4] = self;
  v8 = v5;
  v19 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __44__EMMessageRepository_metadataForAddresses___block_invoke_499;
  v14[3] = &unk_1E70F4F40;
  v10 = v8;
  v15 = v10;
  v16 = self;
  v11 = v4;
  v17 = v11;
  objc_msgSend(v9, "metadataForAddresses:completionHandler:", v11, v14);
  objc_msgSend(v10, "future");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __44__EMMessageRepository_metadataForAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __44__EMMessageRepository_metadataForAddresses___block_invoke_cold_1();
  }

  v5 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("cannot connect to proxy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithError:", v6);

}

void __44__EMMessageRepository_metadataForAddresses___block_invoke_499(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    objc_msgSend(v3, "ef_mapValues:", &__block_literal_global_501);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);
  }
  else
  {
    +[EMMessageRepository log](EMMessageRepository, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __44__EMMessageRepository_metadataForAddresses___block_invoke_499_cold_1();

    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("unable to obtain address metadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithError:", v8);

  }
}

EMAddressMetadata *__44__EMMessageRepository_metadataForAddresses___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  EMAddressMetadata *v3;

  v2 = a2;
  v3 = -[EMAddressMetadata initWithDictionary:]([EMAddressMetadata alloc], "initWithDictionary:", v2);

  return v3;
}

void __55__EMMessageRepository_setUpURLCacheWithMemoryCapacity___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke_cold_1();
  }

}

void __55__EMMessageRepository_setUpURLCacheWithMemoryCapacity___block_invoke_506(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id *WeakRetained;
  uint64_t v7;
  id v8;
  EMRemoteContentURLCache *v9;
  NSObject *v10;
  id v11;
  void *v12;
  EMRemoteContentURLCache *v13;
  _QWORD v14[5];
  EMRemoteContentURLCache *v15;
  uint8_t buf[4];
  id *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "url");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = WeakRetained[13];
    WeakRetained[13] = (id)v7;

    objc_msgSend(WeakRetained[13], "startAccessingSecurityScopedResource");
    v9 = -[NSURLCache initWithMemoryCapacity:diskCapacity:directoryURL:]([EMRemoteContentURLCache alloc], "initWithMemoryCapacity:diskCapacity:directoryURL:", *(_QWORD *)(a1 + 40), a3, WeakRetained[13]);
    +[EMMessageRepository log](EMMessageRepository, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = WeakRetained[13];
      *(_DWORD *)buf = 134218498;
      v17 = WeakRetained;
      v18 = 2112;
      v19 = v11;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_DEFAULT, "<%p> Starting remote content cache with URL: %@ diskCapacity: %lu", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__EMMessageRepository_setUpURLCacheWithMemoryCapacity___block_invoke_509;
    v14[3] = &unk_1E70F2070;
    v14[4] = WeakRetained;
    v13 = v9;
    v15 = v13;
    objc_msgSend(v12, "performBlock:", v14);

  }
}

uint64_t __55__EMMessageRepository_setUpURLCacheWithMemoryCapacity___block_invoke_509(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[EMMessageRepository log](EMMessageRepository, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "currentDiskUsage");
    v6 = 134218240;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1B99BB000, v2, OS_LOG_TYPE_DEFAULT, "<%p>Remote content cache currentDiskUsage: %lu", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

- (void)noteViewOfRemoteContentLinks:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMRepository connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reattemptingRemoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteViewOfRemoteContentLinks:", v6);

}

- (void)getRemoteContentURLInfoOrderedBy:(int64_t)a3 inReverseOrder:(BOOL)a4 limit:(int64_t)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v7 = a4;
  v10 = a6;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[EMRepository connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reattemptingRemoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__EMMessageRepository_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_completionHandler___block_invoke;
  v14[3] = &unk_1E70F4FB8;
  objc_copyWeak(&v16, &location);
  v13 = v10;
  v15 = v13;
  objc_msgSend(v12, "getRemoteContentURLInfoOrderedBy:inReverseOrder:limit:completionHandler:", a3, v7, a5, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __95__EMMessageRepository_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "observerScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __95__EMMessageRepository_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_completionHandler___block_invoke_2;
    v13[3] = &unk_1E70F4F90;
    v17 = *(id *)(a1 + 32);
    v14 = v7;
    v15 = v8;
    v16 = v9;
    objc_msgSend(v12, "performBlock:", v13);

  }
}

uint64_t __95__EMMessageRepository_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)parseRemoteContentURLsFromMessageWithObjectID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[EMRepository connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reattemptingRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[EMDaemonInterfaceRequest uniqueRequestID](EMDaemonInterfaceRequest, "uniqueRequestID");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__EMMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_completionHandler___block_invoke;
  v12[3] = &unk_1E70F4FE0;
  objc_copyWeak(&v14, &location);
  v11 = v7;
  v13 = v11;
  objc_msgSend(v9, "parseRemoteContentURLsFromMessageWithObjectID:requestID:completionHandler:", v6, v10, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __87__EMMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "observerScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __87__EMMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_completionHandler___block_invoke_2;
    v10[3] = &unk_1E70F4A48;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    objc_msgSend(v9, "performBlock:", v10);

  }
}

uint64_t __87__EMMessageRepository_parseRemoteContentURLsFromMessageWithObjectID_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)requestSummaryForObjectIDs:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_signpost_id_t v14;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1B99BB000, "-[EMMessageRepository requestSummaryForObjectIDs:]", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  if (objc_msgSend(v4, "count"))
  {
    v6 = +[EMDaemonInterfaceRequest uniqueRequestID](EMDaemonInterfaceRequest, "uniqueRequestID");
    +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v9 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(v4, "count"));
      *(_DWORD *)buf = 67240192;
      v17 = v9;
      _os_signpost_emit_with_name_impl(&dword_1B99BB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EMMessageRepositoryMessageListItems", "Requesting summaries for objectIDs %{public, name=objectID}u", buf, 8u);
    }

    -[EMRepository connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reattemptingRemoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__EMMessageRepository_requestSummaryForObjectIDs___block_invoke;
    v12[3] = &unk_1E70F5008;
    v14 = v6;
    v13 = v4;
    objc_msgSend(v11, "messageListItemsForObjectIDs:requestID:observationIdentifier:loadSummaryForAdditionalObjectIDs:completionHandler:", MEMORY[0x1E0C9AA60], v6, 0, v13, v12);

  }
  os_activity_scope_leave(&state);

}

void __50__EMMessageRepository_requestSummaryForObjectIDs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[EMDaemonInterfaceRequest signpostLog](EMDaemonInterfaceRequest, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v5 = objc_msgSend(MEMORY[0x1E0D1EF48], "bucketMessageCount:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v6[0] = 67240192;
    v6[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v3, OS_SIGNPOST_INTERVAL_END, v4, "EMMessageRepositoryMessageListItems", "Request finished %{public, name=results}u", (uint8_t *)v6, 8u);
  }

}

- (id)messagesInConversationIDs:(id)a3 limit:(int64_t)a4 observationIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  v22 = 0;
  -[EMRepository connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__EMMessageRepository_messagesInConversationIDs_limit_observationIdentifier___block_invoke;
  v16[3] = &unk_1E70F3AD0;
  v16[4] = self;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __77__EMMessageRepository_messagesInConversationIDs_limit_observationIdentifier___block_invoke_512;
  v15[3] = &unk_1E70F5030;
  v15[4] = &v17;
  objc_msgSend(v12, "messagesInConversationIDs:limit:observationIdentifier:completionHandler:", v8, a4, v9, v15);
  v13 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v13;
}

void __77__EMMessageRepository_messagesInConversationIDs_limit_observationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __77__EMMessageRepository_messagesInConversationIDs_limit_observationIdentifier___block_invoke_cold_1();
  }

}

void __77__EMMessageRepository_messagesInConversationIDs_limit_observationIdentifier___block_invoke_512(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)brandIndicatorForLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  -[EMMessageRepository brandIndicatorsCache](self, "brandIndicatorsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__EMMessageRepository_brandIndicatorForLocation___block_invoke;
  v10[3] = &unk_1E70F5080;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v12 = v5;
  v7 = v5;
  objc_msgSend(v7, "objectForKey:generator:", v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __49__EMMessageRepository_brandIndicatorForLocation___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v2 = objc_alloc_init(MEMORY[0x1E0D1EF60]);
  objc_msgSend(a1[4], "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reattemptingRemoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __49__EMMessageRepository_brandIndicatorForLocation___block_invoke_2;
  v12 = &unk_1E70F5058;
  v5 = a1[5];
  v13 = a1[4];
  v6 = v2;
  v14 = v6;
  v15 = a1[6];
  v16 = a1[5];
  objc_msgSend(v4, "brandIndicatorForLocation:completionHandler:", v5, &v9);

  objc_msgSend(v6, "future", v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __49__EMMessageRepository_brandIndicatorForLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  if (v3)
  {
    objc_msgSend(v4, "trampoliningObserverForObserver:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:", v9);

  }
  else
  {
    objc_msgSend(v4, "trampoliningObserverForObserver:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithResult:", v8);

    objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
  }

}

- (void)recategorizeMessageSinceDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMRepository connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recategorizeMessageSinceDate:", v6);

}

- (id)predictMailboxForMovingMessages:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "ef_compactMapSelector:", sel_objectID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessageRepository predictMailboxForMovingMessagesWithIDs:completionHandler:](self, "predictMailboxForMovingMessagesWithIDs:completionHandler:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)predictMailboxForMovingMessagesWithIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _EMMessageRepositoryMailboxPredictionObserver *v8;
  id v9;
  _EMMessageRepositoryMailboxPredictionObserver *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  EMMessageRepository *v17;
  _EMMessageRepositoryMailboxPredictionObserver *v18;

  v6 = a3;
  v7 = a4;
  v8 = -[_EMMessageRepositoryMailboxPredictionObserver initWithMessageObjectIDs:completionHandler:]([_EMMessageRepositoryMailboxPredictionObserver alloc], "initWithMessageObjectIDs:completionHandler:", v6, v7);
  os_unfair_lock_lock(&self->_observersLock);
  -[NSHashTable addObject:](self->_recoverableObservers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_observersLock);
  v9 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  objc_msgSend(v9, "addCancelable:", v8);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __80__EMMessageRepository_predictMailboxForMovingMessagesWithIDs_completionHandler___block_invoke;
  v16 = &unk_1E70F2070;
  v17 = self;
  v10 = v8;
  v18 = v10;
  objc_msgSend(v9, "addCancelationBlock:", &v13);
  -[EMRepository connection](self, "connection", v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMMessageRepositoryMailboxPredictionObserver performWithRemoteConnection:](v10, "performWithRemoteConnection:", v11);

  return v9;
}

void __80__EMMessageRepository_predictMailboxForMovingMessagesWithIDs_completionHandler___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;

  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 76);
  os_unfair_lock_lock(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock(v2);
}

- (void)loadOlderMessagesForMailboxes:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMRepository connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadOlderMessagesForMailboxes:", v6);

}

- (id)messageObjectIDForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMRepository connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestRecoveryAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EMRepository connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reattemptingRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completionHandlerAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageObjectIDForURL:completionHandler:", v4, v10);

  objc_msgSend(v5, "future");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__EMMessageRepository_messageObjectIDForURL___block_invoke;
  v14[3] = &unk_1E70F1FA0;
  v15 = v7;
  v12 = v7;
  objc_msgSend(v11, "always:", v14);

  return v11;
}

uint64_t __45__EMMessageRepository_messageObjectIDForURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)messageForSearchableItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessageRepository messageObjectIDsForSearchableItemIdentifiers:](self, "messageObjectIDsForSearchableItemIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__EMMessageRepository_messageForSearchableItemIdentifier___block_invoke;
  v9[3] = &unk_1E70F50A8;
  v9[4] = self;
  objc_msgSend(v6, "then:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __58__EMMessageRepository_messageForSearchableItemIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "objectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageForObjectID:", v5);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D1EEC0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("spotlight identifiers mapped to zero object IDs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithError:", v5);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)messageObjectIDsForSearchableItemIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMRepository connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__EMMessageRepository_messageObjectIDsForSearchableItemIdentifiers___block_invoke;
  v11[3] = &unk_1E70F50D0;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v7, "messageObjectIDsForSearchableItemIdentifiers:completionHandler:", v4, v11);

  objc_msgSend(v8, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __68__EMMessageRepository_messageObjectIDsForSearchableItemIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  EMOrderedMessageIDData *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 32);
  v10 = -[EMOrderedMessageIDData initWithObjectIDs:objectIDByPersistentID:]([EMOrderedMessageIDData alloc], "initWithObjectIDs:objectIDByPersistentID:", v11, v7);
  objc_msgSend(v9, "finishWithResult:error:", v10, v8);

}

- (id)persistentIDForMessageObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  EMMessageRepository *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMRepository connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __54__EMMessageRepository_persistentIDForMessageObjectID___block_invoke;
  v22[3] = &unk_1E70F4198;
  v22[4] = self;
  v8 = v4;
  v23 = v8;
  v9 = v5;
  v24 = v9;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  v16 = 3221225472;
  v17 = __54__EMMessageRepository_persistentIDForMessageObjectID___block_invoke_522;
  v18 = &unk_1E70F50F8;
  v11 = v9;
  v19 = v11;
  v20 = self;
  v12 = v8;
  v21 = v12;
  objc_msgSend(v10, "persistentIDForMessageObjectID:completionHandler:", v12, &v15);

  objc_msgSend(v11, "future", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __54__EMMessageRepository_persistentIDForMessageObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218498;
    v9 = v6;
    v10 = 2114;
    v11 = v5;
    v12 = 2114;
    v13 = v7;
    _os_log_error_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_ERROR, "<%p> Encountered error while getting persistentID for messageObjectID %{public}@, error: %{public}@", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);

}

void __54__EMMessageRepository_persistentIDForMessageObjectID___block_invoke_522(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v3);
  }
  else
  {
    +[EMMessageRepository log](EMMessageRepository, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __54__EMMessageRepository_persistentIDForMessageObjectID___block_invoke_522_cold_1();

    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v6);

  }
}

- (void)_applyChangesToCachedObjects:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  EMMessageRepository *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v8 = self;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Apply changes to cached object IDs: %{public}@", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__EMMessageRepository__applyChangesToCachedObjects___block_invoke;
  v6[3] = &unk_1E70F5120;
  v6[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  os_unfair_lock_unlock(&self->_messageListItemCacheLock);

}

void __52__EMMessageRepository__applyChangesToCachedObjects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF23F670))
    objc_msgSend(v5, "applyToMessageListItem:", v6);

}

void __108__EMMessageRepository__detectChangesForMatchedAddedObjectIDs_observerationIdentifier_matchedChangesHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  id v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v18;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v18);
  if (v2)
  {
    v3 = *(_QWORD *)v23;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v23 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v4);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v5 == v6;

        if (!v7)
        {
          v8 = *(void **)(a1 + 32);
          objc_msgSend(v5, "objectID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "changeFrom:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "date");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
              goto LABEL_10;
            objc_msgSend(v12, "date");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "date");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "ef_isLaterThanDate:", v15);

            if (v16)
            {
LABEL_10:
              objc_msgSend(v5, "objectID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v12, v17);

            }
          }

        }
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v2);
  }

  if (objc_msgSend(v19, "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_addPrecachedItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMapTable *observedMessageListItemCache;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  -[EMRepository prepareRepositoryObjects:](self, "prepareRepositoryObjects:", v11);
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v11;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        observedMessageListItemCache = self->_observedMessageListItemCache;
        objc_msgSend(v8, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](observedMessageListItemCache, "setObject:forKey:", v8, v10);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(&self->_messageListItemCacheLock);
}

- (void)_blockedSendersDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  EMMessageRepository *v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EMBlockedSenderManagerBlockedSendersKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EMBlockedSenderManagerIsBlockedSenderEnabledKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__EMMessageRepository__blockedSendersDidChange___block_invoke;
  v11[3] = &unk_1E70F51B8;
  v14 = v8;
  v9 = v6;
  v12 = v9;
  v13 = self;
  v10 = (void *)MEMORY[0x1BCCC8C10](v11);
  -[EMMessageRepository _broadcastMessageListItemChangesToObservers:forObjectIDs:](self, "_broadcastMessageListItemChangesToObservers:forObjectIDs:", v10, 0);

}

EMMessageListItemChange *__48__EMMessageRepository__blockedSendersDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  EMMessageListItemChange *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "isBlocked");
  objc_msgSend(v3, "senderList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __48__EMMessageRepository__blockedSendersDidChange___block_invoke_2;
  v18 = &unk_1E70F5170;
  v20 = *(_BYTE *)(a1 + 48);
  v19 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "ef_any:", &v15);

  if (v4 == (_DWORD)v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_alloc_init(EMMessageListItemChange);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6, v15, v16, v17, v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setIsBlocked:](v7, "setIsBlocked:", v8);

    objc_msgSend(v3, "senderList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ef_compactMap:", &__block_literal_global_527);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[EMMessageRepository log](EMMessageRepository, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "itemID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 1024;
      v26 = v4;
      v27 = 1024;
      v28 = v6;
      v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Blocked sender changed for:%@ from %d to %d for addresses: %{public}@", buf, 0x2Cu);

    }
  }

  return v7;
}

uint64_t __48__EMMessageRepository__blockedSendersDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && *(_BYTE *)(a1 + 40))
    v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

id __48__EMMessageRepository__blockedSendersDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_publicDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_vipsDidChange:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__EMMessageRepository__vipsDidChange___block_invoke;
  v5[3] = &unk_1E70F5200;
  v5[4] = self;
  v4 = (void *)MEMORY[0x1BCCC8C10](v5, a2, a3);
  -[EMMessageRepository _broadcastMessageListItemChangesToObservers:forObjectIDs:](self, "_broadcastMessageListItemChangesToObservers:forObjectIDs:", v4, 0);

}

EMMessageListItemChange *__38__EMMessageRepository__vipsDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  EMMessageListItemChange *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "vipManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isVIP");
  objc_msgSend(v3, "senderList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __38__EMMessageRepository__vipsDidChange___block_invoke_2;
  v17[3] = &unk_1E70F2350;
  v7 = v4;
  v18 = v7;
  v8 = objc_msgSend(v6, "ef_any:", v17);

  if (v5 == (_DWORD)v8)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v3, "senderList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ef_compactMap:", &__block_literal_global_529);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[EMMessageRepository log](EMMessageRepository, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "itemID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 1024;
      v24 = v5;
      v25 = 1024;
      v26 = v8;
      v27 = 2114;
      v28 = v10;
      _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> VIP status changed for:%@ from %d to %d for addresses: %{public}@", buf, 0x2Cu);

    }
    v14 = objc_alloc_init(EMMessageListItemChange);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setIsVIP:](v14, "setIsVIP:", v15);

  }
  return v14;
}

uint64_t __38__EMMessageRepository__vipsDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(*(id *)(a1 + 32), "isVIPAddress:", v4);
  else
    v5 = 0;

  return v5;
}

id __38__EMMessageRepository__vipsDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_publicDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_unsubscribeTypeDidChangeForUnsubscribeChangeAction:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectIDs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EMMessageRepository _broadcastMessageListItemChangesToObservers:forObjectIDs:](self, "_broadcastMessageListItemChangesToObservers:forObjectIDs:", &__block_literal_global_530);

}

id __75__EMMessageRepository__unsubscribeTypeDidChangeForUnsubscribeChangeAction___block_invoke()
{
  +[EMMessageListItemChange changeForUnsubscribeType:](EMMessageListItemChange, "changeForUnsubscribeType:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_broadcastMessageListItemChangesToObservers:(id)a3 forObjectIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(_QWORD, _QWORD);
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  const __CFString *v28;
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __80__EMMessageRepository__broadcastMessageListItemChangesToObservers_forObjectIDs___block_invoke;
  v24[3] = &unk_1E70F5268;
  v19 = v17;
  v25 = v19;
  v18 = v6;
  v27 = v18;
  v21 = v7;
  v26 = v21;
  v20 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCC8C10](v24);
  os_unfair_lock_lock(&self->_messageListItemCacheLock);
  ((void (**)(_QWORD, NSMapTable *))v20)[2](v20, self->_observedMessageListItemCache);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)((uint64_t (*)(_QWORD, NSMapTable *))v20[2])(v20, self->_unobservedMessageListItemCache);
  os_unfair_lock_unlock(&self->_messageListItemCacheLock);
  if (objc_msgSend(v21, "count", v6, v17))
  {
    -[EMMessageRepository _applyChangesToCachedObjects:](self, "_applyChangesToCachedObjects:", v21);
    -[EMMessageRepository currentObservers](self, "currentObservers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    while (1)
    {
      objc_msgSend(v11, "nextObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        break;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __80__EMMessageRepository__broadcastMessageListItemChangesToObservers_forObjectIDs___block_invoke_2;
      v22[3] = &unk_1E70F5290;
      v12 = v13;
      v23 = v12;
      objc_msgSend(v8, "ef_filter:", v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        v28 = CFSTR("changesByObjectID");
        v29[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "queryMatchedChangedObjectIDs:extraInfo:", v16, v15);

      }
    }

  }
}

id __80__EMMessageRepository__broadcastMessageListItemChangesToObservers_forObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
  while (1)
  {
    v8 = v7;
    v9 = v6;
    objc_msgSend(v5, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    objc_msgSend(v7, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    if (v10 && !objc_msgSend(v10, "containsObject:", v6))
    {
      v11 = 0;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v6);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v6);
        }
      }
    }

  }
  return v4;
}

uint64_t __80__EMMessageRepository__broadcastMessageListItemChangesToObservers_forObjectIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerContainsObjectID:", a2);
}

- (EMVIPManager)vipManager
{
  return self->_vipManager;
}

- (void)setQueryCountCache:(id)a3
{
  objc_storeStrong((id *)&self->_queryCountCache, a3);
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setCacheURL:(id)a3
{
  objc_storeStrong((id *)&self->_cacheURL, a3);
}

- (void)setRemoteContentCachePromise:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContentCachePromise, a3);
}

- (EFLazyCache)brandIndicatorsCache
{
  return self->_brandIndicatorsCache;
}

- (void)setBrandIndicatorsCache:(id)a3
{
  objc_storeStrong((id *)&self->_brandIndicatorsCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_storeStrong((id *)&self->_brandIndicatorsCache, 0);
  objc_storeStrong((id *)&self->_remoteContentCachePromise, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_queryCountCache, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_connectionRecoveryAssertion, 0);
  objc_storeStrong((id *)&self->_recoverableObservers, 0);
  objc_storeStrong((id *)&self->_inMemoryThreadQueryHandlers, 0);
  objc_storeStrong((id *)&self->_wrappedObserversByActualObserver, 0);
  objc_storeStrong((id *)&self->_unobservedMessageListItemCache, 0);
  objc_storeStrong((id *)&self->_observedMessageListItemCache, 0);
}

void __106__EMMessageRepository_requestRepresentationForMessageWithID_requestID_options_delegate_completionHandler___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_6(&dword_1B99BB000, v6, v4, "Content representation failed to load: %{public}@ with error %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __88__EMMessageRepository_requestRichLinkMetadataForRichLinkID_messageID_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 134218242;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_0_6(&dword_1B99BB000, a2, a3, "<%p> Could not connect to the proxy to request rich link metadata for rich link ID: %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1();
}

void __58__EMMessageRepository_cachedMetadataJSONForKey_messageID___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_6(&dword_1B99BB000, v6, v4, "<%p> Failed to get metadata through XPC proxy: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __44__EMMessageRepository_metadataForAddresses___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_6(&dword_1B99BB000, v6, v4, "<%p> Could not connect to the XPC proxy to fetch address metadata: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __44__EMMessageRepository_metadataForAddresses___block_invoke_499_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_6(&dword_1B99BB000, v0, v1, "<%p> Cannot obtain address metadata for  %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __77__EMMessageRepository_messagesInConversationIDs_limit_observationIdentifier___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_6(&dword_1B99BB000, v6, v4, "<%p> Failed to get messages through XPC proxy: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __54__EMMessageRepository_persistentIDForMessageObjectID___block_invoke_522_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_6(&dword_1B99BB000, v0, v1, "<%p> No persistentID found for messageObjectID: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

@end
