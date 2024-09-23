@implementation COClusterRoleMonitor

- (COClusterRoleMonitor)initWithConnectionProvider:(id)a3 cluster:(id)a4
{
  id v7;
  id v8;
  COClusterRoleMonitor *v9;
  COClusterRoleMonitor *v10;
  uint64_t v11;
  id cluster;
  uint64_t v13;
  NSArray *memberObservers;
  uint64_t v15;
  NSArray *roleObservers;
  uint64_t v17;
  NSArray *snapshotObservers;
  NSObject *v19;
  id v21;
  objc_class *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  COClusterRoleMonitor *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)COClusterRoleMonitor;
  v9 = -[COClusterRoleMonitor init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_provider, a3);
    v11 = objc_msgSend(v8, "copy");
    cluster = v10->_cluster;
    v10->_cluster = (id)v11;

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    memberObservers = v10->_memberObservers;
    v10->_memberObservers = (NSArray *)v13;

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    roleObservers = v10->_roleObservers;
    v10->_roleObservers = (NSArray *)v15;

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    snapshotObservers = v10->_snapshotObservers;
    v10->_snapshotObservers = (NSArray *)v17;

    COLogForCategory(2);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v21 = v10->_cluster;
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v26 = v10;
      v27 = 2112;
      v28 = v21;
      v29 = 2112;
      v30 = v23;
      _os_log_debug_impl(&dword_21214B000, v19, OS_LOG_TYPE_DEBUG, "%p role monitor created for Cluster(%@) with %@ provider", buf, 0x20u);

    }
  }

  return v10;
}

- (COClusterRoleMonitor)initWithCluster:(id)a3
{
  void *v4;
  _COClusterRoleMonitorConnectionProvider *v5;
  COClusterRoleMonitor *v6;

  +[COCluster _clusterForCluster:](COCluster, "_clusterForCluster:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(_COClusterRoleMonitorConnectionProvider);
  v6 = -[COClusterRoleMonitor initWithConnectionProvider:cluster:](self, "initWithConnectionProvider:cluster:", v5, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__COClusterRoleMonitor_dealloc__block_invoke;
  v4[3] = &unk_24CD3EFE8;
  v4[4] = self;
  -[COClusterRoleMonitor _withLock:](self, "_withLock:", v4);
  v3.receiver = self;
  v3.super_class = (Class)COClusterRoleMonitor;
  -[COClusterRoleMonitor dealloc](&v3, sel_dealloc);
}

void __31__COClusterRoleMonitor_dealloc__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "lastConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "co_originalInterruptionHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterruptionHandler:", v1);

  objc_msgSend(v3, "co_originalInvalidationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", v2);

  objc_msgSend(v3, "invalidate");
}

- (id)addObserverForMember:(id)a3 toDispatchQueue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  _COClusterRoleMonitorMemberObserver *v11;
  void *v12;
  _COClusterRoleMonitorMemberObserver *v13;
  _COClusterRoleMonitorMemberObserver *v14;
  _COClusterRoleMonitorMemberObserver *v15;
  _COClusterRoleMonitorMemberObserver *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  COClusterRoleMonitor *v22;
  _COClusterRoleMonitorMemberObserver *v23;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [_COClusterRoleMonitorMemberObserver alloc];
  -[COClusterRoleMonitor cluster](self, "cluster");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_COClusterRoleMonitorMemberObserver initWithMember:inCluster:queue:block:](v11, "initWithMember:inCluster:queue:block:", v10, v12, v9, v8);

  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __67__COClusterRoleMonitor_addObserverForMember_toDispatchQueue_block___block_invoke;
  v21 = &unk_24CD3EF20;
  v22 = self;
  v14 = v13;
  v23 = v14;
  -[COClusterRoleMonitor _withLock:](self, "_withLock:", &v18);
  -[COClusterRoleMonitor _registerMemberObserver:](self, "_registerMemberObserver:", v10, v18, v19, v20, v21, v22);

  v15 = v23;
  v16 = v14;

  return v16;
}

void __67__COClusterRoleMonitor_addObserverForMember_toDispatchQueue_block___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "memberObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setMemberObservers:", v3);
}

- (void)removeObserverForMember:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__COClusterRoleMonitor_removeObserverForMember___block_invoke;
  v7[3] = &unk_24CD404F0;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[COClusterRoleMonitor _withLock:](self, "_withLock:", v7);
  if (!v11[3])
  {
    objc_msgSend(v5, "member");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[COClusterRoleMonitor _unregisterMemberObserver:](self, "_unregisterMemberObserver:", v6);

  }
  _Block_object_dispose(&v10, 8);

}

void __48__COClusterRoleMonitor_removeObserverForMember___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "memberObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", *(_QWORD *)(a1 + 40));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(v5, "removeObjectAtIndex:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setMemberObservers:", v5);

    v2 = v5;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "member", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "member");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (v14)
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (id)addObserverForRole:(id)a3 toDispatchQueue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  _COClusterRoleMonitorRoleObserver *v11;
  void *v12;
  _COClusterRoleMonitorRoleObserver *v13;
  _COClusterRoleMonitorRoleObserver *v14;
  _COClusterRoleMonitorRoleObserver *v15;
  _COClusterRoleMonitorRoleObserver *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  COClusterRoleMonitor *v22;
  _COClusterRoleMonitorRoleObserver *v23;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [_COClusterRoleMonitorRoleObserver alloc];
  -[COClusterRoleMonitor cluster](self, "cluster");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_COClusterRoleMonitorRoleObserver initWithRole:inCluster:queue:block:](v11, "initWithRole:inCluster:queue:block:", v10, v12, v9, v8);

  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __65__COClusterRoleMonitor_addObserverForRole_toDispatchQueue_block___block_invoke;
  v21 = &unk_24CD3EF20;
  v22 = self;
  v14 = v13;
  v23 = v14;
  -[COClusterRoleMonitor _withLock:](self, "_withLock:", &v18);
  -[COClusterRoleMonitor _registerRoleObserver:](self, "_registerRoleObserver:", v10, v18, v19, v20, v21, v22);

  v15 = v23;
  v16 = v14;

  return v16;
}

void __65__COClusterRoleMonitor_addObserverForRole_toDispatchQueue_block___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "roleObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setRoleObservers:", v3);
}

- (void)removeObserverForRole:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  COClusterRoleMonitor *v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    objc_msgSend(v4, "role");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __46__COClusterRoleMonitor_removeObserverForRole___block_invoke;
    v10 = &unk_24CD3ED88;
    v11 = self;
    v12 = v4;
    v6 = v5;
    v13 = v6;
    v14 = &v15;
    -[COClusterRoleMonitor _withLock:](self, "_withLock:", &v7);
    if (!v16[3])
      -[COClusterRoleMonitor _unregisterRoleObserver:](self, "_unregisterRoleObserver:", v6, v7, v8, v9, v10, v11, v12);

    _Block_object_dispose(&v15, 8);
  }

}

void __46__COClusterRoleMonitor_removeObserverForRole___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "roleObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", *(_QWORD *)(a1 + 40));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(v5, "removeObjectAtIndex:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setRoleObservers:", v5);

    v2 = v5;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "role", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = objc_msgSend(v11, "isEqual:", v12);

        if ((_DWORD)v11)
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)addObserverForSnapshotsToDispatchQueue:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  _COClusterRoleMonitorSnapshotObserver *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  v8 = [_COClusterRoleMonitorSnapshotObserver alloc];
  -[COClusterRoleMonitor cluster](self, "cluster");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_COClusterRoleMonitorSnapshotObserver initInCluster:queue:block:](v8, "initInCluster:queue:block:", v9, v6, v7);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__COClusterRoleMonitor_addObserverForSnapshotsToDispatchQueue_block___block_invoke;
  v15[3] = &unk_24CD404F0;
  v15[4] = self;
  v11 = v10;
  v16 = v11;
  v17 = &v18;
  -[COClusterRoleMonitor _withLock:](self, "_withLock:", v15);
  if (v19[3] == 1)
    -[COClusterRoleMonitor _registerSnapshotObserver](self, "_registerSnapshotObserver");
  v12 = v16;
  v13 = v11;

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __69__COClusterRoleMonitor_addObserverForSnapshotsToDispatchQueue_block___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "snapshotObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setSnapshotObservers:", v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "count");

}

- (void)removeObserverForSnapshots:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__COClusterRoleMonitor_removeObserverForSnapshots___block_invoke;
  v6[3] = &unk_24CD404F0;
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  v8 = &v9;
  -[COClusterRoleMonitor _withLock:](self, "_withLock:", v6);
  if (!v10[3])
    -[COClusterRoleMonitor _unregisterSnapshotObserver](self, "_unregisterSnapshotObserver");

  _Block_object_dispose(&v9, 8);
}

void __51__COClusterRoleMonitor_removeObserverForSnapshots___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "snapshotObservers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v6, "indexOfObject:", *(_QWORD *)(a1 + 40));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v6;
  }
  else
  {
    v4 = v2;
    v5 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v5, "removeObjectAtIndex:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setSnapshotObservers:", v5);

    v3 = v5;
  }
  v7 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "count");

}

- (void)roleOfMember:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t v25[128];
  uint8_t buf[4];
  COClusterRoleMonitor *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  COLogForCategory(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v27 = self;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p notified of Role(%@) change for Member(%@)", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __59__COClusterRoleMonitor_roleOfMember_inCluster_didChangeTo___block_invoke;
  v22[3] = &unk_24CD3F310;
  v22[4] = self;
  v11 = v7;
  v23 = v11;
  v12 = v10;
  v24 = v12;
  -[COClusterRoleMonitor _withLock:](self, "_withLock:", v22);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "notify:", v8, (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v15);
  }

}

void __59__COClusterRoleMonitor_roleOfMember_inCluster_didChangeTo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "memberObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "member");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

        if ((_DWORD)v8)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)membersWithRole:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t v25[128];
  uint8_t buf[4];
  COClusterRoleMonitor *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  COLogForCategory(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v27 = self;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p notified of Member(%@) change for Role(%@)", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __62__COClusterRoleMonitor_membersWithRole_inCluster_didChangeTo___block_invoke;
  v22[3] = &unk_24CD3F310;
  v22[4] = self;
  v11 = v7;
  v23 = v11;
  v12 = v10;
  v24 = v12;
  -[COClusterRoleMonitor _withLock:](self, "_withLock:", v22);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "notify:", v8, (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v15);
  }

}

void __62__COClusterRoleMonitor_membersWithRole_inCluster_didChangeTo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "roleObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "role");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

        if ((_DWORD)v8)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)snapshotOfCluster:(id)a3 didChangeTo:(id)a4
{
  uint64_t (*v6)(uint64_t, uint64_t);
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[6];
  uint8_t v18[128];
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v7 = a4;
  COLogForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    v20 = v6;
    _os_log_impl(&dword_21214B000, v8, OS_LOG_TYPE_DEFAULT, "%p notified of Snapshot(%@) change in Cluster(%@)", buf, 0x20u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v20 = __Block_byref_object_copy__10;
  v21 = __Block_byref_object_dispose__10;
  v22 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __54__COClusterRoleMonitor_snapshotOfCluster_didChangeTo___block_invoke;
  v17[3] = &unk_24CD3EEA8;
  v17[4] = self;
  v17[5] = buf;
  -[COClusterRoleMonitor _withLock:](self, "_withLock:", v17);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "notify:", v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

  _Block_object_dispose(buf, 8);
}

void __54__COClusterRoleMonitor_snapshotOfCluster_didChangeTo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "snapshotObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_serviceConnection
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  COClusterRoleMonitor *v10;

  -[COClusterRoleMonitor provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clusterRoleMonitorServiceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__COClusterRoleMonitor__serviceConnection__block_invoke;
  v8[3] = &unk_24CD3EF20;
  v5 = v4;
  v9 = v5;
  v10 = self;
  -[COClusterRoleMonitor _withLock:](self, "_withLock:", v8);
  v6 = v5;

  return v6;
}

void __42__COClusterRoleMonitor__serviceConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  COClusterRoleMonitorClientInterfaceMediator *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  COClusterRoleMonitorClientInterfaceMediator *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id location[2];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((v2 & 1) == 0)
  {
    v4 = (void *)MEMORY[0x24BDD1990];
    v5 = &unk_254B4CB38;
    objc_msgSend(v4, "interfaceWithProtocol:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:");
    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:");
    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_roleOfMember_inCluster_didChangeTo_, 1, 0);

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_membersWithRole_inCluster_didChangeTo_, 1, 0);

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_snapshotOfCluster_didChangeTo_, 0, 0);

    v14 = -[COClusterRoleMonitorClientInterfaceMediator initWithClusterRoleMonitor:]([COClusterRoleMonitorClientInterfaceMediator alloc], "initWithClusterRoleMonitor:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setExportedInterface:", v6);
    v30 = v14;
    objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", v14);
    v15 = &unk_254B4FBB8;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_registerForRoleChangesOfMember_inCluster_, 1, 0);

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_unregisterForRoleChangesOfMember_inCluster_, 1, 0);

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_registerForMemberChangesWithRole_inCluster_, 1, 0);

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_unregisterForMemberChangesWithRole_inCluster_, 1, 0);

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_registerForSnapshotChangesInCluster_, 0, 0);

    +[COCluster _allowedClusterClasses](COCluster, "_allowedClusterClasses");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_unregisterForSnapshotChangesInCluster_, 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectInterface:", v16);
    objc_initWeak(location, *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "interruptionHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "invalidationHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "co_setOriginalInterruptionHandler:", v23);
    objc_msgSend(*(id *)(a1 + 32), "co_setOriginalInvalidationHandler:", v24);
    v25 = *(void **)(a1 + 32);
    v26 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __42__COClusterRoleMonitor__serviceConnection__block_invoke_2;
    v36[3] = &unk_24CD3F498;
    v27 = v23;
    v37 = v27;
    objc_copyWeak(&v38, location);
    objc_msgSend(v25, "setInterruptionHandler:", v36);
    v28 = *(void **)(a1 + 32);
    v33[0] = v26;
    v33[1] = 3221225472;
    v33[2] = __42__COClusterRoleMonitor__serviceConnection__block_invoke_90;
    v33[3] = &unk_24CD3F498;
    v29 = v24;
    v34 = v29;
    objc_copyWeak(&v35, location);
    objc_msgSend(v28, "setInvalidationHandler:", v33);
    objc_msgSend(*(id *)(a1 + 40), "setLastConnection:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "resume");
    objc_destroyWeak(&v35);

    objc_destroyWeak(&v38);
    objc_destroyWeak(location);

  }
}

void __42__COClusterRoleMonitor__serviceConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__COClusterRoleMonitor__serviceConnection__block_invoke_2_cold_1((uint64_t)WeakRetained, v4);

    objc_msgSend(WeakRetained, "_lostConnectionToService");
  }

}

void __42__COClusterRoleMonitor__serviceConnection__block_invoke_90(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = WeakRetained;
      _os_log_impl(&dword_21214B000, v4, OS_LOG_TYPE_DEFAULT, "%p connection to Role service invalidated", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(WeakRetained, "_lostConnectionToService");
  }

}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[COClusterRoleMonitor _serviceConnection](self, "_serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_lostConnectionToService
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  COClusterRoleMonitor *v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __48__COClusterRoleMonitor__lostConnectionToService__block_invoke;
  v24[3] = &unk_24CD3ED88;
  v24[4] = self;
  v5 = v3;
  v25 = v5;
  v6 = v4;
  v26 = v6;
  v27 = &v28;
  -[COClusterRoleMonitor _withLock:](self, "_withLock:", v24);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        -[COClusterRoleMonitor _registerMemberObserver:](self, "_registerMemberObserver:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v34, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        -[COClusterRoleMonitor _registerRoleObserver:](self, "_registerRoleObserver:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v34, 16);
    }
    while (v12);
  }

  if (*((_BYTE *)v29 + 24))
    -[COClusterRoleMonitor _registerSnapshotObserver](self, "_registerSnapshotObserver");
  COLogForCategory(2);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = self;
    _os_log_impl(&dword_21214B000, v15, OS_LOG_TYPE_DEFAULT, "%p done restoring state after lost connection to service", buf, 0xCu);
  }

  _Block_object_dispose(&v28, 8);
}

void __48__COClusterRoleMonitor__lostConnectionToService__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "memberObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v6), "member");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v4);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "roleObservers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "role");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "snapshotObservers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v16, "count") != 0;

}

- (void)_registerMemberObserver:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  COClusterRoleMonitor *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__COClusterRoleMonitor__registerMemberObserver___block_invoke;
  v9[3] = &unk_24CD3FF70;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  -[COClusterRoleMonitor _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  COLogForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v14 = self;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p registering observer for Member(%@)", buf, 0x16u);
  }

  -[COClusterRoleMonitor cluster](self, "cluster");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForRoleChangesOfMember:inCluster:", v5, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __48__COClusterRoleMonitor__registerMemberObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 134218498;
      v8 = WeakRetained;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_21214B000, v5, OS_LOG_TYPE_ERROR, "%p failed to register observer for Member(%@): %@", (uint8_t *)&v7, 0x20u);
    }

  }
}

- (void)_unregisterMemberObserver:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  COClusterRoleMonitor *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__COClusterRoleMonitor__unregisterMemberObserver___block_invoke;
  v9[3] = &unk_24CD3FF70;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  -[COClusterRoleMonitor _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  COLogForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v14 = self;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p unregistering observer for Member(%@)", buf, 0x16u);
  }

  -[COClusterRoleMonitor cluster](self, "cluster");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterForRoleChangesOfMember:inCluster:", v5, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __50__COClusterRoleMonitor__unregisterMemberObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 134218498;
      v8 = WeakRetained;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_21214B000, v5, OS_LOG_TYPE_ERROR, "%p failed to unregister observer for Member(%@): %@", (uint8_t *)&v7, 0x20u);
    }

  }
}

- (void)_registerRoleObserver:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  COClusterRoleMonitor *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__COClusterRoleMonitor__registerRoleObserver___block_invoke;
  v9[3] = &unk_24CD3FF70;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  -[COClusterRoleMonitor _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  COLogForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v14 = self;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p registering observer for Role(%@)", buf, 0x16u);
  }

  -[COClusterRoleMonitor cluster](self, "cluster");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMemberChangesWithRole:inCluster:", v5, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __46__COClusterRoleMonitor__registerRoleObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 134218498;
      v8 = WeakRetained;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_21214B000, v5, OS_LOG_TYPE_ERROR, "%p failed to register observer for Role(%@): %@", (uint8_t *)&v7, 0x20u);
    }

  }
}

- (void)_unregisterRoleObserver:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  COClusterRoleMonitor *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__COClusterRoleMonitor__unregisterRoleObserver___block_invoke;
  v9[3] = &unk_24CD3FF70;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  -[COClusterRoleMonitor _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  COLogForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v14 = self;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_21214B000, v7, OS_LOG_TYPE_DEFAULT, "%p unregistering observer for Role(%@)", buf, 0x16u);
  }

  -[COClusterRoleMonitor cluster](self, "cluster");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterForMemberChangesWithRole:inCluster:", v5, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __48__COClusterRoleMonitor__unregisterRoleObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 134218498;
      v8 = WeakRetained;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_21214B000, v5, OS_LOG_TYPE_ERROR, "%p failed to unregister observer for Role(%@): %@", (uint8_t *)&v7, 0x20u);
    }

  }
}

- (void)_registerSnapshotObserver
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;
  uint8_t buf[4];
  COClusterRoleMonitor *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __49__COClusterRoleMonitor__registerSnapshotObserver__block_invoke;
  v9 = &unk_24CD3F2E8;
  objc_copyWeak(&v10, &location);
  -[COClusterRoleMonitor _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  COLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = self;
    _os_log_impl(&dword_21214B000, v4, OS_LOG_TYPE_DEFAULT, "%p registering Snapshot observer", buf, 0xCu);
  }

  -[COClusterRoleMonitor cluster](self, "cluster", v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForSnapshotChangesInCluster:", v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __49__COClusterRoleMonitor__registerSnapshotObserver__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    COLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __49__COClusterRoleMonitor__registerSnapshotObserver__block_invoke_cold_1();

  }
}

- (void)_unregisterSnapshotObserver
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;
  uint8_t buf[4];
  COClusterRoleMonitor *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __51__COClusterRoleMonitor__unregisterSnapshotObserver__block_invoke;
  v9 = &unk_24CD3F2E8;
  objc_copyWeak(&v10, &location);
  -[COClusterRoleMonitor _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  COLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = self;
    _os_log_impl(&dword_21214B000, v4, OS_LOG_TYPE_DEFAULT, "%p unregistering Snapshot observer", buf, 0xCu);
  }

  -[COClusterRoleMonitor cluster](self, "cluster", v6, v7, v8, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterForSnapshotChangesInCluster:", v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __51__COClusterRoleMonitor__unregisterSnapshotObserver__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    COLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __51__COClusterRoleMonitor__unregisterSnapshotObserver__block_invoke_cold_1();

  }
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)cluster
{
  return self->_cluster;
}

- (NSXPCConnection)lastConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_lastConnection);
}

- (void)setLastConnection:(id)a3
{
  objc_storeWeak((id *)&self->_lastConnection, a3);
}

- (COClusterRoleMonitorConnectionProvider)provider
{
  return self->_provider;
}

- (NSArray)memberObservers
{
  return self->_memberObservers;
}

- (void)setMemberObservers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)roleObservers
{
  return self->_roleObservers;
}

- (void)setRoleObservers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)snapshotObservers
{
  return self->_snapshotObservers;
}

- (void)setSnapshotObservers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotObservers, 0);
  objc_storeStrong((id *)&self->_roleObservers, 0);
  objc_storeStrong((id *)&self->_memberObservers, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_destroyWeak((id *)&self->_lastConnection);
  objc_storeStrong(&self->_cluster, 0);
}

void __42__COClusterRoleMonitor__serviceConnection__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_21214B000, a2, OS_LOG_TYPE_ERROR, "%p connection to Role service interrupted", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __49__COClusterRoleMonitor__registerSnapshotObserver__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to register Snapshot observer: %@");
  OUTLINED_FUNCTION_1();
}

void __51__COClusterRoleMonitor__unregisterSnapshotObserver__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p failed to unregister Snapshot observer: %@");
  OUTLINED_FUNCTION_1();
}

@end
