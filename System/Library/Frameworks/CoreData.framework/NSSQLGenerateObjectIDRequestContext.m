@implementation NSSQLGenerateObjectIDRequestContext

- (BOOL)isWritingRequest
{
  return 1;
}

- (BOOL)executeRequestCore:(id *)a3
{
  const char *v5;

  -[NSSQLStoreRequestContext setResult:](self, "setResult:", _executeGenerateObjectIDRequest(self));
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
  if (self->super._exception || self->super._error)
    return 0;
  return -[NSSQLStoreRequestContext result](self, "result") != 0;
}

- (id)initForEntitiesAndCounts:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  NSSQLGenerateObjectIDRequestContext *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSSQLGenerateObjectIDRequestContext;
  v7 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](&v9, sel_initWithRequest_context_sqlCore_, 0, a4);
  if (v7)
  {
    v7->_entitiesAndCounts = (NSDictionary *)a3;
    v7->_model = (NSSQLModel *)(id)objc_msgSend(a5, "model");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_entitiesAndCounts = 0;
  self->_model = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLGenerateObjectIDRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

@end
