@implementation _HKGraphTileDelayedRendererReleaseManager

- (_HKGraphTileDelayedRendererReleaseManager)init
{
  _HKGraphTileDelayedRendererReleaseManager *v2;
  _HKGraphTileDelayedRendererReleaseManager *v3;
  NSMutableArray *v4;
  NSMutableArray *delayedEntries;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HKGraphTileDelayedRendererReleaseManager;
  v2 = -[_HKGraphTileDelayedRendererReleaseManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_entriesLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    delayedEntries = v3->_delayedEntries;
    v3->_delayedEntries = v4;

  }
  return v3;
}

+ (void)handleDelayedRendererRelease:(id)a3 lastAssignmentTime:(double)a4
{
  void *v5;
  double v6;
  id v7;

  v7 = a3;
  +[_HKGraphTileDelayedRendererReleaseManager singleton](_HKGraphTileDelayedRendererReleaseManager, "singleton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CACurrentMediaTime();
  if (v6 - a4 < 3.0)
    objc_msgSend(v5, "addRenderForDelayedRelease:lastAssignmentTime:", v7, a4);
  objc_msgSend(v5, "releaseExpiredImageRenderers:", v6);

}

+ (id)singleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___HKGraphTileDelayedRendererReleaseManager_singleton__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (singleton_pred != -1)
    dispatch_once(&singleton_pred, block);
  return (id)singleton_singletonDelayedRendererReleaseManager;
}

- (void)addRenderForDelayedRelease:(id)a3 lastAssignmentTime:(double)a4
{
  id v6;
  os_unfair_lock_s *p_entriesLock;
  void *v8;
  _HKGraphTileDelayedRendererEntry *v9;

  v6 = a3;
  v9 = -[_HKGraphTileDelayedRendererEntry initWithImageRenderer:lastAssignmentTime:]([_HKGraphTileDelayedRendererEntry alloc], "initWithImageRenderer:lastAssignmentTime:", v6, a4);

  p_entriesLock = &self->_entriesLock;
  os_unfair_lock_lock(&self->_entriesLock);
  -[_HKGraphTileDelayedRendererReleaseManager delayedEntries](self, "delayedEntries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  os_unfair_lock_unlock(p_entriesLock);
}

- (void)releaseExpiredImageRenderers:(double)a3
{
  os_unfair_lock_s *p_entriesLock;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_entriesLock = &self->_entriesLock;
  os_unfair_lock_lock(&self->_entriesLock);
  -[_HKGraphTileDelayedRendererReleaseManager delayedEntries](self, "delayedEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[_HKGraphTileDelayedRendererReleaseManager delayedEntries](self, "delayedEntries");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = v7 - 45;
    v13 = *(_QWORD *)v28;
    while (2)
    {
      v14 = 0;
      v15 = v11 + v10;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v8);
        if (v11 < v12 || (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v14), "expiredAtTime:", a3) & 1) != 0)
        {

          v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          -[_HKGraphTileDelayedRendererReleaseManager delayedEntries](self, "delayedEntries", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v17)
          {
            v18 = v17;
            v19 = 0;
            v20 = *(_QWORD *)v24;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v24 != v20)
                  objc_enumerationMutation(v16);
                if (v19 + i >= v12)
                {
                  v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
                  if ((objc_msgSend(v22, "expiredAtTime:", a3) & 1) == 0)
                    objc_msgSend(v8, "addObject:", v22);
                }
              }
              v19 += v18;
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v18);
          }

          -[_HKGraphTileDelayedRendererReleaseManager setDelayedEntries:](self, "setDelayedEntries:", v8);
          goto LABEL_22;
        }
        ++v14;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      v11 = v15;
      if (v10)
        continue;
      break;
    }
  }
LABEL_22:

  os_unfair_lock_unlock(p_entriesLock);
}

- (os_unfair_lock_s)entriesLock
{
  return self->_entriesLock;
}

- (NSMutableArray)delayedEntries
{
  return self->_delayedEntries;
}

- (void)setDelayedEntries:(id)a3
{
  objc_storeStrong((id *)&self->_delayedEntries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedEntries, 0);
}

@end
