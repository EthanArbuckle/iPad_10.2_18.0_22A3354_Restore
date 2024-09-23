@implementation QLCacheItem

- (void)setItem:(id)a3
{
  QLItem **p_item;

  p_item = &self->_item;
  objc_storeStrong((id *)&self->_item, a3);
  if (self->_handlers)
  {
    if (*p_item)
      -[QLCacheItem _performHandlers](self, "_performHandlers");
  }
}

- (void)addCompletionHandler:(id)a3
{
  void *v4;
  QLCacheItem *v5;
  void *v6;
  void *v7;
  NSMutableArray *handlers;
  uint64_t v9;
  NSMutableArray *v10;
  void *v11;
  void (**aBlock)(id, QLCacheItem *, void *);

  aBlock = (void (**)(id, QLCacheItem *, void *))a3;
  -[QLCacheItem item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[QLCacheItem item](self, "item");
    v5 = (QLCacheItem *)objc_claimAutoreleasedReturnValue();
    -[QLCacheItem item](self, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[2](aBlock, v5, v7);

  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    handlers = v5->_handlers;
    if (!handlers)
    {
      v9 = objc_opt_new();
      v10 = v5->_handlers;
      v5->_handlers = (NSMutableArray *)v9;

      handlers = v5->_handlers;
    }
    v11 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](handlers, "addObject:", v11);

    objc_sync_exit(v5);
  }

}

- (void)invalidate
{
  -[QLCacheItem setItem:](self, "setItem:", 0);
  -[QLCacheItem _performHandlers](self, "_performHandlers");
}

- (void)_performHandlers
{
  QLCacheItem *v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v2->_handlers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        -[QLCacheItem item](v2, "item", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLCacheItem item](v2, "item");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fetcher");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  -[NSMutableArray removeAllObjects](v2->_handlers, "removeAllObjects");
  objc_sync_exit(v2);

}

- (QLItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end
