@implementation HAPSuspendedAccessoryIP

- (HAPSuspendedAccessoryIP)initWithName:(id)a3 identifier:(id)a4 wakeTuples:(id)a5 queue:(id)a6
{
  id v10;
  HAPSuspendedAccessoryIP *v11;
  void *v12;
  uint64_t v13;
  NSArray *wakeTuples;
  objc_super v16;

  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HAPSuspendedAccessoryIP;
  v11 = -[HAPSuspendedAccessory initWithName:identifier:type:queue:](&v16, sel_initWithName_identifier_type_queue_, a3, a4, 1, a6);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = objc_claimAutoreleasedReturnValue();
    wakeTuples = v11->_wakeTuples;
    v11->_wakeTuples = (NSArray *)v13;

    v11->_timeout = 10000000000;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[HAPSuspendedAccessoryIP _closeConnection](self, "_closeConnection");
  v3.receiver = self;
  v3.super_class = (Class)HAPSuspendedAccessoryIP;
  -[HAPSuspendedAccessoryIP dealloc](&v3, sel_dealloc);
}

- (void)wakeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPSuspendedAccessory queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HAPSuspendedAccessoryIP_wakeWithCompletion___block_invoke;
  v7[3] = &unk_1E894D5E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_wakeWithTuple:(id)a3 dnsName:(id)a4
{
  id v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HAPSuspendedAccessoryIP *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  HAPSuspendedAccessoryIP *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (unint64_t)a4;
  -[HAPSuspendedAccessory queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v7, "wakeAddress");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v8 | v10;

  if (v11)
  {
    v13 = objc_alloc(MEMORY[0x1E0D28540]);
    v14 = (void *)MEMORY[0x1E0CB3940];
    MEMORY[0x1D17B692C](self, a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@, %s:%ld"), v15, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Accessories/HAPSuspendedAccessory.m", 135);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithName:", v16);

    v18 = (id)v8;
    objc_msgSend(v7, "wakeAddress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "wakeAddress");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("wake://%@%s%@"), v21, "\x1E", v18);
      v22 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v22;
    }
    v23 = objc_retainAutorelease(v18);
    objc_msgSend(v23, "UTF8String");
    objc_msgSend(v7, "wakePort");
    -[HAPSuspendedAccessoryIP timeout](self, "timeout");
    -[HAPSuspendedAccessory queue](self, "queue");
    v34 = 0;
    v35 = 0;
    v36 = self;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = AsyncConnection_Connect();

    if ((_DWORD)v24)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v24, 0, 0, self, v37);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Connection failed"), 0, 0, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = 0;
    }
    objc_msgSend(v27, "domain", v34, v35, v36);

    v28 = (void *)MEMORY[0x1D17B7244](objc_msgSend(v27, "code"));
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPSuspendedAccessory identifier](v29, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v31;
      v40 = 2112;
      v41 = v32;
      v42 = 2112;
      v43 = v27;
      _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_INFO, "%{public}@The suspended accessory: '%@' sent wake command with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);

    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)_closeConnection
{
  if (self->_connection)
  {
    AsyncConnection_Release();
    self->_connection = 0;
  }
}

- (NSArray)wakeTuples
{
  return self->_wakeTuples;
}

- (NSString)dnsName
{
  return self->_dnsName;
}

- (void)setDnsName:(id)a3
{
  objc_storeStrong((id *)&self->_dnsName, a3);
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsName, 0);
  objc_storeStrong((id *)&self->_wakeTuples, 0);
}

void __46__HAPSuspendedAccessoryIP_wakeWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "wakeTuples");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "wakeTuples");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        v11 = v7;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v4);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
          v13 = *(void **)(a1 + 32);
          objc_msgSend(v13, "dnsName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_wakeWithTuple:dnsName:", v12, v14);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          v8 |= v7 == 0;
          ++v10;
          v11 = v7;
        }
        while (v6 != v10);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v6);

      if ((v8 & 1) == 0)
        goto LABEL_15;
    }
    else
    {
      v7 = v4;
    }

    v7 = 0;
LABEL_15:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "dnsName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(_QWORD *)(a1 + 40);
  if (v15)
  {
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v17, "dnsName");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_wakeWithTuple:dnsName:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v16 + 16))(v16);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1 != -1)
    dispatch_once(&logCategory__hmf_once_t1, &__block_literal_global_9184);
  return (id)logCategory__hmf_once_v2;
}

void __38__HAPSuspendedAccessoryIP_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2;
  logCategory__hmf_once_v2 = v0;

}

@end
