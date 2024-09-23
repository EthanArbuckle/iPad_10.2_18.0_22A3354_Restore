@implementation NWStatsEntityMapperCoalitionWatcher

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6;
  NWStatsEntityMapperCoalitionWatcher *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    -[NSMutableDictionary objectForKeyedSubscript:](v7->_uuidCoalitionNameMap, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("timestamp"));

      v10 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("coalitionName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

    objc_sync_exit(v7);
    if (a4 && v12)
      *a4 = 5;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NWStatsEntityMapperCoalitionWatcher)init
{
  NWStatsEntityMapperCoalitionWatcher *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *uuidCoalitionNameMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NWStatsEntityMapperCoalitionWatcher;
  v2 = -[NWStatsEntityMapperCoalitionWatcher init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    uuidCoalitionNameMap = v2->_uuidCoalitionNameMap;
    v2->_uuidCoalitionNameMap = v3;

    if (!v2->_uuidCoalitionNameMap)
    {

      return 0;
    }
  }
  return v2;
}

- (BOOL)noteUUID:(id)a3 forPid:(int)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NWStatsEntityMapperCoalitionWatcher *v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    pid_to_coalitionID(a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NStatGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v7;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_211429000, v8, OS_LOG_TYPE_DEFAULT, "Note coalition name %@ for uuid %@", (uint8_t *)&v17, 0x16u);
    }

    if (v7)
    {
      v9 = self;
      objc_sync_enter(v9);
      if ((unint64_t)-[NSMutableDictionary count](v9->_uuidCoalitionNameMap, "count") >= 0x65)
        -[NWStatsEntityMapperCoalitionWatcher _uuidCoalitionNameMapPrune](v9, "_uuidCoalitionNameMapPrune");
      -[NSMutableDictionary objectForKeyedSubscript:](v9->_uuidCoalitionNameMap, "objectForKeyedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        LOBYTE(v11) = 0;
      }
      else
      {
        v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v11 = v12 != 0;
        if (v12)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("coalitionName"));

          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("timestamp"));

          -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_uuidCoalitionNameMap, "setObject:forKeyedSubscript:", v12, v6);
        }
        else
        {
          NStatGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v17 = 138412290;
            v18 = v7;
            _os_log_impl(&dword_211429000, v15, OS_LOG_TYPE_ERROR, "Memory allocation failed for %@", (uint8_t *)&v17, 0xCu);
          }

        }
      }
      objc_sync_exit(v9);

    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)_uuidCoalitionNameMapPrune
{
  void *v3;
  id v4;

  if ((unint64_t)-[NSMutableDictionary count](self->_uuidCoalitionNameMap, "count") >= 0x65)
  {
    -[NSMutableDictionary keysSortedByValueUsingComparator:](self->_uuidCoalitionNameMap, "keysSortedByValueUsingComparator:", &__block_literal_global_114);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subarrayWithRange:", 0, 10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary count](self->_uuidCoalitionNameMap, "count");
    -[NSMutableDictionary removeObjectsForKeys:](self->_uuidCoalitionNameMap, "removeObjectsForKeys:", v3);

  }
}

uint64_t __65__NWStatsEntityMapperCoalitionWatcher__uuidCoalitionNameMapPrune__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidCoalitionNameMap, 0);
}

@end
