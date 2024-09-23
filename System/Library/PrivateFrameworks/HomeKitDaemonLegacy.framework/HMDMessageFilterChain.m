@implementation HMDMessageFilterChain

- (BOOL)acceptMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HMDMessageFilterChain filters](self, "filters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v10)
  {
    v11 = v10;
    v26 = a4;
    v12 = 0;
    v13 = *(_QWORD *)v29;
    while (2)
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
        v27 = v15;
        v17 = objc_msgSend(v16, "acceptMessage:target:errorReason:", v6, v8, &v27, v26);
        v12 = v27;

        if ((v17 & 1) == 0)
        {
          v19 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v33 = v21;
            v34 = 2112;
            v35 = v22;
            v36 = 2112;
            v37 = v23;
            v38 = 2112;
            v39 = v12;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@%@ Message %@ was rejected due to reason: %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v19);
          v18 = 0;
          goto LABEL_13;
        }
        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v11)
        continue;
      break;
    }
    v18 = 1;
LABEL_13:
    a4 = v26;
  }
  else
  {
    v12 = 0;
    v18 = 1;
  }

  if (a4)
  {
    if (v18)
      v24 = 0;
    else
      v24 = v12;
    *a4 = objc_retainAutorelease(v24);
  }

  return v18;
}

- (NSArray)filters
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_filters, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (HMDMessageFilterChain)init
{
  HMDMessageFilterChain *v2;
  uint64_t v3;
  NSMutableArray *filters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDMessageFilterChain;
  v2 = -[HMDMessageFilterChain init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    filters = v2->_filters;
    v2->_filters = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addMessageFilter:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObject:](self->_filters, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeMessageFilter:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_filters, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)shouldCloudSyncData
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDMessageFilterChain filters](self, "filters", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "shouldCloudSyncData") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)resetConfiguration:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  id v7;
  os_unfair_lock_s *p_lock;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_filters;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "resetConfiguration");
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_lock);
  if (v6 && v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__HMDMessageFilterChain_resetConfiguration_completionHandler___block_invoke;
    block[3] = &unk_1E89C0870;
    v14 = v7;
    dispatch_async(v6, block);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
}

uint64_t __62__HMDMessageFilterChain_resetConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
