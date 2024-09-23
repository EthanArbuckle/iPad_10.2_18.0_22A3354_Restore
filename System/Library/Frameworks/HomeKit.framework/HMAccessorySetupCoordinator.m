@implementation HMAccessorySetupCoordinator

+ (NSUUID)UUID
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("188914BD-5163-425C-9E59-CAE9BFA1A288"));
}

- (void)configure
{
  id v3;

  if (self)
  {
    objc_msgSend(objc_getProperty(self, a2, 8, 1), "messageDispatcher");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerForMessage:receiver:selector:", CFSTR("HMASC.m.updateStagingProgress"), self, sel_handleUpdateStagingProgressMessage_);

  }
}

- (HMAccessorySetupCoordinator)init
{
  HMMutableXPCMessageTransportConfiguration *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  _HMContext *v8;
  HMAccessorySetupCoordinator *v9;

  v3 = -[HMXPCMessageTransportConfiguration initWithMachServiceName:]([HMMutableXPCMessageTransportConfiguration alloc], "initWithMachServiceName:", CFSTR("com.apple.homed.xpc.accessory-setup"));
  HMDispatchQueueNameString(self, 0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create(v5, v6);
  -[HMXPCMessageTransportConfiguration setQueue:](v3, "setQueue:", v7);

  -[HMXPCMessageTransportConfiguration setRequiresHomeDataAccess:](v3, "setRequiresHomeDataAccess:", 0);
  v8 = -[_HMContext initWithXPCClientConfiguration:]([_HMContext alloc], "initWithXPCClientConfiguration:", v3);
  v9 = -[HMAccessorySetupCoordinator initWithContext:](self, "initWithContext:", v8);

  return v9;
}

- (HMAccessorySetupCoordinator)initWithContext:(id)a3
{
  id v5;
  HMAccessorySetupCoordinator *v6;
  HMAccessorySetupCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessorySetupCoordinator;
  v6 = -[HMAccessorySetupCoordinator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_msgSend((id)objc_opt_class(), "UUID");
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
    self = (HMAccessorySetupCoordinator *)objc_getProperty(self, a2, 8, 1);
  return (OS_dispatch_queue *)-[HMAccessorySetupCoordinator queue](self, "queue");
}

- (void)dealloc
{
  HMAccessorySetupCoordinator *v2;
  void *v3;
  objc_super v4;

  v2 = self;
  if (self)
    self = (HMAccessorySetupCoordinator *)objc_getProperty(self, a2, 8, 1);
  -[HMAccessorySetupCoordinator messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", v2);

  v4.receiver = v2;
  v4.super_class = (Class)HMAccessorySetupCoordinator;
  -[HMAccessorySetupCoordinator dealloc](&v4, sel_dealloc);
}

- (void)createSetupAccessoryPayloadWithSetupPayloadURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  HMAccessorySetupCoordinator *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (!v7)
    goto LABEL_10;
  +[HMAccessorySetupCoordinator setupPayloadURLFromSetupPayloadURLString:](HMAccessorySetupCoordinator, "setupPayloadURLFromSetupPayloadURLString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HMAccessorySetupCoordinator createSetupAccessoryPayloadWithSetupPayloadURL:completionHandler:](self, "createSetupAccessoryPayloadWithSetupPayloadURL:completionHandler:", v9, v8);
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to create setup payload URL from string: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v14);

  }
}

- (void)createSetupAccessoryPayloadWithSetupPayloadURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  HMSetupAccessoryPayload *v9;
  id v10;
  void *v11;
  HMAccessorySetupCoordinator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMAccessorySetupCoordinator *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_14:
    _HMFPreconditionFailure();
  }
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (!v7)
    goto LABEL_14;
  if (objc_msgSend((id)objc_opt_class(), "isHAPSetupPayloadURL:", v6))
  {
    v23 = 0;
    v9 = -[HMSetupAccessoryPayload initWithHAPSetupPayloadURL:error:]([HMSetupAccessoryPayload alloc], "initWithHAPSetupPayloadURL:error:", v6, &v23);
    v10 = v23;
    ((void (**)(_QWORD, HMSetupAccessoryPayload *, id))v8)[2](v8, v9, v10);

  }
  else if (objc_msgSend((id)objc_opt_class(), "isCHIPSetupPayloadURL:", v6))
  {
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Create setup accessory payload for CHIP setup payload URL"));
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v14;
      v28 = 2114;
      v29 = v16;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Creating setup accessory payload for CHIP setup payload URL: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v24 = CFSTR("HMASC.mk.setupPayloadURL");
    v25 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySetupCoordinator _createCHIPSetupAccessoryPayloadWithMessagePayload:activity:completionHandler:](v12, v17, v10, v8);

  }
  else
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scheme");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unsupported URL scheme %@ in setupPayloadURL: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v10);
  }

}

- (void)createSetupAccessoryPayloadWithCHIPDecimalStringRepresentation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMAccessorySetupCoordinator *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Create setup accessory payload with CHIP decimal string representation"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v13;
    v21 = 2114;
    v22 = v15;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Creating setup accessory payload with CHIP decimal string representation: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v17 = CFSTR("HMASC.mk.chipSetupPayloadDecimalStringRepresentation");
  v18 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetupCoordinator _createCHIPSetupAccessoryPayloadWithMessagePayload:activity:completionHandler:](v11, v16, v9, v8);

}

- (void)stageCHIPAccessoryPairingInStepsWithPayload:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HMAccessorySetupCoordinator *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  const char *v25;
  SEL v26;
  SEL v27;
  id Property;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, void *);
  void *v33;
  HMAccessorySetupCoordinator *v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    _HMFPreconditionFailure();
LABEL_8:
    Property = 0;
    goto LABEL_6;
  }
  a5 = v14;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Stage CHIP accessory pairing in steps"));
  v16 = (void *)MEMORY[0x1A1AC1AAC]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "shortDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v39 = v19;
    v40 = 2114;
    v41 = v21;
    v42 = 2112;
    v43 = v12;
    _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Staging CHIP accessory pairing in steps with payload: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
  v22 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend((id)objc_opt_class(), "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v22, "initWithTarget:", v23);

  v36[0] = CFSTR("HMASC.mk.shouldScanNetworks");
  v36[1] = CFSTR("HMASC.mk.setupAccessoryPayload");
  v37[0] = MEMORY[0x1E0C9AAB0];
  encodeRootObject(v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASC.m.stageCHIPAccessoryPairingInSteps"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __102__HMAccessorySetupCoordinator_stageCHIPAccessoryPairingInStepsWithPayload_delegate_completionHandler___block_invoke;
  v33 = &unk_1E3AB6200;
  v34 = v17;
  v35 = v15;
  v5 = v15;
  objc_msgSend(v8, "setResponseHandler:", &v30);
  if (!v17)
    goto LABEL_8;
  objc_setProperty_atomic(v17, v25, v13, 24);
  objc_setProperty_atomic_copy(v17, v26, a5, 16);
  Property = objc_getProperty(v17, v27, 8, 1);
LABEL_6:
  objc_msgSend(Property, "messageDispatcher", v30, v31, v32, v33, v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sendMessage:", v8);

}

- (void)stageCHIPAccessoryPairingInStepsWithPayload:(id)a3 delegate:(id)a4 scanningNetworks:(BOOL)a5 completionHandler:(id)a6
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  HMAccessorySetupCoordinator *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  SEL v30;
  SEL v31;
  id Property;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v11 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v15)
  {
LABEL_9:
    _HMFPreconditionFailure();
LABEL_10:
    Property = 0;
    goto LABEL_7;
  }
  v9 = v16;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Stage CHIP accessory pairing in steps"));
  v18 = (void *)MEMORY[0x1A1AC1AAC]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v35 = v15;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v34 = v9;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shortDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v41 = v21;
    v42 = 2114;
    v43 = v23;
    v44 = 2112;
    v45 = v14;
    v46 = 2112;
    v47 = v24;
    _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Staging CHIP accessory pairing in steps with payload: %@, shouldScanNetworks: %@", buf, 0x2Au);

    v9 = v34;
    v15 = v35;
  }

  objc_autoreleasePoolPop(v18);
  v25 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend((id)objc_opt_class(), "UUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v25, "initWithTarget:", v26);

  v38[0] = CFSTR("HMASC.mk.shouldScanNetworks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = CFSTR("HMASC.mk.setupAccessoryPayload");
  v39[0] = v27;
  encodeRootObject(v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASC.m.stageCHIPAccessoryPairingInSteps"), v7, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __119__HMAccessorySetupCoordinator_stageCHIPAccessoryPairingInStepsWithPayload_delegate_scanningNetworks_completionHandler___block_invoke;
  v36[3] = &unk_1E3AB6200;
  v36[4] = v19;
  v37 = v17;
  v6 = v17;
  objc_msgSend(v8, "setResponseHandler:", v36);
  if (!v19)
    goto LABEL_10;
  objc_setProperty_atomic(v19, v29, v15, 24);
  objc_setProperty_atomic_copy(v19, v30, v9, 16);
  Property = objc_getProperty(v19, v31, 8, 1);
LABEL_7:
  objc_msgSend(Property, "messageDispatcher");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sendMessage:", v8);

}

- (void)confirmDeviceCredentialForStagingRequestUUID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  void *v11;
  HMAccessorySetupCoordinator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  const char *v19;
  id Property;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  HMAccessorySetupCoordinator *v26;
  id v27;
  const __CFString *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    _HMFPreconditionFailure();
LABEL_8:
    Property = 0;
    goto LABEL_6;
  }
  v3 = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Confirm device credential"));
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v14;
    v32 = 2114;
    v33 = v16;
    v34 = 2112;
    v35 = v3;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Confirm device credential with request UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v17 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend((id)objc_opt_class(), "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v17, "initWithTarget:", v18);

  v28 = CFSTR("HMASC.mk.stagingRequestUUID");
  v29 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASC.m.confirmDeviceCredential"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __76__HMAccessorySetupCoordinator_confirmDeviceCredentialForStagingRequestUUID___block_invoke;
  v25 = &unk_1E3AB6200;
  v26 = v12;
  v27 = v10;
  v4 = v10;
  objc_msgSend(v7, "setResponseHandler:", &v22);
  if (!v12)
    goto LABEL_8;
  Property = objc_getProperty(v12, v19, 8, 1);
LABEL_6:
  objc_msgSend(Property, "messageDispatcher", v22, v23, v24, v25, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendMessage:", v7);

}

- (void)rejectDeviceCredentialForStagingRequestUUID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  void *v11;
  HMAccessorySetupCoordinator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  const char *v19;
  id Property;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  HMAccessorySetupCoordinator *v26;
  id v27;
  const __CFString *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    _HMFPreconditionFailure();
LABEL_8:
    Property = 0;
    goto LABEL_6;
  }
  v3 = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Reject device credential"));
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v14;
    v32 = 2114;
    v33 = v16;
    v34 = 2112;
    v35 = v3;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Rejecting device credential with request UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v17 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend((id)objc_opt_class(), "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v17, "initWithTarget:", v18);

  v28 = CFSTR("HMASC.mk.stagingRequestUUID");
  v29 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASC.m.rejectDeviceCredential"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __75__HMAccessorySetupCoordinator_rejectDeviceCredentialForStagingRequestUUID___block_invoke;
  v25 = &unk_1E3AB6200;
  v26 = v12;
  v27 = v10;
  v4 = v10;
  objc_msgSend(v7, "setResponseHandler:", &v22);
  if (!v12)
    goto LABEL_8;
  Property = objc_getProperty(v12, v19, 8, 1);
LABEL_6:
  objc_msgSend(Property, "messageDispatcher", v22, v23, v24, v25, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendMessage:", v7);

}

- (void)selectThreadNetworkAssociation:(id)a3 forStagingRequestUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMAccessorySetupCoordinator *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  id Property;
  void *v26;
  void *v27;
  HMAccessorySetupCoordinator *v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  id v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
    _HMFPreconditionFailure();
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Select Thread network association"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v13;
    v41 = 2114;
    v42 = v15;
    v43 = 2112;
    v44 = v8;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Select Thread network association with request UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  if (!v6)
  {
    v16 = 0;
    goto LABEL_8;
  }
  v38 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v38);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v38;
  v18 = v17;
  if (v16)
  {

LABEL_8:
    v19 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend((id)objc_opt_class(), "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithTarget:", v20);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, CFSTR("HMASC.mk.stagingRequestUUID"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("HMASC.mk.threadNetworkAssociation"));
    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASC.m.selectThreadNetworkAssociation"), v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __84__HMAccessorySetupCoordinator_selectThreadNetworkAssociation_forStagingRequestUUID___block_invoke_2;
    v34[3] = &unk_1E3AB6200;
    v34[4] = v11;
    v35 = v9;
    objc_msgSend(v23, "setResponseHandler:", v34);
    if (v11)
      Property = objc_getProperty(v11, v24, 8, 1);
    else
      Property = 0;
    objc_msgSend(Property, "messageDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sendMessage:", v23);

    goto LABEL_16;
  }
  v27 = (void *)MEMORY[0x1A1AC1AAC]();
  v28 = v11;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v30;
    v41 = 2112;
    v42 = v6;
    v43 = 2112;
    v44 = v18;
    _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode Thread network association %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v27);
  if (v28)
    v32 = objc_getProperty(v28, v31, 8, 1);
  else
    v32 = 0;
  objc_msgSend(v32, "delegateCaller");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __84__HMAccessorySetupCoordinator_selectThreadNetworkAssociation_forStagingRequestUUID___block_invoke;
  v36[3] = &unk_1E3AB5ED8;
  v36[4] = v28;
  v37 = v18;
  v16 = v18;
  objc_msgSend(v33, "invokeBlock:", v36);

LABEL_16:
}

- (void)selectWiFiNetworkAssociation:(id)a3 forStagingRequestUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMAccessorySetupCoordinator *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  id Property;
  void *v26;
  void *v27;
  HMAccessorySetupCoordinator *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  id v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
    _HMFPreconditionFailure();
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Select WiFi network association"));
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v13;
    v43 = 2114;
    v44 = v15;
    v45 = 2112;
    v46 = v6;
    v47 = 2112;
    v48 = v8;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Selecting WiFi network association %@ for request UUID: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  if (!v6)
  {
    v16 = 0;
    goto LABEL_8;
  }
  v40 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v40);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v40;
  v18 = v17;
  if (v16)
  {

LABEL_8:
    v19 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend((id)objc_opt_class(), "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithTarget:", v20);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, CFSTR("HMASC.mk.stagingRequestUUID"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("HMASC.mk.wifiNetworkAssociation"));
    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASC.m.selectWiFiNetworkAssociation"), v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __82__HMAccessorySetupCoordinator_selectWiFiNetworkAssociation_forStagingRequestUUID___block_invoke_2;
    v36[3] = &unk_1E3AB6200;
    v36[4] = v11;
    v37 = v9;
    objc_msgSend(v23, "setResponseHandler:", v36);
    if (v11)
      Property = objc_getProperty(v11, v24, 8, 1);
    else
      Property = 0;
    objc_msgSend(Property, "messageDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sendMessage:", v23);

    goto LABEL_16;
  }
  v27 = (void *)MEMORY[0x1A1AC1AAC]();
  v28 = v11;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "shortDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v30;
    v43 = 2114;
    v44 = v32;
    v45 = 2112;
    v46 = v6;
    v47 = 2112;
    v48 = v18;
    _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to encode WiFi network association %@: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v27);
  if (v28)
    v34 = objc_getProperty(v28, v33, 8, 1);
  else
    v34 = 0;
  objc_msgSend(v34, "delegateCaller");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __82__HMAccessorySetupCoordinator_selectWiFiNetworkAssociation_forStagingRequestUUID___block_invoke;
  v38[3] = &unk_1E3AB5ED8;
  v38[4] = v28;
  v39 = v18;
  v16 = v18;
  objc_msgSend(v35, "invokeBlock:", v38);

LABEL_16:
}

- (void)cancelStagingForStagingRequestUUID:(id)a3 completionHandler:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HMAccessorySetupCoordinator *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  const char *v22;
  id Property;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  const __CFString *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    _HMFPreconditionFailure();
LABEL_8:
    Property = 0;
    goto LABEL_6;
  }
  v12 = v11;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Cancel staging"));
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v17;
    v32 = 2114;
    v33 = v19;
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Cancelling staging with request UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  v20 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend((id)objc_opt_class(), "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v20, "initWithTarget:", v21);

  v28 = CFSTR("HMASC.mk.stagingRequestUUID");
  v29 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASC.m.cancelStaging"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __84__HMAccessorySetupCoordinator_cancelStagingForStagingRequestUUID_completionHandler___block_invoke;
  v25[3] = &unk_1E3AB60C8;
  v25[4] = v15;
  v26 = v13;
  v27 = v12;
  a4 = v12;
  v4 = v13;
  objc_msgSend(v7, "setResponseHandler:", v25);
  if (!v15)
    goto LABEL_8;
  Property = objc_getProperty(v15, v22, 8, 1);
LABEL_6:
  objc_msgSend(Property, "messageDispatcher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendMessage:", v7);

}

- (void)createCHIPSetupPayloadStringForStagedPairingWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HMAccessorySetupCoordinator *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  const char *v21;
  id Property;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  a4 = v11;
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
LABEL_10:
    Property = 0;
    goto LABEL_7;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Create CHIP setup code"));
  v13 = (void *)MEMORY[0x1A1AC1AAC]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shortDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v16;
    v31 = 2114;
    v32 = v18;
    v33 = 2112;
    v34 = v10;
    _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Creating CHIP setup payload string for staged accessory pairing with identifier: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  v19 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend((id)objc_opt_class(), "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v19, "initWithTarget:", v20);

  v27 = CFSTR("HMASC.mk.chipAccessoryPairingIdentifier");
  v28 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASC.m.createCHIPSetupPayloadString"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __108__HMAccessorySetupCoordinator_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler___block_invoke;
  v24[3] = &unk_1E3AB60C8;
  v24[4] = v14;
  v25 = v12;
  v26 = a4;
  a4 = a4;
  v4 = v12;
  objc_msgSend(v7, "setResponseHandler:", v24);
  if (!v14)
    goto LABEL_10;
  Property = objc_getProperty(v14, v21, 8, 1);
LABEL_7:
  objc_msgSend(Property, "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendMessage:", v7);

}

- (void)cancelStagedCHIPAccessoryPairingWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HMAccessorySetupCoordinator *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  const char *v22;
  id Property;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  const __CFString *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    _HMFPreconditionFailure();
LABEL_8:
    Property = 0;
    goto LABEL_6;
  }
  v12 = v11;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Cancel staged CHIP accessory pairing"));
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v17;
    v32 = 2114;
    v33 = v19;
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Canceling staged CHIP accessory pairing with identifier: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  v20 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend((id)objc_opt_class(), "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v20, "initWithTarget:", v21);

  v28 = CFSTR("HMASC.mk.chipAccessoryPairingIdentifier");
  v29 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASC.m.cancelStagedCHIPAccessoryPairing"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __96__HMAccessorySetupCoordinator_cancelStagedCHIPAccessoryPairingWithIdentifier_completionHandler___block_invoke;
  v25[3] = &unk_1E3AB60C8;
  v25[4] = v15;
  v26 = v13;
  v27 = v12;
  a4 = v12;
  v4 = v13;
  objc_msgSend(v7, "setResponseHandler:", v25);
  if (!v15)
    goto LABEL_8;
  Property = objc_getProperty(v15, v22, 8, 1);
LABEL_6:
  objc_msgSend(Property, "messageDispatcher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendMessage:", v7);

}

- (void)handleUpdateStagingProgressMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  HMAccessorySetupCoordinator *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const char *v15;
  const char *v16;
  id Property;
  void *v18;
  void *v19;
  HMAccessorySetupCoordinator *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  unint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("HMASC.mk.stagingRequestUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_numberForKey:", CFSTR("HMASC.mk.setupAccessoryProgress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v8)
  {
    v9 = objc_msgSend(v8, "unsignedIntegerValue");
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMSetupAccessoryProgressAsString(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateProgress with '%@' for staging request %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    if (v11)
      objc_getProperty(v11, v15, 24, 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v11)
        Property = objc_getProperty(v11, v16, 8, 1);
      else
        Property = 0;
      objc_msgSend(Property, "delegateCaller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __66__HMAccessorySetupCoordinator_handleUpdateStagingProgressMessage___block_invoke;
      v23[3] = &unk_1E3AB5C80;
      v23[4] = v11;
      v25 = v9;
      v24 = v6;
      objc_msgSend(v18, "invokeBlock:", v23);

    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Ignoring Update Staging Progress message without required parameters", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiStepStageDelegate, 0);
  objc_storeStrong(&self->_multiStepStageCompletionHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

uint64_t __66__HMAccessorySetupCoordinator_handleUpdateStagingProgressMessage___block_invoke(_QWORD *a1, const char *a2)
{
  id Property;

  Property = (id)a1[4];
  if (Property)
    Property = objc_getProperty(Property, a2, 24, 1);
  return objc_msgSend(Property, "didUpdateProgress:forStagingRequestUUID:", a1[6], a1[5]);
}

void __96__HMAccessorySetupCoordinator_cancelStagedCHIPAccessoryPairingWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  const char *v18;
  id Property;
  void *v20;
  _BYTE v21[24];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v21 = 138543874;
    *(_QWORD *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(_QWORD *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2112;
    v22 = v5;
    v14 = "%{public}@[%{public}@] Failed to cancel CHIP accessory pairing: %@";
    v15 = v10;
    v16 = OS_LOG_TYPE_ERROR;
    v17 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v21 = 138543618;
    *(_QWORD *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(_QWORD *)&v21[14] = v13;
    v14 = "%{public}@[%{public}@] Successfully canceled CHIP accessory pairing";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 22;
  }
  _os_log_impl(&dword_19B1B0000, v15, v16, v14, v21, v17);

LABEL_7:
  objc_autoreleasePoolPop(v7);
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v18, 8, 1);
  objc_msgSend(Property, "delegateCaller", *(_OWORD *)v21, *(_QWORD *)&v21[16], v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

void __108__HMAccessorySetupCoordinator_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  id Property;
  void *v17;
  id *v18;
  id *v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("HMASC.mk.setupPayloadString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = a1[4];
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v12;
      v37 = 2114;
      v38 = v14;
      v39 = 2112;
      v40 = v7;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully created CHIP setup payload string: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    Property = a1[4];
    if (Property)
      Property = objc_getProperty(Property, v15, 8, 1);
    objc_msgSend(Property, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __108__HMAccessorySetupCoordinator_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler___block_invoke_97;
    v29 = &unk_1E3AB60A0;
    v18 = &v31;
    v31 = a1[6];
    v19 = &v30;
    v30 = v7;
    v20 = &v26;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shortDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v21;
      v37 = 2114;
      v38 = v23;
      v39 = 2112;
      v40 = v6;
      v41 = 2112;
      v42 = v5;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find CHIP setup payload string in response payload %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    v25 = a1[4];
    if (v25)
      v25 = objc_getProperty(v25, v24, 8, 1);
    objc_msgSend(v25, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __108__HMAccessorySetupCoordinator_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler___block_invoke_96;
    v32[3] = &unk_1E3AB60A0;
    v18 = &v34;
    v34 = a1[6];
    v19 = &v33;
    v33 = v5;
    v20 = v32;
  }
  objc_msgSend(v17, "invokeBlock:", v20, v26, v27, v28, v29, v30);

}

uint64_t __108__HMAccessorySetupCoordinator_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler___block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __108__HMAccessorySetupCoordinator_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler___block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __84__HMAccessorySetupCoordinator_cancelStagingForStagingRequestUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  const char *v18;
  id Property;
  void *v20;
  _BYTE v21[24];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v21 = 138543874;
    *(_QWORD *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(_QWORD *)&v21[14] = v13;
    *(_WORD *)&v21[22] = 2112;
    v22 = v5;
    v14 = "%{public}@[%{public}@] Failed to cancel staging: %@";
    v15 = v10;
    v16 = OS_LOG_TYPE_ERROR;
    v17 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v21 = 138543618;
    *(_QWORD *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(_QWORD *)&v21[14] = v13;
    v14 = "%{public}@[%{public}@] Successfully cancelled staging";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 22;
  }
  _os_log_impl(&dword_19B1B0000, v15, v16, v14, v21, v17);

LABEL_7:
  objc_autoreleasePoolPop(v7);
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v18, 8, 1);
  objc_msgSend(Property, "delegateCaller", *(_OWORD *)v21, *(_QWORD *)&v21[16], v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

uint64_t __82__HMAccessorySetupCoordinator_selectWiFiNetworkAssociation_forStagingRequestUUID___block_invoke(uint64_t a1, const char *a2)
{
  id Property;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 16, 1);
  return (*((uint64_t (**)(id, _QWORD, _QWORD, _QWORD))Property + 2))(Property, 0, 0, *(_QWORD *)(a1 + 40));
}

void __82__HMAccessorySetupCoordinator_selectWiFiNetworkAssociation_forStagingRequestUUID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  -[HMAccessorySetupCoordinator handleMultiStepStageResponseError:payload:activity:](*(void **)(a1 + 32), a2, a3, *(void **)(a1 + 40));
}

- (void)handleMultiStepStageResponseError:(void *)a3 payload:(void *)a4 activity:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  SEL v26;
  id v27;
  SEL v28;
  SEL v29;
  SEL v30;
  void *v31;
  id *v32;
  id *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  const char *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  SEL v47;
  SEL v48;
  SEL v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  _QWORD v61[5];
  id v62;
  id v63;
  _QWORD v64[5];
  id v65;
  id v66;
  _QWORD v67[5];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[4];

  v91[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(v8, "hmf_UUIDForKey:", CFSTR("HMASC.mk.stagingRequestUUID"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = NSClassFromString(CFSTR("MTSDeviceCredential"));
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMASC.mk.deviceCredential"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v90[0] = objc_opt_class();
    v90[1] = NSClassFromString(CFSTR("MTSWiFiScanResult"));
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMASC.mk.wifiScanResults"), v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v89[0] = objc_opt_class();
    v89[1] = NSClassFromString(CFSTR("MTSThreadScanResult"));
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMASC.mk.threadScanResults"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "hmf_stringForKey:", CFSTR("HMASC.mk.chipAccessoryPairingIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_UUIDForKey:", CFSTR("HMASC.mk.devicePairingUUID"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = a1;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v54 = (void *)v13;
    v55 = (void *)v11;
    if (v11 || v13 || v15 || v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v52 = v7;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "shortDescription");
        v38 = v16;
        v39 = v15;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        v74 = v36;
        v75 = 2114;
        v76 = v40;
        v77 = 2112;
        v78 = v56;
        v79 = 2112;
        v80 = v55;
        v81 = 2112;
        v82 = v54;
        v83 = 2112;
        v84 = v39;
        v85 = 2112;
        v86 = v38;
        v87 = 2112;
        v88 = v53;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully completed a step in staged CHIP accessory pairing with response staging request UUID: %@, device credential: %@, WiFi scan results: %@, Thread scan results: %@, pairing identifier: %@, device pairing UUID: %@", buf, 0x52u);

        v15 = v39;
        v16 = v38;

        v7 = v52;
      }

      objc_autoreleasePoolPop(v17);
      if (v55)
      {
        objc_msgSend(objc_getProperty(v18, v41, 8, 1), "delegateCaller");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_118;
        v67[3] = &unk_1E3AB5CD0;
        v67[4] = v18;
        v68 = v55;
        v69 = v56;
        objc_msgSend(v42, "invokeBlock:", v67);

      }
      v35 = v53;
      v43 = v54;
      if (v54)
      {
        objc_msgSend(objc_getProperty(v18, v41, 8, 1), "delegateCaller");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_2;
        v64[3] = &unk_1E3AB5CD0;
        v64[4] = v18;
        v65 = v54;
        v66 = v56;
        objc_msgSend(v44, "invokeBlock:", v64);

      }
      if (v15)
      {
        objc_msgSend(objc_getProperty(v18, v41, 8, 1), "delegateCaller");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_3;
        v61[3] = &unk_1E3AB5CD0;
        v61[4] = v18;
        v62 = v15;
        v63 = v56;
        objc_msgSend(v45, "invokeBlock:", v61);

      }
      if (!v16)
        goto LABEL_20;
      v51 = v15;
      v46 = objc_getProperty(v18, v41, 16, 1);
      objc_setProperty_atomic_copy(v18, v47, 0, 16);
      objc_setProperty_atomic(v18, v48, 0, 24);
      objc_msgSend(objc_getProperty(v18, v49, 8, 1), "delegateCaller");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_4;
      v57[3] = &unk_1E3AB5C58;
      v32 = &v60;
      v60 = v46;
      v33 = &v58;
      v58 = v16;
      v59 = v53;
      v34 = v46;
      objc_msgSend(v50, "invokeBlock:", v57);

      v31 = v59;
    }
    else
    {
      v51 = 0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = v9;
        v22 = v7;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "shortDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v74 = v23;
        v75 = 2114;
        v76 = v25;
        v77 = 2112;
        v78 = v22;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to stage CHIP accessory pairing in steps: %@", buf, 0x20u);

        v7 = v22;
        v9 = v21;
        v16 = 0;
      }

      objc_autoreleasePoolPop(v17);
      v27 = objc_getProperty(v18, v26, 16, 1);
      objc_setProperty_atomic_copy(v18, v28, 0, 16);
      objc_setProperty_atomic(v18, v29, 0, 24);
      objc_msgSend(objc_getProperty(v18, v30, 8, 1), "delegateCaller");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke;
      v70[3] = &unk_1E3AB60A0;
      v32 = &v72;
      v72 = v27;
      v33 = &v71;
      v71 = v7;
      v34 = v27;
      objc_msgSend(v31, "invokeBlock:", v70);
      v35 = v53;
    }

    v43 = v54;
    v15 = v51;
LABEL_20:

  }
}

uint64_t __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_118(_QWORD *a1, const char *a2)
{
  id Property;

  Property = (id)a1[4];
  if (Property)
    Property = objc_getProperty(Property, a2, 24, 1);
  return objc_msgSend(Property, "didReceiveDeviceCredential:forStagingRequestUUID:", a1[5], a1[6]);
}

uint64_t __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_2(_QWORD *a1, const char *a2)
{
  id Property;

  Property = (id)a1[4];
  if (Property)
    Property = objc_getProperty(Property, a2, 24, 1);
  return objc_msgSend(Property, "didReceiveWiFiScanResults:forStagingRequestUUID:", a1[5], a1[6]);
}

uint64_t __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_3(_QWORD *a1, const char *a2)
{
  id Property;

  Property = (id)a1[4];
  if (Property)
    Property = objc_getProperty(Property, a2, 24, 1);
  return objc_msgSend(Property, "didReceiveThreadScanResults:forStagingRequestUUID:", a1[5], a1[6]);
}

uint64_t __82__HMAccessorySetupCoordinator_handleMultiStepStageResponseError_payload_activity___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __84__HMAccessorySetupCoordinator_selectThreadNetworkAssociation_forStagingRequestUUID___block_invoke(uint64_t a1, const char *a2)
{
  id Property;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 16, 1);
  return (*((uint64_t (**)(id, _QWORD, _QWORD, _QWORD))Property + 2))(Property, 0, 0, *(_QWORD *)(a1 + 40));
}

void __84__HMAccessorySetupCoordinator_selectThreadNetworkAssociation_forStagingRequestUUID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  -[HMAccessorySetupCoordinator handleMultiStepStageResponseError:payload:activity:](*(void **)(a1 + 32), a2, a3, *(void **)(a1 + 40));
}

void __75__HMAccessorySetupCoordinator_rejectDeviceCredentialForStagingRequestUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  -[HMAccessorySetupCoordinator handleMultiStepStageResponseError:payload:activity:](*(void **)(a1 + 32), a2, a3, *(void **)(a1 + 40));
}

void __76__HMAccessorySetupCoordinator_confirmDeviceCredentialForStagingRequestUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  -[HMAccessorySetupCoordinator handleMultiStepStageResponseError:payload:activity:](*(void **)(a1 + 32), a2, a3, *(void **)(a1 + 40));
}

void __119__HMAccessorySetupCoordinator_stageCHIPAccessoryPairingInStepsWithPayload_delegate_scanningNetworks_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  -[HMAccessorySetupCoordinator handleMultiStepStageResponseError:payload:activity:](*(void **)(a1 + 32), a2, a3, *(void **)(a1 + 40));
}

void __102__HMAccessorySetupCoordinator_stageCHIPAccessoryPairingInStepsWithPayload_delegate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  -[HMAccessorySetupCoordinator handleMultiStepStageResponseError:payload:activity:](*(void **)(a1 + 32), a2, a3, *(void **)(a1 + 40));
}

- (void)_createCHIPSetupAccessoryPayloadWithMessagePayload:(void *)a3 activity:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  SEL v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = (objc_class *)MEMORY[0x1E0D285D8];
    v10 = a2;
    v11 = [v9 alloc];
    objc_msgSend((id)objc_opt_class(), "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMASC.m.createCHIPSetupAccessoryPayload"), v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __109__HMAccessorySetupCoordinator__createCHIPSetupAccessoryPayloadWithMessagePayload_activity_completionHandler___block_invoke;
    v17[3] = &unk_1E3AB60C8;
    v17[4] = a1;
    v18 = v7;
    v19 = v8;
    objc_msgSend(v14, "setResponseHandler:", v17);
    objc_msgSend(objc_getProperty(a1, v15, 8, 1), "messageDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendMessage:", v14);

  }
}

void __109__HMAccessorySetupCoordinator__createCHIPSetupAccessoryPayloadWithMessagePayload_activity_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  id Property;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v39[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMASC.mk.setupAccessoryPayload"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = a1[4];
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v13;
      v33 = 2114;
      v34 = v15;
      v35 = 2112;
      v36 = v8;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully created setup accessory payload: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    Property = a1[4];
    if (Property)
      Property = objc_getProperty(Property, v16, 8, 1);
    objc_msgSend(Property, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __109__HMAccessorySetupCoordinator__createCHIPSetupAccessoryPayloadWithMessagePayload_activity_completionHandler___block_invoke_120;
    v26[3] = &unk_1E3AB60A0;
    v19 = &v28;
    v28 = a1[6];
    v27 = v8;
    objc_msgSend(v18, "invokeBlock:", v26);

    v20 = v27;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shortDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v32 = v21;
      v33 = 2114;
      v34 = v23;
      v35 = 2112;
      v36 = v6;
      v37 = 2112;
      v38 = v5;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find setup accessory payload in response payload %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    v25 = a1[4];
    if (v25)
      v25 = objc_getProperty(v25, v24, 8, 1);
    objc_msgSend(v25, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __109__HMAccessorySetupCoordinator__createCHIPSetupAccessoryPayloadWithMessagePayload_activity_completionHandler___block_invoke_119;
    v29[3] = &unk_1E3AB6078;
    v19 = &v30;
    v30 = a1[6];
    objc_msgSend(v20, "invokeBlock:", v29);
  }

}

void __109__HMAccessorySetupCoordinator__createCHIPSetupAccessoryPayloadWithMessagePayload_activity_completionHandler___block_invoke_119(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __109__HMAccessorySetupCoordinator__createCHIPSetupAccessoryPayloadWithMessagePayload_activity_completionHandler___block_invoke_120(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

+ (BOOL)isSetupPayloadURLString:(id)a3
{
  id v3;
  void *v4;

  v3 = a1;
  objc_msgSend(a1, "setupPayloadURLFromSetupPayloadURLString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isSetupPayloadURL:", v4);

  return (char)v3;
}

+ (BOOL)isSetupPayloadURL:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(a1, "isHAPSetupPayloadURL:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(a1, "isCHIPSetupPayloadURL:", v4);

  return v5;
}

+ (id)communicationProtocolForSetupPayloadURLString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "setupPayloadURLFromSetupPayloadURLString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend((id)objc_opt_class(), "isHAPSetupPayloadURL:", v4) & 1) != 0)
  {
    v5 = &unk_1E3B2E7B8;
  }
  else if (objc_msgSend((id)objc_opt_class(), "isCHIPSetupPayloadURL:", v4))
  {
    v5 = &unk_1E3B2E7D0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isHAPSetupPayloadURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("X-HM"));

  return v4;
}

+ (BOOL)isCHIPSetupPayloadURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CH")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("MT"));

  }
  return v5;
}

+ (id)setupPayloadURLFromSetupPayloadURLString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27 != -1)
    dispatch_once(&logCategory__hmf_once_t27, &__block_literal_global_40960);
  return (id)logCategory__hmf_once_v28;
}

void __42__HMAccessorySetupCoordinator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v28;
  logCategory__hmf_once_v28 = v0;

}

@end
