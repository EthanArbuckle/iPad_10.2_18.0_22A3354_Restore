@implementation NWStatsEntityMapperProcessWatcher

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6;
  NWStatsEntityMapperProcessWatcher *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (!v6)
  {
    if (!v7->_niluuidProcessName)
    {
      v12 = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_12;
    goto LABEL_9;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_uuidProcessNameMap, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("timestamp"));

    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("procName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  if (a4)
  {
LABEL_9:
    if (v12)
      *a4 = 6;
  }
LABEL_12:
  objc_sync_exit(v7);

  return v12;
}

- (NWStatsEntityMapperProcessWatcher)init
{
  NWStatsEntityMapperProcessWatcher *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *uuidProcessNameMap;
  uint64_t v5;
  NSSet *daemonsWithStandardPrefixSet;
  NSDictionary *daemonsWithNonStandardMappings;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NWStatsEntityMapperProcessWatcher;
  v2 = -[NWStatsEntityMapperProcessWatcher init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    uuidProcessNameMap = v2->_uuidProcessNameMap;
    v2->_uuidProcessNameMap = v3;

    if (!v2->_uuidProcessNameMap)
    {

      v2 = 0;
    }
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24CBE27D0);
    daemonsWithStandardPrefixSet = v2->_daemonsWithStandardPrefixSet;
    v2->_daemonsWithStandardPrefixSet = (NSSet *)v5;

    daemonsWithNonStandardMappings = v2->_daemonsWithNonStandardMappings;
    v2->_daemonsWithNonStandardMappings = (NSDictionary *)&unk_24CBE2840;

  }
  return v2;
}

- (void)noteUUID:(id)a3 forProcessName:(id)a4
{
  id v6;
  NSObject *v7;
  NWStatsEntityMapperProcessWatcher *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  NSObject *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v6)
  {
    if ((unint64_t)-[NSMutableDictionary count](v8->_uuidProcessNameMap, "count") >= 0x65)
      -[NWStatsEntityMapperProcessWatcher _uuidProcessNameMapPrune](v8, "_uuidProcessNameMapPrune");
    -[NSMutableDictionary objectForKeyedSubscript:](v8->_uuidProcessNameMap, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      if (!v10)
      {
        NStatGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v7;
          _os_log_impl(&dword_211429000, v13, OS_LOG_TYPE_ERROR, "Memory allocation failed for %@", buf, 0xCu);
        }
        goto LABEL_20;
      }
      v11 = v7;
      if (v8->_canonicalizedNames)
      {
        -[NSSet member:](v8->_daemonsWithStandardPrefixSet, "member:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.%@"), v11);

          NStatGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v19 = v11;
            v20 = 2112;
            v21 = v6;
            v22 = 2112;
            v23 = v13;
            v15 = "Create canonical mapping for process %@, %@ -> %@";
LABEL_16:
            _os_log_impl(&dword_211429000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x20u);
            goto LABEL_17;
          }
          goto LABEL_17;
        }
        -[NSDictionary objectForKeyedSubscript:](v8->_daemonsWithNonStandardMappings, "objectForKeyedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[NSDictionary objectForKeyedSubscript:](v8->_daemonsWithNonStandardMappings, "objectForKeyedSubscript:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          NStatGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v19 = v11;
            v20 = 2112;
            v21 = v6;
            v22 = 2112;
            v23 = v13;
            v15 = "Create non-standard mapping for process %@, %@ -> %@";
            goto LABEL_16;
          }
LABEL_17:

LABEL_19:
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("procName"));
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("timestamp"));

          -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_uuidProcessNameMap, "setObject:forKeyedSubscript:", v10, v6);
LABEL_20:

          goto LABEL_21;
        }
      }
      v13 = v11;
      goto LABEL_19;
    }
  }
  else
  {
    objc_storeStrong((id *)&v8->_niluuidProcessName, a4);
  }
LABEL_21:
  objc_sync_exit(v8);

}

- (id)stateDictionary
{
  id v3;
  NWStatsEntityMapperProcessWatcher *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", v4->_uuidProcessNameMap);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ProcessNameMap"));

  objc_sync_exit(v4);
  return v3;
}

- (void)_uuidProcessNameMapPrune
{
  void *v3;
  id v4;

  if ((unint64_t)-[NSMutableDictionary count](self->_uuidProcessNameMap, "count") >= 0x65)
  {
    -[NSMutableDictionary keysSortedByValueUsingComparator:](self->_uuidProcessNameMap, "keysSortedByValueUsingComparator:", &__block_literal_global_532);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subarrayWithRange:", 0, 10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary count](self->_uuidProcessNameMap, "count");
    -[NSMutableDictionary removeObjectsForKeys:](self->_uuidProcessNameMap, "removeObjectsForKeys:", v3);

  }
}

uint64_t __61__NWStatsEntityMapperProcessWatcher__uuidProcessNameMapPrune__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)canonicalizedNames
{
  return self->_canonicalizedNames;
}

- (void)setCanonicalizedNames:(BOOL)a3
{
  self->_canonicalizedNames = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonsWithNonStandardMappings, 0);
  objc_storeStrong((id *)&self->_daemonsWithStandardPrefixSet, 0);
  objc_storeStrong((id *)&self->_niluuidProcessName, 0);
  objc_storeStrong((id *)&self->_uuidProcessNameMap, 0);
}

@end
