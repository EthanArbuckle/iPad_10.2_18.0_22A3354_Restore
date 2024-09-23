@implementation CNAsynchronousCacheEntryDelegateObservable

uint64_t __56__CNAsynchronousCacheEntryDelegateObservable_subscribe___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (id)subscribe:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  CNAsynchronousCacheEntryDelegateObservable *v15;
  id v16;

  v4 = a3;
  v5 = self->_observers;
  objc_sync_enter(v5);
  -[NSMutableArray addObject:](self->_observers, "addObject:", v4);
  v6 = self->_currentValue;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __56__CNAsynchronousCacheEntryDelegateObservable_subscribe___block_invoke;
  v14 = &unk_1E29B8C10;
  v15 = self;
  v7 = v4;
  v16 = v7;
  +[CNCancelationToken tokenWithCancelationBlock:](CNCancelationToken, "tokenWithCancelationBlock:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v11, v12, v13, v14, v15);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v9)
      objc_msgSend(v7, "observerDidReceiveResult:", v6);
  }

  return v8;
}

- (void)cacheEntryDidUpdateValue:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  id currentValue;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_observers;
  objc_sync_enter(v5);
  v6 = (void *)-[NSMutableArray copy](self->_observers, "copy");
  objc_msgSend(v4, "currentValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  currentValue = self->_currentValue;
  self->_currentValue = v7;

  objc_sync_exit(v5);
  objc_msgSend(v4, "currentValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CNNilToNull_block_invoke_2((uint64_t)&__block_literal_global_1_2, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "observerDidReceiveResult:", v10, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (CNAsynchronousCacheEntryDelegateObservable)init
{
  CNAsynchronousCacheEntryDelegateObservable *v2;
  NSMutableArray *v3;
  NSMutableArray *observers;
  CNAsynchronousCacheEntryDelegateObservable *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNAsynchronousCacheEntryDelegateObservable;
  v2 = -[CNAsynchronousCacheEntryDelegateObservable init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentValue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
