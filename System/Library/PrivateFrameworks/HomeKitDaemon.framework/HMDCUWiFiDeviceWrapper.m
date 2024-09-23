@implementation HMDCUWiFiDeviceWrapper

- (HMDCUWiFiDeviceWrapper)initWithCUWiFiDevice:(id)a3 dispatchQueue:(id)a4
{
  id v7;
  id v8;
  HMDCUWiFiDeviceWrapper *v9;
  HMDCUWiFiDeviceWrapper *v10;
  id v11;
  uint64_t v12;
  NSString *deviceID;
  objc_super v15;
  _BYTE v16[32];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDCUWiFiDeviceWrapper;
  v9 = -[HMDCUWiFiDeviceWrapper init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cuWiFiDevice, a3);
    objc_storeStrong((id *)&v10->_dispatchQueue, a4);
    objc_msgSend(v7, "deviceIEDeviceID");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "bytes");
    objc_msgSend(v11, "length");
    HardwareAddressToCString();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4);
    v12 = objc_claimAutoreleasedReturnValue();
    deviceID = v10->deviceID;
    v10->deviceID = (NSString *)v12;

  }
  return v10;
}

- (NSUUID)identifier
{
  return (NSUUID *)-[CUWiFiDevice identifier](self->_cuWiFiDevice, "identifier");
}

- (NSString)ssid
{
  return (NSString *)-[CUWiFiDevice ssid](self->_cuWiFiDevice, "ssid");
}

- (NSString)name
{
  void *v3;
  CUWiFiDevice *cuWiFiDevice;
  void *v5;

  -[CUWiFiDevice deviceIEName](self->_cuWiFiDevice, "deviceIEName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  cuWiFiDevice = self->_cuWiFiDevice;
  if (v3)
    -[CUWiFiDevice deviceIEName](cuWiFiDevice, "deviceIEName");
  else
    -[CUWiFiDevice ssid](cuWiFiDevice, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isConfigured
{
  return (-[CUWiFiDevice deviceIEFlags](self->_cuWiFiDevice, "deviceIEFlags") & 0x40000000) == 0;
}

- (BOOL)supportsAirPlay2
{
  return (-[CUWiFiDevice deviceIEFlags](self->_cuWiFiDevice, "deviceIEFlags") >> 12) & 1;
}

- (id)underlyingDevice
{
  return self->_cuWiFiDevice;
}

- (void)startConfigurationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  HMDCUWiFiDeviceWrapper *v6;
  NSObject *v7;
  void *v8;
  CUWACSession *v9;
  CUWACSession *wacSession;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, int, void *);
  void *v15;
  id v16;
  __int128 *p_buf;
  id v18;
  id location;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_wacSession)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@WACSession already active for device", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v9 = (CUWACSession *)objc_alloc_init(MEMORY[0x24BE29850]);
    wacSession = self->_wacSession;
    self->_wacSession = v9;

    -[CUWACSession setWacDevice:](self->_wacSession, "setWacDevice:", self->_cuWiFiDevice);
    -[HMDCUWiFiDeviceWrapper name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUWACSession setLabel:](self->_wacSession, "setLabel:", v11);

    -[CUWACSession setDispatchQueue:](self->_wacSession, "setDispatchQueue:", self->_dispatchQueue);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__126561;
    v23 = __Block_byref_object_dispose__126562;
    v24 = 0;
    objc_initWeak(&location, self);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __66__HMDCUWiFiDeviceWrapper_startConfigurationWithCompletionHandler___block_invoke;
    v15 = &unk_24E786720;
    objc_copyWeak(&v18, &location);
    p_buf = &buf;
    v16 = v4;
    -[CUWACSession setProgressHandler:](self->_wacSession, "setProgressHandler:", &v12);
    -[CUWACSession activate](self->_wacSession, "activate", v12, v13, v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);

  }
}

- (void)cancelConfigurationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HMDCUWiFiDeviceWrapper_cancelConfigurationWithCompletionHandler___block_invoke;
  block[3] = &unk_24E788190;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v9;

  -[HMDCUWiFiDeviceWrapper identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCUWiFiDeviceWrapper ssid](self, "ssid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCUWiFiDeviceWrapper name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCUWiFiDeviceWrapper deviceID](self, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v6 = 0;

  -[CUWiFiDevice deviceIEFlags](self->_cuWiFiDevice, "deviceIEFlags", v3, v4, v5, v9);
  NSAppendPrintF();
  v7 = v6;

  return (NSString *)v7;
}

- (NSString)deviceID
{
  return self->deviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->deviceID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wacSession, 0);
  objc_storeStrong((id *)&self->_cuWiFiDevice, 0);
}

void __67__HMDCUWiFiDeviceWrapper_cancelConfigurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained[2], "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __66__HMDCUWiFiDeviceWrapper_startConfigurationWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  const char *v31;
  _QWORD block[4];
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_67;
  if (a2 != 20)
  {
    if (a2 == 200)
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = WeakRetained;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = (uint64_t)v26;
        v27 = "%{public}@WAC setup successful";
        v28 = v25;
        v29 = 12;
LABEL_65:
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, v27, buf, v29);

      }
    }
    else
    {
      if (a2 == 30)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eo"));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        v11 = (void *)MEMORY[0x227676638]();
        v12 = (id *)WeakRetained;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          v35 = (uint64_t)v14;
          v36 = 2112;
          v37 = v15;
          _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@WAC setup failed: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v11);
        v16 = *(_QWORD *)(a1 + 32);
        if (v16)
          (*(void (**)(uint64_t, _QWORD))(v16 + 16))(v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        objc_msgSend(v12[2], "invalidate");
        goto LABEL_67;
      }
      v23 = (void *)MEMORY[0x227676638]();
      v24 = WeakRetained;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v30;
        if (a2 > 109)
        {
          if (a2 > 159)
          {
            if (a2 <= 179)
            {
              if (a2 == 160)
              {
                v31 = "PostConfigStart";
                goto LABEL_64;
              }
              if (a2 == 170)
              {
                v31 = "FoundPostConfig";
                goto LABEL_64;
              }
            }
            else
            {
              if (a2 == 180)
              {
                v31 = "CheckingPostConfig";
                goto LABEL_64;
              }
              if (a2 == 190)
              {
                v31 = "CheckedPostConfig";
                goto LABEL_64;
              }
            }
          }
          else if (a2 <= 129)
          {
            if (a2 == 110)
            {
              v31 = "ApplyingConfig";
              goto LABEL_64;
            }
            if (a2 == 120)
            {
              v31 = "AppliedConfig";
              goto LABEL_64;
            }
          }
          else
          {
            switch(a2)
            {
              case 130:
                v31 = "RestoringOriginalWiFi";
                goto LABEL_64;
              case 140:
                v31 = "RestoredOriginalWiFi";
                goto LABEL_64;
              case 150:
                v31 = "SearchingPostConfig";
                goto LABEL_64;
            }
          }
        }
        else if (a2 > 59)
        {
          if (a2 <= 79)
          {
            if (a2 == 60)
            {
              v31 = "PreConfigStart";
              goto LABEL_64;
            }
            if (a2 == 70)
            {
              v31 = "SearchingPreConfig";
              goto LABEL_64;
            }
          }
          else
          {
            switch(a2)
            {
              case 'P':
                v31 = "FoundPreConfig";
                goto LABEL_64;
              case 'Z':
                v31 = "Authenticating";
                goto LABEL_64;
              case 'd':
                v31 = "Authenticated";
                goto LABEL_64;
            }
          }
        }
        else if (a2 <= 29)
        {
          if (!a2)
          {
            v31 = "Invalid";
            goto LABEL_64;
          }
          if (a2 == 10)
          {
            v31 = "Start";
            goto LABEL_64;
          }
        }
        else
        {
          if (a2 == 40)
          {
            v31 = "JoiningSoftAP";
            goto LABEL_64;
          }
          if (a2 == 50)
          {
            v31 = "JoinedSoftAP";
LABEL_64:
            *(_DWORD *)buf = 138543874;
            v35 = v30;
            v36 = 2080;
            v37 = v31;
            v38 = 2112;
            v39 = v5;
            v27 = "%{public}@CUWACSession progress %s: %@";
            v28 = v25;
            v29 = 32;
            goto LABEL_65;
          }
        }
        v31 = "?";
        goto LABEL_64;
      }
    }

    objc_autoreleasePoolPop(v23);
    goto LABEL_67;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = WeakRetained;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = (uint64_t)v20;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@WAC setup finalized, calling completion", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v17);
  v21 = *(_QWORD *)(a1 + 32);
  if (v21 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    (*(void (**)(uint64_t, _QWORD))(v21 + 16))(v21, 0);
  objc_msgSend(*((id *)v18 + 2), "invalidate");
  v22 = *((_QWORD *)v18 + 3);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HMDCUWiFiDeviceWrapper_startConfigurationWithCompletionHandler___block_invoke_88;
  block[3] = &unk_24E797318;
  objc_copyWeak(&v33, v6);
  dispatch_async(v22, block);
  objc_destroyWeak(&v33);
LABEL_67:

}

void __66__HMDCUWiFiDeviceWrapper_startConfigurationWithCompletionHandler___block_invoke_88(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_126595 != -1)
    dispatch_once(&logCategory__hmf_once_t18_126595, &__block_literal_global_93);
  return (id)logCategory__hmf_once_v19_126596;
}

void __37__HMDCUWiFiDeviceWrapper_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19_126596;
  logCategory__hmf_once_v19_126596 = v0;

}

@end
