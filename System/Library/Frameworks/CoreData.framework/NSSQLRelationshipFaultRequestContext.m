@implementation NSSQLRelationshipFaultRequestContext

- (BOOL)executeRequestCore:(id *)a3
{
  id v5;
  const char *v6;

  v5 = _executeNewValuesForRelationshipFaultRequest((uint64_t)self);
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

- (void)dealloc
{
  objc_super v3;

  self->_relationship = 0;
  self->_objectID = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLRelationshipFaultRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

- (NSSQLRelationshipFaultRequestContext)initWithObjectID:(id)a3 relationship:(id)a4 context:(id)a5 sqlCore:(id)a6
{
  NSSQLRelationshipFaultRequestContext *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSSQLRelationshipFaultRequestContext;
  v8 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](&v10, sel_initWithRequest_context_sqlCore_, 0, a5, a6);
  if (v8)
  {
    v8->_relationship = (NSRelationshipDescription *)a4;
    v8->_objectID = (NSManagedObjectID *)a3;
  }
  return v8;
}

@end
