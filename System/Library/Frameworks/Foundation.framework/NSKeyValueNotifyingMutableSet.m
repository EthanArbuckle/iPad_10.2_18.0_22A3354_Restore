@implementation NSKeyValueNotifyingMutableSet

+ (id)_proxyShare
{
  id result;

  result = (id)_proxyShare_proxyShare_75;
  if (!_proxyShare_proxyShare_75)
  {
    result = _NSKeyValueProxyShareCreate();
    _proxyShare_proxyShare_75 = (uint64_t)result;
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
  v8.super_class = (Class)NSKeyValueNotifyingMutableSet;
  v5 = -[NSKeyValueMutableSet _proxyInitWithContainer:getter:](&v8, sel__proxyInitWithContainer_getter_, a3);
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
  v3.super_class = (Class)NSKeyValueNotifyingMutableSet;
  -[NSKeyValueMutableSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_mutableSet = 0;
}

- (unint64_t)count
{
  return -[NSMutableSet count](self->_mutableSet, "count");
}

- (id)member:(id)a3
{
  return (id)-[NSMutableSet member:](self->_mutableSet, "member:", a3);
}

- (id)objectEnumerator
{
  return (id)-[NSMutableSet objectEnumerator](self->_mutableSet, "objectEnumerator");
}

- (void)addObject:(id)a3
{
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v5, 1);
  -[NSObject willChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "willChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 1, v4);
  -[NSMutableSet addObject:](self->_mutableSet, "addObject:", v5[0]);
  -[NSObject didChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "didChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 1, v4);

}

- (void)addObjectsFromArray:(id)a3
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", a3);
  -[NSObject willChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "willChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 1, v5);
  -[NSMutableSet addObjectsFromArray:](self->_mutableSet, "addObjectsFromArray:", a3);
  -[NSObject didChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "didChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 1, v5);

}

- (void)intersectSet:(id)a3
{
  -[NSObject willChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "willChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 3, a3);
  -[NSMutableSet intersectSet:](self->_mutableSet, "intersectSet:", a3);
  -[NSObject didChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "didChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 3, a3);
}

- (void)minusSet:(id)a3
{
  -[NSObject willChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "willChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 2, a3);
  -[NSMutableSet minusSet:](self->_mutableSet, "minusSet:", a3);
  -[NSObject didChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "didChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 2, a3);
}

- (void)removeAllObjects
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0C99E60], "set");
  -[NSObject willChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "willChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 3, v3);
  -[NSMutableSet removeAllObjects](self->_mutableSet, "removeAllObjects");
  -[NSObject didChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "didChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 3, v3);
}

- (void)removeObject:(id)a3
{
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v5, 1);
  -[NSObject willChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "willChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 2, v4);
  -[NSMutableSet removeObject:](self->_mutableSet, "removeObject:", v5[0]);
  -[NSObject didChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "didChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 2, v4);

}

- (void)setSet:(id)a3
{
  -[NSObject willChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "willChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 4, a3);
  -[NSMutableSet setSet:](self->_mutableSet, "setSet:", a3);
  -[NSObject didChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "didChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 4, a3);
}

- (void)unionSet:(id)a3
{
  -[NSObject willChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "willChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 1, a3);
  -[NSMutableSet unionSet:](self->_mutableSet, "unionSet:", a3);
  -[NSObject didChangeValueForKey:withSetMutation:usingObjects:](self->super._container, "didChangeValueForKey:withSetMutation:usingObjects:", self->super._key, 1, a3);
}

@end
