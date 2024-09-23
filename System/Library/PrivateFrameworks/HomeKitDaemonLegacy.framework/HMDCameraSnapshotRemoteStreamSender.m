@implementation HMDCameraSnapshotRemoteStreamSender

- (HMDCameraSnapshotRemoteStreamSender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 accessory:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 uniqueIdentifier:(id)a9 snapshotRequestHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HMDCameraSnapshotRemoteStreamSender *v22;
  HMDCameraSnapshotRemoteStreamSender *v23;
  HMDCameraSnapshotLocal *v24;
  HMDCameraSnapshotLocal *snapshotLocal;
  HMDCameraSnapshotIDSStreamInitiator *v26;
  void *v27;
  uint64_t v28;
  HMDCameraSnapshotIDSStreamInitiator *streamInitiator;
  objc_super v31;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  v31.receiver = self;
  v31.super_class = (Class)HMDCameraSnapshotRemoteStreamSender;
  v22 = -[HMDCameraSnapshotSender initWithSessionID:workQueue:device:accessory:delegateQueue:uniqueIdentifier:](&v31, sel_initWithSessionID_workQueue_device_accessory_delegateQueue_uniqueIdentifier_, v16, v17, v18, v19, a8, a9);
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_delegate, v20);
    v24 = -[HMDCameraSnapshotLocal initWithSessionID:workQueue:accessory:delegate:delegateQueue:snapshotRequestHandler:]([HMDCameraSnapshotLocal alloc], "initWithSessionID:workQueue:accessory:delegate:delegateQueue:snapshotRequestHandler:", v16, v17, v19, v23, v17, v21);
    snapshotLocal = v23->_snapshotLocal;
    v23->_snapshotLocal = v24;

    v26 = [HMDCameraSnapshotIDSStreamInitiator alloc];
    objc_msgSend(v18, "remoteDestinationString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HMDCameraSnapshotIDSStreamInitiator initWithSessionID:workQueue:destinationID:delegate:delegateQueue:](v26, "initWithSessionID:workQueue:destinationID:delegate:delegateQueue:", v16, v17, v27, v23, v17);
    streamInitiator = v23->_streamInitiator;
    v23->_streamInitiator = (HMDCameraSnapshotIDSStreamInitiator *)v28;

  }
  return v23;
}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotRemoteStreamSender *v4;
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
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting HMDCameraSnapshotRemoteStreamSender", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotRemoteStreamSender;
  -[HMDCameraSnapshotRemoteStreamSender dealloc](&v7, sel_dealloc);
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

- (void)getSnapshot:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDCameraSnapshotSender workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HMDCameraSnapshotRemoteStreamSender_getSnapshot___block_invoke;
  v6[3] = &unk_1E89C0B98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)sendSnapshotAtPath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraSnapshotSender workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HMDCameraSnapshotRemoteStreamSender_sendSnapshotAtPath___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)snapShotTransferComplete
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDCameraSnapshotSender workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HMDCameraSnapshotRemoteStreamSender_snapShotTransferComplete__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_callDidStartCaptureImageDelegate:(id)a3
{
  id v4;
  void *v5;
  HMDCameraSnapshotRemoteStreamSender *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  HMDCameraSnapshotRemoteStreamSender *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotRemoteStreamSender snapshotLocal](v6, "snapshotLocal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that capture of image has started with error %@ for session %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraSnapshotRemoteStreamSender delegate](v6, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotSender delegateQueue](v6, "delegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__HMDCameraSnapshotRemoteStreamSender__callDidStartCaptureImageDelegate___block_invoke;
    block[3] = &unk_1E89C20C8;
    v14 = v11;
    v15 = v6;
    v16 = v4;
    dispatch_async(v12, block);

  }
}

- (void)_callDidCompleteSendImageDelegate:(id)a3
{
  id v4;
  void *v5;
  HMDCameraSnapshotRemoteStreamSender *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  HMDCameraSnapshotRemoteStreamSender *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotRemoteStreamSender snapshotLocal](v6, "snapshotLocal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that transfer of image has completed with error %@ for session %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraSnapshotRemoteStreamSender delegate](v6, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotSender delegateQueue](v6, "delegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__HMDCameraSnapshotRemoteStreamSender__callDidCompleteSendImageDelegate___block_invoke;
    block[3] = &unk_1E89C20C8;
    v14 = v11;
    v15 = v6;
    v16 = v4;
    dispatch_async(v12, block);

  }
}

- (void)snapshotLocal:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDCameraSnapshotRemoteStreamSender *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v18;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Snapshot local capture has ended in %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDCameraSnapshotSender _sendImageSendFailure:](v15, "_sendImageSendFailure:", v12);
    -[HMDCameraSnapshotRemoteStreamSender _callDidCompleteSendImageDelegate:](v15, "_callDidCompleteSendImageDelegate:", v12);
  }
  else
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Scheduling the transfer of file %@ through IDS", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDCameraSnapshotRemoteStreamSender streamInitiator](v15, "streamInitiator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendFile:", v11);

  }
}

- (void)streamInitiator:(id)a3 didFailToSendFileWithError:(id)a4
{
  id v5;

  v5 = a4;
  -[HMDCameraSnapshotSender _sendImageSendFailure:](self, "_sendImageSendFailure:", v5);
  -[HMDCameraSnapshotRemoteStreamSender _callDidCompleteSendImageDelegate:](self, "_callDidCompleteSendImageDelegate:", v5);

}

- (HMDCameraSnapshotLocal)snapshotLocal
{
  return self->_snapshotLocal;
}

- (HMDCameraSnapshotRemoteStreamSenderDelegate)delegate
{
  return (HMDCameraSnapshotRemoteStreamSenderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMDCameraSnapshotIDSStreamInitiator)streamInitiator
{
  return self->_streamInitiator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamInitiator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotLocal, 0);
}

void __73__HMDCameraSnapshotRemoteStreamSender__callDidCompleteSendImageDelegate___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  v3 = a1[6];
  objc_msgSend(v2, "snapshotLocal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "snapshotStreamSender:didCompleteSendImage:sessionID:", v2, v3, v4);

}

void __73__HMDCameraSnapshotRemoteStreamSender__callDidStartCaptureImageDelegate___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  v3 = a1[6];
  objc_msgSend(v2, "snapshotLocal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "snapshotStreamSender:didStartCaptureImage:sessionID:", v2, v3, v4);

}

uint64_t __63__HMDCameraSnapshotRemoteStreamSender_snapShotTransferComplete__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Snapshot transfer to remote receiver is complete", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_callDidCompleteSendImageDelegate:", 0);
}

void __58__HMDCameraSnapshotRemoteStreamSender_sendSnapshotAtPath___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Sending the snapshot %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "streamInitiator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendFile:", *(_QWORD *)(a1 + 40));

}

uint64_t __51__HMDCameraSnapshotRemoteStreamSender_getSnapshot___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Getting the snapshot from local snapshot handler", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "snapshotLocal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getSnapshot:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_callDidStartCaptureImageDelegate:", 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_11272 != -1)
    dispatch_once(&logCategory__hmf_once_t1_11272, &__block_literal_global_11273);
  return (id)logCategory__hmf_once_v2_11274;
}

void __50__HMDCameraSnapshotRemoteStreamSender_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_11274;
  logCategory__hmf_once_v2_11274 = v0;

}

@end
