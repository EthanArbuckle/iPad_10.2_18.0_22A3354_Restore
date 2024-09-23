@implementation _NSPersistentHistoryTransaction

- (void)dealloc
{
  objc_super v3;

  self->_changes = 0;
  self->_contextName = 0;

  self->_author = 0;
  self->_bundleID = 0;

  self->_processID = 0;
  self->_queryGeneration = 0;

  self->_storeID = 0;
  self->_backingObjectID = 0;

  self->_coordinator = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSPersistentHistoryTransaction;
  -[_NSPersistentHistoryTransaction dealloc](&v3, sel_dealloc);
}

- (_QWORD)_setChanges:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[3];
    if (v4 != a2)
    {

      result = a2;
      v3[3] = result;
    }
  }
  return result;
}

- (int64_t)transactionNumber
{
  return self->_rowIdentifier;
}

- (id)contextName
{
  return self->_contextName;
}

- (id)changes
{
  return self->_changes;
}

- (id)token
{
  _NSPersistentHistoryToken *v3;

  v3 = [_NSPersistentHistoryToken alloc];
  return -[_NSPersistentHistoryToken initWithTransactionNumber:andStoreID:](v3, "initWithTransactionNumber:andStoreID:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_rowIdentifier), self->_storeID);
}

- (id)author
{
  return self->_author;
}

- (_NSPersistentHistoryTransaction)initWithDictionary:(id)a3 andObjectID:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  _NSPersistentHistoryTransaction *v15;
  id *v16;
  id *v17;
  objc_super v19;

  v7 = objc_msgSend(a4, "_referenceData64");
  v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AUTHORTS"));
  if (!v8)
    v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AUTHOR"));
  v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BUNDLEIDTS"));
  if (!v9)
    v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("BUNDLEID"));
  v10 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("CONTEXTNAMETS"));
  if (!v10)
    v10 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("CONTEXTNAME"));
  v11 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("PROCESSIDTS"));
  if (!v11)
    v11 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("PROCESSID"));
  v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("QUERYGEN"));
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("TIMESTAMP")), "doubleValue");
  v14 = v13;
  v19.receiver = self;
  v19.super_class = (Class)_NSPersistentHistoryTransaction;
  v15 = -[_NSPersistentHistoryTransaction init](&v19, sel_init);
  if (v15)
  {
    v16 = (id *)objc_msgSend(a4, "persistentStore");
    v17 = v16;
    if (v16)
    {
      if ((objc_msgSend(v16[1], "_isDeallocating") & 1) != 0)
        v16 = 0;
      else
        v16 = (id *)v17[1];
    }
    v15->_coordinator = (NSPersistentStoreCoordinator *)v16;
    v15->_storeID = (NSString *)objc_msgSend((id)objc_msgSend(v17, "identifier"), "copy");
    v15->_rowIdentifier = v7;
    v15->_timestamp = v14;
    v15->_bundleID = (NSString *)v9;
    v15->_processID = (NSString *)v11;
    v15->_contextName = (NSString *)v10;
    v15->_author = (NSString *)v8;
    v15->_queryGeneration = (NSData *)v12;
    v15->_backingObjectID = (NSManagedObjectID *)a4;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSPersistentHistoryTransaction)initWithCoder:(id)a3
{
  _NSPersistentHistoryTransaction *v4;
  void *v5;
  double v6;
  NSArray *changes;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_NSPersistentHistoryTransaction;
  v4 = -[_NSPersistentHistoryTransaction init](&v17, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x18D76B4E4]();
    v4->_storeID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPersistentHistoryTransactionStoreID"));
    v4->_rowIdentifier = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPersistentHistoryTransactionRowID")), "longLongValue");
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPersistentHistoryTransactionTimestamp")), "doubleValue");
    v4->_timestamp = v6;
    v4->_changes = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[_PFRoutines historyChangesArrayClassesForSecureCoding](), CFSTR("NSPersistentHistoryTransactionChangeSet"));
    v4->_bundleID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPersistentHistoryTransactionBundleID"));
    v4->_processID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPersistentHistoryTransactionProcessID"));
    v4->_contextName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPersistentHistoryTransactionContextName"));
    v4->_author = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPersistentHistoryTransactionAuthor"));
    v4->_queryGeneration = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[_PFRoutines historyQueryGenDataClassesForSecureCoding](), CFSTR("NSPersistentHistoryTransactionQueryGen"));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    changes = v4->_changes;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](changes, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(changes);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "_setTransaction:", v4);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](changes, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }
    objc_autoreleasePoolPop(v5);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;

  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  objc_msgSend(a3, "encodeObject:forKey:", self->_storeID, CFSTR("NSPersistentHistoryTransactionStoreID"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_rowIdentifier), CFSTR("NSPersistentHistoryTransactionRowID"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp), CFSTR("NSPersistentHistoryTransactionTimestamp"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_changes, CFSTR("NSPersistentHistoryTransactionChangeSet"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_bundleID, CFSTR("NSPersistentHistoryTransactionBundleID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_processID, CFSTR("NSPersistentHistoryTransactionProcessID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_contextName, CFSTR("NSPersistentHistoryTransactionContextName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_author, CFSTR("NSPersistentHistoryTransactionAuthor"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_queryGeneration, CFSTR("NSPersistentHistoryTransactionQueryGen"));
  objc_autoreleasePoolPop(v5);
}

- (id)timestamp
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_timestamp);
}

- (id)initialQueryGenerationToken
{
  NSPersistentStore *v3;
  NSData *queryGeneration;
  _NSQueryGenerationToken *v5;

  if (!self->_queryGeneration)
    return 0;
  v3 = -[NSManagedObjectID persistentStore](self->_backingObjectID, "persistentStore");
  queryGeneration = self->_queryGeneration;
  if (-[NSData isNSData](queryGeneration, "isNSData"))
    queryGeneration = -[_PFSQLiteSnapshotWrapper initWithData:]([_PFSQLiteSnapshotWrapper alloc], queryGeneration);
  if (v3)
  {
    v5 = [_NSQueryGenerationToken alloc];
    if (v5)
      v5 = (_NSQueryGenerationToken *)-[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](v5, queryGeneration, v3, 0);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)postQueryGenerationToken
{
  NSPersistentStore *v3;
  NSPersistentHistoryChangeRequest *v4;
  id v5;

  if (self)
  {
    v3 = -[NSManagedObjectID persistentStore](self->_backingObjectID, "persistentStore");
    if (v3)
    {
      if ((BYTE1(v3[2].super.isa) & 0x40) != 0)
        return 0;
    }
  }
  v4 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterTransaction:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterTransaction:", self);
  -[NSPersistentHistoryChangeRequest setResultType:](v4, "setResultType:", 3);
  -[NSPersistentHistoryChangeRequest setFetchLimit:](v4, "setFetchLimit:", 1);
  v5 = -[NSPersistentStoreCoordinator executeRequest:withContext:error:](self->_coordinator, "executeRequest:withContext:error:", v4, 0, 0);
  if (!objc_msgSend((id)objc_msgSend(v5, "result"), "count"))
    return 0;
  else
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "result"), "objectAtIndexedSubscript:", 0), "initialQueryGenerationToken");
}

- (id)storeID
{
  return self->_storeID;
}

- (id)bundleID
{
  return self->_bundleID;
}

- (id)processID
{
  return self->_processID;
}

- (id)_backingObjectID
{
  return self->_backingObjectID;
}

- (id)objectIDNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *changes;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x18D76B4E4](self, a2);
  if (!self)
  {
    v17 = 0;
    goto LABEL_22;
  }
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  changes = self->_changes;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](changes, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v8)
    goto LABEL_15;
  v9 = v8;
  v10 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(changes);
      v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      v13 = objc_msgSend(v12, "changedObjectID");
      v14 = objc_msgSend(v12, "changeType");
      v15 = v4;
      if (!v14)
        goto LABEL_12;
      if (v14 == 2)
      {
        v15 = v6;
LABEL_12:
        objc_msgSend(v15, "addObject:", v13);
        continue;
      }
      v15 = v5;
      if (v14 == 1)
        goto LABEL_12;
    }
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](changes, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v9);
LABEL_15:
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v16, "setValue:forKey:", v4, CFSTR("inserted_objectIDs"));
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v16, "setValue:forKey:", v5, CFSTR("updated_objectIDs"));
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v16, "setValue:forKey:", v6, CFSTR("deleted_objectIDs"));
  v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v16);
LABEL_22:
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("NSManagedObjectContextDidSaveObjectIDsNotification"), 0, v17);
  objc_autoreleasePoolPop(v3);
  return v18;
}

@end
