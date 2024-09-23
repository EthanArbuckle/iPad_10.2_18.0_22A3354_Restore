@implementation FCCommandQueue

- (id)initWithContext:(void *)a3 persistentStorePath:(void *)a4 urgency:(int)a5 suspended:(void *)a6 delegate:
{
  id v12;
  id v13;
  id v14;
  id *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  dispatch_group_t v23;
  id v24;
  dispatch_group_t v25;
  id v26;
  void *v27;
  const __CFString *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v35;
  objc_super v36;
  _BYTE buf[24];
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a3;
  v14 = a6;
  if (a1)
  {
    if (!v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "context != nil");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCCommandQueue initWithContext:persistentStorePath:urgency:suspended:delegate:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCCommandQueue.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v38) = 82;
      WORD2(v38) = 2114;
      *(_QWORD *)((char *)&v38 + 6) = v35;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v36.receiver = a1;
    v36.super_class = (Class)FCCommandQueue;
    v15 = (id *)objc_msgSendSuper2(&v36, sel_init);
    a1 = v15;
    if (v15)
    {
      if (v12)
      {
        objc_storeStrong(v15 + 2, a2);
        v16 = objc_msgSend(v13, "copy");
        v17 = a1[3];
        a1[3] = (id)v16;

        objc_msgSend(v13, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByDeletingPathExtension");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = a1[4];
        a1[4] = (id)v19;

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = a1[9];
        a1[9] = (id)v21;

        v23 = dispatch_group_create();
        v24 = a1[11];
        a1[11] = v23;

        v25 = dispatch_group_create();
        v26 = a1[12];
        a1[12] = v25;

        a1[6] = a4;
        *((_BYTE *)a1 + 8) = a5;
        objc_storeWeak(a1 + 7, v14);
        v27 = (void *)FCCommandQueueLog;
        if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
        {
          v28 = CFSTR("resumed");
          v29 = a1[4];
          if (a5)
            v28 = CFSTR("suspended");
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v28;
          v30 = v27;
          _os_log_impl(&dword_1A1B90000, v30, OS_LOG_TYPE_DEFAULT, "<%{public}@> command queue created in %{public}@ state", buf, 0x16u);

        }
        objc_opt_self();
        if (qword_1ED0F8370 != -1)
          dispatch_once(&qword_1ED0F8370, &__block_literal_global_86);
        objc_storeStrong(a1 + 8, (id)_MergedGlobals_172);
        objc_msgSend(v12, "networkReachability");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObserver:", a1);

        objc_msgSend(v12, "appActivityMonitor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObserver:", a1);

        objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
        if (a1[3])
        {
          dispatch_group_enter((dispatch_group_t)a1[11]);
          v33 = a1[8];
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __31__FCCommandQueue__loadFromDisk__block_invoke;
          *(_QWORD *)&v38 = &unk_1E463AB18;
          *((_QWORD *)&v38 + 1) = a1;
          dispatch_async(v33, buf);
        }
      }
      else
      {

        a1 = 0;
      }
    }
  }

  return a1;
}

void __31__FCCommandQueue__loadFromDisk__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  FCKeyValueStore *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  FCKeyValueStore *v16;
  uint64_t v17;
  id *v18;
  id v19;
  void *v20;
  id *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  _BYTE v37[152];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[2];
  v3 = v2;
  objc_msgSend(v3, "appActivityMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(void **)(v5 + 16);
  else
    v6 = 0;
  objc_msgSend(v6, "backgroundTaskable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCKeyValueStoreSavePolicy appBackgroundPolicyWithActivityMonitor:backgroundTaskable:](FCKeyValueStoreSavePolicy, "appBackgroundPolicyWithActivityMonitor:backgroundTaskable:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [FCKeyValueStore alloc];
  v10 = *(_QWORD **)(a1 + 32);
  if (v10)
    v10 = (_QWORD *)v10[3];
  v11 = v10;
  objc_msgSend(v11, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD **)(a1 + 32);
  if (v13)
    v13 = (_QWORD *)v13[3];
  v14 = v13;
  objc_msgSend(v14, "stringByDeletingLastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:migrator:savePolicy:](v9, "initWithName:directory:version:options:classRegistry:migrator:savePolicy:", v12, v15, 3, 0, 0, 0, v8);
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    objc_storeStrong((id *)(v17 + 40), v16);

  v18 = *(id **)(a1 + 32);
  if (v18)
  {
    v19 = v18[5];
    objc_msgSend(v19, "objectForKey:", CFSTR("pendingCommands"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __48__FCCommandQueue__deserializeCommandsFromStore___block_invoke;
    v36[3] = &unk_1E4644038;
    v36[4] = v18;
    objc_msgSend(v20, "fc_arrayByTransformingWithBlock:", v36);
    v18 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v21 = v18;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v33;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v21);
        v25 = *(_QWORD *)(a1 + 32);
        if (v25)
          v26 = *(void **)(v25 + 72);
        else
          v26 = 0;
        objc_msgSend(v26, "addObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v24));
        v27 = *(_QWORD *)(a1 + 32);
        if (v27)
          v28 = *(NSObject **)(v27 + 88);
        else
          v28 = 0;
        dispatch_group_enter(v28);
        ++v24;
      }
      while (v22 != v24);
      v29 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      v22 = v29;
    }
    while (v29);
  }

  v30 = *(_QWORD *)(a1 + 32);
  if (v30)
    v31 = *(NSObject **)(v30 + 88);
  else
    v31 = 0;
  dispatch_group_leave(v31);
  -[FCCommandQueue _scheduleCommandExecution](*(_QWORD *)(a1 + 32));

}

- (void)_scheduleCommandExecution
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_source_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int64_t v12;
  uint64_t v13;
  dispatch_time_t v14;
  void *v15;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)FCCommandQueueWorkQueueUnique;
    if (dispatch_get_specific((const void *)FCCommandQueueWorkQueueUnique) != v2
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("accessing private structures outside the work queue"));
      *(_DWORD *)buf = 136315906;
      v18 = "-[FCCommandQueue _scheduleCommandExecution]";
      v19 = 2080;
      v20 = "FCCommandQueue.m";
      v21 = 1024;
      v22 = 263;
      v23 = 2114;
      v24 = v15;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 == 2)
    {
      -[FCCommandQueue _executeNextCommand](a1);
    }
    else
    {
      v4 = *(void **)(a1 + 80);
      if (!v4)
      {
        v5 = *(id *)(a1 + 64);
        v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v5);
        v7 = *(void **)(a1 + 80);
        *(_QWORD *)(a1 + 80) = v6;

        v8 = *(id *)(a1 + 80);
        v9 = -[FCCommandQueue _qualityOfServiceForNextCommand](a1);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __43__FCCommandQueue__scheduleCommandExecution__block_invoke;
        block[3] = &unk_1E463AB18;
        block[4] = a1;
        FCBlockWithQualityOfService(v9, block);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_source_set_event_handler(v8, v10);

        dispatch_resume(*(dispatch_object_t *)(a1 + 80));
        v3 = *(_QWORD *)(a1 + 48);
        v4 = *(void **)(a1 + 80);
      }
      v11 = v4;
      if (v3 == 1)
        v12 = 5000000000;
      else
        v12 = 60000000000;
      if (v3 == 1)
        v13 = 2000000000;
      else
        v13 = 15000000000;
      v14 = dispatch_time(0, v12);
      dispatch_source_set_timer(v11, v14, 0xFFFFFFFFFFFFFFFFLL, v13);

    }
  }
}

- (FCCommandQueue)initWithContext:(id)a3 storeDirectory:(id)a4 storeFilename:(id)a5 urgency:(int64_t)a6 suspended:(BOOL)a7 delegate:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  FCCommandQueue *v19;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v9 = a7;
  v30 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = a3;
  if (!objc_msgSend(v15, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expecting a valid storeFilename"));
    v22 = 136315906;
    v23 = "-[FCCommandQueue initWithContext:storeDirectory:storeFilename:urgency:suspended:delegate:]";
    v24 = 2080;
    v25 = "FCCommandQueue.m";
    v26 = 1024;
    v27 = 129;
    v28 = 2114;
    v29 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v22, 0x26u);

  }
  objc_msgSend(v14, "stringByAppendingPathComponent:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (FCCommandQueue *)-[FCCommandQueue initWithContext:persistentStorePath:urgency:suspended:delegate:]((id *)&self->super.isa, v17, v18, (void *)a6, v9, v16);

  return v19;
}

- (uint64_t)_qualityOfServiceForNextCommand
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;

  if (result)
  {
    v1 = result;
    v2 = (id *)(result + 56);
    WeakRetained = objc_loadWeakRetained((id *)(result + 56));
    if (WeakRetained
      && (v4 = WeakRetained,
          v5 = objc_loadWeakRetained(v2),
          v6 = objc_opt_respondsToSelector(),
          v5,
          v4,
          (v6 & 1) != 0))
    {
      v7 = objc_loadWeakRetained(v2);
      v8 = objc_msgSend(v7, "qualityOfServiceForNextCommandInCommandQueue:", v1);

      return v8;
    }
    else
    {
      return 9;
    }
  }
  return result;
}

- (void)_executeNextCommand
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  char *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  _BYTE v24[18];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)FCCommandQueueWorkQueueUnique;
    if (dispatch_get_specific((const void *)FCCommandQueueWorkQueueUnique) != v2
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("accessing private structures outside the work queue"));
      v19 = 136315906;
      v20 = "-[FCCommandQueue _executeNextCommand]";
      v21 = 2080;
      v22 = "FCCommandQueue.m";
      v23 = 1024;
      *(_DWORD *)v24 = 296;
      *(_WORD *)&v24[4] = 2114;
      *(_QWORD *)&v24[6] = v18;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v19, 0x26u);

    }
    if (*(_BYTE *)(a1 + 8) || *(_BYTE *)(a1 + 9) || !objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      v3 = (void *)FCCommandQueueLog;
      if (!os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
        return;
      v4 = *(void **)(a1 + 32);
      if (*(_BYTE *)(a1 + 8))
        v5 = CFSTR("true");
      else
        v5 = CFSTR("false");
      if (*(_BYTE *)(a1 + 9))
        v6 = CFSTR("true");
      else
        v6 = CFSTR("false");
      v7 = *(id *)(a1 + 72);
      v8 = v4;
      v9 = v3;
      v10 = objc_msgSend(v7, "count");
      v19 = 138544130;
      v20 = (const char *)v4;
      v21 = 2114;
      v22 = (char *)v5;
      v23 = 2114;
      *(_QWORD *)v24 = v6;
      *(_WORD *)&v24[8] = 2048;
      *(_QWORD *)&v24[10] = v10;
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@> not executing next command because suspended=%{public}@, executing=%{public}@, commandCount=%lu", (uint8_t *)&v19, 0x2Au);

    }
    else
    {
      *(_BYTE *)(a1 + 9) = 1;
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 96));
      v11 = *(id *)(a1 + 72);
      objc_msgSend(v11, "firstObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(void **)(a1 + 32);
        v14 = v13;
        v15 = v12;
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (char *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = (const char *)v13;
        v21 = 2114;
        v22 = v17;
        v23 = 2048;
        *(_QWORD *)v24 = v9;
        _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@> will execute next command: <%{public}@ %p>", (uint8_t *)&v19, 0x20u);

      }
      v8 = *(id *)(a1 + 16);
      -[NSObject executeWithContext:delegate:qualityOfService:](v9, "executeWithContext:delegate:qualityOfService:", v8, a1, -[FCCommandQueue _qualityOfServiceForNextCommand](a1));
    }

  }
}

void __45__FCCommandQueue__addCommand_saveCompletion___block_invoke(uint64_t *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[9];
  v3 = v2;
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = a1[4];
  if (!v5)
  {
LABEL_6:
    if (!v4)
      goto LABEL_18;
    goto LABEL_9;
  }
  if (*(_BYTE *)(v5 + 9))
  {
    LOBYTE(v5) = objc_msgSend(*(id *)(v5 + 72), "count") == 1;
    goto LABEL_6;
  }
  LOBYTE(v5) = 0;
  if (!v4)
    goto LABEL_18;
LABEL_9:
  if ((v5 & 1) != 0 || !objc_msgSend(v4, "canCoalesceWithCommand:", a1[5]))
  {
LABEL_18:
    v18 = a1[4];
    if (v18)
      v19 = *(void **)(v18 + 72);
    else
      v19 = 0;
    objc_msgSend(v19, "addObject:", a1[5]);
    goto LABEL_21;
  }
  v6 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    if (v7)
      v8 = *(void **)(v7 + 32);
    else
      v8 = 0;
    v9 = v8;
    v10 = v6;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[5];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544386;
    v22 = v8;
    v23 = 2114;
    v24 = v12;
    v25 = 2048;
    v26 = v13;
    v27 = 2114;
    v28 = v15;
    v29 = 2048;
    v30 = v4;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@> will coalesce command <%{public}@ %p> with <%{public}@ %p>", (uint8_t *)&v21, 0x34u);

  }
  objc_msgSend(v4, "coalesceWithCommand:", a1[5]);
  v16 = a1[4];
  if (v16)
    v17 = *(NSObject **)(v16 + 88);
  else
    v17 = 0;
  dispatch_group_leave(v17);
LABEL_21:
  -[FCCommandQueue _savePendingCommands](a1[4]);
  -[FCCommandQueue _scheduleCommandExecution](a1[4]);
  v20 = a1[6];
  if (v20)
    (*(void (**)(void))(v20 + 16))();

}

void __23__FCCommandQueue_clear__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *isa;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if ((!v2 || !*(_BYTE *)(v2 + 8)) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should only clear the command queue when it's suspended"));
    v10 = 136315906;
    v11 = "-[FCCommandQueue clear]_block_invoke";
    v12 = 2080;
    v13 = "FCCommandQueue.m";
    v14 = 1024;
    v15 = 240;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

  }
  while (1)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = v3 ? *(void **)(v3 + 72) : 0;
    v5 = objc_msgSend(v4, "count");
    isa = *(NSObject **)(a1 + 32);
    if (!v5)
      break;
    if (isa)
      isa = isa[11].isa;
    dispatch_group_leave(isa);
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(void **)(v7 + 72);
    else
      v8 = 0;
    objc_msgSend(v8, "removeObjectAtIndex:", 0);
  }
  -[FCCommandQueue _savePendingCommands]((uint64_t)isa);
}

- (void)_savePendingCommands
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BYTE v8[24];
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)FCCommandQueueWorkQueueUnique;
    if (dispatch_get_specific((const void *)FCCommandQueueWorkQueueUnique) != v2
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("accessing private structures outside the work queue"));
      *(_DWORD *)v8 = 136315906;
      *(_QWORD *)&v8[4] = "-[FCCommandQueue _savePendingCommands]";
      *(_WORD *)&v8[12] = 2080;
      *(_QWORD *)&v8[14] = "FCCommandQueue.m";
      *(_WORD *)&v8[22] = 1024;
      LODWORD(v9) = 366;
      WORD2(v9) = 2114;
      *(_QWORD *)((char *)&v9 + 6) = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v8, 0x26u);

    }
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      v4 = *(id *)(a1 + 72);
      *(_QWORD *)v8 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v8[8] = 3221225472;
      *(_QWORD *)&v8[16] = __45__FCCommandQueue__serializeCommands_toStore___block_invoke;
      *(_QWORD *)&v9 = &unk_1E4644A50;
      *((_QWORD *)&v9 + 1) = a1;
      v5 = v3;
      objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("pendingCommands"));

    }
  }
}

- (void)clear
{
  NSObject *workQueue;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__FCCommandQueue_clear__block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)addCommand:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCCommandQueue _addCommand:saveCompletion:]((uint64_t)self, v5, 0);

}

- (void)_addCommand:(void *)a3 saveCompletion:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1 && v5)
  {
    v7 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v8;
      v10 = v7;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v8;
      v20 = 2114;
      v21 = v12;
      v22 = 2048;
      v23 = v5;
      _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@> will add command <%{public}@ %p>", buf, 0x20u);

    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 88));
    v13 = *(id *)(a1 + 64);
    v14 = -[FCCommandQueue _qualityOfServiceForNextCommand](a1);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__FCCommandQueue__addCommand_saveCompletion___block_invoke;
    v15[3] = &unk_1E463CCB8;
    v15[4] = a1;
    v16 = v5;
    v17 = v6;
    FCDispatchAsyncWithQualityOfService(v13, v14, v15);

  }
}

id __45__FCCommandQueue__serializeCommands_toStore___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(_QWORD *)(a1 + 32))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __33__FCCommandQueue_sharedWorkQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("FCCommandQueue.workQueue", v0);
  v2 = (void *)_MergedGlobals_172;
  _MergedGlobals_172 = (uint64_t)v1;

  dispatch_queue_set_specific((dispatch_queue_t)_MergedGlobals_172, (const void *)FCCommandQueueWorkQueueUnique, (void *)FCCommandQueueWorkQueueUnique, 0);
}

- (FCCommandQueue)initWithContext:(id)a3 urgency:(int64_t)a4 suspended:(BOOL)a5 delegate:(id)a6
{
  return (FCCommandQueue *)-[FCCommandQueue initWithContext:persistentStorePath:urgency:suspended:delegate:]((id *)&self->super.isa, a3, 0, (void *)a4, a5, a6);
}

- (void)dealloc
{
  FCCloudContext *context;
  FCCloudContext *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (self)
    context = self->_context;
  else
    context = 0;
  v4 = context;
  -[FCCloudContext networkReachability](v4, "networkReachability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)FCCommandQueue;
  -[FCCommandQueue dealloc](&v7, sel_dealloc);
}

- (void)resume
{
  void *v3;
  NSString *name;
  NSObject *v5;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v3 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      name = self->_name;
    else
      name = 0;
    *(_DWORD *)buf = 138543362;
    v9 = name;
    v5 = v3;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@> will resume", buf, 0xCu);

  }
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__FCCommandQueue_resume__block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __24__FCCommandQueue_resume__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 8))
    goto LABEL_5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't resume the command queue unless it's suspended"));
    v5 = 136315906;
    v6 = "-[FCCommandQueue resume]_block_invoke";
    v7 = 2080;
    v8 = "FCCommandQueue.m";
    v9 = 1024;
    v10 = 152;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      goto LABEL_5;
LABEL_8:
    v3 = 0;
    goto LABEL_6;
  }
  if (!v2)
    goto LABEL_8;
LABEL_5:
  *(_BYTE *)(v2 + 8) = 0;
  v3 = *(_QWORD *)(a1 + 32);
LABEL_6:
  -[FCCommandQueue _scheduleCommandExecution](v3);
}

- (void)addCommand:(id)a3 saveCompletion:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3978];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "isMainThread");
  -[FCCommandQueue _addCommand:saveCompletion:]((uint64_t)self, v8, v7);

}

- (void)flushWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  NSString *name;
  NSObject *v7;
  void *v8;
  OS_dispatch_queue *workQueue;
  OS_dispatch_queue *v10;
  uint64_t v11;
  _QWORD v12[5];
  void (**v13)(id, uint64_t);
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (-[FCCommandQueue _isEmpty]((_BOOL8)self))
    {
      v5 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
      {
        if (self)
          name = self->_name;
        else
          name = 0;
        *(_DWORD *)buf = 138543362;
        v15 = (const char *)name;
        v7 = v5;
        _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@> no need to flush command queue because it's empty", buf, 0xCu);

      }
      v4[2](v4, 1);
    }
    else
    {
      if (self)
        workQueue = self->_workQueue;
      else
        workQueue = 0;
      v10 = workQueue;
      v11 = -[FCCommandQueue _qualityOfServiceForNextCommand]((uint64_t)self);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __45__FCCommandQueue_flushWithCompletionHandler___block_invoke;
      v12[3] = &unk_1E463B790;
      v12[4] = self;
      v13 = v4;
      FCDispatchAsyncWithQualityOfService(v10, v11, v12);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCCommandQueue flushWithCompletionHandler:]";
    v16 = 2080;
    v17 = "FCCommandQueue.m";
    v18 = 1024;
    v19 = 207;
    v20 = 2114;
    v21 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (BOOL)_isEmpty
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    return FCDispatchGroupIsEmpty(*(void **)(v1 + 88));
  }
  return result;
}

void __45__FCCommandQueue_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD **)(a1 + 32);
    if (v3)
    {
      v4 = (void *)v3[4];
      v3 = (_QWORD *)v3[9];
    }
    else
    {
      v4 = 0;
    }
    v5 = v3;
    v6 = v4;
    v7 = v2;
    *(_DWORD *)buf = 138543618;
    v14 = v4;
    v15 = 2048;
    v16 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@> need to flush %lu commands from the command queue", buf, 0x16u);

  }
  -[FCCommandQueue _executeNextCommand](*(_QWORD *)(a1 + 32));
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(NSObject **)(v8 + 96);
  else
    v9 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__FCCommandQueue_flushWithCompletionHandler___block_invoke_22;
  v11[3] = &unk_1E463B2D0;
  v10 = *(id *)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v10;
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], v11);

}

uint64_t __45__FCCommandQueue_flushWithCompletionHandler___block_invoke_22(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[FCCommandQueue _isEmpty](*(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(uint64_t, _BOOL8))(v1 + 16))(v1, v2);
}

void __43__FCCommandQueue__scheduleCommandExecution__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;

  -[FCCommandQueue _executeNextCommand](*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(NSObject **)(v2 + 80);
  else
    v3 = 0;
  dispatch_source_cancel(v3);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_storeStrong((id *)(v4 + 80), 0);
}

uint64_t __48__FCCommandQueue__applicationDidEnterBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;

  -[FCCommandQueue _executeNextCommand](*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(NSObject **)(v2 + 96);
  else
    v3 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_3;
  block[3] = &unk_1E463AFC0;
  block[4] = v2;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = v4;
  v8 = v5;
  dispatch_group_notify(v3, MEMORY[0x1E0C80D38], block);

}

void __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 40);
  else
    v3 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_4;
  v6[3] = &unk_1E463DF90;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "saveWithCompletionHandler:", v6);

}

void __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_5;
  v4[3] = &unk_1E463DF90;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  FCPerformBlockOnMainThread(v4);

}

uint64_t __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)command:(id)a3 didFinishWithStatus:(unint64_t)a4
{
  id v6;
  void *v7;
  NSString *name;
  NSString *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  OS_dispatch_queue *workQueue;
  OS_dispatch_queue *v15;
  uint64_t v16;
  _QWORD v17[6];
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      name = self->_name;
    else
      name = 0;
    v9 = name;
    v10 = v7;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    FCCommandStatusDescription(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v19 = name;
    v20 = 2114;
    v21 = v12;
    v22 = 2048;
    v23 = v6;
    v24 = 2114;
    v25 = v13;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@> finished executing command: <%{public}@ %p> with status: %{public}@", buf, 0x2Au);

  }
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v15 = workQueue;
  v16 = -[FCCommandQueue _qualityOfServiceForNextCommand]((uint64_t)self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__FCCommandQueue_command_didFinishWithStatus___block_invoke;
  v17[3] = &unk_1E4640A20;
  v17[4] = self;
  v17[5] = a4;
  FCDispatchAsyncWithQualityOfService(v15, v16, v17);

}

void __46__FCCommandQueue_command_didFinishWithStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    *(_BYTE *)(v2 + 9) = 0;
  switch(*(_QWORD *)(a1 + 40))
  {
    case 0:
    case 3:
      v3 = (void *)FCCommandQueueLog;
      v4 = os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT);
      v5 = *(_QWORD *)(a1 + 32);
      if (v4)
      {
        if (v5)
          v5 = *(_QWORD *)(v5 + 32);
        *(_DWORD *)buf = 138543362;
        v26 = v5;
        v6 = v3;
        _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@> will move on to the next command", buf, 0xCu);

        v5 = *(_QWORD *)(a1 + 32);
      }
      if (v5)
        v7 = *(NSObject **)(v5 + 88);
      else
        v7 = 0;
      dispatch_group_leave(v7);
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
        v9 = *(void **)(v8 + 72);
      else
        v9 = 0;
      objc_msgSend(v9, "removeObjectAtIndex:", 0);
      -[FCCommandQueue _savePendingCommands](*(_QWORD *)(a1 + 32));
      -[FCCommandQueue _executeNextCommand](*(_QWORD *)(a1 + 32));
      break;
    case 1:
      v10 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        if (v11)
          v11 = *(_QWORD *)(v11 + 32);
        *(_DWORD *)buf = 138543362;
        v26 = v11;
        v12 = v10;
        _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@> will try to execute the next command when the network is available", buf, 0xCu);

      }
      break;
    case 2:
      v13 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        if (v14)
          v14 = *(_QWORD *)(v14 + 32);
        *(_DWORD *)buf = 138543362;
        v26 = v14;
        v15 = v13;
        _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@> will try to execute the next command in 60s since we got a retry-later error", buf, 0xCu);

      }
      v16 = dispatch_time(0, 60000000000);
      v17 = *(_QWORD *)(a1 + 32);
      if (v17)
        v18 = *(void **)(v17 + 64);
      else
        v18 = 0;
      v19 = v18;
      v20 = -[FCCommandQueue _qualityOfServiceForNextCommand](v17);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__FCCommandQueue_command_didFinishWithStatus___block_invoke_37;
      block[3] = &unk_1E463AB18;
      block[4] = *(_QWORD *)(a1 + 32);
      FCBlockWithQualityOfService(v20, block);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_after(v16, v19, v21);

      break;
    default:
      break;
  }
  v22 = *(_QWORD *)(a1 + 32);
  if (v22)
    v23 = *(NSObject **)(v22 + 96);
  else
    v23 = 0;
  dispatch_group_leave(v23);
}

void __46__FCCommandQueue_command_didFinishWithStatus___block_invoke_37(uint64_t a1)
{
  -[FCCommandQueue _executeNextCommand](*(_QWORD *)(a1 + 32));
}

id __48__FCCommandQueue__deserializeCommandsFromStore___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E0CB3710];
    v3 = a2;
    objc_msgSend(v2, "nf_securelyUnarchiveObjectOfClass:withData:", objc_opt_class(), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)networkReachabilityDidChange:(id)a3
{
  OS_dispatch_queue *workQueue;
  OS_dispatch_queue *v5;
  uint64_t v6;
  _QWORD v7[5];

  if (objc_msgSend(a3, "isNetworkReachable"))
  {
    if (self)
      workQueue = self->_workQueue;
    else
      workQueue = 0;
    v5 = workQueue;
    v6 = -[FCCommandQueue _qualityOfServiceForNextCommand]((uint64_t)self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__FCCommandQueue_networkReachabilityDidChange___block_invoke;
    v7[3] = &unk_1E463AB18;
    v7[4] = self;
    FCDispatchAsyncWithQualityOfService(v5, v6, v7);

  }
}

void __47__FCCommandQueue_networkReachabilityDidChange___block_invoke(uint64_t a1)
{
  -[FCCommandQueue _scheduleCommandExecution](*(_QWORD *)(a1 + 32));
}

- (void)activityObservingApplicationDidEnterBackground
{
  void *v3;
  int v4;
  FCCloudContext *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  OS_dispatch_queue *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  if (self)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    -[FCCloudContext networkReachability](self->_context, "networkReachability");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isNetworkReachable");

    if (v4)
    {
      v5 = self->_context;
      -[FCCloudContext backgroundTaskable](v5, "backgroundTaskable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      v7 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __48__FCCommandQueue__applicationDidEnterBackground__block_invoke;
      v16[3] = &unk_1E463DF90;
      v8 = v6;
      v17 = v8;
      v18 = &v19;
      v9 = objc_msgSend(v8, "fc_beginBackgroundTaskWithName:expirationHandler:", CFSTR("Command Queue Flush"), v16);
      v20[3] = v9;
      v10 = self->_workQueue;
      v11 = -[FCCommandQueue _qualityOfServiceForNextCommand]((uint64_t)self);
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __48__FCCommandQueue__applicationDidEnterBackground__block_invoke_2;
      v13[3] = &unk_1E463AFC0;
      v13[4] = self;
      v12 = v8;
      v14 = v12;
      v15 = &v19;
      FCDispatchAsyncWithQualityOfService(v10, v11, v13);

      _Block_object_dispose(&v19, 8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executingCommandsGroup, 0);
  objc_storeStrong((id *)&self->_pendingCommandsGroup, 0);
  objc_storeStrong((id *)&self->_cooldownTimer, 0);
  objc_storeStrong((id *)&self->_pendingCommands, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_persistentStorePath, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
