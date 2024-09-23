@implementation HMDCameraSnapshotIDSStreamInitiator

- (HMDCameraSnapshotIDSStreamInitiator)initWithSessionID:(id)a3 workQueue:(id)a4 destinationID:(id)a5 delegate:(id)a6 delegateQueue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCameraSnapshotIDSStreamInitiator *v20;
  HMDCameraSnapshotIDSStreamInitiator *v22;
  SEL v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v13)
  {
LABEL_7:
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v17 = v16;
  if (v16)
  {
    +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "proxyService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HMDCameraSnapshotIDSStreamInitiator initWithSessionID:workQueue:proxyService:destinationID:delegate:delegateQueue:](self, "initWithSessionID:workQueue:proxyService:destinationID:delegate:delegateQueue:", v12, v13, v19, v14, v15, v17);

    return v20;
  }
LABEL_9:
  v22 = (HMDCameraSnapshotIDSStreamInitiator *)_HMFPreconditionFailure();
  return -[HMDCameraSnapshotIDSStreamInitiator initWithSessionID:workQueue:proxyService:destinationID:delegate:delegateQueue:](v22, v23, v24, v25, v26, v27, v28, v29);
}

- (HMDCameraSnapshotIDSStreamInitiator)initWithSessionID:(id)a3 workQueue:(id)a4 proxyService:(id)a5 destinationID:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HMDCameraSnapshotIDSStreamInitiator *v21;
  HMDCameraSnapshotIDSStreamInitiator *v22;
  uint64_t v23;
  NSString *destinationID;
  HMDCameraSnapshotIDSStreamInitiator *result;
  HMDCameraSnapshotIDSStreamInitiator *v26;
  SEL v27;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v20 = v19;
  if (!v19)
  {
LABEL_13:
    v26 = (HMDCameraSnapshotIDSStreamInitiator *)_HMFPreconditionFailure();
    -[HMDCameraSnapshotIDSStreamInitiator dealloc](v26, v27);
    return result;
  }
  v28.receiver = self;
  v28.super_class = (Class)HMDCameraSnapshotIDSStreamInitiator;
  v21 = -[HMDCameraSnapshotIDSStream initWithSessionID:workQueue:proxyService:](&v28, sel_initWithSessionID_workQueue_proxyService_, v14, v15, v16);
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_delegate, v18);
    objc_storeStrong((id *)&v22->_delegateQueue, a8);
    v23 = objc_msgSend(v17, "copy");
    destinationID = v22->_destinationID;
    v22->_destinationID = (NSString *)v23;

  }
  return v22;
}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotIDSStreamInitiator *v4;
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
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the HMDCameraSnapshotIDSStreamInitiator", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotIDSStreamInitiator;
  -[HMDCameraSnapshotIDSStream dealloc](&v7, sel_dealloc);
}

- (void)sendFile:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraSnapshotIDSStream workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HMDCameraSnapshotIDSStreamInitiator_sendFile___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_sendFile:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  HMDCameraSnapshotIDSStreamInitiator *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDCameraSnapshotIDSStreamInitiator *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  -[HMDCameraSnapshotIDSStreamInitiator setSnapshotFile:](self, "setSnapshotFile:");
  v4 = (void *)MEMORY[0x1E0C99E98];
  -[HMDCameraSnapshotIDSStreamInitiator snapshotFile](self, "snapshotFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HMDCameraSnapshotIDSStreamInitiator destinationID](self, "destinationID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = *MEMORY[0x1E0D34160];
  v45 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = CFSTR("kCameraSessionID");
  -[HMDCameraSnapshotIDSStream sessionID](self, "sessionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sessionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v14;
  v42[1] = *MEMORY[0x1E0CBACB8];
  -[HMDCameraSnapshotIDSStreamInitiator snapshotFile](self, "snapshotFile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "snapshotTimestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraSnapshotIDSStream idsProxyService](self, "idsProxyService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = 0;
  v32 = (void *)v7;
  objc_msgSend(v18, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", v7, v17, v11, 300, v12, &v35, &v34);
  v19 = v35;
  v20 = v34;

  if (v20)
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotIDSStreamInitiator snapshotFile](v22, "snapshotFile");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      v40 = 2112;
      v41 = v20;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Sending file %@ failed with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    -[HMDCameraSnapshotIDSStreamInitiator _callFileTransferFailedWithError:](v22, "_callFileTransferFailedWithError:", v20);
    v26 = v33;
  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0](-[HMDCameraSnapshotIDSStreamInitiator setSendFileIdentifier:](self, "setSendFileIdentifier:", v19));
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    v26 = v33;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v30;
      v38 = 2112;
      v39 = v33;
      v40 = 2112;
      v41 = v19;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Sent the resource transfer request for %@ with identifier %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    -[HMDCameraSnapshotIDSStream sessionID](v28, "sessionID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "markMilestoneFor:", CFSTR("IDSTransferSentImage"));

  }
}

- (void)_callFileTransferFailedWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  HMDCameraSnapshotIDSStreamInitiator *v9;
  id v10;

  v4 = a3;
  -[HMDCameraSnapshotIDSStreamInitiator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotIDSStreamInitiator delegateQueue](self, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__HMDCameraSnapshotIDSStreamInitiator__callFileTransferFailedWithError___block_invoke;
    block[3] = &unk_1E89C20C8;
    v8 = v5;
    v9 = self;
    v10 = v4;
    dispatch_async(v6, block);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraSnapshotIDSStream sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  HMDCameraSnapshotIDSStreamInitiator *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[HMDCameraSnapshotIDSStreamInitiator sendFileIdentifier](self, "sendFileIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[HMDCameraSnapshotIDSStreamInitiator sendFileIdentifier](self, "sendFileIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "isEqualToString:", v17);

    if (v18)
    {
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v14)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543874;
          v26 = v23;
          v27 = 2112;
          v28 = v13;
          v29 = 2112;
          v30 = v14;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received confirmation from IDS that the file send failed for identifier %@: %@", (uint8_t *)&v25, 0x20u);

        }
        objc_autoreleasePoolPop(v19);
        -[HMDCameraSnapshotIDSStreamInitiator _callFileTransferFailedWithError:](v20, "_callFileTransferFailedWithError:", v14);
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v24;
          v27 = 2112;
          v28 = v13;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Received confirmation from IDS that the file send succeeded for identifier: %@", (uint8_t *)&v25, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
      }
    }
  }

}

- (HMDSnapshotFile)snapshotFile
{
  return (HMDSnapshotFile *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSnapshotFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)destinationID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (HMDCameraSnapshotIDSStreamInitiatorDelegate)delegate
{
  return (HMDCameraSnapshotIDSStreamInitiatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)sendFileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSendFileIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendFileIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_snapshotFile, 0);
}

uint64_t __72__HMDCameraSnapshotIDSStreamInitiator__callFileTransferFailedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamInitiator:didFailToSendFileWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __48__HMDCameraSnapshotIDSStreamInitiator_sendFile___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendFile:", *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_183426 != -1)
    dispatch_once(&logCategory__hmf_once_t3_183426, &__block_literal_global_183427);
  return (id)logCategory__hmf_once_v4_183428;
}

void __50__HMDCameraSnapshotIDSStreamInitiator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_183428;
  logCategory__hmf_once_v4_183428 = v0;

}

@end
