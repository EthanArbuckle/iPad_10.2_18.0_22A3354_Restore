@implementation NSKeyValueFastMutableSet

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  _QWORD *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueFastMutableSet;
  v5 = -[NSKeyValueMutableSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
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
  v3.super_class = (Class)NSKeyValueFastMutableSet;
  -[NSKeyValueMutableSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_mutatingMethods = 0;
}

- (void)addObject:(id)a3
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = a3;
  if (self->_mutatingMethods->addObject)
  {
    method_invoke();
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v4, 1);
    method_invoke();

  }
}

- (void)addObjectsFromArray:(id)a3
{
  id v3;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_mutatingMethods->unionSet)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", a3);
    method_invoke();

  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSKeyValueFastMutableSet;
    -[NSKeyValueFastMutableSet addObjectsFromArray:](&v4, sel_addObjectsFromArray_, a3);
  }
}

- (void)intersectSet:(id)a3
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_mutatingMethods->intersectSet)
  {
    method_invoke();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueFastMutableSet;
    -[NSKeyValueFastMutableSet intersectSet:](&v3, sel_intersectSet_, a3);
  }
}

- (void)minusSet:(id)a3
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_mutatingMethods->minusSet)
  {
    method_invoke();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueFastMutableSet;
    -[NSKeyValueFastMutableSet minusSet:](&v3, sel_minusSet_, a3);
  }
}

- (void)removeAllObjects
{
  id v2;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_mutatingMethods->setSet)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    method_invoke();

  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueFastMutableSet;
    -[NSKeyValueFastMutableSet removeAllObjects](&v3, sel_removeAllObjects);
  }
}

- (void)removeObject:(id)a3
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = a3;
  if (self->_mutatingMethods->removeObject)
  {
    method_invoke();
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v4, 1);
    method_invoke();

  }
}

- (void)setSet:(id)a3
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_mutatingMethods->setSet)
  {
    method_invoke();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueFastMutableSet;
    -[NSKeyValueFastMutableSet setSet:](&v3, sel_setSet_, a3);
  }
}

- (void)unionSet:(id)a3
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_mutatingMethods->unionSet)
  {
    method_invoke();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)NSKeyValueFastMutableSet;
    -[NSKeyValueFastMutableSet unionSet:](&v3, sel_unionSet_, a3);
  }
}

@end
