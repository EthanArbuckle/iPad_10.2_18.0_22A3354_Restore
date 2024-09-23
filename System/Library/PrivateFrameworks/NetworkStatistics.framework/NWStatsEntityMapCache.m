@implementation NWStatsEntityMapCache

- (id)entryForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  uint8_t v14[16];

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_12;
  objc_msgSend(v5, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", self->_hitRetainTime);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setExpiryTime:", v8);

      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "expiryTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceNow");
      v11 = v10;

      if (v11 >= 0.0)
        goto LABEL_13;
      -[NSMutableDictionary removeObjectForKey:](self->_uuidMap, "removeObjectForKey:", v4);

      -[NWStatsEntityMapCache pruneCache](self, "pruneCache");
    }
    else
    {
      NStatGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_211429000, v12, OS_LOG_TYPE_ERROR, "Unexpected class in UUID map", v14, 2u);
      }

    }
LABEL_12:
    v7 = 0;
  }
LABEL_13:

  return v7;
}

- (NWStatsEntityMapCache)init
{
  char *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NWStatsEntityMapCache;
  v2 = -[NWStatsEntityMapCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    *(_OWORD *)(v2 + 24) = xmmword_211459A70;
    *((_QWORD *)v2 + 2) = 0xA00000064;
  }
  return (NWStatsEntityMapCache *)v2;
}

- (void)pruneCache
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = self->_uuidMap;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidMap, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "expiryTime");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceNow");
        v13 = v12;

        if (v13 < 0.0)
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v6);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v3;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        -[NSMutableDictionary removeObjectForKey:](self->_uuidMap, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v16);
  }

  if (-[NSMutableDictionary count](self->_uuidMap, "count") > (unint64_t)self->_capacityLimit)
  {
    -[NSMutableDictionary keysSortedByValueUsingComparator:](self->_uuidMap, "keysSortedByValueUsingComparator:", &__block_literal_global_1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "subarrayWithRange:", 0, self->_pruneSize);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v26;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(v20);
          -[NSMutableDictionary removeObjectForKey:](self->_uuidMap, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k));
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v22);
    }

  }
}

uint64_t __35__NWStatsEntityMapCache_pruneCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "expiryTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expiryTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)setEntry:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NWStatsEntityMapCacheEntry *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidMap, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      NStatGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidMap, "objectForKeyedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543874;
        v16 = v7;
        v17 = 2114;
        v18 = v10;
        v19 = 2114;
        v20 = v6;
        _os_log_impl(&dword_211429000, v9, OS_LOG_TYPE_ERROR, "Attempted overwrite of entry for UUID %{public}@, was %{public}@ new %{public}@", (uint8_t *)&v15, 0x20u);

      }
    }
    v11 = objc_alloc_init(NWStatsEntityMapCacheEntry);
    -[NWStatsEntityMapCacheEntry setEntityName:](v11, "setEntityName:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = 24;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v12 = 32;
      if ((isKindOfClass & 1) != 0)
        v12 = 24;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", *(double *)((char *)&self->super.isa + v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsEntityMapCacheEntry setExpiryTime:](v11, "setExpiryTime:", v14);

    if (-[NSMutableDictionary count](self->_uuidMap, "count") > (unint64_t)self->_capacityLimit)
      -[NWStatsEntityMapCache pruneCache](self, "pruneCache");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uuidMap, "setObject:forKeyedSubscript:", v11, v7);
  }
  else
  {
    NStatGetLog();
    v11 = (NWStatsEntityMapCacheEntry *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_211429000, &v11->super, OS_LOG_TYPE_ERROR, "Attempted to setEntry other than to a string or NSNull", (uint8_t *)&v15, 2u);
    }
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("NWStatsEntityMapCache %@"), self->_uuidMap);
}

- (id)stateDictionary
{
  id v3;
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_uuidMap;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidMap, "objectForKeyedSubscript:", v10, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Cache"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("TimeNow"));

  return v3;
}

- (double)hitRetainTime
{
  return self->_hitRetainTime;
}

- (void)setHitRetainTime:(double)a3
{
  self->_hitRetainTime = a3;
}

- (double)missRetainTime
{
  return self->_missRetainTime;
}

- (void)setMissRetainTime:(double)a3
{
  self->_missRetainTime = a3;
}

- (unsigned)capacityLimit
{
  return self->_capacityLimit;
}

- (void)setCapacityLimit:(unsigned int)a3
{
  self->_capacityLimit = a3;
}

- (unsigned)pruneSize
{
  return self->_pruneSize;
}

- (void)setPruneSize:(unsigned int)a3
{
  self->_pruneSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidMap, 0);
}

@end
