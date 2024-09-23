@implementation AVEventManager

- (void)addAction:(SEL)a3 withTarget:(id)a4 forEvent:(id)a5
{
  id v6;

  +[AVEventManagerAction actionWithTarget:selector:event:](AVEventManagerAction, "actionWithTarget:selector:event:", a4, a3, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVEventManager _addActionIfPossible:](self, "_addActionIfPossible:", v6);

}

- (void)_addActionIfPossible:(id)a3
{
  id v4;

  v4 = a3;
  -[AVEventManager _ensureActionStorage](self, "_ensureActionStorage");
  if ((-[NSMutableArray containsObject:](self->_actionStorage, "containsObject:", v4) & 1) == 0)
    -[NSMutableArray addObject:](self->_actionStorage, "addObject:", v4);

}

- (void)_ensureActionStorage
{
  NSMutableArray *v3;
  NSMutableArray *actionStorage;

  if (!self->_actionStorage)
  {
    v3 = (NSMutableArray *)objc_opt_new();
    actionStorage = self->_actionStorage;
    self->_actionStorage = v3;

  }
}

- (AVEventManager)initWithOwner:(id)a3
{
  id v4;
  AVEventManager *v5;
  AVEventManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVEventManager;
  v5 = -[AVEventManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_owner, v4);

  return v6;
}

- (void)addAction:(id)a3 forEvent:(id)a4
{
  id v5;

  +[AVEventManagerAction actionWithBlock:event:](AVEventManagerAction, "actionWithBlock:event:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVEventManager _addActionIfPossible:](self, "_addActionIfPossible:", v5);

}

- (void)removeAction:(SEL)a3 withTarget:(id)a4 forEvent:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_actionStorage, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v15, "hasMatchingTarget:withSelector:forEvent:", v8, a3, v9))
          -[NSMutableArray removeObject:](self->_actionStorage, "removeObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)sendActionsForEvent:(id)a3
{
  id v4;
  id WeakRetained;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_owner);
  if (WeakRetained)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_actionStorage;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v11, "hasMatchingEvent:", v4, (_QWORD)v12))
            objc_msgSend(v11, "sendAction:", WeakRetained);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionStorage, 0);
  objc_destroyWeak(&self->_owner);
}

@end
