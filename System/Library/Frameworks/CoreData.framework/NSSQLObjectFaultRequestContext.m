@implementation NSSQLObjectFaultRequestContext

- (NSSQLObjectFaultRequestContext)initWithObjectID:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  NSSQLObjectFaultRequestContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSSQLObjectFaultRequestContext;
  v6 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](&v8, sel_initWithRequest_context_sqlCore_, 0, a4, a5);
  if (v6)
  {
    v6->_objectID = (NSManagedObjectID *)a3;
    v6->_forConflictAnalysis = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_objectID = 0;
  self->_fetchRequest = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLObjectFaultRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

- (NSSQLFetchRequestContext)createFetchRequestContext
{
  NSSQLFetchRequestContext *v1;
  NSString *externalDataLinksDirectory;
  NSFetchRequest *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  if (a1)
  {
    externalDataLinksDirectory = a1->_externalDataLinksDirectory;
    if (!externalDataLinksDirectory)
    {
      v3 = objc_alloc_init(NSFetchRequest);
      v1->_externalDataLinksDirectory = (NSString *)v3;
      -[NSFetchRequest setEntity:](v3, "setEntity:", -[NSString entity](v1->_externalDataReferencesDirectory, "entity"));
      v4 = -[NSString _referenceData64](v1->_externalDataReferencesDirectory, "_referenceData64");
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", v4);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3540]), "initWithObject:", v5);

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F0]), "initWithObject:", CFSTR("_pk"));
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36E8]), "initWithKeyPath:", v7);

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v8, v6, 0, 4, 0);
      -[NSString setPredicate:](v1->_externalDataLinksDirectory, "setPredicate:", v9);
      -[NSString setIncludesSubentities:](v1->_externalDataLinksDirectory, "setIncludesSubentities:", 0);

      externalDataLinksDirectory = v1->_externalDataLinksDirectory;
    }
    v1 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]([NSSQLFetchRequestContext alloc], "initWithRequest:context:sqlCore:", externalDataLinksDirectory, v1->super._context, v1->super._sqlCore);
    -[NSSQLFetchRequestContext setIsFaultRequest:](v1, "setIsFaultRequest:", 1);
  }
  return v1;
}

- (BOOL)executeRequestCore:(id *)a3
{
  id v5;
  const char *v6;

  v5 = _executeNewRowValuesForObjectFaultRequest(self);
  -[NSSQLStoreRequestContext setResult:](self, "setResult:", v5);

  if (a3 && *a3)
  {
    if (self)
    {
      objc_setProperty_nonatomic(self, v6, *a3, 40);
      return !self->super._exception && self->super._error == 0;
    }
    return 1;
  }
  if (!self)
    return 1;
  return !self->super._exception && self->super._error == 0;
}

@end
