@implementation HMDVideoStreamInterface

- (HMDVideoStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 delegateQueue:(id)a6 sessionHandler:(id)a7 localNetworkConfig:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HMDVideoStreamReconfigure *v20;
  int v21;
  HMDVideoStreamInterfaceDataSource *v22;
  void *v23;
  HMDVideoStreamInterface *v24;
  void *v25;
  HMDVideoStreamInterface *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDVideoStreamInterface *v30;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  int v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v36 = -1;
  objc_msgSend((id)objc_opt_class(), "_createVideoStreamWithSessionHandler:localNetworkConfig:localRTPSocket:", v17, v18, &v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  if (!isWatch() && cameraStreamNetworkAdaptation)
    v20 = -[HMDVideoStreamReconfigure initWithSessionID:workQueue:delegate:delegateQueue:]([HMDVideoStreamReconfigure alloc], "initWithSessionID:workQueue:delegate:delegateQueue:", v35, v14, self, v14);
  v21 = v36;
  v22 = objc_alloc_init(HMDVideoStreamInterfaceDataSource);
  LODWORD(v32) = v21;
  v34 = v15;
  v23 = v16;
  v24 = -[HMDVideoStreamInterface initWithSessionID:workQueue:delegate:delegateQueue:sessionHandler:videoStream:localRTPSocket:videoStreamReconfigure:dataSource:](self, "initWithSessionID:workQueue:delegate:delegateQueue:sessionHandler:videoStream:localRTPSocket:videoStreamReconfigure:dataSource:", v35, v14, v15, v16, v17, v19, v32, v20, v22);

  if (v19 || v36 != -1)
  {
    v30 = v24;
  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = v24;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = v25;
      v28 = v23;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v29;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video stream interface", buf, 0xCu);

      v23 = v28;
      v25 = v33;
    }

    objc_autoreleasePoolPop(v25);
    v30 = 0;
  }

  return v30;
}

- (HMDVideoStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 delegateQueue:(id)a6 sessionHandler:(id)a7 videoStream:(id)a8 localRTPSocket:(int)a9 videoStreamReconfigure:(id)a10 dataSource:(id)a11
{
  id v17;
  HMDVideoStreamInterface *v18;
  HMDVideoStreamInterface *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v17 = a5;
  v23 = a8;
  v22 = a10;
  v21 = a11;
  v24.receiver = self;
  v24.super_class = (Class)HMDVideoStreamInterface;
  v18 = -[HMDStreamInterface initWithSessionID:workQueue:delegateQueue:sessionHandler:localRTPSocket:](&v24, sel_initWithSessionID_workQueue_delegateQueue_sessionHandler_localRTPSocket_, a3, a4, a6, a7, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_delegate, v17);
    objc_storeStrong((id *)&v19->_videoStream, a8);
    -[HMDAVCVideoStream setDelegate:](v19->_videoStream, "setDelegate:", v19);
    objc_storeStrong((id *)&v19->_videoStreamReconfigure, a10);
    objc_storeStrong((id *)&v19->_dataSource, a11);
  }

  return v19;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDStreamInterface sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  void *v3;
  HMDVideoStreamInterface *v4;
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMDVideoStreamInterface object", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDVideoStreamInterface;
  -[HMDStreamInterface dealloc](&v7, sel_dealloc);
}

- (NSNumber)syncSource
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDVideoStreamInterface videoStream](self, "videoStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFDA58]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)streamToken
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[HMDVideoStreamInterface videoStream](self, "videoStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "streamToken"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)startStreamWithConfig:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__HMDVideoStreamInterface_startStreamWithConfig___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_startStreamWithConfig:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  HMDVideoStreamInterface *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDStreamInterface loadMiscFields:](self, "loadMiscFields:", v4);
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v19;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Failed to load misc fields to video config", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1016);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (v9)
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Configuring video stream with configuration: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDVideoStreamInterface videoStream](v7, "videoStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v12 = objc_msgSend(v11, "configure:error:", v4, &v21);
  v13 = v21;

  v14 = (void *)MEMORY[0x227676638]();
  v7 = v7;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure video stream: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
LABEL_14:
    -[HMDVideoStreamInterface _callStarted:](v7, "_callStarted:", v13);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v17;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Starting video stream", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDVideoStreamInterface videoStream](v7, "videoStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "start");

LABEL_15:
}

- (void)updateReconfigurationMode:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDStreamInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__HMDVideoStreamInterface_updateReconfigurationMode___block_invoke;
  v6[3] = &unk_24E7968C8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)updateStreamConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HMDVideoStreamInterface_updateStreamConfiguration___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)stopStream
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDStreamInterface workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HMDVideoStreamInterface_stopStream__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setSnapshotDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__HMDVideoStreamInterface_setSnapshotDelegate_delegateQueue___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)captureSnapshot
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDStreamInterface workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HMDVideoStreamInterface_captureSnapshot__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_callStarted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDVideoStreamInterface *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  HMDVideoStreamInterface *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDVideoStreamInterface delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStream:didStart", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDStreamInterface delegateQueue](v8, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__HMDVideoStreamInterface__callStarted___block_invoke;
    block[3] = &unk_24E79BBD0;
    v13 = v6;
    v14 = v8;
    v15 = v4;
    dispatch_async(v11, block);

  }
  -[HMDStreamInterface setState:](v8, "setState:", 2);

}

- (void)_callStopped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDVideoStreamInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  HMDVideoStreamInterface *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638](-[HMDStreamInterface setState:](self, "setState:", 3));
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStream:didStop", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDVideoStreamInterface delegate](v7, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDStreamInterface delegateQueue](v7, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__HMDVideoStreamInterface__callStopped___block_invoke;
    block[3] = &unk_24E79BBD0;
    v13 = v10;
    v14 = v7;
    v15 = v4;
    dispatch_async(v11, block);

  }
}

- (void)_callNetworkImproved
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDVideoStreamInterface *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  HMDVideoStreamInterface *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDStreamInterface workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDVideoStreamInterface delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStreamDidNetworkImprove", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDStreamInterface delegateQueue](v6, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__HMDVideoStreamInterface__callNetworkImproved__block_invoke;
    v10[3] = &unk_24E79C268;
    v11 = v4;
    v12 = v6;
    dispatch_async(v9, v10);

  }
}

- (void)_callNetworkDeteriorated
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDVideoStreamInterface *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  HMDVideoStreamInterface *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDStreamInterface workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDVideoStreamInterface delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStreamDidNetworkDeteriorate", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDStreamInterface delegateQueue](v6, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__HMDVideoStreamInterface__callNetworkDeteriorated__block_invoke;
    v10[3] = &unk_24E79C268;
    v11 = v4;
    v12 = v6;
    dispatch_async(v9, v10);

  }
}

- (void)_callDidUpdateConfiguration
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDVideoStreamInterface *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  HMDVideoStreamInterface *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDStreamInterface workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDVideoStreamInterface delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStreamDidUpdateConfiguration", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDStreamInterface delegateQueue](v6, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__HMDVideoStreamInterface__callDidUpdateConfiguration__block_invoke;
    v10[3] = &unk_24E79C268;
    v11 = v4;
    v12 = v6;
    dispatch_async(v9, v10);

  }
}

- (void)_callDidGetLastDecodedFrame:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDVideoStreamInterface *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  HMDVideoResolution *v15;
  uint64_t v16;
  HMDVideoResolution *v17;
  HMDCameraSnapshotData *v18;
  void *v19;
  HMDCameraSnapshotData *v20;
  NSObject *v21;
  _QWORD block[4];
  id v23;
  HMDVideoStreamInterface *v24;
  HMDCameraSnapshotData *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDVideoStreamInterface lastFrameDelegate](self, "lastFrameDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStream:didGetLastDecodedFrame:", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDVideoStreamInterface videoStream](v8, "videoStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "video");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "videoResolution");

  v15 = [HMDVideoResolution alloc];
  if (v14 < 0xA)
    v16 = v14 + 1;
  else
    v16 = -1;
  v17 = -[HMDVideoResolution initWithResolution:](v15, "initWithResolution:", v16);
  v18 = [HMDCameraSnapshotData alloc];
  -[HMDVideoStreamInterface snapshotDataTransaction](v8, "snapshotDataTransaction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HMDCameraSnapshotData initWithSnapshotData:videoResolution:snapshotDataTrasaction:](v18, "initWithSnapshotData:videoResolution:snapshotDataTrasaction:", v4, v17, v19);

  -[HMDVideoStreamInterface setSnapshotDataTransaction:](v8, "setSnapshotDataTransaction:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDStreamInterface delegateQueue](v8, "delegateQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__HMDVideoStreamInterface__callDidGetLastDecodedFrame___block_invoke;
    block[3] = &unk_24E79BBD0;
    v23 = v6;
    v24 = v8;
    v25 = v20;
    dispatch_async(v21, block);

  }
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v7 = a5;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__HMDVideoStreamInterface_stream_didStart_error___block_invoke;
  block[3] = &unk_24E799CF0;
  v12 = a4;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)stream:(id)a3 didUpdateVideoConfiguration:(BOOL)a4 error:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v7 = a5;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDVideoStreamInterface_stream_didUpdateVideoConfiguration_error___block_invoke;
  block[3] = &unk_24E799CF0;
  v12 = a4;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)stream:(id)a3 downlinkQualityDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__HMDVideoStreamInterface_stream_downlinkQualityDidChange___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)stream:(id)a3 didGetLastDecodedFrame:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__HMDVideoStreamInterface_stream_didGetLastDecodedFrame___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)streamDidStop:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDStreamInterface workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__HMDVideoStreamInterface_streamDidStop___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)streamDidServerDie:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDStreamInterface workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HMDVideoStreamInterface_streamDidServerDie___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)streamDidRTPTimeOut:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDStreamInterface workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HMDVideoStreamInterface_streamDidRTPTimeOut___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)streamDidRTCPTimeOut:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDStreamInterface workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HMDVideoStreamInterface_streamDidRTCPTimeOut___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (HMDVideoStreamInterfaceDelegate)delegate
{
  return (HMDVideoStreamInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDAVCVideoStream)videoStream
{
  return (HMDAVCVideoStream *)objc_getProperty(self, a2, 72, 1);
}

- (HMDVideoStreamReconfigure)videoStreamReconfigure
{
  return (HMDVideoStreamReconfigure *)objc_getProperty(self, a2, 80, 1);
}

- (HMDVideoStreamInterfaceDataSource)dataSource
{
  return (HMDVideoStreamInterfaceDataSource *)objc_getProperty(self, a2, 88, 1);
}

- (OS_dispatch_queue)lastFrameDelegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastFrameDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (HMDVideoStreamLastDecodedFrameDelegate)lastFrameDelegate
{
  return (HMDVideoStreamLastDecodedFrameDelegate *)objc_loadWeakRetained((id *)&self->_lastFrameDelegate);
}

- (void)setLastFrameDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_lastFrameDelegate, a3);
}

- (HMFOSTransaction)snapshotDataTransaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSnapshotDataTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotDataTransaction, 0);
  objc_destroyWeak((id *)&self->_lastFrameDelegate);
  objc_storeStrong((id *)&self->_lastFrameDelegateQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_videoStreamReconfigure, 0);
  objc_storeStrong((id *)&self->_videoStream, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __48__HMDVideoStreamInterface_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Video stream RTCP has timed out", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1013);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_callStopped:", v7);

}

void __47__HMDVideoStreamInterface_streamDidRTPTimeOut___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Video stream RTP has timed out", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1012);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_callStopped:", v7);

}

void __46__HMDVideoStreamInterface_streamDidServerDie___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Video stream server died", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1014);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_callStopped:", v7);

}

uint64_t __41__HMDVideoStreamInterface_streamDidStop___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@streamDidStop", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_callStopped:", 0);
}

uint64_t __57__HMDVideoStreamInterface_stream_didGetLastDecodedFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callDidGetLastDecodedFrame:", *(_QWORD *)(a1 + 40));
}

void __59__HMDVideoStreamInterface_stream_downlinkQualityDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "videoStreamReconfigure");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downlinkQualityChanged:", *(_QWORD *)(a1 + 40));

}

uint64_t __68__HMDVideoStreamInterface_stream_didUpdateVideoConfiguration_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Video stream did update video configuration: %@ error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_callDidUpdateConfiguration");
}

uint64_t __49__HMDVideoStreamInterface_stream_didStart_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Video stream did start: %@ error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_callStarted:", *(_QWORD *)(a1 + 40));
}

uint64_t __55__HMDVideoStreamInterface__callDidGetLastDecodedFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "videoStream:didGetLastDecodedFrame:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __54__HMDVideoStreamInterface__callDidUpdateConfiguration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "videoStreamDidUpdateConfiguration:", *(_QWORD *)(a1 + 40));
}

uint64_t __51__HMDVideoStreamInterface__callNetworkDeteriorated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "videoStreamDidNetworkDeteriorate:", *(_QWORD *)(a1 + 40));
}

uint64_t __47__HMDVideoStreamInterface__callNetworkImproved__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "videoStreamDidNetworkImprove:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__HMDVideoStreamInterface__callStopped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "videoStream:didStop:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __40__HMDVideoStreamInterface__callStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "videoStream:didStart:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __42__HMDVideoStreamInterface_captureSnapshot__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F200]), "initWithName:", CFSTR("com.apple.homed.snapshot-last-decoded-frame"));
  objc_msgSend(*(id *)(a1 + 32), "setSnapshotDataTransaction:", v2);

  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Requesting last decoded frame", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "videoStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestLastDecodedFrame");

}

uint64_t __61__HMDVideoStreamInterface_setSnapshotDelegate_delegateQueue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLastFrameDelegate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setLastFrameDelegateQueue:", *(_QWORD *)(a1 + 48));
}

void __37__HMDVideoStreamInterface_stopStream__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping video stream", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "videoStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stop");

}

void __53__HMDVideoStreamInterface_updateStreamConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "video");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating video stream with video configuration: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "videoStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "video");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateVideoConfiguration:", v8);

}

void __53__HMDVideoStreamInterface_updateReconfigurationMode___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "videoStreamReconfigure");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateReconfigurationMode:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __49__HMDVideoStreamInterface_startStreamWithConfig___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startStreamWithConfig:", *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_21778 != -1)
    dispatch_once(&logCategory__hmf_once_t1_21778, &__block_literal_global_21779);
  return (id)logCategory__hmf_once_v2_21780;
}

+ (id)_createVideoStreamWithSessionHandler:(id)a3 localNetworkConfig:(id)a4 localRTPSocket:(int *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = a1;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543362;
    v27 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating the video stream", (uint8_t *)&v26, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  v14 = v8;
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_2557B76C0))
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    v17 = objc_msgSend(v11, "_createLocalRTPSocketWithRemoteSender:localNetworkConfig:", v16, v9);
    v18 = 0;
    *a5 = v17;
  }
  else
  {
    v19 = v14;
    if (objc_msgSend(v19, "conformsToProtocol:", &unk_25586BA68))
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    if (v21)
    {
      objc_msgSend(v11, "_createStreamWithRemoteDestinationReceiver:", v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = v19;
      if (objc_msgSend(v22, "conformsToProtocol:", &unk_2557BCEA0))
        v23 = v22;
      else
        v23 = 0;
      v24 = v23;

      if (v24)
        objc_msgSend(v11, "_createStreamWithRemoteSocketReceiver:", v24);
      else
        objc_msgSend(v11, "_createLocalStreamAndRTPSocket:localNetworkConfig:", a5, v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v18;
}

+ (id)_createStreamWithRemoteDestinationReceiver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteDestination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating video stream with destination: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = objc_alloc(MEMORY[0x24BDFDA40]);
  objc_msgSend(v4, "remoteDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v12 = (void *)objc_msgSend(v10, "initWithIDSDestination:callID:error:", v11, 0, &v20);
  v13 = v20;

  if (v12)
  {
    v14 = v12;
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v18;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remote destination receiver AVCVideoStream: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

  return v12;
}

+ (id)_createStreamWithRemoteSocketReceiver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 1024;
    LODWORD(v22) = objc_msgSend(v4, "remoteVideoSocket");
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating video stream with socket %d", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_fd(v9, (const char *)*MEMORY[0x24BDFDA60], objc_msgSend(v4, "remoteVideoSocket"));
  v18 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFDA40]), "initWithNetworkSockets:callID:error:", v9, 0, &v18);
  v11 = v18;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remote socket receiver AVCVideoStream: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

  return v10;
}

+ (int)_createLocalRTPSocketWithRemoteSender:(id)a3 localNetworkConfig:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "openSocketWithNetworkConfig:", v7);
  if (v8 == -1)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rtpPort");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *__error();
      v17 = 138543874;
      v18 = v12;
      v19 = 2112;
      v20 = v14;
      v21 = 1024;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Could not create rtp socket with port %@ %d", (uint8_t *)&v17, 0x1Cu);

    }
    objc_autoreleasePoolPop(v9);
  }

  return v8;
}

+ (id)_createLocalStreamAndRTPSocket:(int *)a3 localNetworkConfig:(id)a4
{
  id v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  xpc_object_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(a1, "openSocketWithNetworkConfig:", v6);
  v8 = (void *)MEMORY[0x227676638]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7 == -1)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rtpPort");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *__error();
      *(_DWORD *)buf = 138543874;
      v28 = v17;
      v29 = 2112;
      v30 = v19;
      v31 = 1024;
      v32 = v20;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Could not create rtp socket with port %@ %d", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v8);
    v14 = 0;
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      v29 = 1024;
      LODWORD(v30) = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating local video stream with socket %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v8);
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_fd(v13, (const char *)*MEMORY[0x24BDFDA60], v7);
    v26 = 0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFDA40]), "initWithNetworkSockets:callID:error:", v13, 0, &v26);
    v15 = v26;
    if (v14)
    {
      *a3 = v7;
      v16 = v14;
    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = v9;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v24;
        v29 = 2112;
        v30 = v15;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to create local AVCVideoStream: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      close(v7);
    }

  }
  return v14;
}

void __38__HMDVideoStreamInterface_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_21780;
  logCategory__hmf_once_v2_21780 = v0;

}

@end
