@implementation HMDCameraSnapshotReceiver

- (HMDCameraSnapshotReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegateQueue:(id)a6 uniqueIdentifier:(id)a7 snapshotRequestHandler:(id)a8 residentMessageHandler:(id)a9 remoteDevice:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  HMDCameraSnapshotReceiver *v27;
  HMDCameraSnapshotReceiver *v28;
  HMDCameraSnapshotReceiver *result;
  HMDCameraSnapshotReceiver *v30;
  SEL v31;
  unint64_t v32;
  id v33;
  id obj;
  id v35;
  id v36;
  id v37;
  objc_super v39;

  v16 = a3;
  obj = a4;
  v17 = a4;
  v18 = a5;
  v35 = a6;
  v19 = a6;
  v36 = a7;
  v20 = a7;
  v37 = a8;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v17)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v18)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v19)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v20)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v21)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v22)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  v24 = v23;
  if (!v23)
  {
LABEL_19:
    v30 = (HMDCameraSnapshotReceiver *)_HMFPreconditionFailure();
    -[HMDCameraSnapshotReceiver _sendRequestWithTierType:toResident:](v30, v31, v32, v33);
    return result;
  }
  v25 = v18;
  v26 = v22;
  v39.receiver = self;
  v39.super_class = (Class)HMDCameraSnapshotReceiver;
  v27 = -[HMDCameraSnapshotReceiver init](&v39, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_sessionID, a3);
    objc_storeWeak((id *)&v28->_accessory, v25);
    objc_storeStrong((id *)&v28->_workQueue, obj);
    objc_storeStrong((id *)&v28->_delegateQueue, v35);
    objc_storeStrong((id *)&v28->_uniqueIdentifier, v36);
    objc_storeStrong((id *)&v28->_snapshotRequestHandler, v37);
    objc_storeStrong((id *)&v28->_residentMessageHandler, a9);
    objc_storeStrong((id *)&v28->_remoteDevice, a10);
  }

  return v28;
}

- (void)_sendRequestWithTierType:(unint64_t)a3 toResident:(id)a4
{
  id v6;
  void *v7;
  HMDCameraSnapshotReceiver *v8;
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
  HMDSnapshotFile *v20;
  void *v21;
  void *v22;
  HMDSnapshotFile *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotReceiver sessionID](v8, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Relaying request to resident to take image snapshot with session ID %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotReceiver sessionID](v8, "sessionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sessionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("kCameraSessionID"));

  -[HMDCameraSnapshotReceiver sessionID](v8, "sessionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hostProcessBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("kCameraSessionApplicationID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("kCameraStreamingTierType"));

  -[HMDCameraSnapshotReceiver sessionID](v8, "sessionID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "snapshotCharacteristicEventUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("kCameraProactiveSessionID"));

  v20 = [HMDSnapshotFile alloc];
  -[HMDCameraSnapshotReceiver snapshotRequestHandler](v8, "snapshotRequestHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageCacheDirectory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HMDSnapshotFile initWithImageDirectory:](v20, "initWithImageDirectory:", v22);
  -[HMDCameraSnapshotReceiver setSnapshotFile:](v8, "setSnapshotFile:", v23);

  -[HMDCameraSnapshotReceiver _sendMessageWithName:payload:responseHandler:](v8, "_sendMessageWithName:payload:responseHandler:", CFSTR("kTakeSnapshotRemoteRequestKey"), v12, v6);
}

- (void)_sendConfirmationToResident:(id)a3
{
  id v4;
  void *v5;
  HMDCameraSnapshotReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotReceiver sessionID](v6, "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Informing the resident that image download task is completed for session ID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraSnapshotReceiver sessionID](v6, "sessionID", CFSTR("kCameraSessionID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraSnapshotReceiver _sendMessageWithName:payload:responseHandler:](v6, "_sendMessageWithName:payload:responseHandler:", CFSTR("kTakeSnapshotRemoteReceivedKey"), v12, v4);
}

- (void)_sendMessageWithName:(id)a3 payload:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDCameraSnapshotReceiver residentMessageHandler](self, "residentMessageHandler");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotReceiver sessionID](self, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotReceiver uniqueIdentifier](self, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotReceiver remoteDevice](self, "remoteDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotReceiver workQueue](self, "workQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendMessageWithName:cameraSessionID:payload:target:device:responseQueue:responseHandler:", v10, v11, v9, v12, v13, v14, v8);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraSnapshotReceiver sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (HMDCameraSnapshotSessionID)sessionID
{
  return self->_sessionID;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HMDSnapshotFile)snapshotFile
{
  return self->_snapshotFile;
}

- (void)setSnapshotFile:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotFile, a3);
}

- (HMDSnapshotRequestHandler)snapshotRequestHandler
{
  return self->_snapshotRequestHandler;
}

- (HMDCameraResidentMessageHandler)residentMessageHandler
{
  return self->_residentMessageHandler;
}

- (HMDDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_residentMessageHandler, 0);
  objc_storeStrong((id *)&self->_snapshotRequestHandler, 0);
  objc_storeStrong((id *)&self->_snapshotFile, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_164967 != -1)
    dispatch_once(&logCategory__hmf_once_t2_164967, &__block_literal_global_164968);
  return (id)logCategory__hmf_once_v3_164969;
}

void __40__HMDCameraSnapshotReceiver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_164969;
  logCategory__hmf_once_v3_164969 = v0;

}

@end
