@implementation HMDCameraClipUploader

- (HMDCameraClipUploader)initWithClipUUID:(id)a3 startDate:(id)a4 targetFragmentDuration:(double)a5 quality:(int64_t)a6 localZone:(id)a7 workQueue:(id)a8 logIdentifier:(id)a9
{
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HMDCameraClipUploaderFactory *v23;
  HMDCameraClipUploader *v24;

  v16 = (objc_class *)MEMORY[0x24BDD7550];
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a4;
  v21 = a3;
  v22 = objc_alloc_init(v16);
  v23 = objc_alloc_init(HMDCameraClipUploaderFactory);
  v24 = -[HMDCameraClipUploader initWithClipUUID:startDate:targetFragmentDuration:quality:localZone:workQueue:logIdentifier:encryptionManager:factory:](self, "initWithClipUUID:startDate:targetFragmentDuration:quality:localZone:workQueue:logIdentifier:encryptionManager:factory:", v21, v20, a6, v19, v18, v17, a5, v22, v23);

  return v24;
}

- (HMDCameraClipUploader)initWithClipUUID:(id)a3 startDate:(id)a4 targetFragmentDuration:(double)a5 quality:(int64_t)a6 localZone:(id)a7 workQueue:(id)a8 logIdentifier:(id)a9 encryptionManager:(id)a10 factory:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  HMDCameraClipUploader *v25;
  HMDCameraClipUploader *v26;
  uint64_t v27;
  NSDate *startDate;
  uint64_t v29;
  NSString *logIdentifier;
  uint64_t v31;
  NSMutableArray *operations;
  HMDCameraClipUploader *v34;
  SEL v35;
  id v37;
  objc_super v38;

  v18 = a3;
  v19 = a4;
  v37 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  if (!v18)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (fabs(a5) < 2.22044605e-16)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v37)
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
  if (!v22)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  v24 = v23;
  if (!v23)
  {
LABEL_19:
    v34 = (HMDCameraClipUploader *)_HMFPreconditionFailure();
    return (HMDCameraClipUploader *)-[HMDCameraClipUploader createClip](v34, v35);
  }
  v38.receiver = self;
  v38.super_class = (Class)HMDCameraClipUploader;
  v25 = -[HMDCameraClipUploader init](&v38, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_clipUUID, a3);
    v27 = objc_msgSend(v19, "copy");
    startDate = v26->_startDate;
    v26->_startDate = (NSDate *)v27;

    v26->_targetFragmentDuration = a5;
    v26->_quality = a6;
    objc_storeStrong((id *)&v26->_localZone, a7);
    objc_storeStrong((id *)&v26->_workQueue, a8);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v21, v18);
    v29 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v26->_logIdentifier;
    v26->_logIdentifier = (NSString *)v29;

    objc_storeStrong((id *)&v26->_encryptionManager, a10);
    objc_storeStrong((id *)&v26->_factory, a11);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v31 = objc_claimAutoreleasedReturnValue();
    operations = v26->_operations;
    v26->_operations = (NSMutableArray *)v31;

  }
  return v26;
}

- (id)createClip
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraClipUploader *v17;
  SEL v18;
  id v19;
  id v20;

  -[HMDCameraClipUploader workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraClipUploader didCreateClipFuture](self, "didCreateClipFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v17 = (HMDCameraClipUploader *)_HMFPreconditionFailure();
    return -[HMDCameraClipUploader addNotificationForSignificantEvent:homePresenceByPairingIdentity:](v17, v18, v19, v20);
  }
  else
  {
    -[HMDCameraClipUploader factory](self, "factory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader clipUUID](self, "clipUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader localZone](self, "localZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader targetFragmentDuration](self, "targetFragmentDuration");
    v9 = v8;
    -[HMDCameraClipUploader startDate](self, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDCameraClipUploader quality](self, "quality");
    -[HMDCameraClipUploader encryptionManager](self, "encryptionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createCreateClipOperationForClipModelID:localZone:targetFragmentDuration:clipStartDate:quality:encryptionManager:", v6, v7, v10, v11, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraClipUploader _addOperation:finalizeClipOnError:](self, "_addOperation:finalizeClipOnError:", v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader setDidCreateClipFuture:](self, "setDidCreateClipFuture:", v14);

    -[HMDCameraClipUploader didCreateClipFuture](self, "didCreateClipFuture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
}

- (id)addNotificationForSignificantEvent:(id)a3 homePresenceByPairingIdentity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id from;
  _QWORD v29[5];
  id v30;
  id v31;
  id location;

  v6 = a3;
  v7 = a4;
  -[HMDCameraClipUploader workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCameraClipUploader didCreateClipFuture](self, "didCreateClipFuture");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (id)v9;
    -[HMDCameraClipUploader factory](self, "factory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader clipUUID](self, "clipUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader localZone](self, "localZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createAddSignificantEventOperationForClipModelID:localZone:significantEvent:homePresenceByPairingIdentity:", v12, v13, v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(MEMORY[0x24BE6B608]);
    objc_initWeak(&location, v14);
    v16 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __90__HMDCameraClipUploader_addNotificationForSignificantEvent_homePresenceByPairingIdentity___block_invoke;
    v29[3] = &unk_24E7965D0;
    v29[4] = self;
    objc_copyWeak(&v31, &location);
    v17 = v15;
    v30 = v17;
    objc_msgSend(v14, "setCompletionBlock:", v29);
    objc_initWeak(&from, self);
    -[HMDCameraClipUploader didCreateClipFuture](self, "didCreateClipFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __90__HMDCameraClipUploader_addNotificationForSignificantEvent_homePresenceByPairingIdentity___block_invoke_3;
    v25[3] = &unk_24E795078;
    objc_copyWeak(&v27, &from);
    v19 = v14;
    v26 = v19;
    v20 = (id)objc_msgSend(v18, "addSuccessBlock:", v25);

    v21 = v26;
    v22 = v17;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&from);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
  else
  {
    -[HMDCameraClipUploader _createClipWithSignificantEvent:homePresenceByPairingIdentity:](self, "_createClipWithSignificantEvent:homePresenceByPairingIdentity:", v6, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader setDidCreateClipFuture:](self, "setDidCreateClipFuture:", v23);
    v10 = v23;
    v22 = v10;
  }

  return v22;
}

- (id)addVideoInitData:(id)a3
{
  id v4;
  NSObject *v5;
  HMDCameraClipSegmentMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCameraClipUploader *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraClipUploader workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDCameraClipUploader hasAddedCreateClipOperation](self, "hasAddedCreateClipOperation"))
  {
    v6 = objc_alloc_init(HMDCameraClipSegmentMetadata);
    -[HMDCameraClipSegmentMetadata setType:](v6, "setType:", 0);
    -[HMDCameraClipUploader factory](self, "factory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader clipUUID](self, "clipUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader localZone](self, "localZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader encryptionManager](self, "encryptionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createUploadVideoSegmentOperationForModelID:localZone:data:metadata:encryptionManager:", v8, v9, v4, v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraClipUploader _addOperation:finalizeClipOnError:](self, "_addOperation:finalizeClipOnError:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Asked to add video init data before clip has been created", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v17 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v6 = (HMDCameraClipSegmentMetadata *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithError:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)addVideoSegmentData:(id)a3 duration:(double)a4 timeOffsetWithinClip:(double)a5 clipFinalizedBecauseMaxDurationExceeded:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  NSObject *v11;
  HMDCameraClipSegmentMetadata *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDCameraClipUploader *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  uint64_t v29;

  v6 = a6;
  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  -[HMDCameraClipUploader workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (-[HMDCameraClipUploader hasAddedCreateClipOperation](self, "hasAddedCreateClipOperation"))
  {
    v12 = objc_alloc_init(HMDCameraClipSegmentMetadata);
    -[HMDCameraClipSegmentMetadata setType:](v12, "setType:", 1);
    -[HMDCameraClipSegmentMetadata setDuration:](v12, "setDuration:", a4);
    -[HMDCameraClipSegmentMetadata setTimeOffset:](v12, "setTimeOffset:", a5);
    -[HMDCameraClipUploader factory](self, "factory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader clipUUID](self, "clipUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader localZone](self, "localZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipUploader encryptionManager](self, "encryptionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createUploadVideoSegmentOperationForModelID:localZone:data:metadata:encryptionManager:", v14, v15, v10, v12, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "uploadOperationEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDidCausePreviousClipToFinalizeDueToDurationLimit:", v6);

    -[HMDCameraClipUploader _addOperation:finalizeClipOnError:](self, "_addOperation:finalizeClipOnError:", v17, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Asked to add video segment before clip has been created", (uint8_t *)&v27, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    v24 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "futureWithError:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

- (id)finish
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HMDCameraClipUploader workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraClipUploader factory](self, "factory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipUploader clipUUID](self, "clipUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipUploader localZone](self, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createFinalizeClipOperationForModelID:localZone:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraClipUploader _addOperation:finalizeClipOnError:](self, "_addOperation:finalizeClipOnError:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)hasAddedCreateClipOperation
{
  void *v2;
  BOOL v3;

  -[HMDCameraClipUploader didCreateClipFuture](self, "didCreateClipFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_createClip
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;

  -[HMDCameraClipUploader workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraClipUploader factory](self, "factory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipUploader clipUUID](self, "clipUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipUploader localZone](self, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipUploader targetFragmentDuration](self, "targetFragmentDuration");
  v8 = v7;
  -[HMDCameraClipUploader startDate](self, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDCameraClipUploader quality](self, "quality");
  -[HMDCameraClipUploader encryptionManager](self, "encryptionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createCreateClipOperationForClipModelID:localZone:targetFragmentDuration:clipStartDate:quality:encryptionManager:", v5, v6, v9, v10, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraClipUploader _addOperation:finalizeClipOnError:](self, "_addOperation:finalizeClipOnError:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_createClipWithSignificantEvent:(id)a3 homePresenceByPairingIdentity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  -[HMDCameraClipUploader workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCameraClipUploader factory](self, "factory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipUploader clipUUID](self, "clipUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipUploader localZone](self, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipUploader targetFragmentDuration](self, "targetFragmentDuration");
  v13 = v12;
  -[HMDCameraClipUploader startDate](self, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDCameraClipUploader quality](self, "quality");
  -[HMDCameraClipUploader encryptionManager](self, "encryptionManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createCreateClipWithSignificantEventOperationForClipModelID:localZone:significantEvent:homePresenceByPairingIdentity:targetFragmentDuration:clipStartDate:quality:encryptionManager:", v10, v11, v7, v6, v14, v15, v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraClipUploader _addOperation:finalizeClipOnError:](self, "_addOperation:finalizeClipOnError:", v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_addOperation:(id)a3 finalizeClipOnError:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  HMDCameraClipUploader *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  BOOL v23;
  id location;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDCameraClipUploader workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = objc_alloc_init(MEMORY[0x24BE6B608]);
  objc_initWeak(&location, v6);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __59__HMDCameraClipUploader__addOperation_finalizeClipOnError___block_invoke;
  v20[3] = &unk_24E793DE0;
  v20[4] = self;
  objc_copyWeak(&v22, &location);
  v23 = a4;
  v9 = v8;
  v21 = v9;
  v10 = (void *)MEMORY[0x227676638](objc_msgSend(v6, "setCompletionBlock:", v20));
  v11 = self;
  HMFGetOSLogHandle();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v13;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Adding operation to queue: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDCameraClipUploader operations](v11, "operations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v6);

  -[HMDCameraClipUploader operations](v11, "operations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count") == 1;

  if (v16)
    -[HMDCameraClipUploader _startNextOperation](v11, "_startNextOperation");
  v17 = v21;
  v18 = v9;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v18;
}

- (void)_operationCompleted:(id)a3 finalizeOnError:(BOOL)a4 future:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDCameraClipUploader *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCameraClipUploader *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && v6 && !-[HMDCameraClipUploader _isCancelledError:](self, "_isCancelledError:", v10))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v14;
      v22 = 2114;
      v23 = v8;
      v24 = 2114;
      v25 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Handling fatal error for operation %{public}@: %{public}@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCameraClipUploader _handleFatalOperationFailureDueToError:](v12, "_handleFatalOperationFailureDueToError:", v10);
  }
  -[HMDCameraClipUploader operations](self, "operations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObject:", v8);

  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v19;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Operation completed: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  -[HMDCameraClipUploader _startNextOperation](v17, "_startNextOperation");
  if (v10)
    objc_msgSend(v9, "finishWithError:", v10);
  else
    objc_msgSend(v9, "finishWithNoResult");

}

- (void)_startNextOperation
{
  void *v3;
  void *v4;
  void *v5;
  HMDCameraClipUploader *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraClipUploader operations](self, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting next operation: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "start");
  }

}

- (void)_handleFatalOperationFailureDueToError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraClipUploader workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x24BDD1540];
  if (v4)
  {
    v20 = *MEMORY[0x24BDD1398];
    v21[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("HMDCameraClipUploaderErrorDomain"), 1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMDCameraClipUploaderErrorDomain"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDCameraClipUploader operations](self, "operations", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "cancelWithError:", v8);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[HMDCameraClipUploader delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uploaderDidFailUpload:", self);

}

- (BOOL)_isCancelledError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HMDCameraClipUploaderErrorDomain")))
    v5 = objc_msgSend(v3, "code") == 1;
  else
    v5 = 0;

  return v5;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraClipUploader logIdentifier](self, "logIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Identifier"), v4);
  v18[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraClipUploader clipUUID](self, "clipUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Clip UUID"), v7);
  v18[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraClipUploader startDate](self, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Start Date"), v10);
  v18[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[HMDCameraClipUploader targetFragmentDuration](self, "targetFragmentDuration");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Target Fragment Duration"), v14);
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSUUID)clipUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDCameraClipUploaderDelegate)delegate
{
  return (HMDCameraClipUploaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (double)targetFragmentDuration
{
  return self->_targetFragmentDuration;
}

- (int64_t)quality
{
  return self->_quality;
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (HMCameraClipEncryptionManager)encryptionManager
{
  return (HMCameraClipEncryptionManager *)objc_getProperty(self, a2, 72, 1);
}

- (HMDCameraClipUploaderFactory)factory
{
  return (HMDCameraClipUploaderFactory *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableArray)operations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (NAFuture)didCreateClipFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDidCreateClipFuture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didCreateClipFuture, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clipUUID, 0);
}

void __59__HMDCameraClipUploader__addOperation_finalizeClipOnError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__HMDCameraClipUploader__addOperation_finalizeClipOnError___block_invoke_2;
  v4[3] = &unk_24E793DE0;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v7 = *(_BYTE *)(a1 + 56);
  v5 = v3;
  dispatch_async(v2, v4);

  objc_destroyWeak(&v6);
}

void __59__HMDCameraClipUploader__addOperation_finalizeClipOnError___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_operationCompleted:finalizeOnError:future:", WeakRetained, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

void __90__HMDCameraClipUploader_addNotificationForSignificantEvent_homePresenceByPairingIdentity___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(a1[4], "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __90__HMDCameraClipUploader_addNotificationForSignificantEvent_homePresenceByPairingIdentity___block_invoke_2;
  v3[3] = &unk_24E7972B0;
  objc_copyWeak(&v5, a1 + 6);
  v4 = a1[5];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __90__HMDCameraClipUploader_addNotificationForSignificantEvent_homePresenceByPairingIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting significant event operation: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "start");

}

void __90__HMDCameraClipUploader_addNotificationForSignificantEvent_homePresenceByPairingIdentity___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "finishWithError:", v2);
  else
    objc_msgSend(v3, "finishWithNoResult");

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_216191 != -1)
    dispatch_once(&logCategory__hmf_once_t7_216191, &__block_literal_global_216192);
  return (id)logCategory__hmf_once_v8_216193;
}

void __36__HMDCameraClipUploader_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_216193;
  logCategory__hmf_once_v8_216193 = v0;

}

@end
