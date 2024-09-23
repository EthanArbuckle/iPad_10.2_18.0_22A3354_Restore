@implementation HMDRemoteLoginHandler

- (HMDRemoteLoginHandler)initWithAccessory:(id)a3 loggedInAccountData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HMDRemoteLoginHandler *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDRemoteLoginHandler *v18;
  id v20;
  const __CFString *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;
    if (v9)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v13;
        v24 = 2112;
        v25 = v9;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive logged in account from logged in account data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  v14 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v6, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CFSTR("HMDRemoteLoginHandler");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hm_deriveUUIDFromBaseUUID:withSalts:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMDRemoteLoginHandler initWithUUID:accessory:loggedInAccount:](self, "initWithUUID:accessory:loggedInAccount:", v17, v6, v8);

  return v18;
}

- (HMDRemoteLoginHandler)initWithUUID:(id)a3 accessory:(id)a4 loggedInAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMDRemoteLoginHandler *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HMDRemoteLoginHandler initWithUUID:accessory:loggedInAccount:accountStore:targetSupportsAccounts:](self, "initWithUUID:accessory:loggedInAccount:accountStore:targetSupportsAccounts:", v10, v9, v8, v12, 1);
  return v13;
}

- (HMDRemoteLoginHandler)initWithUUID:(id)a3 accessory:(id)a4 loggedInAccount:(id)a5 accountStore:(id)a6 targetSupportsAccounts:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDRemoteLoginHandler *v17;
  HMDRemoteLoginHandler *v18;
  uint64_t v19;
  HMFStagedValue *stagedLoggedInAccount;
  HMDRemoteLoginInitiator *v21;
  HMDRemoteLoginInitiator *initiator;
  HMDRemoteLoginReceiver *v23;
  HMDRemoteLoginReceiver *receiver;
  HMDRemoteLoginAnisetteDataHandler *v25;
  HMDRemoteLoginAnisetteDataHandler *anisetteDataHandler;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)HMDRemoteLoginHandler;
  v17 = -[HMDRemoteLoginHandler init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_accessory, v14);
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_storeStrong((id *)&v18->_loggedInAccount, a5);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F278]), "initWithValue:", 0);
    stagedLoggedInAccount = v18->_stagedLoggedInAccount;
    v18->_stagedLoggedInAccount = (HMFStagedValue *)v19;

    -[HMFStagedValue setDelegate:](v18->_stagedLoggedInAccount, "setDelegate:", v18);
    v21 = -[HMDRemoteLoginInitiator initWithUUID:accessory:remoteLoginHandler:]([HMDRemoteLoginInitiator alloc], "initWithUUID:accessory:remoteLoginHandler:", v13, v14, v18);
    initiator = v18->_initiator;
    v18->_initiator = v21;

    v23 = -[HMDRemoteLoginBase initWithUUID:accessory:remoteLoginHandler:]([HMDRemoteLoginReceiver alloc], "initWithUUID:accessory:remoteLoginHandler:", v13, v14, v18);
    receiver = v18->_receiver;
    v18->_receiver = v23;

    v25 = -[HMDRemoteLoginAnisetteDataHandler initWithUUID:accessory:]([HMDRemoteLoginAnisetteDataHandler alloc], "initWithUUID:accessory:", v13, v14);
    anisetteDataHandler = v18->_anisetteDataHandler;
    v18->_anisetteDataHandler = v25;

    objc_storeStrong((id *)&v18->_accountStore, a6);
    v18->_targetSupportsAccounts = a7;
  }

  return v18;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDRemoteLoginHandler uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4 eventStoreReadHandle:(id)a5 eventForwarder:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[HMDRemoteLoginHandler setWorkQueue:](self, "setWorkQueue:", v13);
  -[HMDRemoteLoginHandler setMsgDispatcher:](self, "setMsgDispatcher:", v12);
  -[HMDRemoteLoginHandler setEventStoreReadHandle:](self, "setEventStoreReadHandle:", v11);

  -[HMDRemoteLoginHandler setEventForwarder:](self, "setEventForwarder:", v10);
  -[HMDRemoteLoginHandler initiator](self, "initiator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configureWithWorkQueue:messageDispatcher:", v13, v12);

  -[HMDRemoteLoginHandler receiver](self, "receiver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configureWithWorkQueue:messageDispatcher:", v13, v12);

  -[HMDRemoteLoginHandler anisetteDataHandler](self, "anisetteDataHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "configureWithWorkQueue:messageDispatcher:", v13, v12);

  -[HMDRemoteLoginHandler registerForMessages](self, "registerForMessages");
  -[HMDRemoteLoginHandler _postAccountInfoFromAccountStore](self, "_postAccountInfoFromAccountStore");
}

- (void)registerForMessages
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[HMDRemoteLoginHandler msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD6A50];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v4, self, v6, sel__handleUpdateLoggedInAccountMessage_);

  -[HMDRemoteLoginHandler initiator](self, "initiator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForMessages");

  -[HMDRemoteLoginHandler receiver](self, "receiver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessages");

  -[HMDRemoteLoginHandler anisetteDataHandler](self, "anisetteDataHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessages");

}

- (void)_handleUpdateLoggedInAccountMessage:(id)a3
{
  id v4;
  void *v5;
  HMDRemoteLoginHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HMDRemoteLoginHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDRemoteLoginHandler *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  void *v31;
  HMDRemoteLoginHandler *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void (*v37)(void);
  void *v38;
  int v39;
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138543618;
    v41 = v8;
    v42 = 2112;
    v43 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update logged in account message: %@", (uint8_t *)&v40, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "dataForKey:", CFSTR("kRemoteLoginAccount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "deserializeObjectWithData:allowedClass:frameworkClasses:", v10, objc_opt_class(), MEMORY[0x24BDBD1A8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginHandler loggedInAccount](v6, "loggedInAccount");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_10;
    v13 = (void *)v12;
    objc_msgSend(v11, "aa_altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginHandler loggedInAccount](v6, "loggedInAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "aa_altDSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HMFEqualObjects();

    if (v17)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = v6;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138543618;
        v41 = v21;
        v42 = 2112;
        v43 = v11;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Updated account matches the currently logged in account: %@", (uint8_t *)&v40, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(v4, "responseHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_25;
    }
    else
    {
LABEL_10:
      -[HMDRemoteLoginHandler loggedInAccount](v6, "loggedInAccount");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = v6;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 138543362;
          v41 = v27;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to update account, existing account present", (uint8_t *)&v40, 0xCu);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(v4, "responseHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
          goto LABEL_25;
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("Not supported."), CFSTR("Existing account present."), 0);
        v29 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD *, _QWORD))v30)[2](v30, v29, 0);

        goto LABEL_24;
      }
      -[HMDRemoteLoginHandler accessory](v6, "accessory");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "supportsMessagedHomePodSettings");

      if (v39)
        -[HMDRemoteLoginHandler stageLoggedInAccount:](v6, "stageLoggedInAccount:", v11);
      else
        __updateLoggedInAccount(v6, v11, v4);
    }
    objc_msgSend(v4, "responseHandler");
    v29 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v37 = (void (*)(void))v29[2];
LABEL_23:
    v37();
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  v31 = (void *)MEMORY[0x227676638]();
  v32 = v6;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138543618;
    v41 = v34;
    v42 = 2112;
    v43 = v35;
    _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Missing serialized account in message payload: %@", (uint8_t *)&v40, 0x16u);

  }
  objc_autoreleasePoolPop(v31);
  objc_msgSend(v4, "responseHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseHandler");
    v29 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v37 = (void (*)(void))v29[2];
    goto LABEL_23;
  }
LABEL_26:

}

- (void)stageLoggedInAccount:(id)a3
{
  id v4;
  void *v5;
  HMDRemoteLoginHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Staging logged in account: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDRemoteLoginHandler stagedLoggedInAccount](v6, "stagedLoggedInAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stageValue:withTimeout:", v4, 600.0);

  -[HMDRemoteLoginHandler updateFrameworkWithReason:](v6, "updateFrameworkWithReason:", CFSTR("HMDRemoteLoginHandlerStagedLoggedInAccount"));
}

- (void)updateFrameworkWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDRemoteLoginHandler *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDRemoteLoginHandler accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDRemoteLoginHandler uuid](self, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", v4, v8, 1);

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to update home graph without a home manager for reason: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (id)eventSource
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDRemoteLoginHandler accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accountInfoFromLastEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDRemoteLoginHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDRemoteLoginHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDRemoteLoginHandler *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[HMDRemoteLoginHandler eventTopicForAccountInfo](self, "eventTopicForAccountInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDRemoteLoginHandler eventStoreReadHandle](self, "eventStoreReadHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HMDRemoteLoginHandler eventStoreReadHandle](self, "eventStoreReadHandle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastEventForTopic:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = objc_alloc(MEMORY[0x24BDD73A8]);
        objc_msgSend(v6, "encodedData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v7, "initWithProtoData:", v8);

        if (v9)
        {
          v10 = v9;
        }
        else
        {
          v19 = (void *)MEMORY[0x227676638]();
          v20 = self;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 138543362;
            v25 = v22;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get last account info event account due invalid stored event data", (uint8_t *)&v24, 0xCu);

          }
          objc_autoreleasePoolPop(v19);
        }

      }
      else
      {
        v9 = 0;
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
        v24 = 138543362;
        v25 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to get last account info event account due to no event store read handle", (uint8_t *)&v24, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      v9 = 0;
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
      v24 = 138543362;
      v25 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get last account info event account due to no topic", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v9 = 0;
  }

  return v9;
}

- (id)accountInfoForAccount:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDD73A8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmd_aa_altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmd_ams_altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "initWithUsername:aaAltDSID:amsAltDSID:signedIn:", v6, v7, v8, v4 != 0);
  return v9;
}

- (id)eventTopicForAccountInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDRemoteLoginHandler *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDRemoteLoginHandler accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
  {
    objc_msgSend(MEMORY[0x24BDD73A0], "topicFromSuffixID:homeUUID:accessoryUUID:", *MEMORY[0x24BDD4B90], v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get account info event topic due to missing accessory uuid: %@ home uuid: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (void)_postAccountInfoFromAccountStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDRemoteLoginHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDRemoteLoginHandler *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDRemoteLoginHandler accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "supportsMessagedHomePodSettings")
      && objc_msgSend(v4, "isCurrentAccessory"))
    {
      -[HMDRemoteLoginHandler accountStore](self, "accountStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hmd_ams_activeiTunesAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v10;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Posting account store account: %@", (uint8_t *)&v15, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDRemoteLoginHandler _postUpdatedAccountInfo:](v8, "_postUpdatedAccountInfo:", v6);

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
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to post account info from account store due to missing accessory", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)_postUpdatedAccountInfo:(id)a3
{
  id v4;
  void *v5;
  HMDRemoteLoginHandler *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMDRemoteLoginHandler *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDRemoteLoginHandler targetSupportsAccounts](self, "targetSupportsAccounts"))
  {
    v5 = (void *)MEMORY[0x227676638](-[HMDRemoteLoginHandler setLoggedInAccount:](self, "setLoggedInAccount:", v4));
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Posting event to update logged in account: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDRemoteLoginHandler workQueue](v6, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __49__HMDRemoteLoginHandler__postUpdatedAccountInfo___block_invoke;
    v14[3] = &unk_24E79C268;
    v14[4] = v6;
    v15 = v4;
    dispatch_async(v9, v14);

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to post account: %@ due to unsupported account target", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)_updateLoggedInAccount:(id)a3
{
  id v4;
  void *v5;
  HMDRemoteLoginHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteLoginHandler accessory](v6, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "supportsMessagedHomePodSettings");
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating logged in account to: %@, supportsMessagedHomePodSettings: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDRemoteLoginHandler accessory](v6, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsMessagedHomePodSettings");

  if (v12)
  {
    -[HMDRemoteLoginHandler _postUpdatedAccountInfo:](v6, "_postUpdatedAccountInfo:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F1B0], "entitledMessageWithName:messagePayload:", CFSTR("kRemoteLoginAccountUpdatedNotificationKey"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __updateLoggedInAccount(v6, v4, v13);

  }
}

- (void)_registerForUsernameUpdates
{
  void *v3;
  HMDRemoteLoginHandler *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Register for username updates", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", v4, CFSTR("HMDHomeManagerIDMSAccountUsernameDidUpdateNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", v4, sel_handleAccountUsernameUpdatedOnCurrentDevice_, CFSTR("HMDHomeManagerIDMSAccountUsernameDidUpdateNotification"), 0);

  -[HMDRemoteLoginHandler handleAccountUsernameUpdatedOnCurrentDevice:](v4, "handleAccountUsernameUpdatedOnCurrentDevice:", 0);
}

- (void)handleAccountUsernameUpdatedOnCurrentDevice:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDRemoteLoginHandler workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMDRemoteLoginHandler_handleAccountUsernameUpdatedOnCurrentDevice___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (NSSet)messageReceiverChildren
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteLoginHandler initiator](self, "initiator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDRemoteLoginHandler initiator](self, "initiator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[HMDRemoteLoginHandler receiver](self, "receiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDRemoteLoginHandler receiver](self, "receiver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[HMDRemoteLoginHandler anisetteDataHandler](self, "anisetteDataHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDRemoteLoginHandler anisetteDataHandler](self, "anisetteDataHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v10;
}

- (HMDRemoteLoginHandler)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDRemoteLoginHandler *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRemoteLoginAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMDRemoteLoginHandler initWithUUID:accessory:loggedInAccount:](self, "initWithUUID:accessory:loggedInAccount:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[HMDRemoteLoginHandler uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("kIdentifierKey"));

  -[HMDRemoteLoginHandler accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeConditionalObject:forKey:", v5, CFSTR("accessory"));

  -[HMDRemoteLoginHandler loggedInAccount](self, "loggedInAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("kRemoteLoginAccount"));

  if (objc_msgSend(v11, "hmd_isForXPCTransport"))
  {
    -[HMDRemoteLoginHandler initiator](self, "initiator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anisetteProviderBridge");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("kRemoteLoginAnisetterProviderBridge"));

    -[HMDRemoteLoginHandler stagedLoggedInAccount](self, "stagedLoggedInAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("kStagedRemoteLoginAccount"));

  }
}

- (void)stagedValue:(id)a3 didExpireValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDRemoteLoginHandler *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Unstaging logged in account: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDRemoteLoginHandler updateFrameworkWithReason:](v9, "updateFrameworkWithReason:", CFSTR("HMDRemoteLoginHandlerStagedLoggedInAccount"));

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMDRemoteLoginInitiator)initiator
{
  return self->_initiator;
}

- (HMDRemoteLoginReceiver)receiver
{
  return self->_receiver;
}

- (HMDAppleMediaAccessory)accessory
{
  return (HMDAppleMediaAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HMDRemoteLoginAnisetteDataHandler)anisetteDataHandler
{
  return self->_anisetteDataHandler;
}

- (ACAccount)loggedInAccount
{
  return self->_loggedInAccount;
}

- (void)setLoggedInAccount:(id)a3
{
  objc_storeStrong((id *)&self->_loggedInAccount, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEventStoreReadHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (HMEEventForwarder)eventForwarder
{
  return (HMEEventForwarder *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEventForwarder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (HMFStagedValue)stagedLoggedInAccount
{
  return (HMFStagedValue *)objc_getProperty(self, a2, 96, 1);
}

- (ACAccountStore)accountStore
{
  return (ACAccountStore *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)targetSupportsAccounts
{
  return self->_targetSupportsAccounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_stagedLoggedInAccount, 0);
  objc_storeStrong((id *)&self->_eventForwarder, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_loggedInAccount, 0);
  objc_storeStrong((id *)&self->_anisetteDataHandler, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

void __69__HMDRemoteLoginHandler_handleAccountUsernameUpdatedOnCurrentDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  +[HMDRemoteLoginUtilities primaryITunesAccount](HMDRemoteLoginUtilities, "primaryITunesAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F250], "defaultFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "privateStringForObjectValue:", v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v6;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@loggedInAccount On Update:%@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "loggedInAccount");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(*(id *)(a1 + 32), "loggedInAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "username");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "username");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating account on username change", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(*(id *)(a1 + 32), "_updateLoggedInAccount:", v2);
    }
  }

}

void __49__HMDRemoteLoginHandler__postUpdatedAccountInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "eventTopicForAccountInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventForwarder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventSource");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v2)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (v6 || v4 == 0)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138544386;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      v35 = v2;
      v36 = 2112;
      v37 = v3;
      v38 = 2112;
      v39 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to post event to update logged in account: %@ due to missing topic: %@ event forwarder: %@ event source: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "accountInfoForAccount:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accountInfoFromLastEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && objc_msgSend(v14, "isEqual:", v13))
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v19;
        v32 = 2112;
        v33 = v15;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Skip posting event to update logged in account as it matches account info from last event: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v23;
        v32 = 2112;
        v33 = v2;
        v34 = 2112;
        v35 = v13;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Forwarding account info event with topic: %@ for accountInfo: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      v24 = objc_alloc(MEMORY[0x24BE4ED90]);
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      v25 = (void *)objc_msgSend(v24, "initWithSource:cachePolicy:combineType:timestamp:", v5, 2, 2);
      v26 = objc_alloc(MEMORY[0x24BE4ED80]);
      objc_msgSend(v13, "protoData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithEventData:metadata:", v27, v25);

      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __49__HMDRemoteLoginHandler__postUpdatedAccountInfo___block_invoke_43;
      v29[3] = &unk_24E79BD80;
      v29[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "forwardEvent:topic:completion:", v28, v2, v29);

    }
  }

}

void __49__HMDRemoteLoginHandler__postUpdatedAccountInfo___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to forward account info event with error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_253464 != -1)
    dispatch_once(&logCategory__hmf_once_t1_253464, &__block_literal_global_253465);
  return (id)logCategory__hmf_once_v2_253466;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)remoteMessages
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[17];

  v8[16] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("kHMDRemoteLoginCompanionAuthenticationRequest");
  v8[1] = CFSTR("kHMDRemoteLoginProxyAuthenticationRequest");
  v8[2] = CFSTR("kHMDRemoteLoginAuthenticationResponse");
  v8[3] = CFSTR("kHMDRemoteLoginProxyDeviceRequest");
  v8[4] = CFSTR("kHMDRemoteLoginProxyDeviceResponse");
  v8[5] = CFSTR("kHMDRemoteLoginSignoutRequest");
  v2 = *MEMORY[0x24BDD7C88];
  v8[6] = *MEMORY[0x24BDD7C80];
  v8[7] = v2;
  v3 = *MEMORY[0x24BDD7C98];
  v8[8] = *MEMORY[0x24BDD7C90];
  v8[9] = v3;
  v4 = *MEMORY[0x24BDD7C58];
  v8[10] = *MEMORY[0x24BDD7C50];
  v8[11] = v4;
  v5 = *MEMORY[0x24BDD7C68];
  v8[12] = *MEMORY[0x24BDD7C60];
  v8[13] = v5;
  v6 = *MEMORY[0x24BDD7C78];
  v8[14] = *MEMORY[0x24BDD7C70];
  v8[15] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __36__HMDRemoteLoginHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_253466;
  logCategory__hmf_once_v2_253466 = v0;

}

@end
