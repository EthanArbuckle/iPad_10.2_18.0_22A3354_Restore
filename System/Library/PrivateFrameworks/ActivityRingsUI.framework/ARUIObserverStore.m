@implementation ARUIObserverStore

- (void)enumerateObserversWithBlock:(id)a3
{
  void (**v4)(_QWORD);
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
  v4 = (void (**)(_QWORD))a3;
  -[NSPointerArray compact](self->_observers, "compact");
  -[NSPointerArray allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
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
        if (*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9))
          v4[2](v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (unint64_t)count
{
  -[NSPointerArray compact](self->_observers, "compact");
  return -[NSPointerArray count](self->_observers, "count");
}

- (void)addObserver:(id)a3
{
  -[NSPointerArray addPointer:](self->_observers, "addPointer:", a3);
}

- (ARUIObserverStore)init
{
  ARUIObserverStore *v2;
  uint64_t v3;
  NSPointerArray *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARUIObserverStore;
  v2 = -[ARUIObserverStore init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;

  }
  return v2;
}

- (void)removeObserver:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v6 = a3;
  if (-[NSPointerArray count](self->_observers, "count"))
  {
    v4 = 0;
    while (1)
    {
      -[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
        break;

      if (++v4 >= -[NSPointerArray count](self->_observers, "count"))
        goto LABEL_7;
    }
    -[NSPointerArray replacePointerAtIndex:withPointer:](self->_observers, "replacePointerAtIndex:withPointer:", v4, 0);

  }
LABEL_7:
  -[NSPointerArray compact](self->_observers, "compact");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
