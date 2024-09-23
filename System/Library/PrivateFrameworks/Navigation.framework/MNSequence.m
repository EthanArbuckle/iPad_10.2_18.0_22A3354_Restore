@implementation MNSequence

- (MNSequence)initWithQueue:(id)a3
{
  id v5;
  MNSequence *v6;
  MNSequence *v7;
  uint64_t v8;
  geo_isolater *stepsIsolater;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MNSequence;
  v6 = -[MNSequence init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = geo_isolater_create();
    stepsIsolater = v7->_stepsIsolater;
    v7->_stepsIsolater = (geo_isolater *)v8;

  }
  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  MNSequence *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_isStarted)
  {
    MNGetMNSequenceLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v7 = self;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "%p MNSequence was deallocated without ever being started. Did you forget to call start?", buf, 0xCu);
    }

    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v7 = (MNSequence *)"-[MNSequence dealloc]";
      v8 = 2080;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/MNSequence.m";
      v10 = 1024;
      v11 = 44;
      v12 = 2080;
      v13 = "NO";
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)MNSequence;
  -[MNSequence dealloc](&v5, sel_dealloc);
}

- (void)addStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSMutableArray *steps;
  NSMutableArray *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  _BYTE v13[12];
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_isStarted)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot add steps to MNSequence after it has already started."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v13 = 136316162;
      *(_QWORD *)&v13[4] = "-[MNSequence addStep:]";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/MNSequence.m";
      v16 = 1024;
      v17 = 51;
      v18 = 2080;
      v19 = "NO";
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", v13, 0x30u);
    }

  }
  else if (v4)
  {
    *(_QWORD *)v13 = self->_stepsIsolater;
    _geo_isolate_lock();
    steps = self->_steps;
    if (!steps)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array", *(_QWORD *)v13);
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v10 = self->_steps;
      self->_steps = v9;

      steps = self->_steps;
    }
    v11 = (void *)objc_msgSend(v5, "copy", *(_QWORD *)v13);
    v12 = (void *)MEMORY[0x1B5E0E364]();
    -[NSMutableArray addObject:](steps, "addObject:", v12);

    _geo_isolate_unlock();
  }

}

- (void)setSequenceFinalizeHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id finalizeHandler;
  _BYTE v9[12];
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isStarted)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot modify MNSequence after it has already started."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v9 = 136316162;
      *(_QWORD *)&v9[4] = "-[MNSequence setSequenceFinalizeHandler:]";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/MNSequence.m";
      v12 = 1024;
      v13 = 67;
      v14 = 2080;
      v15 = "NO";
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", v9, 0x30u);
    }

  }
  else
  {
    *(_QWORD *)v9 = self->_stepsIsolater;
    _geo_isolate_lock();
    v7 = (void *)MEMORY[0x1B5E0E364](v4);
    finalizeHandler = self->_finalizeHandler;
    self->_finalizeHandler = v7;

    _geo_isolate_unlock();
  }

}

- (void)start
{
  void *v2;
  NSObject *v3;
  OS_os_activity *v5;
  OS_os_activity *activity;
  NSObject *v7;
  int v8;
  int v9;
  MNSequence *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_isStarted)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MNSequence has already been started."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = 136316162;
      v10 = (MNSequence *)"-[MNSequence start]";
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/MNSequence.m";
      v13 = 1024;
      v14 = 78;
      v15 = 2080;
      v16 = "NO";
      v17 = 2112;
      v18 = v2;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v9, 0x30u);
    }

  }
  else
  {
    v5 = (OS_os_activity *)_os_activity_create(&dword_1B0AD7000, "MNSequence start", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    activity = self->_activity;
    self->_activity = v5;

    os_activity_scope_enter((os_activity_t)self->_activity, &self->_activityScopeState);
    MNGetMNSequenceLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NSMutableArray count](self->_steps, "count");
      v9 = 134218240;
      v10 = self;
      v11 = 1024;
      LODWORD(v12) = v8;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "%p Starting sequence with %d steps.", (uint8_t *)&v9, 0x12u);
    }

    self->_isStarted = 1;
    -[MNSequence _runNextStepWithPreviousStepResult:](self, "_runNextStepWithPreviousStepResult:", 0);
  }
}

- (void)_runNextStepWithPreviousStepResult:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *queue;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD v15[4];
  os_activity_scope_state_s v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *);
  void *v20;
  MNSequence *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  MNSequence *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2;
  v32 = __Block_byref_object_dispose__2;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = MEMORY[0x1E0C809B0];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __49__MNSequence__runNextStepWithPreviousStepResult___block_invoke;
  v20 = &unk_1E61D1F90;
  v21 = self;
  v22 = &v28;
  v23 = &v24;
  geo_isolate_sync();
  if (v29[5])
  {
    v6 = _os_activity_create(&dword_1B0AD7000, "MNSequence step", (os_activity_t)self->_activity, OS_ACTIVITY_FLAG_DEFAULT);
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3010000000;
    v16.opaque[0] = 0;
    v16.opaque[1] = 0;
    v15[3] = &unk_1B0C0A341;
    os_activity_scope_enter(v6, &v16);
    MNGetMNSequenceLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v25[3];
      *(_DWORD *)buf = 134218240;
      v35 = self;
      v36 = 1024;
      v37 = v8;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "%p Starting step %d.", buf, 0x12u);
    }

    queue = self->_queue;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __49__MNSequence__runNextStepWithPreviousStepResult___block_invoke_16;
    v10[3] = &unk_1E61D22B8;
    v10[4] = self;
    v12 = &v24;
    v13 = &v28;
    v11 = v4;
    v14 = v15;
    dispatch_async(queue, v10);

    _Block_object_dispose(v15, 8);
  }
  else
  {
    -[MNSequence _finalizeSequenceWithPreviousStepResult:](self, "_finalizeSequenceWithPreviousStepResult:", v4);
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

}

void __49__MNSequence__runNextStepWithPreviousStepResult___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 48);
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 16), "removeObjectAtIndex:", 0);
    ++*(_QWORD *)(a1[4] + 48);
  }
}

uint64_t __49__MNSequence__runNextStepWithPreviousStepResult___block_invoke_16(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *, void *, int);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  MNGetMNSequenceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    v4 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    *(_DWORD *)buf = 134218240;
    v16 = v3;
    v17 = 1024;
    v18 = v4;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_INFO, "%p Running step %d.", buf, 0x12u);
  }

  v5 = a1[6];
  v6 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __49__MNSequence__runNextStepWithPreviousStepResult___block_invoke_17;
  v11 = &unk_1E61D2290;
  v12 = a1[4];
  v13 = v5;
  v14 = a1[8];
  return (*(uint64_t (**)(void))(v6 + 16))();
}

void __49__MNSequence__runNextStepWithPreviousStepResult___block_invoke_17(_QWORD *a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  MNGetMNSequenceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = a1[4];
    v8 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    v10 = 134218496;
    v11 = v7;
    v12 = 1024;
    v13 = v8;
    v14 = 1024;
    v15 = a3;
    _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "%p Finished step %d. shouldContinue: %d", (uint8_t *)&v10, 0x18u);
  }

  os_activity_scope_leave((os_activity_scope_state_t)(*(_QWORD *)(a1[6] + 8) + 32));
  v9 = (void *)a1[4];
  if (a3)
    objc_msgSend(v9, "_runNextStepWithPreviousStepResult:", v5);
  else
    objc_msgSend(v9, "_finalizeSequenceWithPreviousStepResult:", v5);

}

- (void)_finalizeSequenceWithPreviousStepResult:(id)a3
{
  id v4;
  id finalizeHandler;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *queue;
  _QWORD v11[5];
  id v12;
  __int128 *v13;
  _QWORD *v14;
  _QWORD v15[4];
  os_activity_scope_state_s v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  MNSequence *v21;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  finalizeHandler = self->_finalizeHandler;
  MNGetMNSequenceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (finalizeHandler)
  {
    if (v7)
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%p Sequence steps finished. Calling finalizeHandler.", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2;
    v26 = __Block_byref_object_dispose__2;
    v27 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __54__MNSequence__finalizeSequenceWithPreviousStepResult___block_invoke;
    v20 = &unk_1E61D22E0;
    v21 = self;
    p_buf = &buf;
    geo_isolate_sync();
    v9 = _os_activity_create(&dword_1B0AD7000, "MNSequence finalize", (os_activity_t)self->_activity, OS_ACTIVITY_FLAG_DEFAULT);
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3010000000;
    v16.opaque[0] = 0;
    v16.opaque[1] = 0;
    v15[3] = &unk_1B0C0A341;
    os_activity_scope_enter(v9, &v16);
    queue = self->_queue;
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __54__MNSequence__finalizeSequenceWithPreviousStepResult___block_invoke_2;
    v11[3] = &unk_1E61D2308;
    v11[4] = self;
    v13 = &buf;
    v12 = v4;
    v14 = v15;
    dispatch_async(queue, v11);

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    if (v7)
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%p Sequence steps finished with no finalizeHandler.", (uint8_t *)&buf, 0xCu);
    }

    -[MNSequence _endSequence](self, "_endSequence");
  }

}

void __54__MNSequence__finalizeSequenceWithPreviousStepResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1B5E0E364](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __54__MNSequence__finalizeSequenceWithPreviousStepResult___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MNGetMNSequenceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v3;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_INFO, "%p Running finalizeHandler.", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
  MNGetMNSequenceLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v5;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "%p Finished finalizeHandler.", (uint8_t *)&v7, 0xCu);
  }

  os_activity_scope_leave((os_activity_scope_state_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  return objc_msgSend(*(id *)(a1 + 32), "_endSequence");
}

- (void)_endSequence
{
  NSObject *v3;
  int v4;
  MNSequence *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MNGetMNSequenceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "%p Sequence ended.", (uint8_t *)&v4, 0xCu);
  }

  os_activity_scope_leave(&self->_activityScopeState);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_stepsIsolater, 0);
  objc_storeStrong(&self->_finalizeHandler, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
