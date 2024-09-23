@implementation NSKeyValueSlowMutableArray

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  _QWORD *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueSlowMutableArray;
  v5 = -[NSKeyValueMutableArray _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
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
  v3.super_class = (Class)NSKeyValueSlowMutableArray;
  -[NSKeyValueMutableArray _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_valueGetter = 0;
  self->_valueSetter = 0;
}

- (void)_raiseNilValueExceptionWithSelector:(SEL)a3
{
  _QWORD *v3;
  void *v4;

  if (self->_treatNilValuesLikeEmptyArrays)
    v3 = (_QWORD *)MEMORY[0x1E0C99858];
  else
    v3 = (_QWORD *)MEMORY[0x1E0C99768];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *v3, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: value for key %@ of object %p is nil"), _NSMethodExceptionProem((objc_class *)self, a3), self->super._key, self->super._container), 0);
  objc_exception_throw(v4);
}

- (unint64_t)count
{
  void *v4;

  v4 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (!v4 && !self->_treatNilValuesLikeEmptyArrays)
    -[NSKeyValueSlowMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2);
  return objc_msgSend(v4, "count");
}

- (id)_nonNilArrayValueWithSelector:(SEL)a3
{
  void *v5;

  v5 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (!v5)
    -[NSKeyValueSlowMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a3);
  return v5;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  objc_msgSend(-[NSKeyValueSlowMutableArray _nonNilArrayValueWithSelector:](self, "_nonNilArrayValueWithSelector:", a2), "getObjects:range:", a3, a4.location, a4.length);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(-[NSKeyValueSlowMutableArray _nonNilArrayValueWithSelector:](self, "_nonNilArrayValueWithSelector:", a2), "objectAtIndex:", a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)objc_msgSend(-[NSKeyValueSlowMutableArray _nonNilArrayValueWithSelector:](self, "_nonNilArrayValueWithSelector:", a2), "objectsAtIndexes:", a3);
}

- (void)addObject:(id)a3
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v6 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (v6)
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy", v8, v9);
    objc_msgSend(v7, "addObject:", a3);
  }
  else
  {
    if (!self->_treatNilValuesLikeEmptyArrays)
      -[NSKeyValueSlowMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2, v8, v9);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v8, 1);
  }
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v7);

}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v8 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v8, "mutableCopy", v10, v11);
    objc_msgSend(v9, "insertObject:atIndex:", a3, a4);
  }
  else
  {
    if (a4 || !self->_treatNilValuesLikeEmptyArrays)
      -[NSKeyValueSlowMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2, v10, v11);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v10, 1);
  }
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v9);

}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSString *v12;
  const __CFString *v13;
  NSString *v14;
  uint64_t v15;
  id v16;

  v8 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (!v8)
  {
    if (self->_treatNilValuesLikeEmptyArrays)
    {
      if (a3 && a4)
      {
        v9 = objc_msgSend(a3, "count");
        v10 = objc_msgSend(a4, "count");
        if (v9 == v10)
        {
          v11 = objc_msgSend(a4, "lastIndex");
          if (v11 < v9 || v11 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v16 = (id)objc_msgSend(a3, "mutableCopy");
            _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v16);
            goto LABEL_11;
          }
          goto LABEL_9;
        }
        v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: the counts of the passed-in array (%lu) and index set (%lu) must be identical."), _NSMethodExceptionProem((objc_class *)self, a2), v9, v10);
      }
      else
      {
        v12 = _NSMethodExceptionProem((objc_class *)self, a2);
        v13 = CFSTR("passed-in array");
        if (a3)
          v13 = CFSTR("index set");
        v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: the %@ must not be nil."), v12, v13, v15);
      }
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0));
    }
LABEL_9:
    -[NSKeyValueSlowMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2);
    v16 = 0;
    _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, 0);
    goto LABEL_11;
  }
  v16 = (id)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v16, "insertObjects:atIndexes:", a3, a4);
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v16);
LABEL_11:

}

- (id)_createNonNilMutableArrayValueWithSelector:(SEL)a3
{
  void *v5;

  v5 = (void *)_NSGetUsingKeyValueGetter((uint64_t)self->super._container, (uint64_t)self->_valueGetter);
  if (!v5)
    -[NSKeyValueSlowMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a3);
  return (id)objc_msgSend(v5, "mutableCopy");
}

- (void)removeLastObject
{
  id v3;

  v3 = -[NSKeyValueSlowMutableArray _createNonNilMutableArrayValueWithSelector:](self, "_createNonNilMutableArrayValueWithSelector:", a2);
  objc_msgSend(v3, "removeLastObject");
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v3);

}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v5;

  v5 = -[NSKeyValueSlowMutableArray _createNonNilMutableArrayValueWithSelector:](self, "_createNonNilMutableArrayValueWithSelector:", a2);
  objc_msgSend(v5, "removeObjectAtIndex:", a3);
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v5);

}

- (void)removeObjectsAtIndexes:(id)a3
{
  id v5;

  v5 = -[NSKeyValueSlowMutableArray _createNonNilMutableArrayValueWithSelector:](self, "_createNonNilMutableArrayValueWithSelector:", a2);
  objc_msgSend(v5, "removeObjectsAtIndexes:", a3);
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v5);

}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v7;

  v7 = -[NSKeyValueSlowMutableArray _createNonNilMutableArrayValueWithSelector:](self, "_createNonNilMutableArrayValueWithSelector:", a2);
  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", a3, a4);
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v7);

}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  id v7;

  v7 = -[NSKeyValueSlowMutableArray _createNonNilMutableArrayValueWithSelector:](self, "_createNonNilMutableArrayValueWithSelector:", a2);
  objc_msgSend(v7, "replaceObjectsAtIndexes:withObjects:", a3, a4);
  _NSSetUsingKeyValueSetter((uint64_t)self->super._container, (uint64_t)self->_valueSetter, (uint64_t)v7);

}

@end
