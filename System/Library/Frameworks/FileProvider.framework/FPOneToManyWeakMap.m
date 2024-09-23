@implementation FPOneToManyWeakMap

- (id)anyObjectForKey:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_backingDictionary, "objectForKeyedSubscript:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (FPOneToManyWeakMap)init
{
  FPOneToManyWeakMap *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *backingDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FPOneToManyWeakMap;
  v2 = -[FPOneToManyWeakMap init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    backingDictionary = v2->_backingDictionary;
    v2->_backingDictionary = v3;

  }
  return v2;
}

- (void)removeObjectsForKey:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backingDictionary, "setObject:forKeyedSubscript:", 0, a3);
}

- (void)addObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_backingDictionary, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backingDictionary, "setObject:forKeyedSubscript:", v7, v6);
    }
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (id)removeObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allKeys](self->_backingDictionary, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_backingDictionary, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "containsObject:", v4))
        {
          objc_msgSend(v5, "addObject:", v12);
          objc_msgSend(v13, "removeObject:", v4);
        }
        objc_msgSend(v13, "anyObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backingDictionary, "setObject:forKeyedSubscript:", 0, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

@end
