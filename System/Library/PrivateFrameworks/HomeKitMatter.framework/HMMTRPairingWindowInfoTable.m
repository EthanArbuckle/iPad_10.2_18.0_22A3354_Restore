@implementation HMMTRPairingWindowInfoTable

- (HMMTRPairingWindowInfoTable)init
{
  HMMTRPairingWindowInfoTable *v2;
  HMMTRPairingWindowInfoTable *v3;
  uint64_t v4;
  NSMutableDictionary *table;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMMTRPairingWindowInfoTable;
  v2 = -[HMMTRPairingWindowInfoTable init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    table = v3->_table;
    v3->_table = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)registerPairingWindowWithSetupPayload:(id)a3 currentDate:(id)a4 duration:(double)a5 accessoryServer:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMMTRPairingWindowInfoTable *v14;
  NSObject *v15;
  void *v16;
  HMMTRPairingWindowInfoTableEntry *v17;
  void *v18;
  HMMTRPairingWindowInfoTableEntry *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  double v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x242656984]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544130;
    v22 = v16;
    v23 = 2112;
    v24 = v10;
    v25 = 2048;
    v26 = a5;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Registering pairing window with setup payload: %@, duration: %g, server: %@", (uint8_t *)&v21, 0x2Au);

  }
  objc_autoreleasePoolPop(v13);
  os_unfair_lock_lock(&v14->_lock);
  v17 = [HMMTRPairingWindowInfoTableEntry alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v11, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMMTRPairingWindowInfoTableEntry initWithAccessoryServer:expirationDate:](v17, "initWithAccessoryServer:expirationDate:", v12, v18);
  -[HMMTRPairingWindowInfoTable table](v14, "table");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v10);

  -[HMMTRPairingWindowInfoTable _clearExpiredEntriesWithCurrentDate:](v14, "_clearExpiredEntriesWithCurrentDate:", v11);
  os_unfair_lock_unlock(&v14->_lock);

}

- (id)retrieveAccessoryServerForPairingWindowWithSetupPayload:(id)a3 currentDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMTRPairingWindowInfoTable *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[HMMTRPairingWindowInfoTable _clearExpiredEntriesWithCurrentDate:](self, "_clearExpiredEntriesWithCurrentDate:", v7);
  -[HMMTRPairingWindowInfoTable table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "accessoryServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v14;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Retrieves server with pairing window with setup payload: %@, server: %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v11);

  return v10;
}

- (void)_clearExpiredEntriesWithCurrentDate:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMMTRPairingWindowInfoTable *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HMMTRPairingWindowInfoTable table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8);
        -[HMMTRPairingWindowInfoTable table](self, "table");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "accessoryServer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12
          || (objc_msgSend(v11, "expirationDate"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "compare:", v21),
              v13,
              v14 == -1))
        {
          objc_msgSend(v20, "addObject:", v9);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v6);
  }

  -[HMMTRPairingWindowInfoTable table](self, "table");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectsForKeys:", v20);

  if (objc_msgSend(v20, "count"))
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v19;
      v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@Expired setup payloads: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (NSMutableDictionary)table
{
  return self->_table;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2 != -1)
    dispatch_once(&logCategory__hmf_once_t2, &__block_literal_global_4072);
  return (id)logCategory__hmf_once_v3;
}

void __42__HMMTRPairingWindowInfoTable_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3;
  logCategory__hmf_once_v3 = v0;

}

@end
