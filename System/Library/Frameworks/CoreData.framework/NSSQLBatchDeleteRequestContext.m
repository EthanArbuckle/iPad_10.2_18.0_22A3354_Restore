@implementation NSSQLBatchDeleteRequestContext

- (BOOL)isWritingRequest
{
  return 1;
}

- (BOOL)executeRequestCore:(id *)a3
{
  const char *v5;

  -[NSSQLStoreRequestContext setResult:](self, "setResult:", _executeBatchDeleteRequest((uint64_t)self, a3));
  if (a3 && *a3)
  {
    if (!self)
      return -[NSSQLStoreRequestContext result](self, "result") != 0;
    objc_setProperty_nonatomic(self, v5, *a3, 40);
  }
  else if (!self)
  {
    return -[NSSQLStoreRequestContext result](self, "result") != 0;
  }
  if (self->super.super._exception || self->super.super._error)
    return 0;
  return -[NSSQLStoreRequestContext result](self, "result") != 0;
}

- (void)executePrologue
{
  NSSQLFetchRequestContext *fetchContext;

  if (-[NSBatchDeleteRequest resultType](-[NSSQLBatchDeleteRequestContext request](self, "request"), "resultType") == NSBatchDeleteResultTypeObjectIDs)
  {
    if (self)
    {
      fetchContext = self->_fetchContext;
      if (!fetchContext)
      {
        fetchContext = -[NSSQLBatchDeleteRequestContext _createFetchRequestContextForObjectsToDelete]((NSSQLFetchRequestContext *)self);
        self->_fetchContext = fetchContext;
      }
    }
    else
    {
      fetchContext = 0;
    }
    -[NSSQLFetchRequestContext fetchStatement](fetchContext, "fetchStatement");
  }
  else
  {
    -[NSSQLBatchDeleteRequestContext _createDeleteStatements]((uint64_t)self);
  }
}

- (void)_createDeleteStatements
{
  SEL v2;
  id newValue;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 104))
    {
      newValue = 0;
      *(_QWORD *)(a1 + 104) = (id)-[NSSQLiteAdapter generateDeleteStatementsForRequest:error:](objc_msgSend(*(id *)(a1 + 8), "adapter"), a1, (uint64_t *)&newValue);
      objc_setProperty_nonatomic((id)a1, v2, newValue, 40);
    }
  }
}

- (NSBatchDeleteRequest)request
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLBatchDeleteRequestContext;
  return (NSBatchDeleteRequest *)-[NSSQLStoreRequestContext persistentStoreRequest](&v3, sel_persistentStoreRequest);
}

- (NSSQLFetchRequestContext)_createFetchRequestContextForObjectsToDelete
{
  if (result)
    return -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]([NSSQLFetchRequestContext alloc], "initWithRequest:context:sqlCore:", -[NSSQLBatchDeleteRequestContext fetchRequestForObjectsToDelete]((uint64_t)result), result->super._context, result->super._sqlCore);
  return result;
}

- (uint64_t)fetchRequestForObjectsToDelete
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 96);
    if (!result)
    {
      v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v1, "request"), "fetchRequest"), "copy");
      *(_QWORD *)(v1 + 96) = v2;
      objc_msgSend(v2, "_resolveEntityWithContext:", *(_QWORD *)(v1 + 32));
      objc_msgSend(*(id *)(v1 + 96), "setIncludesPropertyValues:", 0);
      objc_msgSend(*(id *)(v1 + 96), "setResultType:", 1);
      objc_msgSend(*(id *)(v1 + 96), "setPropertiesToFetch:", 0);
      objc_msgSend(*(id *)(v1 + 96), "setRelationshipKeyPathsForPrefetching:", 0);
      objc_msgSend(*(id *)(v1 + 96), "setShouldRefreshRefetchedObjects:", 0);
      objc_msgSend(*(id *)(v1 + 96), "setFetchBatchSize:", 0);
      objc_msgSend(*(id *)(v1 + 96), "setIncludesPendingChanges:", 0);
      return *(_QWORD *)(v1 + 96);
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_deleteStatements = 0;
  self->_fetchRequestForObjectsToDelete = 0;

  self->_deletedObjectIDs = 0;
  self->_fetchContext = 0;

  self->_externalDataReferenceTriggerStatements = 0;
  self->super._tempTableName = 0;

  self->_externalDataReferencesToDelete = 0;
  self->_fileBackedFuturesToDelete = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBatchDeleteRequestContext;
  -[NSSQLBatchOperationRequestContext dealloc](&v3, sel_dealloc);
}

@end
