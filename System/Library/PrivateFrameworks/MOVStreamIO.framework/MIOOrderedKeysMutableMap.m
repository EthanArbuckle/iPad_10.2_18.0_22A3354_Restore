@implementation MIOOrderedKeysMutableMap

- (MIOOrderedKeysMutableMap)init
{
  MIOOrderedKeysMutableMap *v2;
  uint64_t v3;
  NSMutableArray *keys;
  uint64_t v5;
  NSMutableDictionary *map;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MIOOrderedKeysMutableMap;
  v2 = -[MIOOrderedKeysMutableMap init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    keys = v2->_keys;
    v2->_keys = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    map = v2->_map;
    v2->_map = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  MIOOrderedKeysMutableMap *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if ((-[NSMutableArray containsObject:](v7->_keys, "containsObject:", v6) & 1) == 0)
    -[NSMutableArray addObject:](v7->_keys, "addObject:", v6);
  -[NSMutableDictionary setObject:forKey:](v7->_map, "setObject:forKey:", v8, v6);
  objc_sync_exit(v7);

}

- (id)allOrderedKeys
{
  MIOOrderedKeysMutableMap *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_keys, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4;
  MIOOrderedKeysMutableMap *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_map, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)allValues
{
  MIOOrderedKeysMutableMap *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allValues](v2->_map, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
