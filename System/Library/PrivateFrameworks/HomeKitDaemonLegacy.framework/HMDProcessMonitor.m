@implementation HMDProcessMonitor

+ (id)logCategory
{
  if (logCategory__hmf_once_t22_108261 != -1)
    dispatch_once(&logCategory__hmf_once_t22_108261, &__block_literal_global_21_108262);
  return (id)logCategory__hmf_once_v23_108263;
}

void __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = WeakRetained;
    v7 = v4;
    v8 = v5;
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v6;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v12;
      v57 = 2112;
      v58 = v8;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Received app state change: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v10, "processInfoForPID:", objc_msgSend(v7, "pid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v8, "state");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_updateProcessState:", v14);

      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v10;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "state");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v56 = v18;
        v57 = 2112;
        v58 = v13;
        v59 = 2112;
        v60 = v19;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating %@ with new state: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      if (objc_msgSend(v13, "state") != -1)
      {
        if ((objc_msgSend(v13, "isTerminated") & 1) != 0
          || (objc_msgSend(v13, "isBackgrounded") & 1) != 0
          || objc_msgSend(v13, "isSuspended"))
        {
          if ((objc_msgSend(v13, "isTerminated") & 1) == 0 && objc_msgSend(v13, "isEntitledForSPIAccess"))
          {
            objc_msgSend(v13, "applicationInfo");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "bundleIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v13, "isTerminated")
              || !objc_msgSend(v21, "isEqual:", *MEMORY[0x1E0CB9288]))
            {
              v39 = (void *)MEMORY[0x1D17BA0A0]();
              v40 = v16;
              HMFGetOSLogHandle();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v56 = v42;
                v57 = 2112;
                v58 = v21;
                _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Delaying notification of backgrounding, termination or suspension %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v39);
              objc_msgSend(v40, "pendingTerminatedApplications");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "addObject:", v13);

              objc_msgSend(v40, "spiClientTerminationDelayTimer");
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              {
                objc_msgSend(v40, "spiClientTerminationDelayTimer");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "kick");
              }
              else
              {
                v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 5.0);
                objc_msgSend(v40, "setSpiClientTerminationDelayTimer:", v50);

                objc_msgSend(v40, "spiClientTerminationDelayTimer");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setDelegate:", v40);

                objc_msgSend(v40, "queue");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "spiClientTerminationDelayTimer");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "setDelegateQueue:", v52);

                objc_msgSend(v40, "spiClientTerminationDelayTimer");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "resume");
              }

              goto LABEL_37;
            }
            v22 = (void *)MEMORY[0x1D17BA0A0]();
            v23 = v16;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v54 = v22;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v56 = v25;
              _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Handling HomeUIService termination with no delay", buf, 0xCu);

              v22 = v54;
            }

            objc_autoreleasePoolPop(v22);
          }
        }
        else
        {
          v46 = (void *)MEMORY[0x1D17BA0A0]();
          v47 = v16;
          HMFGetOSLogHandle();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v56 = v49;
            v57 = 2112;
            v58 = v13;
            _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@%@ back into foreground", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v46);
          if (objc_msgSend(v13, "isEntitledForSPIAccess"))
            objc_msgSend(v47, "removeFromPendingTerminated:", v13);
        }
        objc_msgSend(v16, "_processAppStateChange:", v13);
LABEL_37:

        goto LABEL_38;
      }
      v35 = MEMORY[0x1D17BA0A0]();
      v36 = v16;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v56 = v38;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Unknown appState - ignoring", buf, 0xCu);

      }
      v34 = (void *)v35;
    }
    else
    {
      v29 = MEMORY[0x1D17BA0A0]();
      v30 = v10;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v7, "pid");
        *(_DWORD *)buf = 138543618;
        v56 = v32;
        v57 = 2048;
        v58 = (id)v33;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot look up processInfo for pid %lu", buf, 0x16u);

      }
      v34 = (void *)v29;
    }
    objc_autoreleasePoolPop(v34);
    goto LABEL_37;
  }
  v26 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v56 = v28;
    _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Lost self for RBSProcessMonitorUpdateInfo.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v26);
LABEL_38:

}

- (void)removeFromPendingTerminated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDProcessMonitor *v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  HMDProcessMonitor *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  HMDProcessMonitor *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  HMDProcessMonitor *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "applicationInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[HMDProcessMonitor pendingTerminatedApplications](self, "pendingTerminatedApplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v29)
  {
    v11 = *(_QWORD *)v31;
    *(_QWORD *)&v10 = 138543618;
    v27 = v10;
    v28 = v7;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v13, "applicationInfo", v27);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v6);

        if (v16)
        {
          v17 = (void *)MEMORY[0x1D17BA0A0]();
          v18 = v7;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v20 = v4;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v27;
            v35 = v21;
            v36 = 2112;
            v37 = v6;
            _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping termination notification for %@", buf, 0x16u);

            v4 = v20;
            v7 = v28;
          }

          objc_autoreleasePoolPop(v17);
          -[HMDProcessMonitor pendingTerminatedApplications](v18, "pendingTerminatedApplications");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeObject:", v13);

          LODWORD(v22) = objc_msgSend(v13, "identifier");
          if ((_DWORD)v22 != objc_msgSend(v4, "identifier"))
            -[HMDProcessMonitor _removeProcess:](v18, "_removeProcess:", v13);
        }
      }
      v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v29);
  }

  -[HMDProcessMonitor pendingTerminatedApplications](v7, "pendingTerminatedApplications");
  v23 = v7;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (!v25)
  {
    -[HMDProcessMonitor spiClientTerminationDelayTimer](v23, "spiClientTerminationDelayTimer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "suspend");

    -[HMDProcessMonitor setSpiClientTerminationDelayTimer:](v23, "setSpiClientTerminationDelayTimer:", 0);
  }

}

- (NSMutableSet)pendingTerminatedApplications
{
  return self->_pendingTerminatedApplications;
}

- (HMFTimer)spiClientTerminationDelayTimer
{
  return self->_spiClientTerminationDelayTimer;
}

- (void)setSpiClientTerminationDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_spiClientTerminationDelayTimer, a3);
}

- (id)processInfoForPID:(int)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __HMDProcessMonitorProcessInfoForPID(self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_processAppStateChange:(id)a3
{
  id v4;
  void *v5;
  HMDProcessMonitor *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Processing change of state for %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (objc_msgSend(v4, "isTerminated"))
    -[HMDProcessMonitor removeProcess:](v6, "removeProcess:", v4);

}

- (id)processInfoForConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDProcessMonitor *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  __HMDProcessMonitorProcessInfoForPID(self, objc_msgSend(v4, "clientPid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    +[HMDProcessInfo processInfoWithConnection:](HMDProcessInfo, "processInfoWithConnection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](self->_processes, "addObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v5, "applicationInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addProcess:", v5);

    if (isInternalBuild())
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("processInfo");
      v21[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("HMDProcessMonitorProcessAddedNotification"), self, v8);

    }
    if (objc_msgSend(v5, "shouldMonitor"))
    {
      -[HMDProcessMonitor updateApplicationMonitor](self, "updateApplicationMonitor");
      objc_msgSend(v5, "processHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_updateProcessState:", v10);

    }
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Created process info: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

  return v5;
}

- (void)updateApplicationMonitor
{
  void *v3;
  NSMutableSet *processes;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  _QWORD aBlock[4];
  id v17;
  id v18;
  id location;
  _QWORD v20[4];
  id v21;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  processes = self->_processes;
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke;
  v20[3] = &unk_1E89B3210;
  v6 = v3;
  v21 = v6;
  -[NSMutableSet hmf_enumerateWithAutoreleasePoolUsingBlock:](processes, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(&location, self);
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_2;
  aBlock[3] = &unk_1E89B3260;
  v7 = v6;
  v17 = v7;
  objc_copyWeak(&v18, &location);
  v8 = _Block_copy(aBlock);
  -[HMDProcessMonitor queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_15;
  block[3] = &unk_1E89BC548;
  objc_copyWeak(&v15, &location);
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_3(id *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_4;
  block[3] = &unk_1E89BD988;
  objc_copyWeak(&v15, a1);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "shouldMonitor"))
  {
    objc_msgSend(v7, "processHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0D87DA0];
      objc_msgSend(v7, "processHandle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "predicateMatchingHandle:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    }
  }

}

void __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setPredicates:", *(_QWORD *)(a1 + 32));
  v4 = objc_alloc_init(MEMORY[0x1E0D87DC0]);
  v8[0] = *MEMORY[0x1E0D22E58];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndowmentNamespaces:", v5);

  objc_msgSend(v4, "setValues:", 25);
  objc_msgSend(v3, "setStateDescriptor:", v4);
  objc_msgSend(v3, "setServiceClass:", 25);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_3;
  v6[3] = &unk_1E89B3238;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  objc_msgSend(v3, "setUpdateHandler:", v6);
  objc_destroyWeak(&v7);

}

- (HMDProcessMonitor)initWithQueue:(id)a3
{
  id v5;
  HMDProcessMonitor *v6;
  HMDProcessMonitor *v7;
  uint64_t v8;
  NSMutableSet *processes;
  uint64_t v10;
  NSMutableSet *pendingTerminatedApplications;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDProcessMonitor;
  v6 = -[HMDProcessMonitor init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    processes = v7->_processes;
    v7->_processes = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    pendingTerminatedApplications = v7->_pendingTerminatedApplications;
    v7->_pendingTerminatedApplications = (NSMutableSet *)v10;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[RBSProcessMonitor invalidate](self->_internal, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HMDProcessMonitor;
  -[HMDProcessMonitor dealloc](&v3, sel_dealloc);
}

- (NSArray)processes
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_processes, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)foregroundProcesses
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_processes, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_108235);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (void)addProcess:(id)a3
{
  id v4;
  void *v5;
  HMDProcessMonitor *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding process info: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  -[NSMutableSet addObject:](v6->_processes, "addObject:", v4);
  os_unfair_lock_unlock(&v6->_lock);

}

- (void)removeProcess:(id)a3
{
  id v4;
  void *v5;
  HMDProcessMonitor *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing process info: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDProcessMonitor _removeProcess:](v6, "_removeProcess:", v4);
  objc_msgSend(v4, "applicationInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "processes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (!v12)
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = v10;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating application monitor because last process info was removed from application info", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      -[HMDProcessMonitor updateApplicationMonitor](v6, "updateApplicationMonitor");
    }
  }

}

- (void)_removeProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet removeObject:](self->_processes, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  if ((isInternalBuild() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("processInfo");
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("HMDProcessMonitorProcessRemovedNotification"), self, v6);

  }
  objc_msgSend(v4, "applicationInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeProcess:", v4);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDProcessMonitor *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDProcessMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDProcessMonitor spiClientTerminationDelayTimer](self, "spiClientTerminationDelayTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6 == v4)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Processing pending terminated applications after timer expired", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[HMDProcessMonitor pendingTerminatedApplications](v8, "pendingTerminatedApplications", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          -[HMDProcessMonitor _processAppStateChange:](v8, "_processAppStateChange:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

    -[HMDProcessMonitor pendingTerminatedApplications](v8, "pendingTerminatedApplications");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeAllObjects");

    -[HMDProcessMonitor spiClientTerminationDelayTimer](v8, "spiClientTerminationDelayTimer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "suspend");

    -[HMDProcessMonitor setSpiClientTerminationDelayTimer:](v8, "setSpiClientTerminationDelayTimer:", 0);
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Received an unknown watchdog timer expiry", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTerminatedApplications, 0);
  objc_storeStrong((id *)&self->_spiClientTerminationDelayTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

id __40__HMDProcessMonitor_foregroundProcesses__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "isForegrounded"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

void __45__HMDProcessMonitor_updateApplicationMonitor__block_invoke_15(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[2])
    {
      if (objc_msgSend(*(id *)(a1 + 32), "count"))
      {
        objc_msgSend(MEMORY[0x1E0D87D90], "monitorWithConfiguration:", *(_QWORD *)(a1 + 40));
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v3[2];
        v3[2] = v9;
        goto LABEL_11;
      }
      if (!v3[2])
      {
        v5 = 0;
        goto LABEL_4;
      }
    }
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = (void *)v3[2];
    if (v4)
    {
LABEL_4:
      objc_msgSend(v5, "updateConfiguration:", *(_QWORD *)(a1 + 40));
      goto LABEL_12;
    }
    objc_msgSend(v5, "invalidate");
    v10 = (void *)v3[2];
    v3[2] = 0;
LABEL_11:

    goto LABEL_12;
  }
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Lost self pointer for HMDProcessMonitor configuration block.", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
LABEL_12:

}

void __32__HMDProcessMonitor_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v23_108263;
  logCategory__hmf_once_v23_108263 = v0;

}

@end
