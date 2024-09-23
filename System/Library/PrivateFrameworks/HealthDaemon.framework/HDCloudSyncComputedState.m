@implementation HDCloudSyncComputedState

- (HDCloudSyncComputedState)init
{
  HDCloudSyncComputedState *v2;
  NSMutableArray *v3;
  NSMutableArray *targets;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDCloudSyncComputedState;
  v2 = -[HDCloudSyncComputedState init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    targets = v2->_targets;
    v2->_targets = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (NSArray)targets
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_targets;
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addTargets:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray addObjectsFromArray:](self->_targets, "addObjectsFromArray:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)pushTargets
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray hk_filter:](self->_targets, "hk_filter:", &__block_literal_global_182);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

BOOL __39__HDCloudSyncComputedState_pushTargets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "purpose") == 0;
}

- (NSArray)pullTargets
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray hk_filter:](self->_targets, "hk_filter:", &__block_literal_global_184_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

BOOL __39__HDCloudSyncComputedState_pullTargets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "purpose") == 1;
}

- (void)replaceTargets:(id)a3
{
  id v4;
  NSMutableArray *targets;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  targets = self->_targets;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__HDCloudSyncComputedState_replaceTargets___block_invoke;
  v11[3] = &unk_1E6CE9960;
  v12 = v4;
  v10 = v4;
  -[NSMutableArray hk_filter:](targets, "hk_filter:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (NSMutableArray *)objc_msgSend(v7, "copy");
  v9 = self->_targets;
  self->_targets = v8;

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __43__HDCloudSyncComputedState_replaceTargets___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)resetTargets
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;
  NSMutableArray *targets;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  targets = self->_targets;
  self->_targets = v4;

  os_unfair_lock_unlock(p_lock);
}

- (id)detailedDescription
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[HDCloudSyncComputedState pushTargets](self, "pushTargets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Push Targets (%lu):\n"), objc_msgSend(v4, "count"));
  if (objc_msgSend(v4, "count"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v10, "description");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "hk_stringIndentedBy:", 4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendString:", v12);

          objc_msgSend(v3, "appendString:", CFSTR("\n"));
          objc_msgSend(v10, "storeRecord");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "description");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "hk_stringIndentedBy:", 4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendString:", v15);

          objc_msgSend(v3, "appendString:", CFSTR("\n"));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v7);
    }

    v4 = v29;
  }
  -[HDCloudSyncComputedState pullTargets](self, "pullTargets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nPull Targets (%lu):\n"), objc_msgSend(v16, "count"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v22, "description");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "hk_stringIndentedBy:", 4);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v24);

        objc_msgSend(v3, "appendString:", CFSTR("\n"));
        objc_msgSend(v22, "storeRecord");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "description");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "hk_stringIndentedBy:", 4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v27);

        objc_msgSend(v3, "appendString:", CFSTR("\n"));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v19);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targets, 0);
}

@end
