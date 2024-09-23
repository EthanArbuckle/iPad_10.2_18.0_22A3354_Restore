@implementation HMDCounterThresholdTTRTrigger

- (HMDCounterThresholdTTRTrigger)initWithThreshold:(int64_t)a3 ttrCategory:(id)a4 radarInitiator:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCounterThresholdTTRTrigger *v15;

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("HomeKit Issue Detected: [%@]. Please file a radar against: HomeKit | New Bugs"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HomeKit Issue Detected: [%@]"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 590644);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDCounterThresholdTTRTrigger initWithThreshold:message:radarTitle:componentName:componentVersion:componentID:radarInitiator:](self, "initWithThreshold:message:radarTitle:componentName:componentVersion:componentID:radarInitiator:", a3, v11, v12, CFSTR("HomeKit"), CFSTR("New Bugs"), v14, v9);

  return v15;
}

- (HMDCounterThresholdTTRTrigger)initWithThreshold:(int64_t)a3 message:(id)a4 radarTitle:(id)a5 componentName:(id)a6 componentVersion:(id)a7 componentID:(id)a8 radarInitiator:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[HMDCounterThresholdTTRTrigger initWithThreshold:message:radarTitle:componentName:componentVersion:componentID:radarInitiator:primaryOnly:forHome:](self, "initWithThreshold:message:radarTitle:componentName:componentVersion:componentID:radarInitiator:primaryOnly:forHome:", a3, a4, a5, a6, a7, a8, a9, v10, 0);
}

- (HMDCounterThresholdTTRTrigger)initWithThreshold:(int64_t)a3 message:(id)a4 radarTitle:(id)a5 componentName:(id)a6 componentVersion:(id)a7 componentID:(id)a8 radarInitiator:(id)a9 primaryOnly:(BOOL)a10 forHome:(id)a11
{
  id v18;
  id v19;
  id v20;
  HMDCounterThresholdTTRTrigger *v21;
  HMDCounterThresholdTTRTrigger *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v18 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v19 = a9;
  v20 = a11;
  v28.receiver = self;
  v28.super_class = (Class)HMDCounterThresholdTTRTrigger;
  v21 = -[HMDCounterThresholdTTRTrigger init](&v28, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_activeThreshold = a3;
    v21->_targetThreshold = a3;
    objc_storeStrong((id *)&v21->_message, a4);
    objc_storeStrong((id *)&v22->_radarTitle, a5);
    objc_storeStrong((id *)&v22->_componentName, a6);
    objc_storeStrong((id *)&v22->_componentVersion, a7);
    objc_storeStrong((id *)&v22->_componentID, a8);
    objc_storeWeak((id *)&v22->_radarInitiator, v19);
    v22->_primaryOnly = a10;
    objc_storeWeak((id *)&v22->_home, v20);
  }

  return v22;
}

- (void)updatedCounter:(id)a3 fromOldValue:(int64_t)a4 toNewValue:(int64_t)a5
{
  id v8;
  int64_t activeThreshold;
  void *v11;
  HMDCounterThresholdTTRTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  os_unfair_lock_lock_with_options();
  activeThreshold = self->_activeThreshold;
  os_unfair_lock_unlock(&self->_lock);
  if (activeThreshold <= a5 && activeThreshold > a4)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCounterThresholdTTRTrigger radarTitle](v12, "radarTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138544130;
      v25 = v14;
      v26 = 2114;
      v27 = v8;
      v28 = 2114;
      v29 = v15;
      v30 = 2048;
      v31 = a5;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@TTR threshold trigger: eventName=%{public}@, radarTitle=%{public}@, value=%lu", (uint8_t *)&v24, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCounterThresholdTTRTrigger radarInitiator](v12, "radarInitiator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMDCounterThresholdTTRTrigger primaryOnly](v12, "primaryOnly")
      && (-[HMDCounterThresholdTTRTrigger home](v12, "home"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "isCurrentDevicePrimaryResident"),
          v17,
          v18))
    {
      -[HMDCounterThresholdTTRTrigger message](v12, "message");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCounterThresholdTTRTrigger radarTitle](v12, "radarTitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCounterThresholdTTRTrigger componentName](v12, "componentName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCounterThresholdTTRTrigger componentVersion](v12, "componentVersion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCounterThresholdTTRTrigger componentID](v12, "componentID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:", v19, v20, v21, v22, objc_msgSend(v23, "integerValue"));
    }
    else
    {
      -[HMDCounterThresholdTTRTrigger message](v12, "message");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCounterThresholdTTRTrigger radarTitle](v12, "radarTitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCounterThresholdTTRTrigger componentName](v12, "componentName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCounterThresholdTTRTrigger componentVersion](v12, "componentVersion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCounterThresholdTTRTrigger componentID](v12, "componentID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "requestRadarWithMessage:radarTitle:componentName:componentVersion:componentID:", v19, v20, v21, v22, v23);
    }

  }
  if (!a5)
  {
    os_unfair_lock_lock_with_options();
    self->_activeThreshold = self->_targetThreshold;
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (int64_t)activeThreshold
{
  os_unfair_lock_s *p_lock;
  int64_t activeThreshold;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  activeThreshold = self->_activeThreshold;
  os_unfair_lock_unlock(p_lock);
  return activeThreshold;
}

- (int64_t)targetThreshold
{
  os_unfair_lock_s *p_lock;
  int64_t targetThreshold;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  targetThreshold = self->_targetThreshold;
  os_unfair_lock_unlock(p_lock);
  return targetThreshold;
}

- (void)setTargetThreshold:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_activeThreshold < a3)
    self->_activeThreshold = a3;
  self->_targetThreshold = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)message
{
  return self->_message;
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (NSString)componentID
{
  return self->_componentID;
}

- (BOOL)primaryOnly
{
  return self->_primaryOnly;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMMRadarInitiating)radarInitiator
{
  return (HMMRadarInitiating *)objc_loadWeakRetained((id *)&self->_radarInitiator);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_radarInitiator);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_componentID, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
