@implementation HMDWiFiManagementController

- (HMDWiFiManagementController)initWithAccessory:(id)a3 wiFiTransportService:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDWiFiManagementController *v11;
  HMDWiFiManagementController *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDWiFiManagementController;
  v11 = -[HMDWiFiManagementController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_accessory, v8);
    objc_storeStrong((id *)&v12->_service, a4);
    objc_storeStrong((id *)&v12->_workQueue, a5);
  }

  return v12;
}

- (int64_t)capabilities
{
  void *v2;
  void *v3;
  int64_t v4;

  -[HMDWiFiManagementController accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wiFiTransportCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)supportsStationConfiguration
{
  return ((unint64_t)-[HMDWiFiManagementController capabilities](self, "capabilities") >> 3) & 1;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
}

- (void)reconfigureWithSSID:(id)a3 PSK:(id)a4 logEvent:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDWiFiManagementController workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__HMDWiFiManagementController_reconfigureWithSSID_PSK_logEvent_completion___block_invoke;
  block[3] = &unk_1E89C0598;
  v22 = v11;
  v23 = v13;
  block[4] = self;
  v20 = v10;
  v21 = v12;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  v18 = v13;
  dispatch_async(v14, block);

}

- (void)safelyReconfigureWithSSID:(id)a3 PSK:(id)a4 verificationCallback:(id)a5 logEvent:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDWiFiManagementController workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __102__HMDWiFiManagementController_safelyReconfigureWithSSID_PSK_verificationCallback_logEvent_completion___block_invoke;
  v23[3] = &unk_1E89BDAE8;
  v23[4] = self;
  v24 = v12;
  v27 = v16;
  v28 = v14;
  v25 = v15;
  v26 = v13;
  v18 = v13;
  v19 = v15;
  v20 = v14;
  v21 = v12;
  v22 = v16;
  dispatch_async(v17, v23);

}

- (void)_accessoryDidBecomeReachable:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDWiFiManagementController workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HMDWiFiManagementController__accessoryDidBecomeReachable___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int64_t v7;
  void *v8;
  HMDWiFiManagementController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDWiFiManagementController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDWiFiManagementController reconfigurationTimeoutTimer](self, "reconfigurationTimeoutTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v4)
  {
    v7 = -[HMDWiFiManagementController reconfigurationState](self, "reconfigurationState");

    if (v7 == 2)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Fail-safe Wi-Fi reconfiguration failed - timed out waiting for accessory reconnection", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 100);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWiFiManagementController _reconfigurationCompletedWithSuccess:error:](v9, "_reconfigurationCompletedWithSuccess:error:", 0, v12);

    }
  }
  else
  {

  }
}

- (void)_commitConfigurationUpdate
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[HMDWiFiManagementController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDWiFiManagementController setReconfigurationState:](self, "setReconfigurationState:", 4);
  makeConfigurationControl(4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D16610]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[HMDWiFiManagementController reconfigurationCookie](self, "reconfigurationCookie"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithValue:", v6);
  objc_msgSend(v4, "setCookie:", v7);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__HMDWiFiManagementController__commitConfigurationUpdate__block_invoke;
  v8[3] = &unk_1E89ABBC0;
  v8[4] = self;
  -[HMDWiFiManagementController _performWiFiConfigurationControlRequest:withDescription:completion:](self, "_performWiFiConfigurationControlRequest:withDescription:completion:", v4, CFSTR("Commit Fail-Safe Update"), v8);

}

- (void)_reconfigurationCompletedWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = a4;
  -[HMDWiFiManagementController workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDWiFiManagementController reconfigurationLogEvent](self, "reconfigurationLogEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v4)
    {
      v8 = 0;
    }
    else
    {
      v8 = v14;
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setError:", v9);

        goto LABEL_7;
      }
    }
    objc_msgSend(v7, "setError:", v8);
LABEL_7:
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "submitLogEvent:", v7);

    -[HMDWiFiManagementController setReconfigurationLogEvent:](self, "setReconfigurationLogEvent:", 0);
  }
  -[HMDWiFiManagementController reconfigurationCompletion](self, "reconfigurationCompletion");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HMDWiFiManagementController notificationCenter](self, "notificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:", self);

  -[HMDWiFiManagementController reconfigurationTimeoutTimer](self, "reconfigurationTimeoutTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "suspend");

  -[HMDWiFiManagementController setReconfigurationTimeoutTimer:](self, "setReconfigurationTimeoutTimer:", 0);
  -[HMDWiFiManagementController setReconfigurationCookie:](self, "setReconfigurationCookie:", 0);
  -[HMDWiFiManagementController setReconfigurationVerificationCallback:](self, "setReconfigurationVerificationCallback:", 0);
  -[HMDWiFiManagementController setReconfigurationCompletion:](self, "setReconfigurationCompletion:", 0);
  -[HMDWiFiManagementController setReconfigurationState:](self, "setReconfigurationState:", 0);
  if (v4)
  {
    if (v11)
      v11[2](v11, 0);
  }
  else
  {
    completeWithError(v11, v14);
  }

}

- (void)_performWiFiConfigurationControlRequest:(id)a3 withDescription:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  HMDWiFiManagementController *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDWiFiManagementController *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDWiFiManagementController *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  _QWORD aBlock[5];
  __CFString *v42;
  id v43;
  id v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDWiFiManagementController workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDWiFiManagementController service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "findCharacteristicWithType:", CFSTR("0000022D-0000-1000-8000-0026BB765291"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__HMDWiFiManagementController__performWiFiConfigurationControlRequest_withDescription_completion___block_invoke;
    aBlock[3] = &unk_1E89BF138;
    aBlock[4] = self;
    v38 = v9;
    v14 = (const __CFString *)v9;
    v42 = (__CFString *)v14;
    v15 = v10;
    v43 = v15;
    v37 = _Block_copy(aBlock);
    -[HMDWiFiManagementController accessory](self, "accessory");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v40 = 0;
      objc_msgSend(v8, "serializeWithError:", &v40);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v40;
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (!v16)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v47 = v36;
          v48 = 2112;
          v49 = v14;
          v50 = 2112;
          v51 = v17;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize Wi-Fi Configuration Control request for %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
        if (!v15)
        {
          v16 = 0;
          v26 = v37;
          v9 = v38;
          goto LABEL_16;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v23);
        v16 = 0;
        v26 = v37;
        v9 = v38;
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v22;
        v48 = 2112;
        v49 = v14;
        v50 = 2112;
        v51 = v8;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Writing Wi-Fi Configuration Control request for %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v13, v16, 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWiFiManagementController workQueue](v19, "workQueue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v37;
      objc_msgSend(v39, "writeCharacteristicValues:source:queue:completionHandler:", v24, 7, v25, v37);

    }
    else
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v35;
        v48 = 2112;
        v49 = v14;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Reading Wi-Fi Configuration Control for %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v13);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v44 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWiFiManagementController workQueue](v33, "workQueue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v37;
      objc_msgSend(v39, "readCharacteristicValues:source:queue:completionHandler:", v16, 7, v23, v37);
    }
    v9 = v38;
    goto LABEL_15;
  }
  v27 = (void *)MEMORY[0x1D17BA0A0]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v30;
    v48 = 2112;
    v49 = CFSTR("0000022D-0000-1000-8000-0026BB765291");
    _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Missing required characteristic: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v31);

  }
LABEL_17:

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDWiFiManagementController accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HMDService)service
{
  return (HMDService *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)reconfigurationState
{
  return self->_reconfigurationState;
}

- (void)setReconfigurationState:(int64_t)a3
{
  self->_reconfigurationState = a3;
}

- (unsigned)reconfigurationCookie
{
  return self->_reconfigurationCookie;
}

- (void)setReconfigurationCookie:(unsigned __int16)a3
{
  self->_reconfigurationCookie = a3;
}

- (HMFTimer)reconfigurationTimeoutTimer
{
  return self->_reconfigurationTimeoutTimer;
}

- (void)setReconfigurationTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reconfigurationTimeoutTimer, a3);
}

- (id)reconfigurationVerificationCallback
{
  return self->_reconfigurationVerificationCallback;
}

- (void)setReconfigurationVerificationCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)reconfigurationCompletion
{
  return self->_reconfigurationCompletion;
}

- (void)setReconfigurationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (HMDWiFiReconfigurationLogEvent)reconfigurationLogEvent
{
  return self->_reconfigurationLogEvent;
}

- (void)setReconfigurationLogEvent:(id)a3
{
  objc_storeStrong((id *)&self->_reconfigurationLogEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reconfigurationLogEvent, 0);
  objc_storeStrong(&self->_reconfigurationCompletion, 0);
  objc_storeStrong(&self->_reconfigurationVerificationCallback, 0);
  objc_storeStrong((id *)&self->_reconfigurationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

void __98__HMDWiFiManagementController__performWiFiConfigurationControlRequest_withDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v5, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (v17)
    {
      v32 = 0;
      objc_msgSend(MEMORY[0x1E0D16628], "parsedFromData:error:", v17, &v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v32;
      if (v18)
      {
        v19 = (void *)MEMORY[0x1D17BA0A0]();
        v20 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v34 = v22;
          v35 = 2112;
          v36 = v23;
          v37 = 2112;
          v38 = v18;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Received Wi-Fi Configuration Control response for %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v19);
        v24 = *(_QWORD *)(a1 + 48);
        if (v24)
          (*(void (**)(uint64_t, void *, _QWORD))(v24 + 16))(v24, v18, 0);
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      v14 = 0;
    }
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v34 = v28;
      v35 = 2112;
      v36 = v29;
      v37 = 2112;
      v38 = v14;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Wi-Fi Configuration Control response for %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
    v30 = *(_QWORD *)(a1 + 48);
    if (v30)
    {
      if (v14)
      {
        (*(void (**)(uint64_t, _QWORD, id))(v30 + 16))(v30, 0, v14);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 43);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v30 + 16))(v30, 0, v31);

        v14 = 0;
      }
    }
    v18 = 0;
    goto LABEL_23;
  }
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v10;
    v35 = 2112;
    v36 = v11;
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Wi-Fi Configuration Control request for %@ failed: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
  {
    objc_msgSend(v5, "error");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
LABEL_24:

  }
}

void __57__HMDWiFiManagementController__commitConfigurationUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unsigned __int16 v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v16 = *(void **)(a1 + 32);
    v17 = 0;
    v18 = v6;
LABEL_12:
    objc_msgSend(v16, "_reconfigurationCompletedWithSuccess:error:", v17, v18);
    goto LABEL_13;
  }
  objc_msgSend(v5, "updateStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "value");

  objc_msgSend(v5, "cookie");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  if ((v8 & 0x40000) != 0
    && objc_msgSend(*(id *)(a1 + 32), "reconfigurationCookie") == (unsigned __int16)v8
    && objc_msgSend(*(id *)(a1 + 32), "reconfigurationCookie") == v11)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Fail-safe Wi-Fi reconfiguration successful", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = *(void **)(a1 + 32);
    v17 = 1;
    v18 = 0;
    goto LABEL_12;
  }
  v19 = (void *)MEMORY[0x1D17BA0A0]();
  v20 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(*(id *)(a1 + 32), "reconfigurationCookie");
    v26 = 138544130;
    v27 = v22;
    v28 = 1024;
    v29 = v11;
    v30 = 1024;
    v31 = v8;
    v32 = 1024;
    v33 = v23;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit fail-safe Wi-Fi reconfiguration (cookie: %04x, status: %08x, expected cookie: %04x)", (uint8_t *)&v26, 0x1Eu);

  }
  objc_autoreleasePoolPop(v19);
  v24 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_reconfigurationCompletedWithSuccess:error:", 0, v25);

LABEL_13:
}

void __60__HMDWiFiManagementController__accessoryDidBecomeReachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  _QWORD v7[5];

  if (objc_msgSend(*(id *)(a1 + 32), "reconfigurationState") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "reconfigurationTimeoutTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suspend");

    objc_msgSend(*(id *)(a1 + 32), "setReconfigurationState:", 3);
    objc_msgSend(*(id *)(a1 + 32), "reconfigurationVerificationCallback");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "reconfigurationVerificationCallback");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __60__HMDWiFiManagementController__accessoryDidBecomeReachable___block_invoke_2;
      v7[3] = &unk_1E89C02B8;
      v7[4] = *(_QWORD *)(a1 + 32);
      ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v7);

    }
    else
    {
      objc_msgSend(v5, "_commitConfigurationUpdate");
    }
  }
}

void __60__HMDWiFiManagementController__accessoryDidBecomeReachable___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__HMDWiFiManagementController__accessoryDidBecomeReachable___block_invoke_3;
  v5[3] = &unk_1E89C2758;
  v6 = a2;
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, v5);

}

void __60__HMDWiFiManagementController__accessoryDidBecomeReachable___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_commitConfigurationUpdate");
  }
  else
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Fail-safe Wi-Fi reconfiguration connection verification failed", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1081);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_reconfigurationCompletedWithSuccess:error:", 0, v7);

  }
}

void __102__HMDWiFiManagementController_safelyReconfigureWithSSID_PSK_verificationCallback_logEvent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HMDWiFiReconfigurationLogEvent *v11;
  HMDWiFiReconfigurationLogEvent *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "reconfigurationState"))
  {
    v2 = *(void **)(a1 + 64);
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = 15;
LABEL_9:
    objc_msgSend(v3, "hmErrorWithCode:", v4);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    completeWithError(v2, v15);

    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "supportsStationConfiguration") & 1) == 0)
  {
    v2 = *(void **)(a1 + 64);
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = 48;
    goto LABEL_9;
  }
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Performing fail-safe Wi-Fi reconfiguration with SSID '%@'", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "setReconfigurationState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setReconfigurationVerificationCallback:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setReconfigurationCompletion:", *(_QWORD *)(a1 + 64));
  v10 = *(void **)(a1 + 48);
  if (v10)
    v11 = v10;
  else
    v11 = objc_alloc_init(HMDWiFiReconfigurationLogEvent);
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWiFiReconfigurationLogEvent setAccessory:](v12, "setAccessory:", v13);

  -[HMDWiFiReconfigurationLogEvent setUsingFailSafeUpdate:](v12, "setUsingFailSafeUpdate:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setReconfigurationLogEvent:", v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__HMDWiFiManagementController_safelyReconfigureWithSSID_PSK_verificationCallback_logEvent_completion___block_invoke_13;
  v16[3] = &unk_1E89ABB98;
  v14 = *(void **)(a1 + 40);
  v17 = *(id *)(a1 + 32);
  v18 = v14;
  v19 = *(id *)(a1 + 56);
  objc_msgSend(v17, "_performWiFiConfigurationControlRequest:withDescription:completion:", 0, CFSTR("Get Status"), v16);

}

void __102__HMDWiFiManagementController_safelyReconfigureWithSSID_PSK_verificationCallback_logEvent_completion___block_invoke_13(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  unsigned __int16 v10;
  int v11;
  unsigned __int16 v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  _QWORD v39[6];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "updateStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "value");

    if ((v8 & 0x10000) != 0)
    {
      v37 = a1[4];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_reconfigurationCompletedWithSuccess:error:", 0, v38);

    }
    else
    {
      v9 = v5;
      do
      {
        while (1)
        {
          do
          {
            do
            {
              v10 = arc4random();
              v11 = v10;
            }
            while (!v10);
          }
          while (v10 == 1);
          v12 = v10;
          objc_msgSend(v9, "cookie");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 != objc_msgSend(v14, "unsignedIntValue"))
            break;

        }
        objc_msgSend(v9, "updateStatus");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (unsigned __int16)objc_msgSend(v15, "value");

      }
      while (v16 == v12);

      objc_msgSend(a1[4], "setReconfigurationCookie:", v12);
      objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "preferenceForKey:", CFSTR("wiFiReconfigurationTimeout"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "integerValue");

      v21 = 255;
      if (v20 < 255)
        v21 = v20;
      if (v21 <= 1)
        v22 = 1;
      else
        v22 = v21;
      if (v22 != v20)
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = a1[4];
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v41 = v26;
          v42 = 2112;
          v43 = CFSTR("wiFiReconfigurationTimeout");
          v44 = 2048;
          v45 = v20;
          v46 = 2048;
          v47 = v22;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Configured %@ value %ld is out of range, using %ld", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v23);
      }
      v27 = objc_alloc_init(MEMORY[0x1E0D16628]);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16630]), "initWithValue:", 3);
      objc_msgSend(v27, "setOperationType:", v28);

      v29 = objc_alloc(MEMORY[0x1E0D16610]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(a1[4], "reconfigurationCookie"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v29, "initWithValue:", v30);
      objc_msgSend(v27, "setCookie:", v31);

      makeStationConfiguration(a1[5], a1[6]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setStationConfiguration:", v32);

      v33 = objc_alloc(MEMORY[0x1E0D16610]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v33, "initWithValue:", v34);
      objc_msgSend(v27, "setOperationTimeout:", v35);

      v36 = a1[4];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __102__HMDWiFiManagementController_safelyReconfigureWithSSID_PSK_verificationCallback_logEvent_completion___block_invoke_20;
      v39[3] = &unk_1E89ABB70;
      v39[4] = v36;
      v39[5] = v22;
      objc_msgSend(v36, "_performWiFiConfigurationControlRequest:withDescription:completion:", v27, CFSTR("Fail-Safe Configuration Update"), v39);

    }
  }
  else
  {
    objc_msgSend(a1[4], "_reconfigurationCompletedWithSuccess:error:", 0, v6);
  }

}

void __102__HMDWiFiManagementController_safelyReconfigureWithSSID_PSK_verificationCallback_logEvent_completion___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  _WORD v31[9];

  *(_QWORD *)&v31[5] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_reconfigurationCompletedWithSuccess:error:", 0, v6);
    goto LABEL_14;
  }
  objc_msgSend(v5, "updateStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "value");

  if ((v8 & 0x10000) != 0
    && objc_msgSend(*(id *)(a1 + 32), "reconfigurationCookie") == (unsigned __int16)v8)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v8 & 0x20000) != 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(a1 + 40);
        v28 = 138543618;
        v29 = v22;
        v30 = 2048;
        *(_QWORD *)v31 = v23;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Fail-safe Wi-Fi reconfiguration initiated, awaiting accessory disconnect/reconnect with timeout of %ld seconds", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setReconfigurationState:", 2);
      objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__accessoryDidBecomeReachable_, CFSTR("HMDAccessoryIsReachableNotification"), v21);

      objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__accessoryDidBecomeReachable_, CFSTR("HMDAccessoryConfigNumberUpdatedNotification"), v21);

      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, (double)*(uint64_t *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDelegateQueue:", v27);

      objc_msgSend(v26, "setDelegate:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "setReconfigurationTimeoutTimer:", v26);
      objc_msgSend(v26, "resume");

      goto LABEL_12;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Wi-Fi reconfiguration without session restart is not supported", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(*(id *)(a1 + 32), "reconfigurationCookie");
      v28 = 138543874;
      v29 = v19;
      v30 = 1024;
      *(_DWORD *)v31 = v8;
      v31[2] = 1024;
      *(_DWORD *)&v31[3] = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to initiate fail-safe Wi-Fi reconfiguration (status: %08x, expected cookie: %04x)", (uint8_t *)&v28, 0x18u);

    }
    objc_autoreleasePoolPop(v16);
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1080);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v15;
  objc_msgSend(v14, "_reconfigurationCompletedWithSuccess:error:", 0, v15);
LABEL_12:

LABEL_14:
}

void __75__HMDWiFiManagementController_reconfigureWithSSID_PSK_logEvent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HMDWiFiReconfigurationLogEvent *v11;
  HMDWiFiReconfigurationLogEvent *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDWiFiReconfigurationLogEvent *v18;
  id v19;
  _QWORD v20[4];
  HMDWiFiReconfigurationLogEvent *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "reconfigurationState"))
  {
    v2 = *(void **)(a1 + 64);
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = 15;
LABEL_9:
    objc_msgSend(v3, "hmErrorWithCode:", v4);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    completeWithError(v2, v19);

    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "supportsStationConfiguration") & 1) == 0)
  {
    v2 = *(void **)(a1 + 64);
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = 48;
    goto LABEL_9;
  }
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Performing simple Wi-Fi reconfiguration with SSID '%@'", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = *(void **)(a1 + 48);
  if (v10)
    v11 = v10;
  else
    v11 = objc_alloc_init(HMDWiFiReconfigurationLogEvent);
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWiFiReconfigurationLogEvent setAccessory:](v12, "setAccessory:", v13);

  -[HMDWiFiReconfigurationLogEvent setUsingFailSafeUpdate:](v12, "setUsingFailSafeUpdate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setReconfigurationState:", 1);
  makeConfigurationControl(2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", &unk_1E8B32F40);
  objc_msgSend(v14, "setCookie:", v15);

  makeStationConfiguration(*(void **)(a1 + 40), *(void **)(a1 + 56));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStationConfiguration:", v16);

  v17 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __75__HMDWiFiManagementController_reconfigureWithSSID_PSK_logEvent_completion___block_invoke_7;
  v20[3] = &unk_1E89ABB48;
  v21 = v12;
  v22 = v17;
  v23 = *(id *)(a1 + 64);
  v18 = v12;
  objc_msgSend(v17, "_performWiFiConfigurationControlRequest:withDescription:completion:", v14, CFSTR("Simple Configuration Update"), v20);

}

void __75__HMDWiFiManagementController_reconfigureWithSSID_PSK_logEvent_completion___block_invoke_7(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void (**v15)(id, _QWORD);
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = 0;
LABEL_4:
    v9 = a1 + 4;
    objc_msgSend(a1[4], "setError:", v8);
    goto LABEL_5;
  }
  v8 = v6;
  if (v6)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a1 + 4;
  objc_msgSend(a1[4], "setError:", v16);

LABEL_5:
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitLogEvent:", *v9);

  if (v5)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = a1[5];
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Simple Wi-Fi reconfiguration successful", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(a1[5], "setReconfigurationState:", 0);
    v15 = (void (**)(id, _QWORD))a1[6];
    if (v15)
      v15[2](v15, 0);
  }
  else
  {
    objc_msgSend(a1[5], "setReconfigurationState:", 0);
    completeWithError(a1[6], v7);
  }

}

+ (id)sharedPSKForNetworkWithSSID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = CFSTR("ssid");
  v24[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)WiFiCopyNetworkInfo();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v12;
      v19 = 2112;
      v20 = v3;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve Wi-Fi network information for '%@': %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    goto LABEL_10;
  }
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("password"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@No password available for Wi-Fi network '%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v8 = 0;
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v8 = v7;
  objc_msgSend(v7, "dataUsingEncoding:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23_49327 != -1)
    dispatch_once(&logCategory__hmf_once_t23_49327, &__block_literal_global_49328);
  return (id)logCategory__hmf_once_v24_49329;
}

void __42__HMDWiFiManagementController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v24_49329;
  logCategory__hmf_once_v24_49329 = v0;

}

@end
