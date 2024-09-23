@implementation HMDCameraSnapshotSender

- (HMDCameraSnapshotSender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 accessory:(id)a6 delegateQueue:(id)a7 uniqueIdentifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMDCameraSnapshotSender *v19;
  HMDCameraSnapshotSender *v20;
  void *v21;
  id v23;
  id v24;
  objc_super v25;

  v15 = a3;
  v24 = a4;
  v23 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMDCameraSnapshotSender;
  v19 = -[HMDCameraSnapshotSender init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sessionID, a3);
    objc_storeStrong((id *)&v20->_device, a5);
    objc_storeWeak((id *)&v20->_accessory, v16);
    objc_storeStrong((id *)&v20->_workQueue, a4);
    objc_storeStrong((id *)&v20->_delegateQueue, a7);
    objc_storeStrong((id *)&v20->_uniqueIdentifier, a8);
    +[HMDCameraPowerAssertionHandler sharedHandler](HMDCameraPowerAssertionHandler, "sharedHandler", v23, v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerRemoteRequestHandler:forSessionID:", v20, v15);

  }
  return v20;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraSnapshotSender sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_sendImageSendFailure:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCameraSnapshotSender *v8;
  NSObject *v9;
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
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraSnapshotSender device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteDestinationString");
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
    v25 = v10;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending image send failure to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDCameraSnapshotSender accessory](v8, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotSender sessionID](v8, "sessionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sessionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("kCameraSessionID"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("kCameraSessionError"));

  }
  objc_msgSend(MEMORY[0x24BE3F1D0], "internalMessageWithName:messagePayload:", CFSTR("kTakeSnapshotSendFailedNotificationKey"), v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setQualityOfService:", 33);
  v19 = (void *)objc_msgSend(v18, "copy");
  objc_initWeak((id *)buf, v8);
  -[HMDCameraSnapshotSender uniqueIdentifier](v8, "uniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotSender workQueue](v8, "workQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __49__HMDCameraSnapshotSender__sendImageSendFailure___block_invoke;
  v22[3] = &unk_24E798E20;
  objc_copyWeak(&v23, (id *)buf);
  objc_msgSend(v13, "sendSecureMessage:target:userID:destination:responseQueue:responseHandler:", v19, v20, 0, v6, v21, v22);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (HMDDevice)device
{
  return self->_device;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HMDCameraSnapshotSessionID)sessionID
{
  return self->_sessionID;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __49__HMDCameraSnapshotSender__sendImageSendFailure___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received response for image send failure notification", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v7);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_79116 != -1)
    dispatch_once(&logCategory__hmf_once_t0_79116, &__block_literal_global_79117);
  return (id)logCategory__hmf_once_v1_79118;
}

void __38__HMDCameraSnapshotSender_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_79118;
  logCategory__hmf_once_v1_79118 = v0;

}

@end
