@implementation ACDQueueDictionary

- (ACDQueueDictionary)init
{
  ACDQueueDictionary *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *allQueuesByID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACDQueueDictionary;
  v2 = -[ACDQueueDictionary init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    allQueuesByID = v2->_allQueuesByID;
    v2->_allQueuesByID = v3;

  }
  return v2;
}

- (BOOL)isEmpty
{
  ACDQueueDictionary *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allKeys](v2->_allQueuesByID, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        if (!-[ACDQueueDictionary isQueueEmptyForKey:](v2, "isQueueEmptyForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  objc_sync_exit(v2);
  return v7;
}

- (BOOL)isQueueEmptyForKey:(id)a3
{
  id v4;
  ACDQueueDictionary *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_allQueuesByID, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 0;

  objc_sync_exit(v5);
  return v7;
}

- (void)addObject:(id)a3 toQueueForKey:(id)a4
{
  id v6;
  ACDQueueDictionary *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_allQueuesByID, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v9)
    objc_msgSend(v8, "addObject:", v9);
  -[NSMutableDictionary setObject:forKey:](v7->_allQueuesByID, "setObject:forKey:", v8, v6);

  objc_sync_exit(v7);
}

- (id)dequeueFirstObjectInQueueForKey:(id)a3
{
  id v4;
  ACDQueueDictionary *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_allQueuesByID, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "removeObjectAtIndex:", 0);
    -[NSMutableDictionary setObject:forKey:](v5->_allQueuesByID, "setObject:forKey:", v6, v4);
  }

  objc_sync_exit(v5);
  return v7;
}

- (id)firstObjectInQueueForKey:(id)a3
{
  id v4;
  ACDQueueDictionary *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_allQueuesByID, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (id)dequeueAllObjectsInQueueForKey:(id)a3
{
  id v4;
  ACDQueueDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_allQueuesByID, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[NSMutableDictionary removeObjectForKey:](v5->_allQueuesByID, "removeObjectForKey:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (id)keyForRandomQueue
{
  ACDQueueDictionary *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allKeys](v2->_allQueuesByID, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v4;
}

- (id)description
{
  return (id)-[NSMutableDictionary description](self->_allQueuesByID, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allQueuesByID, 0);
}

@end
