@implementation ATXDigitalHealthBlacklist

+ (ATXDigitalHealthBlacklist)sharedInstance
{
  if (sharedInstance__pasOnceToken6_15 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_15, &__block_literal_global_101);
  return (ATXDigitalHealthBlacklist *)(id)sharedInstance__pasExprOnceResult_19;
}

void __43__ATXDigitalHealthBlacklist_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_19;
  sharedInstance__pasExprOnceResult_19 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXDigitalHealthBlacklist)init
{
  ATXDigitalHealthBlacklist *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXDigitalHealthBlacklist;
  v2 = -[ATXDigitalHealthBlacklist init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    v7 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v2);

    objc_autoreleasePoolPop(v7);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ATXDigitalHealthBlacklist;
  -[ATXDigitalHealthBlacklist dealloc](&v4, sel_dealloc);
}

- (id)blacklistedBundleIds
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__47;
  v10 = __Block_byref_object_dispose__47;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__ATXDigitalHealthBlacklist_blacklistedBundleIds__block_invoke;
  v5[3] = &unk_1E82E28A0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __49__ATXDigitalHealthBlacklist_blacklistedBundleIds__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

- (void)deviceManagementPolicyDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "deviceManagementPolicy", (_QWORD)v16);
        objc_msgSend(v12, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v15 = v5;
        else
          v15 = v6;
        objc_msgSend(v15, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  if (-[ATXDigitalHealthBlacklist _updateBlacklistWithNewBlacklistedBundleIds:whitelistedBundleIds:](self, "_updateBlacklistWithNewBlacklistedBundleIds:whitelistedBundleIds:", v5, v6))
  {
    ATXUpdatePredictionsImmediatelyWithReason(14);
    objc_msgSend(MEMORY[0x1E0D81198], "refreshBlendingLayerWithReason:", CFSTR("Device management policy did change"));
  }

}

- (BOOL)_updateBlacklistWithNewBlacklistedBundleIds:(id)a3 whitelistedBundleIds:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    lock = self->_lock;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__ATXDigitalHealthBlacklist__updateBlacklistWithNewBlacklistedBundleIds_whitelistedBundleIds___block_invoke;
    v11[3] = &unk_1E82E28C8;
    v12 = v6;
    v13 = v7;
    v14 = &v15;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);
    v9 = *((_BYTE *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __94__ATXDigitalHealthBlacklist__updateBlacklistWithNewBlacklistedBundleIds_whitelistedBundleIds___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id *v7;

  v7 = a2;
  v3 = v7[1];
  v4 = (void *)objc_msgSend(v7[1], "mutableCopy");
  objc_msgSend(v4, "unionSet:", a1[4]);
  objc_msgSend(v4, "minusSet:", a1[5]);
  if ((objc_msgSend(v3, "isEqualToSet:", v4) & 1) == 0)
  {
    v5 = objc_msgSend(v4, "copy");
    v6 = v7[1];
    v7[1] = (id)v5;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
