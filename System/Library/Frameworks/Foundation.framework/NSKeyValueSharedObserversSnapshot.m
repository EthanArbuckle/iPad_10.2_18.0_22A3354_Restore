@implementation NSKeyValueSharedObserversSnapshot

- (id)_initWithObservationInfo:(id)a3 andNotifyingISA:(Class)a4 forObjectOfClass:(Class)a5
{
  NSKeyValueSharedObserversSnapshot *v8;
  NSKeyValueSharedObserversSnapshot *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSKeyValueSharedObserversSnapshot;
  v8 = -[NSKeyValueSharedObserversSnapshot init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_observableClass = a5;
    v8->_cachedObservationInfo = (NSKeyValueObservationInfo *)objc_msgSend(a3, "copy");
    v9->_autonotifyingClass = a4;
  }
  return v9;
}

- (void)_assignToObject:(id)a3
{
  objc_class *autonotifyingClass;
  NSString *v6;

  if (object_getClass(a3) != self->_observableClass)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Attempted to set shared observers from snapshot %@, which is outdated"), a3, self);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v6, 0));
  }
  -[NSObject _setSharedObservationInfo:]((uint64_t)a3, self->_cachedObservationInfo);
  autonotifyingClass = self->_autonotifyingClass;
  if (autonotifyingClass)
    object_setClass(a3, autonotifyingClass);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueSharedObserversSnapshot;
  -[NSKeyValueSharedObserversSnapshot dealloc](&v3, sel_dealloc);
}

@end
