@implementation HMFLocationManagerOperationStartMonitoring

void ____HMFLocationManagerOperationStartMonitoring_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  os_unfair_lock_s *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a1;
  v16 = *MEMORY[0x1E0C80C00];
  if (!qword_1ED013028)
  {
    v14 = xmmword_1E3B396E8;
    v15 = 0;
    a1 = _sl_dlopen();
    qword_1ED013028 = a1;
  }
  if (qword_1ED013028)
  {
    objc_msgSend(*(id *)(v4 + 32), "authorization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(v4 + 32);
    NSStringFromSelector(sel_isMonitoring);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v6, v7, 5, HMFLocationManagerOperationMonitoringContext);

    v8 = (os_unfair_lock_s *)(*(_QWORD *)(v4 + 32) + 312);
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(*(_QWORD *)(v4 + 32) + 316) = 1;
    os_unfair_lock_unlock(v8);
    objc_msgSend(v5, "registerObserver:", *(_QWORD *)(v4 + 32));
  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC355C](a1, a2, a3, a4);
    v10 = *(id *)(v4 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 138543362;
      *(_QWORD *)((char *)&v14 + 4) = v12;
      _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing internal location manager", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v13 = *(void **)(v4 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 11, CFSTR("Unexpected internal state."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cancelWithError:", v5);
  }

}

@end
