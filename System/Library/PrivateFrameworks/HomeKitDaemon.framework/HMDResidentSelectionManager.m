@implementation HMDResidentSelectionManager

- (HMDResidentSelectionManager)initWithContext:(id)a3
{
  id v4;
  HMDResidentSelectionManagerDefaultDataSource *v5;
  HMDResidentSelectionManager *v6;

  v4 = a3;
  v5 = objc_alloc_init(HMDResidentSelectionManagerDefaultDataSource);
  v6 = -[HMDResidentSelectionManager initWithContext:dataSource:](self, "initWithContext:dataSource:", v4, v5);

  return v6;
}

- (HMDResidentSelectionManager)initWithContext:(id)a3 dataSource:(id)a4
{
  HMDResidentSelectionManagerDataSource *v6;
  id v7;
  HMDResidentSelectionManager *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  HMDResidentSelectionManagerDataSource *dataSource;
  HMDResidentSelectionManagerDataSource *v12;
  HMDResidentSelectionMode *currentResidentSelectionMode;
  HMDResidentSelectionInfo *residentSelectionInfoFromWorkingStore;
  objc_super v16;

  v6 = (HMDResidentSelectionManagerDataSource *)a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDResidentSelectionManager;
  v7 = a3;
  v8 = -[HMDResidentSelectionManager init](&v16, sel_init);
  objc_storeWeak((id *)&v8->_context, v7);
  objc_msgSend(v7, "queue", v16.receiver, v16.super_class);
  v9 = objc_claimAutoreleasedReturnValue();

  queue = v8->_queue;
  v8->_queue = (OS_dispatch_queue *)v9;

  dataSource = v8->_dataSource;
  v8->_dataSource = v6;
  v12 = v6;

  currentResidentSelectionMode = v8->_currentResidentSelectionMode;
  v8->_currentResidentSelectionMode = 0;

  v8->_currentModeType = 0;
  residentSelectionInfoFromWorkingStore = v8->_residentSelectionInfoFromWorkingStore;
  v8->_residentSelectionInfoFromWorkingStore = 0;

  return v8;
}

- (HMDPreferredResidentsList)localPreferredResidentsList
{
  void *v2;
  void *v3;

  -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localPreferredResidentsList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDPreferredResidentsList *)v3;
}

- (void)start
{
  void *v3;
  HMDResidentSelectionManager *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDResidentSelectionManager _registerForMessages](v4, "_registerForMessages");
  -[HMDResidentSelectionManager evaluateSelectionMode](v4, "evaluateSelectionMode");
}

- (void)stop
{
  void *v3;
  void *v4;
  id v5;

  -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[HMDResidentSelectionManager context](self, "context");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterReceiver:", self);

}

- (void)currentDeviceReadyAsAResident
{
  void *v3;
  HMDResidentSelectionManager *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDResidentSelectionManager currentModeType](v4, "currentModeType");
    if ((unint64_t)(v7 - 1) > 2)
      v8 = CFSTR("unknown");
    else
      v8 = off_24E793DC0[v7 - 1];
    v9 = v8;
    v11 = 138543618;
    v12 = v6;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Notified that current device is ready as a resident. Current Mode: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDResidentSelectionManager evaluateSelectionMode](v4, "evaluateSelectionMode");
  -[HMDResidentSelectionManager currentResidentSelectionMode](v4, "currentResidentSelectionMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentDeviceReadyAsAResident");

}

- (void)didRemoveResidentsFromHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDResidentSelectionManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDResidentSelectionManager *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentSelectionManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryResidentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v10;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Residents: %@ are removed from the home.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (!-[HMDResidentSelectionManager weAreInResidentSelection](v8, "weAreInResidentSelection")
    && objc_msgSend(v6, "isCurrentDevice"))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v8;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Evaluating if we are ready to switch to Resident Selection after the removal.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __58__HMDResidentSelectionManager_didRemoveResidentsFromHome___block_invoke;
    v15[3] = &unk_24E79B300;
    v15[4] = v12;
    -[HMDResidentSelectionManager _triggerAutoModeEvaluationWithCompletion:](v12, "_triggerAutoModeEvaluationWithCompletion:", v15);
  }

}

- (void)didUpdateResidentSelectionVersion
{
  void *v3;
  HMDResidentSelectionManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentSelectionManager context](v4, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 1024;
    v11 = objc_msgSend(v7, "homeSupportsResidentSelection");
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Home's resident selection version updated. Home supports Resident Selection: %d.", (uint8_t *)&v8, 0x12u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDResidentSelectionManager evaluateSelectionMode](v4, "evaluateSelectionMode");
}

- (void)didUpdateResidentStatus:(id)a3 residentsFound:(id)a4 residentsLost:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didUpdateResidentStatus:residentsFound:residentsLost:", v10, v9, v8);

}

- (void)performSelectionInMode:(unint64_t)a3 preferredPrimaryResident:(id)a4 requireAutoUpdate:(BOOL)a5 reason:(unint64_t)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  int v16;
  void *v17;
  HMDResidentSelectionManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDResidentSelectionManager *v22;
  NSObject *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v9 = a5;
  v34 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a7;
  v14 = a3 - 1;
  if (a3 == 1
    && (-[HMDResidentSelectionManager context](self, "context"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "homeSupportsResidentSelection"),
        v15,
        v16))
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform a Coordination Election after the home has switched to Resident Selection.", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 > 2)
        v25 = CFSTR("unknown");
      else
        v25 = off_24E793DC0[v14];
      v26 = v25;
      v28 = 138543874;
      v29 = v24;
      v30 = 2112;
      v31 = v26;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Starting a selection in mode: %@ with preferred primary: %@.", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    -[HMDResidentSelectionManager makeSureCurrentModeIsOfType:](v22, "makeSureCurrentModeIsOfType:", a3);
    -[HMDResidentSelectionManager currentResidentSelectionMode](v22, "currentResidentSelectionMode");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "performSelectionWithPreferredPrimaryResident:requireAutoUpdate:reason:completion:", v12, v9, a6, v13);

  }
}

- (void)primaryResidentChanged:(id)a3 previousResidentDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDResidentSelectionManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isCurrentDevice")
    && !-[HMDResidentSelectionManager weAreInResidentSelection](self, "weAreInResidentSelection"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@We are the new primary and the home is in REv2. Scheduling an Auto mode evaluation.", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDResidentSelectionManager _scheduleAutoModeEvaluationWithRetryNeeded:](v9, "_scheduleAutoModeEvaluationWithRetryNeeded:", 1);
  }
  else if ((objc_msgSend(v6, "isCurrentDevice") & 1) == 0)
  {
    -[HMDResidentSelectionManager _removeScheduledAutoModeEvaluation](self, "_removeScheduledAutoModeEvaluation");
  }
  -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryResidentChanged:previousResidentDevice:", v6, v7);

}

- (id)dumpState
{
  void *v2;
  void *v3;

  -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dumpState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)locallyReachableResidents
{
  void *v2;
  void *v3;

  -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locallyReachableResidents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)residentIsLocallyReachable:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "residentIsLocallyReachable:", v4);

  return v6;
}

- (id)residentsNotPresentInPreferredResidentsList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentIDSIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "residentsNotPresentInPreferredResidentsList:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3 selectionTimestamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDResidentSelectionManager *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "allowExternalUpdateOfPrimaryResidentTo:selectionTimestamp:", v6, v7);

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HMDResidentSelectionManager currentModeType](v12, "currentModeType");
      if ((unint64_t)(v15 - 1) > 2)
        v16 = CFSTR("unknown");
      else
        v16 = off_24E793DC0[v15 - 1];
      v17 = v16;
      v19 = 138543874;
      v20 = v14;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Allowing external update of primary resident to: %@ in mode: %@.", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 1;
  }

  return v10;
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDResidentSelectionManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRoles:", objc_msgSend(v6, "roles") | 4);
  v7 = (void *)objc_msgSend(v6, "copy");
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v5, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("residentSelection.preferred"), self, v9, sel_handleSelectedAsPreferredMessage_);

}

- (id)notificationCenter
{
  void *v2;
  void *v3;

  -[HMDResidentSelectionManager dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)preferredResidentEvaluationDelay
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HMDResidentSelectionManager idsServerBag](self, "idsServerBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentSelectionPreferredResidentEvaluationDelay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 3600.0;
  }

  return v5;
}

- (void)evaluateSelectionMode
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  int v9;
  void *v10;
  HMDResidentSelectionManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDResidentSelectionManager weAreTheOnlyActingResident](self, "weAreTheOnlyActingResident")
    && !-[HMDResidentSelectionManager weAreInResidentSelection](self, "weAreInResidentSelection"))
  {
    v6 = 3;
  }
  else if (objc_msgSend(v3, "homeSupportsResidentSelection"))
  {
    -[HMDResidentSelectionManager residentSelectionInfoFromWorkingStore](self, "residentSelectionInfoFromWorkingStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "currentModeType");

    if (v5 == 2)
      v6 = 2;
    else
      v6 = 3;
  }
  else
  {
    v6 = 1;
  }
  objc_msgSend(v3, "residentSelectionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "currentModeType") == 3 || objc_msgSend(v7, "currentModeType") == 2;
  v9 = objc_msgSend(v3, "homeSupportsResidentSelection");
  if (!-[HMDResidentSelectionManager weAreTheOnlyActingResident](self, "weAreTheOnlyActingResident")
    || (v9 & v8 & 1) != 0)
  {
    -[HMDResidentSelectionManager makeSureCurrentModeIsOfType:](self, "makeSureCurrentModeIsOfType:", v6);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@We are the only resident in the home and we are not in RS. Starting an Auto mode evaluation. Resident Selection info from the working store: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52__HMDResidentSelectionManager_evaluateSelectionMode__block_invoke;
    v14[3] = &unk_24E79B300;
    v14[4] = v11;
    -[HMDResidentSelectionManager _triggerAutoModeEvaluationWithCompletion:](v11, "_triggerAutoModeEvaluationWithCompletion:", v14);
  }

}

- (BOOL)weAreInResidentSelection
{
  return -[HMDResidentSelectionManager currentModeType](self, "currentModeType") == 2
      || -[HMDResidentSelectionManager currentModeType](self, "currentModeType") == 3;
}

- (BOOL)weAreTheOnlyActingResident
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;

  -[HMDResidentSelectionManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentStatusChannel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isConnected");

  if (v4)
  {
    objc_msgSend(v2, "currentResidentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "residentsPresentOnStatusKit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v2, "residentsPresentOnStatusKit");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count") == 1)
      {
        objc_msgSend(v2, "residentsPresentOnStatusKit");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v7);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 1;
  }
  if (objc_msgSend(v2, "isCurrentDeviceAvailableResident"))
  {
    objc_msgSend(v2, "availableResidentDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count") == 1)
      v14 = objc_msgSend(v2, "isActingAsResident");
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v12 & v14;
}

- (void)makeSureCurrentModeIsOfType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDResidentSelectionManager *v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentModeType");

  if (v6 != a3)
  {
    -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "currentModeType");

    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(v8 - 1) > 2)
        v13 = CFSTR("unknown");
      else
        v13 = off_24E793DC0[v8 - 1];
      v14 = v13;
      if (a3 - 1 > 2)
        v15 = CFSTR("unknown");
      else
        v15 = off_24E793DC0[a3 - 1];
      v16 = v15;
      v21 = 138543874;
      v22 = v12;
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Switching from %@ to %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDResidentSelectionManager currentResidentSelectionMode](v10, "currentResidentSelectionMode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stop");

    -[HMDResidentSelectionManager createResidentSelectionModeWithType:](v10, "createResidentSelectionModeWithType:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentSelectionManager setCurrentResidentSelectionMode:](v10, "setCurrentResidentSelectionMode:", v18);

    -[HMDResidentSelectionManager currentResidentSelectionMode](v10, "currentResidentSelectionMode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", v10);

    -[HMDResidentSelectionManager setCurrentModeType:](v10, "setCurrentModeType:", a3);
    -[HMDResidentSelectionManager currentResidentSelectionMode](v10, "currentResidentSelectionMode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "start");

    -[HMDResidentSelectionManager _handleModeChangeWithPreviousMode:](v10, "_handleModeChangeWithPreviousMode:", v8);
  }
}

- (void)_handleModeChangeWithPreviousMode:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  HMDResidentSelectionManager *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActingAsResident");

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 - 1 > 2)
        v11 = CFSTR("unknown");
      else
        v11 = off_24E793DC0[a3 - 1];
      v12 = v11;
      v13 = -[HMDResidentSelectionManager currentModeType](v8, "currentModeType");
      if ((unint64_t)(v13 - 1) > 2)
        v14 = CFSTR("unknown");
      else
        v14 = off_24E793DC0[v13 - 1];
      v15 = v14;
      v17 = 138543874;
      v18 = v10;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@We just switched from %@ to %@.", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDResidentSelectionManager currentResidentSelectionMode](v8, "currentResidentSelectionMode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configureAsAResidentWithRunPrimaryEvaluation:", 0);

  }
}

- (id)createResidentSelectionModeWithType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[HMDResidentSelectionManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createResidentSelectionModeWithType:context:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_triggerAutoModeEvaluationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (-[HMDResidentSelectionManager devicesInHomeSupportResidentSelection](self, "devicesInHomeSupportResidentSelection")|| (-[HMDResidentSelectionManager context](self, "context"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "homeSupportsResidentSelection"), v5, (v6 & 1) != 0))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __72__HMDResidentSelectionManager__triggerAutoModeEvaluationWithCompletion___block_invoke;
    v8[3] = &unk_24E787600;
    v9 = v4;
    -[HMDResidentSelectionManager performSelectionInMode:preferredPrimaryResident:requireAutoUpdate:reason:completion:](self, "performSelectionInMode:preferredPrimaryResident:requireAutoUpdate:reason:completion:", 3, 0, 0, 7, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);

  }
}

- (void)_scheduleAutoModeEvaluationWithRetryNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  HMDResidentSelectionManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionManager backgroundScheduler](self, "backgroundScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HMDResidentSelectionManager dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "autoModeEvaluationScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentSelectionManager setBackgroundScheduler:](self, "setBackgroundScheduler:", v7);

    -[HMDResidentSelectionManager backgroundScheduler](self, "backgroundScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setQualityOfService:", 17);

    -[HMDResidentSelectionManager preferredResidentEvaluationDelay](self, "preferredResidentEvaluationDelay");
    v10 = v9;
    -[HMDResidentSelectionManager backgroundScheduler](self, "backgroundScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInterval:", v10);

    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      v22 = 2048;
      v23 = v10;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling auto mode evaluation in %f", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    if (v3)
    {
      -[HMDResidentSelectionManager backgroundScheduler](v13, "backgroundScheduler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setRepeats:", 1);

    }
    objc_initWeak((id *)buf, v13);
    -[HMDResidentSelectionManager backgroundScheduler](v13, "backgroundScheduler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __74__HMDResidentSelectionManager__scheduleAutoModeEvaluationWithRetryNeeded___block_invoke;
    v18[3] = &unk_24E787628;
    objc_copyWeak(&v19, (id *)buf);
    objc_msgSend(v17, "scheduleWithBlock:", v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_removeScheduledAutoModeEvaluation
{
  void *v3;

  -[HMDResidentSelectionManager backgroundScheduler](self, "backgroundScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[HMDResidentSelectionManager setBackgroundScheduler:](self, "setBackgroundScheduler:", 0);
}

- (BOOL)devicesInHomeSupportResidentSelection
{
  void *v3;
  HMDResidentSelectionManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMDResidentSelectionManager *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  HMDResidentSelectionManager *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  HMDResidentSelectionManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDResidentSelectionManager *v31;
  NSObject *v32;
  void *v33;
  BOOL v34;
  uint64_t v35;
  HMDResidentSelectionManager *v36;
  void *v37;
  HMDResidentSelectionManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  char v45;
  void *v47;
  HMDResidentSelectionManager *v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v55 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Evaluating if devices in home are ready to support Resident Selection", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDResidentSelectionManager context](v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "availableResidentDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v47 = v7;
    -[HMDResidentSelectionManager minimumHomeKitVersionForResidentSelection](v4, "minimumHomeKitVersionForResidentSelection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v4;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v14;
      v56 = 2112;
      v57 = (uint64_t)v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Minimum version for support evaluation is %@", buf, 0x16u);

    }
    v48 = v12;

    objc_autoreleasePoolPop(v11);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v47, "availableResidentDevices");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v51;
      v19 = v48;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v21, "device");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "version");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isAtLeastVersion:", v10);

          if (v24)
          {
            ++v17;
          }
          else
          {
            v25 = (void *)MEMORY[0x227676638]();
            v26 = v19;
            HMFGetOSLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v28 = v10;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v55 = v29;
              v56 = 2112;
              v57 = (uint64_t)v21;
              _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Cannot support Resident Selection because resident: %@ has too low a version", buf, 0x16u);

              v10 = v28;
              v19 = v48;
            }

            objc_autoreleasePoolPop(v25);
          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      }
      while (v16);
    }
    else
    {
      v17 = 0;
      v19 = v12;
    }

    v35 = MEMORY[0x227676638]();
    v36 = v19;
    v37 = (void *)v35;
    v38 = v36;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "availableResidentDevices");
      v41 = v10;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");
      *(_DWORD *)buf = 138543874;
      v55 = v40;
      v56 = 2048;
      v57 = v17;
      v58 = 2048;
      v59 = v43;
      _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@%ld of %lu residents are eligible to support Resident Selection", buf, 0x20u);

      v10 = v41;
    }

    objc_autoreleasePoolPop(v37);
    v7 = v47;
    objc_msgSend(v47, "availableResidentDevices");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == objc_msgSend(v44, "count"))
    {
      v34 = 1;
    }
    else
    {
      v45 = isInternalBuild();
      if (v17 > 1)
        v34 = v45;
      else
        v34 = 0;
    }

  }
  else
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = v4;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v33;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Cannot support resident selection in a home that has no residents", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v30);
    v34 = 0;
  }

  return v34;
}

- (id)_idsIdentifierForResidentDeviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[HMDResidentSelectionManager context](self, "context", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "availableResidentDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", v4);

          if ((v12 & 1) != 0)
          {
            objc_msgSend(v10, "device");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "idsIdentifier");
            v7 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
        }
        v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)handleSelectedAsPreferredMessage:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[HMDResidentSelectionManager _processSelectedAsPreferredMessage:](self, "_processSelectedAsPreferredMessage:", v5);

}

- (void)_processSelectedAsPreferredMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDResidentSelectionManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDResidentSelectionManager *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_numberForKey:", CFSTR("primary.selection.mode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "remoteSourceDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received preferred primary selection message from: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDResidentSelectionManager makeSureCurrentModeIsOfType:](v9, "makeSureCurrentModeIsOfType:", v7);
    -[HMDResidentSelectionManager currentResidentSelectionMode](v9, "currentResidentSelectionMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didReceiveSelectionMessage:", v4);
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v17;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Selection message did not contain any mode: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }

}

- (id)residentWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMDResidentSelectionManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableResidentDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__HMDResidentSelectionManager_residentWithIdentifier___block_invoke;
  v10[3] = &unk_24E7953A8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didUpdateResidentSelectionModelTo:(id)a3
{
  id v4;
  void *v5;
  HMDResidentSelectionManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  HMDResidentSelectionManager *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Resident Selection info in the working store updated to: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDResidentSelectionManager setResidentSelectionInfoFromWorkingStore:](v6, "setResidentSelectionInfoFromWorkingStore:", v4);
  -[HMDResidentSelectionManager context](v6, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "homeSupportsResidentSelection");

  if ((v10 & 1) != 0)
  {
    -[HMDResidentSelectionManager evaluateSelectionMode](v6, "evaluateSelectionMode");
    -[HMDResidentSelectionManager currentResidentSelectionMode](v6, "currentResidentSelectionMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didUpdateResidentSelectionModelTo:", v4);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Ignoring the Resident Selection model update since the home does not support Resident Selection.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (unint64_t)primaryChangedReason
{
  void *v2;
  unint64_t v3;

  -[HMDResidentSelectionManager currentResidentSelectionMode](self, "currentResidentSelectionMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "primaryChangedReason");

  return v3;
}

- (void)primarySelectionMode:(id)a3 didSelectPrimaryResident:(id)a4 selectionInfo:(id)a5 selectionLogEvent:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  HMDResidentSelectionManager *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDResidentSelectionManager delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "residentSelectionManager:didSelectPrimaryResident:selectionInfo:electionLogEvent:completion:", self, v13, v14, v15, v16);

  if (objc_msgSend(v12, "currentModeType") == 1)
  {
    -[HMDResidentSelectionManager context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentResidentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v13, "isEqual:", v19);

    if (v20)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v24;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@We are the Coordination elected resident. Scheduling an evaluation.", (uint8_t *)&v25, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      -[HMDResidentSelectionManager _scheduleAutoModeEvaluationWithRetryNeeded:](v22, "_scheduleAutoModeEvaluationWithRetryNeeded:", 1);
    }
  }

}

- (void)primarySelectionMode:(id)a3 didFailToSelectWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HMDResidentSelectionManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "residentSelectionManager:didFailToSelectWithError:", self, v5);

}

- (void)primarySelectionMode:(id)a3 didUpdateActiveNodes:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HMDResidentSelectionManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "residentSelectionManager:didUpdateActiveNodes:", self, v5);

}

- (void)primarySelectionMode:(id)a3 didUpdateResidentDevice:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HMDResidentSelectionManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "residentSelectionManager:didUpdateResidentDevice:", self, v5);

}

- (void)primarySelectionMode:(id)a3 reassertAsCurrentPrimaryWithSelectionTimestamp:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HMDResidentSelectionManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "residentSelectionManager:reassertAsTheCurrentPrimaryWithSelectionTimestamp:", self, v5);

}

- (void)primarySelectionModeReadyAsResident:(id)a3
{
  id v4;

  -[HMDResidentSelectionManager delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentSelectionManagerReadyAsResident:", self);

}

- (void)primarySelectionMode:(id)a3 didReceivePrimaryResidentIdsIdentifier:(id)a4 selectionTimestamp:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[HMDResidentSelectionManager delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "residentSelectionManager:didReceivePrimaryResidentIdsIdentifier:selectionTimestamp:", self, v8, v7);

}

- (void)primarySelectionMode:(id)a3 didUpdateResidentSelectionInfo:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[HMDResidentSelectionManager delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "residentSelectionManager:didUpdateResidentSelectionInfo:completion:", self, v8, v7);

}

- (void)primarySelectionMode:(id)a3 didUpdatePreferredResidentsList:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HMDResidentSelectionManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "residentSelectionManager:didUpdatePreferredResidentsList:", self, v5);

}

- (id)minimumHomeKitVersionForResidentSelection
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HMDResidentSelectionManager idsServerBag](self, "idsServerBag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentSelectionMinHomeKitVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[HMDResidentSelectionManager dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minimumHomeKitVersionForResidentSelection");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (HMDIDSServerBag)idsServerBag
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDResidentSelectionManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionManager context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsServerBagForHome:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDIDSServerBag *)v6;
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDResidentSelectionManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v4;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (unint64_t)messageTransportRestriction
{
  return -1;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDResidentSelectionManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDResidentSelectionManager messageTargetUUID](self, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDResidentSelectionManagerDelegate)delegate
{
  return (HMDResidentSelectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDResidentSelectionMode)currentResidentSelectionMode
{
  return (HMDResidentSelectionMode *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentResidentSelectionMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)currentModeType
{
  return self->_currentModeType;
}

- (void)setCurrentModeType:(unint64_t)a3
{
  self->_currentModeType = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (HMDResidentSelectionManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (HMDResidentDeviceManagerContext)context
{
  return (HMDResidentDeviceManagerContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (HMDResidentSelectionInfo)residentSelectionInfoFromWorkingStore
{
  return (HMDResidentSelectionInfo *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResidentSelectionInfoFromWorkingStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSBackgroundActivityScheduler)backgroundScheduler
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBackgroundScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundScheduler, 0);
  objc_storeStrong((id *)&self->_residentSelectionInfoFromWorkingStore, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentResidentSelectionMode, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __54__HMDResidentSelectionManager_residentWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));
  return v7;
}

void __74__HMDResidentSelectionManager__scheduleAutoModeEvaluationWithRetryNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __74__HMDResidentSelectionManager__scheduleAutoModeEvaluationWithRetryNeeded___block_invoke_76;
    v10[3] = &unk_24E79C2B8;
    v10[4] = v5;
    v11 = v3;
    dispatch_async(v6, v10);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Resident Selection Manager instance is gone", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }

}

void __74__HMDResidentSelectionManager__scheduleAutoModeEvaluationWithRetryNeeded___block_invoke_76(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Kicking off an evaluation in Auto mode", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__HMDResidentSelectionManager__scheduleAutoModeEvaluationWithRetryNeeded___block_invoke_77;
  v7[3] = &unk_24E79B3C8;
  v6 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v6;
  objc_msgSend(v8, "_triggerAutoModeEvaluationWithCompletion:", v7);

}

void __74__HMDResidentSelectionManager__scheduleAutoModeEvaluationWithRetryNeeded___block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(*(id *)(a1 + 32), "weAreInResidentSelection"))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Auto mode evaluation failed. Will try again in sometime.", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Auto mode evaluation is complete", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_removeScheduledAutoModeEvaluation");
  }

}

uint64_t __72__HMDResidentSelectionManager__triggerAutoModeEvaluationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__HMDResidentSelectionManager_evaluateSelectionMode__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Auto mode evaluation to switch to RS while we were the only resident in the home failed.", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __58__HMDResidentSelectionManager_didRemoveResidentsFromHome___block_invoke(uint64_t a1, void *a2, void *a3)
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Attempt to switch to RS triggered by the removal of a resident failed with error: %@.", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t32_132738 != -1)
    dispatch_once(&logCategory__hmf_once_t32_132738, &__block_literal_global_132739);
  return (id)logCategory__hmf_once_v33_132740;
}

void __42__HMDResidentSelectionManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v33_132740;
  logCategory__hmf_once_v33_132740 = v0;

}

@end
