@implementation HMHomeManagerRegisterForGenerationCounterNotifications

void ____HMHomeManagerRegisterForGenerationCounterNotifications_block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  os_unfair_lock_s *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = (os_unfair_lock_s *)WeakRetained;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Fetching home configuration due to generation counter update after delayed cache policy", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    os_unfair_lock_lock_with_options();
    -[os_unfair_lock_s setShouldConnect:](v3, "setShouldConnect:", 1);
    -[os_unfair_lock_s darwinNotificationProvider](v3, "darwinNotificationProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notifyCancel:", -[os_unfair_lock_s serverGenerationCounterDelayedConnectionToken](v3, "serverGenerationCounterDelayedConnectionToken"));

    -[os_unfair_lock_s setServerGenerationCounterDelayedConnectionToken:](v3, "setServerGenerationCounterDelayedConnectionToken:", 0xFFFFFFFFLL);
    os_unfair_lock_unlock(v3 + 2);
    -[os_unfair_lock_s _fetchHomeConfigurationWithRefreshRequested:](v3, "_fetchHomeConfigurationWithRefreshRequested:", 1);
  }

}

@end
