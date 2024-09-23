@implementation ENGroupContextCoreDataCache

- (id)initOnDiskCacheWithContainerURL:(id)a3 Queue:(id)a4
{
  return -[ENGroupContextCoreDataCache initWithType:containerURL:queue:](self, "initWithType:containerURL:queue:", 0, a3, a4);
}

- (id)initInMemoryCacheWithQueue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  ENGroupContextCoreDataCache *v8;

  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = a3;
  NSHomeDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ENGroupContextCoreDataCache initWithType:containerURL:queue:](self, "initWithType:containerURL:queue:", 1, v7, v5);

  return v8;
}

- (ENGroupContextCoreDataCache)initWithType:(unint64_t)a3 containerURL:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  ENGroupContextCoreDataCache *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSPersistentContainer *container;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD *v23;
  void *v24;
  os_activity_scope_state_s v26;
  NSObject *v27;
  objc_super v28;
  void *v29;
  uint8_t buf[4];
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)ENGroupContextCoreDataCache;
  v10 = -[ENGroupContextCoreDataCache init](&v28, sel_init);
  if (v10)
  {
    v26.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
    v27 = _os_activity_create(&dword_1D4CF8000, "Create ENGroupContextCoreDataCache", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v26.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
    os_activity_scope_enter(v27, &v26);
    objc_storeStrong((id *)&v10->_queue, a5);
    v11 = (void *)MEMORY[0x1E0C97B98];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mergedModelFromBundles:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97BC8], "persistentContainerWithName:managedObjectModel:", CFSTR("ENGroupContext"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    container = v10->_container;
    v10->_container = (NSPersistentContainer *)v15;

    -[NSPersistentContainer name](v10->_container, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLByAppendingPathExtension:", CFSTR("sqlite"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97C08], "persistentStoreDescriptionWithURL:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENLog groupContext](ENLog, "groupContext");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v19;
      _os_log_impl(&dword_1D4CF8000, v21, OS_LOG_TYPE_DEFAULT, "!setState url=%@", buf, 0xCu);
    }

    if (a3 == 1)
    {
      +[ENLog groupContext](ENLog, "groupContext");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = CFSTR("inMemory");
        _os_log_impl(&dword_1D4CF8000, v22, OS_LOG_TYPE_DEFAULT, "!setState db-type=%@", buf, 0xCu);
      }
      v23 = (_QWORD *)MEMORY[0x1E0C97860];
    }
    else
    {
      if (a3)
      {
LABEL_13:
        v29 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSPersistentContainer setPersistentStoreDescriptions:](v10->_container, "setPersistentStoreDescriptions:", v24);

        os_activity_scope_leave(&v26);
        cut_arc_os_release();

        goto LABEL_14;
      }
      +[ENLog groupContext](ENLog, "groupContext");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = CFSTR("SQLite");
        _os_log_impl(&dword_1D4CF8000, v22, OS_LOG_TYPE_DEFAULT, "!setState db-type=%@", buf, 0xCu);
      }
      v23 = (_QWORD *)MEMORY[0x1E0C979E8];
    }

    objc_msgSend(v20, "setType:", *v23);
    goto LABEL_13;
  }
LABEL_14:

  return v10;
}

- (void)loadWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  os_activity_scope_state_s state;
  NSObject *v10;

  v4 = a3;
  v10 = _os_activity_create(&dword_1D4CF8000, "Loading Database", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v10, &state);
  -[ENGroupContextCoreDataCache container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D4CF991C;
  v7[3] = &unk_1E987B118;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "loadPersistentStoresWithCompletionHandler:", v7);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)_groupFromCypher:(id)a3 groupID:(id)a4 applicationData:(id)a5 context:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[ENGroupContextCoreDataCache queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4CF9BBC;
  block[3] = &unk_1E987B168;
  v24 = v15;
  v25 = v12;
  v26 = v14;
  v27 = v13;
  v28 = v16;
  v18 = v16;
  v19 = v13;
  v20 = v14;
  v21 = v12;
  v22 = v15;
  dispatch_async(v17, block);

}

- (int64_t)middlewareCacheCostForContext:(id)a3
{
  return 300;
}

- (void)groupContext:(id)a3 cacheGroup:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  ENGroupContextCoreDataCache *v16;
  id v17;
  os_activity_scope_state_s state;
  NSObject *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = _os_activity_create(&dword_1D4CF8000, "Saving group -- Start", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v19, &state);
  -[ENGroupContextCoreDataCache container](self, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D4CF9E80;
  v14[3] = &unk_1E987B1B8;
  v12 = v9;
  v15 = v12;
  v16 = self;
  v13 = v10;
  v17 = v13;
  objc_msgSend(v11, "performBackgroundTask:", v14);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)groupContext:(id)a3 cachedGroupWithID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ENGroupContextCoreDataCache *v17;
  id v18;
  id v19;
  os_activity_scope_state_s state;
  NSObject *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = _os_activity_create(&dword_1D4CF8000, "Fetching by groupID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v21, &state);
  -[ENGroupContextCoreDataCache container](self, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D4CFA17C;
  v15[3] = &unk_1E987B208;
  v12 = v9;
  v16 = v12;
  v17 = self;
  v13 = v8;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  objc_msgSend(v11, "performBackgroundTask:", v15);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)groupContext:(id)a3 latestCachedGroupWithStableID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ENGroupContextCoreDataCache *v17;
  id v18;
  id v19;
  os_activity_scope_state_s state;
  NSObject *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = _os_activity_create(&dword_1D4CF8000, "Fetching by Stable Group ID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v21, &state);
  -[ENGroupContextCoreDataCache container](self, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D4CFA6D8;
  v15[3] = &unk_1E987B208;
  v12 = v9;
  v16 = v12;
  v17 = self;
  v13 = v8;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  objc_msgSend(v11, "performBackgroundTask:", v15);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)deleteAllKnownGroupsForGroupContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  os_activity_scope_state_s state;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  v13 = _os_activity_create(&dword_1D4CF8000, "Delete all known groups", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v13, &state);
  -[ENGroupContextCoreDataCache container](self, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D4CFACF8;
  v10[3] = &unk_1E987B230;
  v10[4] = self;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "performBackgroundTask:", v10);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)deleteCachedValueForForGroupContext:(id)a3 withGroupID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ENGroupContextCoreDataCache *v17;
  id v18;
  os_activity_scope_state_s state;
  NSObject *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v20 = _os_activity_create(&dword_1D4CF8000, "Delete cached group", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v20, &state);
  +[ENLog groupContext](ENLog, "groupContext");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v9;
    _os_log_impl(&dword_1D4CF8000, v11, OS_LOG_TYPE_DEFAULT, "!setState groupID=%@", buf, 0xCu);
  }

  -[ENGroupContextCoreDataCache container](self, "container");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D4CFB1A0;
  v15[3] = &unk_1E987B1B8;
  v13 = v9;
  v16 = v13;
  v17 = self;
  v14 = v10;
  v18 = v14;
  objc_msgSend(v12, "performBackgroundTask:", v15);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)groupContext:(id)a3 fetchAllKnownGroups:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  os_activity_scope_state_s state;
  NSObject *v15;

  v6 = a3;
  v7 = a4;
  v15 = _os_activity_create(&dword_1D4CF8000, "Fetch all known groups", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v15, &state);
  -[ENGroupContextCoreDataCache container](self, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D4CFB5DC;
  v11[3] = &unk_1E987B280;
  v11[4] = self;
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v12 = v10;
  objc_msgSend(v8, "performBackgroundTask:", v11);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
