@implementation NSSQLObjectIDSetFetchRequestContext

- (NSSQLObjectIDSetFetchRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5 idSets:(id)a6 columnName:(id)a7
{
  NSSQLObjectIDSetFetchRequestContext *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSSQLObjectIDSetFetchRequestContext;
  v9 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:](&v11, sel_initWithRequest_context_sqlCore_, a3, a4, a5);
  if (v9)
  {
    v9->_idSets = (NSArray *)a6;
    v9->_columnName = (NSString *)a7;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  self->_idSets = 0;
  self->_columnName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLObjectIDSetFetchRequestContext;
  -[NSSQLFetchRequestContext dealloc](&v3, sel_dealloc);
}

- (BOOL)executeRequestCore:(id *)a3
{
  id v5;
  const char *v6;

  v5 = _newObjectIDSetsForRequest(self, self->_idSets, (uint64_t)self->_columnName);
  -[NSSQLStoreRequestContext setResult:](self, "setResult:", v5);

  if (a3 && *a3)
    objc_setProperty_nonatomic(self, v6, *a3, 40);
  return !self->super.super._exception
      && !self->super.super._error
      && -[NSSQLStoreRequestContext result](self, "result") != 0;
}

@end
