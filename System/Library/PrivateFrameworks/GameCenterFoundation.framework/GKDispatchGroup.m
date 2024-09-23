@implementation GKDispatchGroup

uint64_t __23__GKDispatchGroup_wait__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_waitWithDispatchTimeout:", -1);
}

void __44__GKDispatchGroup__waitWithDispatchTimeout___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int v4;
  double Current;
  NSObject *v6;
  double v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 64))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = dispatch_group_wait(*(dispatch_group_t *)(v3 + 16), *(_QWORD *)(a1 + 48));
    return;
  }
  v4 = GKAtomicIncrement32((unsigned int *)(v3 + 48));
  Current = CFAbsoluteTimeGetCurrent();
  if (!os_log_GKGeneral)
    GKOSLoggers();
  v6 = os_log_GKDispatch;
  if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v13 = 138412802;
    v14 = v11;
    v15 = 1024;
    v16 = v4;
    v17 = 2048;
    v18 = Current;
    _os_log_debug_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_DEBUG, "%@, WAITING, %d, %f, ", (uint8_t *)&v13, 0x1Cu);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 48));
  v7 = CFAbsoluteTimeGetCurrent();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (!os_log_GKGeneral)
      GKOSLoggers();
    v8 = os_log_GKDispatch;
    if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v13 = 138413058;
      v14 = v9;
      v15 = 1024;
      v16 = v4;
      v17 = 2048;
      v18 = v7;
      v19 = 2048;
      v20 = v7 - Current;
      v10 = "%@, TIMED OUT, %d, %f, %f";
LABEL_17:
      _os_log_debug_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v13, 0x26u);
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      GKOSLoggers();
    v8 = os_log_GKDispatch;
    if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138413058;
      v14 = v12;
      v15 = 1024;
      v16 = v4;
      v17 = 2048;
      v18 = v7;
      v19 = 2048;
      v20 = v7 - Current;
      v10 = "%@, WAITED, %d, %f, %f";
      goto LABEL_17;
    }
  }
}

uint64_t __27__GKDispatchGroup_perform___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  CFAbsoluteTime Current;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  uint64_t v26;
  _QWORD v27[6];
  int v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  CFAbsoluteTime v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 64))
  {
    v3 = GKAtomicIncrement32((unsigned int *)(v2 + 48));
    Current = CFAbsoluteTimeGetCurrent();
    if (!os_log_GKGeneral)
      GKOSLoggers();
    v5 = os_log_GKDispatch;
    if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG))
    {
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v30 = v21;
      v31 = 1024;
      v32 = v3;
      v33 = 2048;
      v34 = Current;
      _os_log_debug_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_DEBUG, "%@, PERFORM, %d, %f, ", buf, 0x1Cu);
    }
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __27__GKDispatchGroup_perform___block_invoke_10;
    v27[3] = &unk_1E75B7FE0;
    v6 = *(_QWORD *)(a1 + 40);
    v27[4] = *(_QWORD *)(a1 + 32);
    v28 = v3;
    *(CFAbsoluteTime *)&v27[5] = Current;
    return (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), void *))(v6 + 16))(v6, v27, v7, v8, v9, v10, v11, v12, v22, v23, v24, v25);
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(v2 + 16));
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __27__GKDispatchGroup_perform___block_invoke_12;
    v25 = &unk_1E75B2460;
    v14 = *(_QWORD *)(a1 + 40);
    v26 = *(_QWORD *)(a1 + 32);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, void (*)(uint64_t), void *))(v14 + 16))(v14, &v22, v15, v16, v17, v18, v19, v20, MEMORY[0x1E0C809B0], 3221225472, __27__GKDispatchGroup_perform___block_invoke_12, &unk_1E75B2460);
  }
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;

  v6 = -[GKDispatchGroup _values](self, "_values");
  if (a3)
    objc_msgSend(v6, "setObject:forKey:", a3, a4);
  else
    objc_msgSend(v6, "removeObjectForKey:", a4);
}

- (void)dealloc
{
  NSObject *group;
  objc_super v4;

  group = self->_group;
  if (group)
    dispatch_release(group);

  v4.receiver = self;
  v4.super_class = (Class)GKDispatchGroup;
  -[GKDispatchGroup dealloc](&v4, sel_dealloc);
}

- (void)wait
{
  GKActivity *activity;
  _QWORD v3[5];

  activity = self->_activity;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __23__GKDispatchGroup_wait__block_invoke;
  v3[3] = &unk_1E75B2460;
  v3[4] = self;
  -[GKActivity execute:](activity, "execute:", v3);
}

- (int64_t)_waitWithDispatchTimeout:(unint64_t)a3
{
  GKActivity *v5;
  int64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = -[GKDispatchGroup activity](self, "activity");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__GKDispatchGroup__waitWithDispatchTimeout___block_invoke;
  v8[3] = &unk_1E75B8058;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  -[GKActivity execute:](v5, "execute:", v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)perform:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  GKDispatchGroup *v13;
  GKActivity *v14;
  _QWORD v15[6];

  v5 = os_log_GKDispatch;
  if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_INFO))
  {
    if (!os_log_GKGeneral)
    {
      GKOSLoggers();
      v5 = os_log_GKDispatch;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[GKDispatchGroup perform:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = self;
  v14 = -[GKDispatchGroup activity](self, "activity");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __27__GKDispatchGroup_perform___block_invoke;
  v15[3] = &unk_1E75B24D8;
  v15[4] = self;
  v15[5] = a3;
  -[GKActivity execute:](v14, "execute:", v15);
}

- (GKActivity)activity
{
  return (GKActivity *)objc_getProperty(self, a2, 72, 1);
}

- (id)_values
{
  id result;
  GKThreadsafeDictionary **p_values;
  GKThreadsafeDictionary *v5;
  GKThreadsafeDictionary *v6;
  GKThreadsafeDictionary *v7;

  p_values = &self->_values;
  result = self->_values;
  if (!result)
  {
    v5 = [GKThreadsafeDictionary alloc];
    v6 = -[GKThreadsafeDictionary initWithName:](v5, "initWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GKDispatchGroup<%p>"), self));
    if (GKAtomicCompareAndSwapPtrBarrier(0, (unint64_t)v6, (unint64_t *)p_values))
      v7 = *p_values;

    return *p_values;
  }
  return result;
}

+ (GKDispatchGroup)dispatchGroupWithName:(id)a3
{
  return (GKDispatchGroup *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithName:", a3);
}

- (GKDispatchGroup)initWithName:(id)a3
{
  GKDispatchGroup *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDispatchGroup;
  v4 = -[GKDispatchGroup init](&v6, sel_init);
  if (v4)
  {
    v4->_name = (NSString *)a3;
    v4->_group = (OS_dispatch_group *)dispatch_group_create();
    v4->_debugLoggingEnabled = os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG);
    v4->_activity = (GKActivity *)+[GKActivity named:](GKActivity, "named:", a3);
    v4->_sequence = 0;
  }
  return v4;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[GKThreadsafeDictionary objectForKey:](self->_values, "objectForKey:", a3);
}

+ (void)waitUntilDone:(id)a3
{
  GKDispatchGroup *v4;

  v4 = +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKDispatchGroup+NoARC.m", 32, "+[GKDispatchGroup waitUntilDone:]"));
  -[GKDispatchGroup perform:](v4, "perform:", a3);
  -[GKDispatchGroup wait](v4, "wait");
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)notifyOnQueue:(id)a3 block:(id)a4
{
  GKActivity *v7;
  _QWORD v8[7];

  v7 = -[GKDispatchGroup activity](self, "activity");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__GKDispatchGroup_notifyOnQueue_block___block_invoke;
  v8[3] = &unk_1E75B8030;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  -[GKActivity execute:](v7, "execute:", v8);
}

- (id)result
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

void __39__GKDispatchGroup_notifyOnQueue_block___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  int v12;
  CFAbsoluteTime Current;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD v26[7];
  int v27;
  char v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  CFAbsoluteTime v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = os_log_GKDispatch;
  if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_INFO))
  {
    if (!os_log_GKGeneral)
    {
      GKOSLoggers();
      v2 = os_log_GKDispatch;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_BYTE *)(v10 + 64);
  if (v11)
  {
    v12 = GKAtomicIncrement32((unsigned int *)(v10 + 48));
    Current = CFAbsoluteTimeGetCurrent();
    if (!os_log_GKGeneral)
      GKOSLoggers();
    v14 = os_log_GKDispatch;
    if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG))
    {
      v24 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v30 = v24;
      v31 = 1024;
      v32 = v12;
      v33 = 2048;
      v34 = Current;
      _os_log_debug_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_DEBUG, "%@, NOTIFY WAITING, %d, %f, ", buf, 0x1Cu);
    }
    v15 = *(id *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 32);
    v16 = *(NSObject **)(a1 + 40);
    v18 = *(NSObject **)(v17 + 16);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_13;
    v26[3] = &unk_1E75B8008;
    v28 = v11;
    v27 = v12;
    *(CFAbsoluteTime *)&v26[6] = Current;
    v19 = *(_QWORD *)(a1 + 48);
    v26[4] = v17;
    v26[5] = v19;
    v20 = v26;
  }
  else
  {
    v21 = (id)v10;
    v22 = *(_QWORD *)(a1 + 32);
    v16 = *(NSObject **)(a1 + 40);
    v18 = *(NSObject **)(v22 + 16);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_14;
    v25[3] = &unk_1E75B24B0;
    v23 = *(_QWORD *)(a1 + 48);
    v25[4] = v22;
    v25[5] = v23;
    v20 = v25;
  }
  dispatch_group_notify(v18, v16, v20);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  objc_super v6;

  if (self->_name)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%s:%p>, %@"), class_getName(v4), self, self->_name);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GKDispatchGroup;
    return -[GKDispatchGroup description](&v6, sel_description);
  }
}

void __27__GKDispatchGroup_perform___block_invoke_10(uint64_t a1)
{
  CFAbsoluteTimeGetCurrent();
  if (!os_log_GKGeneral)
    GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG))
    __27__GKDispatchGroup_perform___block_invoke_10_cold_1();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));

}

void __27__GKDispatchGroup_perform___block_invoke_12(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));

}

- (void)enter
{
  dispatch_group_enter((dispatch_group_t)self->_group);
}

- (void)leave
{
  dispatch_group_leave((dispatch_group_t)self->_group);
}

void __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_13(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 60))
  {
    CFAbsoluteTimeGetCurrent();
    if (!os_log_GKGeneral)
      GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG))
      __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_13_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_14(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)notifyOnMainQueueWithBlock:(id)a3
{
  -[GKDispatchGroup notifyOnQueue:block:](self, "notifyOnQueue:block:", MEMORY[0x1E0C80D38], a3);
}

- (int64_t)waitWithTimeout:(double)a3
{
  return -[GKDispatchGroup _waitWithDispatchTimeout:](self, "_waitWithDispatchTimeout:", dispatch_time(0, (uint64_t)(a3 * 1000000000.0)));
}

- (void)join:(id)a3 queue:(id)a4 block:(id)a5
{
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  GKActivity *activity;
  _QWORD v18[8];

  v9 = os_log_GKDispatch;
  if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_INFO))
  {
    if (!os_log_GKGeneral)
    {
      GKOSLoggers();
      v9 = os_log_GKDispatch;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[GKDispatchGroup join:queue:block:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  if (a3 != self)
  {
    if (!a4)
      a4 = +[GKDispatchGroup defaultConcurrentQueue](GKDispatchGroup, "defaultConcurrentQueue");
    activity = self->_activity;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __36__GKDispatchGroup_join_queue_block___block_invoke;
    v18[3] = &unk_1E75B80D0;
    v18[4] = self;
    v18[5] = a3;
    v18[6] = a4;
    v18[7] = a5;
    -[GKActivity execute:](activity, "execute:", v18);
  }
}

uint64_t __36__GKDispatchGroup_join_queue_block___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__GKDispatchGroup_join_queue_block___block_invoke_2;
  v3[3] = &unk_1E75B80A8;
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v1, "perform:", v3);
}

uint64_t __36__GKDispatchGroup_join_queue_block___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v3 = (void *)a1[4];
  v2 = a1[5];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__GKDispatchGroup_join_queue_block___block_invoke_3;
  v5[3] = &unk_1E75B8080;
  v5[4] = a1[6];
  v5[5] = a2;
  return objc_msgSend(v3, "notifyOnQueue:block:", v2, v5);
}

uint64_t __36__GKDispatchGroup_join_queue_block___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)defaultConcurrentQueue
{
  return dispatch_get_global_queue(0, 0);
}

+ (id)backgroundConcurrentQueue
{
  return dispatch_get_global_queue(-32768, 0);
}

+ (id)mainQueue
{
  return (id)MEMORY[0x1E0C80D38];
}

- (id)allValues
{
  return -[GKThreadsafeDictionary allObjects](self->_values, "allObjects");
}

- (BOOL)isDebugLoggingEnabled
{
  return self->_debugLoggingEnabled;
}

- (void)setDebugLoggingEnabled:(BOOL)a3
{
  self->_debugLoggingEnabled = a3;
}

- (void)setActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)perform:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, a1, a3, "GKDispatchGroup: perform", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __27__GKDispatchGroup_perform___block_invoke_10_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_4(&dword_1BCDE3000, v0, v1, "%@, DONE, %d, %f, %f", v2, v3, v4, v5, v6);
}

void __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, a1, a3, "GKDispatchGroup: notifyOnQueue", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_13_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_2_4(&dword_1BCDE3000, v0, v1, "%@, NOTIFY CALLED, %d, %f, %f", v2, v3, v4, v5, v6);
}

- (void)join:(uint64_t)a3 queue:(uint64_t)a4 block:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_1BCDE3000, a1, a3, "GKDispatchGroup: join", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
