@implementation HMDResidentMeshResidentStorage

- (HMDResidentMeshResidentStorage)initWithResidentDevice:(id)a3 owner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDResidentMeshResidentStorage *v9;
  HMDResidentMeshResidentStorage *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *metrics;
  uint64_t v14;
  NSDictionary *lastSentMetrics;
  uint64_t v16;
  NSMutableSet *accessoryUUIDs;
  uint64_t v18;
  NSSet *lastSentAccessoryUUIDs;
  uint64_t v20;
  NSMutableDictionary *accessoryListWithLinkQuality;
  HMDResidentMeshResidentStorage *v23;
  SEL v24;
  id v25;
  id v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v23 = (HMDResidentMeshResidentStorage *)_HMFPreconditionFailure();
    return (HMDResidentMeshResidentStorage *)-[HMDResidentMeshResidentStorage _addAccessoryWithLinkQuality:toList:](v23, v24, v25, v26);
  }
  v27.receiver = self;
  v27.super_class = (Class)HMDResidentMeshResidentStorage;
  v9 = -[HMDResidentMeshResidentStorage init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_owner, v8);
    objc_storeWeak((id *)&v10->_residentDevice, v6);
    objc_msgSend(v8, "loadMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mutableCopy");
    metrics = v10->_metrics;
    v10->_metrics = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    lastSentMetrics = v10->_lastSentMetrics;
    v10->_lastSentMetrics = (NSDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    accessoryUUIDs = v10->_accessoryUUIDs;
    v10->_accessoryUUIDs = (NSMutableSet *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    lastSentAccessoryUUIDs = v10->_lastSentAccessoryUUIDs;
    v10->_lastSentAccessoryUUIDs = (NSSet *)v18;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    accessoryListWithLinkQuality = v10->_accessoryListWithLinkQuality;
    v10->_accessoryListWithLinkQuality = (NSMutableDictionary *)v20;

  }
  return v10;
}

- (BOOL)_addAccessoryWithLinkQuality:(id)a3 toList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v15;
  char v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v15 = 5;
  objc_msgSend(v6, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "retrieveStateForTrackedAccessory:stateNumber:isReachable:linkQuality:lastSeen:", v7, 0, &v16, &v15, 0);
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v16)
  {
    if (v9)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v7);
      goto LABEL_7;
    }
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  if (!v9)
    goto LABEL_8;
  v11 = objc_msgSend(v9, "integerValue");
  if (v11 == v15)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v7);

LABEL_7:
  v13 = 1;
LABEL_9:

  return v13;
}

- (BOOL)_testCanSkipReachabilityUpdateForAccessory:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "cameraProfiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") == 0;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_addAccessory:(id)a3 activateTimer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDResidentMeshResidentStorage *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v4 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentMeshResidentStorage owner](self, "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  if (v8)
  {
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v12;
      v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Adding accessory to mesh: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (objc_msgSend(v15, "hasBTLELink"))
    {
      -[HMDResidentMeshResidentStorage accessoryListWithLinkQuality](v10, "accessoryListWithLinkQuality");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HMDResidentMeshResidentStorage _addAccessoryWithLinkQuality:toList:](v10, "_addAccessoryWithLinkQuality:toList:", v15, v16);

    }
    else
    {
      v17 = 0;
    }
    -[HMDResidentMeshResidentStorage accessoryUUIDs](v10, "accessoryUUIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", v7);

    if ((v21 & 1) == 0
      && !-[HMDResidentMeshResidentStorage _testCanSkipReachabilityUpdateForAccessory:](v10, "_testCanSkipReachabilityUpdateForAccessory:", v13))
    {
      v38 = v4;
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      -[HMDResidentMeshResidentStorage owner](v10, "owner");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDResidentMeshResidentStorage owner](v10, "owner");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "resident");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "residentDevice");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "device");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "shortDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDResidentMeshResidentStorage residentDevice](v10, "residentDevice");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "device");
        v31 = v23;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "shortDescription");
        v36 = v22;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v40 = v37;
        v41 = 2114;
        v42 = v25;
        v43 = 2114;
        v44 = v7;
        v45 = 2114;
        v46 = v27;
        v47 = 2112;
        v48 = v29;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Adding connectivity from %{public}@ to %{public}@ for %{public}@ (activateTimer=%@)", buf, 0x34u);

        v22 = v36;
        v23 = v31;

      }
      objc_autoreleasePoolPop(v22);
      -[HMDResidentMeshResidentStorage accessoryUUIDs](v10, "accessoryUUIDs");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v7);

      if (v38 || v17)
        -[HMDResidentMeshResidentStorage _transmitAfter:](v10, "_transmitAfter:", 10.0);
    }

  }
  else
  {
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@[HMDResidentMesh] Owner of Resident Device node disappeared out from under us.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)_removeAccessory:(id)a3 activateTimer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDResidentMeshResidentStorage *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDResidentMeshResidentStorage accessoryListWithLinkQuality](self, "accessoryListWithLinkQuality");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v13;
      v38 = 2112;
      v39 = v6;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory: %@ with nil identifier sent to remove", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  -[HMDResidentMeshResidentStorage accessoryUUIDs](self, "accessoryUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "containsObject:", v15);

  if (v16
    && !-[HMDResidentMeshResidentStorage _testCanSkipReachabilityUpdateForAccessory:](self, "_testCanSkipReachabilityUpdateForAccessory:", v6))
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    -[HMDResidentMeshResidentStorage owner](self, "owner");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = v4;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentMeshResidentStorage owner](self, "owner");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "resident");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "residentDevice");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "device");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "shortDescription");
      v34 = v17;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentMeshResidentStorage residentDevice](self, "residentDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "device");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortDescription");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      *(_DWORD *)buf = 138544386;
      v27 = "NO";
      v37 = v20;
      if (v35)
        v27 = "YES";
      v38 = 2114;
      v39 = v21;
      v40 = 2114;
      v41 = v22;
      v42 = 2114;
      v43 = v25;
      v44 = 2080;
      v45 = v27;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Removing connectivity from %{public}@ to %{public}@ for %{public}@ (activateTimer=%s)", buf, 0x34u);

      v17 = v34;
      v4 = v35;
    }

    objc_autoreleasePoolPop(v17);
    -[HMDResidentMeshResidentStorage accessoryUUIDs](self, "accessoryUUIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "removeObject:", v29);

    if (v4)
      -[HMDResidentMeshResidentStorage _transmitAfter:](self, "_transmitAfter:", 10.0);
  }

}

- (BOOL)_residentDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[HMDResidentMeshResidentStorage metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentMeshResidentStorage lastSentMetrics](self, "lastSentMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToDictionary:", v4))
  {
    -[HMDResidentMeshResidentStorage accessoryUUIDs](self, "accessoryUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentMeshResidentStorage lastSentAccessoryUUIDs](self, "lastSentAccessoryUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (void)_transmitAfter:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HMDResidentMeshResidentStorage *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[HMDResidentMeshResidentStorage owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v12 = MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot transmit after delay because owner reference is nil", (uint8_t *)&v31, 0xCu);

    }
    v11 = (void *)v12;
    goto LABEL_16;
  }
  -[HMDResidentMeshResidentStorage transmitTimer](self, "transmitTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = MEMORY[0x1D17BA0A0]();
    v8 = v5;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Not scheduling transmit timer because one already exists", (uint8_t *)&v31, 0xCu);

    }
    v11 = (void *)v7;
LABEL_16:
    objc_autoreleasePoolPop(v11);
    goto LABEL_17;
  }
  v16 = -[HMDResidentMeshResidentStorage _residentDidChange](self, "_residentDidChange");
  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = v5;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (!v16)
  {
    if (v20)
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v30;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Not scheduling transmit timer because metrics didn't change", (uint8_t *)&v31, 0xCu);

    }
    v11 = v17;
    goto LABEL_16;
  }
  if (v20)
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentMeshResidentStorage residentDevice](self, "residentDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "shortDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543874;
    v32 = v21;
    v33 = 2114;
    v34 = v24;
    v35 = 2048;
    v36 = a3;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Starting transmit timer for %{public}@ for %fs", (uint8_t *)&v31, 0x20u);

  }
  objc_autoreleasePoolPop(v17);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, a3);
  -[HMDResidentMeshResidentStorage setTransmitTimer:](self, "setTransmitTimer:", v25);

  -[HMDResidentMeshResidentStorage transmitTimer](self, "transmitTimer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDelegate:", self);

  -[HMDResidentMeshResidentStorage transmitTimer](self, "transmitTimer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "workQueue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDelegateQueue:", v28);

  -[HMDResidentMeshResidentStorage transmitTimer](self, "transmitTimer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "resume");

LABEL_17:
}

- (id)_buildPayload
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[7];
  _QWORD v32[7];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HMDResidentMeshResidentStorage owner](self, "owner");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "resident");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v3, "accessoryUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v9), "UUIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v7);
  }

  v32[0] = &unk_1E8B33B10;
  v31[0] = CFSTR("kMeshVersion");
  v31[1] = CFSTR("kMeshDeviceStorageGenerationCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "generationCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v25;
  v31[2] = CFSTR("kMeshDevice");
  objc_msgSend(v3, "residentDevice");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "device");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v11 = v3;
  v23 = v3;
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v13;
  v31[3] = CFSTR("kMeshDeviceStorageEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "enabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v14;
  v31[4] = CFSTR("kMeshDeviceStorageAcccessories");
  v15 = (void *)objc_msgSend(v4, "copy");
  v32[4] = v15;
  v31[5] = CFSTR("kMeshDeviceStorageAccessoriesWithLinkQuality");
  -[HMDResidentMeshResidentStorage accessoryListWithLinkQuality](self, "accessoryListWithLinkQuality");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  v32[5] = v17;
  v31[6] = CFSTR("kMeshDeviceStorageSystemLoad");
  objc_msgSend(v26, "loadMetrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  v32[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 7);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)_transmitStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDResidentMeshResidentStorage *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v3 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  -[HMDResidentMeshResidentStorage owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    -[HMDResidentMeshResidentStorage residentDevice](self, "residentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resident");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v13;
      v47 = 2112;
      v48 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending status update with force: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDResidentMeshResidentStorage setTransmitTimer:](self, "setTransmitTimer:", 0);
    if (!-[HMDResidentMeshResidentStorage _residentDidChange](self, "_residentDidChange") && !v3)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v11;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "device");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v18;
        v47 = 2112;
        v48 = v20;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Not sending status update (metrics for %@ did not change and not forced)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      goto LABEL_26;
    }
    objc_msgSend(v11, "_meshStorageForResidentDevice:", v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      if ((objc_msgSend(v25, "enabled") & 1) != 0)
      {
        objc_msgSend(v9, "residentDevice");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v8, "isEqual:", v27);

        if (v28)
        {
          v29 = (void *)MEMORY[0x1D17BA0A0]();
          v30 = v11;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "device");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "shortDescription");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v46 = v32;
            v47 = 2114;
            v48 = v34;
            v35 = "%{public}@Not sending status update (%{public}@ is ourself)";
LABEL_19:
            _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, v35, buf, 0x16u);
LABEL_22:

LABEL_23:
          }
        }
        else
        {
          if (v9)
          {
            -[HMDResidentMeshResidentStorage metrics](self, "metrics");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDResidentMeshResidentStorage setLastSentMetrics:](self, "setLastSentMetrics:", v37);

            -[HMDResidentMeshResidentStorage accessoryUUIDs](self, "accessoryUUIDs");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDResidentMeshResidentStorage setLastSentAccessoryUUIDs:](self, "setLastSentAccessoryUUIDs:", v38);

            -[HMDResidentMeshResidentStorage _buildPayload](self, "_buildPayload");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __50__HMDResidentMeshResidentStorage__transmitStatus___block_invoke;
            v41[3] = &unk_1E89BB158;
            v42 = v11;
            v43 = v8;
            v44 = v26;
            objc_msgSend(v42, "_sendMessage:payload:target:force:responseHandler:", CFSTR("kDeviceMeshUpdateKey"), v39, v43, v3, v41);

            goto LABEL_25;
          }
          v29 = (void *)MEMORY[0x1D17BA0A0]();
          v30 = v11;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v46 = v32;
            _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Not sending status update (our resident device identifier is not set (probably unaccessible))", buf, 0xCu);
            goto LABEL_23;
          }
        }
      }
      else
      {
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = v11;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "residentDevice");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "device");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "shortDescription");
          v40 = v29;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v32;
          v47 = 2114;
          v48 = v36;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Not sending status update (%{public}@ is not enabled)", buf, 0x16u);

          v29 = v40;
          goto LABEL_22;
        }
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x1D17BA0A0]();
      v30 = v11;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "device");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "shortDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v32;
        v47 = 2112;
        v48 = v34;
        v35 = "%{public}@Not sending status update (have not heard about %@ from device manager)";
        goto LABEL_19;
      }
    }

    objc_autoreleasePoolPop(v29);
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v46 = v24;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Resident mesh owner reference is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v21);
LABEL_27:

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDResidentMeshResidentStorage residentDevice](self, "residentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  HMDResidentMeshResidentStorage *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDResidentMeshResidentStorage *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDResidentMeshResidentStorage owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    -[HMDResidentMeshResidentStorage transmitTimer](self, "transmitTimer");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v4)
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Transmit timer fired; sending status update",
          (uint8_t *)&v17,
          0xCu);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDResidentMeshResidentStorage _transmitStatus:](v10, "_transmitStatus:", 0);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Resident mesh owner reference is nil", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (HMDResidentMesh)owner
{
  return (HMDResidentMesh *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (HMDResidentDevice)residentDevice
{
  return (HMDResidentDevice *)objc_loadWeakRetained((id *)&self->_residentDevice);
}

- (void)setResidentDevice:(id)a3
{
  objc_storeWeak((id *)&self->_residentDevice, a3);
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (NSDictionary)lastSentMetrics
{
  return self->_lastSentMetrics;
}

- (void)setLastSentMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (HMFTimer)transmitTimer
{
  return self->_transmitTimer;
}

- (void)setTransmitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_transmitTimer, a3);
}

- (NSMutableSet)accessoryUUIDs
{
  return self->_accessoryUUIDs;
}

- (void)setAccessoryUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUUIDs, a3);
}

- (NSSet)lastSentAccessoryUUIDs
{
  return self->_lastSentAccessoryUUIDs;
}

- (void)setLastSentAccessoryUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableDictionary)accessoryListWithLinkQuality
{
  return self->_accessoryListWithLinkQuality;
}

- (void)setAccessoryListWithLinkQuality:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryListWithLinkQuality, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryListWithLinkQuality, 0);
  objc_storeStrong((id *)&self->_lastSentAccessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_accessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_transmitTimer, 0);
  objc_storeStrong((id *)&self->_lastSentMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_residentDevice);
  objc_destroyWeak((id *)&self->_owner);
}

void __50__HMDResidentMeshResidentStorage__transmitStatus___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = a1[4];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to send status update to %{public}@: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    objc_msgSend(a1[6], "setEnabled:", objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("kMeshDeviceStorageEnabled")));
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23_103467 != -1)
    dispatch_once(&logCategory__hmf_once_t23_103467, &__block_literal_global_103468);
  return (id)logCategory__hmf_once_v24_103469;
}

void __45__HMDResidentMeshResidentStorage_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v24_103469;
  logCategory__hmf_once_v24_103469 = v0;

}

@end
