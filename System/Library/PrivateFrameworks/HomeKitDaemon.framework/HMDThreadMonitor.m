@implementation HMDThreadMonitor

- (void)resetWithRadarInitiator:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  id v11;

  self->counterLock._os_unfair_lock_opaque = 0;
  self->currentCount = 0;
  v4 = (void *)MEMORY[0x24BE3F248];
  v5 = a3;
  objc_msgSend(v4, "sharedPreferences");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferenceForKey:", CFSTR("threadMonitorThreshold"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if (v8 <= 20)
    v9 = 20;
  else
    v9 = v8;
  self->threshold = v9;
  objc_msgSend(v11, "preferenceForKey:", CFSTR("threadMonitorEnableTTR"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->ttrEnabled = objc_msgSend(v10, "BOOLValue");

  self->_previousHook = 0;
  objc_storeWeak((id *)&self->_radarInitiator, v5);

}

- (BOOL)setup
{
  int v3;
  void *v4;
  void *v5;
  HMDThreadMonitor *v6;
  NSObject *v7;
  void *v8;
  ipc_space_t *v9;
  uint64_t v10;
  void *v11;
  HMDThreadMonitor *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  unint64_t i;
  uint64_t v20;
  uint64_t v21;
  unint64_t threshold;
  _BOOL4 ttrEnabled;
  void (*v24)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v25;
  HMDThreadMonitor *v26;
  NSObject *v27;
  void *v28;
  thread_act_array_t v30;
  mach_msg_type_number_t act_listCnt;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  mach_msg_type_number_t v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = HMFIsInternalBuild();
  if (!v3)
    return v3;
  +[HMDTTRManager sharedManager](HMDTTRManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDThreadMonitor resetWithRadarInitiator:](self, "resetWithRadarInitiator:", v4);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@starting thread monitoring", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  v10 = *MEMORY[0x24BDAEC58];
  act_listCnt = 0;
  v30 = 0;
  if (task_threads(v10, &v30, &act_listCnt))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v14;
    v15 = "%{public}@Failed to get initial thread count";
    v16 = v13;
    v17 = OS_LOG_TYPE_ERROR;
    v18 = 12;
    goto LABEL_14;
  }
  if (act_listCnt)
  {
    for (i = 0; i < act_listCnt; mach_port_deallocate(*v9, v30[i++]))
      ;
    v20 = 4 * act_listCnt;
  }
  else
  {
    v20 = 0;
  }
  v21 = MEMORY[0x227677154](v10, v30, v20);
  v6->currentCount = act_listCnt;
  v11 = (void *)MEMORY[0x227676638](v21);
  v12 = v6;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    threshold = v12->threshold;
    ttrEnabled = v12->ttrEnabled;
    *(_DWORD *)buf = 138544130;
    v33 = v14;
    v34 = 1024;
    v35 = act_listCnt;
    v36 = 2048;
    v37 = threshold;
    v38 = 1024;
    v39 = ttrEnabled;
    v15 = "%{public}@initial thread count: %u (threshold: %zu, TTR enabled: %u)";
    v16 = v13;
    v17 = OS_LOG_TYPE_INFO;
    v18 = 34;
LABEL_14:
    _os_log_impl(&dword_2218F0000, v16, v17, v15, buf, v18);

  }
LABEL_15:

  objc_autoreleasePoolPop(v11);
  v24 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))pthread_introspection_hook_install((pthread_introspection_hook_t)HMDPthreadHook);
  v6->_previousHook = v24;
  if (v24 == HMDPthreadHook)
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = v6;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Reinstalling the same hook", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    v6->_previousHook = 0;
  }
  return v3;
}

- (void)pthreadHookWithEvent:(unsigned int)a3
{
  os_unfair_lock_s *p_counterLock;
  uint64_t v6;
  unint64_t v7;
  unint64_t threshold;
  void *v9;
  HMDThreadMonitor *v10;
  NSObject *v11;
  void *v12;
  unint64_t currentCount;
  void *v14;
  id WeakRetained;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  p_counterLock = &self->counterLock;
  v6 = os_unfair_lock_lock_with_options();
  if (a3 == 1)
  {
    v7 = self->currentCount + 1;
    self->currentCount = v7;
    threshold = self->threshold;
    if (v7 >= threshold)
    {
      v9 = (void *)MEMORY[0x227676638](v6);
      v10 = self;
      HMFGetOSLogHandle();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        currentCount = self->currentCount;
        *(_DWORD *)buf = 138543618;
        v17 = v12;
        v18 = 2048;
        v19 = currentCount;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Above thread count threshold: %zu", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v7 = self->currentCount;
      threshold = self->threshold;
    }
    if (v7 == threshold && self->ttrEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("homed thread count is above %zu"), threshold);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_radarInitiator);
      objc_msgSend(WeakRetained, "requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:", v14, v14, CFSTR("HomeKit"), CFSTR("Performance - cpu"), 1653014);

    }
  }
  else if (a3 == 4)
  {
    --self->currentCount;
  }
  os_unfair_lock_unlock(p_counterLock);
}

- (void)previousHook
{
  return self->_previousHook;
}

- (HMMRadarInitiating)radarInitiator
{
  return (HMMRadarInitiating *)objc_loadWeakRetained((id *)&self->_radarInitiator);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_radarInitiator);
}

+ (id)sharedInstance
{
  if (sharedInstance__hmf_once_t0 != -1)
    dispatch_once(&sharedInstance__hmf_once_t0, &__block_literal_global_87444);
  return (id)sharedInstance__hmf_once_v1;
}

+ (id)createWithRadarInitiator:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HMDThreadMonitor sharedInstance](HMDThreadMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "resetWithRadarInitiator:", v3);

  return v5;
}

+ (void)start
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  _QWORD block[4];
  void *v8;

  +[HMDThreadMonitor sharedInstance](HMDThreadMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__HMDThreadMonitor_start__block_invoke;
  block[3] = &unk_24E79C240;
  v8 = v2;
  v3 = start__hmf_once_t3;
  v4 = v2;
  v6 = v4;
  if (v3 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&start__hmf_once_t3, block);
    v5 = v8;
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_87439 != -1)
    dispatch_once(&logCategory__hmf_once_t12_87439, &__block_literal_global_9_87440);
  return (id)logCategory__hmf_once_v13_87441;
}

void __31__HMDThreadMonitor_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v13_87441;
  logCategory__hmf_once_v13_87441 = v0;

}

uint64_t __25__HMDThreadMonitor_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setup");
}

void __34__HMDThreadMonitor_sharedInstance__block_invoke()
{
  HMDThreadMonitor *v0;
  void *v1;

  v0 = [HMDThreadMonitor alloc];
  v1 = (void *)sharedInstance__hmf_once_v1;
  sharedInstance__hmf_once_v1 = (uint64_t)v0;

}

@end
