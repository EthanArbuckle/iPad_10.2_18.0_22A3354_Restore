@implementation HMDAccessoryFirmwareUpdateConcurrencyLogEventManager

- (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager)initWithCountersManager:(id)a3
{
  id v5;
  HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *v6;
  HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *v7;
  uint64_t v8;
  NSMutableArray *currentActivity;
  uint64_t v10;
  NSMutableArray *peakActivity;
  NSMutableDictionary *v12;
  NSMutableDictionary *inProgress;
  uint64_t i;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDAccessoryFirmwareUpdateConcurrencyLogEventManager;
  v6 = -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
    currentActivity = v7->_currentActivity;
    v7->_currentActivity = (NSMutableArray *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
    peakActivity = v7->_peakActivity;
    v7->_peakActivity = (NSMutableArray *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inProgress = v7->_inProgress;
    v7->_inProgress = v12;

    objc_storeStrong((id *)&v7->_countersManager, a3);
    for (i = 0; i != 7; ++i)
    {
      -[NSMutableArray setObject:atIndexedSubscript:](v7->_currentActivity, "setObject:atIndexedSubscript:", &unk_1E8B333D8, i);
      -[NSMutableArray setObject:atIndexedSubscript:](v7->_peakActivity, "setObject:atIndexedSubscript:", &unk_1E8B333D8, i);
    }
  }

  return v7;
}

- (void)startStagingWithAccessory:(id)a3
{
  uint64_t AccessoryFirmwareUpdateActiveTransport;
  uint64_t v5;
  id v6;

  v6 = a3;
  AccessoryFirmwareUpdateActiveTransport = getAccessoryFirmwareUpdateActiveTransport(v6);
  if ((unint64_t)(AccessoryFirmwareUpdateActiveTransport - 2) >= 3)
    v5 = 0;
  else
    v5 = (2 * (AccessoryFirmwareUpdateActiveTransport - 2)) | 1;
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager startWithCategory:accessory:](self, "startWithCategory:accessory:", v5, v6);

}

- (void)startApplyWithAccessory:(id)a3
{
  uint64_t AccessoryFirmwareUpdateActiveTransport;
  uint64_t v5;
  id v6;

  v6 = a3;
  AccessoryFirmwareUpdateActiveTransport = getAccessoryFirmwareUpdateActiveTransport(v6);
  if ((unint64_t)(AccessoryFirmwareUpdateActiveTransport - 2) >= 3)
    v5 = 0;
  else
    v5 = 2 * (AccessoryFirmwareUpdateActiveTransport - 2) + 2;
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager startWithCategory:accessory:](self, "startWithCategory:accessory:", v5, v6);

}

- (void)stopStagingWithAccessory:(id)a3
{
  uint64_t AccessoryFirmwareUpdateActiveTransport;
  uint64_t v5;
  id v6;

  v6 = a3;
  AccessoryFirmwareUpdateActiveTransport = getAccessoryFirmwareUpdateActiveTransport(v6);
  if ((unint64_t)(AccessoryFirmwareUpdateActiveTransport - 2) >= 3)
    v5 = 0;
  else
    v5 = (2 * (AccessoryFirmwareUpdateActiveTransport - 2)) | 1;
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager stopWithCategory:accessory:](self, "stopWithCategory:accessory:", v5, v6);

}

- (void)stopApplyWithAccessory:(id)a3
{
  uint64_t AccessoryFirmwareUpdateActiveTransport;
  uint64_t v5;
  id v6;

  v6 = a3;
  AccessoryFirmwareUpdateActiveTransport = getAccessoryFirmwareUpdateActiveTransport(v6);
  if ((unint64_t)(AccessoryFirmwareUpdateActiveTransport - 2) >= 3)
    v5 = 0;
  else
    v5 = 2 * (AccessoryFirmwareUpdateActiveTransport - 2) + 2;
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager stopWithCategory:accessory:](self, "stopWithCategory:accessory:", v5, v6);

}

- (void)startWithCategory:(unint64_t)a3 accessory:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager inProgress](self, "inProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 - 1 > 6)
        v14 = CFSTR("HMDAccessoryFirmwareUpdateConcurrencyCategoryUnknown");
      else
        v14 = off_1E89AF938[a3 - 1];
      v15 = objc_msgSend(v9, "unsignedIntValue") - 1;
      if (v15 > 6)
        v16 = CFSTR("HMDAccessoryFirmwareUpdateConcurrencyCategoryUnknown");
      else
        v16 = off_1E89AF938[v15];
      v31 = 138544130;
      v32 = v13;
      v33 = 2112;
      v34 = v14;
      v35 = 2112;
      v36 = v16;
      v37 = 2112;
      v38 = v6;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Starting %@ while %@ is in progress for accessory %@", (uint8_t *)&v31, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager stopStagingWithAccessory:](v11, "stopStagingWithAccessory:", v6);
  }
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager currentActivity](self, "currentActivity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager peakActivity](self, "peakActivity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedIntegerValue");

  if (v19 + 1 > v22)
    v23 = v19 + 1;
  else
    v23 = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager currentActivity](self, "currentActivity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:atIndexedSubscript:", v24, a3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager peakActivity](self, "peakActivity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:atIndexedSubscript:", v26, a3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager inProgress](self, "inProgress");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v30);

  os_unfair_lock_unlock(&self->_lock);
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager submitLogEvent](self, "submitLogEvent");

}

- (void)stopWithCategory:(unint64_t)a3 accessory:(id)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *v18;
  NSObject *v19;
  void *v20;
  unsigned int v21;
  const __CFString *v22;
  const __CFString *v23;
  os_unfair_lock_s *p_lock;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager inProgress](self, "inProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString uuid](v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v9, "unsignedIntValue");
    if (v10 != a3)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (a3 - 1 > 6)
          v16 = CFSTR("HMDAccessoryFirmwareUpdateConcurrencyCategoryUnknown");
        else
          v16 = off_1E89AF938[a3 - 1];
        if ((v10 - 1) > 6)
          v23 = CFSTR("HMDAccessoryFirmwareUpdateConcurrencyCategoryUnknown");
        else
          v23 = off_1E89AF938[(v10 - 1)];
        v38 = 138543874;
        v39 = v14;
        v40 = 2112;
        v41 = v16;
        v42 = 2112;
        v43 = v23;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping with mismatched categories current: %@, at start: %@", (uint8_t *)&v38, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager currentActivity](self, "currentActivity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedIntegerValue");

    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27 - 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager currentActivity](self, "currentActivity");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:atIndexedSubscript:", v28, v10);

    }
    else
    {
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v33;
        if ((v10 - 1) > 6)
          v35 = CFSTR("HMDAccessoryFirmwareUpdateConcurrencyCategoryUnknown");
        else
          v35 = off_1E89AF938[(v10 - 1)];
        v38 = 138543874;
        v39 = v33;
        v40 = 2112;
        v41 = v35;
        v42 = 2112;
        v43 = v6;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Stopping category %@ when current activity is 0 for accessory %@", (uint8_t *)&v38, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
    }
    -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager inProgress](self, "inProgress");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString uuid](v6, "uuid");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", 0, v37);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(0, "unsignedIntValue") - 1;
      if (v21 > 6)
        v22 = CFSTR("HMDAccessoryFirmwareUpdateConcurrencyCategoryUnknown");
      else
        v22 = off_1E89AF938[v21];
      v38 = 138543874;
      v39 = (uint64_t)v20;
      v40 = 2112;
      v41 = v22;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping %@ when nothing is in progress for accessory %@", (uint8_t *)&v38, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (unint64_t)differenceFromCounterWithCategory:(unint64_t)a3
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  if (a3 - 1 > 5)
  {
    v5 = 0;
  }
  else
  {
    v5 = CFSTR("HMDLogEventPeakConcurrentIPAccessoryUpdateStagingCounter");
    v6 = CFSTR("HMDLogEventPeakConcurrentIPAccessoryUpdateStagingCounter");
  }
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager countersManager](self, "countersManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fetchEventCounterForEventName:requestGroup:", v5, CFSTR("HMDLogEventAccessoryFirmwareUpdateRequestGroup"));

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager peakActivity](self, "peakActivity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager currentActivity](self, "currentActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  if (!v8 && v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager peakActivity](self, "peakActivity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:atIndexedSubscript:", v16, a3);

  }
  os_unfair_lock_unlock(p_lock);

  return v12 - v15;
}

- (void)submitLogEvent
{
  void *v2;
  HMDAccessoryFirmwareUpdateConcurrencyLogEvent *v3;

  v3 = -[HMDAccessoryFirmwareUpdateConcurrencyLogEvent initWithPeakConcurrentIPAccessoryUpdateStaging:peakConcurrentIPAccessoryUpdateApply:peakConcurrentBLEAccessoryUpdateStaging:peakConcurrentBLEAccessoryUpdateApply:peakConcurrentThreadAccessoryUpdateStaging:peakConcurrentThreadAccessoryUpdateApply:]([HMDAccessoryFirmwareUpdateConcurrencyLogEvent alloc], "initWithPeakConcurrentIPAccessoryUpdateStaging:peakConcurrentIPAccessoryUpdateApply:peakConcurrentBLEAccessoryUpdateStaging:peakConcurrentBLEAccessoryUpdateApply:peakConcurrentThreadAccessoryUpdateStaging:peakConcurrentThreadAccessoryUpdateApply:", -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager differenceFromCounterWithCategory:](self, "differenceFromCounterWithCategory:", 1), -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager differenceFromCounterWithCategory:](self, "differenceFromCounterWithCategory:", 2), -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager differenceFromCounterWithCategory:](self, "differenceFromCounterWithCategory:", 3), -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager differenceFromCounterWithCategory:](self, "differenceFromCounterWithCategory:",
           4),
         -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager differenceFromCounterWithCategory:](self, "differenceFromCounterWithCategory:", 5), -[HMDAccessoryFirmwareUpdateConcurrencyLogEventManager differenceFromCounterWithCategory:](self, "differenceFromCounterWithCategory:", 6));
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submitLogEvent:", v3);

}

- (NSMutableArray)currentActivity
{
  return self->_currentActivity;
}

- (void)setCurrentActivity:(id)a3
{
  objc_storeStrong((id *)&self->_currentActivity, a3);
}

- (NSMutableArray)peakActivity
{
  return self->_peakActivity;
}

- (void)setPeakActivity:(id)a3
{
  objc_storeStrong((id *)&self->_peakActivity, a3);
}

- (NSMutableDictionary)inProgress
{
  return self->_inProgress;
}

- (void)setInProgress:(id)a3
{
  objc_storeStrong((id *)&self->_inProgress, a3);
}

- (HMDEventCountersManager)countersManager
{
  return self->_countersManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countersManager, 0);
  objc_storeStrong((id *)&self->_inProgress, 0);
  objc_storeStrong((id *)&self->_peakActivity, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
}

@end
