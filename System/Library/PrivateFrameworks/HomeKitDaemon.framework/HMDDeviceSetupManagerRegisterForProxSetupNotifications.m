@implementation HMDDeviceSetupManagerRegisterForProxSetupNotifications

void ____HMDDeviceSetupManagerRegisterForProxSetupNotifications_block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  _BOOL8 IsProxSetupRunning;
  _BOOL8 v6;
  void *v7;
  os_unfair_lock_s *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _BYTE buf[12];
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (os_unfair_lock_s *)WeakRetained;
    v4 = v3 + 2;
    os_unfair_lock_lock_with_options();
    IsProxSetupRunning = __HMDDeviceSetupManagerIsProxSetupRunning(v3);
    v6 = IsProxSetupRunning;
    if (LOBYTE(v3[4]._os_unfair_lock_opaque) == IsProxSetupRunning)
    {
      os_unfair_lock_unlock(v4);
    }
    else
    {
      LOBYTE(v3[4]._os_unfair_lock_opaque) = IsProxSetupRunning;
      os_unfair_lock_unlock(v4);
      v7 = (void *)MEMORY[0x227676638]();
      v8 = v3;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v10;
        v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received notification ProxSetup is running: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[os_unfair_lock_s notificationCenter](v8, "notificationCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("running");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v15, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("HMDDeviceSetupManagerUpdatedRunningNotification"), v8, v14);

    }
  }

}

@end
