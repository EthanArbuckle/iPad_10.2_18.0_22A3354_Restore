@implementation HMDAudioAnalysisBulletinNotificationManager

- (HMDAudioAnalysisBulletinNotificationManager)initWithHome:(id)a3 workQueue:(id)a4 messageDispatcher:(id)a5 accountManager:(id)a6 evaluator:(id)a7 notificationCenter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMDAudioAnalysisBulletinNotificationManager *v18;
  HMDAudioAnalysisBulletinNotificationManager *v19;
  uint64_t v20;
  NSUUID *uuid;
  id synchronizeWithPrimaryDebounceTimerFactory;
  id v24;
  id v25;
  objc_super v26;

  v14 = a3;
  v25 = a4;
  v24 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMDAudioAnalysisBulletinNotificationManager;
  v18 = -[HMDAudioAnalysisBulletinNotificationManager init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_workQueue, a4);
    objc_storeStrong((id *)&v19->_messageDispatcher, a5);
    objc_storeStrong((id *)&v19->_accountManager, a6);
    objc_storeStrong((id *)&v19->_evaluator, a7);
    objc_storeStrong((id *)&v19->_notificationCenter, a8);
    objc_msgSend(v14, "uuid", v24, v25);
    v20 = objc_claimAutoreleasedReturnValue();
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v20;

    objc_storeWeak((id *)&v19->_home, v14);
    synchronizeWithPrimaryDebounceTimerFactory = v19->_synchronizeWithPrimaryDebounceTimerFactory;
    v19->_synchronizeWithPrimaryDebounceTimerFactory = &__block_literal_global_88908;

  }
  return v19;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, double);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAudioAnalysisBulletinNotificationManager *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[HMDAudioAnalysisBulletinNotificationManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTransportRestriction:", 8);
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 3, 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAudioAnalysisBulletinNotificationManager messageDispatcher](self, "messageDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", CFSTR("HMDAudioAnalysisResidentToPrimaryEventRequestMessage"), self, v6, sel__handleAudioAnalysisEventResidentToPrimaryMessage_);

    -[HMDAudioAnalysisBulletinNotificationManager notificationCenter](self, "notificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAudioAnalysisBulletinNotificationManager accountManager](self, "accountManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_handleCurrentDeviceOrAccountUpdatedNotification_, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), v9);

    -[HMDAudioAnalysisBulletinNotificationManager notificationCenter](self, "notificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAudioAnalysisBulletinNotificationManager accountManager](self, "accountManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleCurrentDeviceOrAccountUpdatedNotification_, CFSTR("HMDAppleAccountManagerAccountUpdatedNotification"), v11);

    -[HMDAudioAnalysisBulletinNotificationManager notificationCenter](self, "notificationCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "residentDeviceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v13);

    -[HMDAudioAnalysisBulletinNotificationManager notificationCenter](self, "notificationCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "residentDeviceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), v15);

    -[HMDAudioAnalysisBulletinNotificationManager synchronizeWithPrimaryDebounceTimerFactory](self, "synchronizeWithPrimaryDebounceTimerFactory");
    v16 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
    v16[2](v16, 28, 5.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAudioAnalysisBulletinNotificationManager setSynchronizeWithPrimaryDebounceTimer:](self, "setSynchronizeWithPrimaryDebounceTimer:", v17);

    -[HMDAudioAnalysisBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](self, "synchronizeWithPrimaryDebounceTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", self);

    -[HMDAudioAnalysisBulletinNotificationManager workQueue](self, "workQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAudioAnalysisBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](self, "synchronizeWithPrimaryDebounceTimer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegateQueue:", v19);

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nil home on configure", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)handleAudioAnalysisEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDRemoteDeviceMessageDestination *v8;
  void *v9;
  void *v10;
  HMDRemoteDeviceMessageDestination *v11;
  void *v12;
  void *v13;
  HMDAudioAnalysisBulletinNotificationManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDAudioAnalysisBulletinNotificationManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAudioAnalysisBulletinNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "primaryResident");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDAudioAnalysisBulletinNotificationManager messageTargetUUID](self, "messageTargetUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v8, "initWithTarget:device:", v9, v10);

    +[HMDRemoteMessage messageWithName:destination:payload:](HMDRemoteMessage, "messageWithName:destination:payload:", CFSTR("HMDAudioAnalysisResidentToPrimaryEventRequestMessage"), v11, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v16;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Routing message from resident to primary, %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    if (objc_msgSend(v6, "isCurrentDeviceConfirmedPrimaryResident"))
    {
      -[HMDAudioAnalysisBulletinNotificationManager _handleAudioAnalysisEventResidentToPrimaryMessage:](v14, "_handleAudioAnalysisEventResidentToPrimaryMessage:", v12);
    }
    else
    {
      -[HMDAudioAnalysisBulletinNotificationManager messageDispatcher](v14, "messageDispatcher");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sendMessage:", v12);

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@nil home", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (id)localRegistrationForAccessory:(id)a3 enabled:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _Unwind_Exception *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  -[HMDAudioAnalysisBulletinNotificationManager home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    v19 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v29, 8);
    _Unwind_Resume(v19);
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__88837;
  v33 = __Block_byref_object_dispose__88838;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  objc_msgSend(v7, "backingStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __85__HMDAudioAnalysisBulletinNotificationManager_localRegistrationForAccessory_enabled___block_invoke;
  v20[3] = &unk_24E795A98;
  v15 = v6;
  v21 = v15;
  v16 = v14;
  v22 = v16;
  v23 = &v29;
  v24 = &v25;
  objc_msgSend(v16, "performBlockAndWait:", v20);
  if (a4)
    *a4 = *((_BYTE *)v26 + 24);
  v17 = (id)v30[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

- (void)updateNotificationRegistration:(id)a3 enabled:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[HMDAudioAnalysisBulletinNotificationManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __97__HMDAudioAnalysisBulletinNotificationManager_updateNotificationRegistration_enabled_completion___block_invoke;
  v13[3] = &unk_24E7962D8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_updateNotificationRegistration:(id)a3 enabled:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDAudioAnalysisBulletinNotificationManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  HMDAudioAnalysisBulletinNotificationManager *v26;
  id v27;
  BOOL v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDAudioAnalysisBulletinNotificationManager workQueue](self, "workQueue");
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
    HMFBooleanToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v14;
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating registration: %@ enabled: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDAudioAnalysisBulletinNotificationManager home](v12, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "backingStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __98__HMDAudioAnalysisBulletinNotificationManager__updateNotificationRegistration_enabled_completion___block_invoke;
  v23[3] = &unk_24E798BF0;
  v24 = v8;
  v25 = v19;
  v28 = a4;
  v26 = v12;
  v27 = v9;
  v20 = v9;
  v21 = v19;
  v22 = v8;
  objc_msgSend(v21, "performBlock:", v23);

}

- (BOOL)multipleLocalRegistrationsForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  _Unwind_Exception *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v4 = a3;
  -[HMDAudioAnalysisBulletinNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    v18 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v23, 8);
    _Unwind_Resume(v18);
  }
  objc_msgSend(v4, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __86__HMDAudioAnalysisBulletinNotificationManager_multipleLocalRegistrationsForAccessory___block_invoke;
  v19[3] = &unk_24E79C0A8;
  v14 = v10;
  v20 = v14;
  v15 = v13;
  v21 = v15;
  v22 = &v23;
  objc_msgSend(v15, "performBlockAndWait:", v19);
  v16 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return v16;
}

- (void)cleanupMultipleRegistrationsAndReplaceWithRegistration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDAudioAnalysisBulletinNotificationManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __113__HMDAudioAnalysisBulletinNotificationManager_cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_cleanupMultipleRegistrationsAndReplaceWithRegistration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDAudioAnalysisBulletinNotificationManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  HMDAudioAnalysisBulletinNotificationManager *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAudioAnalysisBulletinNotificationManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543618;
    v26 = v12;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Cleaning up multiple registrations and replacing with registration: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDAudioAnalysisBulletinNotificationManager home](v10, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backingStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __114__HMDAudioAnalysisBulletinNotificationManager__cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke;
  v20[3] = &unk_24E79B3F0;
  v21 = v6;
  v22 = v16;
  v23 = v10;
  v24 = v7;
  v17 = v7;
  v18 = v16;
  v19 = v6;
  objc_msgSend(v18, "performBlock:", v20);

}

- (void)_handleAudioAnalysisEventResidentToPrimaryMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAudioAnalysisBulletinNotificationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAudioAnalysisEventBulletin *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMDAudioAnalysisBulletinNotificationManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDAudioAnalysisBulletinNotificationManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  HMDAudioAnalysisEventBulletin *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v8;
    v32 = 2112;
    v33 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received audio analysis notification message %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAudioAnalysisBulletinNotificationManager home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isCurrentDevicePrimaryResident") & 1) != 0)
  {
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HMDAudioAnalysisBulletinDataMessageKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDAudioAnalysisEventBulletin initWithDictionary:]([HMDAudioAnalysisEventBulletin alloc], "initWithDictionary:", v11);
    -[HMDAudioAnalysisEventBulletin accessoryUUID](v12, "accessoryUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryWithUUID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      -[HMDAudioAnalysisBulletinNotificationManager userDevicesToNotify:withEvent:](v6, "userDevicesToNotify:withEvent:", v16, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __97__HMDAudioAnalysisBulletinNotificationManager__handleAudioAnalysisEventResidentToPrimaryMessage___block_invoke;
      v28[3] = &unk_24E798770;
      v28[4] = v6;
      v29 = v12;
      objc_msgSend(v17, "na_each:", v28);

    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = v6;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAudioAnalysisEventBulletin accessoryUUID](v12, "accessoryUUID");
        v27 = v22;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v25;
        v32 = 2112;
        v33 = v26;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Did not find accessory with UUID:%@", buf, 0x16u);

        v22 = v27;
      }

      objc_autoreleasePoolPop(v22);
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v6;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Ignoring audio analysis event, current device is not primary", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
  }

}

- (void)handleCurrentDeviceOrAccountUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAudioAnalysisBulletinNotificationManager *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling current device or account updated notification", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAudioAnalysisBulletinNotificationManager synchronizeLocalRegistrationsWithPrimaryResident](v6, "synchronizeLocalRegistrationsWithPrimaryResident");

}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAudioAnalysisBulletinNotificationManager *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling primary resident update notification.", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAudioAnalysisBulletinNotificationManager synchronizeLocalRegistrationsWithPrimaryResident](v6, "synchronizeLocalRegistrationsWithPrimaryResident");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDAudioAnalysisBulletinNotificationManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAudioAnalysisBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAudioAnalysisBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](self, "synchronizeWithPrimaryDebounceTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDAudioAnalysisBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](self, "synchronizeWithPrimaryDebounceTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "suspend");

    -[HMDAudioAnalysisBulletinNotificationManager _synchronizeLocalRegistrationsWithPrimaryResident](self, "_synchronizeLocalRegistrationsWithPrimaryResident");
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
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized timer, ignoring", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (id)registrations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[HMDAudioAnalysisBulletinNotificationManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__HMDAudioAnalysisBulletinNotificationManager_registrations__block_invoke;
    v8[3] = &unk_24E781E50;
    v8[4] = self;
    objc_msgSend(v5, "na_flatMap:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (id)_remoteAudioAnalysisRegistrationsForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  -[HMDAudioAnalysisBulletinNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__88837;
  v18 = __Block_byref_object_dispose__88838;
  v19 = (id)MEMORY[0x24BDBD1A8];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__HMDAudioAnalysisBulletinNotificationManager__remoteAudioAnalysisRegistrationsForUUID___block_invoke;
  v11[3] = &unk_24E79B698;
  v8 = v4;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "unsafeSynchronousBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)_notifyDevice:(id)a3 event:(id)a4 user:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDRemoteDeviceMessageDestination *v11;
  void *v12;
  HMDRemoteDeviceMessageDestination *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAudioAnalysisBulletinNotificationManager *v17;
  NSObject *v18;
  void *v19;
  HMDRemoteMessage *v20;
  uint64_t v21;
  HMDRemoteMessage *v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [HMDRemoteDeviceMessageDestination alloc];
  objc_msgSend(v9, "accessoryUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v11, "initWithTarget:device:", v12, v8);

  objc_msgSend(v9, "serialize");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = CFSTR("HMDAudioAnalysisBulletinDataMessageKey");
  v36[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v19;
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Notifying device:%@, event:%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
  v20 = [HMDRemoteMessage alloc];
  if (objc_msgSend(v10, "isRemoteAccessAllowed"))
    v21 = -1;
  else
    v21 = 14;
  v22 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:restriction:](v20, "initWithName:destination:payload:type:timeout:secure:restriction:", CFSTR("HMDAudioAnalysisPrimaryResidentRouteEventRequestMessage"), v13, v15, 0, 1, v21, 60.0);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __72__HMDAudioAnalysisBulletinNotificationManager__notifyDevice_event_user___block_invoke;
  v26[3] = &unk_24E795C28;
  v26[4] = v17;
  v27 = v8;
  v28 = v9;
  v23 = v9;
  v24 = v8;
  -[HMDRemoteMessage setResponseHandler:](v22, "setResponseHandler:", v26);
  -[HMDAudioAnalysisBulletinNotificationManager messageDispatcher](v17, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendMessage:", v22);

}

- (id)userDevicesToNotify:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAudioAnalysisBulletinNotificationManager _remoteAudioAnalysisRegistrationsForUUID:](self, "_remoteAudioAnalysisRegistrationsForUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__88837;
  v20 = __Block_byref_object_dispose__88838;
  v21 = (id)objc_opt_new();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__HMDAudioAnalysisBulletinNotificationManager_userDevicesToNotify_withEvent___block_invoke;
  v13[3] = &unk_24E781EB8;
  v13[4] = self;
  v10 = v7;
  v14 = v10;
  v15 = &v16;
  objc_msgSend(v9, "na_each:", v13);
  v11 = (void *)objc_msgSend((id)v17[5], "copy");

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAudioAnalysisBulletinNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)synchronizeLocalRegistrationsWithPrimaryResident
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAudioAnalysisBulletinNotificationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__HMDAudioAnalysisBulletinNotificationManager_synchronizeLocalRegistrationsWithPrimaryResident__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (HMDBulletinNotificationRegistrationSource)source
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDBulletinNotificationRegistrationSource *v10;
  void *v11;
  HMDAudioAnalysisBulletinNotificationManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDAudioAnalysisBulletinNotificationManager *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDAudioAnalysisBulletinNotificationManager accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDAudioAnalysisBulletinNotificationManager home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = -[HMDBulletinNotificationRegistrationSource initWithUserUUID:deviceAddress:]([HMDBulletinNotificationRegistrationSource alloc], "initWithUserUUID:deviceAddress:", v9, v6);
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve current device user", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      v10 = 0;
    }

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
      v20 = 138543362;
      v21 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve current device address", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (void)_requestSynchronizeRegistrations
{
  void *v3;
  HMDAudioAnalysisBulletinNotificationManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAudioAnalysisBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](v4, "synchronizeWithPrimaryDebounceTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isRunning");
    HMFBooleanToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Requesting synchronize registrations, debounce timer running: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAudioAnalysisBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](v4, "synchronizeWithPrimaryDebounceTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)_synchronizeLocalRegistrationsWithPrimaryResident
{
  NSObject *v3;
  void *v4;
  HMDAudioAnalysisBulletinNotificationManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  HMDAudioAnalysisBulletinNotificationManager *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  HMDAudioAnalysisBulletinNotificationManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDAudioAnalysisBulletinNotificationManager *v33;
  NSObject *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  __int128 *v38;
  _QWORD v39[5];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  __int128 *p_buf;
  uint8_t v52[4];
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int128 buf;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  -[HMDAudioAnalysisBulletinNotificationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronizing local registrations with primary resident", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAudioAnalysisBulletinNotificationManager source](v5, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMDAudioAnalysisBulletinNotificationManager home](v5, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backingStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__88837;
    v61 = __Block_byref_object_dispose__88838;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v62 = v13;
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke;
    v48[3] = &unk_24E79B5F8;
    v48[4] = v5;
    v49 = v8;
    v15 = v12;
    v50 = v15;
    p_buf = &buf;
    objc_msgSend(v11, "unsafeSynchronousBlock:", v48);
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__88837;
    v46 = __Block_byref_object_dispose__88838;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    v39[0] = v14;
    v39[1] = 3221225472;
    v39[2] = __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3;
    v39[3] = &unk_24E79C0A8;
    v39[4] = v5;
    v16 = v15;
    v40 = v16;
    v41 = &v42;
    v17 = (void *)MEMORY[0x227676638](objc_msgSend(v16, "performBlockAndWait:", v39));
    v18 = v5;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v43[5];
      v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v52 = 138543874;
      v53 = v20;
      v54 = 2112;
      v55 = v21;
      v56 = 2112;
      v57 = v22;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@enabledLocalRegistrations: %@ remoteRegistrations: %@", v52, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)v43[5];
    v36[0] = v14;
    v36[1] = 3221225472;
    v36[2] = __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_51;
    v36[3] = &unk_24E781F78;
    v38 = &buf;
    v25 = v23;
    v37 = v25;
    objc_msgSend(v24, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v36);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "hmf_isEmpty") && objc_msgSend(v26, "hmf_isEmpty"))
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = v18;
      HMFGetOSLogHandle();
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v52 = 138543362;
        v53 = v30;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@No changes detected to sync with primary", v52, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
    }
    else
    {
      v31 = (void *)objc_msgSend(v25, "copy");
      -[HMDAudioAnalysisBulletinNotificationManager _updateRegistrationsOnPrimaryWithEnabledRegistrations:disabledRegistrations:](v18, "_updateRegistrationsOnPrimaryWithEnabledRegistrations:disabledRegistrations:", v31, v26);

    }
    _Block_object_dispose(&v42, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v32 = (void *)MEMORY[0x227676638]();
    v33 = v5;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v35;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve bulletin notification registration source for current device when synchronizing registrations with primary", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
  }

}

- (void)_updateRegistrationsOnPrimaryWithEnabledRegistrations:(id)a3 disabledRegistrations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDAudioAnalysisBulletinNotificationManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAudioAnalysisBulletinNotificationManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDAudioAnalysisBulletinNotificationManager *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAudioAnalysisBulletinNotificationManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543874;
    v29 = v12;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating registrations on primary resident, [enabled : %@], [disabled : %@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDAudioAnalysisBulletinNotificationManager home](v10, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "bulletinNotificationsSupported") & 1) != 0)
  {
    -[HMDAudioAnalysisBulletinNotificationManager source](v10, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __123__HMDAudioAnalysisBulletinNotificationManager__updateRegistrationsOnPrimaryWithEnabledRegistrations_disabledRegistrations___block_invoke;
      v24[3] = &unk_24E792CD8;
      v24[4] = v10;
      v25 = v14;
      v26 = v6;
      v27 = v7;
      objc_msgSend(v13, "updateBulletinRegistrationOnPrimaryResidentWithSource:enableRegistrations:disableRegistration:completionHandler:", v25, v26, v27, v24);

    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v10;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve bulletin notification registration source for current device when updating notification registrations", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v10;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Bulletin notifications are not supported, only modifying local registrations", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (id)_mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDAudioAnalysisBulletinNotificationManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAudioAnalysisBulletinNotificationManager *v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAudioAnalysisBulletinNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appleMediaAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_filter:", &__block_literal_global_57);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_59_88825);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MKFLocalBulletinAnalysisRegistration fetchRequest](MKFLocalBulletinAnalysisRegistration, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v9, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (v10)
  {
    if (!objc_msgSend(v10, "count"))
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@No local registrations fetched", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
    }
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __118__HMDAudioAnalysisBulletinNotificationManager__mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext___block_invoke_60;
    v22[3] = &unk_24E781FE0;
    v23 = v8;
    objc_msgSend(v10, "na_filter:", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local registrations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v16 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v16;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAppleAccountManager)accountManager
{
  return (HMDAppleAccountManager *)objc_getProperty(self, a2, 32, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (HMDNotificationConditionEvaluator)evaluator
{
  return (HMDNotificationConditionEvaluator *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (HMFTimer)synchronizeWithPrimaryDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSynchronizeWithPrimaryDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)synchronizeWithPrimaryDebounceTimerFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setSynchronizeWithPrimaryDebounceTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_synchronizeWithPrimaryDebounceTimerFactory, 0);
  objc_storeStrong((id *)&self->_synchronizeWithPrimaryDebounceTimer, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
}

uint64_t __118__HMDAudioAnalysisBulletinNotificationManager__mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext___block_invoke_60(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "accessoryModelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __118__HMDAudioAnalysisBulletinNotificationManager__mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __118__HMDAudioAnalysisBulletinNotificationManager__mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHomePod");
}

void __123__HMDAudioAnalysisBulletinNotificationManager__updateRegistrationsOnPrimaryWithEnabledRegistrations_disabledRegistrations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      v19 = 138544386;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v3;
      v12 = "%{public}@Unable to update audio analysis registrations resident: source: %@, [enabled : %@], [disabled : %@], error: %@";
      v13 = v7;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 52;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v13, v14, v12, (uint8_t *)&v19, v15);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 56);
    v19 = 138544130;
    v20 = v8;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    v25 = 2112;
    v26 = v18;
    v12 = "%{public}@Updating audio analysis registrations primary resident was successful, source: %@, [enabled: %@], [disabled: %@]";
    v13 = v7;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 42;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke(_QWORD *a1)
{
  id v2;
  _QWORD v3[5];

  objc_msgSend((id)objc_opt_class(), "registrationsForSource:context:", a1[5], a1[6]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2;
  v3[3] = &unk_24E781F00;
  v3[4] = a1[7];
  objc_msgSend(v2, "na_each:", v3);

}

void __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_mkfLocalAnalysisSignificantEventRegistrationsWithManagedObjectContext:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4;
  v3[3] = &unk_24E781F28;
  v3[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "na_each:", v3);

}

void __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_52;
  v7[3] = &unk_24E781F50;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObject:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

uint64_t __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_52(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4(uint64_t a1, void *a2)
{
  HMDAudioAnalysisEventBulletinNotificationRegistration *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "enabled"))
  {
    v3 = -[HMDAudioAnalysisEventBulletinNotificationRegistration initWithLocalBulletinAudioAnalysisRegistration:]([HMDAudioAnalysisEventBulletinNotificationRegistration alloc], "initWithLocalBulletinAudioAnalysisRegistration:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

  }
}

void __96__HMDAudioAnalysisBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  +[HMDBulletinNotificationRegistrationUtilities audioAnalysisNotificationRegistrationFromRemoteRegistration:](HMDBulletinNotificationRegistrationUtilities, "audioAnalysisNotificationRegistrationFromRemoteRegistration:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v5, "registration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

uint64_t __95__HMDAudioAnalysisBulletinNotificationManager_synchronizeLocalRegistrationsWithPrimaryResident__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestSynchronizeRegistrations");
}

void __77__HMDAudioAnalysisBulletinNotificationManager_userDevicesToNotify_withEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "registration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userWithUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "evaluator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conditions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "conditionsPass:registrationUser:", v11, v9);

    v36 = v9;
    if (v12)
    {
      objc_msgSend(v3, "registration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "audioAnalysisClassifierOptions");
      v15 = (objc_msgSend(*(id *)(a1 + 40), "reason") & v14) != 0;

    }
    else
    {
      v15 = 0;
    }
    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "registration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "conditions");
      v35 = v4;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v34 = v15;
      v26 = v6;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v39 = v23;
      v40 = 2112;
      v41 = v25;
      v42 = 2112;
      v43 = v27;
      v44 = 2112;
      v45 = v26;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@conditions:%@, pass?%@, device:%@", buf, 0x2Au);

      v4 = v35;
      v6 = v26;
      v15 = v34;

      v20 = v33;
    }

    objc_autoreleasePoolPop(v20);
    v9 = v36;
    if ((v15 & ~objc_msgSend(v6, "isCurrentDevice")) == 1 && v6)
    {
      v37[0] = v6;
      objc_msgSend(v3, "source");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "userUUID");
      v29 = v4;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
      v31 = v6;
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v29;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v32);

      v6 = v31;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v19;
      v40 = 2112;
      v41 = v4;
      v42 = 2112;
      v43 = v5;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to evaluate registration: %@, no matching user for source: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

void __72__HMDAudioAnalysisBulletinNotificationManager__notifyDevice_event_user___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v20 = 138544130;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v5;
      v14 = "%{public}@Failed to notify device:%@ for event:%@ with %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 42;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v15, v16, v14, (uint8_t *)&v20, v17);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 48);
    v20 = 138543874;
    v21 = v11;
    v22 = 2112;
    v23 = v18;
    v24 = 2112;
    v25 = v19;
    v14 = "%{public}@Successfully notified device:%@, event:%@";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

void __88__HMDAudioAnalysisBulletinNotificationManager__remoteAudioAnalysisRegistrationsForUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[HMCContext findAccessoryWithModelID:](HMCContext, "findAccessoryWithModelID:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "analysisEventBulletinRegistrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "na_map:", &__block_literal_global_40_88865);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

id __88__HMDAudioAnalysisBulletinNotificationManager__remoteAudioAnalysisRegistrationsForUUID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities audioAnalysisNotificationRegistrationFromRemoteRegistration:](HMDBulletinNotificationRegistrationUtilities, "audioAnalysisNotificationRegistrationFromRemoteRegistration:", a2);
}

id __60__HMDAudioAnalysisBulletinNotificationManager_registrations__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_remoteAudioAnalysisRegistrationsForUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __97__HMDAudioAnalysisBulletinNotificationManager__handleAudioAnalysisEventResidentToPrimaryMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v6)
      v10 = v9 == 0;
    else
      v10 = 1;
    if (v10)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543874;
        v18 = v14;
        v19 = 2112;
        v20 = v9;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@device:%@, uuid:%@", (uint8_t *)&v17, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "userWithUUID:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        objc_msgSend(*(id *)(a1 + 32), "_notifyDevice:event:user:", v9, *(_QWORD *)(a1 + 40), v16);

    }
  }

}

void __114__HMDAudioAnalysisBulletinNotificationManager__cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  _QWORD block[5];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinAnalysisRegistration fetchRequest](MKFLocalBulletinAnalysisRegistration, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("accessoryModelID"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  v5 = *(void **)(a1 + 40);
  v30 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v3, &v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v30;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __114__HMDAudioAnalysisBulletinNotificationManager__cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke_2;
  v28[3] = &unk_24E781E28;
  v29 = *(id *)(a1 + 40);
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v28);
  v8 = (void *)MEMORY[0x24BDBB658];
  +[MKFLocalBulletinAnalysisRegistration entity](MKFLocalBulletinAnalysisRegistration, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertNewObjectForEntityForName:inManagedObjectContext:", v10, *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAccessoryModelID:", v2);
  objc_msgSend(v11, "setClassifierOptions:", objc_msgSend(*(id *)(a1 + 32), "audioAnalysisClassifierOptions"));
  objc_msgSend(v11, "setEnabled:", 1);
  v12 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "conditions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:moc:conditions:](HMDBulletinNotificationRegistrationUtilities, "createAndAddLocalConditionsToRegistration:moc:conditions:", v11, v12, v13);

  v15 = *(void **)(a1 + 40);
  v27 = v7;
  v16 = objc_msgSend(v15, "save:", &v27);
  v17 = v27;

  v18 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "reset"));
  v19 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v16)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v22;
      v33 = 2112;
      v34 = v2;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Successfully cleaned up multiple local registrations for accessory UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(*(id *)(a1 + 48), "workQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __114__HMDAudioAnalysisBulletinNotificationManager__cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke_31;
    block[3] = &unk_24E79C240;
    block[4] = *(_QWORD *)(a1 + 48);
    dispatch_async(v23, block);

  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v24;
      v33 = 2112;
      v34 = v2;
      v35 = 2112;
      v36 = v17;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to clean up multiple local registrations for accessory UUID: %@ due to error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
  }
  v25 = *(_QWORD *)(a1 + 56);
  if (v25)
    (*(void (**)(uint64_t, id))(v25 + 16))(v25, v17);

}

uint64_t __114__HMDAudioAnalysisBulletinNotificationManager__cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

uint64_t __114__HMDAudioAnalysisBulletinNotificationManager__cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestSynchronizeRegistrations");
}

uint64_t __113__HMDAudioAnalysisBulletinNotificationManager_cleanupMultipleRegistrationsAndReplaceWithRegistration_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupMultipleRegistrationsAndReplaceWithRegistration:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __86__HMDAudioAnalysisBulletinNotificationManager_multipleLocalRegistrationsForAccessory___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  +[MKFLocalBulletinAnalysisRegistration fetchRequest](MKFLocalBulletinAnalysisRegistration, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("accessoryModelID"), a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  v4 = (void *)a1[5];
  v7 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (unint64_t)objc_msgSend(v5, "count") > 1;

}

void __98__HMDAudioAnalysisBulletinNotificationManager__updateNotificationRegistration_enabled_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD block[5];
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinAnalysisRegistration fetchAudioAnalysisModeRegistrationForAccessoryUUID:managedObjectContext:](MKFLocalBulletinAnalysisRegistration, "fetchAudioAnalysisModeRegistrationForAccessoryUUID:managedObjectContext:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 32);
      HMFBooleanToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v13;
      v54 = 2112;
      v55 = v14;
      v56 = 2112;
      v57 = v15;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Local registration doesn't exist for registration: %@ enabled: %@, creating one now", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v16 = (void *)MEMORY[0x24BDBB658];
    +[MKFLocalBulletinAnalysisRegistration entity](MKFLocalBulletinAnalysisRegistration, "entity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertNewObjectForEntityForName:inManagedObjectContext:", v18, *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setAccessoryModelID:", v49);
    objc_msgSend(v5, "setClassifierOptions:", objc_msgSend(*(id *)(a1 + 32), "audioAnalysisClassifierOptions"));
    objc_msgSend(v5, "setEnabled:", *(unsigned __int8 *)(a1 + 64));
    goto LABEL_9;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "enabled");
  v7 = *(unsigned __int8 *)(a1 + 64);
  v8 = v7 != v6;
  if (v7 != v6)
    objc_msgSend(v5, "setEnabled:", v7 != 0);
  v9 = objc_msgSend(v5, "classifierOptions");
  if (v9 != objc_msgSend(*(id *)(a1 + 32), "audioAnalysisClassifierOptions"))
  {
    objc_msgSend(v5, "setClassifierOptions:", objc_msgSend(*(id *)(a1 + 32), "audioAnalysisClassifierOptions"));
LABEL_9:
    v8 = 1;
  }
  objc_msgSend(v5, "conditions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:](HMDBulletinNotificationRegistrationUtilities, "conditionsFromLocalConditions:", v19);
    v21 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v21;
  }
  objc_msgSend(*(id *)(a1 + 32), "conditions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v20, "isEqualToSet:", v22);

  if ((v23 & 1) != 0)
  {
    if (!v8)
      goto LABEL_22;
  }
  else
  {
    if (v19)
      objc_msgSend(v5, "removeConditions:", v19);
    v24 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "conditions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:moc:conditions:](HMDBulletinNotificationRegistrationUtilities, "createAndAddLocalConditionsToRegistration:moc:conditions:", v5, v24, v25);

  }
  if (*(_BYTE *)(a1 + 64))
    v27 = v2;
  else
    v27 = v3;
  objc_msgSend(v27, "addObject:", *(_QWORD *)(a1 + 32));
LABEL_22:
  if (objc_msgSend(v2, "hmf_isEmpty") && objc_msgSend(v3, "hmf_isEmpty"))
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = v2;
      v32 = v3;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v33;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Skipping save and not messaging primary because notification registration update resulted in no changes", buf, 0xCu);

      v3 = v32;
      v2 = v31;
    }

    objc_autoreleasePoolPop(v28);
    v34 = *(_QWORD *)(a1 + 56);
    if (v34)
      (*(void (**)(uint64_t, _QWORD))(v34 + 16))(v34, 0);
  }
  else
  {
    v47 = v2;
    v35 = v3;
    v36 = *(void **)(a1 + 40);
    v51 = 0;
    v37 = objc_msgSend(v36, "save:", &v51, v47);
    v38 = v51;
    v39 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "reset"));
    v40 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v37)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v53 = v43;
        v54 = 2112;
        v55 = v48;
        v56 = 2112;
        v57 = v35;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Successfully updated local enabled registrations: %@, disabled registrations: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v39);
      objc_msgSend(*(id *)(a1 + 48), "workQueue");
      v44 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __98__HMDAudioAnalysisBulletinNotificationManager__updateNotificationRegistration_enabled_completion___block_invoke_24;
      block[3] = &unk_24E79C240;
      block[4] = *(_QWORD *)(a1 + 48);
      dispatch_async(v44, block);

    }
    else
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v53 = v45;
        v54 = 2112;
        v55 = v48;
        v56 = 2112;
        v57 = v35;
        v58 = 2112;
        v59 = v38;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to update local enabled registrations: %@, disabled registrations: %@ due to error: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v39);
    }
    v46 = *(_QWORD *)(a1 + 56);
    v3 = v35;
    if (v46)
      (*(void (**)(uint64_t, id))(v46 + 16))(v46, v38);

    v2 = v48;
  }

}

uint64_t __98__HMDAudioAnalysisBulletinNotificationManager__updateNotificationRegistration_enabled_completion___block_invoke_24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestSynchronizeRegistrations");
}

uint64_t __97__HMDAudioAnalysisBulletinNotificationManager_updateNotificationRegistration_enabled_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateNotificationRegistration:enabled:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __85__HMDAudioAnalysisBulletinNotificationManager_localRegistrationForAccessory_enabled___block_invoke(uint64_t a1)
{
  void *v2;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinAnalysisRegistration fetchAudioAnalysisModeRegistrationForAccessoryUUID:managedObjectContext:](MKFLocalBulletinAnalysisRegistration, "fetchAudioAnalysisModeRegistrationForAccessoryUUID:managedObjectContext:", v2, *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v3 = -[HMDAudioAnalysisEventBulletinNotificationRegistration initWithLocalBulletinAudioAnalysisRegistration:]([HMDAudioAnalysisEventBulletinNotificationRegistration alloc], "initWithLocalBulletinAudioAnalysisRegistration:", v6);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v6, "enabled");
  }

}

id __132__HMDAudioAnalysisBulletinNotificationManager_initWithHome_workQueue_messageDispatcher_accountManager_evaluator_notificationCenter___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a3, a1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_88923 != -1)
    dispatch_once(&logCategory__hmf_once_t27_88923, &__block_literal_global_45_88924);
  return (id)logCategory__hmf_once_v28_88925;
}

+ (id)registrationsForSource:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[_MKFAnalysisEventBulletinRegistration fetchRequest](_MKFAnalysisEventBulletinRegistration, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v6, "userUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "idsIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "idsDestination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("(%K == %@) && (%K == %@) && (%K == %@)"), CFSTR("user.modelID"), v10, CFSTR("deviceIdsIdentifier"), v12, CFSTR("deviceIdsDestination"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v15);

  v24 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v24;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch audio analysis bulletin registrations for source: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v18 = (id)MEMORY[0x24BDBD1A8];
  }

  return v18;
}

void __58__HMDAudioAnalysisBulletinNotificationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v28_88925;
  logCategory__hmf_once_v28_88925 = v0;

}

@end
