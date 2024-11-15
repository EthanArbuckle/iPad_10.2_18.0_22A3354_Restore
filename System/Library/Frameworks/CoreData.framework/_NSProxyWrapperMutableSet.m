@implementation _NSProxyWrapperMutableSet

- (void)dealloc
{
  objc_super v3;

  self->_mutationMethods = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSProxyWrapperMutableSet;
  -[_NSNotifyingWrapperMutableSet dealloc](&v3, sel_dealloc);
}

- (_QWORD)initWithContainer:(uint64_t)a3 key:(uint64_t)a4 mutableSet:(void *)a5 mutationMethods:
{
  _QWORD *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)_NSProxyWrapperMutableSet;
  v6 = objc_msgSendSuper2(&v8, sel_initWithContainer_key_mutableSet_, a2, a3, a4);
  if (v6)
    v6[4] = a5;
  return v6;
}

- (void)addObject:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (self->_mutationMethods->_addObjectMethod)
  {
    method_invoke();
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v4, 1);
    method_invoke();

  }
}

- (void)addObjectsFromArray:(id)a3
{
  void *v4;
  _NSFaultingMutableSetMutationMethods *mutationMethods;
  id v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", a3);
  mutationMethods = self->_mutationMethods;
  v6 = v4;
  if (mutationMethods->_addMethod)
    method_invoke();
  else
    _PFInvokeMutationMethodForEachMemberOfSet((uint64_t)self->super._container, (uint64_t)mutationMethods->_addObjectMethod, v4);

}

- (void)intersectSet:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t i;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (self->_mutationMethods->_intersectMethod)
  {
    method_invoke();
  }
  else
  {
    v5 = -[_NSNotifyingWrapperMutableSet count](self, "count");
    if (v5)
    {
      v6 = v5;
      if (v5 >= 0x201)
        v7 = 1;
      else
        v7 = v5;
      v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0;
      v9 = (char *)v12 - v8;
      if (v5 > 0x200)
        v9 = (char *)NSAllocateScannedUncollectable();
      else
        bzero((char *)v12 - v8, 8 * v5);
      -[_NSNotifyingWrapperMutableSet getObjects:](self, "getObjects:", v9);
      for (i = 0; i != v6; ++i)
      {
        v11 = *(_QWORD *)&v9[8 * i];
        if ((objc_msgSend(a3, "containsObject:", v11) & 1) == 0)
          -[_NSProxyWrapperMutableSet removeObject:](self, "removeObject:", v11);
      }
      if (v6 >= 0x201)
        NSZoneFree(0, v9);
    }
  }
}

- (void)minusSet:(id)a3
{
  _NSFaultingMutableSetMutationMethods *mutationMethods;
  NSManagedObject *container;

  mutationMethods = self->_mutationMethods;
  container = self->super._container;
  if (mutationMethods->_removeMethod)
    method_invoke();
  else
    _PFInvokeMutationMethodForEachMemberOfSet((uint64_t)container, (uint64_t)mutationMethods->_removeObjectMethod, a3);
}

- (void)removeAllObjects
{
  if (self->_mutationMethods->_setMethod)
    method_invoke();
  else
    -[_NSProxyWrapperMutableSet minusSet:](self, "minusSet:", self->super._mutableSet);
}

- (void)removeObject:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (self->_mutationMethods->_removeObjectMethod)
  {
    method_invoke();
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v4, 1);
    method_invoke();

  }
}

- (void)setSet:(id)a3
{
  id v4;

  if (self->_mutationMethods->_setMethod)
  {
    method_invoke();
  }
  else
  {
    v4 = a3;
    -[_NSProxyWrapperMutableSet minusSet:](self, "minusSet:", self->super._mutableSet);
    -[_NSProxyWrapperMutableSet unionSet:](self, "unionSet:", a3);

  }
}

- (void)unionSet:(id)a3
{
  _NSFaultingMutableSetMutationMethods *mutationMethods;
  NSManagedObject *container;

  mutationMethods = self->_mutationMethods;
  container = self->super._container;
  if (mutationMethods->_addMethod)
    method_invoke();
  else
    _PFInvokeMutationMethodForEachMemberOfSet((uint64_t)container, (uint64_t)mutationMethods->_addObjectMethod, a3);
}

@end
