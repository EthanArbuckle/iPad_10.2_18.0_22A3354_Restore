@implementation IMEventListenerList

- (IMEventListenerList)init
{
  IMEventListenerList *v2;
  uint64_t v3;
  NSMutableArray *eventListeners;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMEventListenerList;
  v2 = -[IMEventListenerList init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    eventListeners = v2->_eventListeners;
    v2->_eventListeners = (NSMutableArray *)v3;

  }
  return v2;
}

- (unint64_t)count
{
  IMEventListenerList *v2;
  NSMutableArray *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v2->_eventListeners;
  v4 = 0;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "eventListener", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 != 0;

        v4 += v9;
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v4;
}

- (void)addObject:(id)a3
{
  IMEventListenerList *v4;
  NSMutableArray *eventListeners;
  IMEventListenerReference *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  eventListeners = v4->_eventListeners;
  v6 = -[IMEventListenerReference initWithEventListener:]([IMEventListenerReference alloc], "initWithEventListener:", v7);
  -[NSMutableArray addObject:](eventListeners, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)removeObject:(id)a3
{
  IMEventListenerList *v4;
  uint64_t v5;
  void *v6;
  id v7;
  BOOL v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NSMutableArray count](v4->_eventListeners, "count");
  if (v5 - 1 >= 0)
  {
    do
    {
      -[NSMutableArray objectAtIndex:](v4->_eventListeners, "objectAtIndex:", --v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "eventListener");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
        v8 = v7 == v9;
      else
        v8 = 1;
      if (v8)
        -[NSMutableArray removeObjectAtIndex:](v4->_eventListeners, "removeObjectAtIndex:", v5);

    }
    while (v5 > 0);
  }
  objc_sync_exit(v4);

}

- (BOOL)containsObject:(id)a3
{
  id v4;
  IMEventListenerList *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[NSMutableArray count](v5->_eventListeners, "count");
  if (v6 - 1 < 0)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  while (1)
  {
    -[NSMutableArray objectAtIndex:](v5->_eventListeners, "objectAtIndex:", --v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventListener");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (!v8)
    {
      -[NSMutableArray removeObjectAtIndex:](v5->_eventListeners, "removeObjectAtIndex:", v6);
      goto LABEL_6;
    }
    if ((id)v8 == v4)
      break;
LABEL_6:

    if (v6 <= 0)
      goto LABEL_7;
  }

  v10 = 1;
LABEL_8:
  objc_sync_exit(v5);

  return v10;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, char *);
  IMEventListenerList *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, uint64_t, char *))a3;
  v5 = self;
  objc_sync_enter(v5);
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5->_eventListeners;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "eventListener", (_QWORD)v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v4[2](v4, v11, v8++, &v17);
      v12 = v17 == 0;

      if (!v12)
        break;
      if (v7 == ++v10)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventListeners, 0);
}

@end
