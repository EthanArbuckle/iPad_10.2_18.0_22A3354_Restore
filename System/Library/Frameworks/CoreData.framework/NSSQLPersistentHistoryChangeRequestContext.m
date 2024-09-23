@implementation NSSQLPersistentHistoryChangeRequestContext

- (void)dealloc
{
  objc_super v3;

  self->_fetchRequest = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLPersistentHistoryChangeRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

- (id)createDeleteTransactionsRequestContext
{
  NSBatchDeleteRequest *v3;
  NSSQLBatchDeleteRequestContext *v4;
  NSManagedObjectContext *context;
  NSSQLCore *sqlCore;
  NSSQLBatchDeleteRequestContext *v7;

  v3 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", -[NSSQLPersistentHistoryChangeRequestContext fetchRequestDescribingChanges]((id *)&self->super.super.isa));
  -[NSBatchDeleteRequest setResultType:](v3, "setResultType:", 2* (-[NSPersistentHistoryChangeRequest resultType](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "resultType") != NSPersistentHistoryResultTypeStatusOnly));
  v4 = [NSSQLBatchDeleteRequestContext alloc];
  if (self)
  {
    context = self->super._context;
    sqlCore = self->super._sqlCore;
  }
  else
  {
    context = 0;
    sqlCore = 0;
  }
  v7 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](v4, "initWithRequest:context:sqlCore:", v3, context, sqlCore);

  return v7;
}

- (id)createRequestContextForChangesWithTransactionIDs:(id)a3
{
  NSPersistentHistoryChangeRequest *v4;
  NSSQLPersistentHistoryChangeRequestContext *v5;
  NSManagedObjectContext *context;
  NSSQLCore *sqlCore;
  NSSQLPersistentHistoryChangeRequestContext *v8;

  v4 = -[NSPersistentHistoryChangeRequest initWithTransactionIDs:]([NSPersistentHistoryChangeRequest alloc], "initWithTransactionIDs:", a3);
  v5 = [NSSQLPersistentHistoryChangeRequestContext alloc];
  if (self)
  {
    context = self->super._context;
    sqlCore = self->super._sqlCore;
  }
  else
  {
    context = 0;
    sqlCore = 0;
  }
  v8 = -[NSSQLPersistentHistoryChangeRequestContext initWithRequest:context:sqlCore:](v5, "initWithRequest:context:sqlCore:", v4, context, sqlCore);

  -[NSSQLPersistentHistoryChangeRequestContext executePrologue](v8, "executePrologue");
  return v8;
}

- (NSSQLPersistentHistoryChangeRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  NSSQLPersistentHistoryChangeRequestContext *v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSSQLPersistentHistoryChangeRequestContext;
  v6 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](&v9, sel_initWithRequest_context_sqlCore_, a3, a4, a5);
  if (v6)
  {
    if (objc_msgSend(a3, "fetchBatchSize"))
      v7 = objc_msgSend(a3, "resultType") > 2;
    else
      v7 = 0;
    v6->_shouldUseBatches = v7;
  }
  return v6;
}

- (void)executePrologue
{
  id v3;
  NSSQLCore *sqlCore;
  void *v5;
  uint64_t v6;

  if (-[NSPersistentHistoryChangeRequest fetchRequest](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "fetchRequest"))
  {
    v3 = -[NSPersistentHistoryChangeRequest entityNameToFetch](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "entityNameToFetch");
    if (self)
      sqlCore = self->super._sqlCore;
    else
      sqlCore = 0;
    if (!objc_msgSend((id)objc_msgSend(-[NSSQLCore ancillarySQLModels](sqlCore, "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", v3))
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid entity for NSPersistentHistoryChangeRequest: %@"), v3);
      objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v6, 0));
    }
  }
}

- (id)fetchRequestDescribingChanges
{
  id *v1;
  uint64_t v2;
  void *v3;
  NSFetchRequest *v4;
  id v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (!result[11])
    {
      v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result[1], "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", objc_msgSend((id)objc_msgSend(result, "request"), "entityNameToFetch"));
      if (v2)
      {
        v3 = (void *)v2;
        v4 = objc_alloc_init(NSFetchRequest);
        v1[11] = v4;
        -[NSFetchRequest setEntity:](v4, "setEntity:", objc_msgSend(v3, "entityDescription"));
        objc_msgSend(v1[11], "setIncludesSubentities:", 0);
        objc_msgSend(v1[11], "setPredicate:", objc_msgSend((id)objc_msgSend(v1, "request"), "predicateForStoreIdentifier:", objc_msgSend(v1[1], "identifier")));
        objc_msgSend(v1[11], "setIncludesPropertyValues:", 1);
        objc_msgSend(v1[11], "setIncludesPendingChanges:", 0);
        if (objc_msgSend((id)objc_msgSend(v1, "request"), "fetchLimit"))
        {
          objc_msgSend(v1[11], "setFetchLimit:", objc_msgSend((id)objc_msgSend(v1, "request"), "fetchLimit"));
          if (objc_msgSend((id)objc_msgSend(v1, "request"), "fetchOffset"))
            objc_msgSend(v1[11], "setFetchOffset:", objc_msgSend((id)objc_msgSend(v1, "request"), "fetchOffset"));
        }
        if (objc_msgSend((id)objc_msgSend(v1, "request"), "fetchRequest")
          && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "request"), "fetchRequest"), "sortDescriptors"), "count"))
        {
          objc_msgSend(v1[11], "setSortDescriptors:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "request"), "fetchRequest"), "sortDescriptors"));
        }
        if (objc_msgSend((id)objc_msgSend(v1, "request"), "fetchBatchSize"))
        {
          objc_msgSend(v1[11], "setFetchBatchSize:", objc_msgSend((id)objc_msgSend(v1, "request"), "fetchBatchSize"));
          if (!objc_msgSend((id)objc_msgSend(v1[11], "sortDescriptors"), "count"))
          {
            v5 = v1[11];
            v6[0] = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
            objc_msgSend(v5, "setSortDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
          }
        }
      }
    }
    return (id *)v1[11];
  }
  return result;
}

- (BOOL)isWritingRequest
{
  return -[NSPersistentHistoryChangeRequest isDelete](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "isDelete")|| -[NSPersistentHistoryChangeRequest isPercentageDelete](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "isPercentageDelete");
}

- (id)fetchRequestContextForChanges
{
  id *v3;
  unint64_t v4;
  NSFetchRequest *fetchRequest;
  BOOL v6;
  id v7;
  NSSQLFetchRequestContext *v8;
  NSSQLFetchRequestContext *v9;
  void *v11;
  NSManagedObjectContext *context;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSSQLPersistentHistoryChangeRequestContext fetchRequestDescribingChanges]((id *)&self->super.super.isa);
  v4 = -[NSPersistentHistoryChangeRequest fetchBatchSize](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "fetchBatchSize");
  fetchRequest = self->_fetchRequest;
  if (v4)
  {
    -[NSFetchRequest setResultType:](fetchRequest, "setResultType:", 0);
  }
  else
  {
    -[NSFetchRequest setResultType:](fetchRequest, "setResultType:", 2);
    -[NSFetchRequest setAllocationType:](self->_fetchRequest, "setAllocationType:", 1);
  }
  if (-[NSPersistentHistoryChangeRequest resultType](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "resultType") == NSPersistentHistoryResultTypeTransactionsAndChanges)
  {
    v13[0] = CFSTR("CHANGES");
    objc_msgSend(v3, "setRelationshipKeyPathsForPrefetching:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1));
  }
  v6 = -[NSPersistentHistoryChangeRequest resultType](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "resultType") == NSPersistentHistoryResultTypeStatusOnly|| -[NSPersistentHistoryChangeRequest resultType](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "resultType") == NSPersistentHistoryResultTypeCount|| -[NSPersistentHistoryChangeRequest resultType](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "resultType") == (NSPersistentHistoryResultTypeChangesOnly|NSPersistentHistoryResultTypeCount);
  if (-[NSPersistentHistoryChangeRequest propertiesToFetch](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "propertiesToFetch"))
  {
    v7 = -[NSPersistentHistoryChangeRequest propertiesToFetch](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "propertiesToFetch");
LABEL_12:
    objc_msgSend(v3, "setPropertiesToFetch:", v7);
    goto LABEL_13;
  }
  if (!v6)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[NSPersistentHistoryChangeRequest propertiesToFetchForEntity:includeTransactionStrings:](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "propertiesToFetchForEntity:includeTransactionStrings:", objc_msgSend(v3, "entity"), -[NSSQLiteConnection _hasHistoryTransactionStringTable]((uint64_t)self->super._connection)));
    v7 = v11;
    context = self->super._context;
    if (context && (*((_BYTE *)&context->_flags + 3) & 8) != 0)
      objc_msgSend(v11, "removeObject:", CFSTR("QUERYGEN"));
    goto LABEL_12;
  }
LABEL_13:
  if (-[NSArray count](-[NSPersistentStoreRequest affectedStores](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "affectedStores"), "count"))
  {
    objc_msgSend(v3, "setAffectedStores:", -[NSPersistentStoreRequest affectedStores](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "affectedStores"));
  }
  v8 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]([NSSQLFetchRequestContext alloc], "initWithRequest:context:sqlCore:", v3, self->super._context, self->super._sqlCore);
  v9 = v8;
  if (v8)
    v8 = (NSSQLFetchRequestContext *)v8->super._context;
  -[NSSQLFetchRequestContext _setAllowAncillaryEntities:](v8, "_setAllowAncillaryEntities:", 1);
  return v9;
}

- (NSPersistentHistoryChangeRequest)request
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLPersistentHistoryChangeRequestContext;
  return (NSPersistentHistoryChangeRequest *)-[NSSQLStoreRequestContext persistentStoreRequest](&v3, sel_persistentStoreRequest);
}

- (BOOL)executeRequestUsingConnection:(id)a3
{
  void *v5;
  const char *v6;
  void *v7;
  NSPersistentHistoryChangeRequest *v8;
  NSSQLCore *sqlCore;
  BOOL v10;
  id newValue;

  newValue = 0;
  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, a3);
  -[NSSQLiteConnection connect]((uint64_t)a3);
  v7 = _executeChangeRequest(self, (uint64_t *)&newValue);
  if (v7)
  {
    v8 = -[NSSQLPersistentHistoryChangeRequestContext request](self, "request");
    if (self)
      sqlCore = self->super._sqlCore;
    else
      sqlCore = 0;
    -[NSSQLStoreRequestContext setResult:](self, "setResult:", +[NSPersistentHistoryResult _processResult:forRequest:withProvider:](NSPersistentHistoryResult, "_processResult:forRequest:withProvider:", v7, v8, sqlCore));
  }
  v10 = newValue == 0;
  if (self && newValue)
    objc_setProperty_nonatomic(self, v6, newValue, 40);
  objc_autoreleasePoolPop(v5);
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, 0);
  return v10;
}

- (BOOL)shouldUseBatches
{
  return self->_shouldUseBatches;
}

- (id)createCountRequestContextForChanges
{
  id *v3;
  NSSQLCountRequestContext *v4;
  NSManagedObjectContext *context;
  NSSQLCore *sqlCore;

  v3 = -[NSSQLPersistentHistoryChangeRequestContext fetchRequestDescribingChanges]((id *)&self->super.super.isa);
  objc_msgSend(v3, "setResultType:", 4);
  v4 = [NSSQLCountRequestContext alloc];
  if (self)
  {
    context = self->super._context;
    sqlCore = self->super._sqlCore;
  }
  else
  {
    context = 0;
    sqlCore = 0;
  }
  return -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:](v4, "initWithRequest:context:sqlCore:", v3, context, sqlCore);
}

@end
