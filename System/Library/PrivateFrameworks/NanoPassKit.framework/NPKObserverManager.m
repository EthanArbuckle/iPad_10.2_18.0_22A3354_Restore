@implementation NPKObserverManager

- (NPKObserverManager)init
{
  NPKObserverManager *v2;
  NSMutableIndexSet *v3;
  NSMutableIndexSet *priorityIndexSet;
  NSMutableDictionary *v5;
  NSMutableDictionary *observersTables;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NPKObserverManager;
  v2 = -[NPKObserverManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    priorityIndexSet = v2->_priorityIndexSet;
    v2->_priorityIndexSet = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    observersTables = v2->_observersTables;
    v2->_observersTables = v5;

  }
  return v2;
}

- (void)_registerObserver:(id)a3 withRelativePriority:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *observersTables;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v6 = a3;
  -[NPKObserverManager _unregisterObserver:](self, "_unregisterObserver:", v6);
  if ((-[NSMutableIndexSet containsIndex:](self->_priorityIndexSet, "containsIndex:", a4) & 1) != 0)
  {
    observersTables = self->_observersTables;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](observersTables, "objectForKeyedSubscript:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "pk_weakObjectsHashTableUsingPointerPersonality");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = self->_observersTables;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, v10);

    -[NSMutableIndexSet addIndex:](self->_priorityIndexSet, "addIndex:", a4);
  }
  objc_msgSend(v11, "addObject:", v6);

}

- (void)_registerObserver:(id)a3
{
  -[NPKObserverManager _registerObserver:withRelativePriority:](self, "_registerObserver:withRelativePriority:", a3, 10);
}

- (void)_unregisterObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__NPKObserverManager__unregisterObserver___block_invoke;
  v6[3] = &unk_24CFE9E20;
  v7 = v4;
  v5 = v4;
  -[NPKObserverManager _enumerateObserversTablesCopy:withBlock:](self, "_enumerateObserversTablesCopy:withBlock:", 0, v6);

}

void __42__NPKObserverManager__unregisterObserver___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  *a3 = objc_msgSend(v6, "containsObject:", v5);
  objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));

}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__NPKObserverManager__enumerateObserversUsingBlock___block_invoke;
  v6[3] = &unk_24CFE9E48;
  v7 = v4;
  v5 = v4;
  -[NPKObserverManager _enumerateObserversTablesCopy:withBlock:](self, "_enumerateObserversTablesCopy:withBlock:", 1, v6);

}

void __52__NPKObserverManager__enumerateObserversUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (BOOL)_hasObservers
{
  return -[NSMutableDictionary count](self->_observersTables, "count") != 0;
}

- (void)_enumerateObserversTablesCopy:(BOOL)a3 withBlock:(id)a4
{
  id v6;
  NSMutableIndexSet *priorityIndexSet;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  priorityIndexSet = self->_priorityIndexSet;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__NPKObserverManager__enumerateObserversTablesCopy_withBlock___block_invoke;
  v9[3] = &unk_24CFE9E70;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[NSMutableIndexSet enumerateIndexesWithOptions:usingBlock:](priorityIndexSet, "enumerateIndexesWithOptions:usingBlock:", 2, v9);

}

void __62__NPKObserverManager__enumerateObserversTablesCopy_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48))
  {
    v5 = objc_msgSend(v7, "copy");

    v6 = (id)v5;
  }
  else
  {
    v6 = v7;
  }
  v8 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersTables, 0);
  objc_storeStrong((id *)&self->_priorityIndexSet, 0);
}

@end
