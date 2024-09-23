@implementation HMCameraObjectFetchClient

- (HMCameraObjectFetchClient)initWithUUID:(id)a3 context:(id)a4 messageName:(id)a5 destination:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMCameraObjectFetchClient *v15;
  HMCameraObjectFetchClient *v16;
  uint64_t v17;
  NSString *messageName;
  uint64_t v19;
  HMFMessageDestination *destination;
  NSDictionary *payload;
  uint64_t v22;
  NSMutableArray *fetchedObjects;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HMCameraObjectFetchClient;
  v15 = -[HMCameraObjectFetchClient init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_UUID, a3);
    objc_storeStrong((id *)&v16->_context, a4);
    v17 = objc_msgSend(v13, "copy");
    messageName = v16->_messageName;
    v16->_messageName = (NSString *)v17;

    v19 = objc_msgSend(v14, "copy");
    destination = v16->_destination;
    v16->_destination = (HMFMessageDestination *)v19;

    payload = v16->_payload;
    v16->_payload = (NSDictionary *)MEMORY[0x1E0C9AA70];

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    fetchedObjects = v16->_fetchedObjects;
    v16->_fetchedObjects = (NSMutableArray *)v22;

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HMCameraObjectFetchClient context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterReceiver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HMCameraObjectFetchClient;
  -[HMCameraObjectFetchClient dealloc](&v5, sel_dealloc);
}

- (void)fetchWithCompletion:(id)a3
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
  id v14;
  void *v15;
  HMCameraObjectFetchClient *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  HMCameraObjectFetchClient *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMCameraObjectFetchClient context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:selector:", CFSTR("HMCOFC.m.dfo"), self, sel_handleDidFetchObjectsMessage_);

  -[HMCameraObjectFetchClient payload](self, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[HMCameraObjectFetchClient UUID](self, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("HMCOFC.mk.u"));

  v10 = (void *)MEMORY[0x1E0D285F8];
  -[HMCameraObjectFetchClient messageName](self, "messageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraObjectFetchClient destination](self, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageWithName:destination:payload:", v11, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __49__HMCameraObjectFetchClient_fetchWithCompletion___block_invoke;
  v24 = &unk_1E3AB59B8;
  v25 = self;
  v14 = v4;
  v26 = v14;
  v15 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v13, "setResponseHandler:", &v21));
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v18;
    _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Fetching objects", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  -[HMCameraObjectFetchClient context](v16, "context", v21, v22, v23, v24, v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendMessage:", v13);

}

- (void)handleDidFetchObjectsMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  HMCameraObjectFetchClient *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  HMCameraObjectFetchClient *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  HMCameraObjectFetchClient *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  HMCameraObjectFetchClient *v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMCOFC.mk.fo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v15 = MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v18;
      v42 = 2112;
      v43 = (uint64_t)v19;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not find fetched objects in message payload: %@", buf, 0x16u);

    }
    v20 = (void *)v15;
    goto LABEL_21;
  }
  v7 = -[HMCameraObjectFetchClient classForUnarchiving](self, "classForUnarchiving");
  if (!v7)
  {
    v14 = v6;
    objc_opt_class();
    v21 = objc_opt_isKindOfClass() & 1;
    if (v21)
      v22 = v14;
    else
      v22 = 0;
    v23 = v22;

    if (v21)
    {
LABEL_12:
      v24 = (void *)MEMORY[0x1A1AC1AAC]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v14, "count");
        *(_DWORD *)buf = 138543618;
        v41 = v27;
        v42 = 2048;
        v43 = v28;
        _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_INFO, "%{public}@Handling %lu fetched objects", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      -[HMCameraObjectFetchClient fetchedObjects](v25, "fetchedObjects");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObjectsFromArray:", v14);

      objc_msgSend(v4, "respondWithPayload:", 0);
      goto LABEL_22;
    }
    v35 = MEMORY[0x1A1AC1AAC]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v38;
      v42 = 2112;
      v43 = (uint64_t)v14;
      _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_ERROR, "%{public}@No class for unarchiving and fetchedObjects was not already an array: %@", buf, 0x16u);

    }
    v20 = (void *)v35;
LABEL_21:
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v14);
    goto LABEL_22;
  }
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0CB3710];
  v10 = (void *)MEMORY[0x1E0C99E60];
  v46[0] = objc_opt_class();
  v46[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v12, v6, &v39);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v39;

  if (v13)
  {

    v14 = (id)v13;
    goto LABEL_12;
  }
  v30 = (void *)MEMORY[0x1A1AC1AAC]();
  v31 = self;
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v33;
    v42 = 2112;
    v43 = (uint64_t)v6;
    v44 = 2112;
    v45 = v14;
    _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could decode encoded fetched objects %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v30);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v34);

LABEL_22:
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMCameraObjectFetchClient UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMCameraObjectFetchClient context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)messageName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessageDestination)destination
{
  return (HMFMessageDestination *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)payload
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPayload:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (Class)classForUnarchiving
{
  return (Class)objc_getProperty(self, a2, 48, 1);
}

- (void)setClassForUnarchiving:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)fetchedObjects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedObjects, 0);
  objc_storeStrong((id *)&self->_classForUnarchiving, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

void __49__HMCameraObjectFetchClient_fetchWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
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
      *(_DWORD *)buf = 138543618;
      v26 = v11;
      v27 = 2112;
      v28 = (uint64_t)v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch objects: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __49__HMCameraObjectFetchClient_fetchWithCompletion___block_invoke_10;
    v22[3] = &unk_1E3AB60A0;
    v14 = &v24;
    v24 = *(id *)(a1 + 40);
    v23 = v5;
    objc_msgSend(v13, "invokeBlock:", v22);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "fetchedObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v15;
      v27 = 2048;
      v28 = objc_msgSend(v16, "count");
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched %lu objects", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __49__HMCameraObjectFetchClient_fetchWithCompletion___block_invoke_12;
    v20[3] = &unk_1E3AB60A0;
    v14 = &v21;
    v19 = *(id *)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v19;
    objc_msgSend(v18, "invokeBlock:", v20);

  }
}

uint64_t __49__HMCameraObjectFetchClient_fetchWithCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __49__HMCameraObjectFetchClient_fetchWithCompletion___block_invoke_12(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fetchedObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v3, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v1 + 16))(v1, v2, 0);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_32777 != -1)
    dispatch_once(&logCategory__hmf_once_t8_32777, &__block_literal_global_32778);
  return (id)logCategory__hmf_once_v9_32779;
}

void __40__HMCameraObjectFetchClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_32779;
  logCategory__hmf_once_v9_32779 = v0;

}

@end
