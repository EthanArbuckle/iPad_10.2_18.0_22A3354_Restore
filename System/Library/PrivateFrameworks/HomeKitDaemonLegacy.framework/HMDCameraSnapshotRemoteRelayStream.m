@implementation HMDCameraSnapshotRemoteRelayStream

- (HMDCameraSnapshotRemoteRelayStream)initWithSessionID:(id)a3 workQueue:(id)a4 sourceDevice:(id)a5 remoteDevice:(id)a6 accessory:(id)a7 delegate:(id)a8 delegateQueue:(id)a9 uniqueIdentifier:(id)a10 snapshotRequestHandler:(id)a11 residentMessageHandler:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  HMDCameraSnapshotRemoteRelayStream *v26;
  HMDCameraSnapshotRemoteRelayStream *v27;
  HMDCameraSnapshotRemoteStreamSender *v28;
  HMDCameraSnapshotRemoteStreamSender *streamSender;
  HMDCameraSnapshotRemoteRelayReceiver *v30;
  HMDCameraSnapshotRemoteRelayReceiver *relayReceiver;
  HMDCameraSnapshotRemoteRelayStream *result;
  HMDCameraSnapshotRemoteRelayStream *v33;
  SEL v34;
  id obj;
  id v37;
  id v38;
  objc_super v39;

  v17 = a3;
  obj = a4;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v37 = a8;
  v38 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  if (!v17)
  {
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
  if (!v38)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v22)
  {
LABEL_19:
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  if (!v23)
  {
LABEL_20:
    _HMFPreconditionFailure();
    goto LABEL_21;
  }
  v25 = v24;
  if (!v24)
  {
LABEL_21:
    v33 = (HMDCameraSnapshotRemoteRelayStream *)_HMFPreconditionFailure();
    -[HMDCameraSnapshotRemoteRelayStream dealloc](v33, v34);
    return result;
  }
  v39.receiver = self;
  v39.super_class = (Class)HMDCameraSnapshotRemoteRelayStream;
  v26 = -[HMDCameraSnapshotRemoteRelayStream init](&v39, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_workQueue, obj);
    objc_storeWeak((id *)&v27->_delegate, v37);
    objc_storeStrong((id *)&v27->_delegateQueue, a9);
    v28 = -[HMDCameraSnapshotRemoteStreamSender initWithSessionID:workQueue:device:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:]([HMDCameraSnapshotRemoteStreamSender alloc], "initWithSessionID:workQueue:device:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:", v17, v18, v19, v21, v27, v18, v22, v23);
    streamSender = v27->_streamSender;
    v27->_streamSender = v28;

    v30 = -[HMDCameraSnapshotRemoteRelayReceiver initWithSessionID:workQueue:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:residentMessageHandler:remoteDevice:]([HMDCameraSnapshotRemoteRelayReceiver alloc], "initWithSessionID:workQueue:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:residentMessageHandler:remoteDevice:", v17, v18, v21, v27, v18, v22, v23, v25, v20);
    relayReceiver = v27->_relayReceiver;
    v27->_relayReceiver = v30;

  }
  return v27;
}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotRemoteRelayStream *v4;
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
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting HMDCameraSnapshotRemoteRelayStream", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotRemoteRelayStream;
  -[HMDCameraSnapshotRemoteRelayStream dealloc](&v7, sel_dealloc);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCameraSnapshotRemoteRelayStream streamSender](self, "streamSender");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)getSnapshot:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDCameraSnapshotRemoteRelayStream workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__HMDCameraSnapshotRemoteRelayStream_getSnapshot___block_invoke;
  v6[3] = &unk_1E89C0B98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)snapShotTransferComplete
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDCameraSnapshotRemoteRelayStream workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HMDCameraSnapshotRemoteRelayStream_snapShotTransferComplete__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)snapShotSendFailed:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraSnapshotRemoteRelayStream workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HMDCameraSnapshotRemoteRelayStream_snapShotSendFailed___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_callDidStartCaptureImageDelegate:(id)a3
{
  id v4;
  void *v5;
  HMDCameraSnapshotRemoteRelayStream *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  HMDCameraSnapshotRemoteRelayStream *v15;
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
    -[HMDCameraSnapshotRemoteRelayStream relayReceiver](v6, "relayReceiver");
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
  -[HMDCameraSnapshotRemoteRelayStream delegate](v6, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotRemoteRelayStream delegateQueue](v6, "delegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__HMDCameraSnapshotRemoteRelayStream__callDidStartCaptureImageDelegate___block_invoke;
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
  HMDCameraSnapshotRemoteRelayStream *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  HMDCameraSnapshotRemoteRelayStream *v15;
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
    -[HMDCameraSnapshotRemoteRelayStream streamSender](v6, "streamSender");
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
  -[HMDCameraSnapshotRemoteRelayStream delegate](v6, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraSnapshotRemoteRelayStream delegateQueue](v6, "delegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__HMDCameraSnapshotRemoteRelayStream__callDidCompleteSendImageDelegate___block_invoke;
    block[3] = &unk_1E89C20C8;
    v14 = v11;
    v15 = v6;
    v16 = v4;
    dispatch_async(v12, block);

  }
}

- (void)_sendImageSendFailure:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCameraSnapshotRemoteRelayStream *v9;
  NSObject *v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraSnapshotRemoteRelayStream streamSender](self, "streamSender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteDestinationString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v11;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending image send failure to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraSnapshotRemoteRelayStream streamSender](v9, "streamSender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "homeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotRemoteRelayStream streamSender](v9, "streamSender");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sessionID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sessionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("kCameraSessionID"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("kCameraSessionError"));

  }
  objc_msgSend(MEMORY[0x1E0D285F8], "internalMessageWithName:messagePayload:", CFSTR("kTakeSnapshotSendFailedNotificationKey"), v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setQualityOfService:", 33);
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_initWeak((id *)buf, v9);
  -[HMDCameraSnapshotRemoteRelayStream streamSender](v9, "streamSender");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "uniqueIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotRemoteRelayStream workQueue](v9, "workQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __60__HMDCameraSnapshotRemoteRelayStream__sendImageSendFailure___block_invoke;
  v26[3] = &unk_1E89BF5C0;
  objc_copyWeak(&v27, (id *)buf);
  objc_msgSend(v15, "sendSecureMessage:target:userID:destination:responseQueue:responseHandler:", v22, v24, 0, v7, v25, v26);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);

}

- (void)snapshotRelayReceiver:(id)a3 didStartGettingImage:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraSnapshotRemoteRelayStream *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v14;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Received delegate call back for getting image with error %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDCameraSnapshotRemoteRelayStream _callDidStartCaptureImageDelegate:](v12, "_callDidStartCaptureImageDelegate:", v9);

}

- (void)snapshotRelayReceiver:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDCameraSnapshotRemoteRelayStream *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
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
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v17;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Received delegate call back that the image %@ has been saved after relay with error %@", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  if (v12)
  {
    -[HMDCameraSnapshotRemoteRelayStream _sendImageSendFailure:](v15, "_sendImageSendFailure:", v12);
    -[HMDCameraSnapshotRemoteRelayStream _callDidCompleteSendImageDelegate:](v15, "_callDidCompleteSendImageDelegate:", v12);
  }
  else
  {
    -[HMDCameraSnapshotRemoteRelayStream streamSender](v15, "streamSender");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendSnapshotAtPath:", v11);

  }
}

- (void)snapshotStreamSender:(id)a3 didStartCaptureImage:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraSnapshotRemoteRelayStream *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v14;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Received delegate call back that the image transfer to watch has begun", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  if (v9)
  {
    -[HMDCameraSnapshotRemoteRelayStream _sendImageSendFailure:](v12, "_sendImageSendFailure:", v9);
    -[HMDCameraSnapshotRemoteRelayStream _callDidCompleteSendImageDelegate:](v12, "_callDidCompleteSendImageDelegate:", v9);
  }

}

- (void)snapshotStreamSender:(id)a3 didCompleteSendImage:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraSnapshotRemoteRelayStream *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v14;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Received delegate call back that the image transfer has completed with error %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDCameraSnapshotRemoteRelayStream _callDidCompleteSendImageDelegate:](v12, "_callDidCompleteSendImageDelegate:", v9);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDCameraSnapshotRemoteStreamSender)streamSender
{
  return self->_streamSender;
}

- (HMDCameraSnapshotRemoteRelayReceiver)relayReceiver
{
  return self->_relayReceiver;
}

- (HMDCameraSnapshotRemoteRelayStreamDelegate)delegate
{
  return (HMDCameraSnapshotRemoteRelayStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_relayReceiver, 0);
  objc_storeStrong((id *)&self->_streamSender, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __60__HMDCameraSnapshotRemoteRelayStream__sendImageSendFailure___block_invoke(uint64_t a1, void *a2, void *a3)
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

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Received response for image send failure notification", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v7);

}

void __72__HMDCameraSnapshotRemoteRelayStream__callDidCompleteSendImageDelegate___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  v3 = a1[6];
  objc_msgSend(v2, "streamSender");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "snapshotRelayStream:didCompleteSendImage:sessionID:", v2, v3, v4);

}

void __72__HMDCameraSnapshotRemoteRelayStream__callDidStartCaptureImageDelegate___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  v3 = a1[6];
  objc_msgSend(v2, "relayReceiver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "snapshotRelayStream:didStartCaptureImage:sessionID:", v2, v3, v4);

}

void __57__HMDCameraSnapshotRemoteRelayStream_snapShotSendFailed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "relayReceiver");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapShotSendFailed:", *(_QWORD *)(a1 + 40));

}

void __62__HMDCameraSnapshotRemoteRelayStream_snapShotTransferComplete__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
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
  objc_msgSend(*(id *)(a1 + 32), "streamSender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapShotTransferComplete");

}

void __50__HMDCameraSnapshotRemoteRelayStream_getSnapshot___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
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
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Getting the snapshot from local snapshot handler", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "relayReceiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getSnapshot:", *(_QWORD *)(a1 + 40));

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_71465 != -1)
    dispatch_once(&logCategory__hmf_once_t1_71465, &__block_literal_global_71466);
  return (id)logCategory__hmf_once_v2_71467;
}

void __49__HMDCameraSnapshotRemoteRelayStream_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_71467;
  logCategory__hmf_once_v2_71467 = v0;

}

@end
