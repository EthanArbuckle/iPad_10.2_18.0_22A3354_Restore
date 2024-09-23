@implementation MRClientDiagnosticsDataSource

+ (MRClientDiagnosticsDataSource)sharedDataSource
{
  if (sharedDataSource_onceToken != -1)
    dispatch_once(&sharedDataSource_onceToken, &__block_literal_global_106);
  return (MRClientDiagnosticsDataSource *)(id)sharedDataSource___dataSource;
}

void __49__MRClientDiagnosticsDataSource_sharedDataSource__block_invoke()
{
  MRClientDiagnosticsDataSource *v0;
  void *v1;

  v0 = objc_alloc_init(MRClientDiagnosticsDataSource);
  v1 = (void *)sharedDataSource___dataSource;
  sharedDataSource___dataSource = (uint64_t)v0;

}

- (MRClientDiagnosticsDataSource)init
{
  MRClientDiagnosticsDataSource *v2;
  MRClientDiagnosticsDataSource *v3;
  uint64_t v4;
  NSMutableDictionary *map;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRClientDiagnosticsDataSource;
  v2 = -[MRClientDiagnosticsDataSource init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    map = v3->_map;
    v3->_map = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (NSString)diagnostic
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  os_unfair_lock_t lock;
  id obj;
  uint64_t v20;
  MRClientDiagnosticsDataSource *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("Log History:\n\n"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = self;
  -[MRClientDiagnosticsDataSource map](self, "map");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v3, "appendFormat:", CFSTR("Registered %@ Instances:\n\n"), v7, lock);
        -[MRClientDiagnosticsDataSource map](v21, "map");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "diagnosticDescription");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "appendString:", v15);

              objc_msgSend(&stru_1E30D5AF8, "stringByPaddingToLength:withString:startingAtIndex:", 100, CFSTR("-"), 0);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "appendString:", v16);

              objc_msgSend(v3, "appendString:", CFSTR("\n"));
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v12);
        }

        objc_msgSend(v3, "appendString:", CFSTR("\n"));
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }

  os_unfair_lock_unlock(lock);
  return (NSString *)v3;
}

- (void)add:(id)a3
{
  os_unfair_lock_s *p_lock;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRClientDiagnosticsDataSource map](self, "map");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRClientDiagnosticsDataSource map](self, "map");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

  }
  -[MRClientDiagnosticsDataSource map](self, "map");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  os_unfair_lock_unlock(p_lock);
}

- (void)remove:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[MRClientDiagnosticsDataSource map](self, "map");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v5);

  -[MRClientDiagnosticsDataSource map](self, "map");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    -[MRClientDiagnosticsDataSource map](self, "map");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);

  }
  os_unfair_lock_unlock(p_lock);

}

- (NSMutableDictionary)map
{
  return self->_map;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
}

@end
