@implementation EMMailboxRepository

- (void)_prepareMailboxes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
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
  v4 = a3;
  -[EMRepository prepareRepositoryObjects:](self, "prepareRepositoryObjects:", v4);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "setParentFromMailboxes:", v5, (_QWORD)v16);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

void __54__EMMailboxRepository_mailboxObjectIDsForMailboxType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "type") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

id __55__EMMailboxRepository__filterIDsFromMailbox_withQuery___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectID");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)remoteInterface
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF248D60);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_mailboxListChanged_, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FB50);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_getMailboxesWithCompletion_, 0, 1);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_getAllMailboxObjectIDsWithCompletion_, 0, 1);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_mailboxObjectIDsForMailboxType_completionHandler_, 0, 1);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_mailboxTypeForMailboxObjectID_completionHandler_, 0, 0);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_recordFrecencyEventWithMailboxesWithIDs_, 0, 0);
  objc_msgSend(v13, "setInterface:forSelector:argumentIndex:ofReply:", v12, sel_startObservingMailboxChangesWithChangeObserver_observationIdentifier_, 0, 0);

  return v13;
}

- (EMMailboxRepository)initWithRemoteConnection:(id)a3 accountRepository:(id)a4
{
  id v6;
  id v7;
  EMMailboxRepository *v8;
  void *v9;
  uint64_t v10;
  NSMapTable *observerMap;
  NSMutableDictionary *v12;
  NSMutableDictionary *mailboxesByObjectID;
  uint64_t v14;
  EFPromise *mailboxesPromise;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)EMMailboxRepository;
  v8 = -[EMRepository initWithRemoteConnection:](&v23, sel_initWithRemoteConnection_, v6);
  if (v8)
  {
    v24[0] = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMQuery addValidSortDescriptorKeyPaths:forTargetClass:](EMQuery, "addValidSortDescriptorKeyPaths:forTargetClass:", v9, objc_opt_class());

    v8->_mailboxesPromiseLock._os_unfair_lock_opaque = 0;
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_accountRepository, a4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    observerMap = v8->_observerMap;
    v8->_observerMap = (NSMapTable *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mailboxesByObjectID = v8->_mailboxesByObjectID;
    v8->_mailboxesByObjectID = v12;

    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v14 = objc_claimAutoreleasedReturnValue();
    mailboxesPromise = v8->_mailboxesPromise;
    v8->_mailboxesPromise = (EFPromise *)v14;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    v16 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66__EMMailboxRepository_initWithRemoteConnection_accountRepository___block_invoke;
    v20[3] = &unk_1E70F1F78;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v6, "addResetHandler:", v20);
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __66__EMMailboxRepository_initWithRemoteConnection_accountRepository___block_invoke_2;
    v18[3] = &unk_1E70F1F78;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v6, "addRecoveryHandler:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)mailboxForObjectID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  EMMailboxRepository *v11;

  v4 = a3;
  -[EMMailboxRepository _startObservingMailboxChangesIfNecessary](self, "_startObservingMailboxChangesIfNecessary");
  -[EMMailboxRepository _mailboxesFuture](self, "_mailboxesFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__EMMailboxRepository_mailboxForObjectID___block_invoke;
  v9[3] = &unk_1E70F3B48;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "then:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)performQuery:(id)a3 withObserver:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[EMMailboxRepository _startObservingMailboxChangesIfNecessary](self, "_startObservingMailboxChangesIfNecessary");
  -[EMRepository trampoliningObserverForObserver:](self, "trampoliningObserverForObserver:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable setObject:forKey:](self->_observerMap, "setObject:forKey:", v6, v8);
  os_unfair_lock_unlock(&self->_lock);
  -[EMMailboxRepository mailboxesIfAvailable](self, "mailboxesIfAvailable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[EMMailboxRepository _filterIDsFromMailbox:withQuery:](self, "_filterIDsFromMailbox:withQuery:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryMatchedAddedObjectIDs:before:extraInfo:", v11, 0, 0);

    objc_msgSend(v8, "queryDidFinishInitialLoad");
  }
  v12 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__EMMailboxRepository_performQuery_withObserver___block_invoke;
  v15[3] = &unk_1E70F2BE0;
  objc_copyWeak(&v17, &location);
  v13 = v8;
  v16 = v13;
  objc_msgSend(v12, "addCancelationBlock:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v12;
}

- (NSOrderedSet)mailboxesIfAvailable
{
  void *v2;
  void *v3;

  -[EMMailboxRepository _mailboxesFuture](self, "_mailboxesFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resultIfAvailable:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v3;
}

- (void)mailboxListChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  NSMutableDictionary *mailboxesByObjectID;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  os_unfair_lock_t lock;
  id v34;
  void *v35;
  EMMailboxRepository *v36;
  uint64_t v37;
  NSMapTable *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id obj;
  void *v44;
  _QWORD v45[4];
  id v46;
  void *v47;
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
  _BYTE v60[128];
  _BYTE v61[128];
  uint8_t v62[128];
  uint8_t buf[4];
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  +[EMMailboxRepository log](EMMailboxRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v64 = objc_msgSend(v34, "count");
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "Received New Mailbox List count:%lu", buf, 0xCu);
  }

  -[EMMailboxRepository _prepareMailboxes:](self, "_prepareMailboxes:", v34);
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMailboxRepository mailboxesIfAvailable](self, "mailboxesIfAvailable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v39 = v5;
  v41 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v41, "minusOrderedSet:", v35);
  mailboxesByObjectID = self->_mailboxesByObjectID;
  objc_msgSend(v41, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_mapSelector:", sel_objectID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](mailboxesByObjectID, "removeObjectsForKeys:", v8);

  v42 = (void *)objc_msgSend(v35, "mutableCopy");
  objc_msgSend(v42, "minusOrderedSet:", v39);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v35;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v57 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v13 = self->_mailboxesByObjectID;
        objc_msgSend(v12, "objectID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v9);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v38 = self->_observerMap;
  v15 = -[NSMapTable countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v15)
  {
    v40 = *(_QWORD *)v53;
    v36 = self;
    do
    {
      v16 = 0;
      v37 = v15;
      do
      {
        if (*(_QWORD *)v53 != v40)
          objc_enumerationMutation(v38);
        v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v16);
        -[NSMapTable objectForKey:](self->_observerMap, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMMailboxRepository _filterIDsFromMailbox:withQuery:](self, "_filterIDsFromMailbox:withQuery:", obj, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMMailboxRepository _filterIDsFromMailbox:withQuery:](self, "_filterIDsFromMailbox:withQuery:", v42, v18);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMMailboxRepository _filterIDsFromMailbox:withQuery:](self, "_filterIDsFromMailbox:withQuery:", v41, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "count"))
        {
          if (v39)
          {
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v22 = v44;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
            if (v23)
            {
              v24 = *(_QWORD *)v49;
              do
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v49 != v24)
                    objc_enumerationMutation(v22);
                  objc_msgSend(v21, "addIndex:", objc_msgSend(v19, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j)));
                }
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
              }
              while (v23);
            }

            self = v36;
            v15 = v37;
            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v45[2] = __42__EMMailboxRepository_mailboxListChanged___block_invoke;
            v45[3] = &unk_1E70F3C80;
            v46 = v19;
            v47 = v17;
            objc_msgSend(v21, "enumerateRangesUsingBlock:", v45);

          }
          else
          {
            objc_msgSend(v44, "array");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "queryMatchedAddedObjectIDs:before:extraInfo:", v26, 0, 0);

            objc_msgSend(v17, "queryDidFinishInitialLoad");
          }
        }
        if (objc_msgSend(v20, "count"))
        {
          objc_msgSend(v20, "array");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "queryMatchedDeletedObjectIDs:", v27);

        }
        ++v16;
      }
      while (v16 != v15);
      v15 = -[NSMapTable countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    }
    while (v15);
  }

  os_unfair_lock_unlock(lock);
  os_unfair_lock_lock(&self->_mailboxesPromiseLock);
  -[EMMailboxRepository mailboxesPromise](self, "mailboxesPromise");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "future");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isFinished");

  if (v30)
  {
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMailboxRepository setMailboxesPromise:](self, "setMailboxesPromise:", v31);

  }
  -[EMMailboxRepository mailboxesPromise](self, "mailboxesPromise");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_mailboxesPromiseLock);
  objc_msgSend(v32, "finishWithResult:", obj);

}

- (id)_filterIDsFromMailbox:(id)a3 withQuery:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredOrderedSetUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_113);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_mailboxesFuture
{
  os_unfair_lock_s *p_mailboxesPromiseLock;
  void *v4;
  void *v5;

  p_mailboxesPromiseLock = &self->_mailboxesPromiseLock;
  os_unfair_lock_lock(&self->_mailboxesPromiseLock);
  -[EMMailboxRepository mailboxesPromise](self, "mailboxesPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_mailboxesPromiseLock);
  return v5;
}

- (EFPromise)mailboxesPromise
{
  return self->_mailboxesPromise;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EMMailboxRepository_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_21 != -1)
    dispatch_once(&log_onceToken_21, block);
  return (OS_os_log *)(id)log_log_21;
}

- (EMAccountRepository)accountRepository
{
  return self->_accountRepository;
}

- (id)mailboxObjectIDsForMailboxType:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  id v6;
  NSMutableDictionary *mailboxesByObjectID;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  int64_t v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSMutableDictionary count](self->_mailboxesByObjectID, "count"))
  {
    os_unfair_lock_unlock(p_lock);
LABEL_5:
    -[EMMailboxRepository remoteMailboxObjectIDsForMailboxType:](self, "remoteMailboxObjectIDsForMailboxType:", a3, v10, v11, v12, v13);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    return v8;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  mailboxesByObjectID = self->_mailboxesByObjectID;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __54__EMMailboxRepository_mailboxObjectIDsForMailboxType___block_invoke;
  v13 = &unk_1E70F3C10;
  v15 = a3;
  v8 = v6;
  v14 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mailboxesByObjectID, "enumerateKeysAndObjectsUsingBlock:", &v10);

  os_unfair_lock_unlock(p_lock);
  if (!v8)
    goto LABEL_5;
  return v8;
}

- (id)remoteMailboxObjectIDsForMailboxType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = 0;
  -[EMRepository connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__EMMailboxRepository_remoteMailboxObjectIDsForMailboxType___block_invoke;
  v10[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v10[4] = a3;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __60__EMMailboxRepository_remoteMailboxObjectIDsForMailboxType___block_invoke_109;
  v9[3] = &unk_1E70F3BE8;
  v9[4] = &v11;
  objc_msgSend(v6, "mailboxObjectIDsForMailboxType:completionHandler:", a3, v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (void)_startObservingMailboxChangesIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  -[EMMailboxRepository registrationCancelable](self, "registrationCancelable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[EMRepository connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke;
    v19[3] = &unk_1E70F3AD0;
    v19[4] = self;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_93;
    v18[3] = &unk_1E70F3AF8;
    v18[4] = self;
    objc_msgSend(v6, "getMailboxesWithCompletion:", v18);
    v7 = -[EMObjectID initAsEphemeralID:]([EMObjectID alloc], "initAsEphemeralID:", 1);
    objc_msgSend(v6, "startObservingMailboxChangesWithChangeObserver:observationIdentifier:", self, v7);
    v8 = (void *)MEMORY[0x1E0D1EE90];
    v12 = v5;
    v13 = 3221225472;
    v14 = __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_2;
    v15 = &unk_1E70F2070;
    v9 = v6;
    v16 = v9;
    v10 = v7;
    v17 = v10;
    objc_msgSend(v8, "tokenWithCancelationBlock:", &v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMailboxRepository setRegistrationCancelable:](self, "setRegistrationCancelable:", v11, v12, v13, v14, v15);

  }
}

- (EFCancelable)registrationCancelable
{
  return (EFCancelable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRegistrationCancelable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

void __26__EMMailboxRepository_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_21;
  log_log_21 = (uint64_t)v1;

}

id __42__EMMailboxRepository_mailboxForObjectID___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 40) + 36),
        os_unfair_lock_lock(v2),
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        os_unfair_lock_unlock(v2),
        v3))
  {
    objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D1EEC0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "futureWithError:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)v6;
  }

  return v4;
}

- (id)initInternal
{
  -[EMMailboxRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMMailboxRepository initInternal]", "EMMailboxRepository.m", 44, "0");
}

void __66__EMMailboxRepository_initWithRemoteConnection_accountRepository___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRegistrationCancelable:", 0);

}

void __66__EMMailboxRepository_initWithRemoteConnection_accountRepository___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_restartObservingMailboxChangesIfNecessary");

}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelable cancel](self->_registrationCancelable, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)EMMailboxRepository;
  -[EMMailboxRepository dealloc](&v3, sel_dealloc);
}

void __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a2;
  +[EMMailboxRepository log](EMMailboxRepository, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 1025, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishWithError:", v12);

}

uint64_t __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_93(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "mailboxListChanged:", a2);
}

uint64_t __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelObservation:", *(_QWORD *)(a1 + 40));
}

- (void)performQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[EMMailboxRepository _startObservingMailboxChangesIfNecessary](self, "_startObservingMailboxChangesIfNecessary");
  -[EMMailboxRepository _mailboxesFuture](self, "_mailboxesFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__EMMailboxRepository_performQuery_completionHandler___block_invoke;
  v15[3] = &unk_1E70F3B20;
  v10 = v6;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  objc_msgSend(v8, "addSuccessBlock:", v15);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __54__EMMailboxRepository_performQuery_completionHandler___block_invoke_2;
  v13[3] = &unk_1E70F2550;
  v12 = v11;
  v14 = v12;
  objc_msgSend(v8, "addFailureBlock:", v13);

}

void __54__EMMailboxRepository_performQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredOrderedSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sortDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __54__EMMailboxRepository_performQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__EMMailboxRepository_performQuery_withObserver___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 9);
  objc_msgSend(*((id *)WeakRetained + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 9);

}

- (id)mailboxesForObjectIDs:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__EMMailboxRepository_mailboxesForObjectIDs___block_invoke;
  v4[3] = &unk_1E70F3B70;
  v4[4] = self;
  objc_msgSend(a3, "ef_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __45__EMMailboxRepository_mailboxesForObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "mailboxForObjectID:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mailboxIfAvailableForObjectID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_mailboxesByObjectID, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mailboxesIfAvailableForObjectIDs:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__EMMailboxRepository_mailboxesIfAvailableForObjectIDs___block_invoke;
  v4[3] = &unk_1E70F3B98;
  v4[4] = self;
  objc_msgSend(a3, "ef_compactMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __56__EMMailboxRepository_mailboxesIfAvailableForObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "mailboxIfAvailableForObjectID:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)refreshMailboxList
{
  void *v2;
  id v3;

  -[EMRepository connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshMailboxList");

}

- (id)performMailboxChangeAction:(id)a3
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
  objc_msgSend(v6, "reattemptingRemoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__EMMailboxRepository_performMailboxChangeAction___block_invoke;
  v11[3] = &unk_1E70F3BC0;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v7, "performMailboxChangeAction:completionHandler:", v4, v11);

  objc_msgSend(v8, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __50__EMMailboxRepository_performMailboxChangeAction___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:");

}

- (NSSet)allMailboxObjectIDs
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSMutableDictionary count](self->_mailboxesByObjectID, "count"))
  {
    os_unfair_lock_unlock(p_lock);
LABEL_5:
    -[EMMailboxRepository remoteAllMailboxObjectIDs](self, "remoteAllMailboxObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSSet *)v6;
  }
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[NSMutableDictionary allKeys](self->_mailboxesByObjectID, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  os_unfair_lock_unlock(p_lock);
  if (!v6)
    goto LABEL_5;
  return (NSSet *)v6;
}

- (id)remoteAllMailboxObjectIDs
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  -[EMRepository connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__EMMailboxRepository_remoteAllMailboxObjectIDs__block_invoke_104;
  v6[3] = &unk_1E70F3BE8;
  v6[4] = &v7;
  objc_msgSend(v3, "getAllMailboxObjectIDsWithCompletion:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__EMMailboxRepository_remoteAllMailboxObjectIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  +[EMMailboxRepository log](EMMailboxRepository, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __48__EMMailboxRepository_remoteAllMailboxObjectIDs__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __48__EMMailboxRepository_remoteAllMailboxObjectIDs__block_invoke_104(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__EMMailboxRepository_remoteMailboxObjectIDsForMailboxType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EMMailboxRepository log](EMMailboxRepository, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__EMMailboxRepository_remoteMailboxObjectIDsForMailboxType___block_invoke_cold_1();

}

void __60__EMMailboxRepository_remoteMailboxObjectIDsForMailboxType___block_invoke_109(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)mailboxTypeForMailboxObjectID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  int64_t v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSMutableDictionary count](self->_mailboxesByObjectID, "count"))
  {
    -[NSMutableDictionary objectForKey:](self->_mailboxesByObjectID, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v7 = -[EMMailboxRepository remoteMailboxTypeForMailboxObjectID:](self, "remoteMailboxTypeForMailboxObjectID:", v4);
  }

  return v7;
}

- (int64_t)remoteMailboxTypeForMailboxObjectID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  int64_t v9;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = -500;
  -[EMRepository connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__EMMailboxRepository_remoteMailboxTypeForMailboxObjectID___block_invoke;
  v12[3] = &unk_1E70F3AD0;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __59__EMMailboxRepository_remoteMailboxTypeForMailboxObjectID___block_invoke_110;
  v11[3] = &unk_1E70F3C58;
  v11[4] = &v14;
  objc_msgSend(v8, "mailboxTypeForMailboxObjectID:completionHandler:", v7, v11);

  v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __59__EMMailboxRepository_remoteMailboxTypeForMailboxObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[EMMailboxRepository log](EMMailboxRepository, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __59__EMMailboxRepository_remoteMailboxTypeForMailboxObjectID___block_invoke_cold_1();

}

uint64_t __59__EMMailboxRepository_remoteMailboxTypeForMailboxObjectID___block_invoke_110(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __42__EMMailboxRepository_mailboxListChanged___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2 - 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subarrayWithRange:", a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryMatchedAddedObjectIDs:after:extraInfo:", v8, v9, 0);

}

- (void)recordFrecencyEventWithMailboxURLString:(id)a3
{
  id v4;
  void *v5;
  EMMailboxObjectID *v6;
  EMMailboxObjectID *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[EMMailboxObjectID initWithURL:]([EMMailboxObjectID alloc], "initWithURL:", v5);
      v7 = v6;
      if (v6)
      {
        v9[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMMailboxRepository recordFrecencyEventWithMailboxIDs:](self, "recordFrecencyEventWithMailboxIDs:", v8);

      }
    }

  }
}

- (void)recordFrecencyEventWithMailboxesOfMessage:(id)a3
{
  id v4;

  objc_msgSend(a3, "mailboxObjectIDs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EMMailboxRepository recordFrecencyEventWithMailboxIDs:](self, "recordFrecencyEventWithMailboxIDs:");

}

- (void)recordFrecencyEventWithMailboxIDs:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[EMRepository connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordFrecencyEventWithMailboxesWithIDs:", v6);

  }
}

- (void)testRecordFrecencyEventsForAllMailboxes
{
  void *v2;
  id v3;

  -[EMRepository connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testRecordFrecencyEventsForAllMailboxes");

}

- (void)testResetFrecencyForAllMailboxes
{
  void *v2;
  id v3;

  -[EMRepository connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testResetFrecencyForAllMailboxes");

}

- (void)setMailboxesPromise:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxesPromise, a3);
}

- (NSMapTable)observerMap
{
  return self->_observerMap;
}

- (void)setObserverMap:(id)a3
{
  objc_storeStrong((id *)&self->_observerMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountRepository, 0);
  objc_storeStrong((id *)&self->_observerMap, 0);
  objc_storeStrong((id *)&self->_mailboxesPromise, 0);
  objc_storeStrong((id *)&self->_registrationCancelable, 0);
  objc_storeStrong((id *)&self->_mailboxesByObjectID, 0);
}

void __63__EMMailboxRepository__startObservingMailboxChangesIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B99BB000, a2, a3, "Error establishing xpc connection : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __48__EMMailboxRepository_remoteAllMailboxObjectIDs__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B99BB000, a2, a3, "Failed getAllMailboxObjectIDsWithCompletion: error:%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __60__EMMailboxRepository_remoteMailboxObjectIDsForMailboxType___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_1B99BB000, v0, v1, "Failed mailboxObjectIDsForMailboxType:%li error:%{public}@");
  OUTLINED_FUNCTION_1();
}

void __59__EMMailboxRepository_remoteMailboxTypeForMailboxObjectID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_1B99BB000, v0, v1, "Failed mailboxTypeForMailboxObjectID:%{public}@ error:%{public}@");
  OUTLINED_FUNCTION_1();
}

@end
