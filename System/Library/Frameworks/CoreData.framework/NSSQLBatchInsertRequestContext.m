@implementation NSSQLBatchInsertRequestContext

- (NSSQLBatchInsertRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSSQLBatchInsertRequestContext;
  return -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](&v6, sel_initWithRequest_context_sqlCore_, a3, a4, a5);
}

- (BOOL)isWritingRequest
{
  return 1;
}

- (BOOL)executeRequestCore:(id *)a3
{
  NSSQLBatchInsertRequestContext *v4;
  NSSQLCore *sqlCore;
  const char *v6;
  objc_super v8;

  v4 = self;
  if (self)
  {
    v8.receiver = self;
    v8.super_class = (Class)NSSQLBatchInsertRequestContext;
    self = -[NSSQLStoreRequestContext persistentStoreRequest](&v8, sel_persistentStoreRequest);
    sqlCore = v4->super.super._sqlCore;
  }
  else
  {
    sqlCore = 0;
  }
  -[NSBatchInsertRequest _resolveEntityWithSQLCore:]((uint64_t)self, sqlCore);
  -[NSSQLStoreRequestContext setResult:](v4, "setResult:", _executeBatchInsertRequest((uint64_t)v4));
  if (!a3 || !*a3)
  {
    if (v4)
      goto LABEL_8;
    return -[NSSQLStoreRequestContext result](v4, "result") != 0;
  }
  if (!v4)
    return -[NSSQLStoreRequestContext result](v4, "result") != 0;
  objc_setProperty_nonatomic(v4, v6, *a3, 40);
LABEL_8:
  if (!v4->super.super._exception && !v4->super.super._error)
    return -[NSSQLStoreRequestContext result](v4, "result") != 0;
  return 0;
}

@end
