@implementation EDThreadMigrator

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__EDThreadMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_89 != -1)
    dispatch_once(&log_onceToken_89, block);
  return (OS_os_log *)(id)log_log_89;
}

void __23__EDThreadMigrator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_89;
  log_log_89 = (uint64_t)v1;

}

- (EDThreadMigrator)initWithThreadScope:(id)a3 threadPersistence:(id)a4 queryHandler:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  EDThreadMigrator *v13;
  EDThreadMigrator *v14;
  EMThreadScope *threadScope;
  void *v16;
  void *v17;
  uint64_t v18;
  EFScheduler *workScheduler;
  id v20;
  _EDThreadMigrationState *v21;
  uint64_t v22;
  EFLocked *state;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v11 = a5;
  v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)EDThreadMigrator;
  v13 = -[EDThreadMigrator init](&v27, sel_init);
  v14 = v13;
  if (v13)
  {
    threadScope = v13->_threadScope;
    v13->_threadFinalizationInterval = 2.0;
    v16 = (void *)MEMORY[0x1E0D1F070];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EDThreadMigrator-%@"), threadScope);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "serialDispatchQueueSchedulerWithName:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    workScheduler = v14->_workScheduler;
    v14->_workScheduler = (EFScheduler *)v18;

    v20 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v21 = objc_alloc_init(_EDThreadMigrationState);
    v22 = objc_msgSend(v20, "initWithObject:", v21);
    state = v14->_state;
    v14->_state = (EFLocked *)v22;

    objc_storeStrong((id *)&v14->_threadScope, a3);
    objc_storeStrong((id *)&v14->_threadPersistence, a4);
    objc_storeStrong((id *)&v14->_queryHandler, a5);
    objc_storeWeak((id *)&v14->_delegate, v12);
  }

  return v14;
}

- (void)start
{
  void *v3;
  _QWORD v4[5];

  -[EDThreadMigrator state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__EDThreadMigrator_start__block_invoke;
  v4[3] = &unk_1E94A1FB8;
  v4[4] = self;
  objc_msgSend(v3, "performWhileLocked:", v4);

}

void __25__EDThreadMigrator_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const __CFString *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  NSObject *v24;
  id v25;
  _QWORD v26[5];
  NSObject *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    +[EDThreadMigrator log](EDThreadMigrator, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = objc_msgSend(v3, "generation");
      v7 = objc_msgSend(v3, "unmigratedCount");
      v8 = objc_msgSend(v3, "state") - 1;
      if (v8 > 4)
        v9 = CFSTR("Not Started");
      else
        v9 = off_1E94A2110[v8];
      objc_msgSend(*(id *)(a1 + 32), "threadScope");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v29 = v5;
      v30 = 2048;
      v31 = v6;
      v32 = 2048;
      v33 = v7;
      v34 = 2114;
      v35 = v9;
      v36 = 2114;
      v37 = v22;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Failed to start migration for %lu threads due to wrong state: %{public}@\n%{public}@", buf, 0x34u);

    }
  }
  else
  {
    objc_msgSend(v3, "setState:", 1);
    +[EDThreadMigrator log](EDThreadMigrator, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = objc_msgSend(v3, "generation");
      v13 = objc_msgSend(v3, "unmigratedCount");
      objc_msgSend(*(id *)(a1 + 32), "threadScope");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v29 = v11;
      v30 = 2048;
      v31 = v12;
      v32 = 2048;
      v33 = v13;
      v34 = 2114;
      v35 = v14;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Starting migration for %lu threads\n%{public}@", buf, 0x2Au);

    }
    v4 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
    objc_msgSend(v3, "setMigrationCancelable:", v4);
    if (objc_msgSend(v3, "isFullyMigrated"))
    {
      objc_msgSend(v3, "setState:", 3);
      +[EDThreadMigrator log](EDThreadMigrator, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v17 = objc_msgSend(v3, "generation");
        objc_msgSend(*(id *)(a1 + 32), "threadScope");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v29 = v16;
        v30 = 2048;
        v31 = v17;
        v32 = 2114;
        v33 = (uint64_t)v18;
        _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Finished empty migration: %{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "workScheduler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __25__EDThreadMigrator_start__block_invoke_8;
      v26[3] = &unk_1E949B6D0;
      v26[4] = *(_QWORD *)(a1 + 32);
      v27 = v4;
      objc_msgSend(v19, "performBlock:", v26);
      v20 = (id *)&v27;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "workScheduler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __25__EDThreadMigrator_start__block_invoke_2;
      v23[3] = &unk_1E949B390;
      v23[4] = *(_QWORD *)(a1 + 32);
      v24 = v4;
      v25 = v3;
      objc_msgSend(v21, "performBlock:", v23);

      v20 = (id *)&v24;
      v19 = v25;
    }

  }
}

void __25__EDThreadMigrator_start__block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "threadPersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "threadScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginMigratingThreadScope:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addCancelable:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_finishMigrating");

}

void __25__EDThreadMigrator_start__block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1[4], "threadPersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "threadScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginMigratingThreadScope:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "addCancelable:", v4);
  objc_msgSend(a1[4], "_migrateNextBatchWithGeneration:", objc_msgSend(a1[6], "generation"));

}

- (void)cancel
{
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__36;
  v9 = __Block_byref_object_dispose__36;
  v10 = 0;
  -[EDThreadMigrator state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__EDThreadMigrator_cancel__block_invoke;
  v4[3] = &unk_1E94A1FE0;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend(v3, "performWhileLocked:", v4);

  objc_msgSend((id)v6[5], "cancel");
  _Block_object_dispose(&v5, 8);

}

void __26__EDThreadMigrator_cancel__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EDThreadMigrator log](EDThreadMigrator, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(v3, "generation");
    v7 = objc_msgSend(v3, "state");
    if ((unint64_t)(v7 - 1) > 4)
      v8 = CFSTR("Not Started");
    else
      v8 = off_1E94A2110[v7 - 1];
    v12 = 134218498;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Canceling migration oldState: %{public}@", (uint8_t *)&v12, 0x20u);
  }

  if (objc_msgSend(v3, "isInProgress"))
  {
    objc_msgSend(v3, "migrationCancelable");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(v3, "setMigrationCancelable:", 0);
  }
  objc_msgSend(v3, "setState:", 5);

}

- (void)reset
{
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__36;
  v9 = __Block_byref_object_dispose__36;
  v10 = 0;
  -[EDThreadMigrator state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__EDThreadMigrator_reset__block_invoke;
  v4[3] = &unk_1E94A1FE0;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend(v3, "performWhileLocked:", v4);

  objc_msgSend((id)v6[5], "cancel");
  _Block_object_dispose(&v5, 8);

}

void __25__EDThreadMigrator_reset__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EDThreadMigrator log](EDThreadMigrator, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(v3, "generation");
    v7 = objc_msgSend(v3, "state");
    if ((unint64_t)(v7 - 1) > 4)
      v8 = CFSTR("Not Started");
    else
      v8 = off_1E94A2110[v7 - 1];
    v12 = 134218498;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Resetting migration oldState: %{public}@", (uint8_t *)&v12, 0x20u);
  }

  if (objc_msgSend(v3, "isInProgress"))
  {
    objc_msgSend(v3, "migrationCancelable");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(v3, "setMigrationCancelable:", 0);
  }
  objc_msgSend(v3, "reset");

}

- (void)_failMigration
{
  id v2;

  -[EDThreadMigrator state](self, "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performWhileLocked:", &__block_literal_global_77);

}

uint64_t __34__EDThreadMigrator__failMigration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fail");
}

- (void)_migrateNextBatchWithGeneration:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[9];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  EDThreadMigrator *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__36;
  v21 = __Block_byref_object_dispose__36;
  v22 = 0;
  -[EDThreadMigrator state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__EDThreadMigrator__migrateNextBatchWithGeneration___block_invoke;
  v16[3] = &unk_1E94A2028;
  v16[7] = &v27;
  v16[8] = a3;
  v16[4] = self;
  v16[5] = &v17;
  v16[6] = &v23;
  objc_msgSend(v5, "performWhileLocked:", v16);

  if (!*((_BYTE *)v28 + 24))
  {
    -[EDThreadMigrator queryHandler](self, "queryHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "threadsAndMessagesForObjectIDs:", v18[5]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDThreadMigrator threadPersistence](self, "threadPersistence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "addThreads:", v8);

    if (v10)
    {
      v11 = (void *)objc_msgSend((id)v18[5], "copy");
      -[EDThreadMigrator _scheduleFinalizationForBatchedObjectIDs:withGeneration:forDelete:](self, "_scheduleFinalizationForBatchedObjectIDs:withGeneration:forDelete:", v11, a3, 0);

      if (!*((_BYTE *)v24 + 24))
      {
        -[EDThreadMigrator workScheduler](self, "workScheduler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v6;
        v15[1] = 3221225472;
        v15[2] = __52__EDThreadMigrator__migrateNextBatchWithGeneration___block_invoke_12;
        v15[3] = &unk_1E949B658;
        v15[4] = self;
        v15[5] = a3;
        objc_msgSend(v12, "performBlock:", v15);

      }
    }
    else
    {
      +[EDThreadMigrator log](EDThreadMigrator, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[EDThreadMigrator threadScope](self, "threadScope");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v32 = self;
        v33 = 2048;
        v34 = a3;
        v35 = 2114;
        v36 = v14;
        _os_log_error_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_ERROR, "%p[%lu]: Failed migration -- unable to add threads\n%{public}@", buf, 0x20u);

      }
      -[EDThreadMigrator _failMigration](self, "_failMigration");
    }

  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void __52__EDThreadMigrator__migrateNextBatchWithGeneration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "verifyIsMigratingGeneration:andIsInState:logIdentifier:logAction:logCount:", *(_QWORD *)(a1 + 64), 1, *(_QWORD *)(a1 + 32), CFSTR("Stopping migration"), objc_msgSend(v3, "unmigratedCount")))
  {
    v16 = *(_QWORD *)(a1 + 56);
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(v16 + 8) + 24) = 1;
    goto LABEL_10;
  }
  objc_msgSend(v3, "nextBatch");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  +[EDThreadMigrator log](EDThreadMigrator, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(void **)(a1 + 32);
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    objc_msgSend(*(id *)(a1 + 32), "threadScope");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134218754;
    v18 = v9;
    v19 = 2048;
    v20 = v8;
    v21 = 2048;
    v22 = v10;
    v23 = 2114;
    v24 = v11;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Migrating batch of %lu threads\n%{public}@", (uint8_t *)&v17, 0x2Au);

  }
  if (objc_msgSend(v3, "isEmpty"))
  {
    +[EDThreadMigrator log](EDThreadMigrator, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v13, "threadScope");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134218498;
      v18 = v13;
      v19 = 2048;
      v20 = v14;
      v21 = 2114;
      v22 = (uint64_t)v15;
      _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Finishing migration\n%{public}@", (uint8_t *)&v17, 0x20u);

    }
    objc_msgSend(v3, "setState:", 2);
    v16 = *(_QWORD *)(a1 + 48);
    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __52__EDThreadMigrator__migrateNextBatchWithGeneration___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_migrateNextBatchWithGeneration:", *(_QWORD *)(a1 + 40));
}

- (void)_scheduleFinalizationForBatchedObjectIDs:(id)a3 withGeneration:(unint64_t)a4 forDelete:(BOOL)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  BOOL v17;

  v8 = a3;
  -[EDThreadMigrator workScheduler](self, "workScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDThreadMigrator threadFinalizationInterval](self, "threadFinalizationInterval");
  v11 = v10;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__EDThreadMigrator__scheduleFinalizationForBatchedObjectIDs_withGeneration_forDelete___block_invoke;
  v14[3] = &unk_1E94A2078;
  v17 = a5;
  v14[4] = self;
  v16 = a4;
  v12 = v8;
  v15 = v12;
  v13 = (id)objc_msgSend(v9, "afterDelay:performBlock:", v14, v11);

}

void __86__EDThreadMigrator__scheduleFinalizationForBatchedObjectIDs_withGeneration_forDelete___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __86__EDThreadMigrator__scheduleFinalizationForBatchedObjectIDs_withGeneration_forDelete___block_invoke_2;
  v5[3] = &unk_1E94A2050;
  v9 = *(_BYTE *)(a1 + 56);
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v5[4] = v4;
  v5[1] = 3221225472;
  v6 = v3;
  v7 = &v10;
  objc_msgSend(v2, "performWhileLocked:", v5);

  if (*((_BYTE *)v11 + 24))
    objc_msgSend(*(id *)(a1 + 32), "_finishMigrating");

  _Block_object_dispose(&v10, 8);
}

void __86__EDThreadMigrator__scheduleFinalizationForBatchedObjectIDs_withGeneration_forDelete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 64))
    v4 = CFSTR("Skipping delete finalization");
  else
    v4 = CFSTR("Skipping finalization");
  v5 = v4;
  if (objc_msgSend(v3, "verifyIsMigratingGeneration:andIsInState:orState:logIdentifier:logAction:logCount:", *(_QWORD *)(a1 + 56), 1, 2, *(_QWORD *)(a1 + 32), v5, objc_msgSend(*(id *)(a1 + 40), "count")))
  {
    +[EDThreadMigrator log](EDThreadMigrator, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 56);
      if (*(_BYTE *)(a1 + 64))
        v8 = CFSTR("deletion");
      else
        v8 = CFSTR("migration");
      v9 = *(void **)(a1 + 32);
      v10 = objc_msgSend(*(id *)(a1 + 40), "count");
      objc_msgSend(*(id *)(a1 + 32), "threadScope");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134219010;
      v21 = v9;
      v22 = 2048;
      v23 = v7;
      v24 = 2114;
      v25 = v8;
      v26 = 2048;
      v27 = v10;
      v28 = 2114;
      v29 = v11;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Finalized %{public}@ for %lu threads: %{public}@", (uint8_t *)&v20, 0x34u);

    }
    v12 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 64))
      objc_msgSend(v3, "removeDeletedObjectIDs:", v12);
    else
      objc_msgSend(v3, "removeMigratedObjectIDs:", v12);
    if (objc_msgSend(v3, "state") == 2 && objc_msgSend(v3, "isFullyMigrated"))
    {
      +[EDThreadMigrator log](EDThreadMigrator, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(void **)(a1 + 32);
        v15 = *(_QWORD *)(a1 + 56);
        v16 = *(unsigned __int8 *)(a1 + 64);
        objc_msgSend(v14, "threadScope");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        v19 = CFSTR("delete ");
        v20 = 134218754;
        v21 = v14;
        v22 = 2048;
        if (!v16)
          v19 = &stru_1E94A4508;
        v23 = v15;
        v24 = 2112;
        v25 = v19;
        v26 = 2114;
        v27 = v17;
        _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Finished migration after finalizing last %@batch: %{public}@", (uint8_t *)&v20, 0x2Au);

      }
      objc_msgSend(v3, "setState:", 3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }

}

- (void)_finishMigrating
{
  void *v3;
  id v4;
  id v5;

  -[EDThreadMigrator threadPersistence](self, "threadPersistence");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EDThreadMigrator threadScope](self, "threadScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endMigratingThreadScope:", v3);

  -[EDThreadMigrator delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadMigratorDidComplete:", self);

}

- (void)addObjectIDsToMigrate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EDThreadMigrator state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__EDThreadMigrator_addObjectIDsToMigrate___block_invoke;
  v7[3] = &unk_1E94A20A0;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performWhileLocked:", v7);

}

void __42__EDThreadMigrator_addObjectIDsToMigrate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  if (v4 < 2)
  {
    v6 = 0;
  }
  else
  {
    if (v4 != 2)
    {
      if (v4 == 3)
      {
        +[EDThreadMigrator log](EDThreadMigrator, "log");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v17 = *(_QWORD *)(a1 + 32);
          v18 = objc_msgSend(v3, "generation");
          v19 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "threadScope");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v24 = v17;
          v25 = 2048;
          v26 = v18;
          v27 = 2114;
          v28 = v19;
          v29 = 2114;
          v30 = v20;
          _os_log_error_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_ERROR, "%p[%lu]: Got more object IDs after migration finished. objects: {%{public}@}; thread scope: {%{public}@}",
            buf,
            0x2Au);

        }
      }
      goto LABEL_15;
    }
    objc_msgSend(v3, "setState:", 1);
    +[EDThreadMigrator log](EDThreadMigrator, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = objc_msgSend(v3, "generation");
      objc_msgSend(*(id *)(a1 + 32), "threadScope");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v24 = v8;
      v25 = 2048;
      v26 = v9;
      v27 = 2114;
      v28 = (uint64_t)v10;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Resuming migration for thread scope %{public}@", buf, 0x20u);

    }
    v6 = 1;
  }
  objc_msgSend(v3, "addObjectIDs:", *(_QWORD *)(a1 + 40));
  +[EDThreadMigrator log](EDThreadMigrator, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = objc_msgSend(v3, "generation");
    v14 = objc_msgSend(*(id *)(a1 + 40), "count");
    objc_msgSend(*(id *)(a1 + 32), "threadScope");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v24 = v12;
    v25 = 2048;
    v26 = v13;
    v27 = 2048;
    v28 = v14;
    v29 = 2114;
    v30 = v15;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Added %lu threads to migration for thread scope %{public}@", buf, 0x2Au);

  }
  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "workScheduler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __42__EDThreadMigrator_addObjectIDsToMigrate___block_invoke_25;
    v21[3] = &unk_1E949B6D0;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v3;
    objc_msgSend(v16, "performBlock:", v21);

  }
LABEL_15:

}

uint64_t __42__EDThreadMigrator_addObjectIDsToMigrate___block_invoke_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_migrateNextBatchWithGeneration:", objc_msgSend(*(id *)(a1 + 40), "generation"));
}

- (void)changeObjectIDsToMigrate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  EDThreadMigrator *v9;

  v4 = a3;
  -[EDThreadMigrator state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__EDThreadMigrator_changeObjectIDsToMigrate___block_invoke;
  v7[3] = &unk_1E94A20A0;
  v6 = v4;
  v8 = v6;
  v9 = self;
  objc_msgSend(v5, "performWhileLocked:", v7);

}

void __45__EDThreadMigrator_changeObjectIDsToMigrate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4 == 3)
    {
      +[EDThreadMigrator log](EDThreadMigrator, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 40);
        v20 = objc_msgSend(v3, "generation");
        v21 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "threadScope");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v28 = v19;
        v29 = 2048;
        v30 = v20;
        v31 = 2114;
        v32 = v21;
        v33 = 2114;
        v34 = v22;
        _os_log_error_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_ERROR, "%p[%lu]: Got changed object IDs after migration finished: %{public}@\n%{public}@", buf, 0x2Au);

      }
    }
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __45__EDThreadMigrator_changeObjectIDsToMigrate___block_invoke_2;
    v25[3] = &unk_1E949FEB8;
    v7 = v3;
    v26 = v7;
    objc_msgSend(v5, "ef_filter:", v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "count"))
      goto LABEL_13;
    objc_msgSend(v7, "addObjectIDs:", v8);
    objc_msgSend(v7, "removeMigratedObjectIDs:", v8);
    +[EDThreadMigrator log](EDThreadMigrator, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = objc_msgSend(v7, "generation");
      objc_msgSend(*(id *)(a1 + 40), "threadScope");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v28 = v10;
      v29 = 2048;
      v30 = v11;
      v31 = 2114;
      v32 = v8;
      v33 = 2114;
      v34 = v12;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Resetting object IDs %{public}@ after change\n%{public}@", buf, 0x2Au);

    }
    if (objc_msgSend(v7, "state") == 2)
    {
      objc_msgSend(v7, "setState:", 1);
      +[EDThreadMigrator log](EDThreadMigrator, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 40);
        v15 = objc_msgSend(v7, "generation");
        objc_msgSend(*(id *)(a1 + 40), "threadScope");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v28 = v14;
        v29 = 2048;
        v30 = v15;
        v31 = 2114;
        v32 = v16;
        _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Resuming migration\n%{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "workScheduler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v6;
      v23[1] = 3221225472;
      v23[2] = __45__EDThreadMigrator_changeObjectIDsToMigrate___block_invoke_27;
      v23[3] = &unk_1E949B6D0;
      v23[4] = *(_QWORD *)(a1 + 40);
      v24 = v7;
      objc_msgSend(v17, "performBlock:", v23);

    }
    else
    {
LABEL_13:

    }
  }

}

uint64_t __45__EDThreadMigrator_changeObjectIDsToMigrate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isRecentlyMigrated:", a2);
}

uint64_t __45__EDThreadMigrator_changeObjectIDsToMigrate___block_invoke_27(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_migrateNextBatchWithGeneration:", objc_msgSend(*(id *)(a1 + 40), "generation"));
}

- (void)deleteObjectIDsToMigrate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  EDThreadMigrator *v9;

  v4 = a3;
  -[EDThreadMigrator state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke;
  v7[3] = &unk_1E94A20A0;
  v6 = v4;
  v8 = v6;
  v9 = self;
  objc_msgSend(v5, "performWhileLocked:", v7);

}

void __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke_2;
  aBlock[3] = &unk_1E949B390;
  v5 = v3;
  v34 = v5;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v35 = v6;
  v36 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v9 = objc_msgSend(v5, "state");
  if ((unint64_t)(v9 - 1) < 2)
  {
    v8[2](v8);
    v12 = *(void **)(a1 + 32);
    v31[0] = v4;
    v31[1] = 3221225472;
    v31[2] = __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke_28;
    v31[3] = &unk_1E949FEB8;
    v13 = v5;
    v32 = v13;
    objc_msgSend(v12, "ef_filter:", v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      -[NSObject addDeletedObjectIDs:](v13, "addDeletedObjectIDs:", v11);
      +[EDThreadMigrator log](EDThreadMigrator, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 40);
        v16 = -[NSObject generation](v13, "generation");
        objc_msgSend(*(id *)(a1 + 40), "threadScope");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v38 = v15;
        v39 = 2048;
        v40 = v16;
        v41 = 2114;
        v42 = v11;
        v43 = 2114;
        v44 = v17;
        _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Deleting %{public}@\n%{public}@", buf, 0x2Au);

      }
    }
    if (-[NSObject state](v13, "state") == 1 && -[NSObject isEmpty](v13, "isEmpty"))
    {
      -[NSObject setState:](v13, "setState:", 2);
      +[EDThreadMigrator log](EDThreadMigrator, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 40);
        v20 = -[NSObject generation](v13, "generation");
        objc_msgSend(*(id *)(a1 + 40), "threadScope");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v38 = v19;
        v39 = 2048;
        v40 = v20;
        v41 = 2114;
        v42 = v21;
        _os_log_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Finishing migration after deleting last batch: %{public}@", buf, 0x20u);

      }
    }
    v10 = v32;
    goto LABEL_17;
  }
  if (v9)
  {
    if (v9 == 3)
    {
      +[EDThreadMigrator log](EDThreadMigrator, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v23 = *(_QWORD *)(a1 + 40);
        v24 = objc_msgSend(v5, "generation");
        v25 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "threadScope");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v38 = v23;
        v39 = 2048;
        v40 = v24;
        v41 = 2114;
        v42 = v25;
        v43 = 2114;
        v44 = v26;
        _os_log_error_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_ERROR, "%p[%lu]: Got deleted object IDs after migration finished: %{public}@\n%{public}@", buf, 0x2Au);

      }
      v11 = 0;
LABEL_17:

      goto LABEL_20;
    }
    v11 = 0;
  }
  else
  {
    v11 = 0;
    v8[2](v8);
  }
LABEL_20:
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "workScheduler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke_29;
    v27[3] = &unk_1E949B680;
    v27[4] = *(_QWORD *)(a1 + 40);
    v28 = v11;
    v29 = *(id *)(a1 + 32);
    v30 = v5;
    objc_msgSend(v22, "performBlock:", v27);

  }
}

void __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "removeObjectIDs:", a1[5]);
  +[EDThreadMigrator log](EDThreadMigrator, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[6];
    v4 = objc_msgSend(a1[4], "generation");
    v5 = objc_msgSend(a1[5], "count");
    objc_msgSend(a1[6], "threadScope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218754;
    v8 = v3;
    v9 = 2048;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "%p[%lu]: Deleting %lu threads from migration \n%{public}@", (uint8_t *)&v7, 0x2Au);

  }
}

uint64_t __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke_28(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isRecentlyMigrated:", a2);
}

uint64_t __45__EDThreadMigrator_deleteObjectIDsToMigrate___block_invoke_29(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "threadPersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deleteThreadsWithObjectIDs:", *(_QWORD *)(a1 + 40));

  if (v3)
    return objc_msgSend(*(id *)(a1 + 32), "_scheduleFinalizationForBatchedObjectIDs:withGeneration:forDelete:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "generation"), 1);
  +[EDThreadMigrator log](EDThreadMigrator, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_msgSend(*(id *)(a1 + 56), "generation");
    objc_msgSend(*(id *)(a1 + 32), "threadScope");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218498;
    v10 = v6;
    v11 = 2048;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_error_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_ERROR, "%p[%lu]: Failed migration -- unable to delete threads\n%{public}@", (uint8_t *)&v9, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_failMigration");
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (EFLocked)state
{
  return self->_state;
}

- (EFScheduler)workScheduler
{
  return self->_workScheduler;
}

- (EDThreadPersistence)threadPersistence
{
  return self->_threadPersistence;
}

- (EDInMemoryThreadQueryHandler)queryHandler
{
  return self->_queryHandler;
}

- (EDThreadMigratorDelegate)delegate
{
  return (EDThreadMigratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)threadFinalizationInterval
{
  return self->_threadFinalizationInterval;
}

- (void)setThreadFinalizationInterval:(double)a3
{
  self->_threadFinalizationInterval = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queryHandler, 0);
  objc_storeStrong((id *)&self->_threadPersistence, 0);
  objc_storeStrong((id *)&self->_workScheduler, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_threadScope, 0);
}

@end
