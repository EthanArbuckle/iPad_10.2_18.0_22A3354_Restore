@implementation _NSMemoryStorePredicateRemapper

- (void)visitPredicate:(id)a3
{
  void *v5;
  uint64_t v6;
  NSMemoryStoreEqualityPredicateOperator *v7;
  NSMemoryStoreEqualityPredicateOperator *v8;
  NSMemoryStoreEqualityPredicateOperator *v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(a3, "predicateOperator");
    v6 = objc_msgSend(a3, "predicateOperatorType");
    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v7 = -[NSEqualityPredicateOperator initWithOperatorType:modifier:negate:options:]([NSMemoryStoreEqualityPredicateOperator alloc], "initWithOperatorType:modifier:negate:options:", v6, objc_msgSend(v5, "modifier"), objc_msgSend(v5, "isNegation"), objc_msgSend(a3, "options"));
    }
    else
    {
      if (v6 != 10)
        return;
      v7 = -[NSPredicateOperator initWithOperatorType:modifier:options:]([NSMemoryStoreInPredicateOperator alloc], "initWithOperatorType:modifier:options:", 10, objc_msgSend(v5, "modifier"), objc_msgSend(v5, "options"));
    }
    v8 = v7;
    if (v7)
    {
      v9 = v7;
      if (self->_context)
      {
        -[NSMemoryStoreEqualityPredicateOperator setContext:](v7, "setContext:");
        v8 = v9;
      }
      objc_msgSend(a3, "setPredicateOperator:", v8);

    }
  }
}

- (id)createPredicateForFetchFromPredicate:(id)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  _NSMemoryStorePredicateRemapper *v8;
  _NSMemoryStorePredicateRemapper *v9;

  v6 = (void *)objc_msgSend(a3, "copy");
  v7 = v6;
  if (a4 && *(_QWORD *)(*((_QWORD *)a4 + 23) + 8))
  {
    v8 = [_NSMemoryStorePredicateRemapper alloc];
    if (v8)
    {
      v9 = -[_NSMemoryStorePredicateRemapper init](v8, "init");
      if (v9)
        v9->_context = (NSManagedObjectContext *)a4;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v7, "acceptVisitor:flags:", v9, 1);

  }
  else
  {
    objc_msgSend(v6, "acceptVisitor:flags:", self, 1);
  }
  return v7;
}

+ (id)defaultInstance
{
  id result;

  result = (id)defaultInstance_di;
  if (!defaultInstance_di)
  {
    result = objc_alloc_init(_NSMemoryStorePredicateRemapper);
    defaultInstance_di = (uint64_t)result;
  }
  return result;
}

- (_NSMemoryStorePredicateRemapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSMemoryStorePredicateRemapper;
  return -[_NSMemoryStorePredicateRemapper init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSMemoryStorePredicateRemapper;
  -[_NSMemoryStorePredicateRemapper dealloc](&v3, sel_dealloc);
}

- (id)createPredicateForFetchFromPredicate:(id)a3
{
  return -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:](self, "createPredicateForFetchFromPredicate:withContext:", a3, 0);
}

@end
