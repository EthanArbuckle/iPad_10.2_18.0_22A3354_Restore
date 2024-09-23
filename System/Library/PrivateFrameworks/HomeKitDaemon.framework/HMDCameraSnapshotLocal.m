@implementation HMDCameraSnapshotLocal

- (HMDCameraSnapshotLocal)initWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 snapshotRequestHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDCameraSnapshotLocal *v20;
  HMDCameraSnapshotLocal *v21;
  id v23;
  objc_super v24;

  v23 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDCameraSnapshotLocal;
  v20 = -[HMDCameraSnapshotLocal init](&v24, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_sessionID, a3);
    objc_storeWeak((id *)&v21->_accessory, v16);
    objc_storeStrong((id *)&v21->_workQueue, a4);
    objc_storeWeak((id *)&v21->_delegate, v17);
    objc_storeStrong((id *)&v21->_delegateQueue, a7);
    objc_storeStrong((id *)&v21->_snapshotRequestHandler, a8);
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotLocal *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMDCameraSnapshotLocal", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotLocal;
  -[HMDCameraSnapshotLocal dealloc](&v7, sel_dealloc);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraSnapshotLocal sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)getSnapshot:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDCameraSnapshotLocal workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__HMDCameraSnapshotLocal_getSnapshot___block_invoke;
  v6[3] = &unk_24E797C10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_getSnapshot:(unint64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  HMDCameraSnapshotLocal *v9;
  id v10;

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Take Snapshot Local"));
  -[HMDCameraSnapshotLocal snapshotRequestHandler](self, "snapshotRequestHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotLocal sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__HMDCameraSnapshotLocal__getSnapshot___block_invoke;
  v7[3] = &unk_24E778F08;
  v8 = v10;
  v9 = self;
  objc_msgSend(v5, "requestSnapshot:streamingTierType:completionHandler:", v6, a3, v7);

  __HMFActivityScopeLeave();
}

- (void)_handleSnapshotFile:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraSnapshotLocal *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  HMDCameraSnapshotLocal *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638](-[HMDCameraSnapshotLocal setSnapshotFile:](self, "setSnapshotFile:", v6));
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotLocal sessionID](v9, "sessionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v21 = v11;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that image %@ has been saved with error %@ for session %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraSnapshotLocal delegate](v9, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotLocal delegateQueue](v9, "delegateQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __52__HMDCameraSnapshotLocal__handleSnapshotFile_error___block_invoke;
    v15[3] = &unk_24E79A910;
    v16 = v13;
    v17 = v9;
    v18 = v6;
    v19 = v7;
    dispatch_async(v14, v15);

  }
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

- (HMDCameraSnapshotLocalDelegate)delegate
{
  return (HMDCameraSnapshotLocalDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (HMDSnapshotRequestHandlerProtocol)snapshotRequestHandler
{
  return self->_snapshotRequestHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotRequestHandler, 0);
  objc_storeStrong((id *)&self->_snapshotFile, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

void __52__HMDCameraSnapshotLocal__handleSnapshotFile_error___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  v3 = a1[6];
  v4 = a1[7];
  objc_msgSend(v2, "sessionID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "snapshotLocal:didSaveSnapshotFile:error:sessionID:", v2, v3, v4, v5);

}

void __39__HMDCameraSnapshotLocal__getSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "invalidate");
  objc_msgSend(*(id *)(a1 + 40), "_handleSnapshotFile:error:", v7, v6);

}

uint64_t __38__HMDCameraSnapshotLocal_getSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSnapshot:", *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_27042 != -1)
    dispatch_once(&logCategory__hmf_once_t1_27042, &__block_literal_global_27043);
  return (id)logCategory__hmf_once_v2_27044;
}

void __37__HMDCameraSnapshotLocal_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_27044;
  logCategory__hmf_once_v2_27044 = v0;

}

@end
