@implementation HMDSiriSession

- (HMDSiriSession)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4 deviceType:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDSiriSession *v12;
  uint64_t v13;
  OS_os_log *logger;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDSiriSession;
  v12 = -[HMDSiriSession init](&v16, sel_init);
  if (v12)
  {
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    logger = v12->_logger;
    v12->_logger = (OS_os_log *)v13;

    objc_storeStrong((id *)&v12->_deviceType, a5);
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v12->_logEventSubmitter, a4);
    v12->_isActivationPending = 0;
  }

  return v12;
}

- (HMDSiriSession)initWithIdentifier:(id)a3 deviceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDSiriSession *v9;

  v6 = a4;
  v7 = a3;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDSiriSession initWithIdentifier:logEventSubmitter:deviceType:](self, "initWithIdentifier:logEventSubmitter:deviceType:", v7, v8, v6);

  return v9;
}

- (BOOL)activateWithAccessory:(id)a3 metadata:(id)a4
{
  return 0;
}

- (BOOL)activateAfterHubInitiation
{
  void *v3;
  HMDSiriSession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriSession identifier](v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@Hub initiated Siri input not supported for this Siri session (%@)", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  return 0;
}

- (void)setActiveBulkSendSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  HMDSiriSession *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDSiriSession activeSessionInfo](self, "activeSessionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveBulkSendSession:", v4);

  -[HMDSiriSession activeSessionInfo](self, "activeSessionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isSiriSessionActive") & 1) != 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  v7 = -[HMDSiriSession isActivationPending](self, "isActivationPending");

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSiriSession identifier](v9, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Siri session is inactive and activation is pending, reading first frame (%@)", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDSiriSession activeSessionInfo](v9, "activeSessionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "readFirstFrame");
    goto LABEL_6;
  }
LABEL_7:

}

- (void)activeSiriSession:(id)a3 didCreateAudioFrame:(id)a4 sequenceNumber:(id)a5 gain:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDSiriSession *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriSession identifier](v15, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v17;
    v24 = 2112;
    v25 = v18;
    v26 = 2048;
    v27 = objc_msgSend(v11, "length");
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[session %@] Send frame (%lu bytes)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  v20[0] = CFSTR("kMsgArgData");
  v20[1] = CFSTR("kSeqNum");
  v21[0] = v11;
  v21[1] = v12;
  v20[2] = CFSTR("kGain");
  v21[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriSession sendMsg:args:](v15, "sendMsg:args:", "AudioFrame", v19);

}

- (void)invalidate
{
  void *v3;
  HMDSiriSession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriSession identifier](v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@[session %@] Invalidate", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDSiriSession sendMsg:args:](v4, "sendMsg:args:", "Unpublish", 0);
}

- (void)publish
{
  void *v3;
  HMDSiriSession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriSession identifier](v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@[session %@] Telling plugin to add this session as device", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDSiriSession deviceType](v4, "deviceType", CFSTR("kDeviceType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriSession sendMsg:args:](v4, "sendMsg:args:", "Publish", v9);

}

- (void)handleStartStream
{
  void *v3;
  HMDSiriSession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *logger;
  void *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriSession identifier](v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@[session %@] Starting stream", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v8 = v4->_logger;
  logger = v4->_logger;
  -[HMDSiriSession activeSessionInfo](v4, "activeSessionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(logger, v10);

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    -[HMDSiriSession identifier](v4, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v12;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, v8, OS_SIGNPOST_EVENT, v11, "SiriRecording", "AccessoryID=%@", (uint8_t *)&v15, 0xCu);

  }
  if (-[HMDSiriSession _startStream](v4, "_startStream"))
  {
    v13 = 0;
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1055);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriSession _createArgsDictionaryWithError:](v4, "_createArgsDictionaryWithError:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HMDSiriSession maybeSubmitStreamStartMetricWithError:](v4, "maybeSubmitStreamStartMetricWithError:", v14);
  -[HMDSiriSession sendMsg:args:](v4, "sendMsg:args:", "TransportDidStart", v13);

}

- (void)handleStopStream
{
  void *v3;
  HMDSiriSession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriSession identifier](v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@[session %@] Stopping stream", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDSiriSession stopStream](v4, "stopStream");
  -[HMDSiriSession sendMsg:args:](v4, "sendMsg:args:", "TransportDidStop", 0);
}

- (void)handleResetStream
{
  void *v3;
  HMDSiriSession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriSession identifier](v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@[session %@] Resetting stream", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDSiriSession stopStream](v4, "stopStream");
}

- (void)activeSiriSessionDidStop:(id)a3
{
  id v4;
  void *v5;
  HMDSiriSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriSession identifier](v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@[session %@] Deactivating Siri Session", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDSiriSession deactivate](v6, "deactivate");

}

- (void)stopStream
{
  void *v3;
  void *v4;
  HMDSiriSession *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *logger;
  void *v12;
  os_signpost_id_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDSiriSession *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[HMDSiriSession activeSessionInfo](self, "activeSessionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSiriSession identifier](v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Session %@ stopped the audio", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v10 = v5->_logger;
    logger = v5->_logger;
    -[HMDSiriSession activeSessionInfo](v5, "activeSessionInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_make_with_pointer(logger, v12);

    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      -[HMDSiriSession identifier](v5, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v14;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, v10, OS_SIGNPOST_INTERVAL_END, v13, "SiriSession", "AccessoryID=%@", (uint8_t *)&v24, 0xCu);

    }
    -[HMDSiriSession activeSessionInfo](v5, "activeSessionInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "markSiriPluginStopped");

    -[HMDSiriSession activeSessionInfo](v5, "activeSessionInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

    -[HMDSiriSession setActiveSessionInfo:](v5, "setActiveSessionInfo:", 0);
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSiriSession identifier](v5, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Session %@ did stop but was not active (stale notification?)", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  -[HMDSiriSession boostMessage](v5, "boostMessage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v5;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Releasing boost message", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDSiriSession setBoostMessage:](v21, "setBoostMessage:", 0);
  }
  -[HMDSiriSession setIsActivationPending:](v5, "setIsActivationPending:", 0);
}

- (void)beginTrackingStreamStartMetricWithActivationType:(unint64_t)a3
{
  NSObject *logger;
  void *v6;
  os_signpost_id_t v7;
  OS_os_log *v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDSiriSession *v15;
  NSObject *v16;
  __CFString *v17;
  HMDSiriStreamStartEvent *v18;
  int v19;
  __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  logger = self->_logger;
  -[HMDSiriSession activeSessionInfo](self, "activeSessionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(logger, v6);

  v8 = self->_logger;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v8))
  {
    if (a3 - 1 > 3)
      v10 = CFSTR("Unknown");
    else
      v10 = off_24E78A5E0[a3 - 1];
    v11 = v10;
    -[HMDSiriSession identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SiriSession", "ActivationType=%@ AccessoryID=%@", (uint8_t *)&v19, 0x16u);

  }
  -[HMDSiriSession streamStartMetric](self, "streamStartMetric");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Resetting start stream metric", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }
  v18 = -[HMDSiriStreamStartEvent initWithActivationType:]([HMDSiriStreamStartEvent alloc], "initWithActivationType:", a3);
  -[HMDSiriSession setStreamStartMetric:](self, "setStreamStartMetric:", v18);

}

- (void)maybeSubmitStreamStartMetricWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMDSiriSession streamStartMetric](self, "streamStartMetric");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDSiriSession logEventSubmitter](self, "logEventSubmitter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriSession streamStartMetric](self, "streamStartMetric");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "submitLogEvent:error:", v6, v7);

    -[HMDSiriSession setStreamStartMetric:](self, "setStreamStartMetric:", 0);
  }

}

- (BOOL)_startStream
{
  void *v3;
  _BOOL4 v4;
  void *v5;

  -[HMDSiriSession activeSessionInfo](self, "activeSessionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 || (v4 = -[HMDSiriSession activateAfterHubInitiation](self, "activateAfterHubInitiation")))
  {
    -[HMDSiriSession activeSessionInfo](self, "activeSessionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "markSiriPluginReady");

    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)sendMsg:(const char *)a3 args:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = (void *)MEMORY[0x24BDBCED8];
  -[HMDSiriSession identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObject:forKey:", v7, CFSTR("kMsgArgIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v8, "addEntriesFromDictionary:", v11);
  -[HMDSiriSession server](self, "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendMsgIfCheckedIn:args:", v10, v8);

}

- (id)_createArgsDictionaryWithError:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDD1618];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kMsgArgError"));

  v9 = CFSTR("kMsgArgError");
  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDSiriStreamStartEvent)streamStartMetric
{
  return self->_streamStartMetric;
}

- (void)setStreamStartMetric:(id)a3
{
  objc_storeStrong((id *)&self->_streamStartMetric, a3);
}

- (HMDSiriRemoteInputServer)server
{
  return (HMDSiriRemoteInputServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (HMDActiveSiriSessionInfo)activeSessionInfo
{
  return self->_activeSessionInfo;
}

- (void)setActiveSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_activeSessionInfo, a3);
}

- (NSNumber)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_deviceType, a3);
}

- (BOOL)isActivationPending
{
  return self->_isActivationPending;
}

- (void)setIsActivationPending:(BOOL)a3
{
  self->_isActivationPending = a3;
}

- (OS_xpc_object)boostMessage
{
  return self->_boostMessage;
}

- (void)setBoostMessage:(id)a3
{
  objc_storeStrong((id *)&self->_boostMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boostMessage, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_activeSessionInfo, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_streamStartMetric, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

+ (id)siriSessionForUI
{
  return 0;
}

@end
