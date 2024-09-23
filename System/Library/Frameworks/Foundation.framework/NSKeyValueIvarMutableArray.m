@implementation NSKeyValueIvarMutableArray

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  _QWORD *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueIvarMutableArray;
  v5 = -[NSKeyValueMutableArray _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5)
    v5[3] = objc_msgSend(a4, "ivar");
  return v5;
}

- (void)_proxyNonGCFinalize
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueIvarMutableArray;
  -[NSKeyValueMutableArray _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_ivar = 0;
}

- (unint64_t)count
{
  return objc_msgSend(*(id *)((char *)&self->super._container->isa + ivar_getOffset(self->_ivar)), "count");
}

- (void)_raiseNilValueExceptionWithSelector:(SEL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: value for key %@ of object %p is nil"), _NSMethodExceptionProem((objc_class *)self, a3), self->super._key, self->super._container), 0);
  objc_exception_throw(v3);
}

- (id)_nonNilMutableArrayValueWithSelector:(SEL)a3
{
  NSObject *container;
  void *v6;

  container = self->super._container;
  v6 = *(Class *)((char *)&container->isa + ivar_getOffset(self->_ivar));
  if (!v6)
    -[NSKeyValueIvarMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a3);
  return v6;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  objc_msgSend(-[NSKeyValueIvarMutableArray _nonNilMutableArrayValueWithSelector:](self, "_nonNilMutableArrayValueWithSelector:", a2), "getObjects:range:", a3, a4.location, a4.length);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(-[NSKeyValueIvarMutableArray _nonNilMutableArrayValueWithSelector:](self, "_nonNilMutableArrayValueWithSelector:", a2), "objectAtIndex:", a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)objc_msgSend(-[NSKeyValueIvarMutableArray _nonNilMutableArrayValueWithSelector:](self, "_nonNilMutableArrayValueWithSelector:", a2), "objectsAtIndexes:", a3);
}

- (void)addObject:(id)a3
{
  NSObject *container;
  ptrdiff_t Offset;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = a3;
  container = self->super._container;
  Offset = ivar_getOffset(self->_ivar);
  v6 = *(Class *)((char *)&container->isa + Offset);
  if (v6)
    objc_msgSend(v6, "addObject:", a3);
  else
    *(Class *)((char *)&container->isa + Offset) = (Class)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", v7, 1);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  NSObject *container;
  ptrdiff_t Offset;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = a3;
  container = self->super._container;
  Offset = ivar_getOffset(self->_ivar);
  v10 = *(Class *)((char *)&container->isa + Offset);
  if (v10)
  {
    objc_msgSend(v10, "insertObject:atIndex:", a3, a4);
  }
  else
  {
    if (a4)
      -[NSKeyValueIvarMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2, v11[0]);
    *(Class *)((char *)&container->isa + Offset) = (Class)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", v11, 1);
  }
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  NSObject *container;
  ptrdiff_t Offset;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSString *v14;
  const __CFString *v15;
  NSString *v16;
  uint64_t v17;

  container = self->super._container;
  Offset = ivar_getOffset(self->_ivar);
  v10 = *(Class *)((char *)&container->isa + Offset);
  if (v10)
  {
    objc_msgSend(v10, "insertObjects:atIndexes:", a3, a4);
    return;
  }
  if (!a3 || !a4)
  {
    v14 = _NSMethodExceptionProem((objc_class *)self, a2);
    v15 = CFSTR("passed-in array");
    if (a3)
      v15 = CFSTR("index set");
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: the %@ must not be nil."), v14, v15, v17);
LABEL_14:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0));
  }
  v11 = objc_msgSend(a3, "count");
  v12 = objc_msgSend(a4, "count");
  if (v11 != v12)
  {
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: the counts of the passed-in array (%lu) and index set (%lu) must be identical."), _NSMethodExceptionProem((objc_class *)self, a2), v11, v12);
    goto LABEL_14;
  }
  v13 = objc_msgSend(a4, "lastIndex");
  if (v13 < v11 || v13 == 0x7FFFFFFFFFFFFFFFLL)
    *(Class *)((char *)&container->isa + Offset) = (Class)objc_msgSend(a3, "mutableCopy");
  else
    -[NSKeyValueIvarMutableArray _raiseNilValueExceptionWithSelector:](self, "_raiseNilValueExceptionWithSelector:", a2);
}

- (void)removeLastObject
{
  objc_msgSend(-[NSKeyValueIvarMutableArray _nonNilMutableArrayValueWithSelector:](self, "_nonNilMutableArrayValueWithSelector:", a2), "removeLastObject");
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  objc_msgSend(-[NSKeyValueIvarMutableArray _nonNilMutableArrayValueWithSelector:](self, "_nonNilMutableArrayValueWithSelector:", a2), "removeObjectAtIndex:", a3);
}

- (void)removeObjectsAtIndexes:(id)a3
{
  objc_msgSend(-[NSKeyValueIvarMutableArray _nonNilMutableArrayValueWithSelector:](self, "_nonNilMutableArrayValueWithSelector:", a2), "removeObjectsAtIndexes:", a3);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  objc_msgSend(-[NSKeyValueIvarMutableArray _nonNilMutableArrayValueWithSelector:](self, "_nonNilMutableArrayValueWithSelector:", a2), "replaceObjectAtIndex:withObject:", a3, a4);
}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  objc_msgSend(-[NSKeyValueIvarMutableArray _nonNilMutableArrayValueWithSelector:](self, "_nonNilMutableArrayValueWithSelector:", a2), "replaceObjectsAtIndexes:withObjects:", a3, a4);
}

@end
