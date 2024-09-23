@implementation NSKeyValueFastMutableSet1

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  _QWORD *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueFastMutableSet1;
  v5 = -[NSKeyValueFastMutableSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
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
  v3.super_class = (Class)NSKeyValueFastMutableSet1;
  -[NSKeyValueFastMutableSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_nonmutatingMethods = 0;
}

- (unint64_t)count
{
  unint64_t result;

  method_invoke();
  return result;
}

- (id)member:(id)a3
{
  id result;

  method_invoke();
  return result;
}

- (id)objectEnumerator
{
  id result;

  method_invoke();
  return result;
}

@end
