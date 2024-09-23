@implementation NSBatchDeleteRequest

- (void)dealloc
{
  objc_super v3;

  self->_deleteTarget = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBatchDeleteRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (NSBatchDeleteRequest)initWithFetchRequest:(NSFetchRequest *)fetch
{
  NSBatchDeleteRequest *v5;
  NSFetchRequest *v6;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  objc_super v11;

  if (!fetch || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Must supply a fetch request during initialization");
    goto LABEL_9;
  }
  if (!-[NSFetchRequest entityName](fetch, "entityName"))
  {

    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Fetch must have an entity");
LABEL_9:
    objc_exception_throw((id)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0));
  }
  v11.receiver = self;
  v11.super_class = (Class)NSBatchDeleteRequest;
  v5 = -[NSBatchDeleteRequest init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSFetchRequest *)-[NSFetchRequest copy](fetch, "copy");
    v5->_deleteTarget = v6;
    -[NSFetchRequest setIncludesPropertyValues:](v6, "setIncludesPropertyValues:", 0);
    -[NSFetchRequest setResultType:](v5->_deleteTarget, "setResultType:", 1);
    -[NSFetchRequest setPropertiesToFetch:](v5->_deleteTarget, "setPropertiesToFetch:", 0);
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v5->_deleteTarget, "setRelationshipKeyPathsForPrefetching:", 0);
    -[NSFetchRequest setShouldRefreshRefetchedObjects:](v5->_deleteTarget, "setShouldRefreshRefetchedObjects:", 0);
    -[NSFetchRequest setFetchBatchSize:](v5->_deleteTarget, "setFetchBatchSize:", 0);
    -[NSFetchRequest setIncludesPendingChanges:](v5->_deleteTarget, "setIncludesPendingChanges:", 0);
    -[NSFetchRequest _incrementInUseCounter](v5->_deleteTarget, "_incrementInUseCounter");
  }
  return v5;
}

- (void)setResultType:(NSBatchDeleteRequestResultType)resultType
{
  self->_resultType = resultType;
}

- (unint64_t)requestType
{
  return 7;
}

- (void)_resolveEntityWithContext:(id)a3
{
  -[NSFetchRequest _resolveEntityWithContext:](self->_deleteTarget, "_resolveEntityWithContext:", a3);
}

- (NSBatchDeleteRequestResultType)resultType
{
  return self->_resultType;
}

- (NSFetchRequest)fetchRequest
{
  return self->_deleteTarget;
}

- (BOOL)_secureOperation
{
  return self->_flags != 0;
}

- (id)encodeForXPC
{
  id v2;
  void *v3;
  id v4;

  v2 = -[NSBatchDeleteRequestEncodingToken initForRequest:]([NSBatchDeleteRequestEncodingToken alloc], "initForRequest:", self);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "setDelegate:", objc_opt_class());
  objc_msgSend(v3, "encodeObject:forKey:", v2, CFSTR("root"));
  objc_msgSend(v3, "finishEncoding");
  v4 = (id)objc_msgSend(v3, "encodedData");

  return v4;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5
{
  void *v7;
  void *v8;
  NSBatchDeleteRequest *v9;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a3, 0);
  objc_msgSend(v7, "setDelegate:", a4);
  v8 = (void *)objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("root"));

  v9 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", +[NSFetchRequest decodeFromXPCArchive:withContext:andPolicy:](NSFetchRequest, "decodeFromXPCArchive:withContext:andPolicy:", objc_msgSend(v8, "fetchData"), a4, a5));
  -[NSBatchDeleteRequest setResultType:](v9, "setResultType:", objc_msgSend(v8, "resultType"));
  -[NSBatchDeleteRequest _setSecureOperation:](v9, "_setSecureOperation:", objc_msgSend(v8, "secure"));
  return v9;
}

- (NSBatchDeleteRequest)initWithObjectIDs:(NSArray *)objects
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSFetchRequest *v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  NSArray *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](objects, "count"))
  {

    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("Must supply a non-zero number of objectIDs to request during initialization");
    v15 = 0;
LABEL_17:
    objc_exception_throw((id)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v16, v15));
  }
  v5 = objc_msgSend(-[NSArray lastObject](objects, "lastObject"), "entity");
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 120) & 4) != 0)
    {
      v6 = *(_QWORD *)(v5 + 72);
    }
    else
    {
      do
      {
        v6 = v5;
        v5 = objc_msgSend((id)v5, "superentity");
      }
      while (v5);
    }
  }
  else
  {
    v6 = 0;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](objects, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(objects);
        if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "entity"), "isKindOfEntity:", v6) & 1) == 0)
        {

          v13 = (void *)MEMORY[0x1E0C99DA0];
          v14 = *MEMORY[0x1E0C99778];
          v23 = CFSTR("objectIDs");
          v24 = objects;
          v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
          v16 = CFSTR("mismatched objectIDs in batch delete initializer");
          v17 = v13;
          v18 = v14;
          goto LABEL_17;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](objects, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v8);
  }
  v11 = objc_alloc_init(NSFetchRequest);
  -[NSFetchRequest setEntity:](v11, "setEntity:", v6);
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), objects));
  -[NSFetchRequest setIncludesPendingChanges:](v11, "setIncludesPendingChanges:", 0);
  -[NSFetchRequest setResultType:](v11, "setResultType:", 1);
  -[NSFetchRequest _incrementInUseCounter](v11, "_incrementInUseCounter");
  return -[NSBatchDeleteRequest initWithFetchRequest:](self, "initWithFetchRequest:", v11);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSBatchDeleteRequest : resultType : %ld, fetch :%@ >"), self->_resultType, self->_deleteTarget);
}

- (void)_setSecureOperation:(BOOL)a3
{
  self->_flags = a3;
}

@end
