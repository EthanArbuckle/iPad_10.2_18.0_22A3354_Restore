@implementation NSMemoryStoreEqualityPredicateOperator

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSMemoryStoreEqualityPredicateOperator;
  -[NSMemoryStoreEqualityPredicateOperator dealloc](&v3, sel_dealloc);
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  NSManagedObjectContext *context;
  id *v8;
  void *v9;
  NSManagedObjectContext *v10;
  id *v11;
  void *v12;
  objc_super v14;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a3 = (id)objc_msgSend(a3, "objectID");
    context = self->_context;
    if (context)
    {
      v8 = (id *)*((_QWORD *)context->_additionalPrivateIvars + 1);
      if (v8)
      {
        v9 = (void *)objc_msgSend(*v8, "objectForKey:", a3);
        if (v9)
          a3 = v9;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = (id)objc_msgSend(a4, "objectID");
    v10 = self->_context;
    if (v10)
    {
      v11 = (id *)*((_QWORD *)v10->_additionalPrivateIvars + 1);
      if (v11)
      {
        v12 = (void *)objc_msgSend(*v11, "objectForKey:", a3);
        if (v12)
          a3 = v12;
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)NSMemoryStoreEqualityPredicateOperator;
  return -[NSEqualityPredicateOperator performPrimitiveOperationUsingObject:andObject:](&v14, sel_performPrimitiveOperationUsingObject_andObject_, a3, a4);
}

- (void)setContext:(id)a3
{
  NSManagedObjectContext *context;

  context = self->_context;
  if (context != a3)
  {

    self->_context = (NSManagedObjectContext *)a3;
  }
}

@end
