@implementation HMFMemoryMonitor

+ (HMFMemoryMonitor)memoryMonitor
{
  if (_MergedGlobals_4 != -1)
    dispatch_once(&_MergedGlobals_4, &__block_literal_global_17);
  return (HMFMemoryMonitor *)(id)qword_1ED012DF0;
}

void __33__HMFMemoryMonitor_memoryMonitor__block_invoke()
{
  HMFMemoryMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(HMFMemoryMonitor);
  v1 = (void *)qword_1ED012DF0;
  qword_1ED012DF0 = (uint64_t)v0;

}

- (HMFMemoryMonitor)init
{
  HMFMemoryMonitor *v2;
  HMFMemoryMonitor *v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *clientQueue;
  NSObject *v8;
  dispatch_source_t v9;
  OS_dispatch_source *memoryPressureSource;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HMFMemoryMonitor;
  v2 = -[HMFMemoryMonitor init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)HMFDispatchQueueName(v2, 0);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v6;

    -[HMFMemoryMonitor clientQueue](v3, "clientQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 0x37uLL, v8);
    memoryPressureSource = v3->_memoryPressureSource;
    v3->_memoryPressureSource = (OS_dispatch_source *)v9;

    objc_initWeak(&location, v3);
    -[HMFMemoryMonitor memoryPressureSource](v3, "memoryPressureSource");
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __24__HMFMemoryMonitor_init__block_invoke;
    v13[3] = &unk_1E3B37BF8;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v11, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __24__HMFMemoryMonitor_init__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uintptr_t data;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  NSObject *v16;
  id v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  os_unfair_lock_s *WeakRetained;
  const __CFString *v31;
  _BYTE buf[12];
  __int16 v33;
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    -[os_unfair_lock_s memoryPressureSource](WeakRetained, "memoryPressureSource");
    v1 = objc_claimAutoreleasedReturnValue();
    data = dispatch_source_get_data(v1);

    if ((data & 7) == 0)
    {
      if ((data & 0x20) != 0)
        v6 = 2;
      else
        v6 = (data >> 4) & 1;
      v7 = (void *)MEMORY[0x1A1AC355C]();
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = off_1E3B385F0[v6];
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v9;
        v33 = 2112;
        v34 = v10;
        _os_log_impl(&dword_19B546000, v8, OS_LOG_TYPE_INFO, "%{public}@Received process memory pressure source event: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[os_unfair_lock_s lastProcessMemoryStateUpdateTime](WeakRetained, "lastProcessMemoryStateUpdateTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[os_unfair_lock_s lastProcessMemoryStateUpdateTime](WeakRetained, "lastProcessMemoryStateUpdateTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", v13);
        if (v14 <= 5.0)
        {
          v23 = v6 == -[os_unfair_lock_s lastProcessMemoryState](WeakRetained, "lastProcessMemoryState");

          if (v23)
            goto LABEL_23;
        }
        else
        {

        }
      }
      os_unfair_lock_lock_with_options();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(void **)&WeakRetained[12]._os_unfair_lock_opaque;
      *(_QWORD *)&WeakRetained[12]._os_unfair_lock_opaque = v24;

      *(_QWORD *)&WeakRetained[6]._os_unfair_lock_opaque = v6;
      os_unfair_lock_unlock(WeakRetained + 2);
      +[HMFNotificationCenter defaultCenter](HMFNotificationCenter, "defaultCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = HMFMemoryMonitorProcessMemoryPressureNotification;
      v28 = off_1E3B385F0[v6];
      v31 = CFSTR("HMFProcessMemoryStateUpdateKey");
      *(_QWORD *)buf = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v31, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "postNotificationName:object:userInfo:", v27, WeakRetained, v29);

      goto LABEL_23;
    }
    v3 = data & 1;
    if ((data & 2) != 0)
      v3 = 2;
    if ((data & 4) != 0)
      v4 = 3;
    else
      v4 = v3;
    v5 = WeakRetained + 2;
    os_unfair_lock_lock_with_options();
    if (*(_QWORD *)&WeakRetained[4]._os_unfair_lock_opaque == v4)
    {
      os_unfair_lock_unlock(v5);
    }
    else
    {
      *(_QWORD *)&WeakRetained[4]._os_unfair_lock_opaque = v4;
      os_unfair_lock_unlock(v5);
      v15 = (void *)MEMORY[0x1A1AC355C]();
      HMFGetOSLogHandle();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(0);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = off_1E3B385D0[v4];
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v17;
        v33 = 2112;
        v34 = v18;
        _os_log_impl(&dword_19B546000, v16, OS_LOG_TYPE_INFO, "%{public}@Received system memory pressure source event: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      +[HMFNotificationCenter defaultCenter](HMFNotificationCenter, "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = HMFMemoryMonitorSystemMemoryStateDidChangeNotification;
      v21 = off_1E3B385D0[v4];
      v31 = CFSTR("HMFSystemMemoryStateUpdateKey");
      *(_QWORD *)buf = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v31, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postNotificationName:object:userInfo:", v20, WeakRetained, v22);

    }
  }
LABEL_23:

}

- (void)dealloc
{
  NSObject *memoryPressureSource;
  objc_super v4;

  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource && !self->_monitoring)
    dispatch_resume(memoryPressureSource);
  v4.receiver = self;
  v4.super_class = (Class)HMFMemoryMonitor;
  -[HMFMemoryMonitor dealloc](&v4, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[HMFMemoryMonitor clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__HMFMemoryMonitor_start__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __25__HMFMemoryMonitor_start__block_invoke(uint64_t a1)
{
  NSObject *v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isMonitoring") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setMonitoring:", 1);
    objc_msgSend(*(id *)(a1 + 32), "memoryPressureSource");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v2);

  }
}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[HMFMemoryMonitor clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__HMFMemoryMonitor_stop__block_invoke;
  block[3] = &unk_1E3B37AF8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __24__HMFMemoryMonitor_stop__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isMonitoring");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "memoryPressureSource");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v3);

    return objc_msgSend(*(id *)(a1 + 32), "setMonitoring:", 0);
  }
  return result;
}

- (int64_t)systemMemoryState
{
  os_unfair_lock_s *p_lock;
  int64_t systemMemoryState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  systemMemoryState = self->_systemMemoryState;
  os_unfair_lock_unlock(p_lock);
  return systemMemoryState;
}

- (int64_t)lastProcessMemoryState
{
  os_unfair_lock_s *p_lock;
  int64_t lastProcessMemoryState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  lastProcessMemoryState = self->_lastProcessMemoryState;
  os_unfair_lock_unlock(p_lock);
  return lastProcessMemoryState;
}

- (NSDate)lastProcessMemoryStateUpdateTime
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_lastProcessMemoryStateUpdateTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSystemMemoryState:(int64_t)a3
{
  self->_systemMemoryState = a3;
}

- (void)setLastProcessMemoryState:(int64_t)a3
{
  self->_lastProcessMemoryState = a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (OS_dispatch_source)memoryPressureSource
{
  return self->_memoryPressureSource;
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (void)setLastProcessMemoryStateUpdateTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastProcessMemoryStateUpdateTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessMemoryStateUpdateTime, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
