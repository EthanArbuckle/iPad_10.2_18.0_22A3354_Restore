@implementation GCPhysicalInputElementCollection

+ (id)collection
{
  objc_opt_self();
  if (collection_onceToken != -1)
    dispatch_once(&collection_onceToken, &__block_literal_global);
  return (id)collection_EmptyCollection;
}

void __46__GCPhysicalInputElementCollection_collection__block_invoke()
{
  _GCPhysicalInputElementCollection0 *v0;
  void *v1;

  v0 = [_GCPhysicalInputElementCollection0 alloc];
  v1 = (void *)collection_EmptyCollection;
  collection_EmptyCollection = (uint64_t)v0;

}

- (GCPhysicalInputElementCollection)init
{
  -[GCPhysicalInputElementCollection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (NSUInteger)count
{
  objc_class *Class;
  const char *Name;
  id v6;

  Class = object_getClass(self);
  Name = class_getName(Class);
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("*** -[%s %s]: method sent to an instance (%p) of an abstract class.  Create a concrete instance!"), Name, sel_getName(a2), self);
  +[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)elementAtIndex:(unint64_t)a3
{
  objc_class *Class;
  const char *Name;
  id v7;

  Class = object_getClass(self);
  Name = class_getName(Class);
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("*** -[%s %s]: method sent to an instance (%p) of an abstract class.  Create a concrete instance!"), Name, sel_getName(a2), self);
  +[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)elementForAlias:(id)alias
{
  id v5;
  objc_class *Class;
  const char *Name;
  id v8;

  v5 = alias;
  Class = object_getClass(self);
  Name = class_getName(Class);
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("*** -[%s %s]: method sent to an instance (%p) of an abstract class.  Create a concrete instance!"), Name, sel_getName(a2), self);
  +[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v8);
}

- (NSEnumerator)elementEnumerator
{
  return (NSEnumerator *)-[_GCPhysicalInputElementEnumerator initWithCollection:]([_GCPhysicalInputElementEnumerator alloc], self);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  NSUInteger v9;
  unint64_t result;
  unint64_t v11;

  var0 = a3->var0;
  if (var0 == -1)
    return 0;
  if (var0)
  {
    v9 = a3->var3[0];
  }
  else
  {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
    v9 = -[GCPhysicalInputElementCollection count](self, "count", 0, a4, a5);
    a3->var3[0] = v9;
    var0 = a3->var0;
  }
  if (var0 >= v9)
  {
    result = 0;
    v11 = -1;
  }
  else
  {
    a3->var1 = a4;
    *a4 = -[GCPhysicalInputElementCollection elementAtIndex:](self, "elementAtIndex:");
    v11 = a3->var0 + 1;
    result = 1;
  }
  a3->var0 = v11;
  return result;
}

@end
