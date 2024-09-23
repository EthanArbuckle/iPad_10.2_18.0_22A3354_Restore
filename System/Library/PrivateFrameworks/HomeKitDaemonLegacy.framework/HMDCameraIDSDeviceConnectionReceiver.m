@implementation HMDCameraIDSDeviceConnectionReceiver

- (HMDCameraIDSDeviceConnectionReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCameraIDSDeviceConnectionReceiver *v17;
  HMDCameraIDSDeviceConnectionReceiver *result;
  HMDCameraIDSDeviceConnectionReceiver *v19;
  SEL v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_9:
    v19 = (HMDCameraIDSDeviceConnectionReceiver *)_HMFPreconditionFailure();
    -[HMDCameraIDSDeviceConnectionReceiver dealloc](v19, v20);
    return result;
  }
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "proxyService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)HMDCameraIDSDeviceConnectionReceiver;
  v17 = -[HMDCameraIDSDeviceConnection initWithSessionID:workQueue:idsProxyStreamService:](&v21, sel_initWithSessionID_workQueue_idsProxyStreamService_, v10, v11, v16);

  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v12);
    objc_storeStrong((id *)&v17->_delegateQueue, a6);
  }

  return v17;
}

- (void)dealloc
{
  void *v3;
  HMDCameraIDSDeviceConnectionReceiver *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocing HMDCameraIDSDeviceConnectionReceiver", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraIDSDeviceConnectionReceiver;
  -[HMDCameraIDSDeviceConnection dealloc](&v7, sel_dealloc);
}

- (IDSSession)session
{
  return 0;
}

- (void)setUpRemoteConnectionWithDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraIDSDeviceConnection workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__HMDCameraIDSDeviceConnectionReceiver_setUpRemoteConnectionWithDevice___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (int)remoteVideoSocket
{
  void *v2;
  int v3;

  -[HMDCameraIDSDeviceConnection watchVideoConnection](self, "watchVideoConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "socket");

  return v3;
}

- (int)remoteAudioSocket
{
  void *v2;
  int v3;

  -[HMDCameraIDSDeviceConnection watchAudioConnection](self, "watchAudioConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "socket");

  return v3;
}

- (void)_socketOpenedWithError:(id)a3
{
  id v4;
  void *v5;
  HMDCameraIDSDeviceConnectionReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  HMDCameraIDSDeviceConnectionReceiver *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling didSetup delegate with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraIDSDeviceConnectionReceiver delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraIDSDeviceConnectionReceiver delegateQueue](v6, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__HMDCameraIDSDeviceConnectionReceiver__socketOpenedWithError___block_invoke;
    block[3] = &unk_1E89C20C8;
    v12 = v9;
    v13 = v6;
    v14 = v4;
    dispatch_async(v10, block);

  }
}

- (void)_callSessionEndedWithError:(id)a3
{
  id v4;
  void *v5;
  HMDCameraIDSDeviceConnectionReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  HMDCameraIDSDeviceConnectionReceiver *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling didEndSession delegate with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraIDSDeviceConnectionReceiver delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraIDSDeviceConnectionReceiver delegateQueue](v6, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__HMDCameraIDSDeviceConnectionReceiver__callSessionEndedWithError___block_invoke;
    block[3] = &unk_1E89C20C8;
    v12 = v9;
    v13 = v6;
    v14 = v4;
    dispatch_async(v10, block);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraIDSDeviceConnection sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDCameraIDSDeviceConnectionReceiverDelegate)delegate
{
  return (HMDCameraIDSDeviceConnectionReceiverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __67__HMDCameraIDSDeviceConnectionReceiver__callSessionEndedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deviceConnectionReceiver:didEndSessionWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __63__HMDCameraIDSDeviceConnectionReceiver__socketOpenedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deviceConnectionReceiver:didSetUpWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __72__HMDCameraIDSDeviceConnectionReceiver_setUpRemoteConnectionWithDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createStreamSocketWithDevice:", *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_22995 != -1)
    dispatch_once(&logCategory__hmf_once_t3_22995, &__block_literal_global_22996);
  return (id)logCategory__hmf_once_v4_22997;
}

void __51__HMDCameraIDSDeviceConnectionReceiver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_22997;
  logCategory__hmf_once_v4_22997 = v0;

}

@end
