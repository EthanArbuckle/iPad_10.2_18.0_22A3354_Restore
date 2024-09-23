@implementation NSKeyValueFastMutableArray

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  _QWORD *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueFastMutableArray;
  v5 = -[NSKeyValueMutableArray _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5)
    v5[3] = (id)objc_msgSend(a4, "mutatingMethods");
  return v5;
}

- (void)_proxyNonGCFinalize
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueFastMutableArray;
  -[NSKeyValueMutableArray _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_mutatingMethods = 0;
}

- (void)addObject:(id)a3
{
  -[NSKeyValueFastMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", a3, -[NSKeyValueFastMutableArray count](self, "count"));
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  void *v5;
  NSIndexSet *v6;
  NSIndexSet *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (self->_mutatingMethods->insertObjectAtIndex)
  {
    method_invoke();
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &v8, 1);
    v6 = [NSIndexSet alloc];
    v7 = -[NSIndexSet initWithIndex:](v6, "initWithIndex:", a4, v8, v9);
    method_invoke();

  }
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_mutatingMethods->insertObjectsAtIndexes)
  {
    method_invoke();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueFastMutableArray;
    -[NSKeyValueFastMutableArray insertObjects:atIndexes:](&v4, sel_insertObjects_atIndexes_, a3, a4);
  }
}

- (void)removeLastObject
{
  -[NSKeyValueFastMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", -[NSKeyValueFastMutableArray count](self, "count") - 1);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  NSIndexSet *v3;

  if (self->_mutatingMethods->removeObjectAtIndex)
  {
    method_invoke();
  }
  else
  {
    v3 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", a3);
    method_invoke();

  }
}

- (void)removeObjectsAtIndexes:(id)a3
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_mutatingMethods->removeObjectsAtIndexes)
  {
    method_invoke();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueFastMutableArray;
    -[NSKeyValueFastMutableArray removeObjectsAtIndexes:](&v3, sel_removeObjectsAtIndexes_, a3);
  }
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  NSKeyValueMutatingArrayMethodSet *mutatingMethods;
  NSIndexSet *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = a4;
  mutatingMethods = self->_mutatingMethods;
  if (mutatingMethods->replaceObjectAtIndex)
  {
    method_invoke();
  }
  else if (mutatingMethods->replaceObjectsAtIndexes)
  {
    v8 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", a3, v10[0]);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v10, 1);
    method_invoke();

  }
  else
  {
    -[NSKeyValueFastMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", a3, v10[0]);
    -[NSKeyValueFastMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", a4, a3);
  }
}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_mutatingMethods->replaceObjectsAtIndexes)
  {
    method_invoke();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueFastMutableArray;
    -[NSKeyValueFastMutableArray replaceObjectsAtIndexes:withObjects:](&v4, sel_replaceObjectsAtIndexes_withObjects_, a3, a4);
  }
}

@end
