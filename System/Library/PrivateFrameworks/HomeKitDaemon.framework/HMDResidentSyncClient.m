@implementation HMDResidentSyncClient

- (HMDResidentSyncClient)initWithHome:(id)a3 codingModel:(id)a4 dispatcher:(id)a5 residentDeviceManager:(id)a6 notificationCenter:(id)a7 persistence:(id)a8 isResidentCapable:(BOOL)a9 dataSource:(id)a10 logEventSubmitter:(id)a11
{
  id v18;
  HMDResidentSyncClient *v19;
  HMDResidentSyncClient *v20;
  uint64_t v21;
  NSHashTable *requestsInProgress;
  uint64_t v23;
  HMFExponentialBackoffTimer *retryTimer;
  void *v25;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a5;
  v28 = a6;
  v27 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)HMDResidentSyncClient;
  v19 = -[HMDResidentSyncController initWithHome:codingModel:notificationCenter:persistence:](&v30, sel_initWithHome_codingModel_notificationCenter_persistence_, a3, a4, a7, a8);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dispatcher, a5);
    objc_storeStrong((id *)&v20->_residentDeviceManager, a6);
    objc_storeStrong((id *)&v20->_dataSource, a10);
    v20->_residentCapable = a9;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v21 = objc_claimAutoreleasedReturnValue();
    requestsInProgress = v20->_requestsInProgress;
    v20->_requestsInProgress = (NSHashTable *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F170]), "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", 2, 0, 10.0, 28800.0);
    retryTimer = v20->_retryTimer;
    v20->_retryTimer = (HMFExponentialBackoffTimer *)v23;

    -[HMFExponentialBackoffTimer setDelegate:](v20->_retryTimer, "setDelegate:", v20);
    objc_storeStrong((id *)&v20->_logEventSubmitter, a11);
    v25 = (void *)objc_opt_new();
    -[HMDManagedObjectContext setMergePolicy:](v20->super._context, "setMergePolicy:", v25);

    v20->_accessDeniedCount = 0;
  }

  return v20;
}

- (id)start
{
  HMDManagedObjectContext *context;
  void *v4;
  id WeakRetained;
  void *v6;
  HMFMessageDispatcher *dispatcher;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  context = self->super._context;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __30__HMDResidentSyncClient_start__block_invoke;
  v11[3] = &unk_24E78A388;
  v11[4] = self;
  objc_msgSend(MEMORY[0x24BE3F180], "inContext:perform:", context, v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._home);
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", WeakRetained, 3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  dispatcher = self->_dispatcher;
  v12[0] = v6;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](dispatcher, "registerForMessage:receiver:policies:selector:", CFSTR("HMDHomeDataChangedMessage"), self, v9, sel__handleHomeDataChanged_);

  -[NSNotificationCenter addObserver:selector:name:object:](self->super._notificationCenter, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentChanged_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), self->_residentDeviceManager);
  return v4;
}

- (void)stop
{
  -[HMFMessageDispatcher deregisterReceiver:](self->_dispatcher, "deregisterReceiver:", self);
  -[NSNotificationCenter removeObserver:](self->super._notificationCenter, "removeObserver:", self);
}

- (void)performSync
{
  HMDManagedObjectContext *context;
  _QWORD v3[5];

  context = self->super._context;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__HMDResidentSyncClient_performSync__block_invoke;
  v3[3] = &unk_24E79C240;
  v3[4] = self;
  -[HMDManagedObjectContext performBlock:](context, "performBlock:", v3);
}

- (void)handlePrimaryResidentChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  HMDManagedObjectContext *context;
  uint64_t *v10;
  void *v11;
  HMDResidentSyncClient *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  HMDResidentSyncClient *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  HMDResidentSyncClient *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (objc_msgSend(v8, "isCurrentDevice"))
  {
    context = self->super._context;
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __54__HMDResidentSyncClient_handlePrimaryResidentChanged___block_invoke;
    v23 = &unk_24E79C240;
    v24 = self;
    v10 = &v20;
LABEL_10:
    -[HMDManagedObjectContext performBlock:](context, "performBlock:", v10, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_11;
  }
  if (v8)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Primary resident changed, asking the new primary for an update", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    context = v12->super._context;
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __54__HMDResidentSyncClient_handlePrimaryResidentChanged___block_invoke_194;
    v18 = &unk_24E79C240;
    v19 = v12;
    v10 = &v15;
    goto LABEL_10;
  }
LABEL_11:

}

- (void)performResidentRequest:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  HMDRemoteHomeMessageDestination *v7;
  HMDRemoteHomeMessageDestination *v8;
  HMDRemoteHomeMessageDestination *v9;
  HMDRemoteHomeMessageDestination *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDManagedObjectContext *context;
  HMDRemoteHomeMessageDestination *v15;
  id v16;
  void *v17;
  HMDResidentSyncClient *v18;
  SEL v19;
  id v20;
  _QWORD v21[5];
  id v22;
  HMDRemoteHomeMessageDestination *v23;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "destination");
    v7 = (HMDRemoteHomeMessageDestination *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (!v9)
    {
      v10 = [HMDRemoteHomeMessageDestination alloc];
      objc_msgSend(v6, "destination");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "target");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HMDRemoteHomeMessageDestination initWithTarget:homeUUID:](v10, "initWithTarget:homeUUID:", v12, self->super._homeUUID);

    }
    v13 = (void *)MEMORY[0x24BE3F180];
    context = self->super._context;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke;
    v21[3] = &unk_24E796FD8;
    v21[4] = self;
    v22 = v6;
    v23 = v7;
    v15 = v7;
    v16 = v6;
    objc_msgSend(v13, "inContext:perform:", context, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "respondWithOutcomeOf:", v17);

  }
  else
  {
    v18 = (HMDResidentSyncClient *)_HMFPreconditionFailure();
    -[HMDResidentSyncClient timerDidFire:](v18, v19, v20);
  }
}

- (void)timerDidFire:(id)a3
{
  HMDManagedObjectContext *context;
  _QWORD v5[5];

  if (self->_retryTimer == a3)
  {
    objc_msgSend(a3, "suspend");
    context = self->super._context;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __38__HMDResidentSyncClient_timerDidFire___block_invoke;
    v5[3] = &unk_24E79C240;
    v5[4] = self;
    -[HMDManagedObjectContext performBlock:](context, "performBlock:", v5);
  }
}

- (id)retryTimer
{
  return self->_retryTimer;
}

- (void)_handleHomeDataChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  HMDResidentSyncClient *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  HMDManagedObjectContext *v17;
  BOOL v18;
  id v19;
  void *v20;
  HMDResidentSyncClient *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  HMDResidentSyncClient *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDResidentSyncClient *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *context;
  void *contexta;
  void *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "respondWithSuccess");
  objc_msgSend(v4, "remoteSourceDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "dataForKey:", CFSTR("etag"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuidForKey:", CFSTR("resgen"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateForKey:", CFSTR("seltimestamp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HMDResidentSyncController decodeToken:error:](self, "decodeToken:error:", v6, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[MKFResidentSyncMetadata lastSeenToken](self->_metadata, "lastSeenToken");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[HMDResidentSyncController changeToken:isAheadOf:](self, "changeToken:isAheadOf:", v9, v10);

        context = (void *)MEMORY[0x227676638]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
        if (v11)
        {
          if (v14)
          {
            HMFGetLogIdentifier();
            v37 = v7;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            HMDShortDescriptionForToken(v9);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v47 = v15;
            v48 = 2114;
            v49 = v16;
            _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Home data on resident has changed, saving last seen change token: %{public}@", buf, 0x16u);

            v7 = v37;
          }

          objc_autoreleasePoolPop(context);
          -[MKFResidentSyncMetadata setLastSeenToken:](self->_metadata, "setLastSeenToken:", v9);
          v17 = v12->super._context;
          v45 = 0;
          v18 = -[HMDManagedObjectContext save:](v17, "save:", &v45);
          v19 = v45;
          v20 = v19;
          if (!v18)
          {
            contexta = v19;
            v38 = (void *)MEMORY[0x227676638]();
            v21 = v12;
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v47 = v36;
              v48 = 2114;
              v49 = contexta;
              _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to save last seen change token, proceeding anyway: %{public}@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v38);
            v20 = contexta;
          }
          -[MKFResidentSyncMetadata willAccessValueForKey:](self->_metadata, "willAccessValueForKey:", 0);
          -[HMDManagedObjectContext setQueryGenerationFromToken:error:](v12->super._context, "setQueryGenerationFromToken:error:", 0, 0);
          v12->_retryRequired = 0;
          -[HMFExponentialBackoffTimer suspend](v12->_retryTimer, "suspend");

          goto LABEL_12;
        }
        if (v14)
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          HMDShortDescriptionForToken(v9);
          v39 = v8;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKFResidentSyncMetadata lastSeenToken](self->_metadata, "lastSeenToken");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          HMDShortDescriptionForToken(v42);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v47 = v33;
          v48 = 2114;
          v49 = v34;
          v50 = 2114;
          v51 = v35;
          _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Ignoring home data changed message, incoming change token %{public}@ is not ahead of last seen token %{public}@", buf, 0x20u);

          v8 = v39;
        }

        objc_autoreleasePoolPop(context);
        -[HMDResidentDeviceManager sawGenerationID:forDevice:](v12->_residentDeviceManager, "sawGenerationID:forDevice:", v7, v5);
      }
      else
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v47 = v32;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Ignoring home data changed message, failed to decode change token", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v29);
      }

      goto LABEL_23;
    }
LABEL_12:
    -[HMDResidentDeviceManager foundNewPrimaryResident:generationID:selectionTimestamp:changeSource:](self->_residentDeviceManager, "foundNewPrimaryResident:generationID:selectionTimestamp:changeSource:", v5, v7, v8, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __48__HMDResidentSyncClient__handleHomeDataChanged___block_invoke;
    v43[3] = &unk_24E79B1E8;
    v43[4] = self;
    v44 = v5;
    v24 = (id)objc_msgSend(v23, "then:", v43);

LABEL_23:
    goto LABEL_24;
  }
  v25 = (void *)MEMORY[0x227676638]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v28;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Ignoring home data changed message, unable to determine source device", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v25);
LABEL_24:

}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_performFetchJitterPromise, 0);
  objc_storeStrong((id *)&self->_performFetchJitterFuture, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_requestsInProgress, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_residentDeviceManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

uint64_t __48__HMDResidentSyncClient__handleHomeDataChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "unsignedIntValue");
  if (v4)
  {
    if (v4 == 1)
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "shortDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v12;
        v17 = 2114;
        v18 = v13;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Resident Device Manager asked to ignore the home data changed message from: %{public}@", (uint8_t *)&v15, 0x16u);

      }
    }
    else
    {
      if (v4 != 2)
      {
LABEL_11:
        v11 = 1;
        goto LABEL_12;
      }
      v5 = (void *)MEMORY[0x227676638]();
      v6 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v8;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Primary resident is changing, will fetch once we're notified that it changed", (uint8_t *)&v15, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v5);
    goto LABEL_11;
  }
  -[HMDResidentSyncClient _performMaybeDelayedFetchWithReason:](*(_QWORD *)(a1 + 32), CFSTR("received home data changed notification"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
    _HMFPreconditionFailure();
  v10 = v9;
  v11 = 3;

LABEL_12:
  return v11;
}

- (id)_performMaybeDelayedFetchWithReason:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  id *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_13;
  }
  if (!*(_BYTE *)(a1 + 80))
  {
    -[HMDResidentSyncClient _performFetchWithReason:](a1, v3);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v11 = v12;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 88), "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = (id)a1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Eliding delayed home data fetch because there are requests in progress", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithError:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  if (*(_QWORD *)(a1 + 112))
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = (id *)(id)a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v16;
      v32 = 2114;
      v33 = v3;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Waiting for existing delayed fetch (reason: %{public}@)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = v14[14];
    goto LABEL_12;
  }
  v18 = arc4random_uniform(0xAu) + 5;
  v19 = (void *)MEMORY[0x227676638]();
  v20 = (id *)(id)a1;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v22;
    v32 = 1024;
    LODWORD(v33) = v18;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Delaying home data fetch for %u seconds", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v19);
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", v20 + 15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v20 + 14, v23);
  v24 = v20[9];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __61__HMDResidentSyncClient__performMaybeDelayedFetchWithReason___block_invoke;
  v27[3] = &unk_24E79BBD0;
  v27[4] = v20;
  v25 = v23;
  v28 = v25;
  v29 = v3;
  objc_msgSend(v24, "performWithDelay:block:", v18, v27);
  v26 = v29;
  v11 = v25;

LABEL_13:
  return v11;
}

- (id)_performFetchWithReason:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id *v27;
  NSObject *v28;
  void *v29;
  HMDRemoteHomeMessageDestination *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  _BYTE buf[24];
  void *v48;
  id *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    if (v4)
    {
      *(_QWORD *)(a1 + 112) = 0;

    }
    v5 = v3;
    *(_BYTE *)(a1 + 128) = 0;
    objc_msgSend(*(id *)(a1 + 104), "suspend");
    objc_msgSend(*(id *)(a1 + 88), "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = (id)a1;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Eliding home data fetch because there are requests in progress", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      v11 = (void *)MEMORY[0x24BE3F180];
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "futureWithError:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = v3;
      v44 = v5;
      objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "managedObjectModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "versionChecksum");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 96), "lastSyncChecksum");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = HMFEqualObjects();

      if ((v18 & 1) == 0)
      {
        v19 = (void *)MEMORY[0x227676638]();
        v20 = (id *)(id)a1;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20[12], "lastSyncChecksum");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v22;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2114;
          v48 = v23;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Database checksums don't match, forcing a full sync: %{public}@ != %{public}@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v19);
      }
      objc_msgSend(*(id *)(a1 + 96), "lastSeenToken");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(*(id *)(a1 + 96), "lastSyncToken");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      -[HMDResidentSyncClient _syncDetailsWithChangeToken:]((unsigned __int8 *)a1, v12);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x227676638]();
      v27 = (id *)(id)a1;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v44;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching home data with reason: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      v30 = -[HMDRemoteHomeMessageDestination initWithTarget:homeUUID:]([HMDRemoteHomeMessageDestination alloc], "initWithTarget:homeUUID:", v27[2], v27[2]);
      +[HMDRemoteMessage secureMessageWithName:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:destination:messagePayload:", CFSTR("HMDFetchHomeDataMessage"), v30, v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27[11], "addObject:", v31);
      objc_msgSend(v27[7], "sendMessageExpectingResponse:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = MEMORY[0x24BDAC760];
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __55__HMDResidentSyncClient__reallyPerformFetchWithReason___block_invoke;
      v48 = &unk_24E78A3D8;
      v49 = v27;
      v42 = (void *)v25;
      v34 = v31;
      v50 = v34;
      v51 = v24;
      v52 = v16;
      v35 = v16;
      v36 = v24;
      objc_msgSend(v32, "then:", buf);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v33;
      v45[1] = 3221225472;
      v45[2] = __55__HMDResidentSyncClient__reallyPerformFetchWithReason___block_invoke_2;
      v45[3] = &unk_24E79B210;
      v45[4] = v27;
      v46 = v34;
      v38 = v34;
      objc_msgSend(v37, "recover:", v45);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v43;
      v5 = v44;
    }

    v39 = *(void **)(a1 + 120);
    if (v39)
    {
      objc_msgSend(v39, "resolveWithFuture:", v13);
      v40 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = 0;

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __61__HMDResidentSyncClient__performMaybeDelayedFetchWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__HMDResidentSyncClient__performMaybeDelayedFetchWithReason___block_invoke_2;
  v5[3] = &unk_24E79BBD0;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "performBlock:", v5);

}

void __61__HMDResidentSyncClient__performMaybeDelayedFetchWithReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Jitter timer fired", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 112) == *(_QWORD *)(a1 + 40))
  {
    v11 = -[HMDResidentSyncClient _performFetchWithReason:](v6, *(void **)(a1 + 48));
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
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@The future changed, not fetching", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
}

- (unsigned)_syncDetailsWithChangeToken:(unsigned __int8 *)a1
{
  id v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  if (a1)
  {
    v4 = a1[80];
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(a1, "schemaVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "versionString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("schema"));

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("opts"));

      if (v3)
      {
LABEL_4:
        objc_msgSend(a1, "encodeToken:error:", v3, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("etag"));

LABEL_7:
        a1 = (unsigned __int8 *)objc_msgSend(v5, "copy");

        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("opts"));
      if (v3)
        goto LABEL_4;
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("etag"));
    goto LABEL_7;
  }
LABEL_8:

  return a1;
}

uint64_t __55__HMDResidentSyncClient__reallyPerformFetchWithReason___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v16;

  v3 = (id *)a1[4];
  v4 = (void *)a1[5];
  v5 = (void *)a1[6];
  v6 = (void *)a1[7];
  v16 = 0;
  v7 = -[HMDResidentSyncClient _applyAndSaveHomeDataChanges:forRequest:previousLastSeenToken:versionChecksum:error:](v3, a2, v4, v5, v6, &v16);
  v8 = v16;
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 88), "removeObject:", a1[5]);
    objc_msgSend(*(id *)(a1[4] + 104), "reset");
    *(_QWORD *)(a1[4] + 136) = 0;
    v10 = (id)-[HMDResidentSyncClient _performFetchIfRequired](a1[4]);
    v11 = 1;
  }
  else
  {
    v12 = v8;
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v11 = 2;
  }

  return v11;
}

uint64_t __55__HMDResidentSyncClient__reallyPerformFetchWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v3, "isHMError") && objc_msgSend(v3, "code") == 10)
  {
    v4 = ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v4 >= 5)
    {
      if (v8)
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
        v26 = 138543874;
        v27 = v9;
        v28 = 2048;
        v29 = v10;
        v30 = 2114;
        v31 = v3;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home data %ld time(s) with error: %{public}@. Giving up.", (uint8_t *)&v26, 0x20u);

      }
      objc_autoreleasePoolPop(v5);
      v11 = *(_QWORD *)(a1 + 32);
      if (v11)
      {
        *(_BYTE *)(v11 + 128) = 0;
        objc_msgSend(*(id *)(v11 + 104), "suspend");
      }
      goto LABEL_13;
    }
    if (v8)
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(_QWORD *)(v23 + 136);
      objc_msgSend(*(id *)(v23 + 104), "timeInterval");
      v26 = 138544130;
      v27 = v22;
      v28 = 2048;
      v29 = v24;
      v30 = 2114;
      v31 = v3;
      v32 = 2048;
      v33 = v25;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home data %ld time(s) with error: %{public}@ (will retry in %.0lf seconds)", (uint8_t *)&v26, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);
    v17 = *(_QWORD *)(a1 + 32);
    if (v17)
    {
      *(_BYTE *)(v17 + 128) = 1;
      goto LABEL_12;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "timeInterval");
      v26 = 138543874;
      v27 = v15;
      v28 = 2048;
      v29 = v16;
      v30 = 2114;
      v31 = v3;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home data (will retry in %.0lf seconds): %{public}@", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    v17 = *(_QWORD *)(a1 + 32);
    if (v17)
    {
      *(_BYTE *)(v17 + 128) = 1;
LABEL_12:
      objc_msgSend(*(id *)(v17 + 104), "resume");
    }
  }
LABEL_13:
  v18 = v3;
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

- (uint64_t)_applyAndSaveHomeDataChanges:(void *)a3 forRequest:(void *)a4 previousLastSeenToken:(void *)a5 versionChecksum:(_QWORD *)a6 error:
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id *v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  __CFString *v32;
  id v33;
  void *v34;
  id *v35;
  NSObject *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  int *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  __CFString *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  id *v61;
  id *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  id v67;
  void *v68;
  id *v69;
  NSObject *v70;
  __CFString *v71;
  void *v72;
  void *v73;
  id *v74;
  NSObject *v75;
  __CFString *v76;
  void *v77;
  void *v78;
  id *v79;
  NSObject *v80;
  void *v81;
  id v82;
  void *v83;
  __CFString *v84;
  void *v85;
  id *v86;
  NSObject *v87;
  void *v88;
  id v89;
  void *v90;
  __CFString *v91;
  const char *v92;
  NSObject *v93;
  os_log_type_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id *v98;
  NSObject *v99;
  void *v100;
  __CFString *v101;
  void *v102;
  void *v103;
  char v104;
  id v105;
  void *v106;
  id *v107;
  NSObject *v108;
  const __CFString *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  id v115;
  id v116;
  void *v117;
  id *v118;
  NSObject *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  __CFString *v128;
  __CFString *v129;
  id v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  id *v135;
  NSObject *v136;
  void *v137;
  void *v138;
  HMDResidentSyncClientHomeDataLogEvent *v139;
  id v140;
  uint64_t v141;
  id v142;
  HMDResidentSyncClientHomeDataLogEvent *v143;
  void *v144;
  id *v145;
  NSObject *v146;
  void *v147;
  void *v148;
  void *v149;
  id *v150;
  NSObject *v151;
  void *v152;
  void *v153;
  __CFString *v154;
  void *v156;
  void *v157;
  __CFString *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  __CFString *v163;
  void *v164;
  id *v165;
  void *v166;
  void *v167;
  __CFString *v168;
  __CFString *v169;
  void *v170;
  id v171;
  id v172;
  id v173;
  void *v174;
  uint64_t v175;
  id v176;
  void *v177;
  uint64_t v179;
  id v180;
  uint8_t buf[4];
  void *v182;
  __int16 v183;
  const __CFString *v184;
  __int16 v185;
  uint64_t v186;
  __int16 v187;
  uint64_t v188;
  __int16 v189;
  void *v190;
  __int16 v191;
  void *v192;
  __int16 v193;
  id v194;
  uint64_t v195;

  v195 = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!a1)
  {
    v26 = 0;
    goto LABEL_123;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("response"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (!v16)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = a1;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = v13;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v182 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid home data response, missing response type", buf, 0xCu);

      v13 = v24;
    }

    objc_autoreleasePoolPop(v21);
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v26 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    goto LABEL_122;
  }
  v176 = v12;
  v175 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F200]), "initWithName:", CFSTR("com.apple.homed.resident-sync"));
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("etag"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  if (v19)
  {
    objc_msgSend(a1, "decodeToken:error:", v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v27 = -[__CFString integerValue](v16, "integerValue");
  v177 = v11;
  if ((unint64_t)(v27 - 1) >= 2)
  {
    if (v27)
    {
      v172 = v10;
      v31 = v20;
      v67 = v19;
      v68 = (void *)MEMORY[0x227676638]();
      v69 = a1;
      HMFGetOSLogHandle();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v71 = v13;
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v182 = v72;
        v183 = 2114;
        v184 = v16;
        _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_ERROR, "%{public}@Invalid home data response, invalid response type: %{public}@", buf, 0x16u);

        v13 = v71;
      }

      objc_autoreleasePoolPop(v68);
      v39 = (void *)v175;
      if (a6)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
        v26 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      v19 = v67;
      goto LABEL_63;
    }
    v174 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("data"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v29 = v28;
  else
    v29 = 0;
  v30 = v29;
  v174 = v28;

  if (v30)
  {
    if (!v20)
    {
      v172 = v10;
      v31 = 0;
      v32 = v16;
      v33 = v19;
      v34 = (void *)MEMORY[0x227676638]();
      v35 = a1;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = v13;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v182 = v38;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Invalid home data response, missing change token", buf, 0xCu);

        v13 = v37;
      }

      objc_autoreleasePoolPop(v34);
      v39 = (void *)v175;
      if (a6)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }

LABEL_55:
      v26 = 0;
      goto LABEL_56;
    }
LABEL_29:
    v40 = &OBJC_IVAR___HMDProcessLaunchInfoLogEvent__numUncommittedAndPushedRecords;
    if (!a1[12] && (-[HMDResidentSyncClient _fetchOrCreateMetadataWithError:]((uint64_t)a1, a6) & 1) == 0)
    {

      v26 = 0;
LABEL_120:
      v39 = (void *)v175;
      goto LABEL_121;
    }
    v41 = a1[4];
    objc_msgSend(MEMORY[0x24BDBB758], "currentQueryGenerationToken");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setQueryGenerationFromToken:error:", v42, 0);

    objc_msgSend(a1[12], "home");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v19;
    if (!v170)
    {
      v78 = (void *)MEMORY[0x227676638]();
      v79 = a1;
      HMFGetOSLogHandle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v169 = v13;
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "shortDescription");
        v82 = v10;
        v83 = v20;
        v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v182 = v81;
        v183 = 2114;
        v184 = v84;
        _os_log_impl(&dword_2218F0000, v80, OS_LOG_TYPE_ERROR, "%{public}@Unable to apply home data for %{public}@, home has been removed", buf, 0x16u);

        v20 = v83;
        v10 = v82;

        v13 = v169;
      }

      objc_autoreleasePoolPop(v78);
      if (a6)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v26 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      goto LABEL_118;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[12], "setLastSyncTimestamp:", v43);

    v167 = v20;
    v168 = v13;
    if (v20)
    {
      objc_msgSend(a1[12], "lastSyncToken");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(a1, "changeToken:isAheadOf:", v20, v44);

      if ((v45 & 1) != 0)
      {
        v46 = (void *)MEMORY[0x227676638](objc_msgSend(a1[12], "setLastSyncToken:", v20));
        v165 = a1;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
        if (!v174)
        {
          if (v48)
          {
            HMFGetLogIdentifier();
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "shortDescription");
            v128 = v13;
            v129 = (__CFString *)objc_claimAutoreleasedReturnValue();
            HMDShortDescriptionForToken(v20);
            v130 = v10;
            v131 = v20;
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v182 = v127;
            v183 = 2112;
            v184 = v129;
            v185 = 2114;
            v186 = (uint64_t)v132;
            _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Applying last sync token update only for %@ with change token %{public}@", buf, 0x20u);

            v13 = v128;
            v40 = &OBJC_IVAR___HMDProcessLaunchInfoLogEvent__numUncommittedAndPushedRecords;

            v20 = v131;
            v10 = v130;

            v19 = v171;
          }

          objc_autoreleasePoolPop(v46);
          goto LABEL_72;
        }
        v173 = v10;
        if (v48)
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v177, "shortDescription");
          v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
          HMDShortDescriptionForToken(v20);
          v51 = v20;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v182 = v49;
          v183 = 2112;
          v184 = v50;
          v185 = 2114;
          v186 = (uint64_t)v52;
          _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Applying home data changes for %@ with change token %{public}@", buf, 0x20u);

          v20 = v51;
          v10 = v173;

        }
        objc_autoreleasePoolPop(v46);
        v161 = -[__CFString integerValue](v16, "integerValue");
        v53 = v174;
        v54 = v10;
        objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("kRemoteMessageTransportAttributionKey"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v56 = v55;
        else
          v56 = 0;
        v57 = v56;

        v159 = v54;
        v163 = v57;
        if (v57)
        {
          v58 = -[__CFString integerValue](v57, "integerValue");
          if (v58 <= 6)
          {
            if (((1 << v58) & 0x3A) != 0)
            {
              v59 = v53;
              v60 = (void *)MEMORY[0x227676638]();
              v61 = v165;
              v62 = v165;
              HMFGetOSLogHandle();
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v64 = v20;
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = CFSTR("Unknown");
                *(_DWORD *)buf = 138543618;
                v182 = v65;
                v183 = 2114;
                v184 = CFSTR("Unknown");
                _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, "%{public}@Unexpected transport type: %{public}@, not generating log event", buf, 0x16u);

                v61 = v165;
                v20 = v64;
                v10 = v173;
              }

              objc_autoreleasePoolPop(v60);
LABEL_111:

              +[HMDStructuredReader readerFromOPACKData:](HMDStructuredReader, "readerFromOPACKData:", v59);
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v61[3], "updateRootObject:fromReader:", v170, v148) & 1) != 0)
              {

                v13 = v168;
                goto LABEL_71;
              }
              v149 = (void *)MEMORY[0x227676638]();
              v150 = v61;
              HMFGetOSLogHandle();
              v151 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v152 = v20;
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v148, "error");
                v154 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v182 = v153;
                v183 = 2114;
                v184 = v154;
                _os_log_impl(&dword_2218F0000, v151, OS_LOG_TYPE_ERROR, "%{public}@Failed to apply home data: %{public}@", buf, 0x16u);

                v40 = &OBJC_IVAR___HMDProcessLaunchInfoLogEvent__numUncommittedAndPushedRecords;
                v20 = v152;
                v10 = v173;
              }

              objc_autoreleasePoolPop(v149);
              if (a6)
              {
                objc_msgSend(v148, "error");
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(a1[4], "rollback");

              v26 = 0;
              v13 = v168;
LABEL_118:
              v19 = v171;
LABEL_119:

              objc_msgSend(a1[4], "refreshAllObjects");
              objc_msgSend(*(id *)((char *)a1 + v40[593]), "willAccessValueForKey:", 0);
              objc_msgSend(a1[4], "setQueryGenerationFromToken:error:", 0, 0);

              goto LABEL_120;
            }
            if (((1 << v58) & 0x44) != 0)
            {
              v133 = -[__CFString integerValue](v57, "integerValue");
LABEL_105:
              v59 = v53;
              if (v161)
              {
                objc_msgSend(v165, "logEventSubmitter");
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                v139 = [HMDResidentSyncClientHomeDataLogEvent alloc];
                v140 = v165[2];
                v141 = objc_msgSend(v53, "length");
                v142 = v140;
                v40 = &OBJC_IVAR___HMDProcessLaunchInfoLogEvent__numUncommittedAndPushedRecords;
                v61 = v165;
                v143 = -[HMDResidentSyncClientHomeDataLogEvent initWithHomeUUID:encodedDataSize:homeDataType:transportType:](v139, "initWithHomeUUID:encodedDataSize:homeDataType:transportType:", v142, v141, v161, v133);
                objc_msgSend(v138, "submitLogEvent:", v143);

              }
              else
              {
                v144 = (void *)MEMORY[0x227676638]();
                v61 = v165;
                v145 = v165;
                HMFGetOSLogHandle();
                v146 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v182 = v147;
                  _os_log_impl(&dword_2218F0000, v146, OS_LOG_TYPE_ERROR, "%{public}@Unexpected HMDFetchHomeDataResponseType_NotModified, not generating log event", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v144);
              }
              v20 = v167;
              goto LABEL_111;
            }
          }
          v134 = (void *)MEMORY[0x227676638]();
          v135 = v165;
          HMFGetOSLogHandle();
          v136 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v182 = v137;
            v183 = 2112;
            v184 = v57;
            _os_log_impl(&dword_2218F0000, v136, OS_LOG_TYPE_ERROR, "%{public}@Unknown transport type (%@). Log it anyway", buf, 0x16u);

            v40 = &OBJC_IVAR___HMDProcessLaunchInfoLogEvent__numUncommittedAndPushedRecords;
          }

          objc_autoreleasePoolPop(v134);
        }
        v133 = 0;
        goto LABEL_105;
      }
      v85 = (void *)MEMORY[0x227676638]();
      v86 = a1;
      HMFGetOSLogHandle();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "shortDescription");
        v89 = v10;
        v90 = v20;
        v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v182 = v88;
        v183 = 2114;
        v184 = v91;
        v92 = "%{public}@Not persisting stale home data for %{public}@ (incoming change token is not ahead of last sync)";
        v93 = v87;
        v94 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_69;
      }
    }
    else
    {
      v85 = (void *)MEMORY[0x227676638]();
      v86 = a1;
      HMFGetOSLogHandle();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "shortDescription");
        v89 = v10;
        v90 = 0;
        v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v182 = v88;
        v183 = 2114;
        v184 = v91;
        v92 = "%{public}@Updating last sync timestamp only for %{public}@";
        v93 = v87;
        v94 = OS_LOG_TYPE_INFO;
LABEL_69:
        _os_log_impl(&dword_2218F0000, v93, v94, v92, buf, 0x16u);

        v20 = v90;
        v10 = v89;
        v40 = &OBJC_IVAR___HMDProcessLaunchInfoLogEvent__numUncommittedAndPushedRecords;

        v13 = v168;
      }
    }

    objc_autoreleasePoolPop(v85);
LABEL_71:
    v19 = v171;
LABEL_72:
    objc_msgSend(*(id *)((char *)a1 + v40[593]), "lastSeenToken");
    v95 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)a1 + v40[593]), "lastSyncToken");
    v96 = objc_claimAutoreleasedReturnValue();
    v164 = (void *)v95;
    v166 = (void *)v96;
    if (v20 && objc_msgSend(a1, "changeToken:isAheadOf:", v20, v95))
    {
      objc_msgSend(*(id *)((char *)a1 + v40[593]), "setLastSeenToken:", v20);
    }
    else if ((objc_msgSend(a1, "changeToken:isAheadOf:", v95, v176) & 1) == 0
           && objc_msgSend(a1, "changeToken:isAheadOf:", v95, v96))
    {
      v97 = (void *)MEMORY[0x227676638]();
      v98 = a1;
      HMFGetOSLogHandle();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        HMDShortDescriptionForToken(v164);
        v101 = (__CFString *)objc_claimAutoreleasedReturnValue();
        HMDShortDescriptionForToken(v166);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v182 = v100;
        v183 = 2114;
        v184 = v101;
        v185 = 2114;
        v186 = (uint64_t)v102;
        _os_log_impl(&dword_2218F0000, v99, OS_LOG_TYPE_DEFAULT, "%{public}@Reverting last seen token %{public}@ to last sync token %{public}@ after successful fetch", buf, 0x20u);

        v40 = &OBJC_IVAR___HMDProcessLaunchInfoLogEvent__numUncommittedAndPushedRecords;
        v13 = v168;
      }

      objc_autoreleasePoolPop(v97);
      objc_msgSend(*(id *)((char *)v98 + v40[593]), "setLastSeenToken:", v166);
      v19 = v171;
    }
    if (v13)
    {
      objc_msgSend(*(id *)((char *)a1 + v40[593]), "lastSyncChecksum");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = HMFEqualObjects();

      if ((v104 & 1) == 0)
      {
        v105 = v19;
        v106 = (void *)MEMORY[0x227676638]();
        v107 = a1;
        HMFGetOSLogHandle();
        v108 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v109 = v13;
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v182 = v110;
          v183 = 2114;
          v184 = v109;
          _os_log_impl(&dword_2218F0000, v108, OS_LOG_TYPE_INFO, "%{public}@Updating the lastSyncChecksum to %{public}@", buf, 0x16u);

          v13 = (__CFString *)v109;
        }

        objc_autoreleasePoolPop(v106);
        objc_msgSend(v107[12], "setLastSyncChecksum:", v13);
        v19 = v105;
      }
    }
    objc_msgSend(a1[4], "insertedObjects");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = objc_msgSend(v111, "count");

    objc_msgSend(a1[4], "updatedObjects");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = objc_msgSend(v112, "count");

    objc_msgSend(a1[4], "deletedObjects");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v113, "count");

    v115 = a1[4];
    v180 = 0;
    v26 = objc_msgSend(v115, "save:", &v180);
    v116 = v180;
    v117 = (void *)MEMORY[0x227676638]();
    v118 = a1;
    HMFGetOSLogHandle();
    v119 = objc_claimAutoreleasedReturnValue();
    v120 = v119;
    if ((v26 & 1) != 0)
    {
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v179 = v114;
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "shortDescription");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        HMDShortDescriptionForToken(v167);
        v156 = v117;
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v182 = v121;
        v183 = 2048;
        v184 = (const __CFString *)v162;
        v185 = 2048;
        v186 = v160;
        v187 = 2048;
        v188 = v179;
        v189 = 2112;
        v190 = v122;
        v191 = 2114;
        v192 = v123;
        _os_log_impl(&dword_2218F0000, v120, OS_LOG_TYPE_DEFAULT, "%{public}@Database changes saved (%tu / %tu / %tu) for %@ with change token %{public}@", buf, 0x3Eu);

        v19 = v171;
        v117 = v156;

      }
      objc_autoreleasePoolPop(v117);
      v13 = v168;
    }
    else
    {
      v158 = v16;
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "shortDescription");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        HMDShortDescriptionForToken(v167);
        v157 = v117;
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v182 = v124;
        v183 = 2048;
        v184 = (const __CFString *)v162;
        v185 = 2048;
        v186 = v160;
        v187 = 2048;
        v188 = v114;
        v189 = 2112;
        v190 = v125;
        v191 = 2114;
        v192 = v126;
        v193 = 2114;
        v194 = v116;
        _os_log_impl(&dword_2218F0000, v120, OS_LOG_TYPE_ERROR, "%{public}@Failed to save database changes (%tu / %tu / %tu) for %@ with change token %{public}@: %{public}@", buf, 0x48u);

        v19 = v171;
        v117 = v157;

      }
      objc_autoreleasePoolPop(v117);
      if (a6)
      {
        HMDSanitizeCoreDataError(v116);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(a1[4], "rollback");
      v13 = v168;
      v16 = v158;
    }
    v20 = v167;
    v40 = &OBJC_IVAR___HMDProcessLaunchInfoLogEvent__numUncommittedAndPushedRecords;

    goto LABEL_119;
  }
  v172 = v10;
  v31 = v20;
  v32 = v16;
  v33 = v19;
  v73 = (void *)MEMORY[0x227676638]();
  v74 = a1;
  HMFGetOSLogHandle();
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v76 = v13;
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v182 = v77;
    _os_log_impl(&dword_2218F0000, v75, OS_LOG_TYPE_ERROR, "%{public}@Invalid home data response, missing data payload", buf, 0xCu);

    v13 = v76;
  }

  objc_autoreleasePoolPop(v73);
  v39 = (void *)v175;
  if (!a6)
    goto LABEL_55;
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
  v26 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:
  v19 = v33;
  v16 = v32;
LABEL_63:
  v20 = v31;
  v10 = v172;
LABEL_121:

  v12 = v176;
  v11 = v177;
LABEL_122:

LABEL_123:
  return v26;
}

- (id)_performFetchIfRequired
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  __CFString *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1[11], "anyObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
      return a1;
    }
    objc_msgSend(v1[12], "lastSeenToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v1[12], "lastSeenToken");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1[12], "lastSyncToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v1, "changeToken:isAheadOf:", v4, v5);

      if ((v6 & 1) != 0)
      {
        v7 = CFSTR("lastSeenToken is ahead of lastSyncToken");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1[12], "lastSyncTimestamp");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceDate:", v9);
        v11 = v10;
        v12 = HMDHomeDataChangedMessageTimeout();

        if (v11 < v12)
          goto LABEL_3;
        v7 = CFSTR("lastSyncTimestamp indicates data may be stale");
      }
    }
    else
    {
      v7 = CFSTR("lastSeenToken is nil");
    }
    -[HMDResidentSyncClient _performFetchWithReason:]((uint64_t)v1, v7);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)_fetchOrCreateMetadataWithError:(uint64_t)result
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  MKFResidentSyncMetadata *v9;
  id v10;
  void *v11;
  id *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id *v16;
  NSObject *v17;
  void *v18;
  id v19;
  char v20;
  char v21;
  void *v22;
  id *v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  unsigned __int8 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v3 = (id *)result;
    v4 = *(_QWORD *)(result + 16);
    v5 = *(_QWORD *)(result + 32);
    v27 = 0;
    +[_MKFModel modelWithModelID:context:error:](_MKFHome, "modelWithModelID:context:error:", v4, v5, &v27);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v27;
    if (!v6)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = v3;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v14;
        v31 = 2114;
        v32 = v7;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to find or create resident sync metadata, home not found: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      if (a2)
        *a2 = objc_retainAutorelease(v7);
      v28 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v6, "residentSyncMetadata");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (MKFResidentSyncMetadata *)v8;
      v10 = v7;
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v3;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Creating initial resident sync metadata", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      v9 = -[MKFResidentSyncMetadata initWithContext:]([MKFResidentSyncMetadata alloc], "initWithContext:", v3[4]);
      -[MKFResidentSyncMetadata setHome:](v9, "setHome:", v6);
      v19 = v3[4];
      v26 = v7;
      v20 = objc_msgSend(v19, "save:", &v26);
      v10 = v26;

      if ((v20 & 1) == 0)
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = v16;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v25;
          v31 = 2114;
          v32 = v10;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to save resident sync metadata: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        if (a2)
        {
          HMDSanitizeCoreDataError(v10);
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v3[4], "rollback");
        v21 = 0;
        goto LABEL_15;
      }
      objc_msgSend(v3[4], "refreshAllObjects");
      objc_msgSend(v16[12], "willAccessValueForKey:", 0);
      objc_msgSend(v3[4], "setQueryGenerationFromToken:error:", 0, 0);
    }
    objc_storeStrong(v3 + 12, v9);
    v21 = 1;
LABEL_15:
    v28 = v21;

    v7 = v10;
LABEL_16:

    return v28;
  }
  return result;
}

id *__38__HMDResidentSyncClient_timerDidFire___block_invoke(uint64_t a1)
{
  id *result;

  result = *(id **)(a1 + 32);
  if (*((_BYTE *)result + 128))
    return (id *)-[HMDResidentSyncClient _performFetchIfRequired](result);
  return result;
}

uint64_t __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMDRemoteMessage *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  HMDRemoteMessage *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  HMDRemoteMessage *v32;
  void *v33;
  HMDRemoteMessage *v34;
  id v35;
  void *v36;
  uint64_t v38;
  _QWORD v39[5];
  HMDRemoteMessage *v40;
  _QWORD v41[5];
  id v42;
  HMDRemoteMessage *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isCurrentDevicePrimaryResident"))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v5;
      v46 = 2112;
      v47 = v6;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Unable to dispatch resident request '%@': this device is the primary resident", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      v9 = 2;
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
      v8 = 0;
      v10 = 0;
      v9 = 2;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "messagePayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v14;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "lastSyncToken");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDResidentSyncClient _syncDetailsWithChangeToken:](*(unsigned __int8 **)(a1 + 32), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("$HMDRS$"));

    v16 = [HMDRemoteMessage alloc];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(*(id *)(a1 + 40), "qualityOfService");
    v19 = *(_QWORD *)(a1 + 48);
    v20 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(*(id *)(a1 + 40), "headers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timeout");
    LOBYTE(v38) = 1;
    v22 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:](v16, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:", v17, v18, v19, v20, v21, 3, v38, -1, 0);

    v23 = (void *)MEMORY[0x227676638]();
    v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFObject shortDescription](v22, "shortDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v26;
      v46 = 2112;
      v47 = v27;
      v48 = 2112;
      v49 = v28;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Dispatching resident request '%@' using remote message: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:", v22);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "sendMessageExpectingResponse:", v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x24BDAC760];
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke_203;
    v41[3] = &unk_24E78A3B0;
    v31 = *(void **)(a1 + 40);
    v41[4] = *(_QWORD *)(a1 + 32);
    v42 = v31;
    v32 = v22;
    v43 = v32;
    objc_msgSend(v29, "then:", v41);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v30;
    v39[1] = 3221225472;
    v39[2] = __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke_207;
    v39[3] = &unk_24E79B238;
    v39[4] = *(_QWORD *)(a1 + 32);
    v34 = v32;
    v40 = v34;
    objc_msgSend(v33, "finally:", v39);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    if (!v35)
      _HMFPreconditionFailure();
    v36 = v35;

    v9 = 3;
  }

  return v9;
}

uint64_t __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke_203(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "hmf_dictionaryForKey:", CFSTR("$HMDRS$"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v14;
      v28 = 2112;
      v29 = v15;
      v30 = 2114;
      v31 = CFSTR("$HMDRS$");
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Resident response payload for '%@' is missing resident sync details key (%{public}@)", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v9 = v16;
      v10 = 2;
      v8 = v9;
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v8 = 0;
LABEL_15:
    v10 = 2;
    goto LABEL_16;
  }
  v5 = *(id **)(a1 + 32);
  v6 = *(void **)(a1 + 48);
  v25 = 0;
  v7 = -[HMDResidentSyncClient _applyAndSaveHomeDataChanges:forRequest:previousLastSeenToken:versionChecksum:error:](v5, v4, v6, 0, 0, &v25);
  v8 = v25;
  if ((v7 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Resident response for '%@' was success but local database save failed, returning partial success error code", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:description:underlyingError:", 2008, CFSTR("Resident request succeeded but database save failed"), v8);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v22;
    if (v22)
    {
      v23 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_15;
  }
  v9 = (id)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("$HMDRS$"));
  objc_msgSend(v9, "copy");
  v10 = 1;
LABEL_16:

  return v10;
}

uint64_t __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke_207(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = -[HMDResidentSyncClient _performFetchIfRequired](*(id **)(a1 + 32));
  return 1;
}

void __54__HMDResidentSyncClient_handlePrimaryResidentChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v3 = *(void **)(v1 + 112);
    if (v3)
    {
      *(_QWORD *)(v1 + 112) = 0;

    }
    v4 = *(void **)(v1 + 120);
    if (v4)
    {
      v5 = (id)objc_msgSend(v4, "voidResolverBlock");
      v6 = *(void **)(v1 + 120);
      *(_QWORD *)(v1 + 120) = 0;

    }
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      *(_BYTE *)(v7 + 128) = 0;
      objc_msgSend(*(id *)(v7 + 104), "suspend");
    }
  }
}

id __54__HMDResidentSyncClient_handlePrimaryResidentChanged___block_invoke_194(uint64_t a1)
{
  return -[HMDResidentSyncClient _performMaybeDelayedFetchWithReason:](*(_QWORD *)(a1 + 32), CFSTR("primary resident changed"));
}

id __36__HMDResidentSyncClient_performSync__block_invoke(uint64_t a1)
{
  return -[HMDResidentSyncClient _performFetchWithReason:](*(_QWORD *)(a1 + 32), CFSTR("sync requested"));
}

id __30__HMDResidentSyncClient_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v12;
  SEL v13;
  id v14;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v14 = 0;
  v3 = -[HMDResidentSyncClient _fetchOrCreateMetadataWithError:](v2, &v14);
  v4 = v14;
  v5 = v4;
  if ((v3 & 1) == 0)
  {
    v9 = v4;
    v7 = v9;
    if (v9)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }
    v8 = 2;
    goto LABEL_8;
  }
  -[HMDResidentSyncClient _performFetchIfRequired](*(id **)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;

    v8 = 3;
LABEL_8:

    return (id)v8;
  }
  v12 = (void *)_HMFPreconditionFailure();
  return +[HMDResidentSyncManager logCategory](v12, v13);
}

@end
