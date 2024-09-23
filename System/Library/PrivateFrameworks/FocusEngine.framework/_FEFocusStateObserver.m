@implementation _FEFocusStateObserver

- (_FEFocusStateObserver)init
{
  _FEFocusStateObserver *v2;
  uint64_t v3;
  NSMapTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_FEFocusStateObserver;
  v2 = -[_FEFocusStateObserver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v3;

    *(_BYTE *)&v2->_flags = *(_BYTE *)&v2->_flags & 0xFE | -[_FEFocusStateObserver isActive](v2, "isActive");
  }
  return v2;
}

- (BOOL)isActive
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusStateObserver.m"), 33, CFSTR("This is an abstract class. isActive needs to be implemented by a concrete subclass."));

  return 0;
}

- (id)addObserver:(id)a3
{
  id v5;
  void *v6;
  NSMapTable *observers;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusStateObserver.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  v8 = (void *)MEMORY[0x2426205A4](v5);
  -[NSMapTable setObject:forKey:](observers, "setObject:forKey:", v8, v6);

  return v6;
}

- (void)removeObserver:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusStateObserver.m"), 50, CFSTR("Observer is not of type id<_FEFocusStateObserverToken>."));

  }
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:", v6);

}

- (void)notifyObserversIfNecessary
{
  _BOOL4 v3;
  char flags;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v3 = -[_FEFocusStateObserver isActive](self, "isActive");
    flags = (char)self->_flags;
    if (((v3 ^ ((flags & 1) == 0)) & 1) == 0)
    {
      *(_BYTE *)&self->_flags = flags & 0xFE | v3;
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      -[NSMapTable objectEnumerator](self->_observers, "objectEnumerator", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++) + 16))();
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (void)performUpdatesAndNotifyObservers:(id)a3
{
  char flags;

  flags = (char)self->_flags;
  *(_BYTE *)&self->_flags = flags | 2;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | flags & 2;
  -[_FEFocusStateObserver notifyObserversIfNecessary](self, "notifyObserversIfNecessary");
}

- (id)descriptionBuilder
{
  void *v3;
  _BOOL8 v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_FEFocusStateObserver isActive](self, "isActive");
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", v4, CFSTR("isActive"));
  if (v4 == ((*(_BYTE *)&self->_flags & 1) == 0))
    v6 = (id)objc_msgSend(v3, "appendBool:withName:", *(_BYTE *)&self->_flags & 1, CFSTR("wasActive"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_observers, CFSTR("observers"));
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[_FEFocusStateObserver descriptionBuilder](self, "descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
