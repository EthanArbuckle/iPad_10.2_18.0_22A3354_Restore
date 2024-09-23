@implementation HMDCameraSnapshotRemoteStreamReceiver

- (HMDCameraSnapshotRemoteStreamReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 uniqueIdentifier:(id)a8 snapshotRequestHandler:(id)a9 residentMessageHandler:(id)a10 remoteDevice:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  HMDCameraSnapshotRemoteStreamReceiver *v27;
  HMDCameraSnapshotRemoteStreamReceiver *v28;
  HMDCameraSnapshotRemoteStreamReceiver *result;
  HMDCameraSnapshotRemoteStreamReceiver *v30;
  SEL v31;
  objc_super v32;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v19)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v21)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v22)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v23)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v24)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  v26 = v25;
  if (!v25)
  {
LABEL_19:
    v30 = (HMDCameraSnapshotRemoteStreamReceiver *)_HMFPreconditionFailure();
    -[HMDCameraSnapshotRemoteStreamReceiver dealloc](v30, v31);
    return result;
  }
  v32.receiver = self;
  v32.super_class = (Class)HMDCameraSnapshotRemoteStreamReceiver;
  v27 = -[HMDCameraSnapshotReceiver initWithSessionID:workQueue:accessory:delegateQueue:uniqueIdentifier:snapshotRequestHandler:residentMessageHandler:remoteDevice:](&v32, sel_initWithSessionID_workQueue_accessory_delegateQueue_uniqueIdentifier_snapshotRequestHandler_residentMessageHandler_remoteDevice_, v17, v18, v19, v21, v22, v23, v24, v25);
  v28 = v27;
  if (v27)
    objc_storeWeak((id *)&v27->_delegate, v20);

  return v28;
}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotRemoteStreamReceiver *v4;
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
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting HMDCameraSnapshotRemoteStreamReceiver", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotRemoteStreamReceiver;
  -[HMDCameraSnapshotRemoteStreamReceiver dealloc](&v7, sel_dealloc);
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

- (void)getSnapshot:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDCameraSnapshotReceiver workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HMDCameraSnapshotRemoteStreamReceiver_getSnapshot___block_invoke;
  v6[3] = &unk_1E89C0B98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_getSnapshot:(unint64_t)a3
{
  HMDCameraSnapshotIDSStreamReceiver *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCameraSnapshotIDSStreamReceiver *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;
  id v18;
  id location;

  objc_initWeak(&location, self);
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Snapshot Stream Receiver"));
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __54__HMDCameraSnapshotRemoteStreamReceiver__getSnapshot___block_invoke;
  v15 = &unk_1E89BF4F0;
  v16 = v18;
  objc_copyWeak(&v17, &location);
  -[HMDCameraSnapshotReceiver _sendRequestWithTierType:toResident:](self, "_sendRequestWithTierType:toResident:", a3, &v12);
  v5 = [HMDCameraSnapshotIDSStreamReceiver alloc];
  -[HMDCameraSnapshotReceiver sessionID](self, "sessionID", v12, v13, v14, v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotReceiver workQueue](self, "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotReceiver snapshotFile](self, "snapshotFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotReceiver workQueue](self, "workQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotReceiver remoteDevice](self, "remoteDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDCameraSnapshotIDSStreamReceiver initWithSessionID:workQueue:snapshotFile:delegate:delegateQueue:remoteDevice:](v5, "initWithSessionID:workQueue:snapshotFile:delegate:delegateQueue:remoteDevice:", v6, v7, v8, self, v9, v10);
  -[HMDCameraSnapshotRemoteStreamReceiver setRelayReceiver:](self, "setRelayReceiver:", v11);

  objc_destroyWeak(&v17);
  __HMFActivityScopeLeave();

  objc_destroyWeak(&location);
}

- (void)snapShotSendFailed:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraSnapshotReceiver workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HMDCameraSnapshotRemoteStreamReceiver_snapShotSendFailed___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_callGettingImageDelegate:(id)a3
{
  id v4;
  void *v5;
  HMDCameraSnapshotRemoteStreamReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  HMDCameraSnapshotRemoteStreamReceiver *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotReceiver sessionID](v6, "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling getting image delegate with error %@ for session %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraSnapshotRemoteStreamReceiver delegate](v6, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotReceiver delegateQueue](v6, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__HMDCameraSnapshotRemoteStreamReceiver__callGettingImageDelegate___block_invoke;
    block[3] = &unk_1E89C20C8;
    v13 = v10;
    v14 = v6;
    v15 = v4;
    dispatch_async(v11, block);

  }
}

- (void)_callDidSaveImageDelegateWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraSnapshotRemoteStreamReceiver *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  HMDCameraSnapshotRemoteStreamReceiver *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markWithReason:", CFSTR("Calling delegate"));

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotReceiver snapshotFile](v7, "snapshotFile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotReceiver sessionID](v7, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v4;
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that download of image %@ has completed with error %@ for session %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraSnapshotRemoteStreamReceiver delegate](v7, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotReceiver delegateQueue](v7, "delegateQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__HMDCameraSnapshotRemoteStreamReceiver__callDidSaveImageDelegateWithError___block_invoke;
    block[3] = &unk_1E89C20C8;
    v15 = v12;
    v16 = v7;
    v17 = v4;
    dispatch_async(v13, block);

  }
}

- (void)streamReceiver:(id)a3 didReceiveFileWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDCameraSnapshotRemoteStreamReceiver *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraSnapshotReceiver workQueue](self, "workQueue");
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
    v13 = 138543618;
    v14 = v12;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Image receive has completed with error: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDCameraSnapshotRemoteStreamReceiver _callDidSaveImageDelegateWithError:](v10, "_callDidSaveImageDelegateWithError:", v7);
  -[HMDCameraSnapshotReceiver _sendConfirmationToResident:](v10, "_sendConfirmationToResident:", &__block_literal_global_31_144584);

}

- (HMDCameraSnapshotRemoteStreamReceiverDelegate)delegate
{
  return (HMDCameraSnapshotRemoteStreamReceiverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMDCameraSnapshotIDSStreamReceiver)relayReceiver
{
  return self->_relayReceiver;
}

- (void)setRelayReceiver:(id)a3
{
  objc_storeStrong((id *)&self->_relayReceiver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayReceiver, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __76__HMDCameraSnapshotRemoteStreamReceiver__callDidSaveImageDelegateWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "snapshotFile");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotStreamReceiver:didSaveSnapshotFile:error:sessionID:", v3, v6, v4, v5);

}

void __67__HMDCameraSnapshotRemoteStreamReceiver__callGettingImageDelegate___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  v3 = a1[6];
  objc_msgSend(v2, "sessionID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "snapshotStreamReceiver:didStartGettingImage:sessionID:", v2, v3, v4);

}

void __60__HMDCameraSnapshotRemoteStreamReceiver_snapShotSendFailed___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
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
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Send failed on snapshot session %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(id *)(a1 + 40);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1036);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "_callDidSaveImageDelegateWithError:", v7);

}

void __54__HMDCameraSnapshotRemoteStreamReceiver__getSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "begin");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = v8;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v12;
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Take snapshot relayed to resident has ended in error %@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v10, "_callDidSaveImageDelegateWithError:", v5);
    }
    else
    {
      objc_msgSend(WeakRetained, "_callGettingImageDelegate:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "end");
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

uint64_t __53__HMDCameraSnapshotRemoteStreamReceiver_getSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSnapshot:", *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_144623 != -1)
    dispatch_once(&logCategory__hmf_once_t1_144623, &__block_literal_global_144624);
  return (id)logCategory__hmf_once_v2_144625;
}

void __52__HMDCameraSnapshotRemoteStreamReceiver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_144625;
  logCategory__hmf_once_v2_144625 = v0;

}

@end
