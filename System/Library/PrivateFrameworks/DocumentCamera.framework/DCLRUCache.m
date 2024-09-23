@implementation DCLRUCache

+ (id)cacheCollection
{
  if (cacheCollection_onceToken != -1)
    dispatch_once(&cacheCollection_onceToken, &__block_literal_global_12);
  return (id)cacheCollection_sCacheCollection;
}

void __29__DCLRUCache_cacheCollection__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cacheCollection_sCacheCollection;
  cacheCollection_sCacheCollection = v0;

}

- (DCLRUCache)initWithMaxSize:(unint64_t)a3
{
  DCLRUCache *v4;
  DCLRUCache *v5;
  uint64_t v6;
  NSMapTable *mData;
  uint64_t v8;
  NSMutableArray *mOrderedKeys;
  void *v10;
  DCLRUCache *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DCLRUCache;
  v4 = -[DCLRUCache init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mMax = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, a3);
    mData = v5->mData;
    v5->mData = (NSMapTable *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
    mOrderedKeys = v5->mOrderedKeys;
    v5->mOrderedKeys = (NSMutableArray *)v8;

    objc_msgSend((id)objc_opt_class(), "cacheCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addPointer:", v5);

    v11 = v5;
  }

  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[NSMutableArray count](self->mOrderedKeys, "count") >= self->mMax)
    -[DCLRUCache p_removeOldestObject](self, "p_removeOldestObject");
  v7 = -[NSMutableArray indexOfObject:](self->mOrderedKeys, "indexOfObject:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->mOrderedKeys, "removeObjectAtIndex:", v7);
  -[NSMapTable setObject:forKey:](self->mData, "setObject:forKey:", v8, v6);
  -[NSMutableArray addObject:](self->mOrderedKeys, "addObject:", v6);

}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->mOrderedKeys, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[NSMapTable removeObjectForKey:](self->mData, "removeObjectForKey:", v6);
    -[NSMutableArray removeObjectAtIndex:](self->mOrderedKeys, "removeObjectAtIndex:", v5);
  }

}

- (void)removeAllObjects
{
  -[NSMutableArray removeAllObjects](self->mOrderedKeys, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->mData, "removeAllObjects");
}

- (id)objectForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->mOrderedKeys, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v7 = v5;
    -[NSMapTable objectForKey:](self->mData, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->mOrderedKeys, "addObject:", v4);
    -[NSMutableArray removeObjectAtIndex:](self->mOrderedKeys, "removeObjectAtIndex:", v7);
  }

  return v6;
}

- (NSArray)allKeys
{
  return (NSArray *)self->mOrderedKeys;
}

+ (void)purgeAllCaches
{
  void *v2;
  void *v3;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[DCLRUCache cacheCollection](DCLRUCache, "cacheCollection", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeAllObjects");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)p_removeOldestObject
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NSMutableArray objectAtIndex:](self->mOrderedKeys, "objectAtIndex:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DCLRUCache delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSMapTable objectForKey:](self->mData, "objectForKey:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCLRUCache delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willEvictObject:forKey:", v4, v6);

  }
  -[NSMapTable removeObjectForKey:](self->mData, "removeObjectForKey:", v6);
  -[NSMutableArray removeObjectAtIndex:](self->mOrderedKeys, "removeObjectAtIndex:", 0);

}

- (unint64_t)maxSize
{
  return self->mMax;
}

- (DCLRUCacheDelegate)delegate
{
  return (DCLRUCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mOrderedKeys, 0);
  objc_storeStrong((id *)&self->mData, 0);
}

@end
