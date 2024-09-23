@implementation CPLEngineStatusCenter

- (CPLEngineStatusCenter)initWithEngineStore:(id)a3 name:(id)a4
{
  CPLEngineStatusCenter *v4;
  NSMutableSet *v5;
  NSMutableSet *persistedScopedIdentifiers;
  NSMutableDictionary *v7;
  NSMutableDictionary *pendingTransientStatuses;
  NSMutableSet *v9;
  NSMutableSet *pendingDeletedTransientStatuses;
  NSMutableDictionary *v11;
  NSMutableDictionary *transientStatuses;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CPLEngineStatusCenter;
  v4 = -[CPLEngineStorage initWithEngineStore:name:](&v14, sel_initWithEngineStore_name_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    persistedScopedIdentifiers = v4->_persistedScopedIdentifiers;
    v4->_persistedScopedIdentifiers = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingTransientStatuses = v4->_pendingTransientStatuses;
    v4->_pendingTransientStatuses = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingDeletedTransientStatuses = v4->_pendingDeletedTransientStatuses;
    v4->_pendingDeletedTransientStatuses = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    transientStatuses = v4->_transientStatuses;
    v4->_transientStatuses = v11;

  }
  return v4;
}

- (unint64_t)scopeType
{
  return 1;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  NSDate *transactionStartDate;
  void *v12;

  -[NSMutableSet removeAllObjects](self->_persistedScopedIdentifiers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_pendingTransientStatuses, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_pendingDeletedTransientStatuses, "removeAllObjects");
  self->_currentGeneration = 0;
  transactionStartDate = self->_transactionStartDate;
  self->_transactionStartDate = 0;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", a3, a4, a5, a6);

  return (char)a6;
}

- (BOOL)hasStatusChanges
{
  void *v4;
  char v5;

  if (-[NSMutableDictionary count](self->_transientStatuses, "count"))
    return 1;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasStatusChanges");

  return v5;
}

- (BOOL)notifyStatusForRecordHasChanged:(id)a3 persist:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "scopedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();

  LOBYTE(a5) = -[CPLEngineStatusCenter notifyStatusForRecordWithScopedIdentifierHasChanged:recordClass:persist:error:](self, "notifyStatusForRecordWithScopedIdentifierHasChanged:recordClass:persist:error:", v9, v10, v6, a5);
  return (char)a5;
}

- (BOOL)notifyStatusForRecordViewHasChanged:(id)a3 persist:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "scopedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "recordClass");

  LOBYTE(a5) = -[CPLEngineStatusCenter notifyStatusForRecordWithScopedIdentifierHasChanged:recordClass:persist:error:](self, "notifyStatusForRecordWithScopedIdentifierHasChanged:recordClass:persist:error:", v9, v10, v6, a5);
  return (char)a5;
}

- (BOOL)notifyStatusForRecordWithScopedIdentifierHasChanged:(id)a3 recordClass:(Class)a4 persist:(BOOL)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  NSDate *v13;
  NSDate *transactionStartDate;
  _CPLTransientStatus *v15;
  _CPLTransientStatus *v16;
  CPLRecordStatus *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = a3;
  if (!self->_transactionStartDate)
  {
    -[CPLEngineStorage platformObject](self, "platformObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "getNewGeneration:error:", &self->_currentGeneration, a6);

    if (!v12)
    {
      v18 = 0;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    transactionStartDate = self->_transactionStartDate;
    self->_transactionStartDate = v13;

  }
  if ((-[NSMutableSet containsObject:](self->_persistedScopedIdentifiers, "containsObject:", v10) & 1) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingTransientStatuses, "objectForKeyedSubscript:", v10);
    v15 = (_CPLTransientStatus *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a5)
    {
      if (v15)
      {
        -[_CPLTransientStatus status](v15, "status");
        v17 = (CPLRecordStatus *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_pendingTransientStatuses, "removeObjectForKey:", v10);
      }
      else
      {
        v19 = (void *)-[objc_class newRecordWithScopedIdentifier:](a4, "newRecordWithScopedIdentifier:", v10);
        v17 = -[CPLRecordStatus initWithRecord:generation:]([CPLRecordStatus alloc], "initWithRecord:generation:", v19, self->_currentGeneration);

      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_transientStatuses, "objectForKeyedSubscript:", v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        -[NSMutableSet addObject:](self->_pendingDeletedTransientStatuses, "addObject:", v10);
      -[NSMutableSet addObject:](self->_persistedScopedIdentifiers, "addObject:", v10);
      -[CPLEngineStorage platformObject](self, "platformObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v21, "addStatus:error:", v17, a6);

      goto LABEL_16;
    }

    if (!v16)
    {
      -[NSMutableSet removeObject:](self->_pendingDeletedTransientStatuses, "removeObject:", v10);
      v17 = (CPLRecordStatus *)-[objc_class newRecordWithScopedIdentifier:](a4, "newRecordWithScopedIdentifier:", v10);
      v16 = -[_CPLTransientStatus initWithRecord:generation:date:]([_CPLTransientStatus alloc], "initWithRecord:generation:date:", v17, self->_currentGeneration, self->_transactionStartDate);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingTransientStatuses, "setObject:forKeyedSubscript:", v16, v10);
      v18 = 1;
LABEL_16:

      goto LABEL_17;
    }
  }
  v18 = 1;
LABEL_17:

  return v18;
}

- (id)statusChanges
{
  uint64_t v3;
  NSMutableDictionary *transientStatuses;
  NSMutableDictionary *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD v27[4];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_transientStatuses, "count")
    || -[NSMutableSet count](self->_pendingDeletedTransientStatuses, "count"))
  {
    v3 = -[NSMutableSet count](self->_pendingDeletedTransientStatuses, "count");
    transientStatuses = self->_transientStatuses;
    if (v3)
    {
      v5 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](transientStatuses, "mutableCopy");
      -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", self->_pendingTransientStatuses);
    }
    else
    {
      v5 = transientStatuses;
    }
    v6 = -[NSMutableDictionary count](self->_transientStatuses, "count");
    if (v6 >= 0x3E8)
      v7 = 1000;
    else
      v7 = v6;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __38__CPLEngineStatusCenter_statusChanges__block_invoke;
    v23[3] = &unk_1E60DC680;
    v23[4] = self;
    v9 = v8;
    v24 = v9;
    v25 = v27;
    v26 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v23);
    v10 = objc_msgSend(v9, "count");
    v11 = v24;
    if (v10)
    {
      v12 = (NSMutableDictionary *)v9;

      _Block_object_dispose(v27, 8);
      goto LABEL_20;
    }

    _Block_object_dispose(v27, 8);
  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "statusChangesMaximumCount:", 1000);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v14;
  v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v5);
        -[CPLEngineStatusCenter _fillStatus:](self, "_fillStatus:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++), (_QWORD)v19);
      }
      while (v15 != v17);
      v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v15);
  }
  v12 = v5;
LABEL_20:

  return v12;
}

- (id)_allScopedIdentifierInCollection:(id)a3 withScopeIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "scopeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if (v14)
        {
          if (!v9)
            v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v9, "addObject:", v12);
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_removeStatusesInDictionary:(id)a3 withScopeIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[CPLEngineStatusCenter _allScopedIdentifierInCollection:withScopeIdentifier:](self, "_allScopedIdentifierInCollection:withScopeIdentifier:", v6, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsForKeys:", v7);

}

- (void)_removeScopedIdentifiersFromSet:(id)a3 withScopeIdentifier:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[CPLEngineStatusCenter _allScopedIdentifierInCollection:withScopeIdentifier:](self, "_allScopedIdentifierInCollection:withScopeIdentifier:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "minusSet:", v5);

}

- (void)resetTransientStatusesWithScopeIdentifier:(id)a3
{
  NSMutableDictionary *transientStatuses;
  id v5;

  transientStatuses = self->_transientStatuses;
  v5 = a3;
  -[CPLEngineStatusCenter _removeStatusesInDictionary:withScopeIdentifier:](self, "_removeStatusesInDictionary:withScopeIdentifier:", transientStatuses, v5);
  -[CPLEngineStatusCenter _removeStatusesInDictionary:withScopeIdentifier:](self, "_removeStatusesInDictionary:withScopeIdentifier:", self->_pendingTransientStatuses, v5);
  -[CPLEngineStatusCenter _removeScopedIdentifiersFromSet:withScopeIdentifier:](self, "_removeScopedIdentifiersFromSet:withScopeIdentifier:", self->_persistedScopedIdentifiers, v5);
  -[CPLEngineStatusCenter _removeScopedIdentifiersFromSet:withScopeIdentifier:](self, "_removeScopedIdentifiersFromSet:withScopeIdentifier:", self->_pendingDeletedTransientStatuses, v5);

}

- (void)resetAllTransientStatuses
{
  -[NSMutableSet removeAllObjects](self->_persistedScopedIdentifiers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_pendingTransientStatuses, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_pendingDeletedTransientStatuses, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_transientStatuses, "removeAllObjects");
}

- (id)statusesForRecordsWithScopedIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingTransientStatuses, "objectForKeyedSubscript:", v11, (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12
          || (-[NSMutableDictionary objectForKeyedSubscript:](self->_transientStatuses, "objectForKeyedSubscript:", v11),
              (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(v12, "status");
          v13 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[CPLEngineStorage platformObject](self, "platformObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "statusForRecordWithScopedIdentifier:", v11);
          v13 = objc_claimAutoreleasedReturnValue();
        }
        v14 = (void *)v13;

        if (v14)
        {
          -[CPLEngineStatusCenter _fillStatus:](self, "_fillStatus:", v14);
        }
        else
        {
          -[CPLEngineStatusCenter _statusFromCachesWithRecordScopedIdentifier:](self, "_statusFromCachesWithRecordScopedIdentifier:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

        ++v10;
      }
      while (v8 != v10);
      v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v15;
    }
    while (v15);
  }

  return v5;
}

- (id)statusesForRecordsWithIdentifiers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[CPLScopedIdentifier scopedIdentifiersFromArrayOfUnknownIdentifiers:](CPLScopedIdentifier, "scopedIdentifiersFromArrayOfUnknownIdentifiers:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStatusCenter statusesForRecordsWithScopedIdentifiers:](self, "statusesForRecordsWithScopedIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLScopedIdentifier unscopedIdentifiersFromDictionaryOfScopedIdentifiers:](CPLScopedIdentifier, "unscopedIdentifiersFromDictionaryOfScopedIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)acknowledgeChangedStatuses:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  int v19;
  BOOL v20;
  id obj;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v9, "record");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "scopedIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKeyedSubscript:](self->_transientStatuses, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingTransientStatuses, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = objc_msgSend(v13, "generation");
          if (v15 <= objc_msgSend(v9, "generation"))
          {
            -[NSMutableDictionary removeObjectForKey:](self->_pendingTransientStatuses, "removeObjectForKey:", v11);

            v14 = 0;
          }
        }
        if (v12)
        {
          v16 = objc_msgSend(v12, "generation");
          v17 = objc_msgSend(v9, "generation");
          if (!v14 && v16 <= v17)
            -[NSMutableSet addObject:](self->_pendingDeletedTransientStatuses, "addObject:", v11);
        }
        v24 = 0;
        -[CPLEngineStorage platformObject](self, "platformObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "acknowledgeChangedStatus:hasBeenDeleted:error:", v9, &v24, a4);

        if (!v19)
        {

          v20 = 0;
          goto LABEL_20;
        }
        if (v24)
          -[NSMutableSet removeObject:](self->_persistedScopedIdentifiers, "removeObject:", v11);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v6)
        continue;
      break;
    }
  }
  v20 = 1;
LABEL_20:

  return v20;
}

- (BOOL)discardNotificationForRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  NSMutableSet *persistedScopedIdentifiers;
  id v7;
  void *v8;

  persistedScopedIdentifiers = self->_persistedScopedIdentifiers;
  v7 = a3;
  -[NSMutableSet removeObject:](persistedScopedIdentifiers, "removeObject:", v7);
  -[NSMutableDictionary removeObjectForKey:](self->_pendingTransientStatuses, "removeObjectForKey:", v7);
  -[NSMutableSet addObject:](self->_pendingDeletedTransientStatuses, "addObject:", v7);
  -[CPLEngineStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v8, "discardNotificationForRecordWithScopedIdentifier:error:", v7, a4);

  return (char)a4;
}

- (void)writeTransactionDidFail
{
  NSDate *transactionStartDate;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPLEngineStatusCenter;
  -[CPLEngineStorage writeTransactionDidFail](&v4, sel_writeTransactionDidFail);
  -[NSMutableSet removeAllObjects](self->_persistedScopedIdentifiers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_pendingTransientStatuses, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_pendingDeletedTransientStatuses, "removeAllObjects");
  self->_currentGeneration = 0;
  transactionStartDate = self->_transactionStartDate;
  self->_transactionStartDate = 0;

}

- (void)writeTransactionDidSucceed
{
  _BOOL4 v3;
  NSMutableDictionary *transientStatuses;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  NSDate *transactionStartDate;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)CPLEngineStatusCenter;
  -[CPLEngineStorage writeTransactionDidSucceed](&v28, sel_writeTransactionDidSucceed);
  if (-[NSMutableSet count](self->_persistedScopedIdentifiers, "count"))
    v3 = 1;
  else
    v3 = -[NSMutableDictionary count](self->_pendingTransientStatuses, "count") != 0;
  transientStatuses = self->_transientStatuses;
  -[NSMutableSet allObjects](self->_persistedScopedIdentifiers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](transientStatuses, "removeObjectsForKeys:", v5);

  -[NSMutableSet removeAllObjects](self->_persistedScopedIdentifiers, "removeAllObjects");
  -[NSMutableDictionary addEntriesFromDictionary:](self->_transientStatuses, "addEntriesFromDictionary:", self->_pendingTransientStatuses);
  v6 = self->_transientStatuses;
  -[NSMutableSet allObjects](self->_pendingDeletedTransientStatuses, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](v6, "removeObjectsForKeys:", v7);

  -[NSMutableDictionary removeAllObjects](self->_pendingTransientStatuses, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_pendingDeletedTransientStatuses, "removeAllObjects");
  self->_currentGeneration = 0;
  transactionStartDate = self->_transactionStartDate;
  self->_transactionStartDate = 0;

  if ((unint64_t)-[NSMutableDictionary count](self->_transientStatuses, "count") >= 0xC9)
  {
    v9 = 200 - -[NSMutableDictionary count](self->_transientStatuses, "count");
    if (!_CPLSilentLogging)
    {
      if (__CPLStorageOSLogDomain_onceToken_17920 != -1)
        dispatch_once(&__CPLStorageOSLogDomain_onceToken_17920, &__block_literal_global_139);
      v10 = __CPLStorageOSLogDomain_result_17921;
      if (os_log_type_enabled((os_log_t)__CPLStorageOSLogDomain_result_17921, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v31 = v9;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEFAULT, "Too many pending transient notifications, dropping %lu of them", buf, 0xCu);
      }
    }
    v23 = v3;
    -[NSMutableDictionary allValues](self->_transientStatuses, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_17923);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
LABEL_12:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = self->_transientStatuses;
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "record");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "scopedIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v18, "removeObjectForKey:", v20);

        if (!--v9)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v15)
            goto LABEL_12;
          break;
        }
      }
    }

    v3 = v23;
  }
  if (v3)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "engineLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "notifyAttachedObjectsHasStatusChanges");

  }
}

- (void)_fillStatus:(id)a3 withClientCacheRecordView:(id)a4 cloudCacheRecord:(id)a5 isConfirmed:(BOOL)a6 isStaged:(BOOL)a7 isInIDMapping:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  id v38;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a5;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pushRepository");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "record");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scopedIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __115__CPLEngineStatusCenter__fillStatus_withClientCacheRecordView_cloudCacheRecord_isConfirmed_isStaged_isInIDMapping___block_invoke;
  v35 = &unk_1E60D6EC0;
  v36 = v17;
  v20 = v19;
  v37 = v20;
  v21 = v14;
  v38 = v21;
  v22 = v17;
  v23 = MEMORY[0x1B5E08DC4](&v32);
  v24 = (void *)v23;
  if (!a4)
  {
    if (v15)
    {
      (*(void (**)(uint64_t))(v23 + 16))(v23);
      if ((objc_msgSend(v21, "isWaitingForUpdate") & 1) != 0 || (objc_msgSend(v21, "isUpdating") & 1) != 0)
        goto LABEL_16;
      if (v9)
        goto LABEL_3;
    }
    else if (!v8)
    {
      objc_msgSend(v21, "setUnknown:", 1);
      goto LABEL_16;
    }
    objc_msgSend(v21, "setResetting:", 1);
    goto LABEL_16;
  }
  (*(void (**)(uint64_t))(v23 + 16))(v23);
  if (v15)
  {
LABEL_3:
    objc_msgSend(v21, "setUploaded:", 1);
    goto LABEL_16;
  }
  if (objc_msgSend(v21, "isUpdating"))
  {
    objc_msgSend(v21, "setUploading:", 1);
    objc_msgSend(v21, "setUpdating:", 0);
  }
  else if (objc_msgSend(v21, "isWaitingForUpdate"))
  {
    objc_msgSend(v21, "setWaitingForUpload:", 1);
    objc_msgSend(v21, "setWaitingForUpdate:", 0);
  }
LABEL_16:
  if ((objc_msgSend(v21, "isResetting") & 1) == 0 && (objc_msgSend(v21, "isUnknown") & 1) == 0)
  {
    objc_msgSend(v16, "sharingScopeIdentifier");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v15 && v25)
    {
      if (objc_msgSend(v15, "supportsSharingScopedIdentifier")
        && objc_msgSend(v15, "isSharedInScopeWithIdentifier:", v26))
      {
        objc_msgSend(v21, "setShared:", 1);
      }
      else if (objc_msgSend(v15, "supportsSharing"))
      {
        objc_msgSend(v16, "cloudCache");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scopedIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "targetForRecordWithCloudScopedIdentifier:", v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v31, "targetState") & 0xFFFFFFFFFFFFFFFELL) == 2)
          objc_msgSend(v21, "setShared:", 1);

      }
    }

  }
  objc_msgSend(v16, "quarantinedRecords", v31, v32, v33, v34, v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isRecordWithScopedIdentifierQuarantined:", v20);

  if (v30)
    objc_msgSend(v21, "setQuarantined:", 1);
  if (v15 && v10 && (objc_msgSend(v21, "isWaitingForUpdate") & 1) == 0)
    objc_msgSend(v21, "setConfirmed:", 1);

}

- (void)_fillStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  _BOOL8 v15;
  char v16;
  __int16 v17;

  v4 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "transactionClientCacheView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordViewWithScopedIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v16 = 0;
  objc_msgSend(v5, "idMapping");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v7, (char *)&v17 + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "cloudCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordWithScopedIdentifier:isConfirmed:isStaged:", v11, &v17, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (_BYTE)v17 != 0;
    v15 = v16 != 0;
  }
  else
  {
    v15 = 0;
    v14 = 0;
    v13 = 0;
  }
  -[CPLEngineStatusCenter _fillStatus:withClientCacheRecordView:cloudCacheRecord:isConfirmed:isStaged:isInIDMapping:](self, "_fillStatus:withClientCacheRecordView:cloudCacheRecord:isConfirmed:isStaged:isInIDMapping:", v4, v9, v13, v14, v15, v11 != 0);

}

- (id)_statusFromCachesWithRecordScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CPLRecordStatus *v16;
  unsigned __int8 v18;
  __int16 v19;

  v4 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transactionClientCacheView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordViewWithScopedIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v18 = 0;
  objc_msgSend(v5, "idMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v4, (char *)&v19 + 1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    v10 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v8, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v10, (char *)&v19 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v11 = 0;
      v12 = 0;
      goto LABEL_5;
    }
    if (!v10)
    {
      v11 = 0;
      v12 = 0;
      goto LABEL_6;
    }
  }
  v11 = v10;
  objc_msgSend(v5, "cloudCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordWithScopedIdentifier:isConfirmed:isStaged:", v11, &v19, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

LABEL_6:
  v14 = (void *)objc_msgSend(v7, "recordClass");
  if (!v14)
  {
    v14 = (void *)objc_opt_class();
    if (!v14)
      v14 = (void *)objc_opt_class();
  }
  v15 = (void *)objc_msgSend(v14, "newRecordWithScopedIdentifier:", v4);
  v16 = -[CPLRecordStatus initWithRecord:generation:]([CPLRecordStatus alloc], "initWithRecord:generation:", v15, 0);
  -[CPLEngineStatusCenter _fillStatus:withClientCacheRecordView:cloudCacheRecord:isConfirmed:isStaged:isInIDMapping:](self, "_fillStatus:withClientCacheRecordView:cloudCacheRecord:isConfirmed:isStaged:isInIDMapping:", v16, v7, v12, v19, v18, v9 != 0);

  return v16;
}

- (id)recordForStatusWithScopedIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[CPLEngineStatusCenter recordViewForStatusWithScopedIdentifier:](self, "recordViewForStatusWithScopedIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synthesizedRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)recordViewForStatusWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transactionClientCacheView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordViewWithScopedIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v5, "quarantinedRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "classForQuarantinedRecordWithScopedIdentifier:", v4);

    if (!v10)
      v10 = (void *)objc_opt_class();
    v11 = (void *)objc_msgSend(v10, "newRecordWithScopedIdentifier:", v4);
    objc_msgSend(v11, "asRecordView");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)status
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSMutableDictionary *transientStatuses;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_transientStatuses, "count"))
  {
    v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v23.receiver = self;
    v23.super_class = (Class)CPLEngineStatusCenter;
    -[CPLEngineStorage status](&v23, sel_status);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n%lu transient:"), v4, -[NSMutableDictionary count](self->_transientStatuses, "count"));

    v6 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    transientStatuses = self->_transientStatuses;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __31__CPLEngineStatusCenter_status__block_invoke;
    v21[3] = &unk_1E60DC6E8;
    v8 = v6;
    v22 = v8;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](transientStatuses, "enumerateKeysAndObjectsUsingBlock:", v21);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v5, "appendFormat:", CFSTR("\n\t%@: %lu"), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), objc_msgSend(v8, "countForObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14)));
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
      }
      while (v12);
    }

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CPLEngineStatusCenter;
    -[CPLEngineStorage status](&v16, sel_status);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)allStatusChanges
{
  id v3;
  uint64_t v4;
  NSMutableDictionary *transientStatuses;
  NSMutableDictionary *v6;
  unint64_t v7;
  uint64_t v8;
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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD v28[4];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NSMutableDictionary count](self->_transientStatuses, "count")
    || -[NSMutableSet count](self->_pendingDeletedTransientStatuses, "count"))
  {
    v4 = -[NSMutableSet count](self->_pendingDeletedTransientStatuses, "count");
    transientStatuses = self->_transientStatuses;
    if (v4)
    {
      v6 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](transientStatuses, "mutableCopy");
      -[NSMutableDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", self->_pendingTransientStatuses);
    }
    else
    {
      v6 = transientStatuses;
    }
    v7 = -[NSMutableDictionary count](self->_transientStatuses, "count");
    if (v7 >= 0x3E8)
      v8 = 1000;
    else
      v8 = v7;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __41__CPLEngineStatusCenter_allStatusChanges__block_invoke;
    v24[3] = &unk_1E60DC680;
    v24[4] = self;
    v25 = v3;
    v26 = v28;
    v27 = v8;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v6, "enumerateKeysAndObjectsUsingBlock:", v24);

    _Block_object_dispose(v28, 8);
  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statusChangesMaximumCount:", 10000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "record", (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "scopedIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = v18 == 0;

        if ((_DWORD)v16)
        {
          -[CPLEngineStatusCenter _fillStatus:](self, "_fillStatus:", v15);
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v17);
        }

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v12);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientStatuses, 0);
  objc_storeStrong((id *)&self->_pendingDeletedTransientStatuses, 0);
  objc_storeStrong((id *)&self->_pendingTransientStatuses, 0);
  objc_storeStrong((id *)&self->_persistedScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionStartDate, 0);
}

void __41__CPLEngineStatusCenter_allStatusChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(v9, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_fillStatus:", v8);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v7);
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 56))
      *a4 = 1;

  }
}

void __31__CPLEngineStatusCenter_status__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  objc_class *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();

  v6 = *(void **)(a1 + 32);
  NSStringFromClass(v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

void __115__CPLEngineStatusCenter__fillStatus_withClientCacheRecordView_cloudCacheRecord_isConfirmed_isStaged_isInIDMapping___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "storedExtractedBatch");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "batch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChangeWithScopedIdentifier:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "setUpdating:", 1);
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "hasSomeChangeWithScopedIdentifier:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 48), "setWaitingForUpdate:", 1);
  }

}

uint64_t __51__CPLEngineStatusCenter_writeTransactionDidSucceed__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __38__CPLEngineStatusCenter_statusChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(v9, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_fillStatus:", v8);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 56))
      *a4 = 1;

  }
}

@end
