@implementation EMQueryingCollection

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EMQueryingCollection_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_33 != -1)
    dispatch_once(&log_onceToken_33, block);
  return (OS_os_log *)(id)log_log_33;
}

void __27__EMQueryingCollection_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_33;
  log_log_33 = (uint64_t)v1;

}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__EMQueryingCollection_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_2 != -1)
    dispatch_once(&signpostLog_onceToken_2, block);
  return (OS_os_log *)(id)signpostLog_log_2;
}

void __35__EMQueryingCollection_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_2;
  signpostLog_log_2 = (uint64_t)v1;

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

- (EMQueryingCollection)initWithQuery:(id)a3 repository:(id)a4
{
  id v6;
  id v7;
  EMQueryingCollection *v8;

  v6 = a3;
  v7 = a4;
  v8 = -[EMQueryingCollection initWithObjectID:query:](self, "initWithObjectID:query:", 0, v6);
  -[EMRepositoryObject setRepository:](v8, "setRepository:", v7);

  return v8;
}

- (EMQueryingCollection)initWithObjectID:(id)a3 query:(id)a4
{
  id v6;
  id v7;
  EMQueryingCollection *v8;
  EMQueryingCollection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EMQueryingCollection;
  v8 = -[EMObject initWithObjectID:](&v11, sel_initWithObjectID_, v6);
  v9 = v8;
  if (v8)
    -[EMQueryingCollection _commonInitWithQuery:](v8, "_commonInitWithQuery:", v7);

  return v9;
}

- (void)_commonInitWithQuery:(id)a3
{
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *itemIDs;
  NSMutableSet *v7;
  NSMutableSet *itemIDsAnticipatingDelete;
  EFScheduler *v9;
  EFScheduler *observerScheduler;
  NSHashTable *v11;
  NSHashTable *changeObservers;
  id v13;

  v13 = a3;
  objc_storeStrong((id *)&self->_query, a3);
  self->_itemIDsLock._os_unfair_lock_opaque = 0;
  v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  itemIDs = self->_itemIDs;
  self->_itemIDs = v5;

  v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  itemIDsAnticipatingDelete = self->_itemIDsAnticipatingDelete;
  self->_itemIDsAnticipatingDelete = v7;

  objc_msgSend(MEMORY[0x1E0D1F070], "immediateScheduler");
  v9 = (EFScheduler *)objc_claimAutoreleasedReturnValue();
  observerScheduler = self->_observerScheduler;
  self->_observerScheduler = v9;

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v11 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  changeObservers = self->_changeObservers;
  self->_changeObservers = v11;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EMQueryingCollection cancelationToken](self, "cancelationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)EMQueryingCollection;
  -[EMQueryingCollection dealloc](&v4, sel_dealloc);
}

- (EFScheduler)queryScheduler
{
  if (defaultCollectionScheduler_onceToken != -1)
    dispatch_once(&defaultCollectionScheduler_onceToken, &__block_literal_global_206);
  return (EFScheduler *)(id)defaultCollectionScheduler_scheduler;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMQueryingCollection)initWithCoder:(id)a3
{
  id v4;
  EMQueryingCollection *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EMQueryingCollection;
  v5 = -[EMObject initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_query"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMQueryingCollection _commonInitWithQuery:](v5, "_commonInitWithQuery:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)EMQueryingCollection;
  -[EMObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_query, CFSTR("EFPropertyKey_query"));

}

- (id)objectIDForItemID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)itemIDForObjectID:(id)a3
{
  return a3;
}

- (BOOL)objectIDBelongsToCollection:(id)a3
{
  return a3 != 0;
}

- (void)insertItemIDs:(id)a3 before:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_itemIDsLock);
  -[NSMutableOrderedSet removeObjectsInArray:](self->_itemIDs, "removeObjectsInArray:", v7);
  -[NSMutableOrderedSet ef_insertObjects:before:](self->_itemIDs, "ef_insertObjects:before:", v7, v6);
  os_unfair_lock_unlock(&self->_itemIDsLock);

}

- (void)insertItemIDs:(id)a3 after:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_itemIDsLock);
  -[NSMutableOrderedSet removeObjectsInArray:](self->_itemIDs, "removeObjectsInArray:", v7);
  -[NSMutableOrderedSet ef_insertObjects:after:](self->_itemIDs, "ef_insertObjects:after:", v7, v6);
  os_unfair_lock_unlock(&self->_itemIDsLock);

}

- (id)removeItemIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  os_unfair_lock_lock(&self->_itemIDsLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_itemIDsAnticipatingDelete, "containsObject:", v10))
          -[NSMutableSet removeObject:](self->_itemIDsAnticipatingDelete, "removeObject:", v10);
        else
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[NSMutableOrderedSet removeObjectsInArray:](self->_itemIDs, "removeObjectsInArray:", v6);
  os_unfair_lock_unlock(&self->_itemIDsLock);

  return v5;
}

- (BOOL)containsItemID:(id)a3
{
  return -[EMQueryingCollection containsItemID:includeRecovery:](self, "containsItemID:includeRecovery:", a3, 0);
}

- (BOOL)containsItemID:(id)a3 includeRecovery:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;

  v4 = a4;
  v6 = a3;
  os_unfair_lock_lock(&self->_itemIDsLock);
  v7 = -[NSMutableOrderedSet containsObject:](self->_itemIDs, "containsObject:", v6);
  if (((v7 | !v4) & 1) == 0)
    LOBYTE(v7) = -[NSOrderedSet containsObject:](self->_recoveringItemIDs, "containsObject:", v6);
  os_unfair_lock_unlock(&self->_itemIDsLock);

  return v7;
}

- (id)firstExistingItemIDAfterItemID:(id)a3
{
  -[EMQueryingCollection _firstExistingItemIDForItemID:inReverse:](self, "_firstExistingItemIDForItemID:inReverse:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)firstExistingItemIDBeforeItemID:(id)a3
{
  -[EMQueryingCollection _firstExistingItemIDForItemID:inReverse:](self, "_firstExistingItemIDForItemID:inReverse:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_firstExistingItemIDForItemID:(id)a3 inReverse:(BOOL)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__EMQueryingCollection__firstExistingItemIDForItemID_inReverse___block_invoke;
  v5[3] = &unk_1E70F5608;
  v5[4] = self;
  -[EMQueryingCollection _iterateItemIDsStartingAtItemID:inReverse:includeStartingItem:withBlock:](self, "_iterateItemIDsStartingAtItemID:inReverse:includeStartingItem:withBlock:", a3, a4, 1, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __64__EMQueryingCollection__firstExistingItemIDForItemID_inReverse___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", a2);
}

- (id)iterateItemIDsStartingAtItemID:(id)a3 inReverse:(BOOL)a4 withBlock:(id)a5
{
  -[EMQueryingCollection _iterateItemIDsStartingAtItemID:inReverse:includeStartingItem:withBlock:](self, "_iterateItemIDsStartingAtItemID:inReverse:includeStartingItem:withBlock:", a3, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_iterateItemIDsStartingAtItemID:(id)a3 inReverse:(BOOL)a4 includeStartingItem:(BOOL)a5 withBlock:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  uint64_t (**v11)(id, id);
  id v12;
  char v13;
  void *v14;
  NSMutableOrderedSet *itemIDs;
  uint64_t v16;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = (uint64_t (**)(id, id))a6;
  v12 = v10;
  os_unfair_lock_lock(&self->_itemIDsLock);
  if (v7)
    v13 = v11[2](v11, v12);
  else
    v13 = 1;
  v14 = v12;
  while ((v13 & 1) != 0)
  {
    itemIDs = self->_itemIDs;
    if (v8)
      -[NSMutableOrderedSet ef_objectBeforeObject:](itemIDs, "ef_objectBeforeObject:", v14);
    else
      -[NSMutableOrderedSet ef_objectAfterObject:](itemIDs, "ef_objectAfterObject:", v14);
    v16 = objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v14 = 0;
      break;
    }
    v14 = (void *)v16;
    v13 = v11[2](v11, (id)v16);
  }
  os_unfair_lock_unlock(&self->_itemIDsLock);

  return v14;
}

- (void)notifyChangeObserversAboutAddedItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[EMQueryingCollection firstExistingItemIDAfterItemID:](self, "firstExistingItemIDAfterItemID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v17 = objc_msgSend(v7, "count");
    v18 = 2114;
    v19 = v9;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_DEFAULT, "Notifying observer %lu itemIDs were added before undeletedItemID %{public}@ (derived from existingItemID: %{public}@)", buf, 0x20u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__EMQueryingCollection_notifyChangeObserversAboutAddedItemIDs_before_extraInfo___block_invoke;
  v13[3] = &unk_1E70F41E8;
  v13[4] = self;
  v11 = v7;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  -[EMQueryingCollection enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v13);

}

uint64_t __80__EMQueryingCollection_notifyChangeObserversAboutAddedItemIDs_before_extraInfo___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "collection:addedItemIDs:before:", a1[4], a1[5], a1[6]);
}

- (void)notifyChangeObserversAboutAddedItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[EMQueryingCollection firstExistingItemIDBeforeItemID:](self, "firstExistingItemIDBeforeItemID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v17 = objc_msgSend(v7, "count");
    v18 = 2114;
    v19 = v9;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_DEFAULT, "Notifying observer %lu itemIDs were added after undeletedItemID %{public}@ (derived from existingItemID: %{public}@)", buf, 0x20u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__EMQueryingCollection_notifyChangeObserversAboutAddedItemIDs_after_extraInfo___block_invoke;
  v13[3] = &unk_1E70F41E8;
  v13[4] = self;
  v11 = v7;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  -[EMQueryingCollection enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v13);

}

uint64_t __79__EMQueryingCollection_notifyChangeObserversAboutAddedItemIDs_after_extraInfo___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "collection:addedItemIDs:after:", a1[4], a1[5], a1[6]);
}

- (void)notifyChangeObserversAboutChangedItemIDs:(id)a3 extraInfo:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__EMQueryingCollection_notifyChangeObserversAboutChangedItemIDs_extraInfo___block_invoke;
  v7[3] = &unk_1E70F4030;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[EMQueryingCollection enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v7);

}

uint64_t __75__EMQueryingCollection_notifyChangeObserversAboutChangedItemIDs_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collection:changedItemIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)notifyChangeObserversAboutMovedItemIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  -[EMQueryingCollection firstExistingItemIDAfterItemID:](self, "firstExistingItemIDAfterItemID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__EMQueryingCollection_notifyChangeObserversAboutMovedItemIDs_before_extraInfo___block_invoke;
  v12[3] = &unk_1E70F41E8;
  v12[4] = self;
  v10 = v7;
  v13 = v10;
  v14 = v9;
  v11 = v9;
  -[EMQueryingCollection enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v12);

}

uint64_t __80__EMQueryingCollection_notifyChangeObserversAboutMovedItemIDs_before_extraInfo___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "collection:movedItemIDs:before:", a1[4], a1[5], a1[6]);
}

- (void)notifyChangeObserversAboutMovedItemIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  -[EMQueryingCollection firstExistingItemIDBeforeItemID:](self, "firstExistingItemIDBeforeItemID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__EMQueryingCollection_notifyChangeObserversAboutMovedItemIDs_after_extraInfo___block_invoke;
  v12[3] = &unk_1E70F41E8;
  v12[4] = self;
  v10 = v7;
  v13 = v10;
  v14 = v9;
  v11 = v9;
  -[EMQueryingCollection enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v12);

}

uint64_t __79__EMQueryingCollection_notifyChangeObserversAboutMovedItemIDs_after_extraInfo___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "collection:movedItemIDs:after:", a1[4], a1[5], a1[6]);
}

- (void)notifyChangeObserver:(id)a3 stockedItemIDs:(id)a4
{
  objc_msgSend(a3, "collection:addedItemIDs:before:", self, a4, 0);
}

- (EFFuture)allItemIDs
{
  os_unfair_lock_s *p_itemIDsLock;
  uint64_t v4;
  NSMutableOrderedSet *itemIDs;
  void *v6;
  uint64_t v7;
  EFPromise *allItemIDsPromise;
  EFPromise *v9;
  EFPromise *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  p_itemIDsLock = &self->_itemIDsLock;
  os_unfair_lock_lock(&self->_itemIDsLock);
  if (!self->_foundAllItemIDs)
  {
    allItemIDsPromise = self->_allItemIDsPromise;
    if (!allItemIDsPromise)
    {
      objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
      v9 = (EFPromise *)objc_claimAutoreleasedReturnValue();
      v10 = self->_allItemIDsPromise;
      self->_allItemIDsPromise = v9;

      allItemIDsPromise = self->_allItemIDsPromise;
    }
    -[EFPromise future](allItemIDsPromise, "future");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_itemIDsLock);
    goto LABEL_11;
  }
  v4 = -[NSMutableSet count](self->_itemIDsAnticipatingDelete, "count");
  itemIDs = self->_itemIDs;
  if (v4)
  {
    v6 = (void *)-[NSMutableOrderedSet mutableCopy](itemIDs, "mutableCopy");
    objc_msgSend(v6, "minusSet:", self->_itemIDsAnticipatingDelete);
    objc_msgSend(v6, "array");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableOrderedSet array](itemIDs, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
  }
  v12 = (void *)v7;

  os_unfair_lock_unlock(p_itemIDsLock);
  if (!v12)
  {
    v11 = 0;
LABEL_11:
    -[EMQueryingCollection _performQueryIfNeeded](self, "_performQueryIfNeeded");
    return (EFFuture *)v11;
  }
  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)v13;
  return (EFFuture *)v11;
}

- (void)beginObserving:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  EMQueryingCollection *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  EMQueryingCollection *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  EMQueryingCollection *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v24 = self;
    v25 = 2114;
    v26 = v4;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Observer added: %{public}@", buf, 0x16u);
  }

  +[EMQueryingCollection signpostLog](EMQueryingCollection, "signpostLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, v4);
  -[EMQueryingCollection query](self, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v9;
  if (v7 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v18 = v10;
  }
  else
  {
    if (os_signpost_enabled(v9))
    {
      NSStringFromClass((Class)objc_msgSend(v8, "targetClass"));
      v11 = (EMQueryingCollection *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "label");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v24 = v11;
      v25 = 2114;
      v26 = v12;
      v27 = 2114;
      v28 = v13;
      _os_signpost_emit_with_name_impl(&dword_1B99BB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EMCollectionTotal", "resultClass=%{signpost.description:attribute,public}@ label=%{signpost.description:attribute,public}@ observer=%{signpost.description:attribute,public}@ enableTelemetry=YES ", buf, 0x20u);

    }
    v14 = v10;
    if (os_signpost_enabled(v14))
    {
      NSStringFromClass((Class)objc_msgSend(v8, "targetClass"));
      v15 = (EMQueryingCollection *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "label");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v24 = v15;
      v25 = 2114;
      v26 = v16;
      v27 = 2114;
      v28 = v17;
      _os_signpost_emit_with_name_impl(&dword_1B99BB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EMCollectionFirstBatch", "resultClass=%{signpost.description:attribute,public}@ label=%{signpost.description:attribute,public}@ observer=%{signpost.description:attribute,public}@ enableTelemetry=YES ", buf, 0x20u);

    }
  }

  -[EMQueryingCollection queryScheduler](self, "queryScheduler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __39__EMQueryingCollection_beginObserving___block_invoke;
  v21[3] = &unk_1E70F2070;
  v21[4] = self;
  v20 = v4;
  v22 = v20;
  objc_msgSend(v19, "performBlock:", v21);

}

void __39__EMQueryingCollection_beginObserving___block_invoke(uint64_t a1)
{
  os_unfair_lock_s **v2;
  void *v3;
  os_unfair_lock_s *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (os_unfair_lock_s **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "changeObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *v2 + 16;
  os_unfair_lock_lock(v4);
  objc_msgSend(v3, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[EMQueryingCollection log](EMQueryingCollection, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v3;
      _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Observer already started: %{public}@ to: %{public}@", buf, 0x20u);
    }

    os_unfair_lock_unlock(v4);
    objc_msgSend(*(id *)(a1 + 32), "observerScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__EMQueryingCollection_beginObserving___block_invoke_21;
    v10[3] = &unk_1E70F2158;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v3;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v9, "performSyncBlock:", v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_cancelQuery");
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_performQuery");
    os_unfair_lock_unlock(v4);
  }

}

void __39__EMQueryingCollection_beginObserving___block_invoke_21(uint64_t a1)
{
  os_unfair_lock_s *v2;

  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 64);
  os_unfair_lock_lock(v2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_notifyNewChangeObserverAboutExistingState:", *(_QWORD *)(a1 + 48));
  os_unfair_lock_unlock(v2);
}

- (void)stopObserving:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  EMQueryingCollection *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v9 = self;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Observer removed: %{public}@", buf, 0x16u);
  }

  -[EMQueryingCollection queryScheduler](self, "queryScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__EMQueryingCollection_stopObserving___block_invoke;
  v7[3] = &unk_1E70F5630;
  v7[4] = self;
  v7[5] = v4;
  objc_msgSend(v6, "performBlock:", v7);

}

void __38__EMQueryingCollection_stopObserving___block_invoke(uint64_t a1)
{
  os_unfair_lock_s **v2;
  void *v3;
  os_unfair_lock_s *v4;
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  _BOOL4 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (os_unfair_lock_s **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "changeObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *v2 + 16;
  os_unfair_lock_lock(v4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
  {

    os_unfair_lock_unlock(v4);
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "_cancelQuery", (_QWORD)v12);
    goto LABEL_14;
  }
  v7 = 0;
  v8 = *(_QWORD *)v13;
  v9 = 1;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i) == *(_QWORD *)(a1 + 40);
      v9 &= v11;
      v7 |= v11;
    }
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v6);

  if ((v7 & 1) != 0)
    objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40), (_QWORD)v12);
  os_unfair_lock_unlock(v4);
  if (v9)
    goto LABEL_13;
LABEL_14:

}

- (void)refresh
{
  void *v3;
  _QWORD v4[5];

  -[EMQueryingCollection queryScheduler](self, "queryScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__EMQueryingCollection_refresh__block_invoke;
  v4[3] = &unk_1E70F1FA0;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __31__EMQueryingCollection_refresh__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B99BB000, v2, OS_LOG_TYPE_DEFAULT, "Pulling to refresh", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "isRecovering"))
  {
    +[EMQueryingCollection log](EMQueryingCollection, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "Do not trigger recovery for pulling to refresh since recovery is in progress", v5, 2u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
    objc_msgSend(*(id *)(a1 + 32), "repository");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject refreshQueryWithObserver:](v3, "refreshQueryWithObserver:", *(_QWORD *)(a1 + 32));
  }

}

- (void)_performQuery
{
  void *v3;
  void *v4;
  id v5;

  -[EMRepositoryObject repository](self, "repository");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EMQueryingCollection query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performQuery:withObserver:", v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMQueryingCollection setCancelationToken:](self, "setCancelationToken:", v4);

}

- (void)_cancelQuery
{
  void *v3;
  NSOrderedSet *recoveringItemIDs;

  -[EMQueryingCollection cancelationToken](self, "cancelationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[EMQueryingCollection setCancelationToken:](self, "setCancelationToken:", 0);
  os_unfair_lock_lock(&self->_itemIDsLock);
  -[NSMutableOrderedSet removeAllObjects](self->_itemIDs, "removeAllObjects");
  self->_foundAllItemIDs = 0;
  self->_foundFirstBatch = 0;
  recoveringItemIDs = self->_recoveringItemIDs;
  self->_recoveringItemIDs = 0;

  os_unfair_lock_unlock(&self->_itemIDsLock);
}

- (void)_performQueryIfNeeded
{
  void *v3;
  _QWORD v4[5];

  -[EMQueryingCollection queryScheduler](self, "queryScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__EMQueryingCollection__performQueryIfNeeded__block_invoke;
  v4[3] = &unk_1E70F1FA0;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __45__EMQueryingCollection__performQueryIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "cancelationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "_performQuery");
}

- (void)_cancelQueryIfNeeded
{
  void *v3;
  _QWORD v4[5];

  -[EMQueryingCollection queryScheduler](self, "queryScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__EMQueryingCollection__cancelQueryIfNeeded__block_invoke;
  v4[3] = &unk_1E70F1FA0;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __44__EMQueryingCollection__cancelQueryIfNeeded__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  void *v3;
  uint64_t v4;

  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 64);
  os_unfair_lock_lock(v2);
  objc_msgSend(*(id *)(a1 + 32), "changeObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "_cancelQuery");
  os_unfair_lock_unlock(v2);
}

- (BOOL)isRecovering
{
  EMQueryingCollection *v2;
  os_unfair_lock_s *p_itemIDsLock;

  v2 = self;
  p_itemIDsLock = &self->_itemIDsLock;
  os_unfair_lock_lock(&self->_itemIDsLock);
  LOBYTE(v2) = v2->_recoveringItemIDs != 0;
  os_unfair_lock_unlock(p_itemIDsLock);
  return (char)v2;
}

- (void)finishRecovery
{
  NSObject *v3;
  int v4;
  EMQueryingCollection *v5;
  __int16 v6;
  EMQueryingCollection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134218242;
    v5 = self;
    v6 = 2114;
    v7 = self;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "<%p> Finish Recovery\n%{public}@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)enumerateObserversWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  os_unfair_lock_s *p_changeObserversLock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  p_changeObserversLock = &self->_changeObserversLock;
  os_unfair_lock_lock(&self->_changeObserversLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[EMQueryingCollection changeObservers](self, "changeObservers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_changeObserversLock);
}

- (void)queryDidStartRecovery
{
  os_unfair_lock_s *p_itemIDsLock;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSOrderedSet *v7;
  NSOrderedSet *recoveringItemIDs;
  int v9;
  EMQueryingCollection *v10;
  __int16 v11;
  EMQueryingCollection *v12;
  __int16 v13;
  EMQueryingCollection *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_itemIDsLock = &self->_itemIDsLock;
  os_unfair_lock_lock(&self->_itemIDsLock);
  if (self->_recoveringItemIDs)
  {
    +[EMQueryingCollection log](EMQueryingCollection, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218242;
      v10 = self;
      v11 = 2114;
      v12 = self;
      _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "<%p> Restarting recovery\n%{public}@", (uint8_t *)&v9, 0x16u);
    }

  }
  else
  {
    +[EMQueryingCollection log](EMQueryingCollection, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[NSMutableOrderedSet count](self->_itemIDs, "count");
      v9 = 134218498;
      v10 = self;
      v11 = 2048;
      v12 = (EMQueryingCollection *)v6;
      v13 = 2114;
      v14 = self;
      _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Starting recovery (%lu existing items)\n%{public}@", (uint8_t *)&v9, 0x20u);
    }

    v7 = (NSOrderedSet *)-[NSMutableOrderedSet copy](self->_itemIDs, "copy");
    recoveringItemIDs = self->_recoveringItemIDs;
    self->_recoveringItemIDs = v7;

  }
  -[NSMutableOrderedSet removeAllObjects](self->_itemIDs, "removeAllObjects");
  self->_foundAllItemIDs = 0;
  self->_foundFirstBatch = 0;
  os_unfair_lock_unlock(p_itemIDsLock);
}

- (void)queryMatchedAddedObjectIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;
  uint8_t buf[4];
  EMQueryingCollection *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  EMQueryingCollection *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v18 = self;
    v19 = 2048;
    v20 = objc_msgSend(v8, "count");
    v21 = 2114;
    v22 = v9;
    v23 = 2114;
    v24 = self;
    _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Added %lu objectIDs before %{public}@\n%{public}@", buf, 0x2Au);
  }

  v12 = -[EMQueryingCollection isRecovering](self, "isRecovering");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__EMQueryingCollection_queryMatchedAddedObjectIDs_before_extraInfo___block_invoke;
  v14[3] = &unk_1E70F5678;
  v14[4] = self;
  v16 = v12;
  v13 = v10;
  v15 = v13;
  -[EMQueryingCollection _filterAndTransformObjectIDs:before:existingObjectID:batchBlock:](self, "_filterAndTransformObjectIDs:before:existingObjectID:batchBlock:", v8, 1, v9, v14);

}

void __68__EMQueryingCollection_queryMatchedAddedObjectIDs_before_extraInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "insertItemIDs:before:", v5, v6);
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "observerScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__EMQueryingCollection_queryMatchedAddedObjectIDs_before_extraInfo___block_invoke_2;
    v8[3] = &unk_1E70F3768;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v7, "performSyncBlock:", v8);

  }
}

uint64_t __68__EMQueryingCollection_queryMatchedAddedObjectIDs_before_extraInfo___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 61) = 1;
  objc_msgSend(*(id *)(a1 + 32), "notifyChangeObserversAboutAddedItemIDs:before:extraInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "enumerateObserversWithBlock:", &__block_literal_global_40);
}

void __68__EMQueryingCollection_queryMatchedAddedObjectIDs_before_extraInfo___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = a2;
  +[EMQueryingCollection signpostLog](EMQueryingCollection, "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, v2);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v6, OS_SIGNPOST_INTERVAL_END, v4, "EMCollectionFirstBatch", " enableTelemetry=YES ", v7, 2u);
  }

}

- (void)queryMatchedAddedObjectIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;
  uint8_t buf[4];
  EMQueryingCollection *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  EMQueryingCollection *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v18 = self;
    v19 = 2048;
    v20 = objc_msgSend(v8, "count");
    v21 = 2114;
    v22 = v9;
    v23 = 2114;
    v24 = self;
    _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Added %lu objectIDs after %{public}@\n%{public}@", buf, 0x2Au);
  }

  v12 = -[EMQueryingCollection isRecovering](self, "isRecovering");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__EMQueryingCollection_queryMatchedAddedObjectIDs_after_extraInfo___block_invoke;
  v14[3] = &unk_1E70F5678;
  v14[4] = self;
  v16 = v12;
  v13 = v10;
  v15 = v13;
  -[EMQueryingCollection _filterAndTransformObjectIDs:before:existingObjectID:batchBlock:](self, "_filterAndTransformObjectIDs:before:existingObjectID:batchBlock:", v8, 0, v9, v14);

}

void __67__EMQueryingCollection_queryMatchedAddedObjectIDs_after_extraInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "insertItemIDs:after:", v5, v6);
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "observerScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__EMQueryingCollection_queryMatchedAddedObjectIDs_after_extraInfo___block_invoke_2;
    v8[3] = &unk_1E70F3768;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v7, "performSyncBlock:", v8);

  }
}

uint64_t __67__EMQueryingCollection_queryMatchedAddedObjectIDs_after_extraInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyChangeObserversAboutAddedItemIDs:after:extraInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)queryMatchedMovedObjectIDs:(id)a3 before:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  EMQueryingCollection *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  EMQueryingCollection *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v20 = self;
    v21 = 2048;
    v22 = objc_msgSend(v8, "count");
    v23 = 2114;
    v24 = v9;
    v25 = 2114;
    v26 = self;
    _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Moved %lu objectIDs before %{public}@\n%{public}@", buf, 0x2Au);
  }

  -[EMQueryingCollection _itemIDsForObjectIDs:](self, "_itemIDsForObjectIDs:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMQueryingCollection itemIDForObjectID:](self, "itemIDForObjectID:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMQueryingCollection insertItemIDs:before:](self, "insertItemIDs:before:", v12, v13);
  if (!-[EMQueryingCollection isRecovering](self, "isRecovering"))
  {
    -[EMQueryingCollection observerScheduler](self, "observerScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__EMQueryingCollection_queryMatchedMovedObjectIDs_before_extraInfo___block_invoke;
    v15[3] = &unk_1E70F3768;
    v15[4] = self;
    v16 = v12;
    v17 = v13;
    v18 = v10;
    objc_msgSend(v14, "performSyncBlock:", v15);

  }
}

uint64_t __68__EMQueryingCollection_queryMatchedMovedObjectIDs_before_extraInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyChangeObserversAboutMovedItemIDs:before:extraInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)queryMatchedMovedObjectIDs:(id)a3 after:(id)a4 extraInfo:(id)a5
{
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _BYTE *v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v10 = a5;
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v8, "count");
    *(_WORD *)&buf[22] = 2114;
    v19 = v9;
    LOWORD(v20) = 2114;
    *(_QWORD *)((char *)&v20 + 2) = self;
    _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Moved %lu objectIDs after %{public}@\n%{public}@", buf, 0x2Au);
  }

  -[EMQueryingCollection _itemIDsForObjectIDs:](self, "_itemIDsForObjectIDs:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  *(_QWORD *)&v20 = __Block_byref_object_dispose__11;
  *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  -[EMQueryingCollection itemIDForObjectID:](self, "itemIDForObjectID:", v9);
  *((_QWORD *)&v20 + 1) = objc_claimAutoreleasedReturnValue();
  -[EMQueryingCollection insertItemIDs:after:](self, "insertItemIDs:after:", v12, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  if (!-[EMQueryingCollection isRecovering](self, "isRecovering"))
  {
    -[EMQueryingCollection observerScheduler](self, "observerScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__EMQueryingCollection_queryMatchedMovedObjectIDs_after_extraInfo___block_invoke;
    v14[3] = &unk_1E70F56A0;
    v14[4] = self;
    v15 = v12;
    v17 = buf;
    v16 = v10;
    objc_msgSend(v13, "performSyncBlock:", v14);

  }
  _Block_object_dispose(buf, 8);

}

uint64_t __67__EMQueryingCollection_queryMatchedMovedObjectIDs_after_extraInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyChangeObserversAboutMovedItemIDs:after:extraInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
}

- (void)queryMatchedChangedObjectIDs:(id)a3 extraInfo:(id)a4
{
  EMQueryingCollection *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSOrderedSet *recoveringItemIDs;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[5];
  uint8_t buf[4];
  EMQueryingCollection *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  EMQueryingCollection *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (EMQueryingCollection *)a3;
  v7 = a4;
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v22 = self;
    v23 = 2048;
    v24 = -[EMQueryingCollection count](v6, "count");
    v25 = 2114;
    v26 = v6;
    _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Changed %lu objectIDs: %{public}@", buf, 0x20u);
  }

  -[EMQueryingCollection _itemIDsForObjectIDs:](self, "_itemIDsForObjectIDs:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_itemIDsLock);
  recoveringItemIDs = self->_recoveringItemIDs;
  v11 = MEMORY[0x1E0C809B0];
  if (recoveringItemIDs)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63__EMQueryingCollection_queryMatchedChangedObjectIDs_extraInfo___block_invoke;
    v20[3] = &unk_1E70F5608;
    v20[4] = self;
    objc_msgSend(v9, "ef_filter:", v20);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  os_unfair_lock_unlock(&self->_itemIDsLock);
  v13 = objc_msgSend(v9, "count");
  if (v13 != -[EMQueryingCollection count](v6, "count"))
  {
    if (recoveringItemIDs)
    {
      +[EMQueryingCollection log](EMQueryingCollection, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(v9, "count");
        *(_DWORD *)buf = 134218498;
        v22 = self;
        v23 = 2048;
        v24 = v15;
        v25 = 2114;
        v26 = self;
        _os_log_impl(&dword_1B99BB000, v14, OS_LOG_TYPE_DEFAULT, "<%p> %lu changed itemIDs while recovering\n%{public}@", buf, 0x20u);
      }
    }
    else
    {
      +[EMQueryingCollection log](EMQueryingCollection, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[EMQueryingCollection queryMatchedChangedObjectIDs:extraInfo:].cold.1((uint64_t)self, buf, objc_msgSend(v9, "count"), v14);
    }

  }
  if (objc_msgSend(v9, "count"))
  {
    -[EMQueryingCollection observerScheduler](self, "observerScheduler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __63__EMQueryingCollection_queryMatchedChangedObjectIDs_extraInfo___block_invoke_24;
    v17[3] = &unk_1E70F2158;
    v17[4] = self;
    v18 = v9;
    v19 = v7;
    objc_msgSend(v16, "performSyncBlock:", v17);

  }
}

uint64_t __63__EMQueryingCollection_queryMatchedChangedObjectIDs_extraInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", a2);
}

uint64_t __63__EMQueryingCollection_queryMatchedChangedObjectIDs_extraInfo___block_invoke_24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyChangeObserversAboutChangedItemIDs:extraInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)queryAnticipatesDeletedObjectIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  EMQueryingCollection *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  EMQueryingCollection *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v11 = self;
    v12 = 2048;
    v13 = objc_msgSend(v4, "count");
    v14 = 2114;
    v15 = self;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Anticipating delete of %lu objectIDs\n%{public}@", buf, 0x20u);
  }

  -[EMQueryingCollection _itemIDsForObjectIDs:](self, "_itemIDsForObjectIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_itemIDsLock);
  -[NSMutableSet addObjectsFromArray:](self->_itemIDsAnticipatingDelete, "addObjectsFromArray:", v6);
  os_unfair_lock_unlock(&self->_itemIDsLock);
  if (!-[EMQueryingCollection isRecovering](self, "isRecovering"))
  {
    -[EMQueryingCollection observerScheduler](self, "observerScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__EMQueryingCollection_queryAnticipatesDeletedObjectIDs___block_invoke;
    v8[3] = &unk_1E70F2070;
    v8[4] = self;
    v9 = v6;
    objc_msgSend(v7, "performSyncBlock:", v8);

  }
}

void __57__EMQueryingCollection_queryAnticipatesDeletedObjectIDs___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__EMQueryingCollection_queryAnticipatesDeletedObjectIDs___block_invoke_2;
  v2[3] = &unk_1E70F4030;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "enumerateObserversWithBlock:", v2);

}

uint64_t __57__EMQueryingCollection_queryAnticipatesDeletedObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collection:deletedItemIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)queryMatchedDeletedObjectIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  EMQueryingCollection *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  EMQueryingCollection *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v12 = self;
    v13 = 2048;
    v14 = objc_msgSend(v4, "count");
    v15 = 2114;
    v16 = self;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Deleted %lu objectIDs\n%{public}@", buf, 0x20u);
  }

  -[EMQueryingCollection _itemIDsForObjectIDs:](self, "_itemIDsForObjectIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMQueryingCollection removeItemIDs:](self, "removeItemIDs:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[EMQueryingCollection isRecovering](self, "isRecovering") && objc_msgSend(v7, "count"))
  {
    -[EMQueryingCollection observerScheduler](self, "observerScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__EMQueryingCollection_queryMatchedDeletedObjectIDs___block_invoke;
    v9[3] = &unk_1E70F2070;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "performSyncBlock:", v9);

  }
}

void __53__EMQueryingCollection_queryMatchedDeletedObjectIDs___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__EMQueryingCollection_queryMatchedDeletedObjectIDs___block_invoke_2;
  v2[3] = &unk_1E70F4030;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "enumerateObserversWithBlock:", v2);

}

uint64_t __53__EMQueryingCollection_queryMatchedDeletedObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collection:deletedItemIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)queryDidFinishInitialLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  NSUInteger v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSOrderedSet *v21;
  uint64_t v22;
  EFPromise *v23;
  EFPromise *allItemIDsPromise;
  uint64_t v25;
  NSMutableOrderedSet *itemIDs;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSOrderedSet *recoveringItemIDs;
  void *v38;
  id v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[4];
  id v44;
  EMQueryingCollection *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[5];
  id v52;
  uint8_t buf[4];
  EMQueryingCollection *v54;
  __int16 v55;
  EMQueryingCollection *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  EMQueryingCollection *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v54 = self;
    v55 = 2114;
    v56 = self;
    _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_DEFAULT, "<%p> Finished initial load\n%{public}@", buf, 0x16u);
  }

  if (-[EMQueryingCollection isRecovering](self, "isRecovering"))
    -[EMQueryingCollection finishRecovery](self, "finishRecovery");
  os_unfair_lock_lock(&self->_itemIDsLock);
  recoveringItemIDs = self->_recoveringItemIDs;
  if (!recoveringItemIDs)
  {
    v14 = 0;
    v39 = 0;
    goto LABEL_24;
  }
  -[NSMutableOrderedSet differenceFromOrderedSet:](self->_itemIDs, "differenceFromOrderedSet:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v4;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke;
  v51[3] = &unk_1E70F56C8;
  v51[4] = self;
  v39 = v5;
  v52 = v39;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCC8C10](v51);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v4, "insertions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
  v36 = 24;
  v9 = 0;
  if (!v8)
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_21;
  }
  v10 = *(_QWORD *)v48;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v48 != v10)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "index");
LABEL_14:
        ++v9;
        continue;
      }
      if (objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "index") == v11 + v9)
        goto LABEL_14;
      v6[2](v6, v11, v9);
      v11 = objc_msgSend(v13, "index");
      v9 = 1;
    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
  }
  while (v8);
LABEL_21:

  v6[2](v6, v11, v9);
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = -[NSOrderedSet count](self->_recoveringItemIDs, "count");
    v17 = -[NSMutableOrderedSet count](self->_itemIDs, "count");
    objc_msgSend(v38, "removals");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");
    v20 = objc_msgSend(v39, "count");
    *(_DWORD *)buf = 134219266;
    v54 = self;
    v55 = 2048;
    v56 = (EMQueryingCollection *)v16;
    v57 = 2048;
    v58 = v17;
    v59 = 2048;
    v60 = v19;
    v61 = 2048;
    v62 = v20;
    v63 = 2114;
    v64 = self;
    _os_log_impl(&dword_1B99BB000, v15, OS_LOG_TYPE_DEFAULT, "<%p> Finishing recovery, number of items went from %lu to %lu (%lu removals, %lu grouped insertions)\n%{public}@", buf, 0x3Eu);

  }
  v21 = self->_recoveringItemIDs;
  self->_recoveringItemIDs = 0;

  v14 = v38;
LABEL_24:
  v22 = -[NSMutableOrderedSet count](self->_itemIDs, "count", v36);
  self->_foundAllItemIDs = 1;
  self->_foundFirstBatch = 1;
  v23 = self->_allItemIDsPromise;
  allItemIDsPromise = self->_allItemIDsPromise;
  self->_allItemIDsPromise = 0;

  if (v23)
  {
    v25 = -[NSMutableSet count](self->_itemIDsAnticipatingDelete, "count");
    itemIDs = self->_itemIDs;
    if (v25)
    {
      v27 = (void *)-[NSMutableOrderedSet mutableCopy](itemIDs, "mutableCopy");
      objc_msgSend(v27, "minusSet:", self->_itemIDsAnticipatingDelete);
      objc_msgSend(v27, "array");
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSMutableOrderedSet array](itemIDs, "array");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "copy");
    }
    v29 = (void *)v28;

  }
  else
  {
    v29 = 0;
  }
  os_unfair_lock_unlock(&self->_itemIDsLock);
  objc_msgSend(v14, "removals");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "count"))
  {

    goto LABEL_33;
  }
  v31 = objc_msgSend(v39, "count") == 0;

  if (v31)
  {
    if (!v22)
    {
      -[EMQueryingCollection observerScheduler](self, "observerScheduler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_30;
      v42[3] = &unk_1E70F1FA0;
      v42[4] = self;
      objc_msgSend(v35, "performSyncBlock:", v42);

    }
  }
  else
  {
LABEL_33:
    -[EMQueryingCollection observerScheduler](self, "observerScheduler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_27;
    v43[3] = &unk_1E70F2158;
    v44 = v14;
    v45 = self;
    v46 = v39;
    objc_msgSend(v32, "performSyncBlock:", v43);

  }
  if (recoveringItemIDs)
  {
    -[EMQueryingCollection observerScheduler](self, "observerScheduler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_2_31;
    v41[3] = &unk_1E70F1FA0;
    v41[4] = self;
    objc_msgSend(v33, "performSyncBlock:", v41);

  }
  -[EMQueryingCollection observerScheduler](self, "observerScheduler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_4;
  v40[3] = &unk_1E70F1FA0;
  v40[4] = self;
  objc_msgSend(v34, "performSyncBlock:", v40);

  -[EMQueryingCollection _cancelQueryIfNeeded](self, "_cancelQueryIfNeeded");
  -[EFPromise finishWithResult:](v23, "finishWithResult:", v29);

}

void __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    if (a2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectAtIndexedSubscript:", a2 - 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "ef_subarrayWithRange:", a2, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v9, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

void __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_27(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_2;
    v20[3] = &unk_1E70F4030;
    v4 = *(void **)(a1 + 32);
    v21 = *(id *)(a1 + 40);
    v22 = v4;
    objc_msgSend(v21, "enumerateObserversWithBlock:", v20);

  }
  +[EMQueryingCollection log](EMQueryingCollection, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(*(id *)(a1 + 48), "count");
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v25 = v6;
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "Start to notify observer of %lu grouped insertions\n%{public}@", buf, 0x16u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = *(id *)(a1 + 48);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = *(void **)(a1 + 40);
        objc_msgSend(v12, "second", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "first");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "notifyChangeObserversAboutAddedItemIDs:after:extraInfo:", v14, v15, 0);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v9);
  }

}

void __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "removals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_mapSelector:", sel_object);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collection:deletedItemIDs:", v3, v5);

}

uint64_t __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyChangeObserversAboutAddedItemIDs:before:extraInfo:", MEMORY[0x1E0C9AA60], 0, 0);
}

uint64_t __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_2_31(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_3;
  v3[3] = &unk_1E70F56F0;
  v3[4] = v1;
  return objc_msgSend(v1, "enumerateObserversWithBlock:", v3);
}

void __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didFinishRecoveryForCollection:", *(_QWORD *)(a1 + 32));

}

void __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  +[EMQueryingCollection signpostLog](EMQueryingCollection, "signpostLog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_5;
  v5[3] = &unk_1E70F4030;
  v5[4] = v3;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateObserversWithBlock:", v5);

}

void __49__EMQueryingCollection_queryDidFinishInitialLoad__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "collectionDidFinishInitialLoad:", *(_QWORD *)(a1 + 32));
  v4 = os_signpost_id_make_with_pointer(*(os_log_t *)(a1 + 40), v3);
  v5 = *(id *)(a1 + 40);
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B99BB000, v6, OS_SIGNPOST_INTERVAL_END, v4, "EMCollectionTotal", " enableTelemetry=YES ", v7, 2u);
  }

}

- (void)queryDidFinishRemoteSearch
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__EMQueryingCollection_queryDidFinishRemoteSearch__block_invoke;
  v2[3] = &unk_1E70F56F0;
  v2[4] = self;
  -[EMQueryingCollection enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v2);
}

void __50__EMQueryingCollection_queryDidFinishRemoteSearch__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didFinishRemoteSearchForCollection:", *(_QWORD *)(a1 + 32));

}

- (id)_itemIDsForObjectIDs:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__EMQueryingCollection__itemIDsForObjectIDs___block_invoke;
  v4[3] = &unk_1E70F4288;
  v4[4] = self;
  objc_msgSend(a3, "ef_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __45__EMQueryingCollection__itemIDsForObjectIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "itemIDForObjectID:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_filterAndTransformObjectIDs:(id)a3 before:(BOOL)a4 existingObjectID:(id)a5 batchBlock:(id)a6
{
  _BOOL4 v8;
  id v10;
  void (**v11)(id, void *, void *);
  id v12;
  os_unfair_lock_s *p_itemIDsLock;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void (**v21)(_QWORD);
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD *v38;
  BOOL v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD *v43;
  BOOL v44;
  _QWORD v45[5];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v8 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v10 = a5;
  v11 = (void (**)(id, void *, void *))a6;
  v29 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  p_itemIDsLock = &self->_itemIDsLock;
  os_unfair_lock_lock(&self->_itemIDsLock);
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__11;
  v45[4] = __Block_byref_object_dispose__11;
  v46 = (id)0xAAAAAAAAAAAAAAAALL;
  -[EMQueryingCollection itemIDForObjectID:](self, "itemIDForObjectID:", v10);
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __88__EMQueryingCollection__filterAndTransformObjectIDs_before_existingObjectID_batchBlock___block_invoke;
  v40[3] = &unk_1E70F5718;
  v16 = v14;
  v41 = v16;
  v43 = v45;
  v44 = v8;
  v17 = v12;
  v42 = v17;
  v18 = (void *)MEMORY[0x1BCCC8C10](v40);
  if (v8)
    v19 = 2;
  else
    v19 = 0;
  v35[0] = v15;
  v35[1] = 3221225472;
  v35[2] = __88__EMQueryingCollection__filterAndTransformObjectIDs_before_existingObjectID_batchBlock___block_invoke_2;
  v35[3] = &unk_1E70F5740;
  v35[4] = self;
  v20 = v16;
  v36 = v20;
  v21 = v18;
  v37 = v21;
  v38 = v45;
  v39 = v8;
  objc_msgSend(v30, "enumerateObjectsWithOptions:usingBlock:", v19, v35);
  if (objc_msgSend(v20, "count"))
    v21[2](v21);

  _Block_object_dispose(v45, 8);
  os_unfair_lock_unlock(p_itemIDsLock);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = v17;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v26, "first");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "second");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, v27, v28);

      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
    }
    while (v23);
  }

}

void __88__EMQueryingCollection__filterAndTransformObjectIDs_before_existingObjectID_batchBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0D1EF38];
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v2, "pairWithFirst:second:", v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(v4, "insertObject:atIndex:", v5, 0);
  else
    objc_msgSend(v4, "addObject:", v5);
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");

}

void __88__EMQueryingCollection__filterAndTransformObjectIDs_before_existingObjectID_batchBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemIDForObjectID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", v4))
  {
    +[EMQueryingCollection log](EMQueryingCollection, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 134218498;
      v9 = v6;
      v10 = 2114;
      v11 = v4;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Found duplicate: %{public}@\n%{public}@", (uint8_t *)&v8, 0x20u);
    }

    if (objc_msgSend(*(id *)(a1 + 40), "count"))
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4);
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    if (*(_BYTE *)(a1 + 64))
      objc_msgSend(v7, "insertObject:atIndex:", v4, 0);
    else
      objc_msgSend(v7, "addObject:", v4);
  }

}

- (BOOL)observerContainsObjectID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[EMQueryingCollection objectIDBelongsToCollection:](self, "objectIDBelongsToCollection:", v4))
  {
    -[EMQueryingCollection itemIDForObjectID:](self, "itemIDForObjectID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EMQueryingCollection containsItemID:includeRecovery:](self, "containsItemID:includeRecovery:", v5, 0);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)queryReplacedObjectID:(id)a3 withNewObjectID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  NSObject *v16;
  uint8_t buf[4];
  EMQueryingCollection *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  EMQueryingCollection *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[EMQueryingCollection objectIDBelongsToCollection:](self, "objectIDBelongsToCollection:", v6))
  {
    +[EMQueryingCollection log](EMQueryingCollection, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v18 = self;
      v19 = 2114;
      v20 = v6;
      v21 = 2114;
      v22 = v7;
      v23 = 2114;
      v24 = self;
      _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "<%p> Replace objectID %{public}@ with %{public}@\n%{public}@", buf, 0x2Au);
    }

    -[EMQueryingCollection itemIDForObjectID:](self, "itemIDForObjectID:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[EMQueryingCollection itemIDForObjectID:](self, "itemIDForObjectID:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_itemIDsLock);
      v11 = -[NSMutableOrderedSet indexOfObject:](self->_itemIDs, "indexOfObject:", v9);
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_itemIDs, "replaceObjectAtIndex:withObject:", v11, v10);
      os_unfair_lock_unlock(&self->_itemIDsLock);
      -[EMQueryingCollection observerScheduler](self, "observerScheduler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __62__EMQueryingCollection_queryReplacedObjectID_withNewObjectID___block_invoke;
      v14[3] = &unk_1E70F2158;
      v14[4] = self;
      v15 = v9;
      v13 = v10;
      v16 = v13;
      objc_msgSend(v12, "performSyncBlock:", v14);

    }
    else
    {
      +[EMQueryingCollection log](EMQueryingCollection, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v18 = self;
        v19 = 2114;
        v20 = v6;
        _os_log_impl(&dword_1B99BB000, v13, OS_LOG_TYPE_DEFAULT, "<%p> Replace objectID %{public}@ but itemIDForObjectID is nil", buf, 0x16u);
      }
    }

  }
}

void __62__EMQueryingCollection_queryReplacedObjectID_withNewObjectID___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__EMQueryingCollection_queryReplacedObjectID_withNewObjectID___block_invoke_2;
  v3[3] = &unk_1E70F41E8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateObserversWithBlock:", v3);

}

uint64_t __62__EMQueryingCollection_queryReplacedObjectID_withNewObjectID___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "collection:replacedExistingItemID:withNewItemID:", a1[4], a1[5], a1[6]);
}

- (void)notifyNewChangeObserverAboutExistingState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EMQueryingCollection observerScheduler](self, "observerScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__EMQueryingCollection_notifyNewChangeObserverAboutExistingState___block_invoke;
  v7[3] = &unk_1E70F2070;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __66__EMQueryingCollection_notifyNewChangeObserverAboutExistingState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyNewChangeObserverAboutExistingState:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyNewChangeObserverAboutExistingState:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  EMQueryingCollection *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  EMQueryingCollection *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMQueryingCollection signpostLog](EMQueryingCollection, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, v4);
  if (self->_foundFirstBatch && !-[EMQueryingCollection isRecovering](self, "isRecovering"))
  {
    +[EMQueryingCollection log](EMQueryingCollection, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NSMutableOrderedSet count](self->_itemIDs, "count");
      v14 = 134218498;
      v15 = self;
      v16 = 2048;
      v17 = v8;
      v18 = 2114;
      v19 = self;
      _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Added stocked %lu objectIDs\n%{public}@", (uint8_t *)&v14, 0x20u);
    }

    -[NSMutableOrderedSet array](self->_itemIDs, "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMQueryingCollection notifyChangeObserver:stockedItemIDs:](self, "notifyChangeObserver:stockedItemIDs:", v4, v9);

    v10 = v5;
    v11 = v10;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B99BB000, v11, OS_SIGNPOST_INTERVAL_END, v6, "EMCollectionFirstBatch", " enableTelemetry=YES ", (uint8_t *)&v14, 2u);
    }

  }
  if (self->_foundAllItemIDs && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "collectionDidFinishInitialLoad:", self);
    v12 = v5;
    v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B99BB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "EMCollectionTotal", " enableTelemetry=YES ", (uint8_t *)&v14, 2u);
    }

  }
}

- (EMQuery)query
{
  return self->_query;
}

- (EFCancelable)cancelationToken
{
  return self->_cancelationToken;
}

- (void)setCancelationToken:(id)a3
{
  objc_storeStrong((id *)&self->_cancelationToken, a3);
}

- (NSHashTable)changeObservers
{
  return self->_changeObservers;
}

- (void)setChangeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_changeObservers, a3);
}

- (EFScheduler)observerScheduler
{
  return self->_observerScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_allItemIDsPromise, 0);
  objc_storeStrong((id *)&self->_recoveringItemIDs, 0);
  objc_storeStrong((id *)&self->_itemIDsAnticipatingDelete, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
}

- (void)queryMatchedChangedObjectIDs:(uint64_t)a3 extraInfo:(os_log_t)log .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218498;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  *((_WORD *)buf + 11) = 2114;
  *((_QWORD *)buf + 3) = a1;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "<%p> Fewer than expected changed itemIDs: %lu\n%{public}@", buf, 0x20u);
}

@end
