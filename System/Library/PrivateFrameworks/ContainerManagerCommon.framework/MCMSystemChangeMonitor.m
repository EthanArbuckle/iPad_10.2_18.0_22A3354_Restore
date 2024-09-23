@implementation MCMSystemChangeMonitor

- (MCMSystemChangeMonitor)initWithQueue:(id)a3 flushables:(id)a4
{
  id v7;
  id v8;
  MCMSystemChangeMonitor *v9;
  MCMSystemChangeMonitor *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCMSystemChangeMonitor;
  v9 = -[MCMSystemChangeMonitor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_flushables, a4);
  }

  return v10;
}

- (void)userIdentityCache:(id)a3 didInvalidateUserIdentity:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[MCMSystemChangeMonitor queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MCMSystemChangeMonitor_userIdentityCache_didInvalidateUserIdentity___block_invoke;
  block[3] = &unk_1E8CB6318;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)userIdentityCache:(id)a3 didAddUserIdentity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MCMSystemChangeMonitor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__MCMSystemChangeMonitor_userIdentityCache_didAddUserIdentity___block_invoke;
  v11[3] = &unk_1E8CB5E98;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSArray)flushables
{
  return self->_flushables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushables, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __63__MCMSystemChangeMonitor_userIdentityCache_didAddUserIdentity___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "flushables");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EFBCBFE0))
          objc_msgSend(v7, "didAddUserIdentity:", *(_QWORD *)(a1 + 40));
        else
          objc_msgSend(v7, "flush");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 48), "libraryRepairForUserIdentity:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = objc_msgSend(v8, "createPathsIfNecessaryWithError:", &v13);
  v10 = v13;
  if ((v9 & 1) == 0)
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2114;
      v17 = v10;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Failed creating working directories for %@: %{public}@", buf, 0x16u);
    }

  }
}

void __70__MCMSystemChangeMonitor_userIdentityCache_didInvalidateUserIdentity___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "flushables");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EFBCBFE0))
          objc_msgSend(v7, "didInvalidateUserIdentity:", *(_QWORD *)(a1 + 40));
        else
          objc_msgSend(v7, "flush");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v4);
  }

}

@end
