@implementation HMDCameraSignificantEventNotificationDebouncer

- (HMDCameraSignificantEventNotificationDebouncer)initWithLogIdentifier:(id)a3
{
  id v5;
  HMDCameraSignificantEventNotificationDebouncer *v6;
  HMDCameraSignificantEventNotificationDebouncer *v7;
  uint64_t v8;
  NSMutableDictionary *lastDateNotifiedByPersonIdentifier;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  HMFTimer *cleanupTimer;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraSignificantEventNotificationDebouncer;
  v6 = -[HMDCameraSignificantEventNotificationDebouncer init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_logIdentifier, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    lastDateNotifiedByPersonIdentifier = v7->_lastDateNotifiedByPersonIdentifier;
    v7->_lastDateNotifiedByPersonIdentifier = (NSMutableDictionary *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceForKey:", CFSTR("DistinctPersonNotificationDebounceInterval_Seconds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "doubleValue");
    v7->_distinctPersonDebounceTimeInterval = v13;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 12, 3600.0);
    cleanupTimer = v7->_cleanupTimer;
    v7->_cleanupTimer = (HMFTimer *)v14;

    -[HMFTimer setDelegate:](v7->_cleanupTimer, "setDelegate:", v7);
    -[HMFTimer resume](v7->_cleanupTimer, "resume");

  }
  return v7;
}

- (void)trackCameraSignificantEvent:(id)a3 shouldNotify:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  HMDCameraSignificantEventNotificationDebouncer *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v26;
  HMDCameraSignificantEventNotificationDebouncer *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDCameraSignificantEventNotificationDebouncer *v31;
  NSObject *v32;
  void *v33;
  _QWORD *v34;
  HMDCameraSignificantEventNotificationDebouncer *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDCameraSignificantEventNotificationDebouncer *v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  os_unfair_lock_t lock;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  double v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "reason") == 2)
  {
    objc_msgSend(v6, "faceClassification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v33;
        v49 = 2112;
        v50 = v6;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Significant Event: %@ did not have a recognized person, should notify", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      if (a4)
        *a4 = 1;
      goto LABEL_25;
    }
    lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDCameraSignificantEventNotificationDebouncer lastDateNotifiedByPersonIdentifier](self, "lastDateNotifiedByPersonIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v11);
      v14 = v13;

      v15 = -[HMDCameraSignificantEventNotificationDebouncer distinctPersonDebounceTimeInterval](self, "distinctPersonDebounceTimeInterval");
      v17 = v16;
      v18 = (void *)MEMORY[0x227676638](v15);
      v19 = self;
      HMFGetOSLogHandle();
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (id)objc_claimAutoreleasedReturnValue();
        -[HMDCameraSignificantEventNotificationDebouncer distinctPersonDebounceTimeInterval](v19, "distinctPersonDebounceTimeInterval");
        v23 = v22;
        HMFBooleanToString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v48 = v21;
        v49 = 2112;
        v50 = v11;
        v51 = 2112;
        v52 = v9;
        v53 = 2048;
        v54 = v14;
        v55 = 2048;
        v56 = v23;
        v57 = 2112;
        v58 = v24;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Last notification date: %@ for personIdentifier: %@, time interval: %.2f seconds, debounce interval: %.2f seconds, shouldNotify: %@", buf, 0x3Eu);

      }
      objc_autoreleasePoolPop(v18);
      if (v14 <= v17)
      {
        v25 = 0;
        if (!a4)
          goto LABEL_24;
        goto LABEL_23;
      }
    }
    else
    {
      v34 = MEMORY[0x227676638]((_QWORD *)0x24BDBC000);
      v35 = self;
      HMFGetOSLogHandle();
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v37;
        v49 = 2112;
        v50 = v9;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Debouncer has no record of previous notification for personIdentifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSignificantEventNotificationDebouncer lastDateNotifiedByPersonIdentifier](self, "lastDateNotifiedByPersonIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, v9);

    v40 = (void *)MEMORY[0x227676638]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSignificantEventNotificationDebouncer lastDateNotifiedByPersonIdentifier](v41, "lastDateNotifiedByPersonIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", v9);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v48 = v43;
      v49 = 2112;
      v50 = v45;
      v51 = 2112;
      v52 = v9;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@shouldNotify, tracking last notification date: %@ for personIdentifier: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v40);
    v25 = 1;
    if (!a4)
      goto LABEL_24;
LABEL_23:
    *a4 = v25;
LABEL_24:

    os_unfair_lock_unlock(lock);
LABEL_25:

    goto LABEL_26;
  }
  v26 = (void *)MEMORY[0x227676638]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v29;
    v49 = 2112;
    v50 = v6;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Significant Event: %@ is not for a person, should notify", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v26);
  if (a4)
    *a4 = 1;
LABEL_26:

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HMDCameraSignificantEventNotificationDebouncer *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *lastDateNotifiedByPersonIdentifier;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraSignificantEventNotificationDebouncer cleanupTimer](self, "cleanupTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    os_unfair_lock_lock_with_options();
    v10 = (void *)MEMORY[0x24BDBCED8];
    -[HMDCameraSignificantEventNotificationDebouncer lastDateNotifiedByPersonIdentifier](self, "lastDateNotifiedByPersonIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __63__HMDCameraSignificantEventNotificationDebouncer_timerDidFire___block_invoke;
    v15[3] = &unk_24E78FA28;
    v15[4] = self;
    objc_msgSend(v11, "na_filter:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithDictionary:", v12);
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    lastDateNotifiedByPersonIdentifier = self->_lastDateNotifiedByPersonIdentifier;
    self->_lastDateNotifiedByPersonIdentifier = v13;

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized timer: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (NSMutableDictionary)lastDateNotifiedByPersonIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (HMFTimer)cleanupTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (double)distinctPersonDebounceTimeInterval
{
  return self->_distinctPersonDebounceTimeInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
  objc_storeStrong((id *)&self->_lastDateNotifiedByPersonIdentifier, 0);
}

BOOL __63__HMDCameraSignificantEventNotificationDebouncer_timerDidFire___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a3, "timeIntervalSinceNow");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "distinctPersonDebounceTimeInterval");
  return v5 < v6 + v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_193185 != -1)
    dispatch_once(&logCategory__hmf_once_t8_193185, &__block_literal_global_193186);
  return (id)logCategory__hmf_once_v9_193187;
}

void __61__HMDCameraSignificantEventNotificationDebouncer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_193187;
  logCategory__hmf_once_v9_193187 = v0;

}

@end
