@implementation ENGroupContextInMemoryCache

- (ENGroupContextInMemoryCache)initWithQueue:(id)a3
{
  id v5;
  ENGroupContextInMemoryCache *v6;
  ENGroupContextInMemoryCache *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *groupIDtoGroup;
  NSMutableDictionary *v10;
  NSMutableDictionary *latestStableGroupIDToGroup;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ENGroupContextInMemoryCache;
  v6 = -[ENGroupContextInMemoryCache init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    groupIDtoGroup = v7->_groupIDtoGroup;
    v7->_groupIDtoGroup = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    latestStableGroupIDToGroup = v7->_latestStableGroupIDToGroup;
    v7->_latestStableGroupIDToGroup = v10;

  }
  return v7;
}

- (int64_t)middlewareCacheCostForContext:(id)a3
{
  return 100;
}

- (void)groupContext:(id)a3 cacheGroup:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  unint64_t v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  +[ENLog groupContext](ENLog, "groupContext");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v34 = v7;
    _os_log_impl(&dword_1D4CF8000, v9, OS_LOG_TYPE_INFO, "CacheGroup - BEGIN {group: %{private}@}", buf, 0xCu);
  }

  -[ENGroupContextInMemoryCache latestStableGroupIDToGroup](self, "latestStableGroupIDToGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stableGroupID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[ENLog groupContext](ENLog, "groupContext");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (!v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4CF8000, v14, OS_LOG_TYPE_INFO, "CacheGroup - group not found - caching", buf, 2u);
    }

    -[ENGroupContextInMemoryCache latestStableGroupIDToGroup](self, "latestStableGroupIDToGroup");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupID");
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject stableGroupID](v21, "stableGroupID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v7, v22);
    goto LABEL_25;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4CF8000, v14, OS_LOG_TYPE_INFO, "CacheGroup - have existing stableGroupID - Testing order", buf, 2u);
  }

  v32 = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(v13, "groupID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v18 = objc_msgSend(v16, "compare:withResult:error:", v17, &v32, &v31);
  v19 = v31;

  if (v18)
  {
    if (v32 == 1)
    {
      +[ENLog groupContext](ENLog, "groupContext");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4CF8000, v21, OS_LOG_TYPE_DEFAULT, "CacheGroup - group is older - Ignoring", buf, 2u);
      }
      goto LABEL_26;
    }
    if (v32)
    {
      if (v32 != -1)
        goto LABEL_27;
      +[ENLog groupContext](ENLog, "groupContext");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4CF8000, v20, OS_LOG_TYPE_INFO, "CacheGroup - group is newer - Caching", buf, 2u);
      }

      -[ENGroupContextInMemoryCache latestStableGroupIDToGroup](self, "latestStableGroupIDToGroup");
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "groupID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stableGroupID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v21;
      v25 = v7;
    }
    else
    {
      +[ENLog groupContext](ENLog, "groupContext");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4CF8000, v27, OS_LOG_TYPE_DEFAULT, "CacheGroup - group is same - Clearing", buf, 2u);
      }

      -[ENGroupContextInMemoryCache latestStableGroupIDToGroup](self, "latestStableGroupIDToGroup");
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "groupID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stableGroupID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v21;
      v25 = 0;
    }
    -[NSObject setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v25, v23);

LABEL_25:
LABEL_26:

    goto LABEL_27;
  }
  +[ENLog groupContext](ENLog, "groupContext");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138478339;
    v34 = v13;
    v35 = 2113;
    v36 = v7;
    v37 = 2113;
    v38 = v19;
    _os_log_fault_impl(&dword_1D4CF8000, v26, OS_LOG_TYPE_FAULT, "CacheGroup - could not compare groups - Fail {existingLatestGroup: %{private}@, group: %{private}@, error: %{private}@}", buf, 0x20u);
  }

  v8[2](v8);
LABEL_27:

  -[ENGroupContextInMemoryCache groupIDtoGroup](self, "groupIDtoGroup");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v7, v29);

  +[ENLog groupContext](ENLog, "groupContext");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4CF8000, v30, OS_LOG_TYPE_INFO, "CacheGroup  - END", buf, 2u);
  }

  v8[2](v8);
}

- (void)deleteAllKnownGroupsForGroupContext:(id)a3 completion:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a4;
  -[ENGroupContextInMemoryCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ENGroupContextInMemoryCache latestStableGroupIDToGroup](self, "latestStableGroupIDToGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[ENGroupContextInMemoryCache groupIDtoGroup](self, "groupIDtoGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  v8[2]();
}

- (void)deleteCachedValueForForGroupContext:(id)a3 withGroupID:(id)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(void);

  v12 = (void (**)(void))a5;
  v7 = a4;
  -[ENGroupContextInMemoryCache queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[ENGroupContextInMemoryCache latestStableGroupIDToGroup](self, "latestStableGroupIDToGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stableGroupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v10);

  -[ENGroupContextInMemoryCache groupIDtoGroup](self, "groupIDtoGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v7);

  v12[2]();
}

- (void)groupContext:(id)a3 cachedGroupWithID:(id)a4 completion:(id)a5
{
  void (**v7)(id, void *);
  id v8;
  NSObject *v9;
  void *v10;
  id v11;

  v7 = (void (**)(id, void *))a5;
  v8 = a4;
  -[ENGroupContextInMemoryCache queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[ENGroupContextInMemoryCache groupIDtoGroup](self, "groupIDtoGroup");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v10);
}

- (void)groupContext:(id)a3 latestCachedGroupWithStableID:(id)a4 completion:(id)a5
{
  void (**v7)(id, void *);
  id v8;
  NSObject *v9;
  void *v10;
  id v11;

  v7 = (void (**)(id, void *))a5;
  v8 = a4;
  -[ENGroupContextInMemoryCache queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[ENGroupContextInMemoryCache latestStableGroupIDToGroup](self, "latestStableGroupIDToGroup");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v10);
}

- (void)groupContext:(id)a3 fetchAllKnownGroups:(id)a4
{
  void (**v5)(id, void *);
  NSObject *v6;
  void *v7;
  id v8;

  v5 = (void (**)(id, void *))a4;
  -[ENGroupContextInMemoryCache queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[ENGroupContextInMemoryCache groupIDtoGroup](self, "groupIDtoGroup");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)groupIDtoGroup
{
  return self->_groupIDtoGroup;
}

- (void)setGroupIDtoGroup:(id)a3
{
  objc_storeStrong((id *)&self->_groupIDtoGroup, a3);
}

- (NSMutableDictionary)latestStableGroupIDToGroup
{
  return self->_latestStableGroupIDToGroup;
}

- (void)setLatestStableGroupIDToGroup:(id)a3
{
  objc_storeStrong((id *)&self->_latestStableGroupIDToGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestStableGroupIDToGroup, 0);
  objc_storeStrong((id *)&self->_groupIDtoGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
