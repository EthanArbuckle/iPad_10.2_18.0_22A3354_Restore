@implementation NSKeyValueNotifyingMutableArray

+ (id)_proxyShare
{
  id result;

  result = (id)_proxyShare_proxyShare_88;
  if (!_proxyShare_proxyShare_88)
  {
    result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_88 = (uint64_t)result;
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
  v8.super_class = (Class)NSKeyValueNotifyingMutableArray;
  v5 = -[NSKeyValueMutableArray _proxyInitWithContainer:getter:](&v8, sel__proxyInitWithContainer_getter_, a3);
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
  v3.super_class = (Class)NSKeyValueNotifyingMutableArray;
  -[NSKeyValueMutableArray _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_mutableArray = 0;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_mutableArray, "count");
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  -[NSMutableArray getObjects:range:](self->_mutableArray, "getObjects:range:", a3, a4.location, a4.length);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_mutableArray, "objectAtIndex:", a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)-[NSMutableArray objectsAtIndexes:](self->_mutableArray, "objectsAtIndexes:", a3);
}

- (void)addObject:(id)a3
{
  NSIndexSet *v5;

  v5 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", -[NSMutableArray count](self->_mutableArray, "count"));
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 2, v5, self->super._key);
  -[NSMutableArray addObject:](self->_mutableArray, "addObject:", a3);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 2, v5, self->super._key);

}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  NSIndexSet *v7;

  v7 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", a4);
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 2, v7, self->super._key);
  -[NSMutableArray insertObject:atIndex:](self->_mutableArray, "insertObject:atIndex:", a3, a4);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 2, v7, self->super._key);

}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 2, a4, self->super._key);
  -[NSMutableArray insertObjects:atIndexes:](self->_mutableArray, "insertObjects:atIndexes:", a3, a4);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 2, a4, self->super._key);
}

- (void)removeLastObject
{
  NSIndexSet *v3;

  v3 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", -[NSMutableArray count](self->_mutableArray, "count") - 1);
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 3, v3, self->super._key);
  -[NSMutableArray removeLastObject](self->_mutableArray, "removeLastObject");
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 3, v3, self->super._key);

}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  NSIndexSet *v5;

  v5 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", a3);
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 3, v5, self->super._key);
  -[NSMutableArray removeObjectAtIndex:](self->_mutableArray, "removeObjectAtIndex:", a3);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 3, v5, self->super._key);

}

- (void)removeObjectsAtIndexes:(id)a3
{
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 3, a3, self->super._key);
  -[NSMutableArray removeObjectsAtIndexes:](self->_mutableArray, "removeObjectsAtIndexes:", a3);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 3, a3, self->super._key);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  NSIndexSet *v7;

  v7 = -[NSIndexSet initWithIndex:]([NSIndexSet alloc], "initWithIndex:", a3);
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 4, v7, self->super._key);
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_mutableArray, "replaceObjectAtIndex:withObject:", a3, a4);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 4, v7, self->super._key);

}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  -[NSObject willChange:valuesAtIndexes:forKey:](self->super._container, "willChange:valuesAtIndexes:forKey:", 4, a3, self->super._key);
  -[NSMutableArray replaceObjectsAtIndexes:withObjects:](self->_mutableArray, "replaceObjectsAtIndexes:withObjects:", a3, a4);
  -[NSObject didChange:valuesAtIndexes:forKey:](self->super._container, "didChange:valuesAtIndexes:forKey:", 4, a3, self->super._key);
}

@end
