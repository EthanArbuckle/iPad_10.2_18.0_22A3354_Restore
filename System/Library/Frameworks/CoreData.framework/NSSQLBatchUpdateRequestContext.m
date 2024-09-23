@implementation NSSQLBatchUpdateRequestContext

- (NSSQLBatchUpdateRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  NSSQLBatchUpdateRequestContext *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSSQLBatchUpdateRequestContext;
  v7 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](&v9, sel_initWithRequest_context_sqlCore_, a3, a4, a5);
  if (v7)
    objc_msgSend(a3, "_resolveEntityWithContext:", a4);
  return v7;
}

- (BOOL)isWritingRequest
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  self->_updateStatement = 0;
  self->_fetchRequest = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBatchUpdateRequestContext;
  -[NSSQLBatchOperationRequestContext dealloc](&v3, sel_dealloc);
}

- (void)executePrologue
{
  NSSQLGenerator *v3;
  NSBatchUpdateRequest *v4;
  NSSQLiteStatement *v5;

  if (self)
  {
    v3 = -[NSSQLGenerator initWithPersistentStore:]([NSSQLGenerator alloc], "initWithPersistentStore:", self->super.super._sqlCore);
    v4 = -[NSSQLBatchUpdateRequestContext request](self, "request");
    if (v3)
      v5 = -[NSSQLGenerator newSQLStatementForRequest:ignoreInheritance:countOnly:nestingLevel:nestIsWhereScoped:requestContext:]((uint64_t)v3, v4, 0, 0, 0, 0, 0);
    else
      v5 = 0;
    self->_updateStatement = v5;
  }
}

- (BOOL)executeRequestCore:(id *)a3
{
  const char *v5;

  -[NSSQLStoreRequestContext setResult:](self, "setResult:", _executeBatchUpdateRequest(self, (uint64_t *)a3));
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

- (NSBatchUpdateRequest)request
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLBatchUpdateRequestContext;
  return (NSBatchUpdateRequest *)-[NSSQLStoreRequestContext persistentStoreRequest](&v3, sel_persistentStoreRequest);
}

- (id)createFetchRequestContextForObjectsToUpdate
{
  NSFetchRequest *fetchRequest;
  NSFetchRequest *v4;
  NSSQLFetchRequestContext *v5;
  NSManagedObjectContext *context;
  NSSQLCore *sqlCore;

  if (self)
  {
    fetchRequest = self->_fetchRequest;
    if (!fetchRequest)
    {
      v4 = objc_alloc_init(NSFetchRequest);
      self->_fetchRequest = v4;
      -[NSFetchRequest setEntity:](v4, "setEntity:", -[NSBatchUpdateRequest entity](-[NSSQLBatchUpdateRequestContext request](self, "request"), "entity"));
      -[NSFetchRequest setIncludesSubentities:](self->_fetchRequest, "setIncludesSubentities:", -[NSBatchUpdateRequest includesSubentities](-[NSSQLBatchUpdateRequestContext request](self, "request"), "includesSubentities"));
      -[NSFetchRequest setPredicate:](self->_fetchRequest, "setPredicate:", -[NSBatchUpdateRequest predicate](-[NSSQLBatchUpdateRequestContext request](self, "request"), "predicate"));
      -[NSFetchRequest setIncludesPropertyValues:](self->_fetchRequest, "setIncludesPropertyValues:", 0);
      -[NSFetchRequest setIncludesPendingChanges:](self->_fetchRequest, "setIncludesPendingChanges:", 0);
      -[NSFetchRequest setResultType:](self->_fetchRequest, "setResultType:", 1);
      fetchRequest = self->_fetchRequest;
    }
    v5 = [NSSQLFetchRequestContext alloc];
    context = self->super.super._context;
    sqlCore = self->super.super._sqlCore;
  }
  else
  {
    v5 = [NSSQLFetchRequestContext alloc];
    context = 0;
    fetchRequest = 0;
    sqlCore = 0;
  }
  return -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:](v5, "initWithRequest:context:sqlCore:", fetchRequest, context, sqlCore);
}

@end
