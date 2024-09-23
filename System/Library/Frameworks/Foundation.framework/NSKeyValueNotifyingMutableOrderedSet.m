@implementation NSKeyValueNotifyingMutableOrderedSet

+ (id)_proxyShare
{
  id result;

  result = (id)_proxyShare_proxyShare_89;
  if (!_proxyShare_proxyShare_89)
  {
    result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_89 = (uint64_t)result;
  }
  return result;
}

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  NSObject **v5;
  NSObject **v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSKeyValueNotifyingMutableOrderedSet;
  v5 = -[NSKeyValueMutableOrderedSet _proxyInitWithContainer:getter:](&v8, sel__proxyInitWithContainer_getter_, a3);
  v6 = v5;
  if (v5)
    v5[3] = _NSGetProxyValueWithGetterNoLock(v5[1], (void *)objc_msgSend(a4, "mutableCollectionGetter"));
  return v6;
}

- (void)_proxyNonGCFinalize
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueNotifyingMutableOrderedSet;
  -[NSKeyValueMutableOrderedSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_mutableOrderedSet = 0;
}

- (unint64_t)count
{
  return -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count");
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  -[NSMutableOrderedSet getObjects:range:](self->_mutableOrderedSet, "getObjects:range:", a3, a4.location, a4.length);
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[NSMutableOrderedSet indexOfObject:](self->_mutableOrderedSet, "indexOfObject:", a3);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableOrderedSet objectAtIndex:](self->_mutableOrderedSet, "objectAtIndex:", a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)-[NSMutableOrderedSet objectsAtIndexes:](self->_mutableOrderedSet, "objectsAtIndexes:", a3);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  NSIndexSet *v7;

  v7 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", a4);
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 2, v7, self->super._key);
  -[NSMutableOrderedSet insertObject:atIndex:](self->_mutableOrderedSet, "insertObject:atIndex:", a3, a4);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 2, v7, self->super._key);

}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 2, a4, self->super._key);
  -[NSMutableOrderedSet insertObjects:atIndexes:](self->_mutableOrderedSet, "insertObjects:atIndexes:", a3, a4);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 2, a4, self->super._key);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  NSIndexSet *v5;

  v5 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", a3);
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 3, v5, self->super._key);
  -[NSMutableOrderedSet removeObjectAtIndex:](self->_mutableOrderedSet, "removeObjectAtIndex:", a3);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 3, v5, self->super._key);

}

- (void)removeObjectsAtIndexes:(id)a3
{
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 3, a3, self->super._key);
  -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", a3);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 3, a3, self->super._key);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  NSIndexSet *v7;

  v7 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", a3);
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 4, v7, self->super._key);
  -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_mutableOrderedSet, "replaceObjectAtIndex:withObject:", a3, a4);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 4, v7, self->super._key);

}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 4, a3, self->super._key);
  -[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:](self->_mutableOrderedSet, "replaceObjectsAtIndexes:withObjects:", a3, a4);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 4, a3, self->super._key);
}

@end
