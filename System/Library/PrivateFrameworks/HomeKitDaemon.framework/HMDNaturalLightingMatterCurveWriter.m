@implementation HMDNaturalLightingMatterCurveWriter

- (HMDNaturalLightingMatterCurveWriter)initWithWorkQueue:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  HMDLightProfileDataSource *v8;
  void *v9;
  HMDNaturalLightingMatterCurveWriter *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMDLightProfileDataSource);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDNaturalLightingMatterCurveWriter initWithWorkQueue:accessory:dataSource:notificationCenter:timerFactory:](self, "initWithWorkQueue:accessory:dataSource:notificationCenter:timerFactory:", v7, v6, v8, v9, &__block_literal_global_249181);

  return v10;
}

- (HMDNaturalLightingMatterCurveWriter)initWithWorkQueue:(id)a3 accessory:(id)a4 dataSource:(id)a5 notificationCenter:(id)a6 timerFactory:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HMDNaturalLightingMatterCurveWriter *v18;
  void *v19;
  id timerFactory;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HMDNaturalLightingMatterCurveWriter;
  v18 = -[HMDNaturalLightingMatterCurveWriter init](&v22, sel_init);
  if (v18)
  {
    v19 = _Block_copy(v17);
    timerFactory = v18->_timerFactory;
    v18->_timerFactory = v19;

    objc_storeStrong((id *)&v18->_workQueue, a3);
    objc_storeWeak((id *)&v18->_accessory, v14);
    objc_storeStrong((id *)&v18->_dataSource, a5);
    objc_storeStrong((id *)&v18->_notificationCenter, a6);
    v18->_naturalLightingAllowed = 0;
  }

  return v18;
}

- (void)configureWithLightProfile:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDNaturalLightingMatterCurveWriter *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDNaturalLightingCurve *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDNaturalLightingMatterCurveWriter *v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNaturalLightingMatterCurveWriter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDNaturalLightingMatterCurveWriter accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6 && v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNaturalLightingMatterCurveWriter isDemoMode](v9, "isDemoMode");
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543874;
      v31 = v12;
      v32 = 2112;
      v33 = v13;
      v34 = 2112;
      v35 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Configuring matter light profile: %@, demoMode: %@", (uint8_t *)&v30, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDNaturalLightingMatterCurveWriter setLightProfile:](v9, "setLightProfile:", v4);
    objc_msgSend(v7, "naturalLightingContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "curve");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = -[HMDNaturalLightingCurve initWithCurve:minimumColorTemperature:maximumColorTemperature:]([HMDNaturalLightingCurve alloc], "initWithCurve:minimumColorTemperature:maximumColorTemperature:", v16, objc_msgSend(v16, "minimumColorTemperature"), objc_msgSend(v16, "maximumColorTemperature"));
      -[HMDNaturalLightingMatterCurveWriter setNaturalLightingCurve:](v9, "setNaturalLightingCurve:", v17);

      -[HMDNaturalLightingMatterCurveWriter naturalLightingCurve](v9, "naturalLightingCurve");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[HMDNaturalLightingMatterCurveWriter notificationCenter](v9, "notificationCenter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObserver:selector:name:object:", v9, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);

        -[HMDNaturalLightingMatterCurveWriter notificationCenter](v9, "notificationCenter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObserver:selector:name:object:", v9, sel_handleAccessoryConnected_, CFSTR("HMDAccessoryConnectedNotification"), v6);

        -[HMDNaturalLightingMatterCurveWriter notificationCenter](v9, "notificationCenter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "homeManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "mobileAssetManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObserver:selector:name:object:", v9, sel_handleMobileAssetsUpdatedNotification_, CFSTR("HMDMobileAssetManagerFoundUpdateNotification"), v23);

        -[HMDNaturalLightingMatterCurveWriter handleNaturalLightingAllowed](v9, "handleNaturalLightingAllowed");
LABEL_17:

        goto LABEL_18;
      }
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v9;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543362;
        v31 = v28;
        v29 = "%{public}@Failed to initialize the curve points";
        goto LABEL_15;
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v9;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543362;
        v31 = v28;
        v29 = "%{public}@homeNaturalLightingCurve is nil";
LABEL_15:
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&v30, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v25);
    goto LABEL_17;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543362;
    v31 = v24;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Not configuring matter light profile because accessory or home is nil", (uint8_t *)&v30, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
LABEL_18:

}

- (void)handleNaturalLightingAllowed
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  HMDNaturalLightingMatterCurveWriter *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDNaturalLightingMatterCurveWriter accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDNaturalLightingMatterCurveWriter isNaturalLightingAllowed](self, "isNaturalLightingAllowed");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __67__HMDNaturalLightingMatterCurveWriter_handleNaturalLightingAllowed__block_invoke;
    v13[3] = &unk_24E79B1E8;
    v13[4] = self;
    v14 = v3;
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __67__HMDNaturalLightingMatterCurveWriter_handleNaturalLightingAllowed__block_invoke_16;
    v11[3] = &unk_24E79B210;
    v11[4] = self;
    v12 = v14;
    v6 = (id)objc_msgSend(v4, "then:orRecover:", v13, v11);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not handling natural lighting allowed because accessory is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (id)isNaturalLightingAllowed
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  -[HMDNaturalLightingMatterCurveWriter accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE3F168]);
    -[HMDNaturalLightingMatterCurveWriter workQueue](self, "workQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithQueue:", v6);

    v8 = (void *)MEMORY[0x24BE3F180];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __63__HMDNaturalLightingMatterCurveWriter_isNaturalLightingAllowed__block_invoke;
    v12[3] = &unk_24E79B238;
    v13 = v4;
    v14 = v3;
    objc_msgSend(v8, "inContext:perform:", v7, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithValue:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)handleMobileAssetsUpdatedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDNaturalLightingMatterCurveWriter workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__HMDNaturalLightingMatterCurveWriter_handleMobileAssetsUpdatedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)setNaturalLightingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  HMDNaturalLightingMatterCurveWriter *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  HMDNaturalLightingMatterCurveWriter *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  BOOL v28;
  id v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  -[HMDNaturalLightingMatterCurveWriter lightProfile](self, "lightProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isNaturalLightingEnabled") == v3)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("disabled");
      if (v3)
        v17 = CFSTR("enabled");
      *(_DWORD *)buf = 138543618;
      v33 = v15;
      v34 = 2112;
      v35 = v17;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@setNaturalLightingEnabled is already %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v18 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(v5, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v20;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithValue:", v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v29);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = (uint64_t)v10;
      v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling setNaturalLightingEnabled with enabled: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_initWeak((id *)buf, v8);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __65__HMDNaturalLightingMatterCurveWriter_setNaturalLightingEnabled___block_invoke;
    v24[3] = &unk_24E79B260;
    objc_copyWeak(&v27, (id *)buf);
    v25 = v29;
    v26 = v5;
    v28 = v3;
    -[HMDNaturalLightingMatterCurveWriter setNaturalLightingEnabled:completion:](v8, "setNaturalLightingEnabled:completion:", v3, v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);

  }
  return v6;
}

- (void)handleSetNaturalLightingEnabledMessage:(id)a3 lightProfile:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDNaturalLightingMatterCurveWriter *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDNaturalLightingMatterCurveWriter *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDNaturalLightingMatterCurveWriter *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDNaturalLightingMatterCurveWriter workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messagePayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Received message to set matter natural lighting setting: %@", (uint8_t *)&v28, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDNaturalLightingMatterCurveWriter accessory](v10, "accessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v14 || !v15)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v10;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Accessory or home is nil", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = 20;
    goto LABEL_14;
  }
  if ((objc_msgSend(v15, "isCurrentDeviceConfirmedPrimaryResident") & 1) == 0)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v10;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Cannot enable natural lighting because this device is not primary resident", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = 48;
LABEL_14:
    objc_msgSend(v21, "hmErrorWithCode:", v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "respondWithError:", v27);

    goto LABEL_15;
  }
  if (objc_msgSend(v6, "BOOLForKey:", *MEMORY[0x24BDD6508]))
    -[HMDNaturalLightingMatterCurveWriter enableNaturalLightingWithReason:message:](v10, "enableNaturalLightingWithReason:message:", CFSTR("XPCMessagge"), v6);
  else
    -[HMDNaturalLightingMatterCurveWriter disableNaturalLightingWithReason:message:](v10, "disableNaturalLightingWithReason:message:", CFSTR("XPCMessagge"), v6);
LABEL_15:

}

- (BOOL)isDemoMode
{
  void *v2;
  BOOL v3;

  -[HMDNaturalLightingMatterCurveWriter dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "naturalLightingStartUpColorTemperature") == 123;

  return v3;
}

- (BOOL)isTimerRunning
{
  void *v2;
  BOOL v3;

  -[HMDNaturalLightingMatterCurveWriter periodicWriteTimer](self, "periodicWriteTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)enableNaturalLightingWithReason:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDNaturalLightingMatterCurveWriter *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDNaturalLightingMatterCurveWriter lightProfile](self, "lightProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v12;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Enabling natural lighting with reason: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_initWeak((id *)buf, v10);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__HMDNaturalLightingMatterCurveWriter_enableNaturalLightingWithReason_message___block_invoke;
  v15[3] = &unk_24E79B288;
  objc_copyWeak(&v18, (id *)buf);
  v13 = v7;
  v16 = v13;
  v14 = v8;
  v17 = v14;
  -[HMDNaturalLightingMatterCurveWriter setNaturalLightingEnabled:completion:](v10, "setNaturalLightingEnabled:completion:", 1, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

- (void)enableNaturalLightingWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDNaturalLightingMatterCurveWriter *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNaturalLightingMatterCurveWriter lightProfile](self, "lightProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v9;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Enabling natural lighting with reason: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_initWeak((id *)buf, v7);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__HMDNaturalLightingMatterCurveWriter_enableNaturalLightingWithReason___block_invoke;
  v11[3] = &unk_24E79B2B0;
  objc_copyWeak(&v13, (id *)buf);
  v10 = v5;
  v12 = v10;
  -[HMDNaturalLightingMatterCurveWriter setNaturalLightingEnabled:completion:](v7, "setNaturalLightingEnabled:completion:", 1, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

- (void)disableNaturalLightingWithReason:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  HMDNaturalLightingMatterCurveWriter *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDNaturalLightingMatterCurveWriter lightProfile](self, "lightProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isNaturalLightingEnabled");
  if (v7)
    v10 = 1;
  else
    v10 = v9;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if ((v10 & 1) != 0)
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Disabling natural lighting with reason: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_initWeak((id *)buf, v12);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __80__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingWithReason_message___block_invoke;
    v19[3] = &unk_24E79B288;
    objc_copyWeak(&v22, (id *)buf);
    v20 = v8;
    v21 = v7;
    -[HMDNaturalLightingMatterCurveWriter setNaturalLightingEnabled:completion:](v12, "setNaturalLightingEnabled:completion:", 0, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Natural lighting is already disabled for lightProfile: %@ reason: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "respondWithError:", v18);

  }
}

- (void)updateNaturalLightingEnabledFromAttributes
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDNaturalLightingMatterCurveWriter *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDNaturalLightingMatterCurveWriter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDNaturalLightingMatterCurveWriter accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4 || !v5)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      v16 = "%{public}@Not updating natural lighting enabled because accessory or home is nil";
      v17 = v14;
      v18 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_2218F0000, v17, v18, v16, buf, 0xCu);
LABEL_11:

    }
LABEL_12:

    objc_autoreleasePoolPop(v12);
    goto LABEL_13;
  }
  if ((objc_msgSend(v5, "isCurrentDeviceConfirmedPrimaryResident") & 1) == 0)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      v16 = "%{public}@Not updating natural lighting settings yet because current device is not a primary resident";
      v17 = v14;
      v18 = OS_LOG_TYPE_DEBUG;
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  if (!-[HMDNaturalLightingMatterCurveWriter naturalLightingAllowed](self, "naturalLightingAllowed"))
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v15;
    v23 = 2112;
    v24 = v19;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Not updating natural lighting settings because natural lighting is not allowed for this accessory: %@", buf, 0x16u);

    goto LABEL_11;
  }
  objc_msgSend(v4, "chipAccessoryServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hapInstanceId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchingHAPAccessoryWithServerIdentifier:instanceID:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "chipAccessoryServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __81__HMDNaturalLightingMatterCurveWriter_updateNaturalLightingEnabledFromAttributes__block_invoke;
  v20[3] = &unk_24E79B300;
  v20[4] = self;
  objc_msgSend(v11, "fetchColorControlClusterForHapAccessory:completionHandler:", v10, v20);

LABEL_13:
}

- (void)handleColorTemperatureAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDNaturalLightingMatterCurveWriter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  HMDNaturalLightingMatterCurveWriter *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "colorMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Color temperature attributes read from accessory: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (v5 && objc_msgSend(v5, "intValue") != 2)
  {
    -[HMDNaturalLightingMatterCurveWriter disableNaturalLightingWithReason:message:](v7, "disableNaturalLightingWithReason:message:", CFSTR("accessory-attribute-colorMode-change"), 0);
    goto LABEL_16;
  }
  objc_msgSend(v4, "remainingTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNaturalLightingMatterCurveWriter accessory](v7, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "naturalLightingEnabled");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14 && v11 && objc_msgSend(v11, "unsignedShortValue"))
  {
    v15 = CFSTR("naturalLightingEnabled");
LABEL_13:
    -[HMDNaturalLightingMatterCurveWriter enableNaturalLightingWithReason:](v7, "enableNaturalLightingWithReason:", v15);
    goto LABEL_14;
  }
  if (v14)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v7;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNaturalLightingMatterCurveWriter accessory](v17, "accessory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v21;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Natural lighting is enabled and remaining time is 0, yet enabling again on accessory: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v15 = CFSTR("naturalLightingEnabled-zero-remainingtime");
    goto LABEL_13;
  }
LABEL_14:

LABEL_16:
}

- (void)updateSettingsIfNaturalLightingSupportedByAccessory
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDNaturalLightingMatterCurveWriter *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[HMDNaturalLightingMatterCurveWriter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDNaturalLightingMatterCurveWriter accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4 || !v5)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v15;
      v16 = "%{public}@Not updating natural lighting settings because accessory or home is nil";
      v17 = v14;
      v18 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_2218F0000, v17, v18, v16, buf, 0xCu);
LABEL_11:

    }
LABEL_12:

    objc_autoreleasePoolPop(v12);
    goto LABEL_13;
  }
  if ((objc_msgSend(v5, "isCurrentDeviceConfirmedPrimaryResident") & 1) == 0)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v15;
      v16 = "%{public}@Not updating natural lighting settings yet because current device is not a primary resident";
      v17 = v14;
      v18 = OS_LOG_TYPE_DEBUG;
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  if (!-[HMDNaturalLightingMatterCurveWriter naturalLightingAllowed](self, "naturalLightingAllowed"))
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v15;
    v25 = 2112;
    v26 = v19;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Not updating natural lighting settings because natural lighting is not allowed for this accessory: %@", buf, 0x16u);

    goto LABEL_11;
  }
  objc_msgSend(v4, "chipAccessoryServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hapInstanceId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchingHAPAccessoryWithServerIdentifier:instanceID:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "chipAccessoryServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[2] = __90__HMDNaturalLightingMatterCurveWriter_updateSettingsIfNaturalLightingSupportedByAccessory__block_invoke;
  v20[3] = &unk_24E79B350;
  v20[1] = 3221225472;
  v20[4] = self;
  v21 = &unk_24E96D640;
  v22 = &unk_24E96D658;
  objc_msgSend(v11, "fetchColorControlClusterForHapAccessory:completionHandler:", v10, v20);

LABEL_13:
}

- (void)setStartUpColorTemperature
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDNaturalLightingMatterCurveWriter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[HMDNaturalLightingMatterCurveWriter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDNaturalLightingMatterCurveWriter accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[HMDNaturalLightingMatterCurveWriter dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "naturalLightingStartUpColorTemperature"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v11;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting startUpColorTemperature:%@ on accessory: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v4, "chipAccessoryServer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hapInstanceId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchingHAPAccessoryWithServerIdentifier:instanceID:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "chipAccessoryServer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __65__HMDNaturalLightingMatterCurveWriter_setStartUpColorTemperature__block_invoke;
  v19[3] = &unk_24E79B378;
  v19[4] = v9;
  v20 = v7;
  v18 = v7;
  objc_msgSend(v17, "fetchColorControlClusterForHapAccessory:completionHandler:", v16, v19);

}

- (void)setNaturalLightingEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  NSObject *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  -[HMDNaturalLightingMatterCurveWriter workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (v4)
    -[HMDNaturalLightingMatterCurveWriter enableOrUpdateNaturalLightingCurveWithCompletion:](self, "enableOrUpdateNaturalLightingCurveWithCompletion:", v7);
  else
    -[HMDNaturalLightingMatterCurveWriter disableNaturalLightingCurveWithCompletion:](self, "disableNaturalLightingCurveWithCompletion:", v7);

}

- (void)disableNaturalLightingCurveWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDNaturalLightingMatterCurveWriter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNaturalLightingMatterCurveWriter accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chipAccessoryServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "chipAccessoryServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hapInstanceId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchingHAPAccessoryWithServerIdentifier:instanceID:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke;
    v16[3] = &unk_24E79B3C8;
    v16[4] = self;
    v17 = v4;
    objc_msgSend(v6, "fetchColorControlClusterForHapAccessory:completionHandler:", v10, v16);

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@chipAccessoryServer is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNaturalLightingMatterCurveWriter regularTransitionTime](v12, "regularTransitionTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void *))v4 + 2))(v4, v10, v15);

  }
}

- (void)enableOrUpdateNaturalLightingCurveWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDNaturalLightingMatterCurveWriter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNaturalLightingMatterCurveWriter accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chipAccessoryServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "chipAccessoryServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hapInstanceId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchingHAPAccessoryWithServerIdentifier:instanceID:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke;
    v16[3] = &unk_24E79B3C8;
    v16[4] = self;
    v17 = v4;
    objc_msgSend(v6, "fetchColorControlClusterForHapAccessory:completionHandler:", v10, v16);

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@chipAccessoryServer is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNaturalLightingMatterCurveWriter regularTransitionTime](v12, "regularTransitionTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void *))v4 + 2))(v4, v10, v15);

  }
}

- (void)enableOrUpdateNaturalLightingCurveWithColorMode:(id)a3 accessoryColorTemp:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDNaturalLightingMatterCurveWriter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  HMDNaturalLightingMatterCurveWriter *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  const char *v25;
  HMDNaturalLightingMatterCurveWriter *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDNaturalLightingMatterCurveWriter *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v39 = a5;
  -[HMDNaturalLightingMatterCurveWriter workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNaturalLightingMatterCurveWriter accessory](v12, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v52 = v14;
    v53 = 2112;
    v54 = v8;
    v55 = 2112;
    v56 = v9;
    v57 = 2112;
    v58 = v16;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Enabling natural lighting, colorMode: %@ accessoryColorTemp: %@ for accessory: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDNaturalLightingMatterCurveWriter accessory](v12, "accessory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v8;
  if (-[HMDNaturalLightingMatterCurveWriter isDemoMode](v12, "isDemoMode"))
  {
    v47 = 0;
    v48 = 0;
    -[HMDNaturalLightingMatterCurveWriter getDemoModeTransitionTime:newColorTemp:accessoryColorTemp:colorMode:](v12, "getDemoModeTransitionTime:newColorTemp:accessoryColorTemp:colorMode:", &v48, &v47, v9, v8);
    v18 = v48;
    v19 = v47;
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v12;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v52 = v23;
    v53 = 2112;
    v54 = v19;
    v55 = 2112;
    v56 = v18;
    v57 = 2112;
    v58 = v24;
    v59 = 2112;
    v60 = v9;
    v25 = "%{public}@Demo mode: Calculated new color temp: %@ transition time: %@ for accessory: %@ with color temp: %@";
  }
  else
  {
    v49 = 0;
    v50 = 0;
    -[HMDNaturalLightingMatterCurveWriter getTransitionTime:newColorTemp:accessoryColorTemp:colorMode:](v12, "getTransitionTime:newColorTemp:accessoryColorTemp:colorMode:", &v50, &v49, v9, v8);
    v18 = v50;
    v19 = v49;
    v20 = (void *)MEMORY[0x227676638]();
    v26 = v12;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v52 = v23;
    v53 = 2112;
    v54 = v19;
    v55 = 2112;
    v56 = v18;
    v57 = 2112;
    v58 = v24;
    v59 = 2112;
    v60 = v9;
    v25 = "%{public}@Calculated new color temp: %@ transition time: %@ for accessory: %@ with color temp: %@";
  }
  _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, v25, buf, 0x34u);

LABEL_9:
  objc_autoreleasePoolPop(v20);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 10 * objc_msgSend(v18, "unsignedIntValue"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "chipAccessoryServer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hapInstanceId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "matchingHAPAccessoryWithServerIdentifier:instanceID:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke;
    v41[3] = &unk_24E79B490;
    v41[4] = v12;
    v33 = v39;
    v46 = v39;
    v42 = v19;
    v43 = v27;
    v44 = v9;
    v45 = v18;
    objc_msgSend(v29, "fetchColorControlClusterForHapAccessory:completionHandler:", v32, v41);

  }
  else
  {
    v34 = (void *)MEMORY[0x227676638]();
    v35 = v12;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v37;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@chipAccessoryServer is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v34);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNaturalLightingMatterCurveWriter regularTransitionTime](v35, "regularTransitionTime");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v39;
    (*((void (**)(id, void *, void *))v39 + 2))(v39, v32, v38);

  }
}

- (void)getTransitionTime:(id *)a3 newColorTemp:(id *)a4 accessoryColorTemp:(id)a5 colorMode:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;

  v30 = a5;
  v10 = a6;
  -[HMDNaturalLightingMatterCurveWriter dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNaturalLightingMatterCurveWriter dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNaturalLightingMatterCurveWriter dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localTimeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "millisecondsElapsedSinceStartOfDayWithDate:timeZone:", v13, v15);

  -[HMDNaturalLightingMatterCurveWriter naturalLightingCurve](self, "naturalLightingCurve");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorTemperatureForBrightness:millisecondsElapsedSinceStartOfDay:", objc_msgSend(&unk_24E96D670, "integerValue"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v17) = objc_msgSend(v10, "intValue");
  if ((_DWORD)v17 == 2)
  {
    if (!-[HMDNaturalLightingMatterCurveWriter isAccessoryColorTemp:closeToCurveColorTemp:](self, "isAccessoryColorTemp:closeToCurveColorTemp:", v30, v18))
    {
      v21 = -[HMDNaturalLightingMatterCurveWriter getShortTransitionTimeForAccessoryColorTemp:curveColorTemp:](self, "getShortTransitionTimeForAccessoryColorTemp:curveColorTemp:", v30, v18);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v21);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (double)v21;
      goto LABEL_7;
    }
    -[HMDNaturalLightingMatterCurveWriter regularTransitionTime](self, "regularTransitionTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  *a3 = v19;
  v20 = 0.0;
LABEL_7:
  -[HMDNaturalLightingMatterCurveWriter dataSource](self, "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNaturalLightingMatterCurveWriter dataSource](self, "dataSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dateByAddingTimeInterval:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNaturalLightingMatterCurveWriter dataSource](self, "dataSource");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localTimeZone");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v22, "millisecondsElapsedSinceStartOfDayWithDate:timeZone:", v25, v27);

  -[HMDNaturalLightingMatterCurveWriter naturalLightingCurve](self, "naturalLightingCurve");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "colorTemperatureForBrightness:millisecondsElapsedSinceStartOfDay:", objc_msgSend(&unk_24E96D670, "integerValue"), v28);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

}

- (unsigned)getShortTransitionTimeForAccessoryColorTemp:(id)a3 curveColorTemp:(id)a4
{
  id v5;
  int v6;
  int v7;
  unsigned __int16 v8;
  unsigned int v9;

  v5 = a4;
  v6 = objc_msgSend(a3, "shortValue");
  v7 = objc_msgSend(v5, "shortValue");

  v8 = v6 - v7;
  if (v6 - v7 < 0)
    v8 = v7 - v6;
  v9 = v8 / 0xAu;
  if (v9 >= 0xA)
    return 10;
  else
    return v9;
}

- (NSNumber)regularTransitionTime
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)(arc4random_uniform(0x78u) + 1800));
}

- (BOOL)isAccessoryColorTemp:(id)a3 closeToCurveColorTemp:(id)a4
{
  id v5;
  int v6;
  int v7;
  unsigned int v8;

  v5 = a4;
  v6 = objc_msgSend(a3, "shortValue");
  v7 = objc_msgSend(v5, "shortValue");

  v8 = v6 - v7;
  if (v6 - v7 < 0)
    v8 = v7 - v6;
  return v8 < 0xB;
}

- (void)getDemoModeTransitionTime:(id *)a3 newColorTemp:(id *)a4 accessoryColorTemp:(id)a5 colorMode:(id)a6
{
  uint64_t v8;
  void *v9;

  v8 = 1800000 * (++getDemoModeTransitionTime_newColorTemp_accessoryColorTemp_colorMode__count % 0x30u) + 2000;
  -[HMDNaturalLightingMatterCurveWriter naturalLightingCurve](self, "naturalLightingCurve", a3, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorTemperatureForBrightness:millisecondsElapsedSinceStartOfDay:", objc_msgSend(&unk_24E96D670, "integerValue"), v8);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 20);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
}

- (void)startPeriodicWriteTimerWithInterval:(id)a3
{
  id v4;
  double v5;
  void *v6;
  HMDNaturalLightingMatterCurveWriter *v7;
  NSObject *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, double);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (double)objc_msgSend(v4, "longValue");
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v9;
    v18 = 2048;
    v19 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting Periodic write timer for %f seconds", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDNaturalLightingMatterCurveWriter timerFactory](v7, "timerFactory");
  v10 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v10[2](v10, 0, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNaturalLightingMatterCurveWriter setPeriodicWriteTimer:](v7, "setPeriodicWriteTimer:", v11);

  -[HMDNaturalLightingMatterCurveWriter periodicWriteTimer](v7, "periodicWriteTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", v7);

  -[HMDNaturalLightingMatterCurveWriter workQueue](v7, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNaturalLightingMatterCurveWriter periodicWriteTimer](v7, "periodicWriteTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegateQueue:", v13);

  -[HMDNaturalLightingMatterCurveWriter periodicWriteTimer](v7, "periodicWriteTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resume");

}

- (void)stopPeriodicWriteTimer
{
  -[HMDNaturalLightingMatterCurveWriter setPeriodicWriteTimer:](self, "setPeriodicWriteTimer:", 0);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMDNaturalLightingMatterCurveWriter *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  HMDNaturalLightingMatterCurveWriter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Periodic write timer fired", (uint8_t *)&v19, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDNaturalLightingMatterCurveWriter workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[HMDNaturalLightingMatterCurveWriter periodicWriteTimer](v6, "periodicWriteTimer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v4)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNaturalLightingMatterCurveWriter periodicWriteTimer](v12, "periodicWriteTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received timer did fire callback for unknown timer. Expected: %@ received: %@", (uint8_t *)&v19, 0x20u);

LABEL_10:
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  -[HMDNaturalLightingMatterCurveWriter accessory](v6, "accessory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "naturalLightingEnabled");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if ((v18 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Not acting on timer expiry because natural lighting is not enabled", (uint8_t *)&v19, 0xCu);
      goto LABEL_10;
    }
LABEL_11:

    objc_autoreleasePoolPop(v11);
    goto LABEL_12;
  }
  -[HMDNaturalLightingMatterCurveWriter enableNaturalLightingWithReason:](v6, "enableNaturalLightingWithReason:", CFSTR("periodic-timer-expired"));
LABEL_12:

}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  HMDNaturalLightingMatterCurveWriter *v15;
  NSObject *v16;
  void *v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceHomeUUIDNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  -[HMDNaturalLightingMatterCurveWriter accessory](self, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "hmf_isEqualToUUID:", v11);

  if ((v12 & 1) != 0)
  {
    -[HMDNaturalLightingMatterCurveWriter workQueue](self, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__HMDNaturalLightingMatterCurveWriter_handlePrimaryResidentUpdateNotification___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v13, block);

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring resident update for other home: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)handleAccessoryConnected:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDNaturalLightingMatterCurveWriter workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HMDNaturalLightingMatterCurveWriter_handleAccessoryConnected___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleColorControlAttributeReport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDNaturalLightingMatterCurveWriter *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attribute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDNaturalLightingMatterCurveWriter lightProfile](self, "lightProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isNaturalLightingEnabled");

  if (v8 && objc_msgSend(v6, "isEqualToNumber:", &unk_24E96D688))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "endpoint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "cluster");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "path");
      v21 = v9;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "attribute");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling MTRAttributeReport with endpoint: %@, cluster: %@, attribute: %@, value: %@", buf, 0x34u);

      v9 = v21;
    }

    objc_autoreleasePoolPop(v9);
    objc_msgSend(v4, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "intValue") != 2)
      -[HMDNaturalLightingMatterCurveWriter disableNaturalLightingWithReason:message:](v10, "disableNaturalLightingWithReason:message:", CFSTR("accessory-attribute-unexpected-color-mode"), 0);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDNaturalLightingMatterCurveWriter lightProfile](self, "lightProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 32, 1);
}

- (HMDLightProfile)lightProfile
{
  return (HMDLightProfile *)objc_loadWeakRetained((id *)&self->_lightProfile);
}

- (void)setLightProfile:(id)a3
{
  objc_storeWeak((id *)&self->_lightProfile, a3);
}

- (HMFTimer)periodicWriteTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPeriodicWriteTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (HMDNaturalLightingCurve)naturalLightingCurve
{
  return (HMDNaturalLightingCurve *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNaturalLightingCurve:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (HMDLightProfileDataSource)dataSource
{
  return (HMDLightProfileDataSource *)objc_getProperty(self, a2, 64, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)naturalLightingAllowed
{
  return self->_naturalLightingAllowed;
}

- (void)setNaturalLightingAllowed:(BOOL)a3
{
  self->_naturalLightingAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_naturalLightingCurve, 0);
  objc_storeStrong((id *)&self->_periodicWriteTimer, 0);
  objc_destroyWeak((id *)&self->_lightProfile);
  objc_storeStrong(&self->_timerFactory, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __64__HMDNaturalLightingMatterCurveWriter_handleAccessoryConnected___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "lightProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentDeviceConfirmedPrimaryResident");

  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "isNaturalLightingSupported");
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "isNaturalLightingSupported");
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v10;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ became connected natural lighting supported:%@ enabled:%@", (uint8_t *)&v18, 0x2Au);

    }
    objc_autoreleasePoolPop(v6);
    v15 = objc_msgSend(v2, "isNaturalLightingSupported");
    v16 = *(void **)(a1 + 32);
    if (v15)
      objc_msgSend(v16, "updateNaturalLightingEnabledFromAttributes");
    else
      objc_msgSend(v16, "updateSettingsIfNaturalLightingSupportedByAccessory");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Not handling accessory connected notification on non-primary resident", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

void __79__HMDNaturalLightingMatterCurveWriter_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "lightProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentDeviceConfirmedPrimaryResident");

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "lightProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "isNaturalLightingSupported");
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "lightProfile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "isNaturalLightingEnabled");
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v9;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device became primary resident, natural lighting supported:%@ enabled:%@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v14 = objc_msgSend(v2, "isNaturalLightingSupported");
    v15 = *(void **)(a1 + 32);
    if (v14)
      objc_msgSend(v15, "updateNaturalLightingEnabledFromAttributes");
    else
      objc_msgSend(v15, "updateSettingsIfNaturalLightingSupportedByAccessory");
  }

}

void __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = a1[4];
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "accessory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v14;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch color control cluster from accessory: %@ with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(a1[4], "workQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke_53;
    block[3] = &unk_24E79C2B8;
    v18 = a1[9];
    block[4] = a1[4];
    v26 = v18;
    dispatch_async(v17, block);

    v10 = v26;
  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke_2;
    v19[3] = &unk_24E79B468;
    v8 = a1[5];
    v19[4] = a1[4];
    v9 = a1[6];
    v20 = a1[7];
    v21 = a1[5];
    v22 = a1[6];
    v23 = a1[8];
    v24 = a1[9];
    objc_msgSend(v5, "moveToCustomColorTemperatureValue:transitionTime:completionHandler:", v8, v9, v19);

    v10 = v20;
  }

}

void __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke_53(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 59);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "regularTransitionTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

void __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v21 = v7;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Completed setting color temperature: [%@ -> %@] with transitionTime: %@ on accessory: %@ with error: %@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke_54;
  block[3] = &unk_24E79B440;
  v17 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  v18 = v3;
  v19 = v13;
  v14 = v3;
  dispatch_async(v12, block);

}

void __117__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithColorMode_accessoryColorTemp_completion___block_invoke_54(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue") + 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v13;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch color control cluster from accessory: %@ with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_49;
    block[3] = &unk_24E79C2B8;
    v17 = *(id *)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v21 = v17;
    dispatch_async(v16, block);

    v9 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_2;
    v18[3] = &unk_24E79B418;
    v8 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v8;
    objc_msgSend(v5, "readColorModeAndColorTemperatureWithCompletion:", v18);
    v9 = v19;
  }

}

void __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_49(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 59);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "regularTransitionTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

void __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v13;
      v28 = 2112;
      v29 = v15;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to read color mode and temp from accessory: %@ with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_50;
    block[3] = &unk_24E79C2B8;
    v17 = *(id *)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v25 = v17;
    dispatch_async(v16, block);

    v18 = v25;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_2_51;
    v20[3] = &unk_24E79B3F0;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v7;
    v22 = v8;
    v23 = *(id *)(a1 + 40);
    dispatch_async(v19, v20);

    v18 = v21;
  }

}

void __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_50(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 59);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "regularTransitionTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

uint64_t __88__HMDNaturalLightingMatterCurveWriter_enableOrUpdateNaturalLightingCurveWithCompletion___block_invoke_2_51(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enableOrUpdateNaturalLightingCurveWithColorMode:accessoryColorTemp:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v13;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch color control cluster from accessory: %@ with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke_47;
    block[3] = &unk_24E79C2B8;
    v17 = *(id *)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v21 = v17;
    dispatch_async(v16, block);

    v9 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke_2;
    v18[3] = &unk_24E79B3A0;
    v8 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v8;
    objc_msgSend(v5, "stopMoveToColorTemperatureCommandWithCompletion:", v18);
    v9 = v19;
  }

}

void __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke_47(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 59);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "regularTransitionTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

void __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v7;
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopped moving color temperature with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke_48;
  block[3] = &unk_24E79B440;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v14 = v10;
  v15 = v9;
  v11 = v3;
  dispatch_async(v8, block);

}

void __81__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingCurveWithCompletion___block_invoke_48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "regularTransitionTime");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);

}

void __65__HMDNaturalLightingMatterCurveWriter_setStartUpColorTemperature__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch color control cluster from accessory: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __65__HMDNaturalLightingMatterCurveWriter_setStartUpColorTemperature__block_invoke_45;
    v15[3] = &unk_24E79BCC8;
    v8 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v8;
    objc_msgSend(v5, "writeStartUpColorTemperature:completion:", v16, v15);

  }
}

void __65__HMDNaturalLightingMatterCurveWriter_setStartUpColorTemperature__block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Completed setting startup color temperature: %@ on accessory: %@ with error: %@", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);

}

void __90__HMDNaturalLightingMatterCurveWriter_updateSettingsIfNaturalLightingSupportedByAccessory__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch color control cluster from accessory: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __90__HMDNaturalLightingMatterCurveWriter_updateSettingsIfNaturalLightingSupportedByAccessory__block_invoke_43;
    v17[3] = &unk_24E79B328;
    v18 = *(id *)(a1 + 32);
    objc_msgSend(v18, "workQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "supportsColorTemperatureRangeWithMinColorTemperature:maxColorTemperature:completion:queue:", v9, v8, v17, v10);

  }
}

void __90__HMDNaturalLightingMatterCurveWriter_updateSettingsIfNaturalLightingSupportedByAccessory__block_invoke_43(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Completed reading color temperature support: %@ with error: %@ from accessory: %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "lightProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateSettingsWithNaturalLightingSupported:", 1);

    objc_msgSend(*(id *)(a1 + 32), "updateNaturalLightingEnabledFromAttributes");
  }

}

void __81__HMDNaturalLightingMatterCurveWriter_updateNaturalLightingEnabledFromAttributes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v13;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch color control cluster from accessory: %@ with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Reading color temperature attributes from accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __81__HMDNaturalLightingMatterCurveWriter_updateNaturalLightingEnabledFromAttributes__block_invoke_32;
    v16[3] = &unk_24E79B2D8;
    v17 = *(id *)(a1 + 32);
    objc_msgSend(v17, "workQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "readColorTemperatureAttributesWithCompletion:queue:", v16, v12);

  }
}

void __81__HMDNaturalLightingMatterCurveWriter_updateNaturalLightingEnabledFromAttributes__block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to read color temperature attributes with error: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "handleColorTemperatureAttributes:", v5);
  }

}

void __80__HMDNaturalLightingMatterCurveWriter_disableNaturalLightingWithReason_message___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "updateSettingsWithNaturalLightingEnabled:", 0);
    v8 = objc_msgSend(WeakRetained, "stopPeriodicWriteTimer");
    if (a1[5])
    {
      v20 = *MEMORY[0x24BDD6518];
      objc_msgSend(a1[4], "settings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      encodeRootObjectForIncomingXPCMessage(v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[5], "respondWithPayload:", v11);
    }
    v12 = (void *)MEMORY[0x227676638](v8);
    v13 = WeakRetained;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Disabled natural lighting with error: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

void __71__HMDNaturalLightingMatterCurveWriter_enableNaturalLightingWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v11;
      v14 = 2112;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Enabled natural lighting completed with error: %@ transitionTime: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    if (!v5)
      objc_msgSend(*(id *)(a1 + 32), "updateSettingsWithNaturalLightingEnabled:", 1);
    objc_msgSend(v9, "startPeriodicWriteTimerWithInterval:", v6);
  }

}

void __79__HMDNaturalLightingMatterCurveWriter_enableNaturalLightingWithReason_message___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v11;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Enabled natural lighting completed with error: %@ transitionTime: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = a1[5];
    if (v5)
    {
      objc_msgSend(v12, "updateSettingsWithNaturalLightingEnabled:", 0);
      objc_msgSend(v9, "stopPeriodicWriteTimer");
      objc_msgSend(a1[4], "respondWithError:", v5);
    }
    else
    {
      objc_msgSend(v12, "updateSettingsWithNaturalLightingEnabled:", 1);
      objc_msgSend(a1[5], "settings", *MEMORY[0x24BDD6518]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      encodeRootObjectForIncomingXPCMessage(v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[4], "respondWithPayload:", v17);
      objc_msgSend(v9, "setStartUpColorTemperature");
      objc_msgSend(v9, "startPeriodicWriteTimerWithInterval:", v6);

    }
  }
  else
  {
    v13 = a1[4];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "respondWithError:", v14);

  }
}

void __65__HMDNaturalLightingMatterCurveWriter_setNaturalLightingEnabled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5 == 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v10;
    v25[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x227676638]();
    v13 = WeakRetained;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v15;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@setNaturalLightingEnabled finished with response: %@ error: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(*(id *)(a1 + 32), "fulfillWithValue:", v11);
    if (v5 || !*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "updateSettingsWithNaturalLightingEnabled:", 0);
      objc_msgSend(v13, "stopPeriodicWriteTimer");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "updateSettingsWithNaturalLightingEnabled:", 1);
      if (objc_msgSend(v6, "longValue"))
        objc_msgSend(v13, "startPeriodicWriteTimerWithInterval:", v6);
    }

  }
  else
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rejectWithError:", v17);

  }
}

uint64_t __77__HMDNaturalLightingMatterCurveWriter_handleMobileAssetsUpdatedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling mobile assets updated notification", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "handleNaturalLightingAllowed");
}

uint64_t __63__HMDNaturalLightingMatterCurveWriter_isNaturalLightingAllowed__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "isAccessoryCertifiedForNaturalLighting:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    v4 = _HMFPreconditionFailure();
    return __67__HMDNaturalLightingMatterCurveWriter_handleNaturalLightingAllowed__block_invoke(v4, v5);
  }
}

uint64_t __67__HMDNaturalLightingMatterCurveWriter_handleNaturalLightingAllowed__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "BOOLValue");
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Natural lighting is allowed for this accessory: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "setNaturalLightingAllowed:", 1);
    objc_msgSend(*(id *)(a1 + 32), "updateSettingsIfNaturalLightingSupportedByAccessory");
  }
  else
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Natural lighting is not allowed for this accessory: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "setNaturalLightingAllowed:", 0);
    objc_msgSend(*(id *)(a1 + 32), "lightProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateSettingsWithNaturalLightingSupported:", 0);

  }
  return 1;
}

uint64_t __67__HMDNaturalLightingMatterCurveWriter_handleNaturalLightingAllowed__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to check if natural lighting is allowed for this accessory: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

  return 1;
}

id __67__HMDNaturalLightingMatterCurveWriter_initWithWorkQueue_accessory___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a3, a1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t61_249185 != -1)
    dispatch_once(&logCategory__hmf_once_t61_249185, &__block_literal_global_63_249186);
  return (id)logCategory__hmf_once_v62_249187;
}

void __50__HMDNaturalLightingMatterCurveWriter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v62_249187;
  logCategory__hmf_once_v62_249187 = v0;

}

@end
