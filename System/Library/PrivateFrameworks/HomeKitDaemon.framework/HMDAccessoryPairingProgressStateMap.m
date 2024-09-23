@implementation HMDAccessoryPairingProgressStateMap

- (HMDAccessoryPairingProgressStateMap)initWithDate:(id)a3
{
  id v5;
  HMDAccessoryPairingProgressStateMap *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *progressStateMap;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryPairingProgressStateMap;
  v6 = -[HMDAccessoryPairingProgressStateMap init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    progressStateMap = v6->_progressStateMap;
    v6->_progressStateMap = v7;

    objc_storeStrong((id *)&v6->_lastProgressStateEventTime, a3);
  }

  return v6;
}

- (void)updateWithProgressState:(id)a3 date:(id)a4
{
  NSString *v6;
  id v7;
  os_unfair_lock_s *p_accessoryPairingProgressStateMapLock;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessoryPairingProgressStateMap *v16;
  NSObject *v17;
  void *v18;
  NSMutableDictionary *progressStateMap;
  void *v20;
  void *v21;
  HMDAccessoryPairingProgressStateMap *v22;
  id v23;
  NSString *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  void *v29;
  HMDAccessoryPairingProgressStateMap *v30;
  NSObject *v31;
  void *v32;
  NSString *longestProgressState;
  void *v34;
  HMDAccessoryPairingProgressStateMap *v35;
  NSObject *v36;
  void *v37;
  int v38;
  id v39;
  __int16 v40;
  NSString *v41;
  __int16 v42;
  NSMutableDictionary *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = (NSString *)a3;
  v7 = a4;
  p_accessoryPairingProgressStateMapLock = &self->_accessoryPairingProgressStateMapLock;
  os_unfair_lock_lock_with_options();
  v9 = objc_msgSend(v7, "timeIntervalSinceDate:", self->_lastProgressStateEventTime);
  v11 = v10;
  if (v6)
  {
    -[HMDAccessoryPairingProgressStateMap progressStateMap](self, "progressStateMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", &unk_24E96D430, v6);

    if (self->_lastProgressState)
    {
      -[HMDAccessoryPairingProgressStateMap progressStateMap](self, "progressStateMap");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v14, self->_lastProgressState);

    }
    -[HMDAccessoryPairingProgressStateMap setLastProgressState:](self, "setLastProgressState:", v6);
    v15 = (void *)MEMORY[0x227676638](-[HMDAccessoryPairingProgressStateMap setLastProgressStateEventTime:](self, "setLastProgressStateEventTime:", v7));
    v16 = self;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      progressStateMap = v16->_progressStateMap;
      v38 = 138543874;
      v39 = v18;
      v40 = 2112;
      v41 = v6;
      v42 = 2112;
      v43 = progressStateMap;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Successfully added progress state: %@ to the pairing progress state map: %@", (uint8_t *)&v38, 0x20u);

    }
LABEL_9:

    objc_autoreleasePoolPop(v15);
    -[NSMutableDictionary keysSortedByValueUsingComparator:](self->_progressStateMap, "keysSortedByValueUsingComparator:", &__block_literal_global_240624);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");
    if (v26)
    {
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = &stru_24E79DB48;
    }
    v28 = -[HMDAccessoryPairingProgressStateMap setLongestProgressState:](self, "setLongestProgressState:", v27);
    if (v26)

    v29 = (void *)MEMORY[0x227676638](v28);
    v30 = self;
    HMFGetOSLogHandle();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      longestProgressState = v30->_longestProgressState;
      v38 = 138543618;
      v39 = v32;
      v40 = 2112;
      v41 = longestProgressState;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Updated longest progress state to: %@", (uint8_t *)&v38, 0x16u);

    }
    objc_autoreleasePoolPop(v29);

    goto LABEL_17;
  }
  if (self->_lastProgressState)
  {
    -[HMDAccessoryPairingProgressStateMap progressStateMap](self, "progressStateMap");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v21, self->_lastProgressState);

    v15 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      v38 = 138543618;
      v39 = v23;
      v40 = 2112;
      v41 = v24;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Successfully updated duration of last progress state to: %@", (uint8_t *)&v38, 0x16u);

    }
    goto LABEL_9;
  }
  v34 = (void *)MEMORY[0x227676638](v9);
  v35 = self;
  HMFGetOSLogHandle();
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543362;
    v39 = v37;
    _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEBUG, "%{public}@No previous state information to update last state duration", (uint8_t *)&v38, 0xCu);

  }
  objc_autoreleasePoolPop(v34);
LABEL_17:
  os_unfair_lock_unlock(p_accessoryPairingProgressStateMapLock);

}

- (NSString)longestProgressState
{
  os_unfair_lock_s *p_accessoryPairingProgressStateMapLock;
  void *v4;

  p_accessoryPairingProgressStateMapLock = &self->_accessoryPairingProgressStateMapLock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSString copy](self->_longestProgressState, "copy");
  os_unfair_lock_unlock(p_accessoryPairingProgressStateMapLock);
  return (NSString *)v4;
}

- (NSString)lastProgressState
{
  os_unfair_lock_s *p_accessoryPairingProgressStateMapLock;
  void *v4;

  p_accessoryPairingProgressStateMapLock = &self->_accessoryPairingProgressStateMapLock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSString copy](self->_lastProgressState, "copy");
  os_unfair_lock_unlock(p_accessoryPairingProgressStateMapLock);
  return (NSString *)v4;
}

- (double)getTimeDurationForLongestProgressState
{
  os_unfair_lock_s *p_accessoryPairingProgressStateMapLock;
  void *v4;
  void *v5;
  double v6;
  double v7;

  p_accessoryPairingProgressStateMapLock = &self->_accessoryPairingProgressStateMapLock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_progressStateMap, "objectForKey:", self->_longestProgressState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_progressStateMap, "objectForKey:", self->_longestProgressState);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6 * 1000.0;

  }
  else
  {
    v7 = 0.0;
  }
  os_unfair_lock_unlock(p_accessoryPairingProgressStateMapLock);
  return v7;
}

- (NSMutableDictionary)progressStateMap
{
  return self->_progressStateMap;
}

- (void)setProgressStateMap:(id)a3
{
  objc_storeStrong((id *)&self->_progressStateMap, a3);
}

- (void)setLastProgressState:(id)a3
{
  objc_storeStrong((id *)&self->_lastProgressState, a3);
}

- (void)setLongestProgressState:(id)a3
{
  objc_storeStrong((id *)&self->_longestProgressState, a3);
}

- (NSDate)lastProgressStateEventTime
{
  return self->_lastProgressStateEventTime;
}

- (void)setLastProgressStateEventTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastProgressStateEventTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProgressStateEventTime, 0);
  objc_storeStrong((id *)&self->_longestProgressState, 0);
  objc_storeStrong((id *)&self->_lastProgressState, 0);
  objc_storeStrong((id *)&self->_progressStateMap, 0);
}

uint64_t __68__HMDAccessoryPairingProgressStateMap_updateWithProgressState_date___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

@end
