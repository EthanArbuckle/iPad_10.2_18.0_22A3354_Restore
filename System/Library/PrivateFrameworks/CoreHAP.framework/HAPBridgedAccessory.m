@implementation HAPBridgedAccessory

- (HAPBridgedAccessory)initWithServer:(id)a3 instanceID:(id)a4 parsedServices:(id)a5
{
  id v8;
  id v9;
  id v10;
  HAPBridgedAccessory *v11;
  HAPBridgedAccessory *v12;
  HAPBridgedAccessory *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HAPBridgedAccessory;
  v11 = -[HAPAccessory initWithServer:instanceID:parsedServices:](&v19, sel_initWithServer_instanceID_parsedServices_, v8, v9, v10);
  v12 = v11;
  if (!v11)
    goto LABEL_4;
  if (-[HAPBridgedAccessory __parseServices](v11, "__parseServices"))
  {
    objc_msgSend(v8, "addInternalDelegate:", v12);
LABEL_4:
    v13 = v12;
    goto LABEL_8;
  }
  v14 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPBridgedAccessory shortDescription](v12, "shortDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse services", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v13 = 0;
LABEL_8:

  return v13;
}

- (BOOL)__parseServices
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BOOL v20;
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

  v31 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HAPAccessory services](self, "services", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("00000062-0000-1000-8000-0026BB765291"));

        if (v11)
        {
          if (v6)
          {
            v16 = (void *)MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[HAPBridgedAccessory shortDescription](self, "shortDescription");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v27 = v18;
              v28 = 2112;
              v29 = v19;
              _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@[%@] Accessory has more than one Bridge Service", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v16);

            goto LABEL_19;
          }
          v6 = v9;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v5)
        continue;
      break;
    }

    if (v6 && !-[HAPBridgedAccessory __parseBridgeService:](self, "__parseBridgeService:", v6))
    {
      v12 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPBridgedAccessory shortDescription](self, "shortDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v14;
        v28 = 2112;
        v29 = v15;
        _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse bridge service", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
LABEL_19:
      v20 = 0;
      goto LABEL_22;
    }
  }
  else
  {

    v6 = 0;
  }
  v20 = 1;
LABEL_22:

  return v20;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_reachabilityCharacteristic);
}

- (BOOL)isPrimary
{
  return 0;
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HAPAccessory instanceID](self, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setReachable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (a3 && !-[HAPBridgedAccessory __isReachable](self, "__isReachable"))
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBridgedAccessory shortDescription](self, "shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@] Not setting reachability as underlying bridged accessory is not reachable", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HAPBridgedAccessory;
    -[HAPAccessory setReachable:](&v9, sel_setReachable_, v3);
  }
}

- (BOOL)__isReachable
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HAPBridgedAccessory reachabilityCharacteristic](self, "reachabilityCharacteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[HAPBridgedAccessory reachabilityCharacteristic](self, "reachabilityCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)__parseBridgeService:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a3, "characteristics", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("00000063-0000-1000-8000-0026BB765291"));

        if (v12)
        {
          -[HAPBridgedAccessory setReachabilityCharacteristic:](self, "setReachabilityCharacteristic:", v10);
          objc_msgSend(v10, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;

          if (v15)
            -[HAPBridgedAccessory setReachable:](self, "setReachable:", objc_msgSend(v15, "BOOLValue"));

          v7 = 1;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)mergeWithAccessory:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !-[HAPBridgedAccessory __parseServices](self, "__parseServices"))
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBridgedAccessory shortDescription](self, "shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse services during merge", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

  return 0;
}

- (BOOL)shouldMergeObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)HAPBridgedAccessory;
    v7 = -[HAPAccessory shouldMergeObject:](&v9, sel_shouldMergeObject_, v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)mergeObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)HAPBridgedAccessory;
    v7 = -[HAPAccessory mergeObject:](&v13, sel_mergeObject_, v4);
    if (!-[HAPBridgedAccessory __parseServices](self, "__parseServices"))
    {
      v8 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPBridgedAccessory shortDescription](self, "shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v10;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse services during merge", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)accessoryServerDidRequestCharacteristicsToRegisterForNotifications:(id)a3
{
  id v4;
  id v5;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessory server](self, "server");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    return 0;
  -[HAPBridgedAccessory reachabilityCharacteristic](self, "reachabilityCharacteristic");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (void)accessoryServer:(id)a3 didUpdateValueForCharacteristic:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  HAPBridgedAccessory *v15;

  v5 = a4;
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", self);

  if (v8)
  {
    objc_msgSend(v5, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessory workQueue](self, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__HAPBridgedAccessory_accessoryServer_didUpdateValueForCharacteristic___block_invoke;
    block[3] = &unk_1E894E120;
    v13 = v5;
    v14 = v9;
    v15 = self;
    v11 = v9;
    dispatch_async(v10, block);

  }
}

- (HAPCharacteristic)reachabilityCharacteristic
{
  return (HAPCharacteristic *)objc_loadWeakRetained((id *)&self->_reachabilityCharacteristic);
}

- (void)setReachabilityCharacteristic:(id)a3
{
  objc_storeWeak((id *)&self->_reachabilityCharacteristic, a3);
}

void __71__HAPBridgedAccessory_accessoryServer_didUpdateValueForCharacteristic___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  const char *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("00000062-0000-1000-8000-0026BB765291"));

  if (v4)
  {
    objc_msgSend(a1[4], "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("00000063-0000-1000-8000-0026BB765291"));

    if (v6)
    {
      v7 = objc_msgSend(a1[5], "isEqualToNumber:", MEMORY[0x1E0C9AAB0]);
      v8 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if ((_DWORD)v7)
      {
        if (v10)
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "shortDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543618;
          v15 = v11;
          v16 = 2112;
          v17 = v12;
          v13 = "%{public}@[%@] Received reachability update of YES, marking accessory as reachable";
LABEL_8:
          _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v14, 0x16u);

        }
      }
      else if (v10)
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "shortDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v11;
        v16 = 2112;
        v17 = v12;
        v13 = "%{public}@[%@] Received reachability update of NO, marking accessory as unreachable";
        goto LABEL_8;
      }

      objc_autoreleasePoolPop(v8);
      objc_msgSend(a1[6], "setReachable:", v7);
    }
  }
}

@end
