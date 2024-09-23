@implementation HMDCameraSnapshotRemoteRelaySender

- (HMDCameraSnapshotRemoteRelaySender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 accessory:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 uniqueIdentifier:(id)a9 snapshotRequestHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HMDCameraSnapshotRemoteRelaySender *v22;
  HMDCameraSnapshotRemoteRelaySender *v23;
  HMDCameraSnapshotLocal *v24;
  HMDCameraSnapshotLocal *snapshotLocal;
  id v26;
  void *v27;
  void *v28;
  HMDCameraSnapshotIDSRelayInitiator *v29;
  void *v30;
  uint64_t v31;
  HMDCameraSnapshotIDSRelayInitiator *relayInitiator;
  objc_super v34;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  v34.receiver = self;
  v34.super_class = (Class)HMDCameraSnapshotRemoteRelaySender;
  v22 = -[HMDCameraSnapshotSender initWithSessionID:workQueue:device:accessory:delegateQueue:uniqueIdentifier:](&v34, sel_initWithSessionID_workQueue_device_accessory_delegateQueue_uniqueIdentifier_, v16, v17, v18, v19, a8, a9);
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_delegate, v20);
    v24 = -[HMDCameraSnapshotLocal initWithSessionID:workQueue:accessory:delegate:delegateQueue:snapshotRequestHandler:]([HMDCameraSnapshotLocal alloc], "initWithSessionID:workQueue:accessory:delegate:delegateQueue:snapshotRequestHandler:", v16, v17, v19, v23, v17, v21);
    snapshotLocal = v23->_snapshotLocal;
    v23->_snapshotLocal = v24;

    v26 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v16, "sessionID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithUUIDString:", v27);

    v29 = [HMDCameraSnapshotIDSRelayInitiator alloc];
    objc_msgSend(v16, "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[HMDCameraSnapshotIDSRelayInitiator initWithSessionID:logIdentifier:workQueue:device:delegate:](v29, "initWithSessionID:logIdentifier:workQueue:device:delegate:", v28, v30, v17, v18, v23);
    relayInitiator = v23->_relayInitiator;
    v23->_relayInitiator = (HMDCameraSnapshotIDSRelayInitiator *)v31;

  }
  return v23;
}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotRemoteRelaySender *v4;
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting HMDCameraSnapshotRemoteRelaySender", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotRemoteRelaySender;
  -[HMDCameraSnapshotRemoteRelaySender dealloc](&v7, sel_dealloc);
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
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__HMDCameraSnapshotRemoteRelaySender_getSnapshot___block_invoke;
  v6[3] = &unk_24E797C10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)snapShotTransferComplete
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDCameraSnapshotSender workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__HMDCameraSnapshotRemoteRelaySender_snapShotTransferComplete__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_callDidStartCaptureImageDelegate:(id)a3
{
  id v4;
  void *v5;
  HMDCameraSnapshotRemoteRelaySender *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  HMDCameraSnapshotRemoteRelaySender *v15;
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
    -[HMDCameraSnapshotRemoteRelaySender snapshotLocal](v6, "snapshotLocal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that capture of image has started with error %@ for session %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraSnapshotRemoteRelaySender delegate](v6, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotSender delegateQueue](v6, "delegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__HMDCameraSnapshotRemoteRelaySender__callDidStartCaptureImageDelegate___block_invoke;
    block[3] = &unk_24E79BBD0;
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
  HMDCameraSnapshotRemoteRelaySender *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  HMDCameraSnapshotRemoteRelaySender *v15;
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
    -[HMDCameraSnapshotRemoteRelaySender snapshotLocal](v6, "snapshotLocal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that transfer of image has completed with error %@ for session %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraSnapshotRemoteRelaySender delegate](v6, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotSender delegateQueue](v6, "delegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__HMDCameraSnapshotRemoteRelaySender__callDidCompleteSendImageDelegate___block_invoke;
    block[3] = &unk_24E79BBD0;
    v14 = v11;
    v15 = v6;
    v16 = v4;
    dispatch_async(v12, block);

  }
}

- (void)_callDidSaveSnapshotFileDelegate:(id)a3
{
  id v4;
  void *v5;
  HMDCameraSnapshotRemoteRelaySender *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  HMDCameraSnapshotRemoteRelaySender *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotRemoteRelaySender snapshotLocal](v6, "snapshotLocal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that snapshot file has been saved for session %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraSnapshotRemoteRelaySender delegate](v6, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotSender delegateQueue](v6, "delegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__HMDCameraSnapshotRemoteRelaySender__callDidSaveSnapshotFileDelegate___block_invoke;
    block[3] = &unk_24E79BBD0;
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
  HMDCameraSnapshotRemoteRelaySender *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCameraSnapshotRemoteRelaySender *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDCameraSnapshotRemoteRelaySender *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v12)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v17;
      v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Snapshot local capture has ended in %@", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDCameraSnapshotSender _sendImageSendFailure:](v15, "_sendImageSendFailure:", v12);
    -[HMDCameraSnapshotRemoteRelaySender _callDidCompleteSendImageDelegate:](v15, "_callDidCompleteSendImageDelegate:", v12);
  }
  else
  {
    objc_msgSend(v11, "encodedDataForIDSSend");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)MEMORY[0x227676638](-[HMDCameraSnapshotRemoteRelaySender _callDidSaveSnapshotFileDelegate:](self, "_callDidSaveSnapshotFileDelegate:", v11));
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v22;
        v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Scheduling the transfer of file %@ through IDS", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      -[HMDCameraSnapshotRemoteRelaySender relayInitiator](v20, "relayInitiator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sendData:", v18);

    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v27;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode snapshot file to send over IDS", (uint8_t *)&v28, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      -[HMDCameraSnapshotSender _sendImageSendFailure:](v25, "_sendImageSendFailure:", 0);
      -[HMDCameraSnapshotRemoteRelaySender _callDidCompleteSendImageDelegate:](v25, "_callDidCompleteSendImageDelegate:", 0);
    }

  }
}

- (void)relayInitiator:(id)a3 didEndIDSSessionWithError:(id)a4
{
  NSObject *v4;

  -[HMDCameraSnapshotSender workQueue](self, "workQueue", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

}

- (void)relayInitiatorDidSendDataSuccessfully:(id)a3
{
  NSObject *v4;
  id v5;

  -[HMDCameraSnapshotSender workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDCameraSnapshotSender sessionID](self, "sessionID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markMilestoneFor:", CFSTR("IDSTransferSentImage"));

}

- (void)relayInitiatorIDSSessionDidStart:(id)a3
{
  NSObject *v4;
  id v5;

  -[HMDCameraSnapshotSender workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDCameraSnapshotSender sessionID](self, "sessionID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markMilestoneFor:", CFSTR("IDSSessionStartedOnInitiator"));

}

- (void)relayInitiatorDidStartDataSend:(id)a3
{
  NSObject *v3;

  -[HMDCameraSnapshotSender workQueue](self, "workQueue", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

}

- (void)relayInitiator:(id)a3 didSendData:(id)a4
{
  NSObject *v5;
  id v6;

  v6 = a4;
  -[HMDCameraSnapshotSender workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraSnapshotSender _sendImageSendFailure:](self, "_sendImageSendFailure:", v6);
  -[HMDCameraSnapshotRemoteRelaySender _callDidCompleteSendImageDelegate:](self, "_callDidCompleteSendImageDelegate:", v6);

}

- (void)relayInitiatorDidSendIDSInvitation:(id)a3
{
  NSObject *v4;
  id v5;

  -[HMDCameraSnapshotSender workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDCameraSnapshotSender sessionID](self, "sessionID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markMilestoneFor:", CFSTR("IDSSessionInvitationSent"));

}

- (HMDCameraSnapshotLocal)snapshotLocal
{
  return self->_snapshotLocal;
}

- (HMDCameraSnapshotRemoteRelaySenderDelegate)delegate
{
  return (HMDCameraSnapshotRemoteRelaySenderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMDCameraSnapshotIDSRelayInitiator)relayInitiator
{
  return self->_relayInitiator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayInitiator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotLocal, 0);
}

void __71__HMDCameraSnapshotRemoteRelaySender__callDidSaveSnapshotFileDelegate___block_invoke(_QWORD *a1)
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
  objc_msgSend(v1, "snapshotRelaySender:didSaveSnapshotFile:sessionID:", v2, v3, v4);

}

void __72__HMDCameraSnapshotRemoteRelaySender__callDidCompleteSendImageDelegate___block_invoke(_QWORD *a1)
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
  objc_msgSend(v1, "snapshotRelaySender:didCompleteSendImage:sessionID:", v2, v3, v4);

}

void __72__HMDCameraSnapshotRemoteRelaySender__callDidStartCaptureImageDelegate___block_invoke(_QWORD *a1)
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
  objc_msgSend(v1, "snapshotRelaySender:didStartCaptureImage:sessionID:", v2, v3, v4);

}

uint64_t __62__HMDCameraSnapshotRemoteRelaySender_snapShotTransferComplete__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Snapshot transfer to remote receiver is complete", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_callDidCompleteSendImageDelegate:", 0);
}

uint64_t __50__HMDCameraSnapshotRemoteRelaySender_getSnapshot___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Getting the snapshot from local snapshot handler", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "relayInitiator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendIDSInvitation");

  objc_msgSend(*(id *)(a1 + 32), "snapshotLocal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getSnapshot:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_callDidStartCaptureImageDelegate:", 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_207042 != -1)
    dispatch_once(&logCategory__hmf_once_t1_207042, &__block_literal_global_207043);
  return (id)logCategory__hmf_once_v2_207044;
}

void __49__HMDCameraSnapshotRemoteRelaySender_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_207044;
  logCategory__hmf_once_v2_207044 = v0;

}

@end
