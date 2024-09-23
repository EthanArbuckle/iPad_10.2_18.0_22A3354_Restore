@implementation AMSMemoryPressure

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AMSMemoryPressure_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

void __31__AMSMemoryPressure_initialize__block_invoke(uint64_t a1)
{
  dispatch_source_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v2 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 7uLL, 0);
  v3 = (void *)qword_1ECEAD608;
  qword_1ECEAD608 = (uint64_t)v2;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = qword_1ECEAD608;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__AMSMemoryPressure_initialize__block_invoke_2;
  v5[3] = &unk_1E253E9A0;
  objc_copyWeak(&v6, &location);
  dispatch_source_set_event_handler(v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __31__AMSMemoryPressure_initialize__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[AMSMemoryPressure _memoryPressureStatusForMemoryPressure:](AMSMemoryPressure, "_memoryPressureStatusForMemoryPressure:", dispatch_source_get_data((dispatch_source_t)qword_1ECEAD608));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WeakRetained;
  objc_sync_enter(v3);
  if ((objc_msgSend((id)_MergedGlobals_124, "isEqualToString:", v2) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 138543874;
      v10 = (id)objc_opt_class();
      v11 = 2114;
      v12 = _MergedGlobals_124;
      v13 = 2114;
      v14 = v2;
      v7 = v10;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_INFO, "%{public}@: The memory pressure status changed. old = %{public}@ | new = %{public}@", (uint8_t *)&v9, 0x20u);

    }
    if (_MergedGlobals_124 || (objc_msgSend(v2, "isEqualToString:", 0) & 1) == 0)
      v4 = v2;
    else
      v4 = 0;
    objc_storeStrong((id *)&_MergedGlobals_124, v2);
  }
  objc_sync_exit(v3);

  if (v4)
  {
    objc_msgSend(v3, "observable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendResult:", v4);

  }
}

+ (NSString)lastKnownStatus
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)_MergedGlobals_124;
  objc_sync_exit(v2);

  return (NSString *)v3;
}

+ (AMSObservable)observable
{
  if (qword_1ECEAD610 != -1)
    dispatch_once(&qword_1ECEAD610, &__block_literal_global_80);
  return (AMSObservable *)(id)qword_1ECEAD618;
}

void __31__AMSMemoryPressure_observable__block_invoke()
{
  AMSObservable *v0;
  void *v1;

  v0 = objc_alloc_init(AMSObservable);
  v1 = (void *)qword_1ECEAD618;
  qword_1ECEAD618 = (uint64_t)v0;

}

+ (void)subscribe:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "observable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v4);

}

+ (void)unsubscribe:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "observable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsubscribe:", v4);

}

+ (id)_memoryPressureStatusForMemoryPressure:(unsigned int)a3
{
  return 0;
}

@end
