@implementation LSDatabaseRebuildContext

- (LSDatabaseRebuildContext)initWithStatsGatherer:(id)a3
{
  id v5;
  LSDatabaseRebuildContext *v6;
  LSDatabaseRebuildContext *v7;
  NSMutableSet *v8;
  NSMutableSet *overriddenPlugins;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LSDatabaseRebuildContext;
  v6 = -[LSDatabaseRebuildContext init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_statsGatherer, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    overriddenPlugins = v7->_overriddenPlugins;
    v7->_overriddenPlugins = v8;

  }
  return v7;
}

+ (id)currentRebuildContextIfExists
{
  id v0;

  objc_opt_self();
  os_unfair_lock_lock(&rebuildContextLock);
  v0 = (id)currentContext;
  os_unfair_lock_unlock(&rebuildContextLock);
  return v0;
}

+ (void)withStatsGatherer:(void *)a3 runWithRebuildContext:
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char *v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__LSDatabaseRebuildContext_withStatsGatherer_runWithRebuildContext___block_invoke;
  v9[3] = &unk_1E1041090;
  v12 = sel_withStatsGatherer_runWithRebuildContext_;
  v13 = v6;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  _LSServer_ExecuteSyncWithQuiescedInstallationActivity(v9);

}

void __68__LSDatabaseRebuildContext_withStatsGatherer_runWithRebuildContext___block_invoke(_QWORD *a1)
{
  LSDatabaseRebuildContext *v2;
  void *v3;
  void *v4;
  LSDatabaseRebuildContext *v5;

  os_unfair_lock_lock(&rebuildContextLock);
  if (currentContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[7], CFSTR("LSApplicationWorkspace.m"), 5202, CFSTR("can't start rebuild context: one already exists!"));

  }
  v5 = -[LSDatabaseRebuildContext initWithStatsGatherer:]([LSDatabaseRebuildContext alloc], "initWithStatsGatherer:", a1[4]);
  objc_storeStrong((id *)&currentContext, v5);
  os_unfair_lock_unlock(&rebuildContextLock);
  (*(void (**)(void))(a1[5] + 16))();
  os_unfair_lock_lock(&rebuildContextLock);
  v2 = v5;
  if ((LSDatabaseRebuildContext *)currentContext != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[7], CFSTR("LSApplicationWorkspace.m"), 5208, CFSTR("can't end rebuild context: current context is different!?"));

    v2 = (LSDatabaseRebuildContext *)currentContext;
  }
  currentContext = 0;

  os_unfair_lock_unlock(&rebuildContextLock);
}

- (void)registerItems:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  obj = a2;
  if (a1)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v3)
    {
      v4 = v3;
      v27 = *(_QWORD *)v29;
      v5 = *MEMORY[0x1E0C9AE78];
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v29 != v27)
            objc_enumerationMutation(obj);
          v7 = *(void **)(a1 + 16);
          v8 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * v6);
          v9 = v7;
          objc_msgSend(v8, "objectForKey:", v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", CFSTR("ApplicationType"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          _LSLogStepStart(13, 0, v10, CFSTR("begin inspect %@"), v12, v13, v14, v15, (uint64_t)v11);
          _LSServer_DatabaseExecutionContext();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __registerSingleMIDict_block_invoke;
          v32[3] = &unk_1E1040E58;
          v33 = v8;
          v34 = v11;
          v35 = v9;
          v36 = v10;
          v17 = v8;
          v18 = v11;
          v19 = v9;
          v20 = v10;
          -[LSDBExecutionContext syncWrite:]((uint64_t)v16, v32);

          _LSLogStepFinished(13, 1, v20, CFSTR("end inspect %@"), v21, v22, v23, v24, (uint64_t)v18);
          objc_msgSend(v17, "objectForKey:", CFSTR("ApplicationType"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[LSRebuildStatisticsGatherer registeredBundleOfType:](*(_QWORD *)(a1 + 8), v25);

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v4);
    }
  }

}

- (void)noteRebuildError:(uint64_t)a1
{
  char *newValue;

  newValue = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 24), a2);
    -[LSRebuildStatisticsGatherer setRebuildError:](*(void **)(a1 + 8), newValue);
  }

}

- (id)finishAndArmSaveTimer
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    _LSServer_DatabaseExecutionContext();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext syncWrite:]((uint64_t)v2, &__block_literal_global_734);

    a1 = (id *)v1[3];
  }
  return a1;
}

void __49__LSDatabaseRebuildContext_finishAndArmSaveTimer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int inited;
  id v7;
  NSObject *v8;
  id v9;
  id v10;

  v4 = a2;
  v5 = a3;
  v9 = 0;
  v10 = 0;
  inited = _LSContextInitReturningError(&v10, &v9);
  v7 = v9;
  if (inited)
  {
    if (_CSStoreGarbageCollect())
      _LSArmSaveTimer(1);
  }
  else
  {
    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __49__LSDatabaseRebuildContext_finishAndArmSaveTimer__block_invoke_cold_1();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastObservedError, 0);
  objc_storeStrong((id *)&self->_overriddenPlugins, 0);
  objc_storeStrong((id *)&self->_statsGatherer, 0);
}

void __49__LSDatabaseRebuildContext_finishAndArmSaveTimer__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "could not connect to database to garbage collect: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
