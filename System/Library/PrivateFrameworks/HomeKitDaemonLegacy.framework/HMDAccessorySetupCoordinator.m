@implementation HMDAccessorySetupCoordinator

- (HMDAccessorySetupCoordinator)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4 chipAccessoryServerBrowser:(id)a5 chipDataSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDAccessorySetupCoordinator *v16;
  HMDAccessorySetupCoordinator *v17;
  uint64_t v18;
  NSMutableDictionary *stagingRequestsByUUID;
  NSString *currentBundleIdentifier;
  id urlStringCHIPAccessorySetupPayloadFactory;
  id decimalStringRepresentationCHIPAccessorySetupPayloadFactory;
  id payloadCHIPAccessorySetupPayloadFactory;
  HMDAccessorySetupCoordinator *result;
  HMDAccessorySetupCoordinator *v25;
  SEL v26;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v25 = (HMDAccessorySetupCoordinator *)_HMFPreconditionFailure();
    -[HMDAccessorySetupCoordinator configure](v25, v26);
    return result;
  }
  v27.receiver = self;
  v27.super_class = (Class)HMDAccessorySetupCoordinator;
  v16 = -[HMDAccessorySetupCoordinator init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_workQueue, a3);
    objc_storeStrong((id *)&v17->_messageDispatcher, a4);
    objc_storeStrong((id *)&v17->_chipAccessoryServerBrowser, a5);
    objc_storeStrong((id *)&v17->_chipDataSource, a6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    stagingRequestsByUUID = v17->_stagingRequestsByUUID;
    v17->_stagingRequestsByUUID = (NSMutableDictionary *)v18;

    currentBundleIdentifier = v17->_currentBundleIdentifier;
    v17->_currentBundleIdentifier = 0;

    urlStringCHIPAccessorySetupPayloadFactory = v17->_urlStringCHIPAccessorySetupPayloadFactory;
    v17->_urlStringCHIPAccessorySetupPayloadFactory = &__block_literal_global_144468;

    decimalStringRepresentationCHIPAccessorySetupPayloadFactory = v17->_decimalStringRepresentationCHIPAccessorySetupPayloadFactory;
    v17->_decimalStringRepresentationCHIPAccessorySetupPayloadFactory = &__block_literal_global_45_144469;

    payloadCHIPAccessorySetupPayloadFactory = v17->_payloadCHIPAccessorySetupPayloadFactory;
    v17->_payloadCHIPAccessorySetupPayloadFactory = &__block_literal_global_47_144470;

  }
  return v17;
}

- (void)configure
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySetupCoordinator messageDispatcher](self, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB7F20];
  v39[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", v5, self, v6, sel_handleCreateCHIPSetupAccessoryPayloadMessage_);

  -[HMDAccessorySetupCoordinator messageDispatcher](self, "messageDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB7FB8];
  v38 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", v8, self, v9, sel_handleStageCHIPAccessoryPairingInStepsMessage_);

  -[HMDAccessorySetupCoordinator messageDispatcher](self, "messageDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CB7F18];
  v37 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerForMessage:receiver:policies:selector:", v11, self, v12, sel_handleConfirmDeviceCredentialMessage_);

  -[HMDAccessorySetupCoordinator messageDispatcher](self, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0CB7FA0];
  v36 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerForMessage:receiver:policies:selector:", v14, self, v15, sel_handleRejectDeviceCredentialMessage_);

  -[HMDAccessorySetupCoordinator messageDispatcher](self, "messageDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CB7FA8];
  v35 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerForMessage:receiver:policies:selector:", v17, self, v18, sel_handleSelectThreadNetworkAssociationMessage_);

  -[HMDAccessorySetupCoordinator messageDispatcher](self, "messageDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0CB7FB0];
  v34 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerForMessage:receiver:policies:selector:", v20, self, v21, sel_handleSelectWiFiNetworkAssociationMessage_);

  -[HMDAccessorySetupCoordinator messageDispatcher](self, "messageDispatcher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0CB7F10];
  v33 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerForMessage:receiver:policies:selector:", v23, self, v24, sel_handleCancelStagingMessage_);

  -[HMDAccessorySetupCoordinator messageDispatcher](self, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0CB7F28];
  v32 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerForMessage:receiver:policies:selector:", v26, self, v27, sel_handleCreateCHIPSetupPayloadMessage_);

  -[HMDAccessorySetupCoordinator messageDispatcher](self, "messageDispatcher");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0CB7F08];
  v31 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "registerForMessage:receiver:policies:selector:", v29, self, v30, sel_handleCancelStagedCHIPAccessoryPairingMessage_);

}

- (id)createCHIPSetupAccessoryPayloadWithSetupPayloadURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  HMDAccessorySetupCoordinator *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    _HMFPreconditionFailure();
  v7 = v6;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByRemovingPercentEncoding");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessorySetupCoordinator urlStringCHIPAccessorySetupPayloadFactory](self, "urlStringCHIPAccessorySetupPayloadFactory");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v11)[2](v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMDAccessorySetupCoordinator _setupPayloadWithCHIPSetupPayload:setupPayloadURL:](self, "_setupPayloadWithCHIPSetupPayload:setupPayloadURL:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
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
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create CHIP accessory setup payload from setup payload URL string: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)createSetupAccessoryPayloadWithCHIPSetupPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  HMDAccessorySetupCoordinator *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    _HMFPreconditionFailure();
  v7 = v6;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDAccessorySetupCoordinator payloadCHIPAccessorySetupPayloadFactory](self, "payloadCHIPAccessorySetupPayloadFactory");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v9)[2](v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDAccessorySetupCoordinator _setupPayloadWithCHIPSetupPayload:setupPayloadURL:](self, "_setupPayloadWithCHIPSetupPayload:setupPayloadURL:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to create CHIP accessory setup payload from setup payload %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)startMetricsForThirdPartyPairing
{
  void *v3;
  HMDAccessorySetupCoordinator *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessorySetupCoordinator *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Start metrics for 3rd party pairing", (uint8_t *)&v23, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAccessorySetupCoordinator metricsActivity](v4, "metricsActivity");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[HMDAccessorySetupCoordinator metricsActivity](v4, "metricsActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isValid");

    if (v10)
    {
      -[HMDAccessorySetupCoordinator metricsActivity](v4, "metricsActivity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

    }
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("CHIP Third Party Pairing"));
  -[HMDAccessorySetupCoordinator setMetricsActivity:](v4, "setMetricsActivity:", v12);

  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = v4;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0D33228];
    v23 = 138543874;
    v24 = v16;
    v25 = 2114;
    v26 = v17;
    v27 = 2112;
    v28 = CFSTR("Start");
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\", (uint8_t *)&v23, 0x20u);

  }
  else
  {
    v17 = *MEMORY[0x1E0D33228];
  }

  objc_autoreleasePoolPop(v13);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x1E0D334C8]);
  v20 = (void *)objc_msgSend(v19, "initWithTag:data:", v17, MEMORY[0x1E0C9AA70]);
  -[HMDAccessorySetupCoordinator metricsActivity](v14, "metricsActivity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "tagProcessorList");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "submitTaggedEvent:processorList:", v20, v22);

}

- (void)stopMetricsForThirdPartyPairingWithError:(id)a3
{
  id v4;
  void *v5;
  HMDAccessorySetupCoordinator *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  HMDAccessorySetupCoordinator *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v8;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Stop metrics for 3rd party pairing, error:%@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessorySetupCoordinator metricsActivity](v6, "metricsActivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isValid");

  if (v10)
  {
    if (v4)
    {
      -[HMDAccessorySetupCoordinator metricsActivity](v6, "metricsActivity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMMLogTagActivityWithError();
    }
    else
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = v6;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)*MEMORY[0x1E0D33230];
        v22 = 138543874;
        v23 = v15;
        v24 = 2114;
        v25 = v16;
        v26 = 2112;
        v27 = CFSTR("Stop");
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\", (uint8_t *)&v22, 0x20u);

      }
      else
      {
        v16 = (void *)*MEMORY[0x1E0D33230];
      }

      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc(MEMORY[0x1E0D334C8]);
      v18 = (void *)objc_msgSend(v17, "initWithTag:data:", v16, MEMORY[0x1E0C9AA70]);
      -[HMDAccessorySetupCoordinator metricsActivity](v13, "metricsActivity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "tagProcessorList");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "submitTaggedEvent:processorList:", v18, v20);

    }
    -[HMDAccessorySetupCoordinator metricsActivity](v6, "metricsActivity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "invalidate");

  }
}

- (void)handleCreateCHIPSetupAccessoryPayloadMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessorySetupCoordinator *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAccessorySetupCoordinator *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v9;
    v32 = 2112;
    v33 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling create CHIP setup accessory payload message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "URLForKey:", *MEMORY[0x1E0CB7F68]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", *MEMORY[0x1E0CB7F38]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
  {
    v27 = 0;
    v14 = (id *)&v27;
    -[HMDAccessorySetupCoordinator createCHIPSetupAccessoryPayloadWithSetupPayloadURL:error:](v7, "createCHIPSetupAccessoryPayloadWithSetupPayloadURL:error:", v11, &v27);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v12)
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v7;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v24;
        v32 = 2112;
        v33 = v25;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not find any setup information in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v26 = 0;
    v14 = (id *)&v26;
    -[HMDAccessorySetupCoordinator _createCHIPSetupAccessoryPayloadWithSetupPayloadDecimalStringRepresentation:error:](v7, "_createCHIPSetupAccessoryPayloadWithSetupPayloadDecimalStringRepresentation:error:", v12, &v26);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;
  v17 = *v14;
  if (!v16)
  {
LABEL_12:
    objc_msgSend(v4, "respondWithError:", v17);
    goto LABEL_13;
  }
  v28 = *MEMORY[0x1E0CB7F50];
  v18 = (void *)objc_msgSend(v16, "copy");
  encodeRootObjectForIncomingXPCMessage(v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithPayload:", v20);

LABEL_13:
}

- (void)handleStageCHIPAccessoryPairingInStepsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAccessorySetupCoordinator *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  HMDAccessorySetupCoordinator *v22;
  NSObject *v23;
  BOOL v24;
  void **v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t *v37;
  void *v38;
  id v39;
  HMDAccessorySetupCoordinator *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  HMDAccessorySetupCoordinator *v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  __CFString *v60;
  void *v61;
  __CFString *v62;
  void *v63;
  HMDAccessorySetupCoordinator *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  HMDAccessorySetupCoordinatorStagingRequest *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  HMDAccessorySetupCoordinator *v80;
  NSObject *v81;
  void *v82;
  __CFString *v83;
  void *v84;
  uint64_t v85;
  HMDAccessorySetupCoordinatorStagingRequest *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  void *v96;
  HMDAccessorySetupCoordinator *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  const __CFString *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _QWORD v111[5];
  HMDAccessorySetupCoordinatorStagingRequest *v112;
  id v113;
  _QWORD v114[5];
  HMDAccessorySetupCoordinatorStagingRequest *v115;
  _QWORD v116[5];
  HMDAccessorySetupCoordinatorStagingRequest *v117;
  _QWORD v118[5];
  HMDAccessorySetupCoordinatorStagingRequest *v119;
  id v120;
  _QWORD v121[5];
  HMDAccessorySetupCoordinatorStagingRequest *v122;
  id v123;
  _QWORD v124[5];
  HMDAccessorySetupCoordinatorStagingRequest *v125;
  id v126;
  uint8_t buf[4];
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  const __CFString *v132;
  __int16 v133;
  uint64_t v134;
  __int16 v135;
  void *v136;
  __int16 v137;
  uint64_t v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  uint64_t v142;
  __int16 v143;
  const __CFString *v144;
  __int16 v145;
  uint64_t v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  uint64_t v150;
  __int16 v151;
  void *v152;
  _QWORD v153[4];

  v153[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessorySetupCoordinator startMetricsForThirdPartyPairing](self, "startMetricsForThirdPartyPairing");
  -[HMDAccessorySetupCoordinator metricsActivity](self, "metricsActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB7F50];
  v153[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v95 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0CB7F70]);
    objc_msgSend(v9, "categoryNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "categoryNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = &unk_1E8B349F8;
    }
    objc_msgSend(v9, "productNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v108 = v6;
    if (v19)
    {
      objc_msgSend(v9, "productNumber");
      v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = CFSTR("Unknown");
    }
    v106 = v20;
    v107 = v11;
    v105 = v4;
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    v25 = (void **)MEMORY[0x1E0D33218];
    v26 = (uint64_t *)MEMORY[0x1E0D331E8];
    v27 = 0x1E0CB3000uLL;
    v28 = (uint64_t *)MEMORY[0x1E0D331E0];
    if (v24)
    {
      HMFGetLogIdentifier();
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = *v25;
      v102 = *v26;
      v109 = v21;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "communicationProtocol"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = *v28;
      v30 = *MEMORY[0x1E0D33208];
      v31 = *MEMORY[0x1E0D331D8];
      -[HMDAccessorySetupCoordinator currentBundleIdentifier](v22, "currentBundleIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *MEMORY[0x1E0D33210];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "requiresMatterCustomCommissioningFlow"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138546434;
      v128 = v96;
      v129 = 2114;
      v130 = v99;
      v27 = 0x1E0CB3000;
      v131 = 2112;
      v132 = CFSTR("Accessory Info");
      v133 = 2114;
      v134 = v102;
      v135 = 2112;
      v136 = v29;
      v137 = 2114;
      v138 = v93;
      v139 = 2112;
      v140 = v107;
      v141 = 2114;
      v100 = v31;
      v103 = v30;
      v142 = v30;
      v143 = 2112;
      v35 = v106;
      v144 = v106;
      v145 = 2114;
      v146 = v31;
      v36 = v33;
      v147 = 2112;
      v148 = v32;
      v149 = 2114;
      v150 = v33;
      v151 = 2112;
      v152 = v34;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x84u);

      v21 = v109;
      v37 = (uint64_t *)MEMORY[0x1E0D331E8];

      v25 = (void **)MEMORY[0x1E0D33218];
    }
    else
    {
      v36 = *MEMORY[0x1E0D33210];
      v103 = *MEMORY[0x1E0D33208];
      v100 = *MEMORY[0x1E0D331D8];
      v35 = v106;
      v37 = (uint64_t *)MEMORY[0x1E0D331E8];
    }

    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc(MEMORY[0x1E0D334C8]);
    v40 = v22;
    v41 = *v25;
    v42 = *v37;
    objc_msgSend(*(id *)(v27 + 2024), "numberWithInteger:", objc_msgSend(v9, "communicationProtocol"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v9;
    v44 = *MEMORY[0x1E0D331E0];
    v97 = v40;
    -[HMDAccessorySetupCoordinator currentBundleIdentifier](v40, "currentBundleIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v27 + 2024), "numberWithBool:", objc_msgSend(v110, "requiresMatterCustomCommissioningFlow"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v103;
    v87 = v42;
    HMDTaggedLoggingCreateDictionary();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v41;
    v48 = (void *)objc_msgSend(v39, "initWithTag:data:", v41, v47, v87, v43, v44, v107, v89, v35, v100, v45, v36, v46);
    objc_msgSend(v108, "tagProcessorList");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "submitTaggedEvent:processorList:", v48, v49);

    v9 = v110;
    objc_msgSend(v110, "chipAccessorySetupPayload");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v50)
    {
      v101 = v50;
      objc_msgSend(v50, "chipSetupPayload");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)MEMORY[0x1D17BA0A0]();
      v54 = v97;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = *MEMORY[0x1E0D33248];
        objc_msgSend(v52, "vendorID");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = *MEMORY[0x1E0D33238];
        v92 = v53;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v52, "supportsSoftAP"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = *MEMORY[0x1E0D331F8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v52, "hasShortDiscriminator"));
        v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545410;
        v128 = v91;
        v129 = 2114;
        v61 = v104;
        v130 = v104;
        v131 = 2112;
        v132 = CFSTR("Accessory Info");
        v133 = 2114;
        v98 = v56;
        v134 = v56;
        v135 = 2112;
        v136 = v90;
        v137 = 2114;
        v94 = v57;
        v138 = v57;
        v139 = 2112;
        v140 = v58;
        v141 = 2114;
        v142 = v59;
        v143 = 2112;
        v144 = v60;
        _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x5Cu);

        v53 = v92;
      }
      else
      {
        v98 = *MEMORY[0x1E0D33248];
        v94 = *MEMORY[0x1E0D33238];
        v59 = *MEMORY[0x1E0D331F8];
        v61 = v104;
      }

      objc_autoreleasePoolPop(v53);
      objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_alloc(MEMORY[0x1E0D334C8]);
      objc_msgSend(v52, "vendorID");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v52, "supportsSoftAP"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v52, "hasShortDiscriminator"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      HMDTaggedLoggingCreateDictionary();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = (void *)objc_msgSend(v68, "initWithTag:data:", v61, v72, v98, v69, v94, v70, v59, v71);
      objc_msgSend(v108, "tagProcessorList");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "submitTaggedEvent:processorList:", v73, v74);

      v75 = objc_alloc_init(HMDAccessorySetupCoordinatorStagingRequest);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySetupCoordinatorStagingRequest setPendingResponsePayloads:](v75, "setPendingResponsePayloads:", v76);

      v4 = v105;
      -[HMDAccessorySetupCoordinatorStagingRequest setPendingRequestMessage:](v75, "setPendingRequestMessage:", v105);
      -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v54, "stagingRequestsByUUID");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySetupCoordinatorStagingRequest UUID](v75, "UUID");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setObject:forKeyedSubscript:", v75, v78);

      v79 = (void *)MEMORY[0x1D17BA0A0]();
      v80 = v54;
      HMFGetOSLogHandle();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySetupCoordinatorStagingRequest UUID](v75, "UUID");
        v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v128 = v82;
        v129 = 2112;
        v130 = v52;
        v131 = 2112;
        v132 = v83;
        _os_log_impl(&dword_1CD062000, v81, OS_LOG_TYPE_INFO, "%{public}@Handling stage CHIP accessory pairing in steps message with setup payload: %@, request UUID: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v79);
      -[HMDAccessorySetupCoordinator chipAccessoryServerBrowser](v80, "chipAccessoryServerBrowser");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = MEMORY[0x1E0C809B0];
      v124[0] = MEMORY[0x1E0C809B0];
      v124[1] = 3221225472;
      v124[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke;
      v124[3] = &unk_1E89B9268;
      v124[4] = v80;
      v125 = v75;
      v6 = v108;
      v126 = v108;
      v121[0] = v85;
      v121[1] = 3221225472;
      v121[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_3;
      v121[3] = &unk_1E89B9290;
      v121[4] = v80;
      v122 = v125;
      v123 = v126;
      v118[0] = v85;
      v118[1] = 3221225472;
      v118[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_5;
      v118[3] = &unk_1E89B92B8;
      v118[4] = v80;
      v119 = v122;
      v120 = v123;
      v116[0] = v85;
      v116[1] = 3221225472;
      v116[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_7;
      v116[3] = &unk_1E89B92E0;
      v116[4] = v80;
      v117 = v119;
      v114[0] = v85;
      v114[1] = 3221225472;
      v114[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_9;
      v114[3] = &unk_1E89B9308;
      v114[4] = v80;
      v115 = v117;
      v111[0] = v85;
      v111[1] = 3221225472;
      v111[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_11;
      v111[3] = &unk_1E89B9330;
      v111[4] = v80;
      v112 = v115;
      v113 = v120;
      v86 = v115;
      LOBYTE(v88) = v95;
      objc_msgSend(v84, "stageAccessoryServerWithSetupPayload:fabricID:deviceCredentialHandler:wifiScanResultsHandler:threadScanResultsHandler:readyToCancelHandler:progressUpdateHandler:scanningNetworks:completionHandler:", v52, 0, v124, v121, v118, v116, v114, v88, v111);

      v9 = v110;
      v62 = (__CFString *)v106;
      v18 = v107;
      v51 = v101;
    }
    else
    {
      v18 = v107;
      v62 = (__CFString *)v35;
      v63 = (void *)MEMORY[0x1D17BA0A0]();
      v64 = v97;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      v4 = v105;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v128 = v66;
        v129 = 2112;
        v130 = v110;
        _os_log_impl(&dword_1CD062000, v65, OS_LOG_TYPE_ERROR, "%{public}@Could not find CHIP accessory setup payload on setup accessory payload: %@", buf, 0x16u);

        v9 = v110;
      }

      objc_autoreleasePoolPop(v63);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "respondWithError:", v52);
      v6 = v108;
      HMMLogTagActivityWithError();
      objc_msgSend(v108, "invalidate");
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v16 = v4;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v128 = v15;
      v129 = 2112;
      v130 = v17;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not find setup accessory payload in message payload: %@", buf, 0x16u);

      v4 = v16;
      v9 = 0;

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v18);
    HMMLogTagActivityWithError();
    objc_msgSend(v6, "invalidate");
  }

}

- (void)handleConfirmDeviceCredentialMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDAccessorySetupCoordinator *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessorySetupCoordinator *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDAccessorySetupCoordinator *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD);
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDAccessorySetupCoordinator *v37;
  NSObject *v38;
  void *v39;
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CB7F78]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543618;
      v41 = v11;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling confirm device credential message with staging request UUID: %@", (uint8_t *)&v40, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v8, "stagingRequestsByUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        v16 = v8;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "error");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 138543618;
          v41 = v18;
          v42 = 2112;
          v43 = v19;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Responding to confirm device credential message with queued pairing error: %@", (uint8_t *)&v40, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        objc_msgSend(v13, "error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v20);

        -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v16, "stagingRequestsByUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", 0, v6);
LABEL_9:

        goto LABEL_16;
      }
      objc_msgSend(v13, "confirmDeviceCredentialCompletionHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v36 = (void *)MEMORY[0x1D17BA0A0]();
        v37 = v8;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 138543618;
          v41 = v39;
          v42 = 2112;
          v43 = v6;
          _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@No pending confirm device credential completion handler exists for staging request UUID: %@", (uint8_t *)&v40, 0x16u);

        }
        objc_autoreleasePoolPop(v36);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v21);
        goto LABEL_9;
      }
      objc_msgSend(v13, "confirmDeviceCredentialCompletionHandler");
      v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v30[2](v30, 0);

      objc_msgSend(v13, "setConfirmDeviceCredentialCompletionHandler:", 0);
      objc_msgSend(v13, "pendingResponsePayloads");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (v32)
      {
        objc_msgSend(v13, "pendingResponsePayloads");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "pendingResponsePayloads");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "removeObjectAtIndex:", 0);

        objc_msgSend(v4, "respondWithPayload:", v34);
      }
      else
      {
        objc_msgSend(v13, "setPendingRequestMessage:", v4);
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = v8;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138543618;
        v41 = v27;
        v42 = 2112;
        v43 = v6;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request for confirm device credential message with staging request UUID: %@", (uint8_t *)&v40, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v28);

      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543618;
      v41 = v22;
      v42 = 2112;
      v43 = v23;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request in confirm device credential message payload: %@", (uint8_t *)&v40, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }
LABEL_16:

}

- (void)handleRejectDeviceCredentialMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDAccessorySetupCoordinator *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessorySetupCoordinator *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDAccessorySetupCoordinator *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDAccessorySetupCoordinator *v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  void (**v36)(_QWORD, _QWORD);
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CB7F78]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 138543618;
      v44 = v11;
      v45 = 2112;
      v46 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling reject device credential message with staging request UUID: %@", (uint8_t *)&v43, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v8, "stagingRequestsByUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        v16 = v8;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "error");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138543618;
          v44 = v18;
          v45 = 2112;
          v46 = v19;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Responding to reject device credential message with queued pairing error: %@", (uint8_t *)&v43, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        objc_msgSend(v13, "error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v20);

        -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v16, "stagingRequestsByUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", 0, v6);
        goto LABEL_23;
      }
      objc_msgSend(v13, "confirmDeviceCredentialCompletionHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v31 = (void *)MEMORY[0x1D17BA0A0]();
        v32 = v8;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138543618;
          v44 = v34;
          v45 = 2112;
          v46 = v6;
          v35 = "%{public}@No pending reject device credential completion handler exists for staging request UUID: %@";
          goto LABEL_21;
        }
LABEL_22:

        objc_autoreleasePoolPop(v31);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v21);
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(v13, "pendingRequestMessage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = (void *)MEMORY[0x1D17BA0A0]();
        v32 = v8;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138543618;
          v44 = v34;
          v45 = 2112;
          v46 = v6;
          v35 = "%{public}@A pending reject device credential message already exists for staging request UUID: %@";
LABEL_21:
          _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, v35, (uint8_t *)&v43, 0x16u);

          goto LABEL_22;
        }
        goto LABEL_22;
      }
      objc_msgSend(v13, "confirmDeviceCredentialCompletionHandler");
      v36 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v36)[2](v36, v37);

      objc_msgSend(v13, "setConfirmDeviceCredentialCompletionHandler:", 0);
      objc_msgSend(v13, "pendingResponsePayloads");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count");

      if (v39)
      {
        objc_msgSend(v13, "pendingResponsePayloads");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "pendingResponsePayloads");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "removeObjectAtIndex:", 0);

        objc_msgSend(v4, "respondWithPayload:", v41);
      }
      else
      {
        objc_msgSend(v13, "setPendingRequestMessage:", v4);
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = v8;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138543618;
        v44 = v27;
        v45 = 2112;
        v46 = v6;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request for reject device credential message with staging request UUID: %@", (uint8_t *)&v43, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v28);

      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 138543618;
      v44 = v22;
      v45 = 2112;
      v46 = v23;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request in reject device credential message payload: %@", (uint8_t *)&v43, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }
LABEL_24:

}

- (void)handleSelectThreadNetworkAssociationMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessorySetupCoordinator *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessorySetupCoordinator *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDAccessorySetupCoordinator *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDAccessorySetupCoordinator *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  HMDAccessorySetupCoordinator *v38;
  NSObject *v39;
  void *v40;
  const char *v41;
  void (**v42)(_QWORD, _QWORD);
  uint64_t v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CB7F78]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *MEMORY[0x1E0CB7F80];
    v43 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v13;
      v46 = 2112;
      v47 = v6;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling select Thread network message for request UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v11, "stagingRequestsByUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v29 = (void *)MEMORY[0x1D17BA0A0]();
      v30 = v11;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v32;
        v46 = 2112;
        v47 = v6;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request for select Thread network message with staging request UUID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v34 = 2;
      goto LABEL_23;
    }
    objc_msgSend(v15, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = v11;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "error");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v20;
        v46 = 2112;
        v47 = v21;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Responding to select Thread network message with queued pairing error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v15, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v22);

      -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v18, "stagingRequestsByUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", 0, v6);
      goto LABEL_24;
    }
    objc_msgSend(v15, "selectThreadNetworkHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v15, "pendingRequestMessage");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
      {
        objc_msgSend(v15, "selectThreadNetworkHandler");
        v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v42)[2](v42, v9);

        objc_msgSend(v15, "setSelectThreadNetworkHandler:", 0);
        objc_msgSend(v15, "setPendingRequestMessage:", v4);
        goto LABEL_25;
      }
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = v11;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v40;
      v46 = 2112;
      v47 = v6;
      v41 = "%{public}@A pending request message already exists for staging request UUID: %@";
    }
    else
    {
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = v11;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        objc_autoreleasePoolPop(v37);
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v34 = 52;
LABEL_23:
        objc_msgSend(v33, "hmErrorWithCode:", v34);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v23);
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v40;
      v46 = 2112;
      v47 = v6;
      v41 = "%{public}@No pending select Thread network completion handler exists for staging request UUID: %@";
    }
    _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, v41, buf, 0x16u);

    goto LABEL_22;
  }
  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v27;
    v46 = 2112;
    v47 = v28;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request in select-thread-network message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v9);
LABEL_26:

}

- (void)handleSelectWiFiNetworkAssociationMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessorySetupCoordinator *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessorySetupCoordinator *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDAccessorySetupCoordinator *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDAccessorySetupCoordinator *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  HMDAccessorySetupCoordinator *v38;
  NSObject *v39;
  void *v40;
  const char *v41;
  void (**v42)(_QWORD, _QWORD);
  uint64_t v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CB7F78]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *MEMORY[0x1E0CB7F90];
    v43 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v13;
      v46 = 2112;
      v47 = v6;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling select wifi network message for request UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v11, "stagingRequestsByUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v29 = (void *)MEMORY[0x1D17BA0A0]();
      v30 = v11;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v32;
        v46 = 2112;
        v47 = v6;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request for select wifi network message with staging request UUID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v34 = 2;
      goto LABEL_23;
    }
    objc_msgSend(v15, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = v11;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "error");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v20;
        v46 = 2112;
        v47 = v21;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Responding to select wifi network message with queued pairing error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v15, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v22);

      -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v18, "stagingRequestsByUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", 0, v6);
      goto LABEL_24;
    }
    objc_msgSend(v15, "selectWiFiNetworkHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v15, "pendingRequestMessage");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
      {
        objc_msgSend(v15, "selectWiFiNetworkHandler");
        v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v42)[2](v42, v9);

        objc_msgSend(v15, "setSelectWiFiNetworkHandler:", 0);
        objc_msgSend(v15, "setPendingRequestMessage:", v4);
        goto LABEL_25;
      }
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = v11;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v40;
      v46 = 2112;
      v47 = v6;
      v41 = "%{public}@A pending request message already exists for staging request UUID: %@";
    }
    else
    {
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = v11;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        objc_autoreleasePoolPop(v37);
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v34 = 52;
LABEL_23:
        objc_msgSend(v33, "hmErrorWithCode:", v34);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v23);
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v40;
      v46 = 2112;
      v47 = v6;
      v41 = "%{public}@No pending select wifi network completion handler exists for staging request UUID: %@";
    }
    _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, v41, buf, 0x16u);

    goto LABEL_22;
  }
  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v27;
    v46 = 2112;
    v47 = v28;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request in select-wifi-network message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v9);
LABEL_26:

}

- (void)handleCancelStagingMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDAccessorySetupCoordinator *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessorySetupCoordinator *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessorySetupCoordinator *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(void);
  void *v31;
  void *v32;
  void *v33;
  HMDAccessorySetupCoordinator *v34;
  NSObject *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CB7F78]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543618;
      v38 = v11;
      v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling cancel staging message with staging request UUID: %@", (uint8_t *)&v37, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v8, "stagingRequestsByUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        v16 = v8;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "error");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 138543618;
          v38 = v18;
          v39 = 2112;
          v40 = v19;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Responding to cancel staging message with success in presence of queued pairing error: %@", (uint8_t *)&v37, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v16, "stagingRequestsByUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, v6);

        objc_msgSend(v4, "respondWithSuccess");
      }
      else
      {
        objc_msgSend(v13, "cancelHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v8, "stagingRequestsByUUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKeyedSubscript:", 0, v6);

          objc_msgSend(v13, "cancelHandler");
          v30 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v30[2]();

          objc_msgSend(v4, "respondWithSuccess");
          objc_msgSend(v13, "pendingRequestMessage");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "respondWithError:", v32);

          objc_msgSend(v13, "setPendingRequestMessage:", 0);
        }
        else
        {
          v33 = (void *)MEMORY[0x1D17BA0A0]();
          v34 = v8;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 138543618;
            v38 = v36;
            v39 = 2112;
            v40 = v6;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Staging request UUID: %@ is not ready to cancel yet", (uint8_t *)&v37, 0x16u);

          }
          objc_autoreleasePoolPop(v33);
          objc_msgSend(v13, "setPendingCancelMessage:", v4);
        }
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = v8;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543618;
        v38 = v26;
        v39 = 2112;
        v40 = v6;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request for cancel staging message with staging request UUID: %@", (uint8_t *)&v37, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v27);

      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543618;
      v38 = v21;
      v39 = 2112;
      v40 = v22;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find staging request in cancel staging message payload: %@", (uint8_t *)&v37, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }

}

- (void)handleCreateCHIPSetupPayloadMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  HMDAccessorySetupCoordinator *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAccessorySetupCoordinator *v21;
  NSObject *v22;
  BOOL v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  HMDAccessorySetupCoordinator *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDAccessorySetupCoordinator *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDAccessorySetupCoordinator *v48;
  NSObject *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  _QWORD v54[5];
  id v55;
  uint64_t v56;
  void *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "stringForKey:", *MEMORY[0x1E0CB7F30]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDAccessorySetupCoordinator chipAccessoryServerBrowser](self, "chipAccessoryServerBrowser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stagedAccessoryServerWithIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMDAccessorySetupCoordinator currentBundleIdentifier](self, "currentBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB8D08]);

      if ((v10 & 1) == 0)
      {
        -[HMDAccessorySetupCoordinator metricsActivity](self, "metricsActivity");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11
          || (v12 = (void *)v11,
              -[HMDAccessorySetupCoordinator metricsActivity](self, "metricsActivity"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "isValid"),
              v13,
              v12,
              (v14 & 1) == 0))
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          v16 = self;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v59 = v18;
            _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Starting metrics collection for 3rd party pairing via locker", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v15);
          -[HMDAccessorySetupCoordinator startMetricsForThirdPartyPairing](v16, "startMetricsForThirdPartyPairing");
          -[HMDAccessorySetupCoordinator metricsActivity](v16, "metricsActivity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "startPairingMetricWithActivity:", v19);

          v20 = (void *)MEMORY[0x1D17BA0A0]();
          v21 = v16;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
          v24 = (uint64_t *)MEMORY[0x1E0D331D8];
          if (v23)
          {
            HMFGetLogIdentifier();
            v53 = v20;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)*MEMORY[0x1E0D33218];
            v27 = *v24;
            -[HMDAccessorySetupCoordinator currentBundleIdentifier](v21, "currentBundleIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v59 = v25;
            v60 = 2114;
            v61 = v26;
            v62 = 2112;
            v63 = CFSTR("Accessory Info");
            v64 = 2114;
            v65 = v27;
            v66 = 2112;
            v67 = v28;
            _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

            v29 = v26;
            v20 = v53;
          }
          else
          {
            v29 = (void *)*MEMORY[0x1E0D33218];
          }

          objc_autoreleasePoolPop(v20);
          objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_alloc(MEMORY[0x1E0D334C8]);
          -[HMDAccessorySetupCoordinator currentBundleIdentifier](v21, "currentBundleIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            v56 = *MEMORY[0x1E0D331D8];
            -[HMDAccessorySetupCoordinator currentBundleIdentifier](v21, "currentBundleIdentifier");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = v53;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v43 = (void *)MEMORY[0x1E0C9AA70];
          }
          v44 = (void *)objc_msgSend(v41, "initWithTag:data:", v29, v43);
          -[HMDAccessorySetupCoordinator metricsActivity](v21, "metricsActivity");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "tagProcessorList");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "submitTaggedEvent:processorList:", v44, v46);

          if (v42)
          {

          }
        }
      }
      v47 = (void *)MEMORY[0x1D17BA0A0]();
      v48 = self;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v50;
        v60 = 2112;
        v61 = v8;
        _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_INFO, "%{public}@Opening pairing window with PIN on CHIP accessory server: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v47);
      +[HMDHAPAccessory chipPairingModeActiveDuration](HMDHAPAccessory, "chipPairingModeActiveDuration");
      v52 = v51;
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __68__HMDAccessorySetupCoordinator_handleCreateCHIPSetupPayloadMessage___block_invoke;
      v54[3] = &unk_1E89BFFB0;
      v54[4] = v48;
      v55 = v4;
      objc_msgSend(v8, "openPairingWindowWithPINForDuration:completionHandler:", v54, v52);

    }
    else
    {
      v35 = (void *)MEMORY[0x1D17BA0A0]();
      v36 = self;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v38;
        v60 = 2112;
        v61 = v6;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@Could not find CHIP accessory server with identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v39);

      v8 = 0;
    }
  }
  else
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v33;
      v60 = 2112;
      v61 = v34;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could not find CHIP accessory pairing identifier in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v8);
  }

}

- (void)handleCancelStagedCHIPAccessoryPairingMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDAccessorySetupCoordinator *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
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
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "stringForKey:", *MEMORY[0x1E0CB7F30]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Discarding staged accessory server with identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessorySetupCoordinator chipAccessoryServerBrowser](v8, "chipAccessoryServerBrowser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__HMDAccessorySetupCoordinator_handleCancelStagedCHIPAccessoryPairingMessage___block_invoke;
    v16[3] = &unk_1E89C21C0;
    v16[4] = v8;
    v17 = v4;
    objc_msgSend(v12, "discardStagedAccessoryServerWithIdentifier:completionHandler:", v6, v16);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find CHIP accessory pairing identifier in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);

  }
}

- (id)_createCHIPSetupAccessoryPayloadWithSetupPayloadDecimalStringRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  HMDAccessorySetupCoordinator *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    _HMFPreconditionFailure();
  v7 = v6;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDAccessorySetupCoordinator decimalStringRepresentationCHIPAccessorySetupPayloadFactory](self, "decimalStringRepresentationCHIPAccessorySetupPayloadFactory");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v9)[2](v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDAccessorySetupCoordinator _setupPayloadWithCHIPSetupPayload:setupPayloadURL:](self, "_setupPayloadWithCHIPSetupPayload:setupPayloadURL:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to create CHIP accessory setup payload from decimal string representation: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)_setupPayloadWithCHIPSetupPayload:(id)a3 setupPayloadURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAccessorySetupCoordinator *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDAccessorySetupCoordinator *v30;
  NSObject *v31;
  void *v32;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    _HMFPreconditionFailure();
  v8 = v7;
  v9 = objc_alloc(MEMORY[0x1E0CBA700]);
  objc_msgSend(v6, "setupCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithSetupCode:communicationProtocol:", v11, 2);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA388]), "initWithCHIPSetupPayload:", v6);
  objc_msgSend(v12, "setChipAccessorySetupPayload:", v13);

  objc_msgSend(v12, "setSetupPayloadURL:", v8);
  objc_msgSend(v6, "setupID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSetupID:", v14);

  objc_msgSend(v12, "setSupportsIP:", objc_msgSend(v6, "supportsIP"));
  objc_msgSend(v12, "setSupportsBTLE:", objc_msgSend(v6, "supportsBLE"));
  objc_msgSend(v12, "setSupportsWAC:", objc_msgSend(v6, "supportsSoftAP"));
  objc_msgSend(v6, "vendorID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "productID");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v15 && v16)
  {
    -[HMDAccessorySetupCoordinator chipDataSource](self, "chipDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "vendorMetadataStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "metadata");
    v20 = v15;
    v21 = v17;
    v22 = self;
    v23 = v8;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vendorID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "vendorWithID:", v25);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v23;
    self = v22;
    v17 = v21;
    v15 = v20;

    objc_msgSend(v6, "productID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "productWithID:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "categoryNumber");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCategoryNumber:", v28);

  }
  v29 = (void *)MEMORY[0x1D17BA0A0]();
  v30 = self;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v32;
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Created CHIP setup accessory payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v29);

  return v12;
}

- (void)_handleStagedPairingDeviceCredential:(id)a3 completionHandler:(id)a4 forRequest:(id)a5 activity:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  HMDAccessorySetupCoordinator *v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDAccessorySetupCoordinator *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v18;
    v38 = 2112;
    v39 = v10;
    v40 = 2112;
    v41 = v19;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Handling device credential %@ for request UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v12, "UUID", *MEMORY[0x1E0CB7F78]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v20;
  v34[1] = *MEMORY[0x1E0CB7F40];
  encodeRootObject();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pendingRequestMessage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v12, "pendingRequestMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "respondWithPayload:", v22);

    v25 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v12, "setPendingRequestMessage:", 0));
    v26 = v16;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)*MEMORY[0x1E0D331F0];
      *(_DWORD *)buf = 138543874;
      v37 = v28;
      v38 = 2114;
      v39 = v29;
      v40 = 2112;
      v41 = CFSTR("Device credential sent to client");
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\", buf, 0x20u);

    }
    else
    {
      v29 = (void *)*MEMORY[0x1E0D331F0];
    }

    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_alloc(MEMORY[0x1E0D334C8]);
    v32 = (void *)objc_msgSend(v31, "initWithTag:data:", v29, MEMORY[0x1E0C9AA70]);
    objc_msgSend(v13, "tagProcessorList");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "submitTaggedEvent:processorList:", v32, v33);

  }
  else
  {
    objc_msgSend(v12, "pendingResponsePayloads");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v22);
  }

  objc_msgSend(v12, "setConfirmDeviceCredentialCompletionHandler:", v11);
}

- (void)_handleStagedPairingWiFiNetworkScanResults:(id)a3 completionHandler:(id)a4 forRequest:(id)a5 activity:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  HMDAccessorySetupCoordinator *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAccessorySetupCoordinator *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, _QWORD))a4;
  v12 = a5;
  v13 = a6;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v18;
    v39 = 2112;
    v40 = v10;
    v41 = 2112;
    v42 = v19;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Handling WiFi scan results %@ for request UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v12, "selectWiFiNetworkHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

  }
  else
  {
    objc_msgSend(v12, "selectThreadNetworkHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      if (v10)
      {
        v35[0] = *MEMORY[0x1E0CB7F78];
        objc_msgSend(v12, "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v27;
        v35[1] = *MEMORY[0x1E0CB7F98];
        encodeRootObject();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v12, "UUID", *MEMORY[0x1E0CB7F78]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v12, "setSelectWiFiNetworkHandler:", v11);
      objc_msgSend(v12, "pendingRequestMessage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v12, "pendingRequestMessage");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "respondWithPayload:", v29);

        objc_msgSend(v12, "setPendingRequestMessage:", 0);
      }
      else
      {
        objc_msgSend(v12, "pendingResponsePayloads");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v29);

      }
      goto LABEL_9;
    }
  }
  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = v16;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v25;
    v39 = 2112;
    v40 = v26;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received WiFi scan results for request UUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  v11[2](v11, 0);
LABEL_9:

}

- (void)_handleStagedPairingThreadNetworkScanResults:(id)a3 completionHandler:(id)a4 forRequest:(id)a5 activity:(id)a6
{
  id v10;
  uint64_t (**v11)(id, _QWORD);
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  HMDAccessorySetupCoordinator *v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAccessorySetupCoordinator *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMDAccessorySetupCoordinator *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDAccessorySetupCoordinator *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[2];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (uint64_t (**)(id, _QWORD))a4;
  v12 = a5;
  v13 = a6;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v18;
    v52 = 2112;
    v53 = v10;
    v54 = 2112;
    v55 = v19;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Handling Thread scan results %@ for request UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v12, "selectWiFiNetworkHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

LABEL_6:
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = v16;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v25;
      v52 = 2112;
      v53 = v26;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received Thread scan results for request UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v27 = v11[2](v11, 0);
    v28 = (void *)MEMORY[0x1D17BA0A0](v27);
    v29 = v23;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)*MEMORY[0x1E0D33220];
      *(_DWORD *)buf = 138543874;
      v51 = v31;
      v52 = 2114;
      v53 = v32;
      v54 = 2112;
      v55 = CFSTR("Unexpected thread scan results");
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\", buf, 0x20u);

    }
    else
    {
      v32 = (void *)*MEMORY[0x1E0D33220];
    }

    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_alloc(MEMORY[0x1E0D334C8]);
    v35 = (void *)objc_msgSend(v34, "initWithTag:data:", v32, MEMORY[0x1E0C9AA70]);
    objc_msgSend(v13, "tagProcessorList");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "submitTaggedEvent:processorList:", v35, v36);
    goto LABEL_12;
  }
  objc_msgSend(v12, "selectThreadNetworkHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    goto LABEL_6;
  if (v10)
  {
    objc_msgSend(v12, "UUID", *MEMORY[0x1E0CB7F78]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v37;
    v48[1] = *MEMORY[0x1E0CB7F88];
    encodeRootObject();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = (void *)MEMORY[0x1E0C9AA70];
  }
  objc_msgSend(v12, "setSelectThreadNetworkHandler:", v11);
  objc_msgSend(v12, "pendingRequestMessage");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
  {
    objc_msgSend(v12, "pendingResponsePayloads");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v33);
    goto LABEL_13;
  }
  objc_msgSend(v12, "pendingRequestMessage");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "respondWithPayload:", v33);

  v41 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v12, "setPendingRequestMessage:", 0));
  v42 = v16;
  HMFGetOSLogHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)*MEMORY[0x1E0D33240];
    *(_DWORD *)buf = 138543874;
    v51 = v44;
    v52 = 2114;
    v53 = v45;
    v54 = 2112;
    v55 = CFSTR("Thread Scan Results Ready");
    _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\", buf, 0x20u);

  }
  else
  {
    v45 = (void *)*MEMORY[0x1E0D33240];
  }

  objc_autoreleasePoolPop(v41);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_alloc(MEMORY[0x1E0D334C8]);
  v36 = (void *)objc_msgSend(v46, "initWithTag:data:", v45, MEMORY[0x1E0C9AA70]);
  objc_msgSend(v13, "tagProcessorList");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "submitTaggedEvent:processorList:", v36, v47);

LABEL_12:
LABEL_13:

}

- (void)_handleStagedPairingReadyToCancel:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDAccessorySetupCoordinator *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessorySetupCoordinator *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v12;
    v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling ready to cancel for request UUID: %@", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v7, "pendingCancelMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v10;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Responding to a pending Cancel message", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v7, "pendingCancelMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "respondWithSuccess");

    objc_msgSend(v7, "pendingRequestMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v7, "pendingRequestMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "respondWithError:", v22);

    }
    -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v16, "stagingRequestsByUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", 0, v24);

  }
  else
  {
    objc_msgSend(v7, "setCancelHandler:", v6);
  }

}

- (void)_handleStagedPairingProgressState:(int64_t)a3 forRequest:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  HMDAccessorySetupCoordinator *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
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
    objc_msgSend(v6, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v11;
    v27 = 2048;
    v28 = a3;
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling progress state (%ld) for request UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  if ((unint64_t)(a3 - 1) > 0x25)
    v13 = 15;
  else
    v13 = qword_1CDB8F0D0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID", *MEMORY[0x1E0CB7F78]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = *MEMORY[0x1E0CB7F58];
  v24[0] = v15;
  v24[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D285F8], "entitledMessageWithName:messagePayload:", *MEMORY[0x1E0CB7FC0], v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDAccessorySetupCoordinator messageTargetUUID](v9, "messageTargetUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);
  objc_msgSend(v17, "setDestination:", v20);

  -[HMDAccessorySetupCoordinator messageDispatcher](v9, "messageDispatcher");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v21, "sendMessage:", v22);

}

- (void)_handleStagedPairingServer:(id)a3 error:(id)a4 forRequest:(id)a5 activity:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  HMDAccessorySetupCoordinator *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessorySetupCoordinator *v24;
  NSObject *v25;
  BOOL v26;
  void **v27;
  void *v28;
  __CFString *v29;
  id v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  HMDAccessorySetupCoordinator *v39;
  NSObject *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  HMDAccessorySetupCoordinator *v44;
  NSObject *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  HMDAccessorySetupCoordinator *v53;
  NSObject *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  HMDAccessorySetupCoordinator *v61;
  NSObject *v62;
  void *v63;
  __CFString *v64;
  void *v65;
  void *v66;
  HMDAccessorySetupCoordinator *v67;
  NSObject *v68;
  _BOOL4 v69;
  void *v70;
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  __CFString *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  __CFString *v85;
  _QWORD v86[5];
  id v87;
  id v88;
  __CFString *v89;
  id v90;
  uint64_t v91;
  NSObject *v92;
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  __CFString *v96;
  __int16 v97;
  const __CFString *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  v13 = a6;
  -[HMDAccessorySetupCoordinator workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  objc_msgSend(v10, "identifier");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v94 = v19;
    v95 = 2112;
    v96 = v15;
    v97 = 2112;
    v98 = v11;
    v99 = 2112;
    v100 = v20;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Handling staged pairing identifier %@ and error %@ for request UUID: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v16);
  v85 = v15;
  if (!v15
    || (objc_msgSend(v12, "pendingRequestMessage"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v21))
  {
    objc_msgSend(v10, "productID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v84 = v13;
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = v17;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
      v27 = (void **)MEMORY[0x1E0D33200];
      if (v26)
      {
        HMFGetLogIdentifier();
        v83 = v23;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (__CFString *)*MEMORY[0x1E0D33218];
        v30 = v12;
        v31 = v11;
        v32 = *v27;
        objc_msgSend(v10, "productID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v94 = v28;
        v95 = 2114;
        v96 = v29;
        v97 = 2112;
        v98 = CFSTR("Accessory Info");
        v99 = 2114;
        v100 = v32;
        v11 = v31;
        v12 = v30;
        v101 = 2112;
        v102 = v33;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

        v23 = v83;
      }
      else
      {
        v29 = (__CFString *)*MEMORY[0x1E0D33218];
      }

      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_alloc(MEMORY[0x1E0D334C8]);
      objc_msgSend(v10, "productID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v91 = *MEMORY[0x1E0D33200];
        objc_msgSend(v10, "productID");
        v25 = objc_claimAutoreleasedReturnValue();
        v92 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v37 = (void *)MEMORY[0x1E0C9AA70];
      }
      v48 = (void *)objc_msgSend(v35, "initWithTag:data:", v29, v37);
      objc_msgSend(v84, "tagProcessorList");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "submitTaggedEvent:processorList:", v48, v49);

      if (v36)
      {

      }
      v13 = v84;
      v15 = v85;
    }
    objc_msgSend(v10, "startPairingMetricWithActivity:", v13);
    -[HMDAccessorySetupCoordinator stagingRequestsByUUID](v17, "stagingRequestsByUUID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setObject:forKeyedSubscript:", 0, v51);

    if (v15)
    {
      v52 = (void *)MEMORY[0x1D17BA0A0]();
      v53 = v17;
      HMFGetOSLogHandle();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUID");
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v94 = v55;
        v95 = 2112;
        v96 = v15;
        v97 = 2112;
        v98 = v56;
        _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_INFO, "%{public}@Successfully staged CHIP accessory server with identifier %@ in multiple steps for request UUID: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v52);
      -[HMDAccessorySetupCoordinator chipAccessoryServerBrowser](v53, "chipAccessoryServerBrowser");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "systemCommissionerPairingManager");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __85__HMDAccessorySetupCoordinator__handleStagedPairingServer_error_forRequest_activity___block_invoke;
      v86[3] = &unk_1E89B9358;
      v86[4] = v53;
      v87 = v12;
      v88 = v13;
      v89 = v15;
      v90 = v10;
      objc_msgSend(v58, "fetchSystemCommissionerPairingsWithCompletionHandler:", v86);

      goto LABEL_41;
    }
    mapHAPPairingErrorToHMError(v11);
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)MEMORY[0x1D17BA0A0]();
    v61 = v17;
    HMFGetOSLogHandle();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v94 = v63;
      v95 = 2112;
      v96 = v64;
      v97 = 2112;
      v98 = v59;
      _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage CHIP accessory pairing for request UUID %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v60);
    objc_msgSend(v12, "pendingRequestMessage");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = (void *)MEMORY[0x1D17BA0A0]();
    v67 = v61;
    HMFGetOSLogHandle();
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = os_log_type_enabled(v68, OS_LOG_TYPE_INFO);
    if (!v65)
    {
      if (v69)
      {
        HMFGetLogIdentifier();
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUID");
        v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v94 = v79;
        v95 = 2112;
        v96 = v59;
        v97 = 2112;
        v98 = v80;
        _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_INFO, "%{public}@Queueing staging error %@ for request UUID: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v66);
      if (v59)
      {
        objc_msgSend(v12, "setError:", v59);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setError:", v82);

      }
      v15 = v85;
      goto LABEL_40;
    }
    if (v69)
    {
      HMFGetLogIdentifier();
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v94 = v70;
      v95 = 2112;
      v96 = v71;
      v97 = 2112;
      v98 = v59;
      _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_INFO, "%{public}@Responding for request UUID %@ with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v66);
    objc_msgSend(v12, "pendingRequestMessage");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "respondWithError:", v59);

    -[__CFString domain](v59, "domain");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v73;
    if (v73 == (void *)*MEMORY[0x1E0CB8C70])
    {
      v81 = -[__CFString code](v59, "code");

      v15 = v85;
      if (v81 == 13)
      {
LABEL_40:

        goto LABEL_41;
      }
    }
    else
    {

      v15 = v85;
    }
    HMMLogTagActivityWithError();
    objc_msgSend(v13, "invalidate");
    goto LABEL_40;
  }
  v38 = (void *)MEMORY[0x1D17BA0A0]();
  v39 = v17;
  HMFGetOSLogHandle();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v94 = v41;
    v95 = 2112;
    v96 = v42;
    _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received staged pairing identifier for request UUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v38);
  v43 = (void *)MEMORY[0x1D17BA0A0]();
  v44 = v39;
  HMFGetOSLogHandle();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (__CFString *)*MEMORY[0x1E0D33220];
    *(_DWORD *)buf = 138543874;
    v94 = v46;
    v95 = 2114;
    v96 = v47;
    v97 = 2112;
    v98 = CFSTR("unexpected pairing server");
    _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\", buf, 0x20u);

  }
  else
  {
    v47 = (__CFString *)*MEMORY[0x1E0D33220];
  }

  objc_autoreleasePoolPop(v43);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_alloc(MEMORY[0x1E0D334C8]);
  v77 = (void *)objc_msgSend(v76, "initWithTag:data:", v47, MEMORY[0x1E0C9AA70]);
  objc_msgSend(v13, "tagProcessorList");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "submitTaggedEvent:processorList:", v77, v78);

  v15 = v85;
LABEL_41:

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CBA308], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_msgSend(MEMORY[0x1E0CBA308], "UUID");
}

- (NSString)currentBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (HMMTRAccessoryServerBrowser)chipAccessoryServerBrowser
{
  return (HMMTRAccessoryServerBrowser *)objc_getProperty(self, a2, 32, 1);
}

- (HMDCHIPDataSource)chipDataSource
{
  return (HMDCHIPDataSource *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)stagingRequestsByUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (HMFActivity)metricsActivity
{
  return (HMFActivity *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMetricsActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (id)urlStringCHIPAccessorySetupPayloadFactory
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setUrlStringCHIPAccessorySetupPayloadFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (id)decimalStringRepresentationCHIPAccessorySetupPayloadFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setDecimalStringRepresentationCHIPAccessorySetupPayloadFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (id)payloadCHIPAccessorySetupPayloadFactory
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setPayloadCHIPAccessorySetupPayloadFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_payloadCHIPAccessorySetupPayloadFactory, 0);
  objc_storeStrong(&self->_decimalStringRepresentationCHIPAccessorySetupPayloadFactory, 0);
  objc_storeStrong(&self->_urlStringCHIPAccessorySetupPayloadFactory, 0);
  objc_storeStrong((id *)&self->_metricsActivity, 0);
  objc_storeStrong((id *)&self->_stagingRequestsByUUID, 0);
  objc_storeStrong((id *)&self->_chipDataSource, 0);
  objc_storeStrong((id *)&self->_chipAccessoryServerBrowser, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentBundleIdentifier, 0);
}

void __85__HMDAccessorySetupCoordinator__handleStagedPairingServer_error_forRequest_activity___block_invoke(id *a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  BOOL v26;
  uint64_t *v27;
  void *v28;
  void *v29;
  uint64_t *v30;
  __CFString *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  NSObject *v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  _QWORD v66[3];
  _QWORD v67[5];

  v67[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __85__HMDAccessorySetupCoordinator__handleStagedPairingServer_error_forRequest_activity___block_invoke_130;
    v52[3] = &unk_1E89BFF38;
    v53 = a1[7];
    -[__CFString na_firstObjectPassingTest:](v5, "na_firstObjectPassingTest:", v52);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1D17BA0A0]();
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
        objc_msgSend(v7, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (const __CFString *)a1[7];
        *(_DWORD *)buf = 138543874;
        v57 = v12;
        v58 = 2112;
        v59 = v13;
        v60 = 2112;
        v61 = v14;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Passing back pairing UUID %@ for staged pairing identifier: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(a1[5], "pendingRequestMessage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = *MEMORY[0x1E0CB7F78];
      objc_msgSend(a1[5], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x1E0CB7F30];
      v18 = a1[7];
      v67[0] = v16;
      v67[1] = v18;
      v19 = *MEMORY[0x1E0CB7F48];
      v66[1] = v17;
      v66[2] = v19;
      objc_msgSend(v7, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v67[2] = v20;
      v21 = 0x1E0C99000uLL;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "respondWithPayload:", v22);

      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = a1[4];
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
      v27 = (uint64_t *)MEMORY[0x1E0D331C8];
      if (v26)
      {
        HMFGetLogIdentifier();
        v51 = v23;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)*MEMORY[0x1E0D331C0];
        v30 = v27;
        v31 = v5;
        v32 = v7;
        v33 = v6;
        v34 = *v30;
        objc_msgSend(a1[8], "softwareVersionString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v57 = v28;
        v58 = 2114;
        v59 = v29;
        v60 = 2112;
        v61 = CFSTR("Firmware version");
        v62 = 2114;
        v63 = v34;
        v6 = v33;
        v7 = v32;
        v5 = v31;
        v64 = 2112;
        v65 = v35;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

        v21 = 0x1E0C99000;
        v23 = v51;
      }
      else
      {
        v29 = (void *)*MEMORY[0x1E0D331C0];
      }

      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_alloc(MEMORY[0x1E0D334C8]);
      objc_msgSend(a1[8], "softwareVersionString");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        v54 = *MEMORY[0x1E0D331C8];
        objc_msgSend(a1[8], "softwareVersionString");
        v25 = objc_claimAutoreleasedReturnValue();
        v55 = v25;
        objc_msgSend(*(id *)(v21 + 3456), "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = (void *)MEMORY[0x1E0C9AA70];
      }
      v49 = (void *)objc_msgSend(v46, "initWithTag:data:", v29, v48);
      objc_msgSend(a1[6], "tagProcessorList");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "submitTaggedEvent:processorList:", v49, v50);

      if (v47)
      {

      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = a1[7];
        *(_DWORD *)buf = 138543874;
        v57 = v42;
        v58 = 2112;
        v59 = v43;
        v60 = 2112;
        v61 = v5;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not find system commissioner pairing for newly staged server with identifier %@ in all pairings: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "pendingRequestMessage");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "respondWithError:", v44);

      HMMLogTagActivityWithError();
      objc_msgSend(a1[6], "invalidate");
    }

    v40 = v53;
  }
  else
  {
    v36 = (void *)MEMORY[0x1D17BA0A0]();
    v37 = a1[4];
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v39;
      v58 = 2112;
      v59 = v6;
      _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@System commissioner failed to fetch pairings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, 0, 0, 0, v6);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "pendingRequestMessage");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "respondWithError:", v40);

    HMMLogTagActivityWithError();
    objc_msgSend(a1[6], "invalidate");
  }

}

uint64_t __85__HMDAccessorySetupCoordinator__handleStagedPairingServer_error_forRequest_activity___block_invoke_130(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0D332B8];
  objc_msgSend(a2, "nodeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifierStringWithCHIPNodeID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));
  return v6;
}

void __78__HMDAccessorySetupCoordinator_handleCancelStagedCHIPAccessoryPairingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to discard staged accessory server: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v8 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "respondWithError:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "respondWithSuccess");
  }

}

void __68__HMDAccessorySetupCoordinator_handleCreateCHIPSetupPayloadMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v13 = *MEMORY[0x1E0CB7F60];
    v14 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v7);
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to open pairing window with PIN: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "respondWithError:", v7);
  }

}

void __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_2;
  block[3] = &unk_1E89C0598;
  v8 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v15 = v6;
  v13 = v8;
  v14 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_4;
  block[3] = &unk_1E89C0598;
  v8 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v15 = v6;
  v13 = v8;
  v14 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_6;
  block[3] = &unk_1E89C0598;
  v8 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v15 = v6;
  v13 = v8;
  v14 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_8;
  block[3] = &unk_1E89C1B48;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v8 = v5;
  v6 = v3;
  dispatch_async(v4, block);

}

void __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_9(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_10;
  block[3] = &unk_1E89BE2F0;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = a2;
  v7 = v5;
  dispatch_async(v4, block);

}

void __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_11(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_12;
  block[3] = &unk_1E89C1710;
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v7;
  v15 = v9;
  v16 = *(id *)(a1 + 48);
  v10 = v7;
  v11 = v6;
  dispatch_async(v8, block);

}

uint64_t __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStagedPairingServer:error:forRequest:activity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStagedPairingProgressState:forRequest:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStagedPairingReadyToCancel:forRequest:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStagedPairingThreadNetworkScanResults:completionHandler:forRequest:activity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStagedPairingWiFiNetworkScanResults:completionHandler:forRequest:activity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __78__HMDAccessorySetupCoordinator_handleStageCHIPAccessoryPairingInStepsMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStagedPairingDeviceCredential:completionHandler:forRequest:activity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

id __110__HMDAccessorySetupCoordinator_initWithWorkQueue_messageDispatcher_chipAccessoryServerBrowser_chipDataSource___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D33280];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithCHIPSetupPayload:", v3);

  return v4;
}

id __110__HMDAccessorySetupCoordinator_initWithWorkQueue_messageDispatcher_chipAccessoryServerBrowser_chipDataSource___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D33280];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithSetupCodeString:", v3);

  return v4;
}

id __110__HMDAccessorySetupCoordinator_initWithWorkQueue_messageDispatcher_chipAccessoryServerBrowser_chipDataSource___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D33280];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithSetupPayloadString:", v3);

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t75 != -1)
    dispatch_once(&logCategory__hmf_once_t75, &__block_literal_global_138_144480);
  return (id)logCategory__hmf_once_v76;
}

void __43__HMDAccessorySetupCoordinator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v76;
  logCategory__hmf_once_v76 = v0;

}

@end
