@implementation HMDSelfRemovalWatchdog

- (HMDSelfRemovalWatchdog)initWithCurrentAccessoryUUID:(id)a3 workQueue:(id)a4
{
  id v7;
  id v8;
  HMDSelfRemovalWatchdog *v9;
  HMDSelfRemovalWatchdog *v10;
  uint64_t v11;
  NSDate *selfRemovalBeginDate;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDSelfRemovalWatchdog;
  v9 = -[HMDSelfRemovalWatchdog init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currentAccessoryUUID, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    selfRemovalBeginDate = v10->_selfRemovalBeginDate;
    v10->_selfRemovalBeginDate = (NSDate *)v11;

  }
  return v10;
}

- (void)configure
{
  void *v3;
  HMDCoreDataCloudMirroringExportStatusMonitor *v4;
  HMDCoreDataCloudMirroringExportStatusMonitor *monitor;
  void *v6;
  void *v7;
  void *v8;
  HMDSelfRemovalWatchdog *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  +[HMDCoreDataCloudTransform sharedInstance](HMDCoreDataCloudTransform, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (HMDCoreDataCloudMirroringExportStatusMonitor *)objc_msgSend(v3, "newCloudMirrorExportStatusMonitor");
  monitor = self->_monitor;
  self->_monitor = v4;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__76974;
  v18 = __Block_byref_object_dispose__76975;
  v19 = 0;
  -[HMDSelfRemovalWatchdog monitor](self, "monitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __35__HMDSelfRemovalWatchdog_configure__block_invoke;
  v13[3] = &unk_24E79B698;
  v13[4] = self;
  v13[5] = &v14;
  objc_msgSend(v7, "performBlockAndWait:", v13);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15[5];
    *(_DWORD *)buf = 138543618;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@modelObjectID for current accessory found: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDSelfRemovalWatchdog setCurrentAccessoryModelObjectID:](v9, "setCurrentAccessoryModelObjectID:", v15[5]);
  _Block_object_dispose(&v14, 8);

}

- (void)startWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[HMDCoreDataCloudTransform sharedInstance](HMDCoreDataCloudTransform, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__HMDSelfRemovalWatchdog_startWithCompletion___block_invoke;
  v7[3] = &unk_24E79B3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "runTransformWithCompletion:", v7);

}

- (void)_stopWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMDSelfRemovalWatchdog watchdogTimer](self, "watchdogTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspend");

  -[HMDSelfRemovalWatchdog completion](self, "completion");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);

  -[HMDSelfRemovalWatchdog setCompletion:](self, "setCompletion:", 0);
}

- (id)_retrieveExpectedObjectIDsTokenMap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDSelfRemovalWatchdog *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDSelfRemovalWatchdog *v38;
  NSObject *v39;
  void *v40;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBB710];
  -[HMDSelfRemovalWatchdog selfRemovalBeginDate](self, "selfRemovalBeginDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchHistoryAfterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setResultType:", 5);
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudPrivateStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAffectedStores:", v8);

  -[HMDSelfRemovalWatchdog monitor](self, "monitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v10, "executeRequest:error:", v5, &v50);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v50;

  if (v11)
  {
    v42 = v12;
    v43 = v11;
    v44 = v5;
    objc_msgSend(v11, "result");
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v47;
      while (2)
      {
        v17 = v13;
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v47 != v16)
            objc_enumerationMutation(v17);
          v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v19, "changes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = MEMORY[0x24BDAC760];
          v45[1] = 3221225472;
          v45[2] = __60__HMDSelfRemovalWatchdog__retrieveExpectedObjectIDsTokenMap__block_invoke;
          v45[3] = &unk_24E7805F8;
          v45[4] = self;
          objc_msgSend(v20, "na_firstObjectPassingTest:", v45);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v27 = v19;
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 0u;
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            objc_msgSend(v27, "changes");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, buf, 16);
            v13 = v17;
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v52;
              do
              {
                for (j = 0; j != v31; ++j)
                {
                  if (*(_QWORD *)v52 != v32)
                    objc_enumerationMutation(v29);
                  v34 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
                  objc_msgSend(v27, "token");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "changedObjectID");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "setObject:forKey:", v35, v36);

                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, buf, 16);
              }
              while (v31);
            }

            v26 = (void *)objc_msgSend(v28, "copy");
            goto LABEL_21;
          }
        }
        v13 = v17;
        v15 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v15)
          continue;
        break;
      }
    }

    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to find transaction that did the self removal", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v26 = 0;
LABEL_21:
    v11 = v43;
    v5 = v44;
    v12 = v42;

  }
  else
  {
    v37 = (void *)MEMORY[0x227676638]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v40;
      v59 = 2112;
      v60 = v12;
      _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch store history: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    v26 = 0;
  }

  return v26;
}

- (void)monitorDidObserveExportComplete:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[HMDSelfRemovalWatchdog monitor](self, "monitor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__HMDSelfRemovalWatchdog_monitorDidObserveExportComplete___block_invoke;
  v6[3] = &unk_24E79C240;
  v6[4] = self;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMDSelfRemovalWatchdog *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Timeout waiting for cloud mirroring export to complete", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDSelfRemovalWatchdog monitor](v6, "monitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39__HMDSelfRemovalWatchdog_timerDidFire___block_invoke;
  v11[3] = &unk_24E79C240;
  v11[4] = v6;
  objc_msgSend(v10, "performBlock:", v11);

}

- (NSUUID)currentAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)selfRemovalBeginDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWatchdogTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (id)completion
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSManagedObjectID)currentAccessoryModelObjectID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentAccessoryModelObjectID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (HMDCoreDataCloudMirroringExportStatusMonitor)monitor
{
  return (HMDCoreDataCloudMirroringExportStatusMonitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_currentAccessoryModelObjectID, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_selfRemovalBeginDate, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentAccessoryUUID, 0);
}

void __39__HMDSelfRemovalWatchdog_timerDidFire___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_stopWithError:", v2);

}

uint64_t __58__HMDSelfRemovalWatchdog_monitorDidObserveExportComplete___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Cloud mirroring export is finished", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_stopWithError:", 0);
}

uint64_t __60__HMDSelfRemovalWatchdog__retrieveExpectedObjectIDsTokenMap__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "changeType") == 2)
  {
    objc_msgSend(v3, "changedObjectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentAccessoryModelObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __46__HMDSelfRemovalWatchdog_startWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "monitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__HMDSelfRemovalWatchdog_startWithCompletion___block_invoke_2;
  v5[3] = &unk_24E79C2B8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "performBlock:", v5);

}

void __46__HMDSelfRemovalWatchdog_startWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setCompletion:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "watchdogTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 1, 55.0);
  objc_msgSend(*(id *)(a1 + 32), "setWatchdogTimer:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "watchdogTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

  objc_msgSend(*(id *)(a1 + 32), "watchdogTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resume");

  objc_msgSend(*(id *)(a1 + 32), "_retrieveExpectedObjectIDsTokenMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v11;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Self removal expected objectIDs token map: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Started monitoring cloud export", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v16, "monitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v16);

    objc_msgSend(*(id *)(a1 + 32), "monitor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configureWithExpectedObjectIDToExportedToken:", v7);
  }
  else
  {
    v19 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_stopWithError:", v18);
  }

}

void __35__HMDSelfRemovalWatchdog_configure__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  +[MKFCKAppleMediaAccessory fetchRequest](MKFCKAppleMediaAccessory, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(*(id *)(a1 + 32), "currentAccessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("modelID"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 32), "monitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v2, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;

  if (v8 && !objc_msgSend(v8, "hmf_isEmpty"))
  {
    objc_msgSend(v8, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectID");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentAccessoryUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch current accessory cloud model with UUID %@ due to error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_76989 != -1)
    dispatch_once(&logCategory__hmf_once_t9_76989, &__block_literal_global_76990);
  return (id)logCategory__hmf_once_v10_76991;
}

void __37__HMDSelfRemovalWatchdog_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_76991;
  logCategory__hmf_once_v10_76991 = v0;

}

@end
