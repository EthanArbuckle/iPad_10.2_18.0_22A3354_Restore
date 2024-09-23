@implementation NRActiveDeviceAssertionMonitor

+ (id)sharedInstance
{
  if (_MergedGlobals_11 != -1)
    dispatch_once(&_MergedGlobals_11, &__block_literal_global_9);
  return (id)qword_1ECE23908;
}

void __48__NRActiveDeviceAssertionMonitor_sharedInstance__block_invoke()
{
  NRActiveDeviceAssertionMonitor *v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v0 = [NRActiveDeviceAssertionMonitor alloc];
  if (v0)
  {
    v8.receiver = v0;
    v8.super_class = (Class)NRActiveDeviceAssertionMonitor;
    v1 = objc_msgSendSuper2(&v8, sel_init);
    if (v1)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)v1[2];
      v1[2] = v2;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = dispatch_queue_create("com.apple.NanoRegistry.NRActiveDeviceAssertionMonitor", v4);
      v6 = (void *)v1[3];
      v1[3] = v5;

      *((_DWORD *)v1 + 2) = -1;
    }
  }
  else
  {
    v1 = 0;
  }
  v7 = (void *)qword_1ECE23908;
  qword_1ECE23908 = (uint64_t)v1;

}

- (BOOL)hasActiveAssertion
{
  NSObject *workQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__NRActiveDeviceAssertionMonitor_hasActiveAssertion__block_invoke;
  v5[3] = &unk_1E4494F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__NRActiveDeviceAssertionMonitor_hasActiveAssertion__block_invoke(uint64_t a1)
{
  int v2;
  uint32_t v3;
  uint32_t v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint32_t state;
  uint32_t v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint32_t v13;
  uint32_t v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  int out_token;
  uint8_t buf[4];
  uint32_t v20;
  uint64_t state64[2];

  state64[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
  out_token = v2;
  if (v2 != -1)
    goto LABEL_8;
  v3 = notify_register_check("com.apple.NanoRegistry.NRActiveDeviceAssertion", &out_token);
  if (v3)
  {
    v4 = v3;
    nr_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      nr_framework_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LODWORD(state64[0]) = 67109120;
        HIDWORD(state64[0]) = v4;
        _os_log_error_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_ERROR, "Failed to register short lived token with status: (%u)", (uint8_t *)state64, 8u);
      }

    }
  }
  v2 = out_token;
  if (out_token != -1)
  {
LABEL_8:
    state64[0] = 0;
    state = notify_get_state(v2, state64);
    if (state)
    {
      v9 = state;
      nr_framework_log();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (v11)
      {
        nr_framework_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v20 = v9;
          _os_log_error_impl(&dword_1A0BDB000, v12, OS_LOG_TYPE_ERROR, "Failed to query token value with status: (%u)", buf, 8u);
        }

      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = state64[0] == 1;
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) == -1)
    {
      v13 = notify_cancel(out_token);
      if (v13)
      {
        v14 = v13;
        nr_framework_log();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

        if (v16)
        {
          nr_framework_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v20 = v14;
            _os_log_error_impl(&dword_1A0BDB000, v17, OS_LOG_TYPE_ERROR, "Failed to unregister short lived token with status: (%u)", buf, 8u);
          }

        }
      }
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NRActiveDeviceAssertionMonitor_addObserver___block_invoke;
  block[3] = &unk_1E4495030;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(workQueue, block);

}

void __46__NRActiveDeviceAssertionMonitor_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint32_t v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;
  uint8_t buf[4];
  uint32_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count") == 1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      if (*(_DWORD *)(v2 + 8) == -1)
      {
        objc_initWeak(&location, (id)v2);
        v3 = *(NSObject **)(v2 + 24);
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __53__NRActiveDeviceAssertionMonitor_startObservingToken__block_invoke;
        v8[3] = &unk_1E4495940;
        objc_copyWeak(&v9, &location);
        v4 = notify_register_dispatch("com.apple.NanoRegistry.NRActiveDeviceAssertion", (int *)(v2 + 8), v3, v8);
        if (v4)
        {
          nr_framework_log();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

          if (v6)
          {
            nr_framework_log();
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              v12 = v4;
              _os_log_error_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_ERROR, "Failed to register observer with status: (%u)", buf, 8u);
            }

          }
        }
        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__NRActiveDeviceAssertionMonitor_removeObserver___block_invoke;
  v7[3] = &unk_1E4495030;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __49__NRActiveDeviceAssertionMonitor_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint32_t v4;
  uint32_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      v3 = *(_DWORD *)(v2 + 8);
      if (v3 != -1)
      {
        v4 = notify_cancel(v3);
        if (v4)
        {
          v5 = v4;
          nr_framework_log();
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

          if (v7)
          {
            nr_framework_log();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              v9[0] = 67109120;
              v9[1] = v5;
              _os_log_error_impl(&dword_1A0BDB000, v8, OS_LOG_TYPE_ERROR, "Failed to unregister observer with status: (%u)", (uint8_t *)v9, 8u);
            }

          }
        }
        *(_DWORD *)(v2 + 8) = -1;
      }
    }
  }
}

void __53__NRActiveDeviceAssertionMonitor_startObservingToken__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = WeakRetained;
    v2 = WeakRetained[2];
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v13;
      v6 = MEMORY[0x1E0C809B0];
      v7 = MEMORY[0x1E0C80D38];
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v2);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
          block[0] = v6;
          block[1] = 3221225472;
          block[2] = __64__NRActiveDeviceAssertionMonitor_notifyObserversWithTokenValue___block_invoke;
          block[3] = &unk_1E4494FB8;
          block[4] = v9;
          dispatch_async(v7, block);
          ++v8;
        }
        while (v4 != v8);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v4);
    }

    WeakRetained = v10;
  }

}

uint64_t __64__NRActiveDeviceAssertionMonitor_notifyObserversWithTokenValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activeDeviceAssertionStateDidChange");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
