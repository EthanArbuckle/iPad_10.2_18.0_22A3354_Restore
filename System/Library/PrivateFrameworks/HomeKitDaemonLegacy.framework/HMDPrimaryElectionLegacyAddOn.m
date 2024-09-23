@implementation HMDPrimaryElectionLegacyAddOn

- (HMDPrimaryElectionLegacyAddOn)initWithContext:(id)a3
{
  id v4;
  HMDPrimaryElectionLegacyAddOn *v5;
  uint64_t v6;
  NSHashTable *devicePreferenceDataSources;
  uint64_t v8;
  HMFTimer *residentMonitorTimer;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  HMDPrimaryElectionLegacyAddOn *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDPrimaryElectionLegacyAddOn;
  v5 = -[HMDPrimaryElectionLegacyAddOn init](&v23, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
  v6 = objc_claimAutoreleasedReturnValue();
  devicePreferenceDataSources = v5->_devicePreferenceDataSources;
  v5->_devicePreferenceDataSources = (NSHashTable *)v6;

  objc_storeWeak((id *)&v5->_context, v4);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 5, 60.0);
  residentMonitorTimer = v5->_residentMonitorTimer;
  v5->_residentMonitorTimer = (HMFTimer *)v8;

  -[HMFTimer setDelegate:](v5->_residentMonitorTimer, "setDelegate:", v5);
  objc_msgSend(v4, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFTimer setDelegateQueue:](v5->_residentMonitorTimer, "setDelegateQueue:", v10);

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isResidentCapable");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D28670], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasBattery");

    if (v14)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v5;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Monitoring power state information for transient resident device", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", v16, sel_handleBatteryStateChange_, *MEMORY[0x1E0D28058], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObserver:selector:name:object:", v16, sel_handleBatteryLevelChange_, *MEMORY[0x1E0D28050], 0);

      objc_msgSend(MEMORY[0x1E0D28670], "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "start");

    }
  }

  return v5;
}

- (void)start
{
  void *v3;
  NSObject *v4;
  id v5;

  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    -[HMDPrimaryElectionLegacyAddOn _startMonitoringResident](self);
    v3 = v5;
  }

}

- (void)stop
{
  id v2;

  -[HMDPrimaryElectionLegacyAddOn residentMonitorTimer](self, "residentMonitorTimer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "messageDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteMessagePolicy defaultPolicy](HMDMutableRemoteMessagePolicy, "defaultPolicy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRequiresSecureMessage:", 1);
    objc_msgSend(v6, "setRequiresAccountMessage:", 1);
    objc_msgSend(v6, "setTransportRestriction:", -1);
    v7 = (void *)objc_msgSend(v6, "copy");
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v15, 3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", CFSTR("kResidentElectionParametersInternalRequestKey"), self, v9, sel__handleResidentElectionParameters_);

    v10 = *MEMORY[0x1E0CB8D28];
    v17[0] = v7;
    v17[1] = v8;
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", v10, self, v12, sel___handleConfirmationRequest_);

    v16[0] = v7;
    v16[1] = v8;
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", CFSTR("kResidentConfirmDeviceInternalRequestKey"), self, v14, sel__handleConfirmResidentDevice_);

  }
}

- (BOOL)residentIsPartOfTheCurrentMesh:(id)a3
{
  return 0;
}

- (void)performElectionWithReason:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMDPrimaryElectionLegacyAddOn *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  HMDPrimaryElectionLegacyAddOn *v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  HMDPrimaryElectionLegacyAddOn *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  HMDPrimaryElectionLegacyAddOn *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  HMDLegacyPrimaryElectionLogEvent *v33;
  __CFString *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  unint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_21;
  objc_msgSend(v5, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 - 1 > 6)
      v12 = CFSTR("no primary");
    else
      v12 = off_1E89AEBE0[a3 - 1];
    v13 = v12;
    *(_DWORD *)buf = 138543618;
    v42 = v11;
    v43 = 2112;
    v44 = v13;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Performing election with reason: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if ((objc_msgSend(v6, "isResidentEnabled") & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v9;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      goto LABEL_20;
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v23;
    v24 = "%{public}@Only resident capable devices which are enabled should perform resident election";
LABEL_19:
    _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, v24, buf, 0xCu);

    goto LABEL_20;
  }
  if ((objc_msgSend(v6, "isResidentSupported") & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v9;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      goto LABEL_20;
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v23;
    v24 = "%{public}@Resident election is not supported on this device.";
    goto LABEL_19;
  }
  if ((objc_msgSend(v6, "isOwnerUser") & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v9;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v23;
      v24 = "%{public}@Only owners can perform resident election";
      goto LABEL_19;
    }
LABEL_20:

    objc_autoreleasePoolPop(v20);
    goto LABEL_21;
  }
  objc_msgSend(v6, "currentResidentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPrimaryElectionLegacyAddOn _stopMonitoringResident:](v9, v14);

  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = v9;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 - 1 > 6)
      v19 = CFSTR("no primary");
    else
      v19 = off_1E89AEBE0[a3 - 1];
    v25 = v19;
    *(_DWORD *)buf = 138543618;
    v42 = v18;
    v43 = 2112;
    v44 = v25;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Starting primary resident election: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v40 = 0;
  -[HMDPrimaryElectionLegacyAddOn computePreferredElector:](v16, "computePreferredElector:", &v40);
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[HMDPrimaryElectionLegacyAddOn delegate](v16, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1D17BA0A0]();
  v29 = v16;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v31)
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v32;
      v43 = 2112;
      v44 = v26;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Resident device elected: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    v33 = objc_alloc_init(HMDLegacyPrimaryElectionLogEvent);
    if (a3 - 1 > 6)
      v34 = CFSTR("no primary");
    else
      v34 = off_1E89AEBE0[a3 - 1];
    v36 = v34;
    -[HMDLegacyPrimaryElectionLogEvent setReason:](v33, "setReason:", v36);

    if (v40 > 0x11)
      v37 = CFSTR("unknown reason");
    else
      v37 = off_1E89AEC18[v40];
    v38 = v37;
    -[HMDLegacyPrimaryElectionLogEvent setCriteria:](v33, "setCriteria:", v38);

    objc_msgSend(v6, "availableResidentDevices");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLegacyPrimaryElectionLogEvent setAvailableResidentCount:](v33, "setAvailableResidentCount:", objc_msgSend(v39, "count"));

    objc_msgSend(v27, "primaryElectionAddOn:didElectPrimaryResident:confirmed:electionLogEvent:", v29, v26, 0, v33);
  }
  else
  {
    if (v31)
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v35;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@No resident device available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("No valid resident found"), 0, 0);
    v33 = (HMDLegacyPrimaryElectionLogEvent *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "primaryElectionAddOn:didFailToElectWithError:", v29, v33);
  }

LABEL_21:
}

- (void)primaryResidentChanged:(id)a3 previousResidentDevice:(id)a4
{
  -[HMDPrimaryElectionLegacyAddOn _stopMonitoringResident:](self, a4);
}

- (id)residentsInMesh
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDPrimaryElectionLegacyAddOn *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    objc_msgSend(v6, "primaryResidentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && (objc_msgSend(v9, "isCurrentDevice") & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Pinging resident: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v6, "messageDispatcher");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "secureRemoteTransport");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __46__HMDPrimaryElectionLegacyAddOn_timerDidFire___block_invoke;
      v16[3] = &unk_1E89B4E68;
      v16[4] = v11;
      v17 = v9;
      objc_msgSend(v15, "pingDevice:completionHandler:", v17, v16);

    }
  }

}

- (void)handleBatteryStateChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  -[HMDPrimaryElectionLegacyAddOn context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__HMDPrimaryElectionLegacyAddOn_handleBatteryStateChange___block_invoke;
    v7[3] = &unk_1E89C2328;
    v7[4] = self;
    v8 = v5;
    dispatch_async(v6, v7);

  }
}

- (void)handleBatteryLevelChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  -[HMDPrimaryElectionLegacyAddOn context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__HMDPrimaryElectionLegacyAddOn_handleBatteryLevelChange___block_invoke;
    v7[3] = &unk_1E89C2328;
    v7[4] = self;
    v8 = v5;
    dispatch_async(v6, v7);

  }
}

- (id)computePreferredElector:(unint64_t *)a3
{
  HMDPrimaryElectionLegacyAddOn *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  HMDPrimaryElectionLegacyAddOn *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HMDPrimaryElectionLegacyAddOn *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDPrimaryElectionLegacyAddOn *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v4 = self;
  v54 = *MEMORY[0x1E0C80C00];
  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = 11;
    v36 = v5;
    objc_msgSend(v5, "availableResidentDevices", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v39 = v8;
    v9 = (void *)objc_msgSend(v8, "copy");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v44;
      v37 = v9;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isReachable") & 1) == 0)
          {
            v15 = (void *)MEMORY[0x1D17BA0A0]();
            v16 = v4;
            HMFGetOSLogHandle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v38 = v15;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "device");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "isCurrentDevice");
              HMFBooleanToString();
              v20 = v12;
              v21 = v4;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v48 = v18;
              v49 = 2112;
              v50 = v14;
              v51 = 2112;
              v52 = v22;
              _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Not electing resident as it is unreachable: %@, isCurrentDevice: %@", buf, 0x20u);

              v9 = v37;
              v4 = v21;
              v12 = v20;

              v15 = v38;
            }

            objc_autoreleasePoolPop(v15);
            objc_msgSend(v39, "removeObject:", v14);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v11);
    }

    if (isInternalBuild())
    {
      v6 = v36;
      objc_msgSend(v36, "home");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)preferredPrimaryForHome, "objectForKey:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = v4;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "UUIDString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUIDString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v48 = v29;
          v49 = 2112;
          v50 = v30;
          v51 = 2112;
          v52 = v31;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@The house %@ has a preferred primary device of %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v26);
      }

    }
    else
    {
      v25 = 0;
      v6 = v36;
    }
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __57__HMDPrimaryElectionLegacyAddOn_computePreferredElector___block_invoke;
    v40[3] = &unk_1E89B3F98;
    v41 = v25;
    v42 = v35;
    v33 = v25;
    objc_msgSend(v39, "sortUsingComparator:", v40);
    objc_msgSend(v39, "lastObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (void)confirmWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  HMDPrimaryElectionLegacyAddOn *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDPrimaryElectionLegacyAddOn *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDPrimaryElectionLegacyAddOn *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    if ((objc_msgSend(v6, "isOwnerUser") & 1) != 0)
    {
      objc_msgSend(v6, "currentResidentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "availableResidentDevices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v8);

      if ((v10 & 1) != 0)
      {
        -[HMDPrimaryElectionLegacyAddOn computePreferredElector:](self, "computePreferredElector:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[HMDPrimaryElectionLegacyAddOn confirmElector:completionHandler:](self, v11, v4);
        }
        else
        {
          v20 = (void *)MEMORY[0x1D17BA0A0]();
          v21 = self;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138543362;
            v26 = v23;
            _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Confirmation failed, unable to determine the elector", (uint8_t *)&v25, 0xCu);

          }
          objc_autoreleasePoolPop(v20);
          if (v4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Confirmation failed."), CFSTR("Unable to determine the elector"), 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *))v4 + 2))(v4, v24);

          }
        }

      }
      else
      {
        v16 = (void *)MEMORY[0x1D17BA0A0]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v19;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Requesting confirmation from primary resident device", (uint8_t *)&v25, 0xCu);

        }
        objc_autoreleasePoolPop(v16);
        -[HMDPrimaryElectionLegacyAddOn requestConfirmationForElector:completionHandler:](v17, 0, v4);
      }
      goto LABEL_18;
    }
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Confirmation is only available to the owner of the home", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, 0, CFSTR("Confirmation is only available to the owner of the home."), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v8);
LABEL_18:

    }
  }

}

- (void)__handleConfirmationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMDPrimaryElectionLegacyAddOn *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDPrimaryElectionLegacyAddOn *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    if (objc_msgSend(v6, "isResidentSupported")
      && (objc_msgSend(v6, "isCurrentDeviceAvailableResident") & 1) != 0)
    {
      if (objc_msgSend(v4, "BOOLForKey:", CFSTR("shouldElect")))
        -[HMDPrimaryElectionLegacyAddOn computePreferredElector:](self, "computePreferredElector:", 0);
      else
        objc_msgSend(v6, "currentResidentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __61__HMDPrimaryElectionLegacyAddOn___handleConfirmationRequest___block_invoke;
        v18[3] = &unk_1E89C2350;
        v19 = v4;
        -[HMDPrimaryElectionLegacyAddOn confirmElector:completionHandler:](self, v12, v18);
        v13 = v19;
      }
      else
      {
        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v21 = v17;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Confirmation failed, unable to determine the elector", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Confirmation failed."), CFSTR("Unable to determine the elector"), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v13);
      }

    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Confirmation failed, not an available resident", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("Confirmation failed."), CFSTR("Not an available resident device."), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v12);
    }

  }
}

- (void)confirmAsResident
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  HMDPrimaryElectionLegacyAddOn *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDPrimaryElectionLegacyAddOn *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HMDPrimaryElectionLegacyAddOn *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    if ((objc_msgSend(v4, "isResidentSupported") & 1) == 0)
    {
      v14 = MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v17;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Do not confirm ourselves as the resident; We are not currently supported",
          buf,
          0xCu);

      }
      v18 = (void *)v14;
      goto LABEL_11;
    }
    if (!-[HMDPrimaryElectionLegacyAddOn isConfirming](self, "isConfirming"))
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v9;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting to confirm ourselves as the resident", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(v4, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[HMDPrimaryElectionLegacyAddOn setConfirming:](v7, "setConfirming:", 1);
        objc_msgSend(v4, "currentResidentDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPrimaryElectionLegacyAddOn _electionParameters](v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "availableResidentDevices");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __50__HMDPrimaryElectionLegacyAddOn_confirmAsResident__block_invoke;
        v23[3] = &unk_1E89C2730;
        v23[4] = v7;
        -[HMDPrimaryElectionLegacyAddOn _confirmResidentDevice:electionParameters:againstDevices:completionBlock:](v7, v11, v12, v13, v23);

        goto LABEL_12;
      }
      v19 = MEMORY[0x1D17BA0A0]();
      v20 = v7;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v22;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Returning early from confirming as resident since home does not exist", buf, 0xCu);

      }
      v18 = (void *)v19;
LABEL_11:
      objc_autoreleasePoolPop(v18);
    }
  }
LABEL_12:

}

- (void)confirmOnAvailability
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDPrimaryElectionLegacyAddOn *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDPrimaryElectionLegacyAddOn *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDRemoteDeviceMessageDestination *v25;
  void *v26;
  void *v27;
  HMDRemoteDeviceMessageDestination *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    objc_msgSend(v4, "currentResidentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPrimaryElectionLegacyAddOn _electionParameters](self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Resident device has become available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDPrimaryElectionLegacyAddOn computePreferredElector:](v9, "computePreferredElector:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryResidentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v12, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isCurrentDevice");

      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = v9;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
      if (v15)
      {
        if (v19)
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "primaryResidentDevice");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v20;
          v37 = 2112;
          v38 = v21;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Confirming ourselves against primary resident %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        v34 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPrimaryElectionLegacyAddOn _confirmResidentDevice:electionParameters:againstDevices:completionBlock:](v17, v6, v7, v22, 0);

      }
      else
      {
        if (v19)
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "primaryResidentDevice");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v23;
          v37 = 2112;
          v38 = v24;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Requesting to confirm this device against primary resident %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        v25 = [HMDRemoteDeviceMessageDestination alloc];
        -[HMDPrimaryElectionLegacyAddOn messageTargetUUID](v17, "messageTargetUUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "device");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v25, "initWithTarget:device:", v26, v27);

        v32 = CFSTR("kResidentElectionParametersKey");
        v33 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDRemoteMessage secureMessageWithName:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:destination:messagePayload:", CFSTR("kResidentConfirmDeviceInternalRequestKey"), v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "messageDispatcher");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sendMessage:completionHandler:", v30, 0);

      }
    }
    else
    {
      -[HMDPrimaryElectionLegacyAddOn performElectionWithReason:](v9, "performElectionWithReason:", 0);
    }

  }
}

- (void)confirmPrimaryResident
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMDPrimaryElectionLegacyAddOn *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDPrimaryElectionLegacyAddOn *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    objc_msgSend(v4, "currentResidentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isResidentSupported");
    v8 = objc_msgSend(v4, "isOwnerUser");
    if (v7 && (objc_msgSend(v6, "isEnabled") & v8 & 1) != 0)
    {
      objc_msgSend(v4, "primaryResidentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "device");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isCurrentDevice");

        if ((v12 & 1) == 0)
        {
          v13 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = self;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "shortDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v33 = v16;
            v34 = 2112;
            v35 = v17;
            _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Confirming primary resident: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v13);
          objc_msgSend(v10, "device");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "capabilities");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "device");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "capabilities");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[HMDPrimaryElectionLegacyAddOn compareCapabilities:withCapabilities:]((uint64_t)v14, v19, v21);

          if (v22 == -1)
          {
            objc_initWeak((id *)buf, v14);
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __55__HMDPrimaryElectionLegacyAddOn_confirmPrimaryResident__block_invoke;
            v30[3] = &unk_1E89C0678;
            objc_copyWeak(&v31, (id *)buf);
            -[HMDPrimaryElectionLegacyAddOn confirmWithCompletionHandler:](v14, "confirmWithCompletionHandler:", v30);
            objc_destroyWeak(&v31);
            objc_destroyWeak((id *)buf);
          }
        }
      }

    }
    else
    {
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "isEnabled");
        HMFBooleanToString();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v33 = v26;
        v34 = 2112;
        v35 = v27;
        v36 = 2112;
        v37 = v28;
        v38 = 2112;
        v39 = v29;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Current device is incapable of election and confirmation - Resident Supported: %@, Resident Enabled: %@, Owned Home: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v23);
    }

  }
}

- (BOOL)isAtHome
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "atHomeLevel") == 2 || objc_msgSend(v3, "atHomeLevel") == 3;
  else
    v4 = 0;

  return v4;
}

- (void)_handleResidentElectionParameters:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;

  v12 = a3;
  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    objc_msgSend(v12, "messagePayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmf_arrayForKey:", CFSTR("kAccessoriesListKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "responseHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HMDPrimaryElectionLegacyAddOn _electionParameters:](self, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "responseHandler");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v10);

    }
  }

}

- (void)_handleConfirmResidentDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  int v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  HMDPrimaryElectionLegacyAddOn *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDPrimaryElectionLegacyAddOn *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    objc_msgSend(v6, "currentResidentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isResidentSupported");
    v10 = objc_msgSend(v6, "isOwnerUser");
    if (v9 && (objc_msgSend(v8, "isEnabled") & v10 & 1) != 0)
    {
      objc_msgSend(v4, "remoteSourceDevice");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "residentDeviceForDevice:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dictionaryForKey:", CFSTR("kResidentElectionParametersKey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "primaryResidentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v13)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v18;
          v37 = 2112;
          v38 = v12;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Confirming current resident on behalf of %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        v34 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v33;
        -[HMDPrimaryElectionLegacyAddOn _confirmResidentDevice:electionParameters:againstDevices:completionBlock:](v15, v12, v33, v19, 0);

        objc_msgSend(v4, "respondWithPayload:", 0);
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v36 = v29;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@No primary resident for confirmation.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v4, "responseHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v33;
        if (v30)
        {
          objc_msgSend(v4, "responseHandler");
          v31 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v31)[2](v31, v32, 0);

        }
      }

    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "isEnabled");
        HMFBooleanToString();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v36 = v24;
        v37 = 2112;
        v38 = v25;
        v39 = 2112;
        v40 = v26;
        v41 = 2112;
        v42 = v27;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Current device is incapable of election and confirmation - Resident Supported: %@, Resident Enabled: %@, Owned Home: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v4, "responseHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
        goto LABEL_18;
      objc_msgSend(v4, "responseHandler");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v12, 0);
    }

LABEL_18:
  }

}

- (void)atHomeLevelChanged:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;

  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = v5;
    objc_msgSend(v5, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    if (objc_msgSend(v11, "isCurrentDeviceAvailableResident"))
    {
      objc_msgSend(MEMORY[0x1E0D28670], "sharedManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batteryState");

      if (v8 == 1)
        -[HMDPrimaryElectionLegacyAddOn _updateDischargingTimer:](self, a3);
    }
    v5 = v11;
    if (a3 == 1)
    {
      objc_msgSend(v11, "primaryResidentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isCurrentDevice");

      v5 = v11;
      if (v10)
      {
        -[HMDPrimaryElectionLegacyAddOn performElectionWithReason:](self, "performElectionWithReason:", 6);
        v5 = v11;
      }
    }
  }

}

- (void)addDataSource:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;

  v7 = a3;
  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    -[NSHashTable addObject:](self->_devicePreferenceDataSources, "addObject:", v7);
  }

}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v4;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDPrimaryElectionLegacyAddOn context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dumpState
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (HMDPrimaryResidentElectionAddOnDelegate)delegate
{
  return (HMDPrimaryResidentElectionAddOnDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isConfirming
{
  return self->_confirming;
}

- (void)setConfirming:(BOOL)a3
{
  self->_confirming = a3;
}

- (HMDResidentDevice)preferredElector
{
  return self->_preferredElector;
}

- (HMFTimer)residentMonitorTimer
{
  return self->_residentMonitorTimer;
}

- (void)setResidentMonitorTimer:(id)a3
{
  objc_storeStrong((id *)&self->_residentMonitorTimer, a3);
}

- (NSHashTable)devicePreferenceDataSources
{
  return self->_devicePreferenceDataSources;
}

- (HMDResidentDeviceManagerContext)context
{
  return (HMDResidentDeviceManagerContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_devicePreferenceDataSources, 0);
  objc_storeStrong((id *)&self->_residentMonitorTimer, 0);
  objc_storeStrong((id *)&self->_preferredElector, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_updateDischargingTimer:(void *)a1
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  id v12;
  NSObject *v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
    {
LABEL_15:

      return;
    }
    objc_msgSend(v4, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    if (isAppleTV())
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = a1;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v10;
        v11 = "%{public}@We should only be pinging the resident on transient resident capable devices which are enabled";
LABEL_12:
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v25, 0xCu);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
    if ((objc_msgSend(v5, "isResidentSupported") & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = a1;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v10;
        v11 = "%{public}@We shouldn't ping if resident is not supported.";
        goto LABEL_12;
      }
LABEL_13:

LABEL_14:
      objc_autoreleasePoolPop(v7);
      goto LABEL_15;
    }
    if (a2 == 1)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = a1;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = 1800.0;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v15;
        v16 = "%{public}@Updating monitor timer since we are not at home and discharging";
LABEL_20:
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v25, 0xCu);

      }
    }
    else
    {
      v17 = objc_msgSend(v5, "atHomeLevel");
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = a1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      v13 = v19;
      if (v17 != 1)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v24;
          _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Battery state change does not require resetting the monitor timer.", (uint8_t *)&v25, 0xCu);

        }
        goto LABEL_14;
      }
      v14 = 600.0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v15;
        v16 = "%{public}@Updating monitor timer since we are at home and discharging";
        goto LABEL_20;
      }
    }

    objc_autoreleasePoolPop(v7);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 13, v14);
    objc_msgSend(a1, "setResidentMonitorTimer:", v20);

    objc_msgSend(a1, "residentMonitorTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", a1);

    objc_msgSend(v5, "queue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "residentMonitorTimer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegateQueue:", v22);

    -[HMDPrimaryElectionLegacyAddOn _startMonitoringResident](a1);
    goto LABEL_15;
  }
}

- (void)_startMonitoringResident
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (!v2)
    {
LABEL_14:

      return;
    }
    objc_msgSend(v2, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    objc_msgSend(v3, "primaryResidentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isCurrentDevice") & 1) == 0
        && objc_msgSend(v3, "isResidentSupported")
        && (objc_msgSend(v3, "isResidentEnabled") & 1) != 0)
      {
        v8 = objc_msgSend(v3, "isOwnerUser");

        if (v8)
        {
          v9 = (void *)MEMORY[0x1D17BA0A0]();
          v10 = a1;
          HMFGetOSLogHandle();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = 138543618;
            v15 = v12;
            v16 = 2112;
            v17 = v6;
            _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Start monitoring resident, %@", (uint8_t *)&v14, 0x16u);

          }
          objc_autoreleasePoolPop(v9);
          objc_msgSend(v10, "residentMonitorTimer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "resume");

          goto LABEL_13;
        }
      }
      else
      {

      }
    }
    -[HMDPrimaryElectionLegacyAddOn _stopMonitoringResident:](a1, v6);
LABEL_13:

    goto LABEL_14;
  }
}

- (void)_stopMonitoringResident:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "queue");
      v6 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v6);

      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = a1;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v10;
        v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping monitoring resident, %@", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(v8, "residentMonitorTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "suspend");

    }
  }

}

- (void)_confirmResidentDevice:(void *)a3 electionParameters:(void *)a4 againstDevices:(void *)a5 completionBlock:
{
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  id v32;
  void *v33;
  char v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  HMDRemoteDeviceMessageDestination *v41;
  HMDRemoteDeviceMessageDestination *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  HMDLegacyPrimaryElectionConfirmationLogEvent *v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  void (**v65)(void);
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  id obj;
  uint64_t v73;
  id v74;
  HMDAssertionLogEvent *group;
  uint64_t v76;
  id val;
  void (**v78)(void *, _QWORD, void *);
  HMDLegacyPrimaryElectionConfirmationLogEvent *v79;
  void *v80;
  _QWORD block[4];
  id v82;
  id v83;
  id v84;
  HMDLegacyPrimaryElectionConfirmationLogEvent *v85;
  void (**v86)(void);
  __int128 *v87;
  _QWORD aBlock[4];
  id v89;
  id v90;
  void *v91;
  HMDLegacyPrimaryElectionConfirmationLogEvent *v92;
  id v93;
  HMDAssertionLogEvent *v94;
  __int128 *p_buf;
  _QWORD *v96;
  id v97;
  id location;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[5];
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t v110[4];
  id v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  void *v117;
  uint8_t v118[128];
  __int128 buf;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  _QWORD v124[2];
  _QWORD v125[2];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v64 = a2;
  v61 = a3;
  v62 = a4;
  v65 = a5;
  if (a1)
  {
    val = a1;
    objc_msgSend(a1, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v9;
    if (!v9)
    {
LABEL_48:

      goto LABEL_49;
    }
    objc_msgSend(v9, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v10);

    objc_msgSend(v71, "home");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      if (v64)
      {
        objc_msgSend(v63, "accessories");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "copy");

        if (v12)
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
        else
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        obj = v12;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v126, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v107;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v107 != v22)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * i), "uuid");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "UUIDString");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "addObject:", v25);

            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v126, 16);
          }
          while (v21);
        }

        v124[0] = CFSTR("kHomeUUID");
        objc_msgSend(v63, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "UUIDString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v125[0] = v27;
        v124[1] = CFSTR("kAccessoriesListKey");
        v28 = (void *)objc_msgSend(v80, "copy");
        v125[1] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 2);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v120 = 0x3032000000;
        v121 = __Block_byref_object_copy__113972;
        v122 = __Block_byref_object_dispose__113973;
        v74 = v64;
        v123 = v74;
        v104[0] = 0;
        v104[1] = v104;
        v104[2] = 0x3032000000;
        v104[3] = __Block_byref_object_copy__113972;
        v104[4] = __Block_byref_object_dispose__113973;
        v105 = v61;
        objc_msgSend(v71, "primaryResidentDevice");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (v69)
        {
          v79 = objc_alloc_init(HMDLegacyPrimaryElectionConfirmationLogEvent);
          -[HMDLegacyPrimaryElectionConfirmationLogEvent setAvailableResidentCount:](v79, "setAvailableResidentCount:", objc_msgSend(v62, "count"));
          group = (HMDAssertionLogEvent *)dispatch_group_create();
          v100 = 0u;
          v101 = 0u;
          v102 = 0u;
          v103 = 0u;
          v70 = v62;
          v29 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
          if (v29)
          {
            v73 = *(_QWORD *)v101;
            do
            {
              v76 = v29;
              for (j = 0; j != v76; ++j)
              {
                if (*(_QWORD *)v101 != v73)
                  objc_enumerationMutation(v70);
                v31 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
                if (objc_msgSend(v74, "isEqual:", v31))
                {
                  -[HMDLegacyPrimaryElectionConfirmationLogEvent setAvailableResidentCount:](v79, "setAvailableResidentCount:", -[HMDLegacyPrimaryElectionConfirmationLogEvent availableResidentCount](v79, "availableResidentCount")- 1);
                }
                else
                {
                  v99 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Confirm against other resident"));
                  dispatch_group_enter(&group->super.super);
                  objc_initWeak(&location, val);
                  aBlock[0] = MEMORY[0x1E0C809B0];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __106__HMDPrimaryElectionLegacyAddOn__confirmResidentDevice_electionParameters_againstDevices_completionBlock___block_invoke;
                  aBlock[3] = &unk_1E89B3FE8;
                  objc_copyWeak(&v97, &location);
                  v32 = v71;
                  v89 = v32;
                  v90 = v99;
                  v91 = v31;
                  v92 = v79;
                  p_buf = &buf;
                  v96 = v104;
                  v93 = v69;
                  v94 = group;
                  v78 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
                  objc_msgSend(v31, "device");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "isCurrentDevice");

                  if ((v34 & 1) != 0)
                  {
                    v35 = (void *)MEMORY[0x1D17BA0A0]();
                    v36 = val;
                    HMFGetOSLogHandle();
                    v37 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v38 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v99, "identifier");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "shortDescription");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v110 = 138543618;
                      v111 = v38;
                      v112 = 2114;
                      v113 = v40;
                      _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Confirming against current device", v110, 0x16u);

                    }
                    objc_autoreleasePoolPop(v35);
                    -[HMDPrimaryElectionLegacyAddOn _electionParameters:](v36, v80);
                    v41 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();
                    v78[2](v78, 0, v41);
                  }
                  else
                  {
                    v42 = [HMDRemoteDeviceMessageDestination alloc];
                    objc_msgSend(val, "messageTargetUUID");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "device");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v41 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v42, "initWithTarget:device:", v43, v44);

                    +[HMDRemoteMessage secureMessageWithName:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:destination:messagePayload:", CFSTR("kResidentElectionParametersInternalRequestKey"), v41, v67);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v45, "setResponseHandler:", v78));
                    v47 = val;
                    HMFGetOSLogHandle();
                    v48 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                    {
                      v66 = v46;
                      HMFGetLogIdentifier();
                      v68 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v99, "identifier");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v49, "shortDescription");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "shortDescription");
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v45, "shortDescription");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v110 = 138544130;
                      v111 = v68;
                      v112 = 2114;
                      v113 = v50;
                      v114 = 2112;
                      v115 = v51;
                      v116 = 2112;
                      v117 = v52;
                      _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Confirming against resident capable device %@ with message: %@", v110, 0x2Au);

                      v46 = v66;
                    }

                    objc_autoreleasePoolPop(v46);
                    objc_msgSend(v32, "messageDispatcher");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v53, "sendMessage:", v45);

                  }
                  objc_destroyWeak(&v97);
                  objc_destroyWeak(&location);
                  __HMFActivityScopeLeave();

                }
              }
              v29 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
            }
            while (v29);
          }

          objc_msgSend(v71, "queue");
          v54 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __106__HMDPrimaryElectionLegacyAddOn__confirmResidentDevice_electionParameters_againstDevices_completionBlock___block_invoke_45;
          block[3] = &unk_1E89C0608;
          v82 = v69;
          v83 = v71;
          v84 = val;
          v86 = v65;
          v87 = &buf;
          v85 = v79;
          v55 = v79;
          dispatch_group_notify(&group->super.super, v54, block);

        }
        else
        {
          v56 = (void *)MEMORY[0x1D17BA0A0]();
          v57 = val;
          HMFGetOSLogHandle();
          v58 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
          {
            HMFGetLogIdentifier();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v110 = 138543362;
            v111 = v59;
            _os_log_impl(&dword_1CD062000, v58, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Current resident cannot be determined", v110, 0xCu);

          }
          objc_autoreleasePoolPop(v56);
          group = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Current resident cannot be determined"));
          +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "submitLogEvent:", group);

          if (v65)
            v65[2]();
        }

        _Block_object_dispose(v104, 8);
        _Block_object_dispose(&buf, 8);

        goto LABEL_47;
      }
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = a1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cancelling confirmation: device to confirm is not specified", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      if (!v65)
        goto LABEL_47;
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = a1;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Returning early from confirming as resident since home does not exist", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      if (!v65)
        goto LABEL_47;
    }
    v65[2]();
LABEL_47:

    v9 = v71;
    goto LABEL_48;
  }
LABEL_49:

}

void __106__HMDPrimaryElectionLegacyAddOn__confirmResidentDevice_electionParameters_againstDevices_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  id v23;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v10 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __106__HMDPrimaryElectionLegacyAddOn__confirmResidentDevice_electionParameters_againstDevices_completionBlock___block_invoke_2;
      v14[3] = &unk_1E89B3FC0;
      objc_copyWeak(&v23, (id *)(a1 + 96));
      v15 = v5;
      v11 = *(id *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(void **)(a1 + 56);
      v16 = v11;
      v17 = v12;
      v18 = v13;
      v22 = *(_OWORD *)(a1 + 80);
      v19 = v6;
      v20 = *(id *)(a1 + 64);
      v21 = *(id *)(a1 + 72);
      dispatch_async(v10, v14);

      objc_destroyWeak(&v23);
    }
  }

}

- (id)_electionParameters:(void *)a1
{
  void *v2;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    objc_msgSend(a1, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v28 = a1;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
      v29 = v4;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      if (v7)
      {
        v2 = (void *)v7;
        v8 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v2; i = (char *)i + 1)
          {
            if (*(_QWORD *)v32 != v8)
              objc_enumerationMutation(v6);
            v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v5, "home");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
            objc_msgSend(v11, "accessoryWithUUID:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = v13;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v15 = v14;
            else
              v15 = 0;
            v16 = v15;

            v17 = v14;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v18 = v17;
            else
              v18 = 0;
            v19 = v18;

            if (v16 | v19)
            {
              if (objc_msgSend(v17, "isReachable"))
                v20 = &unk_1E8B33C00;
              else
                v20 = &unk_1E8B33C18;
              objc_msgSend(v30, "setObject:forKey:", v20, v10);
            }

          }
          v2 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        }
        while (v2);
      }

      v36[0] = v30;
      v35[0] = CFSTR("kAccessoriesListKey");
      v35[1] = CFSTR("kEnabledKey");
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v22 = objc_msgSend(v5, "isResidentSupported");
      if (v22)
      {
        objc_msgSend(v5, "currentResidentDevice");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v2, "isEnabled");
      }
      else
      {
        v23 = 0;
      }
      v4 = v29;
      objc_msgSend(v21, "numberWithInt:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v25;
      v35[2] = CFSTR("kAtHomeStateKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v28, "isAtHome"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

uint64_t __106__HMDPrimaryElectionLegacyAddOn__confirmResidentDevice_electionParameters_againstDevices_completionBlock___block_invoke_45(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t result;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "primaryResidentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  if ((v3 & 1) != 0)
  {
    if ((HMFEqualObjects() & 1) == 0)
      objc_msgSend(*(id *)(a1 + 56), "setChangedPrimary:", 1);
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryElectionAddOn:didElectPrimaryResident:confirmed:electionLogEvent:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), 1, *(_QWORD *)(a1 + 56));

    result = *(_QWORD *)(a1 + 64);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "primaryResidentDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Cancelling confirmation: resident device has changed from %@ to %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    result = *(_QWORD *)(a1 + 64);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __106__HMDPrimaryElectionLegacyAddOn__confirmResidentDevice_electionParameters_againstDevices_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDResidentDeviceElectionParameters *v8;
  HMDResidentDeviceElectionParameters *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HMDResidentDeviceElectionParameters *v19;
  HMDResidentDeviceElectionParameters *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  HMDResidentDeviceElectionParameters *v31;
  void *v32;
  HMDResidentDeviceElectionParameters *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  HMDResidentDeviceElectionParameters *v47;
  HMDResidentDeviceElectionParameters *v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  int64_t v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  HMDResidentDeviceElectionParameters *v63;
  HMDResidentDeviceElectionParameters *v64;
  void *v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  HMDResidentDeviceElectionParameters *v77;
  HMDResidentDeviceElectionParameters *v78;
  void *v79;
  unint64_t v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  HMDResidentDeviceElectionParameters *v84;
  __int16 v85;
  HMDResidentDeviceElectionParameters *v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = WeakRetained;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v8 = (HMDResidentDeviceElectionParameters *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "shortDescription");
      v9 = (HMDResidentDeviceElectionParameters *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v82 = v6;
      v83 = 2114;
      v84 = v8;
      v85 = 2112;
      v86 = v9;
      v87 = 2112;
      v88 = v10;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Failed to get election parameters from resident device %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v3);
    goto LABEL_32;
  }
  objc_msgSend(*(id *)(a1 + 56), "setResidentsRespondedCount:", objc_msgSend(*(id *)(a1 + 56), "residentsRespondedCount") + 1);
  v80 = 0;
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  v12 = *(void **)(a1 + 48);
  v13 = *(void **)(a1 + 64);
  v14 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v15 = v11;
  v16 = v12;
  v17 = v13;
  if (!WeakRetained)
  {
    v29 = 0;
    goto LABEL_24;
  }
  objc_msgSend(WeakRetained, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v79 = v14;
    v75 = v15;
    v19 = -[HMDResidentDeviceElectionParameters initWithResident:dictionaryRepresentation:]([HMDResidentDeviceElectionParameters alloc], "initWithResident:dictionaryRepresentation:", v14, v15);
    v76 = v17;
    v20 = -[HMDResidentDeviceElectionParameters initWithResident:dictionaryRepresentation:]([HMDResidentDeviceElectionParameters alloc], "initWithResident:dictionaryRepresentation:", v16, v17);
    v80 = 1;
    v78 = v19;
    -[HMDResidentDeviceElectionParameters isEnabled](v19, "isEnabled");
    v21 = objc_claimAutoreleasedReturnValue();
    v77 = v20;
    -[HMDResidentDeviceElectionParameters isEnabled](v20, "isEnabled");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = WeakRetained;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v82 = v26;
      v83 = 2112;
      v84 = (HMDResidentDeviceElectionParameters *)v21;
      v85 = 2112;
      v86 = (HMDResidentDeviceElectionParameters *)v22;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Comparing enabled status: %@ -> %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    if (!(v21 | v22)
      || (!v21 ? (v27 = (void *)v22, v28 = 0) : (v27 = (void *)v21, v28 = v22),
          (v29 = objc_msgSend(v27, "compare:", v28)) == 0))
    {

      v80 = 2;
      objc_msgSend(v79, "device");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "capabilities");
      v31 = (HMDResidentDeviceElectionParameters *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "device");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "capabilities");
      v33 = (HMDResidentDeviceElectionParameters *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = v24;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v82 = v37;
        v83 = 2112;
        v84 = v31;
        v85 = 2112;
        v86 = v33;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Comparing capabilities status: %@ -> %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v34);
      v29 = -[HMDPrimaryElectionLegacyAddOn compareCapabilities:withCapabilities:]((uint64_t)v35, v31, v33);

      v14 = v79;
      v17 = v76;
      if (v29)
        goto LABEL_22;
      v38 = (void *)MEMORY[0x1D17BA0A0]();
      v39 = v35;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v82 = v41;
        v83 = 2112;
        v84 = v78;
        v85 = 2112;
        v86 = v77;
        _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Comparing parameters: %@ -> %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v38);
      v29 = -[HMDResidentDeviceElectionParameters compare:outCriteria:](v78, "compare:outCriteria:", v77, &v80);
      if (v29)
        goto LABEL_22;
      v80 = 8;
      objc_msgSend(v79, "device");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "version");
      v21 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "device");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "version");
      v22 = objc_claimAutoreleasedReturnValue();

      v54 = (void *)MEMORY[0x1D17BA0A0]();
      v55 = v39;
      HMFGetOSLogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v82 = v57;
        v83 = 2112;
        v84 = (HMDResidentDeviceElectionParameters *)v21;
        v85 = 2112;
        v86 = (HMDResidentDeviceElectionParameters *)v22;
        _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_DEBUG, "%{public}@Comparing election versions: %@ -> %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v54);
      v58 = +[HMDPrimaryElectionLegacyAddOn compareElectionVersions:otherVersion:](HMDPrimaryElectionLegacyAddOn, "compareElectionVersions:otherVersion:", v21, v22);
      if (v58)
      {
        v29 = v58;
      }
      else
      {
        v80 = 10;
        objc_msgSend(v18, "primaryResidentDevice");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)MEMORY[0x1D17BA0A0]();
        v61 = v55;
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v70 = v61;
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "shortDescription");
          v63 = (HMDResidentDeviceElectionParameters *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "shortDescription");
          v71 = v60;
          v64 = (HMDResidentDeviceElectionParameters *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "shortDescription");
          v72 = v59;
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v82 = v74;
          v83 = 2112;
          v84 = v63;
          v85 = 2112;
          v86 = v64;
          v87 = 2112;
          v88 = v65;
          _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_DEBUG, "%{public}@Comparing current primary %@: %@ -> %@", buf, 0x2Au);

          v59 = v72;
          v60 = v71;

          v61 = v70;
        }

        objc_autoreleasePoolPop(v60);
        if ((objc_msgSend(v59, "isEqual:", v79) & 1) != 0)
        {
          v29 = 1;
        }
        else if ((objc_msgSend(v59, "isEqual:", v16) & 1) != 0)
        {
          v29 = -1;
        }
        else
        {
          v66 = (void *)MEMORY[0x1D17BA0A0]();
          v67 = v61;
          HMFGetOSLogHandle();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v73 = v59;
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v82 = v69;
            _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_DEBUG, "%{public}@Comparing, equivalent", buf, 0xCu);

            v59 = v73;
          }

          objc_autoreleasePoolPop(v66);
          v29 = 0;
          v80 = 0;
        }

      }
    }

    v14 = v79;
    v17 = v76;
LABEL_22:

    v15 = v75;
    goto LABEL_23;
  }
  v29 = 0;
LABEL_23:

LABEL_24:
  if (v29 == -1)
  {
    v42 = (void *)MEMORY[0x1D17BA0A0]();
    v43 = WeakRetained;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "shortDescription");
      v47 = (HMDResidentDeviceElectionParameters *)objc_claimAutoreleasedReturnValue();
      v48 = *(HMDResidentDeviceElectionParameters **)(a1 + 48);
      v49 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 138544130;
      v82 = v45;
      v83 = 2114;
      v84 = v47;
      v85 = 2112;
      v86 = v48;
      v87 = 2112;
      v88 = v49;
      _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Preferring device: %@ over current primary resident: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v42);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(id *)(a1 + 48));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(id *)(a1 + 64));
  }
  if (v80 > 0x11)
    v50 = CFSTR("unknown reason");
  else
    v50 = off_1E89AEC18[v80];
  v51 = v50;
  objc_msgSend(*(id *)(a1 + 56), "setCriteria:", v51);

LABEL_32:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));

}

- (uint64_t)compareCapabilities:(void *)a3 withCapabilities:
{
  id v5;
  id v6;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  unint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend((id)a1, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (HMFEqualObjects() & 1) == 0)
    {
      if (!v5)
      {
        a1 = -1;
        goto LABEL_5;
      }
      if (!v6)
      {
        a1 = 1;
        goto LABEL_5;
      }
      v21 = v7;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend((id)a1, "devicePreferenceDataSources");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = 0;
        v14 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v9);
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            v13 += objc_msgSend(v16, "supportsDeviceWithCapabilities:", v5);
            v12 += objc_msgSend(v16, "supportsDeviceWithCapabilities:", v6);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        }
        while (v11);
      }
      else
      {
        v12 = 0;
        v13 = 0;
      }

      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = (id)a1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v20;
        v28 = 2048;
        v29 = v13;
        v30 = 2048;
        v31 = v12;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Comparing device preferences: %ld -> %ld", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      if (v13 > v12)
        a1 = 1;
      else
        a1 = -1;
      v7 = v21;
      if (v13 != v12)
        goto LABEL_5;
    }
    a1 = 0;
LABEL_5:

  }
  return a1;
}

void __55__HMDPrimaryElectionLegacyAddOn_confirmPrimaryResident__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Confirmed with error: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (id)_electionParameters
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v1 = a1;
  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "home");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessories");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "copy");

      if (v6)
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      else
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "uuid", (_QWORD)v16);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "UUIDString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

      -[HMDPrimaryElectionLegacyAddOn _electionParameters:](v1, v7);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1 = (id)MEMORY[0x1E0C9AA70];
    }

  }
  return v1;
}

uint64_t __50__HMDPrimaryElectionLegacyAddOn_confirmAsResident__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConfirming:", 0);
}

uint64_t __61__HMDPrimaryElectionLegacyAddOn___handleConfirmationRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a2);
}

- (void)confirmElector:(void *)a3 completionHandler:
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  char v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "queue");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v9);

      objc_msgSend(v5, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isCurrentDevice");

      if ((v11 & 1) != 0)
      {
        objc_msgSend(v8, "primaryResidentDevice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
          objc_msgSend(a1, "context");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v44 = v14;
            objc_msgSend(v14, "capabilities");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v42 = v13;
              v47 = 0u;
              v48 = 0u;
              v45 = 0u;
              v46 = 0u;
              objc_msgSend(a1, "devicePreferenceDataSources");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, buf, 16);
              if (v18)
              {
                v19 = v18;
                v20 = *(_QWORD *)v46;
                while (2)
                {
                  for (i = 0; i != v19; ++i)
                  {
                    if (*(_QWORD *)v46 != v20)
                      objc_enumerationMutation(v17);
                    if ((objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "supportsDeviceWithCapabilities:", v16) & 1) == 0)
                    {

                      v22 = 0;
                      goto LABEL_22;
                    }
                  }
                  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, buf, 16);
                  if (v19)
                    continue;
                  break;
                }
              }

              v22 = 1;
LABEL_22:
              v13 = v42;
            }
            else
            {
              v29 = (void *)MEMORY[0x1D17BA0A0]();
              v30 = a1;
              HMFGetOSLogHandle();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = v29;
                objc_msgSend(v44, "shortDescription");
                *(_DWORD *)buf = 138543618;
                v50 = v41;
                v51 = 2112;
                v52 = objc_claimAutoreleasedReturnValue();
                v32 = (void *)v52;
                _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to confirm device, %@, missing capabilities", buf, 0x16u);

                v29 = v43;
              }

              objc_autoreleasePoolPop(v29);
              v22 = 0;
            }

            v14 = v44;
          }
          else
          {
            v22 = 0;
          }

          v33 = (void *)MEMORY[0x1D17BA0A0]();
          v34 = a1;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
          if ((v22 & 1) != 0)
          {
            if (v36)
            {
              HMFGetLogIdentifier();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "shortDescription");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v50 = v37;
              v51 = 2112;
              v52 = (uint64_t)v38;
              _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Confirmed device: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v33);
            if (!v6)
              goto LABEL_37;
            goto LABEL_36;
          }
          if (v36)
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "shortDescription");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v50 = v39;
            v51 = 2112;
            v52 = (uint64_t)v40;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Confirmation of device, %@, failed, starting full election", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v33);
          v27 = v34;
          v28 = 5;
        }
        else
        {
          v23 = (void *)MEMORY[0x1D17BA0A0]();
          v24 = a1;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v50 = v26;
            _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@No primary resident, starting full election", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v23);
          v27 = v24;
          v28 = 0;
        }
        objc_msgSend(v27, "performElectionWithReason:", v28);
        if (!v6)
        {
LABEL_37:

          goto LABEL_38;
        }
LABEL_36:
        v6[2](v6, 0);
        goto LABEL_37;
      }
      -[HMDPrimaryElectionLegacyAddOn requestConfirmationForElector:completionHandler:](a1, v5, v6);
    }
LABEL_38:

  }
}

- (void)requestConfirmationForElector:(void *)a3 completionHandler:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  HMDRemoteDeviceMessageDestination *v22;
  void *v23;
  HMDRemoteDeviceMessageDestination *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *, void *);
  void *v37;
  id v38;
  id v39;
  const __CFString *v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  v7 = a3;
  if (a1)
  {
    objc_msgSend(a1, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "queue");
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v10);

      if (v5)
        goto LABEL_7;
      objc_msgSend(v9, "primaryResidentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = a1;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v14;
        v44 = 2112;
        v45 = v6;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@No elector provided, using current primary: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      if (v6)
      {
LABEL_7:
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        v16 = a1;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "shortDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v18;
          v44 = 2112;
          v45 = v19;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Requesting confirmation from %@", buf, 0x16u);

        }
        v20 = v5 == 0;

        objc_autoreleasePoolPop(v15);
        objc_msgSend(v6, "device");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = [HMDRemoteDeviceMessageDestination alloc];
        objc_msgSend(v16, "messageTargetUUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v22, "initWithTarget:device:", v23, v21);

        v25 = (void *)MEMORY[0x1E0D285F8];
        v40 = CFSTR("shouldElect");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "messageWithName:destination:payload:", *MEMORY[0x1E0CB8D28], v24, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "setSecureRemote:", 1);
        objc_initWeak((id *)buf, v16);
        v34 = MEMORY[0x1E0C809B0];
        v35 = 3221225472;
        v36 = __81__HMDPrimaryElectionLegacyAddOn_requestConfirmationForElector_completionHandler___block_invoke;
        v37 = &unk_1E89C1B70;
        objc_copyWeak(&v39, (id *)buf);
        v38 = v7;
        objc_msgSend(v28, "setResponseHandler:", &v34);
        objc_msgSend(v9, "messageDispatcher", v34, v35, v36, v37);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sendMessage:completionHandler:", v28, 0);

        objc_destroyWeak(&v39);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        v30 = (void *)MEMORY[0x1D17BA0A0]();
        v31 = v12;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v33;
          _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot confirm, unable to determine primary resident", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v30);
        if (!v7)
        {
          v6 = 0;
          goto LABEL_11;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 91, CFSTR("Cannot confirm."), CFSTR("Unable to determine primary resident"), 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v7 + 2))(v7, v21);
        v6 = 0;
      }

    }
LABEL_11:

  }
}

void __81__HMDPrimaryElectionLegacyAddOn_requestConfirmationForElector_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v12;
    v20 = 2112;
    v21 = v5;
    v13 = "%{public}@Confirmation request failed with error: %@";
    v14 = v11;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v12;
    v13 = "%{public}@Confirmation request succeeded";
    v14 = v11;
    v15 = OS_LOG_TYPE_INFO;
    v16 = 12;
  }
  _os_log_impl(&dword_1CD062000, v14, v15, v13, (uint8_t *)&v18, v16);

LABEL_7:
  objc_autoreleasePoolPop(v8);
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v5);

}

uint64_t __57__HMDPrimaryElectionLegacyAddOn_computePreferredElector___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  int v32;
  void *v33;
  uint64_t v34;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;
  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v8, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (isInternalBuild())
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(v12, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v14, "isEqual:", v15);

    if ((_DWORD)v14)
    {
      v16 = *(uint64_t **)(a1 + 40);
      if (v16)
      {
        v17 = 12;
LABEL_32:
        *v16 = v17;
        goto LABEL_33;
      }
      goto LABEL_33;
    }
    v18 = *(void **)(a1 + 32);
    objc_msgSend(v13, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend(v18, "isEqual:", v19);

    if ((_DWORD)v18)
    {
      v20 = *(uint64_t **)(a1 + 40);
      if (v20)
      {
        v21 = 12;
LABEL_27:
        *v20 = v21;
        goto LABEL_28;
      }
      goto LABEL_28;
    }
  }
  objc_msgSend(v12, "version");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "version");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "compare:", v23);

  if (v24)
  {
    v25 = *(_QWORD **)(a1 + 40);
    if (v25)
      *v25 = 16;
  }
  else
  {
    objc_msgSend(v12, "productInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "productClass");
    objc_msgSend(v13, "productInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "productClass");

    if (v27 != v29)
    {
      objc_msgSend(v12, "productInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "productClass");

      if (v31 == 3)
      {
        v20 = *(uint64_t **)(a1 + 40);
        if (v20)
        {
          v21 = 4;
          goto LABEL_27;
        }
LABEL_28:
        v24 = -1;
        goto LABEL_34;
      }
      objc_msgSend(v13, "productInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "productClass");

      if (v34 == 3)
      {
        v16 = *(uint64_t **)(a1 + 40);
        if (v16)
        {
          v17 = 4;
          goto LABEL_32;
        }
        goto LABEL_33;
      }
    }
    if (objc_msgSend(v12, "isCurrentDevice"))
    {
      v16 = *(uint64_t **)(a1 + 40);
      if (v16)
      {
        v17 = 11;
        goto LABEL_32;
      }
LABEL_33:
      v24 = 1;
      goto LABEL_34;
    }
    v32 = objc_msgSend(v13, "isCurrentDevice");
    v20 = *(uint64_t **)(a1 + 40);
    if (v32)
    {
      if (v20)
      {
        v21 = 11;
        goto LABEL_27;
      }
      goto LABEL_28;
    }
    v24 = 0;
    if (v20)
      *v20 = 0;
  }
LABEL_34:

  return v24;
}

void __58__HMDPrimaryElectionLegacyAddOn_handleBatteryLevelChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  _BOOL8 v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  const char *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Received notification that of battery level change", (uint8_t *)&v18, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "currentResidentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D28670], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "batteryLevel");
    v9 = v8;

    v10 = v9 <= 0.2 && (unint64_t)(v9 > 0.0);
    if (v10 != objc_msgSend(v6, "isLowBattery"))
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if (v14)
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543362;
          v19 = v15;
          v16 = "%{public}@Currently in a low battery state, notifying clients";
LABEL_13:
          _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v18, 0xCu);

        }
      }
      else if (v14)
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v15;
        v16 = "%{public}@No longer in a low battery state, notifying clients";
        goto LABEL_13;
      }

      objc_autoreleasePoolPop(v11);
      objc_msgSend(v6, "setLowBattery:", v10);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "primaryElectionAddOn:didUpdateResidentDevice:", *(_QWORD *)(a1 + 32), v6);

    }
  }

}

void __58__HMDPrimaryElectionLegacyAddOn_handleBatteryStateChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  id v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138543362;
    v41 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Received notification that of battery state change", (uint8_t *)&v40, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "currentResidentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "batteryState");
    objc_msgSend(MEMORY[0x1E0D28670], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "batteryState");

    if (v10 != v8)
    {
      if (v8)
      {
        if (v10 == 1)
        {
          v11 = (void *)MEMORY[0x1D17BA0A0]();
          v12 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = 138543362;
            v41 = v14;
            _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Currently discharging, notifying clients", (uint8_t *)&v40, 0xCu);

          }
          objc_autoreleasePoolPop(v11);
          -[HMDPrimaryElectionLegacyAddOn _updateDischargingTimer:](*(void **)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "atHomeLevel"));
          goto LABEL_29;
        }
        if (v8 == 1)
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          v16 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = 138543362;
            v41 = v18;
            _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Currently charging, notifying clients", (uint8_t *)&v40, 0xCu);

          }
          objc_autoreleasePoolPop(v15);
          v19 = *(void **)(a1 + 32);
          if (!v19)
            goto LABEL_29;
          objc_msgSend(*(id *)(a1 + 32), "context");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (!v20)
            goto LABEL_28;
          objc_msgSend(v20, "queue");
          v22 = objc_claimAutoreleasedReturnValue();
          dispatch_assert_queue_V2(v22);

          if (isAppleTV())
          {
            v23 = MEMORY[0x1D17BA0A0]();
            v24 = v19;
            HMFGetOSLogHandle();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = 138543362;
              v41 = v26;
              _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@We should only be pinging the resident on transient resident capable devices which are enabled", (uint8_t *)&v40, 0xCu);

            }
            v27 = (void *)v23;
          }
          else
          {
            v28 = objc_msgSend(v21, "isResidentSupported");
            v29 = (void *)MEMORY[0x1D17BA0A0]();
            v30 = v19;
            HMFGetOSLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
            if ((v28 & 1) != 0)
            {
              if (v32)
              {
                HMFGetLogIdentifier();
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = 138543362;
                v41 = v33;
                _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Updating monitor timer since we are charging", (uint8_t *)&v40, 0xCu);

              }
              objc_autoreleasePoolPop(v29);
              v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 5, 60.0);
              objc_msgSend(v30, "setResidentMonitorTimer:", v34);

              objc_msgSend(v30, "residentMonitorTimer");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setDelegate:", v30);

              objc_msgSend(v21, "queue");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "residentMonitorTimer");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setDelegateQueue:", v36);

              -[HMDPrimaryElectionLegacyAddOn _startMonitoringResident](v30);
              goto LABEL_28;
            }
            if (v32)
            {
              HMFGetLogIdentifier();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = 138543362;
              v41 = v38;
              _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@We shouldn't ping if resident is not supported.", (uint8_t *)&v40, 0xCu);

            }
            v27 = v29;
          }
          objc_autoreleasePoolPop(v27);
LABEL_28:

LABEL_29:
          objc_msgSend(v7, "setBatteryState:", v10);
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "primaryElectionAddOn:didUpdateResidentDevice:", *(_QWORD *)(a1 + 32), v7);

          goto LABEL_30;
        }
      }
      objc_msgSend(v7, "setBatteryState:", v10);
    }
  }
LABEL_30:

}

void __46__HMDPrimaryElectionLegacyAddOn_timerDidFire___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Ping failed for resident: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
  }
}

+ (int64_t)compareElectionVersions:(id)a3 otherVersion:(id)a4
{
  id v5;
  id v6;
  HMDHomeKitVersion *v7;
  int64_t v8;

  v5 = a3;
  v6 = a4;
  v7 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("5.1"));
  if ((objc_msgSend(v5, "isEqualToVersion:", v6) & 1) == 0
    && (!objc_msgSend(v5, "isAtLeastVersion:", v7) || (objc_msgSend(v6, "isAtLeastVersion:", v7) & 1) == 0))
  {
    if ((objc_msgSend(v5, "isAtLeastVersion:", v7) & 1) != 0)
      goto LABEL_22;
    if ((objc_msgSend(v6, "isAtLeastVersion:", v7) & 1) != 0)
      goto LABEL_24;
  }

  v7 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("4.0"));
  if ((objc_msgSend(v5, "isEqualToVersion:", v6) & 1) == 0
    && (!objc_msgSend(v5, "isAtLeastVersion:", v7) || (objc_msgSend(v6, "isAtLeastVersion:", v7) & 1) == 0))
  {
    if ((objc_msgSend(v5, "isAtLeastVersion:", v7) & 1) != 0)
      goto LABEL_22;
    if ((objc_msgSend(v6, "isAtLeastVersion:", v7) & 1) != 0)
      goto LABEL_24;
  }

  v7 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("3.2"));
  if ((objc_msgSend(v5, "isEqualToVersion:", v6) & 1) != 0
    || objc_msgSend(v5, "isAtLeastVersion:", v7) && (objc_msgSend(v6, "isAtLeastVersion:", v7) & 1) != 0)
  {
    goto LABEL_12;
  }
  if ((objc_msgSend(v5, "isAtLeastVersion:", v7) & 1) != 0)
  {
LABEL_22:
    v8 = 1;
    goto LABEL_25;
  }
  if ((objc_msgSend(v6, "isAtLeastVersion:", v7) & 1) != 0)
    goto LABEL_24;
LABEL_12:

  v7 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("3.1"));
  if ((objc_msgSend(v5, "isEqualToVersion:", v6) & 1) == 0
    && (!objc_msgSend(v5, "isAtLeastVersion:", v7) || (objc_msgSend(v6, "isAtLeastVersion:", v7) & 1) == 0))
  {
    if ((objc_msgSend(v5, "isAtLeastVersion:", v7) & 1) != 0)
      goto LABEL_22;
    if ((objc_msgSend(v6, "isAtLeastVersion:", v7) & 1) != 0)
    {
LABEL_24:
      v8 = -1;
      goto LABEL_25;
    }
  }
  v8 = 0;
LABEL_25:

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t87 != -1)
    dispatch_once(&logCategory__hmf_once_t87, &__block_literal_global_114094);
  return (id)logCategory__hmf_once_v88;
}

void __44__HMDPrimaryElectionLegacyAddOn_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v88;
  logCategory__hmf_once_v88 = v0;

}

@end
