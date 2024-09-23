@implementation HMDCameraStreamSnapshotCapture

- (HMDCameraStreamSnapshotCapture)initWithWorkQueue:(id)a3 videoStreamInterface:(id)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDCameraStreamSnapshotCapture *v15;
  HMDCameraStreamSnapshotCapture *v16;
  uint64_t v17;
  HMDCameraStreamSessionID *streamSessionID;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDCameraStreamSnapshotCapture;
  v15 = -[HMDCameraStreamSnapshotCapture init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a3);
    objc_storeStrong((id *)&v16->_videoStreamInterface, a4);
    objc_storeStrong((id *)&v16->_delegate, a5);
    objc_storeStrong((id *)&v16->_delegateQueue, a6);
    objc_msgSend(v12, "sessionID");
    v17 = objc_claimAutoreleasedReturnValue();
    streamSessionID = v16->_streamSessionID;
    v16->_streamSessionID = (HMDCameraStreamSessionID *)v17;

    v16->_capturingLastFrame = 0;
    v16->_capturingCurrentFrame = 0;
    objc_msgSend(v12, "setSnapshotDelegate:delegateQueue:", v16, v16->_workQueue);
  }

  return v16;
}

- (id)logIdentifier
{
  if (self)
    self = (HMDCameraStreamSnapshotCapture *)self->_streamSessionID;
  return -[HMDCameraStreamSnapshotCapture description](self, "description");
}

- (NSString)description
{
  void *streamSessionID;

  streamSessionID = self;
  if (self)
    streamSessionID = self->_streamSessionID;
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Stream-Snapshot-Capture: %@"), streamSessionID);
}

- (void)captureCurrentFrame
{
  NSObject *workQueue;
  _QWORD block[5];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HMDCameraStreamSnapshotCapture_captureCurrentFrame__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)captureLastFrame
{
  NSObject *workQueue;
  _QWORD block[5];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__HMDCameraStreamSnapshotCapture_captureLastFrame__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)timerDidFire:(id)a3
{
  HMFTimer *v4;
  HMFTimer *lastDecodedFrameTimer;
  void *v6;
  HMDCameraStreamSnapshotCapture *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    lastDecodedFrameTimer = self->_lastDecodedFrameTimer;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    lastDecodedFrameTimer = 0;
  }
  if (lastDecodedFrameTimer == v4)
  {
    -[HMDCameraStreamSnapshotCapture setLastDecodedFrameTimer:]((uint64_t)self);
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Capturing frame has timed out", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDCameraStreamSnapshotCapture _callSnapshotDelegate:]((uint64_t)v7, 0);
  }

}

- (void)videoStream:(id)a3 didGetLastDecodedFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraStreamSnapshotCapture *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraStreamSnapshotCapture setLastDecodedFrameTimer:]((uint64_t)self);
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received last decoded frame", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraStreamSnapshotCapture _callSnapshotDelegate:]((uint64_t)v9, v7);

}

- (HMDVideoStreamInterface)videoStreamInterface
{
  return self->_videoStreamInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDecodedFrameTimer, 0);
  objc_storeStrong((id *)&self->_streamSessionID, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_videoStreamInterface, 0);
}

- (void)setLastDecodedFrameTimer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), 0);
}

- (void)_callSnapshotDelegate:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 8))
    {
      v4 = (void *)MEMORY[0x227676638]();
      v5 = (id)a1;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v23) = 138543362;
        *(_QWORD *)((char *)&v23 + 4) = v7;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Captured the last frame, sending stop stream", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(v5, "videoStreamInterface");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stopStream");

    }
    if (*(_BYTE *)(a1 + 9))
    {
      *(_BYTE *)(a1 + 9) = 0;
      v9 = v3;
      v10 = *(id *)(a1 + 32);
      v11 = (void *)MEMORY[0x227676638]();
      v12 = (id)a1;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v23) = 138543362;
        *(_QWORD *)((char *)&v23 + 4) = v14;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamSnapshotCapture:didGetNewSnapshot", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v15 = v12[5];
        *(_QWORD *)&v23 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v23 + 1) = 3221225472;
        v24 = __57__HMDCameraStreamSnapshotCapture__callDidGetNewSnapshot___block_invoke;
        v25 = &unk_24E79BBD0;
        v26 = v10;
        v27 = v12;
        v28 = v9;
        dispatch_async(v15, &v23);

      }
    }
    if (*(_BYTE *)(a1 + 8))
    {
      *(_BYTE *)(a1 + 8) = 0;
      v16 = v3;
      v17 = *(id *)(a1 + 32);
      v18 = (void *)MEMORY[0x227676638]();
      v19 = (id)a1;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v23) = 138543362;
        *(_QWORD *)((char *)&v23 + 4) = v21;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamSnapshotCapture:didGetLastSnapshot", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v22 = v19[5];
        *(_QWORD *)&v23 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v23 + 1) = 3221225472;
        v24 = __58__HMDCameraStreamSnapshotCapture__callDidGetLastSnapshot___block_invoke;
        v25 = &unk_24E79BBD0;
        v26 = v17;
        v27 = v19;
        v28 = v16;
        dispatch_async(v22, &v23);

      }
    }
  }

}

uint64_t __58__HMDCameraStreamSnapshotCapture__callDidGetLastSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamSnapshotCapture:didGetLastSnapshot:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __57__HMDCameraStreamSnapshotCapture__callDidGetNewSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamSnapshotCapture:didGetNewSnapshot:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __50__HMDCameraStreamSnapshotCapture_captureLastFrame__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    *(_BYTE *)(v2 + 8) = 1;
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Capturing last frame", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraStreamSnapshotCapture _captureFrame](*(id **)(a1 + 32));
}

- (void)_captureFrame
{
  void *v2;
  id *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a1[7])
    {
      v2 = (void *)MEMORY[0x227676638]();
      v3 = a1;
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v5;
        _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@A capture frame is already in progress, not sending another one", (uint8_t *)&v11, 0xCu);

      }
      objc_autoreleasePoolPop(v2);
    }
    else
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 2.0);
      v7 = a1[7];
      a1[7] = (id)v6;

      objc_msgSend(a1[7], "setDelegate:", a1);
      v8 = a1[7];
      v9 = a1[3];
      objc_msgSend(v8, "setDelegateQueue:", v9);

      objc_msgSend(a1, "videoStreamInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "captureSnapshot");

      objc_msgSend(a1[7], "resume");
    }
  }
}

void __53__HMDCameraStreamSnapshotCapture_captureCurrentFrame__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    *(_BYTE *)(v2 + 9) = 1;
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Capturing current frame", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraStreamSnapshotCapture _captureFrame](*(id **)(a1 + 32));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_198441 != -1)
    dispatch_once(&logCategory__hmf_once_t0_198441, &__block_literal_global_198442);
  return (id)logCategory__hmf_once_v1_198443;
}

void __45__HMDCameraStreamSnapshotCapture_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_198443;
  logCategory__hmf_once_v1_198443 = v0;

}

@end
