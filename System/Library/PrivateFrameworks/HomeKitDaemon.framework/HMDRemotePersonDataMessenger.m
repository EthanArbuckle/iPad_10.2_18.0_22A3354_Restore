@implementation HMDRemotePersonDataMessenger

- (HMDRemotePersonDataMessenger)initWithUUID:(id)a3 home:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDRemotePersonDataMessenger *v12;
  uint64_t v13;
  NSUUID *UUID;
  id notifyResidentsOfUpdatedDataDebounceTimerFactory;
  HMDRemotePersonDataMessenger *result;
  HMDRemotePersonDataMessenger *v17;
  SEL v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v17 = (HMDRemotePersonDataMessenger *)_HMFPreconditionFailure();
    -[HMDRemotePersonDataMessenger _startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData](v17, v18);
    return result;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDRemotePersonDataMessenger;
  v12 = -[HMDRemotePersonDataMessenger init](&v19, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v13;

    objc_storeWeak((id *)&v12->_home, v9);
    objc_storeStrong((id *)&v12->_workQueue, a5);
    notifyResidentsOfUpdatedDataDebounceTimerFactory = v12->_notifyResidentsOfUpdatedDataDebounceTimerFactory;
    v12->_notifyResidentsOfUpdatedDataDebounceTimerFactory = &__block_literal_global_238113;

  }
  return v12;
}

- (void)_startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDRemotePersonDataMessenger *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, double);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDRemotePersonDataMessenger notifyResidentsOfUpdatedDataDebounceTimer](self, "notifyResidentsOfUpdatedDataDebounceTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting timer to notify resident devices of updated face-classification-dependent data", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDRemotePersonDataMessenger notifyResidentsOfUpdatedDataDebounceTimerFactory](v6, "notifyResidentsOfUpdatedDataDebounceTimerFactory");
    v9 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, 10.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemotePersonDataMessenger setNotifyResidentsOfUpdatedDataDebounceTimer:](v6, "setNotifyResidentsOfUpdatedDataDebounceTimer:", v10);

    -[HMDRemotePersonDataMessenger notifyResidentsOfUpdatedDataDebounceTimer](v6, "notifyResidentsOfUpdatedDataDebounceTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v6);

    -[HMDRemotePersonDataMessenger workQueue](v6, "workQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemotePersonDataMessenger notifyResidentsOfUpdatedDataDebounceTimer](v6, "notifyResidentsOfUpdatedDataDebounceTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegateQueue:", v12);

    -[HMDRemotePersonDataMessenger notifyResidentsOfUpdatedDataDebounceTimer](v6, "notifyResidentsOfUpdatedDataDebounceTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

  }
}

- (void)_notifyResidentsOfUpdatedFaceClassificationDependentData
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDRemoteAccountMessageDestination *v10;
  void *v11;
  HMDRemoteAccountMessageDestination *v12;
  HMDRemoteMessage *v13;
  void *v14;
  HMDRemotePersonDataMessenger *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDRemotePersonDataMessenger *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDRemotePersonDataMessenger *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDRemotePersonDataMessenger *v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDRemotePersonDataMessenger home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "owner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "handles");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = [HMDRemoteAccountMessageDestination alloc];
        -[HMDRemotePersonDataMessenger messageTargetUUID](self, "messageTargetUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:](v10, "initWithTarget:handle:multicast:", v11, v9, 1);

        -[HMDRemoteAccountMessageDestination setRestrictToResidentCapable:](v12, "setRestrictToResidentCapable:", 1);
        v13 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDRemotePersonDataMessengerPerformCloudPullMessage"), v12, 0, 3, 1, 0.0);
        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMFObject shortDescription](v13, "shortDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138543618;
          v33 = v17;
          v34 = 2112;
          v35 = v18;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending message to notify resident devices of updated face-classification-dependent data: %@", (uint8_t *)&v32, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v5, "msgDispatcher");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sendMessage:", v13);

      }
      else
      {
        v28 = (void *)MEMORY[0x227676638]();
        v29 = self;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138543362;
          v33 = v31;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@No account handles found on owner account when notifying resident devices of updated face-classification-dependent data", (uint8_t *)&v32, 0xCu);

        }
        objc_autoreleasePoolPop(v28);
      }

    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543362;
        v33 = v27;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Owner account was nil when notifying resident devices of updated face-classification-dependent data", (uint8_t *)&v32, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference was nil when notifying resident devices of updated face-classification-dependent data", (uint8_t *)&v32, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (void)handlePerformCloudPullMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDRemotePersonDataMessenger *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling perform cloud pull message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDRemotePersonDataMessenger dataSource](v7, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performCloudPull");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__HMDRemotePersonDataMessenger_handlePerformCloudPullMessage___block_invoke;
  v14[3] = &unk_24E798920;
  v15 = v4;
  v12 = v4;
  v13 = (id)objc_msgSend(v11, "addCompletionBlock:", v14);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDRemotePersonDataMessenger messageTargetUUID](self, "messageTargetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDRemotePersonDataMessenger notifyResidentsOfUpdatedDataDebounceTimer](self, "notifyResidentsOfUpdatedDataDebounceTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDRemotePersonDataMessenger setNotifyResidentsOfUpdatedDataDebounceTimer:](self, "setNotifyResidentsOfUpdatedDataDebounceTimer:", 0);
    -[HMDRemotePersonDataMessenger _notifyResidentsOfUpdatedFaceClassificationDependentData](self, "_notifyResidentsOfUpdatedFaceClassificationDependentData");
  }
}

- (void)configureWithDataSource:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!v6)
    _HMFPreconditionFailure();
  -[HMDRemotePersonDataMessenger setDataSource:](self, "setDataSource:", v6);
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRoles:", objc_msgSend(v10, "roles") | 4);
  objc_msgSend(v7, "msgDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerForMessage:receiver:policies:selector:", CFSTR("HMDRemotePersonDataMessengerPerformCloudPullMessage"), self, v12, sel_handlePerformCloudPullMessage_);

}

- (void)handleUpdatedPerson:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v5 = a4;
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x24BE6B628];
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "schedulerWithDispatchQueue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reschedule:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__HMDRemotePersonDataMessenger_handleUpdatedPerson_mirrorOutputFuture___block_invoke;
  v12[3] = &unk_24E798968;
  v12[4] = self;
  v11 = (id)objc_msgSend(v10, "addSuccessBlock:", v12);

}

- (void)handleUpdatedPersonFaceCrop:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v5 = a4;
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x24BE6B628];
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "schedulerWithDispatchQueue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reschedule:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__HMDRemotePersonDataMessenger_handleUpdatedPersonFaceCrop_mirrorOutputFuture___block_invoke;
  v12[3] = &unk_24E798968;
  v12[4] = self;
  v11 = (id)objc_msgSend(v10, "addSuccessBlock:", v12);

}

- (void)handleRemovedPersonWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v5 = a4;
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x24BE6B628];
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "schedulerWithDispatchQueue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reschedule:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__HMDRemotePersonDataMessenger_handleRemovedPersonWithUUID_mirrorOutputFuture___block_invoke;
  v12[3] = &unk_24E798968;
  v12[4] = self;
  v11 = (id)objc_msgSend(v10, "addSuccessBlock:", v12);

}

- (void)handleRemovedFaceCropWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v5 = a4;
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x24BE6B628];
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "schedulerWithDispatchQueue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reschedule:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __81__HMDRemotePersonDataMessenger_handleRemovedFaceCropWithUUID_mirrorOutputFuture___block_invoke;
  v12[3] = &unk_24E798968;
  v12[4] = self;
  v11 = (id)objc_msgSend(v10, "addSuccessBlock:", v12);

}

- (void)handleUpdatedSettings:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v5 = a4;
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x24BE6B628];
  -[HMDRemotePersonDataMessenger workQueue](self, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "schedulerWithDispatchQueue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reschedule:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__HMDRemotePersonDataMessenger_handleUpdatedSettings_mirrorOutputFuture___block_invoke;
  v12[3] = &unk_24E798968;
  v12[4] = self;
  v11 = (id)objc_msgSend(v10, "addSuccessBlock:", v12);

}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMDPersonDataSource)dataSource
{
  return (HMDPersonDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMFTimer)notifyResidentsOfUpdatedDataDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNotifyResidentsOfUpdatedDataDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)notifyResidentsOfUpdatedDataDebounceTimerFactory
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setNotifyResidentsOfUpdatedDataDebounceTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyResidentsOfUpdatedDataDebounceTimerFactory, 0);
  objc_storeStrong((id *)&self->_notifyResidentsOfUpdatedDataDebounceTimer, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_UUID, 0);
}

uint64_t __73__HMDRemotePersonDataMessenger_handleUpdatedSettings_mirrorOutputFuture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData");
}

uint64_t __81__HMDRemotePersonDataMessenger_handleRemovedFaceCropWithUUID_mirrorOutputFuture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData");
}

uint64_t __79__HMDRemotePersonDataMessenger_handleRemovedPersonWithUUID_mirrorOutputFuture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData");
}

uint64_t __79__HMDRemotePersonDataMessenger_handleUpdatedPersonFaceCrop_mirrorOutputFuture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData");
}

uint64_t __71__HMDRemotePersonDataMessenger_handleUpdatedPerson_mirrorOutputFuture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData");
}

uint64_t __62__HMDRemotePersonDataMessenger_handlePerformCloudPullMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

id __60__HMDRemotePersonDataMessenger_initWithUUID_home_workQueue___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a3, a1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_238120 != -1)
    dispatch_once(&logCategory__hmf_once_t6_238120, &__block_literal_global_12_238121);
  return (id)logCategory__hmf_once_v7_238122;
}

void __43__HMDRemotePersonDataMessenger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_238122;
  logCategory__hmf_once_v7_238122 = v0;

}

@end
