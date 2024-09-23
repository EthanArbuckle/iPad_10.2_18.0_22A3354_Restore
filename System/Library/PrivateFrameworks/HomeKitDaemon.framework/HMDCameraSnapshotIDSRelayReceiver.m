@implementation HMDCameraSnapshotIDSRelayReceiver

- (HMDCameraSnapshotIDSRelayReceiver)initWithSessionID:(id)a3 logIdentifier:(id)a4 machOUUID:(id)a5 workQueue:(id)a6 sessionInviterDeviceVerifier:(id)a7 delegate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMDCameraSnapshotIDSRelayReceiver *v18;
  id v19;
  void *v20;
  objc_class *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  HMFActivity *activity;
  uint64_t v28;
  NSMutableData *relayData;
  uint64_t v30;
  NSMutableData *expectedByteCountData;
  id v33;
  objc_super v34;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v34.receiver = self;
  v34.super_class = (Class)HMDCameraSnapshotIDSRelayReceiver;
  v18 = -[HMDCameraSnapshotIDSRelay initWithSessionID:logIdentifier:workQueue:](&v34, sel_initWithSessionID_logIdentifier_workQueue_, v14, a4, a6);
  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x24BE3F138]);
    v20 = (void *)MEMORY[0x24BDD17C8];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v33 = v16;
    v23 = v15;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ (%@)"), v22, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v19, "initWithName:parent:options:", v25, 0, 16);
    activity = v18->_activity;
    v18->_activity = (HMFActivity *)v26;

    objc_storeStrong((id *)&v18->_machOUUID, a5);
    objc_storeWeak((id *)&v18->_delegate, v17);
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v28 = objc_claimAutoreleasedReturnValue();
    relayData = v18->_relayData;
    v18->_relayData = (NSMutableData *)v28;

    v15 = v23;
    v16 = v33;
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v30 = objc_claimAutoreleasedReturnValue();
    expectedByteCountData = v18->_expectedByteCountData;
    v18->_expectedByteCountData = (NSMutableData *)v30;

    objc_storeStrong((id *)&v18->_sessionInviterDeviceVerifier, a7);
  }

  return v18;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraSnapshotIDSRelay sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_startDataReceive
{
  NSObject *v3;
  void *v4;
  uintptr_t v5;
  NSObject *v6;
  dispatch_source_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraSnapshotIDSRelayReceiver idsSession](self, "idsSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v4, "socket");
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_source_create(MEMORY[0x24BDACA00], v5, 0, v6);
  -[HMDCameraSnapshotIDSRelayReceiver setSocketSource:](self, "setSocketSource:", v7);

  objc_initWeak(&location, self);
  -[HMDCameraSnapshotIDSRelayReceiver socketSource](self, "socketSource");
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __54__HMDCameraSnapshotIDSRelayReceiver__startDataReceive__block_invoke;
  v13 = &unk_24E797318;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v8, &v10);

  -[HMDCameraSnapshotIDSRelayReceiver socketSource](self, "socketSource", v10, v11, v12, v13);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_handleDataFromSocket:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCameraSnapshotIDSRelayReceiver *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id v19;
  void *v20;
  HMDCameraSnapshotIDSRelayReceiver *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDCameraSnapshotIDSRelayReceiver *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  HMDCameraSnapshotIDSRelayReceiver *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraSnapshotIDSRelayReceiver socketSource](self, "socketSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543362;
      v41 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Socket source is already nil, rejecting the data from socket", (uint8_t *)&v40, 0xCu);
LABEL_20:

    }
LABEL_21:

    objc_autoreleasePoolPop(v13);
    goto LABEL_22;
  }
  if (!-[HMDCameraSnapshotIDSRelayReceiver expectedByteCount](self, "expectedByteCount"))
  {
    -[HMDCameraSnapshotIDSRelayReceiver expectedByteCountData](self, "expectedByteCountData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 8 - objc_msgSend(v7, "length");

    v9 = objc_msgSend(v4, "length");
    -[HMDCameraSnapshotIDSRelayReceiver expectedByteCountData](self, "expectedByteCountData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9 <= v8)
    {
      objc_msgSend(v10, "appendData:", v4);
    }
    else
    {
      objc_msgSend(v4, "subdataWithRange:", 0, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendData:", v12);

    }
    -[HMDCameraSnapshotIDSRelayReceiver expectedByteCountData](self, "expectedByteCountData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18 > 7)
    {
      -[HMDCameraSnapshotIDSRelayReceiver expectedByteCountData](self, "expectedByteCountData");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[HMDCameraSnapshotIDSRelayReceiver setExpectedByteCount:](self, "setExpectedByteCount:", *(_QWORD *)objc_msgSend(v19, "bytes"));

      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138543618;
        v41 = v23;
        v42 = 2048;
        v43 = -[HMDCameraSnapshotIDSRelayReceiver expectedByteCount](v21, "expectedByteCount");
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Setting expected byte count to %llu", (uint8_t *)&v40, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v24 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v24, "replaceBytesInRange:withBytes:length:", 0, 8, 0, 0);

      v4 = v24;
      goto LABEL_12;
    }
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotIDSRelayReceiver expectedByteCountData](v14, "expectedByteCountData");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543618;
      v41 = v16;
      v42 = 2048;
      v43 = objc_msgSend(v39, "length");
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Only received %lu bytes that represent the expected byte count so far; will wait for more",
        (uint8_t *)&v40,
        0x16u);

      goto LABEL_20;
    }
    goto LABEL_21;
  }
LABEL_12:
  -[HMDCameraSnapshotIDSRelayReceiver relayData](self, "relayData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendData:", v4);

  v26 = (void *)MEMORY[0x227676638]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDCameraSnapshotIDSRelayReceiver receivedByteCount](v27, "receivedByteCount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "length") + -[HMDCameraSnapshotIDSRelayReceiver receivedByteCount](v27, "receivedByteCount"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138543874;
    v41 = v29;
    v42 = 2112;
    v43 = (uint64_t)v30;
    v44 = 2112;
    v45 = v31;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Updating received byte count from %@ to %@", (uint8_t *)&v40, 0x20u);

  }
  objc_autoreleasePoolPop(v26);
  -[HMDCameraSnapshotIDSRelayReceiver setReceivedByteCount:](v27, "setReceivedByteCount:", -[HMDCameraSnapshotIDSRelayReceiver receivedByteCount](v27, "receivedByteCount") + objc_msgSend(v4, "length"));
  v32 = -[HMDCameraSnapshotIDSRelayReceiver receivedByteCount](v27, "receivedByteCount");
  if (v32 == -[HMDCameraSnapshotIDSRelayReceiver expectedByteCount](v27, "expectedByteCount"))
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = v27;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543362;
      v41 = v36;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@All the bytes have been received, file transfer is complete", (uint8_t *)&v40, 0xCu);

    }
    objc_autoreleasePoolPop(v33);
    -[HMDCameraSnapshotIDSRelayReceiver relayData](v34, "relayData");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "copy");
    -[HMDCameraSnapshotIDSRelayReceiver _didReceiveData:error:](v34, "_didReceiveData:error:", v38, 0);

  }
LABEL_22:

}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotIDSRelayReceiver *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the HMDCameraSnapshotIDSRelayReceiver", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraSnapshotIDSRelayReceiver idsSession](v4, "idsSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endSession");

  -[HMDCameraSnapshotIDSRelayReceiver socketSource](v4, "socketSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCameraSnapshotIDSRelayReceiver socketSource](v4, "socketSource");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v9);

  }
  v10.receiver = v4;
  v10.super_class = (Class)HMDCameraSnapshotIDSRelayReceiver;
  -[HMDCameraSnapshotIDSRelay dealloc](&v10, sel_dealloc);
}

- (void)_didReceiveData:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMFActivity *activity;

  v6 = a4;
  v7 = a3;
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCameraSnapshotIDSRelayReceiver socketSource](self, "socketSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDCameraSnapshotIDSRelayReceiver socketSource](self, "socketSource");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v10);

    -[HMDCameraSnapshotIDSRelayReceiver setSocketSource:](self, "setSocketSource:", 0);
  }
  -[HMDCameraSnapshotIDSRelayReceiver delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "relayReceiver:didReceiveData:error:", self, v7, v6);

  -[HMFActivity invalidate](self->_activity, "invalidate");
  activity = self->_activity;
  self->_activity = 0;

}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  void *v31;
  HMDCameraSnapshotIDSRelayReceiver *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDCameraSnapshotIDSRelayReceiver *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDCameraSnapshotIDSRelayReceiver *v50;
  NSObject *v51;
  void *v52;
  const char *v53;
  NSObject *v54;
  os_log_type_t v55;
  void *v56;
  HMDCameraSnapshotIDSRelayReceiver *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  HMDCameraSnapshotIDSRelayReceiver *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  HMDCameraSnapshotIDSRelayReceiver *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  void *v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v77 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v49 = (void *)MEMORY[0x227676638]();
    v50 = self;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v82 = v52;
      v83 = 2112;
      v84 = v14;
      v53 = "%{public}@Could not determine device handle for fromID: %@";
      v54 = v51;
      v55 = OS_LOG_TYPE_ERROR;
LABEL_21:
      _os_log_impl(&dword_2218F0000, v54, v55, v53, buf, 0x16u);

    }
LABEL_22:

    objc_autoreleasePoolPop(v49);
    goto LABEL_39;
  }
  -[HMDCameraSnapshotIDSRelayReceiver sessionInviterDeviceVerifier](self, "sessionInviterDeviceVerifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "canAcceptInvitationFromDeviceWithHandle:", v17);

  if ((v19 & 1) == 0)
  {
    v49 = (void *)MEMORY[0x227676638]();
    v50 = self;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v82 = v52;
      v83 = 2112;
      v84 = v17;
      v53 = "%{public}@Ignoring invitation from %@";
      v54 = v51;
      v55 = OS_LOG_TYPE_INFO;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v20 = (void *)MEMORY[0x24BDD1620];
  getIDSSessionOptionsAllowedClasses();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0;
  objc_msgSend(v20, "unarchivedObjectOfClasses:fromData:error:", v21, v15, &v78);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v78;

  if (v22)
  {
    v75 = v22;
    v23 = v22;
    objc_opt_class();
    v24 = objc_opt_isKindOfClass() & 1;
    if (v24)
      v25 = v23;
    else
      v25 = 0;
    v26 = v25;

    if (v24)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kCameraSessionID"));
      v27 = objc_claimAutoreleasedReturnValue();
      v71 = (void *)v27;
      if (v27)
      {
        v28 = v27;
        v72 = v26;
        -[HMDCameraSnapshotIDSRelayReceiver sessionInviterDeviceVerifier](self, "sessionInviterDeviceVerifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "canAcceptInvitationForSessionWithIdentifier:", v28);

        v31 = (void *)MEMORY[0x227676638]();
        v32 = self;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if ((v30 & 1) != 0)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v82 = v35;
            v83 = 2112;
            v84 = v13;
            v85 = 2112;
            v86 = v14;
            _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Received invitation for session %@ from %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v31);
          -[HMFActivity markWithReason:](v32->_activity, "markWithReason:", CFSTR("Received invitation"));
          -[HMDCameraSnapshotIDSRelayReceiver setIdsSession:](v32, "setIdsSession:", v13);
          -[HMDCameraSnapshotIDSRelayReceiver idsSession](v32, "idsSession");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraSnapshotIDSRelay workQueue](v32, "workQueue");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setDelegate:queue:", v32, v37);

          -[HMDCameraSnapshotIDSRelayReceiver machOUUID](v32, "machOUUID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
          {
            -[HMDCameraSnapshotIDSRelayReceiver idsSession](v32, "idsSession");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = *MEMORY[0x24BE4FB80];
            -[HMDCameraSnapshotIDSRelayReceiver machOUUID](v32, "machOUUID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "UUIDString");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = v41;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setPreferences:", v42);

          }
          -[HMDCameraSnapshotIDSRelayReceiver idsSession](v32, "idsSession", v71);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "acceptInvitation");

          v44 = (void *)MEMORY[0x227676638]();
          v45 = v32;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v82 = v47;
            _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Accepted invitation", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v44);
          -[HMDCameraSnapshotIDSRelayReceiver delegate](v45, "delegate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "relayReceiverDidAcceptIDSInvitation:", v45);

        }
        else
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v82 = v70;
            v83 = 2112;
            v84 = v71;
            _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring invitation for camera session ID: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v31);
        }
        v26 = v72;
      }
      else
      {
        v66 = (void *)MEMORY[0x227676638]();
        v67 = self;
        HMFGetOSLogHandle();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v74 = v26;
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v82 = v69;
          v83 = 2112;
          v84 = v23;
          _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_ERROR, "%{public}@Could not find camera session ID in payload: %@", buf, 0x16u);

          v26 = v74;
        }

        objc_autoreleasePoolPop(v66);
      }

    }
    else
    {
      v60 = (void *)MEMORY[0x227676638]();
      v61 = self;
      HMFGetOSLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v73 = v26;
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v82 = v63;
        v83 = 2112;
        v84 = v23;
        v85 = 2112;
        v86 = v64;
        v65 = v64;
        _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unarchived payload was not an NSDictionary: %@ (%@)", buf, 0x20u);

        v26 = v73;
      }

      objc_autoreleasePoolPop(v60);
    }
    v22 = v75;

  }
  else
  {
    v56 = (void *)MEMORY[0x227676638]();
    v57 = self;
    HMFGetOSLogHandle();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v82 = v59;
      v83 = 2112;
      v84 = v76;
      _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive payload from context data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v56);
  }

LABEL_39:
}

- (void)sessionStarted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraSnapshotIDSRelayReceiver *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMFActivity markWithReason:](self->_activity, "markWithReason:", CFSTR("Session started"));
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Session %{public}@ has started", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraSnapshotIDSRelayReceiver delegate](v7, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relayReceiverIDSSessionDidStart:", v7);

  -[HMDCameraSnapshotIDSRelayReceiver _startDataReceive](v7, "_startDataReceive");
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDCameraSnapshotIDSRelayReceiver *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMFActivity markWithReason:](self->_activity, "markWithReason:", CFSTR("Session ended"));
  -[HMDCameraSnapshotIDSRelay workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v14;
    v17 = 2114;
    v18 = v8;
    v19 = 1026;
    v20 = a4;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Session %{public}@ has ended with reason: %{public}u and error: %{public}@", (uint8_t *)&v15, 0x26u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDCameraSnapshotIDSRelayReceiver _didReceiveData:error:](v12, "_didReceiveData:error:", 0, v9);

}

- (IDSSession)idsSession
{
  return (IDSSession *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdsSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (HMDCameraSnapshotIDSRelayReceiverDelegate)delegate
{
  return (HMDCameraSnapshotIDSRelayReceiverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMDCameraIDSSessionInviterDeviceVerifier)sessionInviterDeviceVerifier
{
  return (HMDCameraIDSSessionInviterDeviceVerifier *)objc_getProperty(self, a2, 72, 1);
}

- (NSUUID)machOUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableData)relayData
{
  return (NSMutableData *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableData)expectedByteCountData
{
  return (NSMutableData *)objc_getProperty(self, a2, 96, 1);
}

- (unint64_t)expectedByteCount
{
  return self->_expectedByteCount;
}

- (void)setExpectedByteCount:(unint64_t)a3
{
  self->_expectedByteCount = a3;
}

- (unint64_t)receivedByteCount
{
  return self->_receivedByteCount;
}

- (void)setReceivedByteCount:(unint64_t)a3
{
  self->_receivedByteCount = a3;
}

- (OS_dispatch_source)socketSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSocketSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketSource, 0);
  objc_storeStrong((id *)&self->_expectedByteCountData, 0);
  objc_storeStrong((id *)&self->_relayData, 0);
  objc_storeStrong((id *)&self->_machOUUID, 0);
  objc_storeStrong((id *)&self->_sessionInviterDeviceVerifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsSession, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

void __54__HMDCameraSnapshotIDSRelayReceiver__startDataReceive__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  ssize_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _BYTE v13[1024];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  ssize_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "idsSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = recvfrom(objc_msgSend(v2, "socket"), v13, 0x400uLL, 0, 0, 0);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = WeakRetained;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v7;
    v16 = 2048;
    v17 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Received data of length %ld", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  if (v3)
  {
    if (v3 < 1)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = v5;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v12;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Recv from socket returned error, aborting the file receive", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1032);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_didReceiveData:error:", 0, v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v13, v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_handleDataFromSocket:", v8);
    }

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_230512 != -1)
    dispatch_once(&logCategory__hmf_once_t0_230512, &__block_literal_global_230513);
  return (id)logCategory__hmf_once_v1_230514;
}

void __48__HMDCameraSnapshotIDSRelayReceiver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_230514;
  logCategory__hmf_once_v1_230514 = v0;

}

@end
