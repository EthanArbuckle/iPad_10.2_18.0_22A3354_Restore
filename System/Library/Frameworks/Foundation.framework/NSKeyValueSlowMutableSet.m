@implementation NSKeyValueSlowMutableSet

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  _QWORD *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueSlowMutableSet;
  v5 = -[NSKeyValueMutableSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5)
  {
    v5[3] = (id)objc_msgSend(a4, "baseGetter");
    v5[4] = (id)objc_msgSend(a4, "baseSetter");
    *((_BYTE *)v5 + 40) = objc_msgSend(a4, "treatNilValuesLikeEmptyCollections");
  }
  return v5;
}

- (void)_proxyNonGCFinalize
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueSlowMutableSet;
  -[NSKeyValueMutableSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_valueGetter = 0;
  self->_valueSetter = 0;
}

- (void)_raiseNilValueExceptionWithSelector:(SEL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: value for key %@ of object %p is nil"), _NSMethodExceptionProem((objc_class *)self, a3), self->super._key, self->super._container), 0);
  objc_exception_throw(v3);
}

- (id)_setValueWithSelector:(SEL)a3
{
  void *v5;

  v5 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (!v5 && !self->_treatNilValuesLikeEmptySets)
    -[NSKeyValueSlowMutableSet _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a3);
  return v5;
}

- (unint64_t)count
{
  return objc_msgSend(-[NSKeyValueSlowMutableSet _setValueWithSelector:](self, "_setValueWithSelector:", a2), "count");
}

- (id)member:(id)a3
{
  return (id)objc_msgSend(-[NSKeyValueSlowMutableSet _setValueWithSelector:](self, "_setValueWithSelector:", a2), "member:", a3);
}

- (id)objectEnumerator
{
  id v2;

  v2 = -[NSKeyValueSlowMutableSet _setValueWithSelector:](self, "_setValueWithSelector:", a2);
  if (v2)
    return (id)objc_msgSend(v2, "objectEnumerator");
  else
    return objc_alloc_init(NSKeyValueNilSetEnumerator);
}

- (id)_createMutableSetValueWithSelector:(SEL)a3
{
  void *v5;

  v5 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (!v5 && !self->_treatNilValuesLikeEmptySets)
    -[NSKeyValueSlowMutableSet _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a3);
  return (id)objc_msgSend(v5, "mutableCopy");
}

- (void)addObject:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:](self, "_createMutableSetValueWithSelector:", a2, a3, *MEMORY[0x1E0C80C00]);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "addObject:", a3);
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", &v7, 1);
  }
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);

}

- (void)addObjectsFromArray:(id)a3
{
  id v5;
  id v6;

  v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:](self, "_createMutableSetValueWithSelector:", a2);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "addObjectsFromArray:", a3);
  }
  else
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", a3);
  }
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);

}

- (void)intersectSet:(id)a3
{
  id v5;
  id v6;

  v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:](self, "_createMutableSetValueWithSelector:", a2);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "intersectSet:", a3);
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);

  }
}

- (void)minusSet:(id)a3
{
  id v5;
  id v6;

  v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:](self, "_createMutableSetValueWithSelector:", a2);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "minusSet:", a3);
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);

  }
}

- (void)removeAllObjects
{
  id v4;

  if (!self->_treatNilValuesLikeEmptySets
    && !_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter))
  {
    -[NSKeyValueSlowMutableSet _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2);
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v4);

}

- (void)removeObject:(id)a3
{
  id v5;
  id v6;

  v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:](self, "_createMutableSetValueWithSelector:", a2);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "removeObject:", a3);
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);

  }
}

- (void)setSet:(id)a3
{
  if (!self->_treatNilValuesLikeEmptySets
    && !_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter))
  {
    -[NSKeyValueSlowMutableSet _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2);
  }
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)a3);
}

- (void)unionSet:(id)a3
{
  id v5;
  id v6;

  v5 = -[NSKeyValueSlowMutableSet _createMutableSetValueWithSelector:](self, "_createMutableSetValueWithSelector:", a2);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "unionSet:", a3);
  }
  else
  {
    v6 = (id)objc_msgSend(a3, "mutableCopy");
  }
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v6);

}

@end
