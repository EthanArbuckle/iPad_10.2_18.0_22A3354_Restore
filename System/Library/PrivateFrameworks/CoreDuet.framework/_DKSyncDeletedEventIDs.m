@implementation _DKSyncDeletedEventIDs

- (_DKSyncDeletedEventIDs)init
{
  _DKSyncDeletedEventIDs *v2;
  uint64_t v3;
  NSMutableDictionary *deletedEventIDsBySourceDeviceID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DKSyncDeletedEventIDs;
  v2 = -[_DKSyncDeletedEventIDs init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    deletedEventIDsBySourceDeviceID = v2->_deletedEventIDsBySourceDeviceID;
    v2->_deletedEventIDsBySourceDeviceID = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (uint64_t)count
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "count");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)sourceDeviceIDs
{
  if (a1)
  {
    objc_msgSend(a1[1], "allKeys");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)deletedEventIDsForSourceDeviceID:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[1], "objectForKeyedSubscript:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)addDeletedEventID:(void *)a3 forSourceDeviceID:
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", v6, v5);
    }
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedEventIDsBySourceDeviceID, 0);
}

@end
