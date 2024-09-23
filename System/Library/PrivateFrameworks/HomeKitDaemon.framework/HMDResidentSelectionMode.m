@implementation HMDResidentSelectionMode

- (HMDResidentSelectionMode)initWithContext:(id)a3
{
  id v4;
  void *v5;
  HMDResidentSelectionMode *v6;

  v4 = a3;
  +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDResidentSelectionMode initWithContext:backgroundTaskManager:](self, "initWithContext:backgroundTaskManager:", v4, v5);

  return v6;
}

- (HMDResidentSelectionMode)initWithContext:(id)a3 backgroundTaskManager:(id)a4
{
  id v6;
  id v7;
  HMDResidentSelectionMode *v8;
  HMDResidentSelectionMode *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *backgroundTaskIdentifier;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HMDResidentSelectionMode;
  v8 = -[HMDResidentSelectionMode init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    objc_msgSend(v6, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("resident.list.generation/%@"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    backgroundTaskIdentifier = v9->_backgroundTaskIdentifier;
    v9->_backgroundTaskIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v9->_backgroundTaskManager, a4);
    v9->_primaryChangedReason = 0;
    objc_msgSend(v6, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "homeManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "idsServerBag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_idsServerBag, v19);

  }
  return v9;
}

- (unint64_t)currentModeType
{
  return 0;
}

- (void)_registerForMessagesAsAResident
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDResidentSelectionMode *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[2];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDResidentSelectionMode context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isActingAsResident") & 1) != 0)
  {
    +[HMDRemoteMessagePolicy defaultPolicy](HMDMutableRemoteMessagePolicy, "defaultPolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRequiresSecureMessage:", 1);
    objc_msgSend(v4, "setRoles:", objc_msgSend(v4, "roles") | 4);
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "messageDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v14[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", CFSTR("mesh.meshInformationRequest"), self, v9, sel_handleMeshInformationRequest_);

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
      *(_DWORD *)buf = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Not registering for messages since we are not a resident.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)start
{
  void *v3;
  HMDResidentSelectionMode *v4;
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
  -[HMDResidentSelectionMode _registerForMessagesAsAResident](v4, "_registerForMessagesAsAResident");
}

- (void)currentDeviceReadyAsAResident
{
  void *v3;
  char v4;
  void *v5;
  HMDResidentSelectionMode *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionMode context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActingAsResident");

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device ready as a resident", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDResidentSelectionMode _registerForMessagesAsAResident](v6, "_registerForMessagesAsAResident");
    -[HMDResidentSelectionMode scheduleDailyPreferredResidentsListRegenerationTask](v6, "scheduleDailyPreferredResidentsListRegenerationTask");
    -[HMDResidentSelectionMode _publishElectorsList](v6, "_publishElectorsList");
    if (!-[HMDResidentSelectionMode takeOverIfPrimaryIsNotViableWithIsTimerTriggered:](v6, "takeOverIfPrimaryIsNotViableWithIsTimerTriggered:", 0))
    {
      -[HMDResidentSelectionMode delegate](v6, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "primarySelectionModeReadyAsResident:", v6);

    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Ready as resident on non-resident", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
}

- (void)configureAsAResidentWithRunPrimaryEvaluation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  HMDResidentSelectionMode *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionMode context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActingAsResident");

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring as a resident in the current mode. Run primary evaluation: %d", (uint8_t *)&v15, 0x12u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDResidentSelectionMode scheduleDailyPreferredResidentsListRegenerationTask](v8, "scheduleDailyPreferredResidentsListRegenerationTask");
    -[HMDResidentSelectionMode _updateLocalPreferredResidentsList](v8, "_updateLocalPreferredResidentsList");
    if ((!v3
       || !-[HMDResidentSelectionMode takeOverIfPrimaryIsNotViableWithIsTimerTriggered:](v8, "takeOverIfPrimaryIsNotViableWithIsTimerTriggered:", 0))&& !-[HMDResidentSelectionMode _currentDevicePreferredResidentsListIsPublished](v8, "_currentDevicePreferredResidentsListIsPublished"))
    {
      -[HMDResidentSelectionMode delegate](v8, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentSelectionMode localPreferredResidentsList](v8, "localPreferredResidentsList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "primarySelectionMode:didUpdatePreferredResidentsList:", v8, v13);

    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Configuring as resident on non-resident", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
}

- (BOOL)_currentDevicePreferredResidentsListIsPublished
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HMDResidentSelectionMode context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentsPresentOnStatusKit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentResidentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "containsObject:", v6);

  return v7;
}

- (double)_takeOverIfPrimaryIsNotViableInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HMDResidentSelectionMode idsServerBag](self, "idsServerBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentSelectionTakeOverIfPrimaryIsNotViableInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 300.0;
  }

  return v5;
}

- (unint64_t)_takeOverOnlyIfCurrentPrimaryIsNotViableJitter
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDResidentSelectionMode idsServerBag](self, "idsServerBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 60;

  return v4;
}

- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3 selectionTimestamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDResidentSelectionMode *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  HMDResidentSelectionMode *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  HMDResidentSelectionMode *v29;
  NSObject *v30;
  void *v31;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDResidentSelectionMode context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "residentSelectionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543874;
    v34 = v13;
    v35 = 2112;
    v36 = v14;
    v37 = 2112;
    v38 = *(double *)&v7;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Evaluating to allow external update of primary resident to: %@ with selection timestamp: %@.", (uint8_t *)&v33, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v8, "primaryResidentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isCurrentDevice");

  if (!v16)
    goto LABEL_12;
  if (!-[HMDResidentSelectionMode newPrimaryIsInREv2BasedOnTheirTimestamp:ourSelectionInfo:](v11, "newPrimaryIsInREv2BasedOnTheirTimestamp:ourSelectionInfo:", v7, v9))
  {
    if (-[HMDResidentSelectionMode shouldTakeOverAsTheCurrentPrimaryWithSelectionInfo:isTimerTriggered:](v11, "shouldTakeOverAsTheCurrentPrimaryWithSelectionInfo:isTimerTriggered:", v9, 0))
    {
      v24 = (double)arc4random_uniform(-[HMDResidentSelectionMode _takeOverOnlyIfCurrentPrimaryIsNotViableJitter](v11, "_takeOverOnlyIfCurrentPrimaryIsNotViableJitter"));
      v25 = -[HMDResidentSelectionMode _takeOverIfPrimaryIsNotViableInterval](v11, "_takeOverIfPrimaryIsNotViableInterval");
      v27 = v26 + v24;
      v28 = (void *)MEMORY[0x227676638](v25);
      v29 = v11;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543874;
        v34 = v31;
        v35 = 2112;
        v36 = v6;
        v37 = 2048;
        v38 = v27;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@For now allowing external update of primary resident to: %@. Will reconsider in %f seconds", (uint8_t *)&v33, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
      -[HMDResidentSelectionMode _rescheduleTakeOverIfPrimaryIsNotViableTimerWithTimeInterval:](v29, "_rescheduleTakeOverIfPrimaryIsNotViableTimerWithTimeInterval:", v27);
    }
LABEL_12:
    v23 = 1;
    goto LABEL_13;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = v11;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543362;
    v34 = v20;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Not allowing external update of primary resident because its an REV2 device.", (uint8_t *)&v33, 0xCu);

  }
  objc_autoreleasePoolPop(v17);
  -[HMDResidentSelectionMode delegate](v18, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectionTimestamp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "primarySelectionMode:reassertAsCurrentPrimaryWithSelectionTimestamp:", v18, v22);

  v23 = 0;
LABEL_13:

  return v23;
}

- (void)performSelectionWithPreferredPrimaryResident:(id)a3 requireAutoUpdate:(BOOL)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = a6;
  v10 = (void *)MEMORY[0x24BDBCE88];
  v11 = *MEMORY[0x24BDBCAB0];
  v12 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v14, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v15);
}

- (void)selectPrimaryResidentFromResidents:(id)a3 requireAutoUpdate:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v8 = a3;
  -[HMDResidentSelectionMode setSelectionCompletion:](self, "setSelectionCompletion:", a5);
  objc_msgSend(v8, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentSelectionMode setResidentsEnumerator:](self, "setResidentsEnumerator:", v9);
  -[HMDResidentSelectionMode residentsEnumerator](self, "residentsEnumerator");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode createSelectionMessageCompletion](self, "createSelectionMessageCompletion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode sendSelectionMessageToResident:requireAutoUpdate:completion:](self, "sendSelectionMessageToResident:requireAutoUpdate:completion:", v10, v6, v11);

}

- (id)createSelectionMessageCompletion
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HMDResidentSelectionMode_createSelectionMessageCompletion__block_invoke;
  aBlock[3] = &unk_24E79B300;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (void)didFailResidentSelectionWithResident:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDResidentSelectionMode *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDResidentSelectionMode residentsEnumerator](self, "residentsEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v13;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Failed to select resident %@. Attempting the next one: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  if (v9)
  {
    -[HMDResidentSelectionMode createSelectionMessageCompletion](v11, "createSelectionMessageCompletion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentSelectionMode sendSelectionMessageToResident:requireAutoUpdate:completion:](v11, "sendSelectionMessageToResident:requireAutoUpdate:completion:", v9, 0, v14);

  }
  else
  {
    -[HMDResidentSelectionMode selectionCompletion](v11, "selectionCompletion");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v7);

    -[HMDResidentSelectionMode setSelectionCompletion:](v11, "setSelectionCompletion:", 0);
    -[HMDResidentSelectionMode setResidentsEnumerator:](v11, "setResidentsEnumerator:", 0);
  }

}

- (void)didSucceedResidentSelectionWithPreferred:(id)a3
{
  id v4;
  void *v5;
  HMDResidentSelectionMode *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Selection completed with preferred primary: %@.", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDResidentSelectionMode selectionCompletion](v6, "selectionCompletion");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, id, _QWORD))(v9 + 16))(v9, v4, 0);

  -[HMDResidentSelectionMode setSelectionCompletion:](v6, "setSelectionCompletion:", 0);
  -[HMDResidentSelectionMode setResidentsEnumerator:](v6, "setResidentsEnumerator:", 0);

}

- (void)sendSelectionMessageToResident:(id)a3 requireAutoUpdate:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDRemoteDeviceMessageDestination *v20;
  void *v21;
  void *v22;
  HMDRemoteDeviceMessageDestination *v23;
  HMDRemoteMessage *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDResidentSelectionMode *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD block[5];
  id v36;
  id v37;
  _QWORD v38[4];
  _QWORD v39[4];
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v6 = a4;
  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "isCurrentDevice"))
  {
    -[HMDResidentSelectionMode queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__HMDResidentSelectionMode_sendSelectionMessageToResident_requireAutoUpdate_completion___block_invoke;
    block[3] = &unk_24E79B440;
    block[4] = self;
    v37 = v9;
    v36 = v8;
    dispatch_async(v10, block);

  }
  else
  {
    objc_msgSend(v8, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "idsIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v38[0] = CFSTR("primary.ids.identifier");
      objc_msgSend(v8, "device");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "idsIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v15;
      v38[1] = CFSTR("primary.selection.timestamp");
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v16;
      v38[2] = CFSTR("primary.selection.mode");
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", -[HMDResidentSelectionMode currentModeType](self, "currentModeType"));
      v39[2] = v17;
      v38[3] = CFSTR("RS.requireAutoUpdate");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39[3] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = [HMDRemoteDeviceMessageDestination alloc];
      -[HMDResidentSelectionMode messageTargetUUID](self, "messageTargetUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "device");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v20, "initWithTarget:device:", v21, v22);

      v24 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:", CFSTR("residentSelection.preferred"), 25, v23, v19, 0, 1, 0.0, -[HMDResidentSelectionMode messageTransportRestriction](self, "messageTransportRestriction"));
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __88__HMDResidentSelectionMode_sendSelectionMessageToResident_requireAutoUpdate_completion___block_invoke_31;
      v32[3] = &unk_24E7961A0;
      v34 = v9;
      v33 = v8;
      -[HMDRemoteMessage setResponseHandler:](v24, "setResponseHandler:", v32);
      -[HMDResidentSelectionMode context](self, "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "messageDispatcher");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sendMessage:completionHandler:", v24, 0);

    }
    else
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v30;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@IDS identifier of the preferred resident is nil.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id, void *))v9 + 2))(v9, v8, v31);

    }
  }

}

- (void)_evaluatePrimaryChangedReasonForCurrentSelectionInfo:(id)a3 previousSelectionInfo:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  HMDResidentSelectionMode *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = -[HMDResidentSelectionMode currentModeType](self, "currentModeType");
  if (v7)
  {
    if (v8 == 2)
    {
      objc_msgSend(v6, "preferredResidentIDSIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "preferredResidentIDSIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (v11)
        v12 = 3;
      else
        v12 = 1;
    }
    else
    {
      v12 = 3;
    }
    goto LABEL_12;
  }
  if (v8 == 2)
  {
    v12 = 1;
LABEL_12:
    v13 = -[HMDResidentSelectionMode setPrimaryChangedReason:](self, "setPrimaryChangedReason:", v12);
    goto LABEL_13;
  }
  v13 = -[HMDResidentSelectionMode currentModeType](self, "currentModeType");
  if (v13 == 3)
  {
    v12 = 2;
    goto LABEL_12;
  }
LABEL_13:
  v14 = (void *)MEMORY[0x227676638](v13);
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v17;
    v20 = 2048;
    v21 = -[HMDResidentSelectionMode primaryChangedReason](v15, "primaryChangedReason");
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@New evaluated primary changed reason: %lu", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v14);

}

- (void)didUpdateResidentSelectionModelTo:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[HMDResidentSelectionMode residentSelectionInfoFromWorkingStore](self, "residentSelectionInfoFromWorkingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode _evaluatePrimaryChangedReasonForCurrentSelectionInfo:previousSelectionInfo:](self, "_evaluatePrimaryChangedReasonForCurrentSelectionInfo:previousSelectionInfo:", v5, v6);

  -[HMDResidentSelectionMode setResidentSelectionInfoFromWorkingStore:](self, "setResidentSelectionInfoFromWorkingStore:", v5);
  -[HMDResidentSelectionMode context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "isActingAsResident");

  if ((_DWORD)v5)
    -[HMDResidentSelectionMode takeOverIfPrimaryIsNotViableWithIsTimerTriggered:](self, "takeOverIfPrimaryIsNotViableWithIsTimerTriggered:", 0);
}

- (void)didReceiveSelectionMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDResidentSelectionMode *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDResidentSelectionMode *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDResidentSelectionMode *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("primary.ids.identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "messagePayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmf_dateForKey:", CFSTR("primary.selection.timestamp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMDResidentSelectionMode context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentResidentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "idsIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "hmf_isEqualToUUID:", v12))
      {
        v13 = (void *)MEMORY[0x227676638]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v16;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Controller notified that current device is the new preferred primary", (uint8_t *)&v25, 0xCu);

        }
        objc_autoreleasePoolPop(v13);
        -[HMDResidentSelectionMode handleWeAreSelectedAsThePreferredPrimaryWithSelectionTimestamp:selectionMessage:](v14, "handleWeAreSelectedAsThePreferredPrimaryWithSelectionTimestamp:selectionMessage:", v8, v4);
      }
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
        v25 = 138543618;
        v26 = v24;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Message with preferred primary: %@ did not contain a preferred primary selection timestamp", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v12);
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
      v25 = 138543362;
      v26 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Message did not contain a preferred primary value", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v8);
  }

}

- (double)_statusDebounceInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HMDResidentSelectionMode idsServerBag](self, "idsServerBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentSelectionStatusDebounceInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 60.0;
  }

  return v5;
}

- (void)didUpdateResidentStatus:(id)a3 residentsFound:(id)a4 residentsLost:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  _BOOL4 v14;
  void *v15;
  HMDResidentSelectionMode *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  HMDResidentSelectionMode *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  HMDResidentSelectionMode *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  double v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDResidentSelectionMode context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isActingAsResident"))
  {
    objc_msgSend(v11, "residentStatusChannel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isConnected");

    if ((v13 & 1) != 0)
    {
      if (objc_msgSend(v9, "count"))
        v14 = 1;
      else
        v14 = objc_msgSend(v10, "count") != 0;
      objc_msgSend(v8, "residentIDSIdentifierToLocationMap");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HMDResidentSelectionMode shouldRegeneratePreferredResidentsListBasedOnFoundResidents:residentLocationMap:](self, "shouldRegeneratePreferredResidentsListBasedOnFoundResidents:residentLocationMap:", v9, v19);

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
          objc_msgSend(v8, "residentIDSIdentifierToLocationMap");
          v37 = v21;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v24;
          v40 = 2112;
          v41 = *(double *)&v25;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Regenerating new preferred residents list. Latest location info: %@", buf, 0x16u);

          v21 = v37;
        }

        objc_autoreleasePoolPop(v21);
        -[HMDResidentSelectionMode _updateLocalPreferredResidentsList](v22, "_updateLocalPreferredResidentsList");
      }
      v26 = -[HMDResidentSelectionMode _preferredResidentsListFromElectorUpdated](self, "_preferredResidentsListFromElectorUpdated");
      objc_msgSend(v11, "electorsPreferredResidentsList");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentSelectionMode setPreferredResidentsListFromElector:](self, "setPreferredResidentsListFromElector:", v27);

      if (v14 || v26)
      {
        v28 = -[HMDResidentSelectionMode _statusDebounceInterval](self, "_statusDebounceInterval");
        v30 = v29;
        v31 = (void *)MEMORY[0x227676638](v28);
        v32 = self;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v39 = v34;
          v40 = 2048;
          v41 = v30;
          v42 = 2112;
          v43 = v35;
          v44 = 2112;
          v45 = v36;
          _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Kicking off debounce for taking over evaluation in %f. Reachability changed: %@. Preferred Residents list updated: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v31);
        -[HMDResidentSelectionMode _rescheduleTakeOverIfPrimaryIsNotViableTimerWithTimeInterval:](v32, "_rescheduleTakeOverIfPrimaryIsNotViableTimerWithTimeInterval:", v30);
      }
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
        *(_DWORD *)buf = 138543362;
        v39 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@We are not connected per the latest resident status update, not acting on this update.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDResidentSelectionMode cancelAllTakeOverTimers](v16, "cancelAllTakeOverTimers");
    }
  }

}

- (id)dumpState
{
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = -[HMDResidentSelectionMode currentModeType](self, "currentModeType");
  if (v5 - 1 > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_24E793DC0[v5 - 1];
  v7 = v6;
  -[HMDResidentSelectionMode residentSelectionInfoFromWorkingStore](self, "residentSelectionInfoFromWorkingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Mode: %@, Working store info: %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("State"));

  -[HMDResidentSelectionMode localPreferredResidentsList](self, "localPreferredResidentsList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "residentIDSIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "residentDevicesWithIDSIdentifiers:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "modifiedTimestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localTimeDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("Local Preferred Residents Timestamp"));

  objc_msgSend(v13, "na_map:", &__block_literal_global_35914);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("Local Preferred Residents"));

  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v11, "presentResidentsStatuses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "residentIDSIdentifierToLocationMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR(" %@"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("Resident Location map"));

  return v3;
}

- (NSSet)locallyReachableResidents
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (BOOL)residentIsLocallyReachable:(id)a3
{
  return 0;
}

- (NSArray)sortedResidents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDResidentSelectionMode *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionMode context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledResidents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentSelectionMode _sortResidentsUsingAllCriteria:](self, "_sortResidentsUsingAllCriteria:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Residents after sorting: %@.", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);

  return (NSArray *)v6;
}

- (id)_sortResidentsByLatestVersionLowestUUID:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_49_35906);
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDResidentSelectionMode context](self, "context");
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

- (id)userPreferredResidentPerSelectionInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "preferredResidentIDSIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDResidentSelectionMode context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "residentDeviceWithIDSIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)newPrimaryIsInREv2BasedOnTheirTimestamp:(id)a3 ourSelectionInfo:(id)a4
{
  BOOL v4;
  void *v5;

  if (a3)
    return 0;
  objc_msgSend(a4, "selectionTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5 != 0;

  return v4;
}

- (id)_highestVersionLowestUUIDResident
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDResidentSelectionMode context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableResidentDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode _sortResidentsByLatestVersionLowestUUID:](self, "_sortResidentsByLatestVersionLowestUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)handleMeshInformationRequest:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  HMDResidentSelectionMode *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDResidentSelectionMode *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDResidentSelectionMode *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  const char *v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _QWORD v47[5];
  _QWORD v48[7];

  v48[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDResidentSelectionMode context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "destination");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v36;
      v43 = 2112;
      v44 = v37;
      v38 = "%{public}@Responding with error to mesh information request from: %@ due to missing context.";
LABEL_14:
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, v38, buf, 0x16u);

    }
LABEL_15:

    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v11);
    goto LABEL_16;
  }
  objc_msgSend(v5, "currentResidentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "destination");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v36;
      v43 = 2112;
      v44 = v37;
      v38 = "%{public}@Ignoring mesh information request from: %@ since we are not a resident.";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v40 = v4;
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enabledResidents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "primaryResidentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    -[HMDResidentSelectionMode _highestVersionLowestUUIDResident](self, "_highestVersionLowestUUIDResident");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = v6;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v21;
      v43 = 2112;
      v44 = v16;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Using resident: %@ for the leader for the mesh information request since we do not have a primary.", buf, 0x16u);

      v6 = v20;
    }

    objc_autoreleasePoolPop(v17);
  }
  objc_msgSend(v16, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v47[0] = CFSTR("r");
  v39 = v6;
  objc_msgSend(v6, "currentResidentDevice");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "UUIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v26;
  v48[1] = v11;
  v47[1] = CFSTR("rip");
  v47[2] = CFSTR("res");
  v48[2] = v15;
  v48[3] = v23;
  v47[3] = CFSTR("l");
  v47[4] = CFSTR("p");
  v48[4] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x227676638]();
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destination");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v31;
    v43 = 2112;
    v44 = v32;
    v45 = 2112;
    v46 = v27;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Handling mesh information request from: %@ and responding with: %@.", buf, 0x20u);

    v4 = v40;
  }

  objc_autoreleasePoolPop(v28);
  objc_msgSend(v4, "respondWithPayload:", v27);

  v6 = v39;
LABEL_16:

}

- (BOOL)shouldRegeneratePreferredResidentsListBasedOnFoundResidents:(id)a3 residentLocationMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    -[HMDResidentSelectionMode localPreferredResidentsList](self, "localPreferredResidentsList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "residentIDSIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __108__HMDResidentSelectionMode_shouldRegeneratePreferredResidentsListBasedOnFoundResidents_residentLocationMap___block_invoke;
    v13[3] = &unk_24E77B970;
    v14 = v7;
    v10 = v9;
    v15 = v10;
    v16 = &v17;
    objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
    v11 = *((_BYTE *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_rescheduleTakeOverIfPrimaryIsNotViableTimerWithTimeInterval:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HMDResidentSelectionMode takeOverIfPrimaryIsNotViableTimer](self, "takeOverIfPrimaryIsNotViableTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suspend");

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, a3);
  -[HMDResidentSelectionMode setTakeOverIfPrimaryIsNotViableTimer:](self, "setTakeOverIfPrimaryIsNotViableTimer:", v6);

  -[HMDResidentSelectionMode takeOverIfPrimaryIsNotViableTimer](self, "takeOverIfPrimaryIsNotViableTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[HMDResidentSelectionMode queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode takeOverIfPrimaryIsNotViableTimer](self, "takeOverIfPrimaryIsNotViableTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegateQueue:", v8);

  -[HMDResidentSelectionMode takeOverIfPrimaryIsNotViableTimer](self, "takeOverIfPrimaryIsNotViableTimer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

}

- (void)handleTakeOverIfPrimaryIsNotViableTimerFired
{
  void *v3;
  HMDResidentSelectionMode *v4;
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Takeover if better than the current primary timer fired.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDResidentSelectionMode takeOverIfPrimaryIsNotViableWithIsTimerTriggered:](v4, "takeOverIfPrimaryIsNotViableWithIsTimerTriggered:", 1);
}

- (BOOL)takeOverIfPrimaryIsNotViableWithIsTimerTriggered:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  HMDResidentSelectionMode *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HMDResidentSelectionMode *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  char v20;
  void *v21;
  BOOL v22;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionMode context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isActingAsResident") & 1) != 0)
  {
    if (objc_msgSend(v5, "blockPrimaryTakeover"))
    {
      v6 = MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v9;
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Primary takeover is blocked (isTimerTriggered: %@)", (uint8_t *)&v25, 0x16u);

      }
      v11 = (void *)v6;
      goto LABEL_17;
    }
    objc_msgSend(v5, "residentStatusChannel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isConnected");

    if ((v20 & 1) != 0)
    {
      objc_msgSend(v5, "residentSelectionInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HMDResidentSelectionMode shouldTakeOverAsTheCurrentPrimaryWithSelectionInfo:isTimerTriggered:](self, "shouldTakeOverAsTheCurrentPrimaryWithSelectionInfo:isTimerTriggered:", v21, v3))
      {
        if (!-[HMDResidentSelectionMode hasViablePrimaryResidentWithSelectionInfo:](self, "hasViablePrimaryResidentWithSelectionInfo:", v21))
        {
          objc_msgSend(v21, "selectionTimestamp");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDResidentSelectionMode takeOverWithSelectionTimestamp:](self, "takeOverWithSelectionTimestamp:", v24);

          v22 = 1;
          goto LABEL_20;
        }
        -[HMDResidentSelectionMode _rescheduleTakeOverTimer](self, "_rescheduleTakeOverTimer");
      }
      v22 = 0;
LABEL_20:

      goto LABEL_18;
    }
    v12 = MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v15;
      v16 = "%{public}@Not taking over as we are not connected to StatusKit";
      v17 = v14;
      v18 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_15;
    }
  }
  else
  {
    v12 = MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v15;
      v16 = "%{public}@Evaluating becoming the primary on non-resident";
      v17 = v14;
      v18 = OS_LOG_TYPE_ERROR;
LABEL_15:
      _os_log_impl(&dword_2218F0000, v17, v18, v16, (uint8_t *)&v25, 0xCu);

    }
  }

  v11 = (void *)v12;
LABEL_17:
  objc_autoreleasePoolPop(v11);
  v22 = 0;
LABEL_18:

  return v22;
}

- (double)_takeOverTimerInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HMDResidentSelectionMode idsServerBag](self, "idsServerBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentSelectionTakeOverInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 7200.0;
  }

  return v5;
}

- (void)_rescheduleTakeOverTimer
{
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  HMDResidentSelectionMode *v7;
  NSObject *v8;
  void *v9;
  void *v10;
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
  v3 = -[HMDResidentSelectionMode _takeOverTimerInterval](self, "_takeOverTimerInterval");
  v5 = v4;
  v6 = (void *)MEMORY[0x227676638](v3);
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v9;
    v18 = 2048;
    v19 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Rescheduling take over time in %f", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDResidentSelectionMode takeOverTimer](v7, "takeOverTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suspend");

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, v5);
  -[HMDResidentSelectionMode setTakeOverTimer:](v7, "setTakeOverTimer:", v11);

  -[HMDResidentSelectionMode takeOverTimer](v7, "takeOverTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", v7);

  -[HMDResidentSelectionMode queue](v7, "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode takeOverTimer](v7, "takeOverTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegateQueue:", v13);

  -[HMDResidentSelectionMode takeOverTimer](v7, "takeOverTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resume");

}

- (void)handleTakeOverTimerFired
{
  void *v3;
  HMDResidentSelectionMode *v4;
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Takeover timer fired.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDResidentSelectionMode takeOverIfConditionsAreMetWithIsTimerTriggered:](v4, "takeOverIfConditionsAreMetWithIsTimerTriggered:", 1);
}

- (BOOL)takeOverIfConditionsAreMetWithIsTimerTriggered:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  HMDResidentSelectionMode *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionMode context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isActingAsResident") & 1) != 0)
  {
    objc_msgSend(v5, "residentSelectionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = -[HMDResidentSelectionMode shouldTakeOverAsTheCurrentPrimaryWithSelectionInfo:isTimerTriggered:](self, "shouldTakeOverAsTheCurrentPrimaryWithSelectionInfo:isTimerTriggered:", v6, v3);
    if ((_DWORD)v3)
    {
      objc_msgSend(v6, "selectionTimestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentSelectionMode takeOverWithSelectionTimestamp:](self, "takeOverWithSelectionTimestamp:", v7);

    }
  }
  else
  {
    v3 = MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Evaluating becoming the primary on non-resident", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop((void *)v3);
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)takeOverWithSelectionTimestamp:(id)a3
{
  id v4;
  void *v5;
  HMDResidentSelectionMode *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Taking over as the current primary.", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDResidentSelectionMode delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode context](v6, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentResidentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "idsIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primarySelectionMode:didReceivePrimaryResidentIdsIdentifier:selectionTimestamp:", v6, v13, v4);

  -[HMDResidentSelectionMode cancelAllTakeOverTimers](v6, "cancelAllTakeOverTimers");
}

- (void)cancelAllTakeOverTimers
{
  void *v3;
  void *v4;

  -[HMDResidentSelectionMode takeOverTimer](self, "takeOverTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDResidentSelectionMode setTakeOverTimer:](self, "setTakeOverTimer:", 0);
  -[HMDResidentSelectionMode takeOverIfPrimaryIsNotViableTimer](self, "takeOverIfPrimaryIsNotViableTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspend");

  -[HMDResidentSelectionMode setTakeOverIfPrimaryIsNotViableTimer:](self, "setTakeOverIfPrimaryIsNotViableTimer:", 0);
}

- (BOOL)hasViablePrimaryResidentWithSelectionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  HMDResidentSelectionMode *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  int v18;
  HMDResidentSelectionMode *v19;
  _BOOL4 v20;
  void *v21;
  BOOL v22;
  HMDResidentSelectionMode *v23;
  void *v24;
  void *v25;
  id v27;
  void *context;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentSelectionMode context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentStatusChannel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPrimaryResident");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentResidentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "swVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isReachable");
  -[HMDResidentSelectionMode userPreferredResidentPerSelectionInfo:](self, "userPreferredResidentPerSelectionInfo:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "isCurrentDevice"))
  {
    context = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      v16 = "%{public}@Should take over since we are the user preferred and hence better than the current primary.";
LABEL_10:
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (!v7)
  {
    context = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      v16 = "%{public}@Should take over since the current primary is not reachable.";
      goto LABEL_10;
    }
LABEL_11:
    v22 = 0;
    goto LABEL_21;
  }
  v27 = v4;
  v17 = v10;
  v18 = objc_msgSend(v11, "isAtLeastVersion:", v10);
  context = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v18)
  {
    v10 = v17;
    if ((v12 & 1) != 0)
    {
      if (v20)
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v24;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Should take over since the current primary is not better than us.", buf, 0xCu);

      }
      v22 = 0;
    }
    else
    {
      if (v20)
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v25;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Should not take over since we are not reachable.", buf, 0xCu);

      }
      v22 = 1;
    }
    goto LABEL_20;
  }
  if (!v20)
  {
    v22 = 1;
    v10 = v17;
LABEL_20:
    v4 = v27;
    goto LABEL_21;
  }
  HMFGetLogIdentifier();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543874;
  v31 = v21;
  v32 = 2112;
  v33 = v11;
  v34 = 2112;
  v10 = v17;
  v35 = v17;
  _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Should not take over since the current primary version: %@ is same or better than ours: %@.", buf, 0x20u);

  v22 = 1;
  v4 = v27;
LABEL_21:

  objc_autoreleasePoolPop(context);
  return v22;
}

- (void)_evaluatePrimaryChangedReason
{
  void *v3;
  void *v4;
  id v5;

  -[HMDResidentSelectionMode context](self, "context");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentSelectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode residentSelectionInfoFromWorkingStore](self, "residentSelectionInfoFromWorkingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode _evaluatePrimaryChangedReasonForCurrentSelectionInfo:previousSelectionInfo:](self, "_evaluatePrimaryChangedReasonForCurrentSelectionInfo:previousSelectionInfo:", v3, v4);

}

- (BOOL)shouldTakeOverAsTheCurrentPrimaryWithSelectionInfo:(id)a3 isTimerTriggered:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  HMDResidentSelectionMode *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  HMDResidentSelectionMode *v20;
  NSObject *v21;
  void *v22;
  void *v24;
  _BOOL4 v25;
  void *v26;
  HMDResidentSelectionMode *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDResidentSelectionMode context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isActingAsResident"))
  {
    -[HMDResidentSelectionMode userPreferredResidentPerSelectionInfo:](self, "userPreferredResidentPerSelectionInfo:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "availableResidentDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v4)
      -[HMDResidentSelectionMode _evaluatePrimaryChangedReason](self, "_evaluatePrimaryChangedReason");
    objc_msgSend(v7, "residentStatusChannel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isConnected");

    if (v10 >= 2 && (v12 & 1) == 0)
    {
      v13 = MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        v17 = (void *)v13;
LABEL_10:
        objc_autoreleasePoolPop(v17);
        v18 = 0;
LABEL_17:

        goto LABEL_18;
      }
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Should not take over as the current primary since there are other residents and we are not connected.", (uint8_t *)&v33, 0xCu);
LABEL_8:

      goto LABEL_9;
    }
    if (objc_msgSend(v8, "isCurrentDevice"))
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543362;
        v34 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Should take over as the current primary since we are the user preferred.", (uint8_t *)&v33, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
    }
    else
    {
      if (objc_msgSend(v8, "isReachable")
        && -[HMDResidentSelectionMode _isViableUserPreferredResident:](self, "_isViableUserPreferredResident:", v8))
      {
        v13 = MEMORY[0x227676638]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_9;
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v16;
        v35 = 2112;
        v36 = v24;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Should not take over as the current primary since the user preferred resident: %@ is viable.", (uint8_t *)&v33, 0x16u);

        goto LABEL_8;
      }
      v25 = -[HMDResidentSelectionMode _shouldTakeOverBasedOnReachability](self, "_shouldTakeOverBasedOnReachability");
      v26 = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      if (!v25)
      {
        if (v29)
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          StringFromHMDResidentLocation(objc_msgSend(v7, "myLocation"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543618;
          v34 = v31;
          v35 = 2112;
          v36 = v32;
          _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Should not take over as the current primary since none of the conditions apply. Our location: %@", (uint8_t *)&v33, 0x16u);

        }
        v17 = v26;
        goto LABEL_10;
      }
      if (v29)
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543362;
        v34 = v30;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Should take over as the current primary since all residents above me in the list are unreachable.", (uint8_t *)&v33, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
      if (v4)
        -[HMDResidentSelectionMode setPrimaryChangedReason:](v27, "setPrimaryChangedReason:", 3);
    }
    v18 = 1;
    goto LABEL_17;
  }
  v18 = 0;
LABEL_18:

  return v18;
}

- (BOOL)_isViableUserPreferredResident:(id)a3
{
  id v4;
  unint64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[HMDResidentSelectionMode locationOfResident:](self, "locationOfResident:", v4);
  if (v5 == 300
    || -[HMDResidentSelectionMode _allResidentsHaveSameLocationStatus:](self, "_allResidentsHaveSameLocationStatus:", v5))
  {
    v6 = 1;
  }
  else
  {
    -[HMDResidentSelectionMode context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "residentStatusChannel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentPrimaryResident");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "idsIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "idsIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "hmf_isEqualToUUID:", v12);

  }
  return v6;
}

- (BOOL)_shouldTakeOverBasedOnReachability
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDResidentSelectionMode *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionMode context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "electorsPreferredResidentsList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentIDSIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentSelectionMode residentsNotPresentInPreferredResidentsList:](self, "residentsNotPresentInPreferredResidentsList:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__HMDResidentSelectionMode__shouldTakeOverBasedOnReachability__block_invoke;
  v16[3] = &unk_24E795268;
  v8 = v7;
  v17 = v8;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v16);
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Preferred Residents: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v14 = -[HMDResidentSelectionMode allResidentsAboveMeAreUnreachableIn:](v11, "allResidentsAboveMeAreUnreachableIn:", v9);

  return v14;
}

- (BOOL)allResidentsAboveMeAreUnreachableIn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  HMDResidentSelectionMode *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  -[HMDResidentSelectionMode context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentResidentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "idsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "residentsPresentOnStatusKit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __64__HMDResidentSelectionMode_allResidentsAboveMeAreUnreachableIn___block_invoke;
  v22[3] = &unk_24E77A378;
  v10 = v8;
  v23 = v10;
  v11 = v9;
  v24 = v11;
  v25 = &v26;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v22);
  objc_msgSend(v4, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v10);

  v14 = *((unsigned __int8 *)v27 + 24);
  if (*((_BYTE *)v27 + 24))
    v15 = v13;
  else
    v15 = 0;
  if (v15 == 1)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Taking over as the current primary since we are on top of the preferred residents list.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v14 = *((unsigned __int8 *)v27 + 24);
  }
  v20 = v14 != 0;

  _Block_object_dispose(&v26, 8);
  return v20;
}

- (id)residentsNotPresentInPreferredResidentsList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "residentsPresentOnStatusKit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __72__HMDResidentSelectionMode_residentsNotPresentInPreferredResidentsList___block_invoke;
  v25[3] = &unk_24E77A3A0;
  v9 = v4;
  v26 = v9;
  v10 = v5;
  v27 = v10;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);

  objc_msgSend(v6, "availableResidentDevices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v19 = v8;
  v20 = 3221225472;
  v21 = __72__HMDResidentSelectionMode_residentsNotPresentInPreferredResidentsList___block_invoke_2;
  v22 = &unk_24E77A3C8;
  v23 = v9;
  v24 = v10;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v19);
  objc_msgSend(v13, "allObjects", v19, v20, v21, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "residentDevicesWithIDSIdentifiers:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentSelectionMode _sortResidentsByLatestVersionLowestUUID:](self, "_sortResidentsByLatestVersionLowestUUID:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (unint64_t)_preferredResidentsListMaxSize
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDResidentSelectionMode idsServerBag](self, "idsServerBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentSelectionPreferredResidentsListMaxSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && objc_msgSend(v3, "unsignedIntValue"))
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 10;

  return v4;
}

- (id)_generatePreferredResidentsList
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  HMDPreferredResidentsList *v10;
  void *v11;
  HMDPreferredResidentsList *v12;
  _QWORD v14[4];
  id v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode sortedResidents](self, "sortedResidents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__HMDResidentSelectionMode__generatePreferredResidentsList__block_invoke;
  v14[3] = &unk_24E795268;
  v15 = v3;
  v5 = v3;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);

  v6 = objc_msgSend(v5, "count");
  v7 = -[HMDResidentSelectionMode _preferredResidentsListMaxSize](self, "_preferredResidentsListMaxSize");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  objc_msgSend(v5, "subarrayWithRange:", 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [HMDPreferredResidentsList alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDPreferredResidentsList initWithResidentIDSIdentifiers:modifiedTimestamp:](v10, "initWithResidentIDSIdentifiers:modifiedTimestamp:", v9, v11);

  return v12;
}

- (BOOL)_preferredResidentsListFromElectorUpdated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HMDResidentSelectionMode context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode preferredResidentsListFromElector](self, "preferredResidentsListFromElector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDResidentSelectionMode preferredResidentsListFromElector](self, "preferredResidentsListFromElector");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "electorsPreferredResidentsList");
  }
  else
  {
    objc_msgSend(v3, "electorsPreferredResidentsList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentSelectionMode localPreferredResidentsList](self, "localPreferredResidentsList");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7 ^ 1;
}

- (void)handleWeAreSelectedAsThePreferredPrimaryWithSelectionTimestamp:(id)a3 selectionMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDResidentSelectionMode *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
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
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@We are selected as the new preferred.", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDResidentSelectionMode residentSelectionInfoWithOurselvesAsThePreferredWithTimestamp:](v9, "residentSelectionInfoWithOurselvesAsThePreferredWithTimestamp:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode handleWeAreSelectedAsThePreferredPrimaryWithInfo:selectionMessage:](v9, "handleWeAreSelectedAsThePreferredPrimaryWithInfo:selectionMessage:", v12, v7);

}

- (void)handleWeAreSelectedAsThePreferredPrimaryWithInfo:(id)a3 selectionMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  -[HMDResidentSelectionMode delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentResidentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __94__HMDResidentSelectionMode_handleWeAreSelectedAsThePreferredPrimaryWithInfo_selectionMessage___block_invoke;
  v12[3] = &unk_24E79BCC8;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v8, "primarySelectionMode:didSelectPrimaryResident:selectionInfo:selectionLogEvent:completion:", self, v10, v7, 0, v12);

}

- (id)residentSelectionInfoWithOurselvesAsThePreferredWithTimestamp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDResidentSelectionInfo *v9;

  v4 = a3;
  if (-[HMDResidentSelectionMode currentModeType](self, "currentModeType") == 2)
  {
    -[HMDResidentSelectionMode context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentResidentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v9 = -[HMDResidentSelectionInfo initWithPreferredResidentIDSIdentifier:currentResidentSelectionModeType:selectionTimestamp:]([HMDResidentSelectionInfo alloc], "initWithPreferredResidentIDSIdentifier:currentResidentSelectionModeType:selectionTimestamp:", v8, -[HMDResidentSelectionMode currentModeType](self, "currentModeType"), v4);

  return v9;
}

- (id)backupsForResident:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDResidentSelectionMode *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentSelectionMode sortedResidents](self, "sortedResidents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "removeObject:", v4);
  }
  else
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@There are no residents available to act as a backup.", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (void)deregisterForMessages
{
  void *v3;
  id v4;

  -[HMDResidentSelectionMode context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

}

- (void)scheduleDailyPreferredResidentsListRegenerationTask
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  HMDResidentSelectionMode *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  HMDResidentSelectionMode *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionMode context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActingAsResident");

  if ((v4 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      v12 = "%{public}@Scheduling preferred resident list regen task on non-resident";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v8);
    return;
  }
  -[HMDResidentSelectionMode backgroundTaskManager](self, "backgroundTaskManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode backgroundTaskIdentifier](self, "backgroundTaskIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasOutstandingTaskWithIdentifier:", v6);

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      v12 = "%{public}@Not scheduling the task to regenerate the preferred list because there is an outstanding one.";
      v13 = v10;
      v14 = OS_LOG_TYPE_INFO;
LABEL_7:
      _os_log_impl(&dword_2218F0000, v13, v14, v12, buf, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  -[HMDResidentSelectionMode _nextResidentsListGenerationDate](self, "_nextResidentsListGenerationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode backgroundTaskManager](self, "backgroundTaskManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode backgroundTaskIdentifier](self, "backgroundTaskIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v16, "scheduleTaskWithIdentifier:fireDate:onObserver:selector:error:", v17, v15, self, sel_handleDailyPreferredResidentsListRegenerationNotification_, &v23);
  v18 = v23;

  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v22;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Scheduled a background task for preferred residents list regeneration for: %@.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);

}

- (unint64_t)preferredListGenerationStartHour
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDResidentSelectionMode idsServerBag](self, "idsServerBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentSelectionPreferredListGenerationStartHour");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 1;

  return v4;
}

- (unint64_t)preferredListGenerationEndHour
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDResidentSelectionMode idsServerBag](self, "idsServerBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentSelectionPreferredListGenerationEndHour");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 6;

  return v4;
}

- (id)_nextResidentsListGenerationDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  HMDResidentSelectionMode *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceForKey:", CFSTR("rsPreferredListGenInterval"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  if (v6 <= 0.0)
  {
    v8 = -[HMDResidentSelectionMode preferredListGenerationEndHour](self, "preferredListGenerationEndHour");
    v9 = -[HMDResidentSelectionMode preferredListGenerationStartHour](self, "preferredListGenerationStartHour");
    v10 = -[HMDResidentSelectionMode preferredListGenerationEndHour](self, "preferredListGenerationEndHour");
    if (v10 < -[HMDResidentSelectionMode preferredListGenerationStartHour](self, "preferredListGenerationStartHour")
      || (v11 = 86400 * (v8 - v9), v11 > 0x15180))
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138544130;
        v26 = v15;
        v27 = 2048;
        v28 = 18000;
        v29 = 2048;
        v30 = -[HMDResidentSelectionMode preferredListGenerationStartHour](v13, "preferredListGenerationStartHour");
        v31 = 2048;
        v32 = -[HMDResidentSelectionMode preferredListGenerationEndHour](v13, "preferredListGenerationEndHour");
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Overriding to default allowedGenerationIntervalSeconds value %zu due to startHour=%zu, endHour=%zu", (uint8_t *)&v25, 0x2Au);

      }
      objc_autoreleasePoolPop(v12);
      v11 = 18000;
    }
    -[HMDResidentSelectionMode context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hmf_bytesAsData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = HMDTruncatedHash(v19);

    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "nextDateAfterDate:matchingHour:minute:second:options:", v22, -[HMDResidentSelectionMode preferredListGenerationStartHour](self, "preferredListGenerationStartHour"), 0, 0, 1024);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "addTimeInterval:", (double)(v20 % v11));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)handleDailyPreferredResidentsListRegenerationNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDResidentSelectionMode *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("HMD.BGTM.NK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentSelectionMode backgroundTaskIdentifier](self, "backgroundTaskIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HMFEqualObjects();

  if (v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Preferred residents list regeneration task fired.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDResidentSelectionMode queue](v10, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__HMDResidentSelectionMode_handleDailyPreferredResidentsListRegenerationNotification___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = v10;
    dispatch_async(v13, block);

  }
}

- (void)_publishElectorsList
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMDResidentSelectionMode *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionMode context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "electorsPreferredResidentsList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "residentIDSIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

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
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Publishing the preferred residents list from elector: %@.", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDResidentSelectionMode _publishPreferredResidentsList:](v8, "_publishPreferredResidentsList:", v4);
  }
  else
  {
    -[HMDResidentSelectionMode _updateLocalPreferredResidentsList](self, "_updateLocalPreferredResidentsList");
  }

}

- (BOOL)_updateLocalPreferredResidentsList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDResidentSelectionMode *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  void *v14;
  HMDResidentSelectionMode *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentSelectionMode localPreferredResidentsList](self, "localPreferredResidentsList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode _generatePreferredResidentsList](self, "_generatePreferredResidentsList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3
    && (objc_msgSend(v4, "residentIDSIdentifiers"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "residentIDSIdentifiers"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqualToArray:", v7),
        v7,
        v6,
        v8))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Local preferred residents list is already up to date", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating local preferred residents list: %@.", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDResidentSelectionMode _publishPreferredResidentsList:](v15, "_publishPreferredResidentsList:", v5);
    v13 = 1;
  }

  return v13;
}

- (void)_publishPreferredResidentsList:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  HMDResidentSelectionMode *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentSelectionMode context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActingAsResident");

  if ((v6 & 1) != 0)
  {
    -[HMDResidentSelectionMode setLocalPreferredResidentsList:](self, "setLocalPreferredResidentsList:", v4);
    -[HMDResidentSelectionMode delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "primarySelectionMode:didUpdatePreferredResidentsList:", self, v4);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not publishing the preferred residents list since we are not acting as a resident.", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (id)preferredResidentsRemovedFromHome
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDResidentSelectionMode *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  HMDResidentSelectionMode *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentSelectionMode context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "electorsPreferredResidentsList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentIDSIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __61__HMDResidentSelectionMode_preferredResidentsRemovedFromHome__block_invoke;
  v17 = &unk_24E77A3A0;
  v18 = self;
  v7 = v3;
  v19 = v7;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v14);

  if (objc_msgSend(v7, "count", v14, v15, v16, v17, v18))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Residents that should be removed from the Preferred Residents List are: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_sortResidentsUsingAllCriteria:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__HMDResidentSelectionMode__sortResidentsUsingAllCriteria___block_invoke;
  v4[3] = &unk_24E7988D8;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_allResidentsHaveSameLocationStatus:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v10[5];

  -[HMDResidentSelectionMode context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentResidentsStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentIDSIdentifierToLocationMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __64__HMDResidentSelectionMode__allResidentsHaveSameLocationStatus___block_invoke;
    v10[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
    v10[4] = a3;
    v8 = objc_msgSend(v7, "na_all:", v10);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (unint64_t)locationOfResident:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  int v16;

  v4 = a3;
  -[HMDResidentSelectionMode context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentResidentsStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "residentIDSIdentifierToLocationMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "idsIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

  }
  else
  {
    objc_msgSend(v5, "currentResidentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", v4);

    if (v16)
      v14 = objc_msgSend(v5, "myLocation");
    else
      v14 = 100;
  }

  return v14;
}

- (int64_t)compareLocationResident1:(id)a3 resident2:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a4;
  v7 = -[HMDResidentSelectionMode locationOfResident:](self, "locationOfResident:", a3);
  v8 = -[HMDResidentSelectionMode locationOfResident:](self, "locationOfResident:", v6);

  v9 = -1;
  v10 = 1;
  v11 = -1;
  v12 = 1;
  if (v7 == 200)
    v13 = -1;
  else
    v13 = 1;
  if (v8 != 100)
    v12 = v13;
  if (v7 != 100)
    v11 = v12;
  if (v8 != 300)
    v10 = v11;
  if (v7 != 300)
    v9 = v10;
  if (v7 == v8)
    return 0;
  else
    return v9;
}

- (int64_t)compareProductTypeResident1:(id)a3 resident2:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDResidentSelectionMode *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDResidentSelectionMode *v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDResidentSelectionMode productTypePreferenceList](self, "productTypePreferenceList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "productType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "indexOfObject:", v9);

  -[HMDResidentSelectionMode productTypePreferenceList](self, "productTypePreferenceList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "productType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "indexOfObject:", v12);

  -[HMDResidentSelectionMode productTypePreferenceList](self, "productTypePreferenceList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "indexOfObject:", &unk_24E96A958);

  if (v10 == v15)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v19;
      v28 = 2112;
      v29 = v20;
LABEL_7:
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Could not find the product type for: %@", (uint8_t *)&v26, 0x16u);

    }
  }
  else
  {
    if (v13 != v15)
      goto LABEL_9;
    v16 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v19;
      v28 = 2112;
      v29 = v20;
      goto LABEL_7;
    }
  }

  objc_autoreleasePoolPop(v16);
LABEL_9:
  v22 = -1;
  if (v10 < v13)
    v23 = -1;
  else
    v23 = 1;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    v22 = v23;
  if (v10 == v13)
    v24 = 0;
  else
    v24 = v22;

  return v24;
}

- (int64_t)compareNetworkConnectionResident1:(id)a3 resident2:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int64_t v15;

  v6 = a4;
  v7 = a3;
  -[HMDResidentSelectionMode wiredResidentIDSIdentifiers](self, "wiredResidentIDSIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "idsIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "containsObject:", v10);

  objc_msgSend(v6, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "idsIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "containsObject:", v13);

  if (v11 ^ 1 | v14)
    v15 = (v11 ^ 1) & v14;
  else
    v15 = -1;

  return v15;
}

- (id)wiredResidentIDSIdentifiers
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

  v3 = (void *)MEMORY[0x24BDBCEF0];
  -[HMDResidentSelectionMode context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentResidentsStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wiredResidentIDSIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentSelectionMode context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentResidentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "idsIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isActingAsResident")
    && (objc_msgSend(v7, "containsObject:", v11) & 1) == 0
    && objc_msgSend(v8, "ourNetworkConnectionType") == 1)
  {
    objc_msgSend(v7, "addObject:", v11);
  }
  v12 = (void *)objc_msgSend(v7, "copy");

  return v12;
}

- (id)productTypePreferenceList
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24E96A970, &unk_24E96A988, &unk_24E96A9A0, &unk_24E96A9B8, &unk_24E96A9D0, &unk_24E96A9E8, &unk_24E96AA00, &unk_24E96AA18, &unk_24E96AA30, &unk_24E96A958, 0);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDResidentSelectionMode takeOverIfPrimaryIsNotViableTimer](self, "takeOverIfPrimaryIsNotViableTimer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    -[HMDResidentSelectionMode handleTakeOverIfPrimaryIsNotViableTimerFired](self, "handleTakeOverIfPrimaryIsNotViableTimerFired");
    goto LABEL_5;
  }
  -[HMDResidentSelectionMode takeOverTimer](self, "takeOverTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 == v7)
  {
    -[HMDResidentSelectionMode handleTakeOverTimerFired](self, "handleTakeOverTimerFired");
LABEL_5:
    v6 = v7;
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDResidentSelectionMode context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMDResidentSelectionModeDelegate)delegate
{
  return (HMDResidentSelectionModeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMDResidentDeviceManagerContext)context
{
  return (HMDResidentDeviceManagerContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (HMDResidentSelectionInfo)residentSelectionInfoFromWorkingStore
{
  return (HMDResidentSelectionInfo *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResidentSelectionInfoFromWorkingStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HMDPreferredResidentsList)localPreferredResidentsList
{
  return (HMDPreferredResidentsList *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalPreferredResidentsList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMDPreferredResidentsList)preferredResidentsListFromElector
{
  return (HMDPreferredResidentsList *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPreferredResidentsListFromElector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)selectionCompletion
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setSelectionCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSEnumerator)residentsEnumerator
{
  return (NSEnumerator *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResidentsEnumerator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (HMDBackgroundTaskManager)backgroundTaskManager
{
  return self->_backgroundTaskManager;
}

- (HMFTimer)takeOverIfPrimaryIsNotViableTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTakeOverIfPrimaryIsNotViableTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (HMFTimer)takeOverTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTakeOverTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDictionary)residentIDSIdentifierToLocationMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setResidentIDSIdentifierToLocationMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (unint64_t)primaryChangedReason
{
  return self->_primaryChangedReason;
}

- (void)setPrimaryChangedReason:(unint64_t)a3
{
  self->_primaryChangedReason = a3;
}

- (HMDResidentSelectionStatusKit)presentResidentsStatuses
{
  return (HMDResidentSelectionStatusKit *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPresentResidentsStatuses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (HMDIDSServerBag)idsServerBag
{
  return (HMDIDSServerBag *)objc_loadWeakRetained((id *)&self->_idsServerBag);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_idsServerBag);
  objc_storeStrong((id *)&self->_presentResidentsStatuses, 0);
  objc_storeStrong((id *)&self->_residentIDSIdentifierToLocationMap, 0);
  objc_storeStrong((id *)&self->_takeOverTimer, 0);
  objc_storeStrong((id *)&self->_takeOverIfPrimaryIsNotViableTimer, 0);
  objc_storeStrong((id *)&self->_backgroundTaskManager, 0);
  objc_storeStrong((id *)&self->_backgroundTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_residentsEnumerator, 0);
  objc_storeStrong(&self->_selectionCompletion, 0);
  objc_storeStrong((id *)&self->_preferredResidentsListFromElector, 0);
  objc_storeStrong((id *)&self->_localPreferredResidentsList, 0);
  objc_storeStrong((id *)&self->_residentSelectionInfoFromWorkingStore, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

BOOL __64__HMDResidentSelectionMode__allResidentsHaveSameLocationStatus___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unsignedIntegerValue") == *(_QWORD *)(a1 + 32);
}

uint64_t __59__HMDResidentSelectionMode__sortResidentsUsingAllCriteria___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "compareLocationResident1:resident2:", v5, v6);
  if (!v7)
  {
    objc_msgSend(v6, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "version");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "version");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "compare:", v11);

    if (!v7)
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "compareNetworkConnectionResident1:resident2:", v5, v6);
      if (!v7)
      {
        v7 = objc_msgSend(*(id *)(a1 + 32), "compareProductTypeResident1:resident2:", v5, v6);
        if (!v7)
        {
          objc_msgSend(v5, "device");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "idsIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "UUIDString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "device");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "idsIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v14, "compare:", v17);

        }
      }
    }
  }

  return v7;
}

void __61__HMDResidentSelectionMode_preferredResidentsRemovedFromHome__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDeviceWithIDSIdentifier:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

uint64_t __86__HMDResidentSelectionMode_handleDailyPreferredResidentsListRegenerationNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDResidentSelectionInfo *v13;
  void *v14;
  HMDResidentSelectionInfo *v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_updateLocalPreferredResidentsList");
  if (objc_msgSend(*(id *)(a1 + 32), "currentModeType") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "primaryResidentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isCurrentDevice");

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "preferredResidentsRemovedFromHome");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "residentSelectionInfoFromWorkingStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredResidentIDSIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "containsObject:", v7);

      if (v8)
      {
        v9 = (void *)MEMORY[0x227676638]();
        v10 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v25 = v12;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Preferred resident is removed while in Manual mode. Will force switch to Auto mode.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v9);
        v13 = [HMDResidentSelectionInfo alloc];
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[HMDResidentSelectionInfo initWithPreferredResidentIDSIdentifier:currentResidentSelectionModeType:selectionTimestamp:](v13, "initWithPreferredResidentIDSIdentifier:currentResidentSelectionModeType:selectionTimestamp:", 0, 3, v14);

        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 32);
        v19 = MEMORY[0x24BDAC760];
        v20 = 3221225472;
        v21 = __86__HMDResidentSelectionMode_handleDailyPreferredResidentsListRegenerationNotification___block_invoke_63;
        v22 = &unk_24E79BD80;
        v23 = v17;
        objc_msgSend(v16, "primarySelectionMode:didUpdateResidentSelectionInfo:completion:");

      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "scheduleDailyPreferredResidentsListRegenerationTask");
}

void __86__HMDResidentSelectionMode_handleDailyPreferredResidentsListRegenerationNotification___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Model update for switching from Manual to Auto mode completed.", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);

}

void __94__HMDResidentSelectionMode_handleWeAreSelectedAsThePreferredPrimaryWithInfo_selectionMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Completed selection with error: %@.", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v3);
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully completed selection.", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "respondWithSuccess");
  }

}

void __59__HMDResidentSelectionMode__generatePreferredResidentsList__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v8, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
}

void __72__HMDResidentSelectionMode_residentsNotPresentInPreferredResidentsList___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __72__HMDResidentSelectionMode_residentsNotPresentInPreferredResidentsList___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  v5 = (void *)v4;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v11, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "idsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "containsObject:", v8);

  if ((v6 & 1) == 0)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v11, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "idsIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

LABEL_4:
  }

}

void __64__HMDResidentSelectionMode_allResidentsAboveMeAreUnreachableIn___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    goto LABEL_4;
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_4:
    *a4 = 1;
  }

}

void __62__HMDResidentSelectionMode__shouldTakeOverBasedOnReachability__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

void __108__HMDResidentSelectionMode_shouldRegeneratePreferredResidentsListBasedOnFoundResidents_residentLocationMap___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  LODWORD(v7) = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6);
  if ((_DWORD)v7 && (v8 == 200 || v8 == 100))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

uint64_t __68__HMDResidentSelectionMode__sortResidentsByLatestVersionLowestUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
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
  void *v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  if (!v10)
  {
    objc_msgSend(v4, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "idsIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "idsIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "compare:", v16);

  }
  return v10;
}

uint64_t __37__HMDResidentSelectionMode_dumpState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortDescription");
}

uint64_t __88__HMDResidentSelectionMode_sendSelectionMessageToResident_requireAutoUpdate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleWeAreSelectedAsThePreferredPrimaryWithSelectionTimestamp:selectionMessage:", v3, 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __88__HMDResidentSelectionMode_sendSelectionMessageToResident_requireAutoUpdate_completion___block_invoke_31(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

void __60__HMDResidentSelectionMode_createSelectionMessageCompletion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__HMDResidentSelectionMode_createSelectionMessageCompletion__block_invoke_2;
  block[3] = &unk_24E79BBD0;
  v11 = v5;
  v12 = v6;
  v13 = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

void __60__HMDResidentSelectionMode_createSelectionMessageCompletion__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v5 = v3;

  v4 = *(void **)(a1 + 48);
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v4, "didFailResidentSelectionWithResident:error:", v5);
  else
    objc_msgSend(v4, "didSucceedResidentSelectionWithPreferred:", v5);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t66 != -1)
    dispatch_once(&logCategory__hmf_once_t66, &__block_literal_global_75_35962);
  return (id)logCategory__hmf_once_v67;
}

void __39__HMDResidentSelectionMode_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v67;
  logCategory__hmf_once_v67 = v0;

}

@end
