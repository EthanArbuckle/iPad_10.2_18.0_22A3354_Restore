@implementation NSKeyValueFastMutableOrderedSet2

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  _QWORD *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueFastMutableOrderedSet2;
  v5 = -[NSKeyValueFastMutableOrderedSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5)
    v5[4] = (id)objc_msgSend(a4, "baseGetter");
  return v5;
}

- (void)_proxyNonGCFinalize
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueFastMutableOrderedSet2;
  -[NSKeyValueFastMutableOrderedSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_valueGetter = 0;
}

- (id)_nonNilOrderedSetValueWithSelector:(SEL)a3
{
  id result;
  void *v6;

  result = (id)_NSGetUsingKeyValueGetter((uint64_t)self->super.super._container, (uint64_t)self->_valueGetter);
  if (!result)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: value for key %@ of object %p is nil"), _NSMethodExceptionProem((objc_class *)self, a3), self->super.super._key, self->super.super._container), 0);
    objc_exception_throw(v6);
  }
  return result;
}

- (unint64_t)count
{
  return objc_msgSend(-[NSKeyValueFastMutableOrderedSet2 _nonNilOrderedSetValueWithSelector:](self, "_nonNilOrderedSetValueWithSelector:", a2), "count");
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  objc_msgSend(-[NSKeyValueFastMutableOrderedSet2 _nonNilOrderedSetValueWithSelector:](self, "_nonNilOrderedSetValueWithSelector:", a2), "getObjects:range:", a3, a4.location, a4.length);
}

- (unint64_t)indexOfObject:(id)a3
{
  return objc_msgSend(-[NSKeyValueFastMutableOrderedSet2 _nonNilOrderedSetValueWithSelector:](self, "_nonNilOrderedSetValueWithSelector:", a2), "indexOfObject:", a3);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(-[NSKeyValueFastMutableOrderedSet2 _nonNilOrderedSetValueWithSelector:](self, "_nonNilOrderedSetValueWithSelector:", a2), "objectAtIndex:", a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)objc_msgSend(-[NSKeyValueFastMutableOrderedSet2 _nonNilOrderedSetValueWithSelector:](self, "_nonNilOrderedSetValueWithSelector:", a2), "objectsAtIndexes:", a3);
}

@end
