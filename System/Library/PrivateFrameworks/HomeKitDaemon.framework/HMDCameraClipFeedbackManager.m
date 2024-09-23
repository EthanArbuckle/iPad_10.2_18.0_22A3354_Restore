@implementation HMDCameraClipFeedbackManager

- (HMDCameraClipFeedbackManager)initWithLocalZone:(id)a3 cloudZone:(id)a4 home:(id)a5 messageDispatcher:(id)a6 cameraProfileUUID:(id)a7 messageTargetUUID:(id)a8 workQueue:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  HMDCameraClipFeedbackUploader *v23;
  HMDCameraClipFeedbackManager *v24;
  HMDCameraClipFeedbackManager *v26;
  SEL v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v20)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  v22 = v21;
  if (v21)
  {
    v23 = objc_alloc_init(HMDCameraClipFeedbackUploader);
    v24 = -[HMDCameraClipFeedbackManager initWithLocalZone:cloudZone:home:messageDispatcher:cameraProfileUUID:messageTargetUUID:workQueue:feedbackUploader:](self, "initWithLocalZone:cloudZone:home:messageDispatcher:cameraProfileUUID:messageTargetUUID:workQueue:feedbackUploader:", v15, v16, v17, v18, v19, v20, v22, v23);

    return v24;
  }
LABEL_15:
  v26 = (HMDCameraClipFeedbackManager *)_HMFPreconditionFailure();
  return -[HMDCameraClipFeedbackManager initWithLocalZone:cloudZone:home:messageDispatcher:cameraProfileUUID:messageTargetUUID:workQueue:feedbackUploader:](v26, v27, v28, v29, v30, v31, v32, v33, a9, v34);
}

- (HMDCameraClipFeedbackManager)initWithLocalZone:(id)a3 cloudZone:(id)a4 home:(id)a5 messageDispatcher:(id)a6 cameraProfileUUID:(id)a7 messageTargetUUID:(id)a8 workQueue:(id)a9 feedbackUploader:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  HMDCameraClipFeedbackManager *v25;
  HMDCameraClipFeedbackManager *v26;
  uint64_t v27;
  NSUUID *cameraProfileUUID;
  HMDCameraClipFeedbackManager *result;
  HMDCameraClipFeedbackManager *v30;
  SEL v31;
  BOOL v32;
  id obj;
  id v35;
  id v36;
  void *v38;
  objc_super v39;

  v15 = a3;
  v35 = a4;
  v16 = a4;
  v17 = a5;
  v36 = a6;
  v18 = a6;
  v19 = a7;
  obj = a8;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v38 = v15;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v16)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v17)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v18)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v19)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v20)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v21)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  v23 = v22;
  if (!v22)
  {
LABEL_19:
    v30 = (HMDCameraClipFeedbackManager *)_HMFPreconditionFailure();
    -[HMDCameraClipFeedbackManager configureWithIsCurrentDeviceResidentCapable:](v30, v31, v32);
    return result;
  }
  v24 = v17;
  v39.receiver = self;
  v39.super_class = (Class)HMDCameraClipFeedbackManager;
  v25 = -[HMDCameraClipFeedbackManager init](&v39, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeWeak((id *)&v25->_home, v24);
    v27 = objc_msgSend(v19, "copy");
    cameraProfileUUID = v26->_cameraProfileUUID;
    v26->_cameraProfileUUID = (NSUUID *)v27;

    objc_storeStrong((id *)&v26->_messageTargetUUID, obj);
    objc_storeStrong((id *)&v26->_feedbackUploader, a10);
    objc_storeStrong((id *)&v26->_workQueue, a9);
    objc_storeStrong((id *)&v26->_localZone, a3);
    objc_storeStrong((id *)&v26->_cloudZone, v35);
    objc_storeStrong((id *)&v26->_messageDispatcher, v36);
  }

  return v26;
}

- (void)configureWithIsCurrentDeviceResidentCapable:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  HMDCameraClipFeedbackManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDCameraClipFeedbackManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDCameraClipFeedbackManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraClipFeedbackManager workQueue](self, "workQueue");
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
    v32 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Configuring clip feedback manager", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipFeedbackManager home](v7, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 133);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v10, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipFeedbackManager messageDispatcher](v7, "messageDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BDD5520];
    v30[0] = v11;
    v30[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerForMessage:receiver:policies:selector:", v14, v7, v15, sel__handleSubmitClipsMessage_);

    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "residentDeviceManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v17);

      +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraClipFeedbackManager messageDispatcher](v7, "messageDispatcher");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "registerForMessage:receiver:policies:selector:", CFSTR("HMDCameraClipFeedbackFindAndUploadSubmittedClipsMessage"), v7, v20, sel__handleFindAndUploadSubmittedClipsMessage_);

      -[HMDCameraClipFeedbackManager _findAndUploadSubmittedClips](v7, "_findAndUploadSubmittedClips");
    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v7;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Current device is not resident capable, clip uploading is not available", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v7;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot configure clip feedback manager because home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  NSObject *v3;
  void *v4;

  -[HMDCameraClipFeedbackManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraClipFeedbackManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isCurrentDeviceConfirmedPrimaryResident");

  return (char)v3;
}

- (id)_performCloudPull
{
  NSObject *v3;
  void *v4;
  HMDCameraClipFeedbackManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraClipFeedbackManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Performing cloud pull", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Explicit fetch"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipFeedbackManager cloudZone](v5, "cloudZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performCloudPullWithOptions:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BE6B628];
  -[HMDCameraClipFeedbackManager workQueue](v5, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "schedulerWithDispatchQueue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reschedule:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __49__HMDCameraClipFeedbackManager__performCloudPull__block_invoke;
  v17[3] = &unk_24E79BD80;
  v17[4] = v5;
  objc_msgSend(v14, "addFailureBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_findAndUploadSubmittedClips
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  HMDCameraClipFeedbackManager *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraClipFeedbackManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDCameraClipFeedbackManager isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    -[HMDCameraClipFeedbackManager _performCloudPull](self, "_performCloudPull");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__HMDCameraClipFeedbackManager__findAndUploadSubmittedClips__block_invoke;
    v10[3] = &unk_24E798920;
    v10[4] = self;
    v5 = (id)objc_msgSend(v4, "addCompletionBlock:", v10);

  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device is not a confirmed primary resident, will not upload clips", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
}

- (void)_uploadNextClipFromQueryResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDCameraClipFeedbackManager *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDCameraClipFeedbackManager *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraClipFeedbackManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      v19 = "%{public}@No more clips left to upload";
      v20 = v17;
      v21 = OS_LOG_TYPE_INFO;
      v22 = 12;
LABEL_11:
      _os_log_impl(&dword_2218F0000, v20, v21, v19, buf, v22);

    }
LABEL_12:

    objc_autoreleasePoolPop(v15);
    goto LABEL_17;
  }
  if (!-[HMDCameraClipFeedbackManager isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v18;
      v33 = 2112;
      v34 = v6;
      v19 = "%{public}@Current device is not a confirmed primary resident, will not upload clip %@";
      v20 = v17;
      v21 = OS_LOG_TYPE_DEFAULT;
      v22 = 22;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v7 = objc_msgSend(v6, "feedbackStatus");
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7 == 2)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v12;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Clip %@ was already uploaded", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraClipFeedbackManager workQueue](v9, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__HMDCameraClipFeedbackManager__uploadNextClipFromQueryResult___block_invoke;
    block[3] = &unk_24E79C268;
    block[4] = v9;
    v30 = v4;
    dispatch_async(v13, block);

    v14 = v30;
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Uploading clip %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraClipFeedbackManager feedbackUploader](v9, "feedbackUploader");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipFeedbackManager cameraProfileUUID](v9, "cameraProfileUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __63__HMDCameraClipFeedbackManager__uploadNextClipFromQueryResult___block_invoke_81;
    v26[3] = &unk_24E799FD0;
    v26[4] = v9;
    v27 = v6;
    v28 = v4;
    objc_msgSend(v24, "uploadFeedbackWithCameraProfileUUID:clipModel:completionHandler:", v25, v27, v26);

    v14 = v27;
  }

LABEL_17:
}

- (void)_notifyPrimaryResidentThatClipsWereSubmitted
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDRemoteDeviceMessageDestination *v6;
  void *v7;
  void *v8;
  HMDRemoteDeviceMessageDestination *v9;
  HMDRemoteMessage *v10;
  void *v11;
  HMDCameraClipFeedbackManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCameraClipFeedbackManager *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraClipFeedbackManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDCameraClipFeedbackManager isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    -[HMDCameraClipFeedbackManager _findAndUploadSubmittedClips](self, "_findAndUploadSubmittedClips");
  }
  else
  {
    -[HMDCameraClipFeedbackManager home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryResident");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = [HMDRemoteDeviceMessageDestination alloc];
      -[HMDCameraClipFeedbackManager messageTargetUUID](self, "messageTargetUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v6, "initWithTarget:device:", v7, v8);

      v10 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDCameraClipFeedbackFindAndUploadSubmittedClipsMessage"), v9, 0, 3, 1, 0.0);
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMFObject shortDescription](v10, "shortDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v14;
        v23 = 2112;
        v24 = v15;
        v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending message %@ that clips were submitted to %@", (uint8_t *)&v21, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      -[HMDCameraClipFeedbackManager messageDispatcher](v12, "messageDispatcher");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendMessage:", v10);

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
        v21 = 138543362;
        v22 = v20;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find primary resident to send notifications to", (uint8_t *)&v21, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraClipFeedbackManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__HMDCameraClipFeedbackManager_handlePrimaryResidentUpdateNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleFindAndUploadSubmittedClipsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipFeedbackManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraClipFeedbackManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling find and upload submitted clips message: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipFeedbackManager _findAndUploadSubmittedClips](v7, "_findAndUploadSubmittedClips");
  objc_msgSend(v4, "respondWithSuccess");

}

- (void)_handleSubmitClipsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipFeedbackManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  void *v28;
  HMDCameraClipFeedbackManager *v29;
  NSObject *v30;
  void *v31;
  HMDCameraClipModel *v32;
  void *v33;
  void *v34;
  HMDCameraClipModel *v35;
  void *v36;
  HMDCameraClipFeedbackManager *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  HMDCameraClipFeedbackManager *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  HMDCameraClipFeedbackManager *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id obj;
  _QWORD v60[5];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  id v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraClipFeedbackManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v72 = v9;
    v73 = 2112;
    v74 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling submit clips message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "setForKey:", *MEMORY[0x24BDD5498]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v51 = (void *)MEMORY[0x227676638]();
    v52 = v7;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v54;
      v73 = 2112;
      v74 = v55;
      _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Could not find clip UUIDs in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v51);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
    goto LABEL_41;
  }
  v57 = v4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v56 = v11;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
  if (!v13)
    goto LABEL_12;
  v14 = v13;
  v15 = *(_QWORD *)v67;
LABEL_6:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v67 != v15)
      objc_enumerationMutation(obj);
    v17 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v16);
    -[HMDCameraClipFeedbackManager localZone](v7, "localZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_class();
    v65 = 0;
    objc_msgSend(v18, "fetchModelWithModelID:ofType:error:", v17, v19, &v65);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v65;

    if (!v20)
      break;
    objc_msgSend(v12, "addObject:", v20);

    if (v14 == ++v16)
    {
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
      if (!v14)
      {
LABEL_12:

        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v12 = v12;
        v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        if (!v22)
          goto LABEL_31;
        v23 = v22;
        v24 = *(_QWORD *)v62;
        while (1)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v62 != v24)
              objc_enumerationMutation(v12);
            v26 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            v27 = objc_msgSend(v26, "feedbackStatus");
            switch(v27)
            {
              case 2:
                v36 = (void *)MEMORY[0x227676638]();
                v37 = v7;
                HMFGetOSLogHandle();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v72 = v39;
                  v73 = 2112;
                  v74 = v26;
                  v40 = v38;
                  v41 = "%{public}@Clip is already uploaded: %@";
LABEL_27:
                  _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, v41, buf, 0x16u);

                }
LABEL_28:

                objc_autoreleasePoolPop(v36);
                continue;
              case 1:
                v36 = (void *)MEMORY[0x227676638]();
                v37 = v7;
                HMFGetOSLogHandle();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v72 = v39;
                  v73 = 2112;
                  v74 = v26;
                  v40 = v38;
                  v41 = "%{public}@Clip is already marked for upload: %@";
                  goto LABEL_27;
                }
                goto LABEL_28;
              case 0:
                v28 = (void *)MEMORY[0x227676638]();
                v29 = v7;
                HMFGetOSLogHandle();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v72 = v31;
                  v73 = 2112;
                  v74 = v26;
                  _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Marking clip for upload: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v28);
                v32 = [HMDCameraClipModel alloc];
                objc_msgSend(v26, "hmbModelID");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "hmbParentModelID");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = -[HMBModel initWithModelID:parentModelID:](v32, "initWithModelID:parentModelID:", v33, v34);

                -[HMDCameraClipModel setFeedbackStatus:](v35, "setFeedbackStatus:", 1);
                objc_msgSend(v58, "addObject:", v35);

                break;
            }
          }
          v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
          if (!v23)
          {
LABEL_31:

            if (objc_msgSend(v58, "count"))
            {
              -[HMDCameraClipFeedbackManager localZone](v7, "localZone");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Marking clips for upload"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "updateModels:options:", v58, v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              v60[0] = MEMORY[0x24BDAC760];
              v60[1] = 3221225472;
              v60[2] = __58__HMDCameraClipFeedbackManager__handleSubmitClipsMessage___block_invoke;
              v60[3] = &unk_24E797628;
              v60[4] = v7;
              v45 = (id)objc_msgSend(v44, "addSuccessBlock:", v60);

            }
            v4 = v57;
            objc_msgSend(v57, "respondWithSuccess");

            goto LABEL_37;
          }
        }
      }
      goto LABEL_6;
    }
  }
  v46 = (void *)MEMORY[0x227676638]();
  v47 = v7;
  HMFGetOSLogHandle();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v72 = v49;
    v73 = 2112;
    v74 = v17;
    v75 = 2112;
    v76 = v21;
    _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failing request to submit because no clip model could be found for UUID %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v46);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v57;
  objc_msgSend(v57, "respondWithError:", v50);

LABEL_37:
  v11 = v56;
LABEL_41:

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraClipFeedbackManager cameraProfileUUID](self, "cameraProfileUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 24, 1);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 40, 1);
}

- (HMDCameraClipFeedbackUploader)feedbackUploader
{
  return (HMDCameraClipFeedbackUploader *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)cameraProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_cameraProfileUUID, 0);
  objc_storeStrong((id *)&self->_feedbackUploader, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

void __58__HMDCameraClipFeedbackManager__handleSubmitClipsMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  objc_msgSend(a2, "mirrorOutputResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE6B628];
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "schedulerWithDispatchQueue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reschedule:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__HMDCameraClipFeedbackManager__handleSubmitClipsMessage___block_invoke_2;
  v9[3] = &unk_24E798968;
  v9[4] = *(_QWORD *)(a1 + 32);
  v8 = (id)objc_msgSend(v7, "addSuccessBlock:", v9);

}

uint64_t __58__HMDCameraClipFeedbackManager__handleSubmitClipsMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyPrimaryResidentThatClipsWereSubmitted");
}

void __72__HMDCameraClipFeedbackManager_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isCurrentDeviceConfirmedPrimaryResident");
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@The current device is the confirmed primary resident", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "_findAndUploadSubmittedClips");
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@The current device is not the confirmed primary resident", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

uint64_t __63__HMDCameraClipFeedbackManager__uploadNextClipFromQueryResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_uploadNextClipFromQueryResult:", *(_QWORD *)(a1 + 40));
}

void __63__HMDCameraClipFeedbackManager__uploadNextClipFromQueryResult___block_invoke_81(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  HMDCameraClipModel *v12;
  void *v13;
  void *v14;
  HMDCameraClipModel *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[5];
      *(_DWORD *)buf = 138543874;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to upload clip %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[5];
      *(_DWORD *)buf = 138543618;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Marking clip as uploaded: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v12 = [HMDCameraClipModel alloc];
    objc_msgSend(a1[5], "hmbModelID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "hmbParentModelID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMBModel initWithModelID:parentModelID:](v12, "initWithModelID:parentModelID:", v13, v14);

    -[HMDCameraClipModel setFeedbackStatus:](v15, "setFeedbackStatus:", 2);
    objc_msgSend(a1[4], "localZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Marking clip as uploaded"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v16, "updateModels:options:", v17, v18);

  }
  objc_msgSend(a1[4], "workQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __63__HMDCameraClipFeedbackManager__uploadNextClipFromQueryResult___block_invoke_85;
  v21[3] = &unk_24E79C268;
  v21[4] = a1[4];
  v22 = a1[6];
  dispatch_async(v20, v21);

}

uint64_t __63__HMDCameraClipFeedbackManager__uploadNextClipFromQueryResult___block_invoke_85(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_uploadNextClipFromQueryResult:", *(_QWORD *)(a1 + 40));
}

void __60__HMDCameraClipFeedbackManager__findAndUploadSubmittedClips__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "localZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCameraClipModel clipsWithNeedsUploadFeedbackStatusQuery](HMDCameraClipModel, "clipsWithNeedsUploadFeedbackStatusQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryModelsUsingQuery:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_uploadNextClipFromQueryResult:", v4);
}

void __49__HMDCameraClipFeedbackManager__performCloudPull__block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform cloud pull: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23_231925 != -1)
    dispatch_once(&logCategory__hmf_once_t23_231925, &__block_literal_global_231926);
  return (id)logCategory__hmf_once_v24_231927;
}

void __43__HMDCameraClipFeedbackManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v24_231927;
  logCategory__hmf_once_v24_231927 = v0;

}

@end
