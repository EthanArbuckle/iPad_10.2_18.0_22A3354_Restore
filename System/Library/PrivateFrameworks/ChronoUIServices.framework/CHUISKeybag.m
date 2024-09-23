@implementation CHUISKeybag

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global);
  return (id)sharedInstance___keybag;
}

void __29__CHUISKeybag_sharedInstance__block_invoke()
{
  CHUISKeybag *v0;
  void *v1;

  v0 = objc_alloc_init(CHUISKeybag);
  v1 = (void *)sharedInstance___keybag;
  sharedInstance___keybag = (uint64_t)v0;

}

- (CHUISKeybag)init
{
  CHUISKeybag *v2;
  uint64_t v3;
  OS_dispatch_queue *calloutQueue;
  uint64_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[4];
  CHUISKeybag *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, int);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CHUISKeybag;
  v2 = -[CHUISKeybag init](&v18, sel_init);
  if (v2)
  {
    v3 = BSDispatchQueueCreateWithQualityOfService();
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v3;

    v5 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E0C809B0];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __19__CHUISKeybag_init__block_invoke;
    v15 = &unk_1E6B84AC8;
    objc_copyWeak(&v16, &location);
    v2->_mkbRegistrationToken = (_MKBEvent *)MKBEventsRegister();
    v8 = v2->_queue;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __19__CHUISKeybag_init__block_invoke_2;
    block[3] = &unk_1E6B84AF0;
    v11 = v2;
    dispatch_sync(v8, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __19__CHUISKeybag_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 == 1 && WeakRetained)
    objc_msgSend(WeakRetained, "_queue_handleKeybagStatusChanged");

}

uint64_t __19__CHUISKeybag_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleKeybagStatusChanged");
}

- (BOOL)isEffectivelyLocked:(int64_t)a3
{
  NSObject *queue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CHUISKeybag_isEffectivelyLocked___block_invoke;
  block[3] = &unk_1E6B84B18;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

_QWORD *__35__CHUISKeybag_isEffectivelyLocked___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = 40;
  if (result[6])
    v1 = 41;
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_BYTE *)(result[4] + v1);
  return result;
}

- (void)addObserver:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHUISKeybag.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CHUISKeybag_addObserver___block_invoke;
  block[3] = &unk_1E6B84B40;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

uint64_t __27__CHUISKeybag_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHUISKeybag.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CHUISKeybag_removeObserver___block_invoke;
  block[3] = &unk_1E6B84B40;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

uint64_t __30__CHUISKeybag_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_handleKeybagStatusChanged
{
  void *v3;
  NSObject *calloutQueue;
  _QWORD v5[4];
  id v6;
  CHUISKeybag *v7;

  BSDispatchQueueAssert();
  -[CHUISKeybag _queue_evaluateState](self, "_queue_evaluateState");
  v3 = (void *)-[NSHashTable copy](self->_queue_observers, "copy");
  if (objc_msgSend(v3, "count"))
  {
    calloutQueue = self->_calloutQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47__CHUISKeybag__queue_handleKeybagStatusChanged__block_invoke;
    v5[3] = &unk_1E6B84B40;
    v6 = v3;
    v7 = self;
    dispatch_async(calloutQueue, v5);

  }
}

void __47__CHUISKeybag__queue_handleKeybagStatusChanged__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "keybagStateDidChange:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_queue_evaluateState
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  _BOOL4 v7;
  unsigned int v8;
  BOOL v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17 = CFSTR("ExtendedDeviceLockState");
  v18[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MKBGetDeviceLockStateInfo();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = v6 < 7;
  v8 = v7 & (0x46u >> v6);
  v9 = v7 & (6u >> v6);
  if (!BSEqualBools() || (BSEqualBools() & 1) == 0)
  {
    self->_queue_isEffectivelyLocked = v8;
    self->_queue_isEffectivelyLockedAuthentic = v9;
    CHUISLogKeybag();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("YES");
      if (self->_queue_isEffectivelyLocked)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (!self->_queue_isEffectivelyLockedAuthentic)
        v11 = CFSTR("NO");
      v13 = 138543618;
      v14 = v12;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_1B711E000, v10, OS_LOG_TYPE_DEFAULT, "Keybag state changed - locked default policy? %{public}@, locked authentic policy? %{public}@", (uint8_t *)&v13, 0x16u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

@end
