@implementation HMDCameraSnapshotIDSRelayInitiator

- (HMDCameraSnapshotIDSRelayInitiator)initWithSessionID:(id)a3 logIdentifier:(id)a4 workQueue:(id)a5 device:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  HMDCameraSnapshotIDSRelayInitiator *v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HMFActivity *activity;
  objc_super v25;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HMDCameraSnapshotIDSRelayInitiator;
  v15 = -[HMDCameraSnapshotIDSRelay initWithSessionID:logIdentifier:workQueue:](&v25, sel_initWithSessionID_logIdentifier_workQueue_, v12, a4, a5);
  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0D28540]);
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ (%@)"), v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v16, "initWithName:parent:options:", v21, 0, 16);
    activity = v15->_activity;
    v15->_activity = (HMFActivity *)v22;

    objc_storeWeak((id *)&v15->_delegate, v14);
    objc_storeStrong((id *)&v15->_device, a6);
    v15->_idsSessionStarted = 0;
  }

  return v15;
}

- (void)sendData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDCameraSnapshotIDSRelayInitiator *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraSnapshotIDSRelayInitiator data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v14 = 138543362;
      *(_QWORD *)&v14[4] = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Data send already in progress", v14, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    *(_QWORD *)v14 = objc_msgSend(v4, "length");
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14, 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    -[HMDCameraSnapshotIDSRelayInitiator setData:](self, "setData:", v12);

    -[HMDCameraSnapshotIDSRelayInitiator data](self, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendData:", v4);

    -[HMDCameraSnapshotIDSRelayInitiator _sendData](self, "_sendData");
  }

}

- (void)_sendData
{
  NSObject *v3;
  void *v4;

  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDCameraSnapshotIDSRelayInitiator idsSessionStarted](self, "idsSessionStarted"))
  {
    -[HMDCameraSnapshotIDSRelayInitiator data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[HMDCameraSnapshotIDSRelayInitiator _startDataTransfer](self, "_startDataTransfer");
  }
}

- (void)sendIDSInvitation
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraSnapshotIDSRelayInitiator *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraSnapshotIDSRelay idsStreamService](self, "idsStreamService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") && (objc_msgSend(v5, "anyObject"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = *MEMORY[0x1E0D34278];
    v38[0] = *MEMORY[0x1E0D34280];
    v38[1] = v8;
    v39[0] = &unk_1E8B34F38;
    v39[1] = MEMORY[0x1E0C9AAA0];
    v38[2] = *MEMORY[0x1E0D34258];
    v39[2] = &unk_1E8B34F50;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D34378];
    -[HMDCameraSnapshotIDSRelayInitiator device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmd_sessionWithAccount:device:options:", v7, v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotIDSRelayInitiator setIdsSession:](self, "setIdsSession:", v12);

    -[HMDCameraSnapshotIDSRelayInitiator idsSession](self, "idsSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:queue:", self, v14);

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotIDSRelayInitiator idsSession](v16, "idsSession");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotIDSRelayInitiator device](v16, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v18;
      v32 = 2112;
      v33 = v19;
      v34 = 2112;
      v35 = v21;
      v36 = 2112;
      v37 = v9;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending out invitation for IDSSession %@ to device %@ with options: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDCameraSnapshotIDSRelay sessionID](v16, "sessionID", CFSTR("kCameraSessionID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    encodeRootObject();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotIDSRelayInitiator idsSession](v16, "idsSession");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sendInvitationWithData:", v25);

    -[HMDCameraSnapshotIDSRelayInitiator delegate](v16, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "relayInitiatorDidSendIDSInvitation:", v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1024);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotIDSRelayInitiator _callFileTransferFailed:](self, "_callFileTransferFailed:", v7);
  }

}

- (void)_startDataTransfer
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDCameraSnapshotIDSRelayInitiator *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  dispatch_source_t v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD handler[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraSnapshotIDSRelayInitiator delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relayInitiatorDidStartDataSend:", self);

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotIDSRelayInitiator data](v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2048;
    v21 = objc_msgSend(v9, "length");
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Total number of bytes to send: %tu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraSnapshotIDSRelayInitiator idsSession](v6, "idsSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "socket");
  -[HMDCameraSnapshotIDSRelay workQueue](v6, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_source_create(MEMORY[0x1E0C80DF0], v11, 0, v12);
  -[HMDCameraSnapshotIDSRelayInitiator setSocketSource:](v6, "setSocketSource:", v13);

  objc_initWeak((id *)buf, v6);
  -[HMDCameraSnapshotIDSRelayInitiator socketSource](v6, "socketSource");
  v14 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __56__HMDCameraSnapshotIDSRelayInitiator__startDataTransfer__block_invoke;
  handler[3] = &unk_1E89BE3F8;
  objc_copyWeak(&v17, (id *)buf);
  dispatch_source_set_event_handler(v14, handler);

  -[HMDCameraSnapshotIDSRelayInitiator socketSource](v6, "socketSource");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotIDSRelayInitiator *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the HMDCameraSnapshotIDSRelayInitiator", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraSnapshotIDSRelayInitiator idsSession](v4, "idsSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endSession");

  -[HMDCameraSnapshotIDSRelayInitiator socketSource](v4, "socketSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCameraSnapshotIDSRelayInitiator socketSource](v4, "socketSource");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v9);

  }
  v10.receiver = v4;
  v10.super_class = (Class)HMDCameraSnapshotIDSRelayInitiator;
  -[HMDCameraSnapshotIDSRelay dealloc](&v10, sel_dealloc);
}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDCameraSnapshotIDSRelayInitiator *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
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
    v13 = 138543874;
    v14 = v12;
    v15 = 2114;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Invitation for IDSSession %{public}@ has been accepted by: %@, waiting for session to get started", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v9);

}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDCameraSnapshotIDSRelayInitiator *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
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
    v14 = 138543874;
    v15 = v12;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Invitation for IDSSession %@ has been declined by: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1028);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotIDSRelayInitiator _callFileTransferFailed:](v10, "_callFileTransferFailed:", v13);

}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDCameraSnapshotIDSRelayInitiator *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
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
    v14 = 138543874;
    v15 = v12;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Invitation for IDSSession %@ was canceled by: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1029);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotIDSRelayInitiator _callFileTransferFailed:](v10, "_callFileTransferFailed:", v13);

}

- (void)sessionStarted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraSnapshotIDSRelayInitiator *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMFActivity markWithReason:](self->_activity, "markWithReason:", CFSTR("Session Started"));
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@IDSSession %{public}@ has started", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraSnapshotIDSRelayInitiator delegate](v7, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relayInitiatorIDSSessionDidStart:", v7);

  -[HMDCameraSnapshotIDSRelayInitiator setIdsSessionStarted:](v7, "setIdsSessionStarted:", 1);
  -[HMDCameraSnapshotIDSRelayInitiator _sendData](v7, "_sendData");

}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDCameraSnapshotIDSRelayInitiator *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[HMFActivity markWithReason:](self->_activity, "markWithReason:", CFSTR("Session Ended"));
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v14;
    v18 = 2114;
    v19 = v8;
    v20 = 1026;
    v21 = a4;
    v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@IDSSession %{public}@ has ended with reason: %{public}u and error %{public}@", (uint8_t *)&v16, 0x26u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:underlyingError:", 1030, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotIDSRelayInitiator _callFileTransferFailed:](v12, "_callFileTransferFailed:", v15);

}

- (void)_callFileTransferFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMFActivity *activity;

  v4 = a3;
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraSnapshotIDSRelayInitiator socketSource](self, "socketSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDCameraSnapshotIDSRelayInitiator socketSource](self, "socketSource");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v7);

    -[HMDCameraSnapshotIDSRelayInitiator setSocketSource:](self, "setSocketSource:", 0);
  }
  -[HMDCameraSnapshotIDSRelayInitiator delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relayInitiator:didEndIDSSessionWithError:", self, v4);

  -[HMFActivity invalidate](self->_activity, "invalidate");
  activity = self->_activity;
  self->_activity = 0;

}

- (IDSSession)idsSession
{
  return (IDSSession *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIdsSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (HMDCameraSnapshotIDSRelayInitiatorDelegate)delegate
{
  return (HMDCameraSnapshotIDSRelayInitiatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)idsSessionStarted
{
  return self->_idsSessionStarted;
}

- (void)setIdsSessionStarted:(BOOL)a3
{
  self->_idsSessionStarted = a3;
}

- (HMDDevice)device
{
  return (HMDDevice *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_source)socketSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSocketSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketSource, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsSession, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

void __56__HMDCameraSnapshotIDSRelayInitiator__startDataTransfer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  size_t v5;
  void *v6;
  int v7;
  id v8;
  ssize_t v9;
  void *v10;
  id *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  size_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v3, "length") > 0x3FF)
    {
      v5 = 1024;
    }
    else
    {
      objc_msgSend(v2, "data");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "length");

    }
    objc_msgSend(v2, "idsSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "socket");
    objc_msgSend(v2, "data");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = send(v7, (const void *)objc_msgSend(v8, "bytes"), v5, 0);

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v2;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9 == -1)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v25;
        v28 = 2048;
        v29 = v5;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to send the data of size %tu", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1025);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_callFileTransferFailed:", v24);
      goto LABEL_15;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v14;
      v28 = 2048;
      v29 = v9;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Sent %lu bytes", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v11, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "replaceBytesInRange:withBytes:length:", 0, v9, 0, 0);

    objc_msgSend(v11, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (!v17)
    {
      v18 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v11[6], "markWithReason:", CFSTR("Transfer completed")));
      v19 = v11;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v21;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@File transfer is complete with total transferred bytes", (uint8_t *)&v26, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(v19, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "relayInitiatorDidSendDataSuccessfully:", v19);

      objc_msgSend(v19, "socketSource");
      v23 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v23);

      objc_msgSend(v19, "setSocketSource:", 0);
      objc_msgSend(v11[6], "invalidate");
      v24 = v11[6];
      v11[6] = 0;
LABEL_15:

    }
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_162221 != -1)
    dispatch_once(&logCategory__hmf_once_t0_162221, &__block_literal_global_162222);
  return (id)logCategory__hmf_once_v1_162223;
}

void __49__HMDCameraSnapshotIDSRelayInitiator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_162223;
  logCategory__hmf_once_v1_162223 = v0;

}

@end
