@implementation LiveFSLRUCache

- (LiveFSLRUCache)init
{
  LiveFSLRUCache *v2;
  uint64_t v3;
  NSMutableDictionary *mapping;
  uint64_t v5;
  NSMutableArray *usageOrder;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LiveFSLRUCache;
  v2 = -[LiveFSLRUCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mapping = v2->_mapping;
    v2->_mapping = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    usageOrder = v2->_usageOrder;
    v2->_usageOrder = (NSMutableArray *)v5;

  }
  return v2;
}

- (int)countLimit
{
  return self->_countLimit;
}

- (void)setCountLimit:(int)a3
{
  int countLimit;
  LiveFSLRUCache *obj;

  obj = self;
  objc_sync_enter(obj);
  countLimit = obj->_countLimit;
  obj->_countLimit = a3;
  while (countLimit > a3)
  {
    -[LiveFSLRUCache removeLastItem](obj, "removeLastItem");
    --countLimit;
  }
  objc_sync_exit(obj);

}

- (id)objectForKeyLocked:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_mapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableArray removeObject:](self->_usageOrder, "removeObject:", v4);
    -[NSMutableArray addObject:](self->_usageOrder, "addObject:", v4);
  }

  return v5;
}

- (id)objectForKey:(id)a3
{
  id v4;
  LiveFSLRUCache *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[LiveFSLRUCache objectForKeyLocked:](v5, "objectForKeyLocked:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)removeLastItem
{
  id v3;

  -[NSMutableArray objectAtIndex:](self->_usageOrder, "objectAtIndex:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_usageOrder, "removeObjectAtIndex:", 0);
  -[NSMutableDictionary removeObjectForKey:](self->_mapping, "removeObjectForKey:", v3);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  LiveFSLRUCache *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[LiveFSLRUCache objectForKeyLocked:](v7, "objectForKeyLocked:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (-[NSMutableDictionary count](v7->_mapping, "count") >= (unint64_t)v7->_countLimit)
      -[LiveFSLRUCache removeLastItem](v7, "removeLastItem");
    -[NSMutableDictionary setObject:forKey:](v7->_mapping, "setObject:forKey:", v9, v6);
    -[NSMutableArray addObject:](v7->_usageOrder, "addObject:", v6);
  }
  objc_sync_exit(v7);

}

- (void)removeAllObjects
{
  LiveFSLRUCache *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](obj->_mapping, "removeAllObjects");
  -[NSMutableArray removeAllObjects](obj->_usageOrder, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)removeObjectForKey:(id)a3
{
  LiveFSLRUCache *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKey:](v4->_mapping, "objectForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableArray removeObject:](v4->_usageOrder, "removeObject:", v6);
    -[NSMutableDictionary removeObjectForKey:](v4->_mapping, "removeObjectForKey:", v6);
  }
  objc_sync_exit(v4);

}

- (NSMutableDictionary)mapping
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)usageOrder
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUsageOrder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageOrder, 0);
  objc_storeStrong((id *)&self->_mapping, 0);
}

@end
