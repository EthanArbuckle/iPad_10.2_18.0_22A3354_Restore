@implementation HAPAccessoryServerBTLE

- (HAPAccessoryServerBTLE)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 stateChanged:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  HAPAccessoryServerBTLE *v27;
  HAPAccessoryServerBTLE *v28;
  void *v29;
  uint64_t v30;
  NSString *name;
  uint64_t v32;
  NSString *identifier;
  id obj;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v20 = a3;
  v39 = a4;
  v40 = a5;
  v21 = a6;
  obj = a7;
  v38 = a7;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a14;
  v26 = a16;
  v41.receiver = self;
  v41.super_class = (Class)HAPAccessoryServerBTLE;
  v27 = -[HAPAccessoryServer initWithKeystore:](&v41, sel_initWithKeystore_, a15);
  v28 = v27;
  if (v27)
  {
    objc_storeWeak((id *)&v27->_blePeripheral, v20);
    objc_msgSend(v20, "cbPeripheral");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v28->_peripheral, v29);

    v30 = objc_msgSend(v39, "copy");
    name = v28->super._name;
    v28->super._name = (NSString *)v30;

    v32 = objc_msgSend(v40, "copy");
    identifier = v28->super._identifier;
    v28->super._identifier = (NSString *)v32;

    objc_storeStrong((id *)&v28->_stateNumber, obj);
    v28->_notifyingCharacteristicUpdated = 0;
    v28->_stateChanged = a8;
    v28->_connectReason = a9;
    v28->_connectionIdleTime = a13;
    objc_storeWeak((id *)&v28->_browser, v25);
    objc_storeStrong((id *)&v28->_whbStableIdentifier, a16);
    -[HAPAccessoryServer setSetupHash:](v28, "setSetupHash:", v24);
    -[HAPAccessoryServer setHasPairings:](v28, "setHasPairings:", (objc_msgSend(v21, "unsignedCharValue") & 1) == 0);
    -[HAPAccessoryServer setCategory:](v28, "setCategory:", v23);
    -[HAPAccessoryServer setConfigNumber:](v28, "setConfigNumber:", objc_msgSend(v22, "unsignedIntegerValue"));
    -[HAPAccessoryServerBTLE updatePeripheralIdentifier:isPairing:](v28, "updatePeripheralIdentifier:isPairing:", 0, 0);
  }

  return v28;
}

- (int64_t)linkLayerType
{
  return 3;
}

- (int64_t)linkType
{
  return 2;
}

- (NSNumber)stateNumber
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_stateNumber;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setStateNumber:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  HAPAccessoryServerBTLE *v13;

  v5 = a3;
  os_unfair_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) != 0)
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_stateNumber, a3);
    os_unfair_lock_unlock(&self->super._lock);
    -[HAPAccessoryServer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[HAPAccessoryServer delegateQueue](self, "delegateQueue");
        v10 = objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __41__HAPAccessoryServerBTLE_setStateNumber___block_invoke;
        v11[3] = &unk_1E894E0F8;
        v12 = v6;
        v13 = self;
        dispatch_async(v10, v11);

      }
    }

  }
}

- (unsigned)connectReason
{
  HAPAccessoryServerBTLE *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_connectReason;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)setConnectReason:(unsigned __int8)a3
{
  int v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_connectReason = v3;
  if (v3)
    ++self->_metricHAPBTLEConnectionPerReasonCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (BOOL)updateResumeSessionID:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  HAPAccessoryServerBTLE *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  HAPAccessoryServerBTLE *v19;
  NSObject *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerBTLE browser](self, "browser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isPaired:", v6);

  if (!v7)
    return 0;
  self->_resumeSessionID = a3;
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    v26 = 2048;
    v27 = a3;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating resumeSessionID: %llu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HAPAccessoryServer keyStore](v9, "keyStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerBTLE blePeripheral](v9, "blePeripheral");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uniqueBTIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](v9, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v16 = objc_msgSend(v12, "updatePeripheralIdentifier:forAccessoryIdentifier:protocolVersion:previousVersion:resumeSessionID:error:", v14, v15, -[HAPAccessoryServerBTLE hapBLEProtocolVersion](v9, "hapBLEProtocolVersion"), 0, a3, &v23);
  v17 = v23;

  if ((v16 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    v19 = v9;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v21;
      v26 = 2114;
      v27 = (unint64_t)v17;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the peripheral identifier with error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }

  return v16;
}

- (void)updatePeripheral:(id)a3
{
  objc_storeWeak((id *)&self->_peripheral, a3);
}

- (BOOL)updatePeripheralIdentifier:(id *)a3 isPairing:(BOOL)a4
{
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  HAPAccessoryServerBTLE *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  HAPAccessoryServerBTLE *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HAPAccessoryServerBTLE *v29;
  NSObject *v30;
  void *v31;
  id v33;
  id v34;
  unint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerBTLE browser](self, "browser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isPaired:", v8);

  if ((v9 & 1) != 0 || a4)
  {
    v35 = 0;
    v36 = 0;
    -[HAPAccessoryServer keyStore](self, "keyStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v13 = (id)objc_msgSend(v11, "readPeripheralIdentifierForAccessoryIdentifier:protocolVersion:resumeSessionID:error:", v12, 0, &v35, &v34);
    v14 = v34;

    if (v35)
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v18;
        v39 = 2048;
        v40 = v35;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Initializing BLE Server with resumeSessionID: %llu", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      v16->_resumeSessionID = v35;
    }
    -[HAPAccessoryServer keyStore](self, "keyStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBTLE blePeripheral](self, "blePeripheral");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "uniqueBTIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServer identifier](self, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v10 = objc_msgSend(v19, "updatePeripheralIdentifier:forAccessoryIdentifier:protocolVersion:previousVersion:resumeSessionID:error:", v21, v22, -[HAPAccessoryServerBTLE hapBLEProtocolVersion](self, "hapBLEProtocolVersion"), &v36, -[HAPAccessoryServerBTLE resumeSessionID](self, "resumeSessionID"), &v33);
    v23 = v33;

    if ((v10 & 1) != 0)
    {
      if (v36 == 1 && -[HAPAccessoryServerBTLE hapBLEProtocolVersion](self, "hapBLEProtocolVersion") != 1)
      {
        v24 = (void *)MEMORY[0x1D17B7244]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v38 = v27;
          _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Incompatible update BLE 1.0 -> BLE 2.x", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v24);
        -[HAPAccessoryServer setIncompatibleUpdate:](v25, "setIncompatibleUpdate:", 1);
      }
    }
    else
    {
      v28 = (void *)MEMORY[0x1D17B7244]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v31;
        v39 = 2112;
        v40 = (unint64_t)v23;
        _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the peripheral identifier with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Failed to update peripheral"), CFSTR("Failed to store peripheral identifier to the keystore"), 0, v23);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 3, CFSTR("Failed to update peripheral."), CFSTR("The accessory is unpaired"), 0, 0);
    v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v10;
}

- (void)updateConnectionIdleTime:(unsigned __int8)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = *MEMORY[0x1E0C99768];
  v11 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v13, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (BOOL)isPaired
{
  void *v3;
  void *v4;
  char v5;

  -[HAPAccessoryServerBTLE browser](self, "browser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServer identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isPaired:", v4);

  return v5;
}

- (BOOL)isCached
{
  void *v2;
  char v3;

  -[HAPAccessoryServerBTLE blePeripheral](self, "blePeripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCached");

  return v3;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HAPAccessoryServerBTLE;
  -[HAPAccessoryServer shortDescription](&v8, sel_shortDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerBTLE stateNumber](self, "stateNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)whbStableIdentifier
{
  return self->_whbStableIdentifier;
}

- (BOOL)stateChanged
{
  return self->_stateChanged;
}

- (void)setStateChanged:(BOOL)a3
{
  self->_stateChanged = a3;
}

- (BOOL)notifyingCharacteristicUpdated
{
  return self->_notifyingCharacteristicUpdated;
}

- (void)setNotifyingCharacteristicUpdated:(BOOL)a3
{
  self->_notifyingCharacteristicUpdated = a3;
}

- (CBPeripheral)peripheral
{
  return (CBPeripheral *)objc_loadWeakRetained((id *)&self->_peripheral);
}

- (unint64_t)hapBLEProtocolVersion
{
  return self->_hapBLEProtocolVersion;
}

- (unint64_t)resumeSessionID
{
  return self->_resumeSessionID;
}

- (HAPAccessoryServerBrowserBTLE)browser
{
  return (HAPAccessoryServerBrowserBTLE *)objc_loadWeakRetained((id *)&self->_browser);
}

- (unint64_t)metricHAPBTLEConnectionCount
{
  return self->_metricHAPBTLEConnectionCount;
}

- (void)setMetricHAPBTLEConnectionCount:(unint64_t)a3
{
  self->_metricHAPBTLEConnectionCount = a3;
}

- (unint64_t)metricHAPBTLEDiscoveryCount
{
  return self->_metricHAPBTLEDiscoveryCount;
}

- (void)setMetricHAPBTLEDiscoveryCount:(unint64_t)a3
{
  self->_metricHAPBTLEDiscoveryCount = a3;
}

- (unint64_t)metricHAPBTLEConnectionPerReasonCount
{
  return self->_metricHAPBTLEConnectionPerReasonCount;
}

- (void)setMetricHAPBTLEConnectionPerReasonCount:(unint64_t)a3
{
  self->_metricHAPBTLEConnectionPerReasonCount = a3;
}

- (unsigned)connectionIdleTime
{
  return self->_connectionIdleTime;
}

- (void)setConnectionIdleTime:(unsigned __int8)a3
{
  self->_connectionIdleTime = a3;
}

- (HAPBLEPeripheral)blePeripheral
{
  return (HAPBLEPeripheral *)objc_loadWeakRetained((id *)&self->_blePeripheral);
}

- (void)setBlePeripheral:(id)a3
{
  objc_storeWeak((id *)&self->_blePeripheral, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_blePeripheral);
  objc_destroyWeak((id *)&self->_browser);
  objc_destroyWeak((id *)&self->_peripheral);
  objc_storeStrong((id *)&self->_whbStableIdentifier, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
}

uint64_t __41__HAPAccessoryServerBTLE_setStateNumber___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServerDidUpdateStateNumber:", *(_QWORD *)(a1 + 40));
}

+ (id)hapUUIDFromBTLEUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "btleToServiceType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v6);
  }
  else
  {
    objc_msgSend(v3, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "initWithUUIDString:", v10);

  }
  return v9;
}

- (void)incrementHAPBTLEMetricsConnectionCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  ++self->_metricHAPBTLEConnectionCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)incrementHAPBTLEMetricsDiscoveryCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  ++self->_metricHAPBTLEDiscoveryCount;
  os_unfair_lock_unlock(p_lock);
}

- (id)readAndResetHAPMetrics:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v3 = a3;
  v12[3] = *MEMORY[0x1E0C80C00];
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v11[0] = &unk_1E8989848;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_metricHAPBTLEDiscoveryCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = &unk_1E8989860;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_metricHAPBTLEConnectionCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = &unk_1E8989878;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_metricHAPBTLEConnectionPerReasonCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    self->_metricHAPBTLEDiscoveryCount = 0;
    self->_metricHAPBTLEConnectionCount = 0;
    self->_metricHAPBTLEConnectionPerReasonCount = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v9;
}

@end
