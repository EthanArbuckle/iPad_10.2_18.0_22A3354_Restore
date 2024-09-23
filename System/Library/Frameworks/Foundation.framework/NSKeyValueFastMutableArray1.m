@implementation NSKeyValueFastMutableArray1

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  _QWORD *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueFastMutableArray1;
  v5 = -[NSKeyValueFastMutableArray _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5)
    v5[4] = (id)objc_msgSend(a4, "nonmutatingMethods");
  return v5;
}

- (void)_proxyNonGCFinalize
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueFastMutableArray1;
  -[NSKeyValueFastMutableArray _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_nonmutatingMethods = 0;
}

- (unint64_t)count
{
  unint64_t result;

  method_invoke();
  return result;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_nonmutatingMethods->getObjectsRange)
  {
    method_invoke();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueFastMutableArray1;
    -[NSKeyValueFastMutableArray1 getObjects:range:](&v4, sel_getObjects_range_, a3, a4.location, a4.length);
  }
}

- (id)objectAtIndex:(unint64_t)a3
{
  id result;
  NSIndexSet *v4;
  void *v5;
  void *v6;

  if (self->_nonmutatingMethods->objectAtIndex)
  {
    method_invoke();
  }
  else
  {
    v4 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", a3);
    method_invoke();
    v6 = v5;

    return (id)objc_msgSend(v6, "objectAtIndex:", 0);
  }
  return result;
}

- (id)objectsAtIndexes:(id)a3
{
  id result;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_nonmutatingMethods->objectsAtIndexes)
  {
    method_invoke();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueFastMutableArray1;
    return -[NSKeyValueFastMutableArray1 objectsAtIndexes:](&v4, sel_objectsAtIndexes_, a3);
  }
  return result;
}

@end
