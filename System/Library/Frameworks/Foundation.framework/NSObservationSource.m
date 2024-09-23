@implementation NSObservationSource

- (void)_observerStorageOfSize:(unint64_t)a3
{
  if (a3 != 32)
    __assert_rtn("-[NSObservationSource _observerStorageOfSize:]", "NSObservationTransformers.m", 21, "sz == 4 * sizeof(id)");
  return self->_observers;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSObservationSource _destroyObserverList](self, "_destroyObserverList");
  v3.receiver = self;
  v3.super_class = (Class)NSObservationSource;
  -[NSObservationSource dealloc](&v3, sel_dealloc);
}

@end
