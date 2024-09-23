@implementation HMDCameraStreamControlManager

- (HMDCameraStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 accessory:(id)a8 streamManagementService:(id)a9 isLocal:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  HMDCameraStreamControlManager *v24;
  HMDCameraStreamControlManager *v25;
  HMDCameraStreamMetrics *v26;
  HMDCameraStreamMetrics *streamMetrics;
  HMDCameraStreamControlManager *v29;
  SEL v30;
  id v31;
  id obj;
  id v33;
  objc_super v34;

  v17 = a3;
  obj = a4;
  v18 = a4;
  v33 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v18)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v33)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v20)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v21)
  {
LABEL_14:
    _HMFPreconditionFailure();
LABEL_15:
    v29 = (HMDCameraStreamControlManager *)_HMFPreconditionFailure();
    -[HMDCameraStreamControlManager _cleanUpStreamSessionWithError:](v29, v30, v31);
  }
  v23 = v22;
  if (!v22)
    goto LABEL_15;
  v34.receiver = self;
  v34.super_class = (Class)HMDCameraStreamControlManager;
  v24 = -[HMDCameraStreamControlManager init](&v34, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_sessionID, a3);
    objc_storeStrong((id *)&v25->_streamSnapshotHandler, a5);
    objc_storeStrong((id *)&v25->_workQueue, obj);
    objc_storeWeak((id *)&v25->_delegate, v19);
    objc_storeStrong((id *)&v25->_delegateQueue, a7);
    objc_storeWeak((id *)&v25->_accessory, v21);
    objc_storeStrong((id *)&v25->_streamManagementService, a9);
    v26 = -[HMDCameraStreamMetrics initWithSessionID:cameraAccessory:isLocal:]([HMDCameraStreamMetrics alloc], "initWithSessionID:cameraAccessory:isLocal:", v17, v21, a10);
    streamMetrics = v25->_streamMetrics;
    v25->_streamMetrics = v26;

  }
  return v25;
}

- (void)_cleanUpStreamSessionWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)_reportErrorCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager _cleanUpStreamSessionWithError:](self, "_cleanUpStreamSessionWithError:", v4);

}

- (void)_reportInternalErrorCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager _cleanUpStreamSessionWithError:](self, "_cleanUpStreamSessionWithError:", v4);

}

- (id)managerProtocol
{
  HMDCameraStreamControlManager *v3;

  if (-[HMDCameraStreamControlManager conformsToProtocol:](self, "conformsToProtocol:", &unk_1EFAA5C18))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (void)_callStreamNegotiated:(id)a3
{
  id v4;
  void *v5;
  HMDCameraStreamControlManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Stream negotiated", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraStreamControlManager managerProtocol](v6, "managerProtocol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager delegate](v6, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamControlManager delegateQueue](v6, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__HMDCameraStreamControlManager__callStreamNegotiated___block_invoke;
    block[3] = &unk_1E89C20C8;
    v13 = v10;
    v14 = v9;
    v15 = v4;
    dispatch_async(v11, block);

  }
}

- (void)_callStreamRemoteConnectionSetup
{
  void *v3;
  HMDCameraStreamControlManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Stream remote connection setup", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraStreamControlManager managerProtocol](v4, "managerProtocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager delegate](v4, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamControlManager delegateQueue](v4, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__HMDCameraStreamControlManager__callStreamRemoteConnectionSetup__block_invoke;
    v10[3] = &unk_1E89C2328;
    v11 = v8;
    v12 = v7;
    dispatch_async(v9, v10);

  }
}

- (void)_callStreamStarted
{
  void *v3;
  HMDCameraStreamControlManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Stream started", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraStreamControlManager managerProtocol](v4, "managerProtocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager delegate](v4, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamControlManager delegateQueue](v4, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__HMDCameraStreamControlManager__callStreamStarted__block_invoke;
    v10[3] = &unk_1E89C2328;
    v11 = v8;
    v12 = v7;
    dispatch_async(v9, v10);

  }
}

- (void)_callStreamFirstFrameReceived
{
  void *v3;
  HMDCameraStreamControlManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@First frame received", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraStreamControlManager managerProtocol](v4, "managerProtocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager delegate](v4, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamControlManager delegateQueue](v4, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__HMDCameraStreamControlManager__callStreamFirstFrameReceived__block_invoke;
    v10[3] = &unk_1E89C2328;
    v11 = v8;
    v12 = v7;
    dispatch_async(v9, v10);

  }
}

- (void)_callStreamReconfigured
{
  void *v3;
  HMDCameraStreamControlManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Stream reconfigured", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraStreamControlManager managerProtocol](v4, "managerProtocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager delegate](v4, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamControlManager delegateQueue](v4, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__HMDCameraStreamControlManager__callStreamReconfigured__block_invoke;
    v10[3] = &unk_1E89C2328;
    v11 = v8;
    v12 = v7;
    dispatch_async(v9, v10);

  }
}

- (void)_callStreamStoppedWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraStreamControlManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamControlManager sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v9;
    v23 = 2112;
    v24 = v5;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Stream with session ID %@ stopped with error %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraStreamControlManager managerProtocol](v7, "managerProtocol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager delegate](v7, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamControlManager delegateQueue](v7, "delegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __61__HMDCameraStreamControlManager__callStreamStoppedWithError___block_invoke;
    v16 = &unk_1E89C07B8;
    v17 = v11;
    v18 = v10;
    v19 = v5;
    v20 = v4;
    dispatch_async(v12, &v13);

  }
  -[HMDCameraStreamControlManager _cleanUpStreamSessionWithError:](v7, "_cleanUpStreamSessionWithError:", v4, v13, v14, v15, v16);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraStreamControlManager sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDCameraStreamControlManagerDelegate)delegate
{
  return (HMDCameraStreamControlManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (HMDService)streamManagementService
{
  return self->_streamManagementService;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDCameraStreamSessionID)sessionID
{
  return self->_sessionID;
}

- (HMDCameraStreamSnapshotHandler)streamSnapshotHandler
{
  return self->_streamSnapshotHandler;
}

- (HMDCameraStreamMetrics)streamMetrics
{
  return self->_streamMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamMetrics, 0);
  objc_storeStrong((id *)&self->_streamSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_streamManagementService, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __61__HMDCameraStreamControlManager__callStreamStoppedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamControlManager:didStopStreamWithSessionID:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __56__HMDCameraStreamControlManager__callStreamReconfigured__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamControlManagerDidReconfigureStream:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__HMDCameraStreamControlManager__callStreamFirstFrameReceived__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamControlManagerDidReceiveFirstFrame:", *(_QWORD *)(a1 + 40));
}

uint64_t __51__HMDCameraStreamControlManager__callStreamStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamControlManagerDidStartStream:", *(_QWORD *)(a1 + 40));
}

uint64_t __65__HMDCameraStreamControlManager__callStreamRemoteConnectionSetup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamControlManagerDidSetUpRemoteConnection:", *(_QWORD *)(a1 + 40));
}

uint64_t __55__HMDCameraStreamControlManager__callStreamNegotiated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamControlManager:didNegotiateStreamWithSelectedParameters:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_138429 != -1)
    dispatch_once(&logCategory__hmf_once_t6_138429, &__block_literal_global_138430);
  return (id)logCategory__hmf_once_v7_138431;
}

void __44__HMDCameraStreamControlManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_138431;
  logCategory__hmf_once_v7_138431 = v0;

}

@end
