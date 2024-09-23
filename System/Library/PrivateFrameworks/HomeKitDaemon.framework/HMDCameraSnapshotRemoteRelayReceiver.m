@implementation HMDCameraSnapshotRemoteRelayReceiver

- (HMDCameraSnapshotRemoteRelayReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 uniqueIdentifier:(id)a8 snapshotRequestHandler:(id)a9 residentMessageHandler:(id)a10 remoteDevice:(id)a11
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
  HMDCameraSnapshotRemoteRelayReceiver *v27;
  HMDCameraSnapshotRemoteRelayReceiver *v28;
  HMDCameraSnapshotRemoteRelayReceiver *result;
  HMDCameraSnapshotRemoteRelayReceiver *v30;
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
    v30 = (HMDCameraSnapshotRemoteRelayReceiver *)_HMFPreconditionFailure();
    -[HMDCameraSnapshotRemoteRelayReceiver dealloc](v30, v31);
    return result;
  }
  v32.receiver = self;
  v32.super_class = (Class)HMDCameraSnapshotRemoteRelayReceiver;
  v27 = -[HMDCameraSnapshotReceiver initWithSessionID:workQueue:accessory:delegateQueue:uniqueIdentifier:snapshotRequestHandler:residentMessageHandler:remoteDevice:](&v32, sel_initWithSessionID_workQueue_accessory_delegateQueue_uniqueIdentifier_snapshotRequestHandler_residentMessageHandler_remoteDevice_, v17, v18, v19, v21, v22, v23, v24, v25);
  v28 = v27;
  if (v27)
    objc_storeWeak((id *)&v27->_delegate, v20);

  return v28;
}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotRemoteRelayReceiver *v4;
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting HMDCameraSnapshotRemoteRelayReceiver", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotRemoteRelayReceiver;
  -[HMDCameraSnapshotRemoteRelayReceiver dealloc](&v7, sel_dealloc);
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
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__HMDCameraSnapshotRemoteRelayReceiver_getSnapshot___block_invoke;
  v6[3] = &unk_24E797C10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_getSnapshot:(unint64_t)a3
{
  HMDCameraIDSSessionInviterDeviceVerifier *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCameraIDSSessionInviterDeviceVerifier *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCameraSnapshotIDSRelayReceiver *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDCameraSnapshotIDSRelayReceiver *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;

  objc_initWeak(&location, self);
  v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Snapshot Relay Receiver"));
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __53__HMDCameraSnapshotRemoteRelayReceiver__getSnapshot___block_invoke;
  v24[3] = &unk_24E798E20;
  objc_copyWeak(&v25, &location);
  -[HMDCameraSnapshotReceiver _sendRequestWithTierType:toResident:](self, "_sendRequestWithTierType:toResident:", a3, v24);
  v5 = [HMDCameraIDSSessionInviterDeviceVerifier alloc];
  -[HMDCameraSnapshotReceiver sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotReceiver remoteDevice](self, "remoteDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDCameraIDSSessionInviterDeviceVerifier initWithSessionID:expectedInviter:](v5, "initWithSessionID:expectedInviter:", v7, v8);

  v10 = objc_alloc(MEMORY[0x24BDD1880]);
  -[HMDCameraSnapshotReceiver sessionID](self, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithUUIDString:", v12);

  +[HMDApplicationVendorIDStore sharedStore](HMDApplicationVendorIDStore, "sharedStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotReceiver sessionID](self, "sessionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hostProcessBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "machUUIDsForApplication:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = [HMDCameraSnapshotIDSRelayReceiver alloc];
  -[HMDCameraSnapshotReceiver sessionID](self, "sessionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sessionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotReceiver workQueue](self, "workQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HMDCameraSnapshotIDSRelayReceiver initWithSessionID:logIdentifier:machOUUID:workQueue:sessionInviterDeviceVerifier:delegate:](v18, "initWithSessionID:logIdentifier:machOUUID:workQueue:sessionInviterDeviceVerifier:delegate:", v13, v20, v21, v22, v9, self);
  -[HMDCameraSnapshotRemoteRelayReceiver setRelayReceiver:](self, "setRelayReceiver:", v23);

  objc_destroyWeak(&v25);
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMDCameraSnapshotRemoteRelayReceiver_snapShotSendFailed___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_callGettingImageDelegate:(id)a3
{
  id v4;
  void *v5;
  HMDCameraSnapshotRemoteRelayReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  HMDCameraSnapshotRemoteRelayReceiver *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling getting image delegate with error %@ for session %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BE3F138], "currentActivity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "markWithReason:", CFSTR("Did start getting image"));

  -[HMDCameraSnapshotRemoteRelayReceiver delegate](v6, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotReceiver delegateQueue](v6, "delegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__HMDCameraSnapshotRemoteRelayReceiver__callGettingImageDelegate___block_invoke;
    block[3] = &unk_24E79BBD0;
    v14 = v11;
    v15 = v6;
    v16 = v4;
    dispatch_async(v12, block);

  }
}

- (void)_callDidSaveImageDelegateWithError:(id)a3
{
  id v4;
  void *v5;
  HMDCameraSnapshotRemoteRelayReceiver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  HMDCameraSnapshotRemoteRelayReceiver *v16;
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

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotReceiver snapshotFile](v6, "snapshotFile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotReceiver sessionID](v6, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v4;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that download of image %@ has completed with error %@ for session %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BE3F138], "currentActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "markWithReason:", CFSTR("Calling delegate"));

  -[HMDCameraSnapshotRemoteRelayReceiver delegate](v6, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotReceiver delegateQueue](v6, "delegateQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__HMDCameraSnapshotRemoteRelayReceiver__callDidSaveImageDelegateWithError___block_invoke;
    block[3] = &unk_24E79BBD0;
    v15 = v12;
    v16 = v6;
    v17 = v4;
    dispatch_async(v13, block);

  }
}

- (void)relayReceiver:(id)a3 didReceiveData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDCameraSnapshotRemoteRelayReceiver *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDCameraSnapshotReceiver workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v15;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Image receive has completed with error: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  if (!v10)
  {
    -[HMDCameraSnapshotRemoteRelayReceiver relayReceiver](v13, "relayReceiver");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "snapshotRelayTransaction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraSnapshotReceiver snapshotFile](v13, "snapshotFile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "decodeIDSDataReceived:snapshotDataTransaction:", v9, v17);

    if ((v19 & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1035);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  -[HMDCameraSnapshotRemoteRelayReceiver _callDidSaveImageDelegateWithError:](v13, "_callDidSaveImageDelegateWithError:", v10);
  -[HMDCameraSnapshotReceiver _sendConfirmationToResident:](v13, "_sendConfirmationToResident:", &__block_literal_global_36_142803);

}

- (void)relayReceiverDidAcceptIDSInvitation:(id)a3
{
  id v3;

  -[HMDCameraSnapshotReceiver sessionID](self, "sessionID", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markMilestoneFor:", CFSTR("IDSSessionInvitationReceived"));

}

- (void)relayReceiverIDSSessionDidStart:(id)a3
{
  id v3;

  -[HMDCameraSnapshotReceiver sessionID](self, "sessionID", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markMilestoneFor:", CFSTR("IDSSessionStartedOnReceiver"));

}

- (HMDCameraSnapshotRemoteRelayReceiverDelegate)delegate
{
  return (HMDCameraSnapshotRemoteRelayReceiverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDCameraSnapshotIDSRelayReceiver)relayReceiver
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

void __75__HMDCameraSnapshotRemoteRelayReceiver__callDidSaveImageDelegateWithError___block_invoke(uint64_t a1)
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
  objc_msgSend(v2, "snapshotRelayReceiver:didSaveSnapshotFile:error:sessionID:", v3, v6, v4, v5);

}

void __66__HMDCameraSnapshotRemoteRelayReceiver__callGettingImageDelegate___block_invoke(_QWORD *a1)
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
  objc_msgSend(v1, "snapshotRelayReceiver:didStartGettingImage:sessionID:", v2, v3, v4);

}

void __59__HMDCameraSnapshotRemoteRelayReceiver_snapShotSendFailed___block_invoke(uint64_t a1)
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

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Send failed on snapshot session %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(id *)(a1 + 40);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1036);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "_callDidSaveImageDelegateWithError:", v7);

}

void __53__HMDCameraSnapshotRemoteRelayReceiver__getSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
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

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = v8;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v12;
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Take snapshot relayed to resident has failed: %@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v10, "_callDidSaveImageDelegateWithError:", v5);
    }
    else
    {
      objc_msgSend(WeakRetained, "_callGettingImageDelegate:", 0);
    }
  }

}

uint64_t __52__HMDCameraSnapshotRemoteRelayReceiver_getSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSnapshot:", *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_142845 != -1)
    dispatch_once(&logCategory__hmf_once_t1_142845, &__block_literal_global_142846);
  return (id)logCategory__hmf_once_v2_142847;
}

void __51__HMDCameraSnapshotRemoteRelayReceiver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_142847;
  logCategory__hmf_once_v2_142847 = v0;

}

@end
