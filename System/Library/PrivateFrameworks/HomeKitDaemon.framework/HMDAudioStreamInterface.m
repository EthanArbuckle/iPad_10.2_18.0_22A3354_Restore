@implementation HMDAudioStreamInterface

- (HMDAudioStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 delegateQueue:(id)a6 sessionHandler:(id)a7 localNetworkConfig:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  HMDAudioStreamInterface *v23;
  NSObject *v24;
  void *v25;
  HMDAudioStreamInterface *v26;
  HMDAudioStreamInterfaceDataSource *v27;
  uint64_t v29;
  void *v30;
  int v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v31 = -1;
  objc_msgSend((id)objc_opt_class(), "_createAudioStreamWithSessionHandler:localNetworkConfig:localRTPSocket:", v18, v19, &v31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v31;
  if (v20 || v31 != -1)
  {
    v27 = objc_alloc_init(HMDAudioStreamInterfaceDataSource);
    LODWORD(v29) = v21;
    v23 = -[HMDAudioStreamInterface initWithSessionID:workQueue:delegate:delegateQueue:sessionHandler:audioStream:localRTPSocket:dataSource:](self, "initWithSessionID:workQueue:delegate:delegateQueue:sessionHandler:audioStream:localRTPSocket:dataSource:", v14, v15, v16, v17, v18, v20, v29, v27);

    v26 = v23;
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = v22;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audio stream interface", buf, 0xCu);

      v22 = v30;
    }

    objc_autoreleasePoolPop(v22);
    v26 = 0;
  }

  return v26;
}

- (HMDAudioStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 delegateQueue:(id)a6 sessionHandler:(id)a7 audioStream:(id)a8 localRTPSocket:(int)a9 dataSource:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HMDAudioStreamInterface *v22;
  HMDAudioStreamInterface *v23;
  HMDAudioStreamInterface *result;
  HMDAudioStreamInterface *v25;
  SEL v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  if (!v20 && a9 < 0)
  {
    v25 = (HMDAudioStreamInterface *)_HMFPreconditionFailure();
    -[HMDAudioStreamInterface dealloc](v25, v26);
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)HMDAudioStreamInterface;
    v22 = -[HMDStreamInterface initWithSessionID:workQueue:delegateQueue:sessionHandler:localRTPSocket:](&v28, sel_initWithSessionID_workQueue_delegateQueue_sessionHandler_localRTPSocket_, v27, v16, v18, v19, a9);
    v23 = v22;
    if (v22)
    {
      objc_storeWeak((id *)&v22->_delegate, v17);
      v23->_streamStarted = 0;
      v23->_audioStreamSetting = 1;
      objc_storeStrong((id *)&v23->_audioStream, a8);
      -[HMDAVCAudioStream setDelegate:](v23->_audioStream, "setDelegate:", v23);
      objc_storeStrong((id *)&v23->_dataSource, a10);
    }

    return v23;
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  HMDAudioStreamInterface *v4;
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMDAudioStreamInterface object", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDAudioStreamInterface;
  -[HMDStreamInterface dealloc](&v7, sel_dealloc);
}

- (NSNumber)syncSource
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAudioStreamInterface audioStream](self, "audioStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFDA58]);
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
  v7[2] = __49__HMDAudioStreamInterface_startStreamWithConfig___block_invoke;
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
  HMDAudioStreamInterface *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  HMDAudioStreamInterface *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
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
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v18;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Failed to load misc fields to audio config", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1016);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v9)
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v10;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Configuring audio stream with configuration: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAudioStreamInterface audioStream](v7, "audioStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v12 = objc_msgSend(v11, "configure:error:", v4, &v19);
  v13 = v19;

  if ((v12 & 1) == 0)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure audio stream: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
LABEL_11:
    -[HMDAudioStreamInterface _callStarted:](v7, "_callStarted:", v13);
  }

}

- (void)updateAudioSetting:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDStreamInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__HMDAudioStreamInterface_updateAudioSetting___block_invoke;
  v6[3] = &unk_24E797C10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_updateAudioSetting:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  HMDAudioStreamInterface *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMDAudioStreamInterface *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAudioStreamInterface *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a3 - 1 >= 3)
  {
    v13 = MEMORY[0x227676638](self, a2);
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v16;
      v24 = 2048;
      v25 = a3;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalid audio stream setting %tu", (uint8_t *)&v22, 0x16u);

    }
    v12 = (void *)v13;
    goto LABEL_9;
  }
  v5 = -[HMDAudioStreamInterface audioStreamSetting](self, "audioStreamSetting");
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5 == a3)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAudioStreamInterface audioStreamSetting](v7, "audioStreamSetting");
      HMCameraAudioStreamSettingAsString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v10;
      v24 = 2112;
      v25 = (unint64_t)v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Audio stream setting is already set to %@", (uint8_t *)&v22, 0x16u);

    }
    v12 = v6;
LABEL_9:
    objc_autoreleasePoolPop(v12);
    return;
  }
  if (v9)
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAudioStreamInterface audioStreamSetting](v7, "audioStreamSetting");
    HMCameraAudioStreamSettingAsString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMCameraAudioStreamSettingAsString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543874;
    v23 = v17;
    v24 = 2112;
    v25 = (unint64_t)v18;
    v26 = 2112;
    v27 = v19;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Changing the audio stream setting from %@ to %@", (uint8_t *)&v22, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAudioStreamInterface setAudioStreamSetting:](v7, "setAudioStreamSetting:", a3);
  switch(a3)
  {
    case 3uLL:
      v20 = v7;
      v21 = 0;
LABEL_19:
      -[HMDAudioStreamInterface setMuted:](v20, "setMuted:", v21);
      -[HMDAudioStreamInterface _resumeStream](v7, "_resumeStream");
      return;
    case 2uLL:
      v20 = v7;
      v21 = 1;
      goto LABEL_19;
    case 1uLL:
      -[HMDAudioStreamInterface _pauseStream](v7, "_pauseStream");
      break;
  }
}

- (void)updateAudioVolume:(id)a3 callback:(id)a4
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
  block[2] = __54__HMDAudioStreamInterface_updateAudioVolume_callback___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)stopStream
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDStreamInterface workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HMDAudioStreamInterface_stopStream__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_stopStreamWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  HMDAudioStreamInterface *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDAudioStreamInterface *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDStreamInterface state](self, "state") == 3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Not stopping stream because it has already stopped", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v4[2](v4);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638](-[HMDAudioStreamInterface setStopStreamCompletionHandler:](self, "setStopStreamCompletionHandler:", v4));
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Stopping audio stream", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDAudioStreamInterface audioStream](v11, "audioStream");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stop");

  }
}

- (void)_pauseStream
{
  void *v3;
  HMDAudioStreamInterface *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
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
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Pausing audio stream", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAudioStreamInterface audioStream](v4, "audioStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pause");

}

- (void)_resumeStream
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAudioStreamInterface *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDAudioStreamInterface dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDAudioStreamInterface isMuted](self, "isMuted");
  -[HMDStreamInterface sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostProcessBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAudioSessionPropertiesWithShouldAllowSystemSounds:hostProcessBundleIdentifier:", v4, v6);

  LODWORD(v5) = -[HMDAudioStreamInterface streamStarted](self, "streamStarted");
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if ((_DWORD)v5)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Resuming audio stream", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAudioStreamInterface audioStream](v8, "audioStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resume");
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting audio stream", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAudioStreamInterface setStreamStarted:](v8, "setStreamStarted:", 1);
    -[HMDAudioStreamInterface audioStream](v8, "audioStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "start");
  }

}

- (void)startSynchronizationWithVideoStreamToken:(int64_t)a3
{
  void *v5;
  HMDAudioStreamInterface *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting synchronization with video stream token: %ld", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAudioStreamInterface audioStream](v6, "audioStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startSynchronizeWithStream:", a3);

}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HMDAudioStreamInterface *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting audio muted to %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAudioStreamInterface dataSource](v6, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMuted:", v3);

  if (v3)
    v11 = 2;
  else
    v11 = 3;
  -[HMDAudioStreamInterface audioStream](v6, "audioStream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDirection:", v11);

}

- (BOOL)isMuted
{
  void *v2;
  char v3;

  -[HMDAudioStreamInterface dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMuted");

  return v3;
}

- (void)_callStarted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDAudioStreamInterface *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  HMDAudioStreamInterface *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAudioStreamInterface delegate](self, "delegate");
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
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling delegate audioStream:didStart", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDStreamInterface delegateQueue](v8, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__HMDAudioStreamInterface__callStarted___block_invoke;
    block[3] = &unk_24E79BBD0;
    v13 = v6;
    v14 = v8;
    v15 = v4;
    dispatch_async(v11, block);

  }
  -[HMDStreamInterface setState:](v8, "setState:", 2);
  -[HMDAudioStreamInterface startPHASEEngineAndController](v8, "startPHASEEngineAndController");

}

- (void)_callPaused:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDAudioStreamInterface *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  HMDAudioStreamInterface *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAudioStreamInterface delegate](self, "delegate");
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
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling delegate audioStream:didPause", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDStreamInterface delegateQueue](v8, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__HMDAudioStreamInterface__callPaused___block_invoke;
    block[3] = &unk_24E79BBD0;
    v13 = v6;
    v14 = v8;
    v15 = v4;
    dispatch_async(v11, block);

  }
}

- (void)_callResumed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDAudioStreamInterface *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  HMDAudioStreamInterface *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAudioStreamInterface delegate](self, "delegate");
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
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling delegate audioStream:didResume", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDStreamInterface delegateQueue](v8, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__HMDAudioStreamInterface__callResumed___block_invoke;
    block[3] = &unk_24E79BBD0;
    v13 = v6;
    v14 = v8;
    v15 = v4;
    dispatch_async(v11, block);

  }
}

- (void)_callStopped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDAudioStreamInterface *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void (**v12)(_QWORD);
  _QWORD block[4];
  id v14;
  HMDAudioStreamInterface *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDStreamInterface workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAudioStreamInterface delegate](self, "delegate");
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
    v18 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling delegate audioStream:didStop", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDStreamInterface delegateQueue](v8, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__HMDAudioStreamInterface__callStopped___block_invoke;
    block[3] = &unk_24E79BBD0;
    v14 = v6;
    v15 = v8;
    v16 = v4;
    dispatch_async(v11, block);

  }
  -[HMDStreamInterface setState:](v8, "setState:", 3);
  -[HMDAudioStreamInterface setMuted:](v8, "setMuted:", 0);
  -[HMDAudioStreamInterface stopStreamCompletionHandler](v8, "stopStreamCompletionHandler");
  v12 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HMDAudioStreamInterface setStopStreamCompletionHandler:](v8, "setStopStreamCompletionHandler:", 0);
    v12[2](v12);
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
  block[2] = __49__HMDAudioStreamInterface_stream_didStart_error___block_invoke;
  block[3] = &unk_24E799CF0;
  v12 = a4;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)streamDidStop:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDStreamInterface workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__HMDAudioStreamInterface_streamDidStop___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5
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
  block[2] = __49__HMDAudioStreamInterface_stream_didPause_error___block_invoke;
  block[3] = &unk_24E799CF0;
  v12 = a4;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)stream:(id)a3 didResume:(BOOL)a4 error:(id)a5
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
  block[2] = __50__HMDAudioStreamInterface_stream_didResume_error___block_invoke;
  block[3] = &unk_24E799CF0;
  v12 = a4;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)streamDidServerDie:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDStreamInterface workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HMDAudioStreamInterface_streamDidServerDie___block_invoke;
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
  block[2] = __47__HMDAudioStreamInterface_streamDidRTPTimeOut___block_invoke;
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
  block[2] = __48__HMDAudioStreamInterface_streamDidRTCPTimeOut___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

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

- (HMDAudioStreamInterfaceDelegate)delegate
{
  return (HMDAudioStreamInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)streamStarted
{
  return self->_streamStarted;
}

- (void)setStreamStarted:(BOOL)a3
{
  self->_streamStarted = a3;
}

- (unint64_t)audioStreamSetting
{
  return self->_audioStreamSetting;
}

- (void)setAudioStreamSetting:(unint64_t)a3
{
  self->_audioStreamSetting = a3;
}

- (HMDAVCAudioStream)audioStream
{
  return (HMDAVCAudioStream *)objc_getProperty(self, a2, 88, 1);
}

- (HMDAudioStreamInterfaceDataSource)dataSource
{
  return (HMDAudioStreamInterfaceDataSource *)objc_getProperty(self, a2, 96, 1);
}

- (id)stopStreamCompletionHandler
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setStopStreamCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopStreamCompletionHandler, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __48__HMDAudioStreamInterface_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream RTCP has timed out", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
}

void __47__HMDAudioStreamInterface_streamDidRTPTimeOut___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream RTP has timed out", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
}

void __46__HMDAudioStreamInterface_streamDidServerDie___block_invoke(uint64_t a1)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream server died", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1014);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_callStopped:", v7);

}

uint64_t __50__HMDAudioStreamInterface_stream_didResume_error___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream resumed with didResume: %@ error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_callResumed:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__HMDAudioStreamInterface_stream_didPause_error___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream paused with didPause: %@ error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_callPaused:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__HMDAudioStreamInterface_streamDidStop___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream stopped", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_callStopped:", 0);
}

uint64_t __49__HMDAudioStreamInterface_stream_didStart_error___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream started with didStart: %@ error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_callStarted:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__HMDAudioStreamInterface__callStopped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "audioStream:didStop:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __40__HMDAudioStreamInterface__callResumed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "audioStream:didResume:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __39__HMDAudioStreamInterface__callPaused___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "audioStream:didPause:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __40__HMDAudioStreamInterface__callStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "audioStream:didStart:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __37__HMDAudioStreamInterface_stopStream__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __37__HMDAudioStreamInterface_stopStream__block_invoke_2;
  v3[3] = &unk_24E79C240;
  v3[4] = v1;
  return objc_msgSend(v1, "_stopStreamWithCompletion:", v3);
}

void __54__HMDAudioStreamInterface_updateAudioVolume_callback___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  float v9;
  int v10;
  int v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  int v19;
  void *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "audioStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "volume");
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "floatValue");
    v19 = 138543874;
    v20 = v5;
    v21 = 2048;
    v22 = v8;
    v23 = 2048;
    v24 = v9;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Setting audio stream volume from %f to %f", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "floatValue");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "audioStream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = v11;
  objc_msgSend(v12, "setVolume:", v13);

  v14 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "audioStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "volume");
  v17 = v16;
  objc_msgSend(*(id *)(a1 + 40), "floatValue");
  (*(void (**)(uint64_t, BOOL))(v14 + 16))(v14, v17 == v18);

}

uint64_t __46__HMDAudioStreamInterface_updateAudioSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAudioSetting:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__HMDAudioStreamInterface_startStreamWithConfig___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startStreamWithConfig:", *(_QWORD *)(a1 + 40));
}

+ (id)_createAudioStreamWithSessionHandler:(id)a3 localNetworkConfig:(id)a4 localRTPSocket:(int *)a5
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
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating the audio stream", (uint8_t *)&v26, 0xCu);

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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating audio stream with destination: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = objc_alloc(MEMORY[0x24BDFD9D8]);
  objc_msgSend(v4, "remoteDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v12 = (void *)objc_msgSend(v10, "initWithIDSDestination:isOriginator:error:", v11, 0, &v20);
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
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remote destination receiver AVCAudioStream: %@", buf, 0x16u);

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
    LODWORD(v22) = objc_msgSend(v4, "remoteAudioSocket");
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating audio stream with socket: %d", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_fd(v9, (const char *)*MEMORY[0x24BDFDA60], objc_msgSend(v4, "remoteAudioSocket"));
  v18 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFD9D8]), "initWithNetworkSockets:isOriginator:error:", v9, 0, &v18);
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
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remote socket receiver AVCAudioStream: %@", buf, 0x16u);

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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating local audio stream with socket %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v8);
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_fd(v13, (const char *)*MEMORY[0x24BDFDA60], v7);
    v26 = 0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFD9D8]), "initWithNetworkSockets:isOriginator:error:", v13, 0, &v26);
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
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to create local AVCAudioStream: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      close(v7);
    }

  }
  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39_57086 != -1)
    dispatch_once(&logCategory__hmf_once_t39_57086, &__block_literal_global_57087);
  return (id)logCategory__hmf_once_v40_57088;
}

void __38__HMDAudioStreamInterface_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v40_57088;
  logCategory__hmf_once_v40_57088 = v0;

}

@end
