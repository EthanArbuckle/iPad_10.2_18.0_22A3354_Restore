@implementation HMDHouseholdActivityLogEvent

- (HMDHouseholdActivityLogEvent)initWithHomeUUID:(id)a3 contributors:(id)a4
{
  id v6;
  HMDHouseholdActivityLogEvent *v7;
  uint64_t v8;
  NSArray *contributors;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDHouseholdActivityLogEvent;
  v7 = -[HMMHomeLogEvent initWithHomeUUID:](&v11, sel_initWithHomeUUID_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    contributors = v7->_contributors;
    v7->_contributors = (NSArray *)v8;

  }
  return v7;
}

- (id)initPopulatedFromDate:(id)a3 homeUUID:(id)a4 contributors:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDHouseholdActivityLogEvent *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HMDHouseholdActivityLogEvent initWithHomeUUID:contributors:](self, "initWithHomeUUID:contributors:", v9, v10);
  if (v11)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "populateLogEvent:forHomeWithUUID:associatedToDate:", v11, v9, v8, (_QWORD)v18);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
  return v11;
}

- (HMDHouseholdActivityLogEvent)initWithDictionary:(id)a3 contributors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDHouseholdActivityLogEvent *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  HMDHouseholdActivityLogEvent *v18;
  HMDHouseholdActivityLogEvent *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v10);
    v12 = -[HMDHouseholdActivityLogEvent initWithHomeUUID:contributors:](self, "initWithHomeUUID:contributors:", v11, v7);
    if (v12)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = v7;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17++), "deserializeLogEvent:fromSerializedMetric:", v12, v6, (_QWORD)v24);
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v15);
      }

    }
    v18 = v12;

    v19 = v18;
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Household activity is missing home UUID. Assuming from original SkyG seed and ignoring.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    v19 = 0;
  }

  return v19;
}

- (id)serializedMetric
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMHomeLogEvent homeUUIDString](self, "homeUUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("homeUUID"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDHouseholdActivityLogEvent contributors](self, "contributors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "contributeLogEvent:toSerializedMetric:", self, v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.HouseholdData");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDHouseholdActivityLogEvent contributors](self, "contributors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "contributeLogEvent:toCoreAnalyticsEvent:", self, v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v9;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (unint64_t)activeDeviceCount
{
  return self->_activeDeviceCount;
}

- (void)setActiveDeviceCount:(unint64_t)a3
{
  self->_activeDeviceCount = a3;
}

- (unint64_t)numReadSiri
{
  return self->_numReadSiri;
}

- (void)setNumReadSiri:(unint64_t)a3
{
  self->_numReadSiri = a3;
}

- (unint64_t)numWriteSiri
{
  return self->_numWriteSiri;
}

- (void)setNumWriteSiri:(unint64_t)a3
{
  self->_numWriteSiri = a3;
}

- (unint64_t)numReadFirstPartyApp
{
  return self->_numReadFirstPartyApp;
}

- (void)setNumReadFirstPartyApp:(unint64_t)a3
{
  self->_numReadFirstPartyApp = a3;
}

- (unint64_t)numWriteFirstPartyApp
{
  return self->_numWriteFirstPartyApp;
}

- (void)setNumWriteFirstPartyApp:(unint64_t)a3
{
  self->_numWriteFirstPartyApp = a3;
}

- (unint64_t)numReadThirdPartyApp
{
  return self->_numReadThirdPartyApp;
}

- (void)setNumReadThirdPartyApp:(unint64_t)a3
{
  self->_numReadThirdPartyApp = a3;
}

- (unint64_t)numWriteThirdPartyApp
{
  return self->_numWriteThirdPartyApp;
}

- (void)setNumWriteThirdPartyApp:(unint64_t)a3
{
  self->_numWriteThirdPartyApp = a3;
}

- (unint64_t)numAccessoriesAdded
{
  return self->_numAccessoriesAdded;
}

- (void)setNumAccessoriesAdded:(unint64_t)a3
{
  self->_numAccessoriesAdded = a3;
}

- (unint64_t)numScenesAdded
{
  return self->_numScenesAdded;
}

- (void)setNumScenesAdded:(unint64_t)a3
{
  self->_numScenesAdded = a3;
}

- (unint64_t)numTriggersAdded
{
  return self->_numTriggersAdded;
}

- (void)setNumTriggersAdded:(unint64_t)a3
{
  self->_numTriggersAdded = a3;
}

- (unint64_t)numShortcutsAdded
{
  return self->_numShortcutsAdded;
}

- (void)setNumShortcutsAdded:(unint64_t)a3
{
  self->_numShortcutsAdded = a3;
}

- (unint64_t)numScenesUserRun
{
  return self->_numScenesUserRun;
}

- (void)setNumScenesUserRun:(unint64_t)a3
{
  self->_numScenesUserRun = a3;
}

- (unint64_t)numShortcutsRun
{
  return self->_numShortcutsRun;
}

- (void)setNumShortcutsRun:(unint64_t)a3
{
  self->_numShortcutsRun = a3;
}

- (unint64_t)numTriggersFired
{
  return self->_numTriggersFired;
}

- (void)setNumTriggersFired:(unint64_t)a3
{
  self->_numTriggersFired = a3;
}

- (unint64_t)cameraStreamStartSuccessCount
{
  return self->_cameraStreamStartSuccessCount;
}

- (void)setCameraStreamStartSuccessCount:(unint64_t)a3
{
  self->_cameraStreamStartSuccessCount = a3;
}

- (unint64_t)cameraStreamStartFailureCount
{
  return self->_cameraStreamStartFailureCount;
}

- (void)setCameraStreamStartFailureCount:(unint64_t)a3
{
  self->_cameraStreamStartFailureCount = a3;
}

- (unint64_t)fetchCameraClipVideoSegmentAssetCount
{
  return self->_fetchCameraClipVideoSegmentAssetCount;
}

- (void)setFetchCameraClipVideoSegmentAssetCount:(unint64_t)a3
{
  self->_fetchCameraClipVideoSegmentAssetCount = a3;
}

- (unint64_t)activeDaysBitField
{
  return self->_activeDaysBitField;
}

- (void)setActiveDaysBitField:(unint64_t)a3
{
  self->_activeDaysBitField = a3;
}

- (BOOL)isActiveDay
{
  return self->_activeDay;
}

- (void)setActiveDay:(BOOL)a3
{
  self->_activeDay = a3;
}

- (int64_t)countOfDaysSinceLastActive
{
  return self->_countOfDaysSinceLastActive;
}

- (void)setCountOfDaysSinceLastActive:(int64_t)a3
{
  self->_countOfDaysSinceLastActive = a3;
}

- (int64_t)activeDaysPerMonthCount
{
  return self->_activeDaysPerMonthCount;
}

- (void)setActiveDaysPerMonthCount:(int64_t)a3
{
  self->_activeDaysPerMonthCount = a3;
}

- (NSArray)contributors
{
  return self->_contributors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contributors, 0);
}

+ (id)coalescedEventFromHouseholdActivityLogEvents:(id)a3 homeUUID:(id)a4 contributors:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDHouseholdActivityLogEvent *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  __int128 v39;
  id obj;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v43 = v8;
  v10 = -[HMDHouseholdActivityLogEvent initWithHomeUUID:contributors:]([HMDHouseholdActivityLogEvent alloc], "initWithHomeUUID:contributors:", v8, v9);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v57 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "startCoalescingLogEvent:", v10);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    }
    while (v13);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v7;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
  if (v16)
  {
    v18 = v16;
    v42 = *(_QWORD *)v53;
    *(_QWORD *)&v17 = 138543874;
    v39 = v17;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v53 != v42)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        objc_msgSend(v20, "homeUUID", v39);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqual:", v43);

        if ((v22 & 1) == 0)
        {
          v23 = (void *)MEMORY[0x227676638]();
          v24 = a1;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "homeUUID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v39;
            v63 = v26;
            v64 = 2112;
            v65 = v27;
            v66 = 2112;
            v67 = v43;
            _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Source household data log event home UUID doesn't match new event's home UUID: %@, %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v23);
        }
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v28 = v11;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v49;
          do
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(_QWORD *)v49 != v31)
                objc_enumerationMutation(v28);
              objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * k), "coalesceLogEvent:fromSourceEvent:", v10, v20);
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
          }
          while (v30);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
    }
    while (v18);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v33 = v11;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v45 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * m), "finishCoalescingLogEvent:", v10);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    }
    while (v35);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_18517 != -1)
    dispatch_once(&logCategory__hmf_once_t5_18517, &__block_literal_global_18518);
  return (id)logCategory__hmf_once_v6_18519;
}

void __43__HMDHouseholdActivityLogEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_18519;
  logCategory__hmf_once_v6_18519 = v0;

}

@end
