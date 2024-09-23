@implementation HMDStatusChannel

- (HMDStatusChannel)initWithChannelPrefix:(id)a3 identifier:(id)a4 queue:(id)a5 netMonitor:(id)a6 timerProvider:(id)a7 presenceProvider:(id)a8 logEventSubmitter:(id)a9 appleAccountManager:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v16 = a3;
  v17 = a4;
  v37 = a5;
  v36 = a6;
  v35 = a7;
  v18 = a8;
  v34 = a9;
  v19 = a10;
  v38.receiver = self;
  v38.super_class = (Class)HMDStatusChannel;
  v20 = -[HMDStatusChannel init](&v38, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v16, "copy");
    v22 = (void *)*((_QWORD *)v20 + 7);
    *((_QWORD *)v20 + 7) = v21;

    v23 = objc_msgSend(v17, "copy");
    v24 = (void *)*((_QWORD *)v20 + 8);
    *((_QWORD *)v20 + 8) = v23;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), *((_QWORD *)v20 + 7), *((_QWORD *)v20 + 8), v34, v35, v36, v37);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v20 + 6);
    *((_QWORD *)v20 + 6) = v25;

    objc_storeStrong((id *)v20 + 1, a5);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v20 + 9);
    *((_QWORD *)v20 + 9) = v27;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v20 + 3);
    *((_QWORD *)v20 + 3) = v29;

    objc_storeStrong((id *)v20 + 10, a6);
    objc_storeStrong((id *)v20 + 11, a10);
    objc_storeStrong((id *)v20 + 12, a7);
    objc_storeStrong((id *)v20 + 21, a9);
    objc_msgSend(*((id *)v20 + 10), "setDelegate:", v20);
    objc_msgSend(v18, "createPresenceWithChannelName:serviceIdentifier:", *((_QWORD *)v20 + 6), *((_QWORD *)v20 + 7));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v20 + 5);
    *((_QWORD *)v20 + 5) = v31;

    objc_msgSend(*((id *)v20 + 5), "addDelegate:queue:", v20, *((_QWORD *)v20 + 1));
    *(_DWORD *)(v20 + 17) = 0;
  }

  return (HMDStatusChannel *)v20;
}

- (HMDStatusChannel)initWithChannelPrefix:(id)a3 identifier:(id)a4 queue:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HMDSKPresenceProvider *v14;
  void *v15;
  void *v16;
  HMDStatusChannel *v17;

  v8 = (objc_class *)MEMORY[0x24BE3F1F0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithNetAddress:", 0);
  v13 = (void *)objc_opt_new();
  v14 = objc_alloc_init(HMDSKPresenceProvider);
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDStatusChannel initWithChannelPrefix:identifier:queue:netMonitor:timerProvider:presenceProvider:logEventSubmitter:appleAccountManager:](self, "initWithChannelPrefix:identifier:queue:netMonitor:timerProvider:presenceProvider:logEventSubmitter:appleAccountManager:", v11, v10, v9, v12, v13, v14, v15, v16);

  return v17;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__HMDStatusChannel_start__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__HMDStatusChannel_stop__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)publishRecordWithPayload:(id)a3 shouldDebounce:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__HMDStatusChannel_publishRecordWithPayload_shouldDebounce___block_invoke;
  block[3] = &unk_24E799CF0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)stopPublishing
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HMDStatusChannel_stopPublishing__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)dumpState
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  _QWORD v28[7];
  _QWORD v29[8];

  v29[7] = *MEMORY[0x24BDAC8D0];
  v28[0] = CFSTR("Last Observe Timestamp");
  -[HMDStatusChannel lastObserveTimestamp](self, "lastObserveTimestamp");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localTimeDescription");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_24E79DB48;
  v29[0] = v5;
  v28[1] = CFSTR("Last Observe Device Count");
  -[HMDStatusChannel lastObserveDeviceCount](self, "lastObserveDeviceCount");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_24E79DB48;
  v29[1] = v8;
  v28[2] = CFSTR("Last Publish Timestamp");
  -[HMDStatusChannel lastPublishTimestamp](self, "lastPublishTimestamp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localTimeDescription");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_24E79DB48;
  v29[2] = v11;
  v28[3] = CFSTR("Last Publish Payload");
  -[HMDStatusChannel localPayload](self, "localPayload");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_24E79DB48;
  v29[3] = v14;
  v28[4] = CFSTR("Last Stop Publish Timestamp");
  -[HMDStatusChannel lastStopPublishTimestamp](self, "lastStopPublishTimestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localTimeDescription");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_24E79DB48;
  v29[4] = v18;
  v28[5] = CFSTR("Last Connectivity Change Timestamp");
  -[HMDStatusChannel lastConnectivityChangeTimestamp](self, "lastConnectivityChangeTimestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localTimeDescription");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = &stru_24E79DB48;
  v29[5] = v22;
  v28[6] = CFSTR("Last Connectivity State");
  -[HMDStatusChannel isConnected](self, "isConnected");
  NSStringFromBOOL();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__HMDStatusChannel_addDelegate___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setInvitedUsers:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HMDStatusChannel_setInvitedUsers_withCompletion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (id)invitedURIs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDStatusChannel presenceChannel](self, "presenceChannel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return MEMORY[0x24BDBD1A8];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDStatusChannel presenceChannel](self, "presenceChannel", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invitedHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "handleString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (void)presentDevicesChangedForPresence:(id)a3
{
  id v4;
  void *v5;
  HMDStatusChannel *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSDate *lastConnectivityChangeTimestamp;
  void *v11;
  HMDStatusChannel *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDStatusChannel *v17;
  NSObject *v18;
  void *v19;
  HMDStatusChannelObserveLogEvent *v20;
  void *v21;
  HMDStatusChannelObserveLogEvent *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543362;
    v25 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Present devices changed", (uint8_t *)&v24, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v6->_isConnected = 1;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = objc_claimAutoreleasedReturnValue();
  lastConnectivityChangeTimestamp = v6->_lastConnectivityChangeTimestamp;
  v6->_lastConnectivityChangeTimestamp = (NSDate *)v9;

  if (!-[HMDStatusChannel receivedInitialChannelState](v6, "receivedInitialChannelState"))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Received initial channel state", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDStatusChannel setReceivedInitialChannelState:](v12, "setReceivedInitialChannelState:", 1);
  }
  -[HMDStatusChannel postRegainNetworkConnectivityTimer](v6, "postRegainNetworkConnectivityTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v6;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping post regain network connectivity timer because we received a callback from StatusKit", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    -[HMDStatusChannel _stopPostRegainNetworkConnectivityTimer](v17, "_stopPostRegainNetworkConnectivityTimer");
  }
  v20 = [HMDStatusChannelObserveLogEvent alloc];
  -[HMDStatusChannel channelPrefix](v6, "channelPrefix");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HMDStatusChannelObserveLogEvent initWithChannelPrefix:](v20, "initWithChannelPrefix:", v21);

  -[HMDStatusChannel logEventSubmitter](v6, "logEventSubmitter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "submitLogEvent:", v22);

  -[HMDStatusChannel _handlePresentDevicesChangedForPresence:](v6, "_handlePresentDevicesChangedForPresence:", v4);
}

- (void)initialCloudKitImportReceived:(id)a3
{
  id v4;
  void *v5;
  HMDStatusChannel *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Initial StatusKit CloudKit import received callback triggered", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDStatusChannel initialStatusKitCloudKitImportTimer](v6, "initialStatusKitCloudKitImportTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDStatusChannel initialStatusKitCloudKitImportTimer](v6, "initialStatusKitCloudKitImportTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "suspend");

    -[HMDStatusChannel setInitialStatusKitCloudKitImportTimer:](v6, "setInitialStatusKitCloudKitImportTimer:", 0);
  }
  if (!-[HMDStatusChannel initialStatusKitCloudKitImportOccurred](v6, "initialStatusKitCloudKitImportOccurred"))
  {
    -[HMDStatusChannel setInitialStatusKitCloudKitImportOccurred:](v6, "setInitialStatusKitCloudKitImportOccurred:", 1);
    if (-[HMDStatusChannel started](v6, "started"))
      -[HMDStatusChannel _subscribeToStatusKitWithIsRetry:](v6, "_subscribeToStatusKitWithIsRetry:", 0);
  }

}

- (void)networkMonitorIsReachable:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HMDStatusChannel_networkMonitorIsReachable___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)networkMonitorIsUnreachable:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HMDStatusChannel_networkMonitorIsUnreachable___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDStatusChannel *v14;
  NSObject *v15;
  void *v16;
  HMDStatusChannel *v17;
  uint64_t v18;
  void *v19;
  HMDStatusChannel *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDStatusChannel *v24;
  NSObject *v25;
  void *v26;
  HMDStatusChannel *v27;
  uint64_t v28;
  void *v29;
  HMDStatusChannel *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDStatusChannel *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMDStatusChannel *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMDStatusChannel *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HMDStatusChannel *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  NSDate *lastConnectivityChangeTimestamp;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDStatusChannel publishRetryTimer](self, "publishRetryTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138543362;
      v53 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Publish retry timer fired", (uint8_t *)&v52, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v17 = v14;
    v18 = 1;
    goto LABEL_13;
  }
  -[HMDStatusChannel stopPublishRetryTimer](self, "stopPublishRetryTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138543362;
      v53 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Stop publish retry timer fired", (uint8_t *)&v52, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDStatusChannel _deassertPresenceWithIsRetry:](v20, "_deassertPresenceWithIsRetry:", 1);
    goto LABEL_24;
  }
  -[HMDStatusChannel subscribeRetryTimer](self, "subscribeRetryTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138543362;
      v53 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Subscribe retry timer fired", (uint8_t *)&v52, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v27 = v24;
    v28 = 1;
    goto LABEL_20;
  }
  -[HMDStatusChannel unsubscribeRetryTimer](self, "unsubscribeRetryTimer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138543362;
      v53 = v32;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Unsubscribe retry timer fired", (uint8_t *)&v52, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    -[HMDStatusChannel _unsubscribeFromStatusKitWithIsRetry:](v30, "_unsubscribeFromStatusKitWithIsRetry:", 1);
    goto LABEL_24;
  }
  -[HMDStatusChannel publishDebounceTimer](self, "publishDebounceTimer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    v33 = (void *)MEMORY[0x227676638](-[HMDStatusChannel setPublishDebounceTimer:](self, "setPublishDebounceTimer:", 0));
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138543362;
      v53 = v36;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Publish debounce timer fired", (uint8_t *)&v52, 0xCu);

    }
    objc_autoreleasePoolPop(v33);
    v17 = v34;
    v18 = 0;
LABEL_13:
    -[HMDStatusChannel _assertPresenceWithIsRetry:](v17, "_assertPresenceWithIsRetry:", v18);
    goto LABEL_24;
  }
  -[HMDStatusChannel initialStatusKitCloudKitImportTimer](self, "initialStatusKitCloudKitImportTimer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v4)
  {
    -[HMDStatusChannel postRegainNetworkConnectivityTimer](self, "postRegainNetworkConnectivityTimer");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v4)
    {
      v45 = (void *)MEMORY[0x227676638]();
      v46 = self;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138543362;
        v53 = v48;
        _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@Post network connectivity regain timer fired", (uint8_t *)&v52, 0xCu);

      }
      objc_autoreleasePoolPop(v45);
      -[HMDStatusChannel _stopPostRegainNetworkConnectivityTimer](v46, "_stopPostRegainNetworkConnectivityTimer");
      v46->_isConnected = 1;
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v49 = objc_claimAutoreleasedReturnValue();
      lastConnectivityChangeTimestamp = v46->_lastConnectivityChangeTimestamp;
      v46->_lastConnectivityChangeTimestamp = (NSDate *)v49;

      -[HMDStatusChannel presenceChannel](v46, "presenceChannel");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDStatusChannel _handlePresentDevicesChangedForPresence:](v46, "_handlePresentDevicesChangedForPresence:", v51);

    }
    else
    {
      -[HMDStatusChannel assertionLogTimer](self, "assertionLogTimer");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 == v4)
        -[HMDStatusChannel _handleAssertionLogTimerFired](self, "_handleAssertionLogTimerFired");
    }
    goto LABEL_24;
  }
  v37 = (void *)MEMORY[0x227676638](-[HMDStatusChannel setInitialStatusKitCloudKitImportTimer:](self, "setInitialStatusKitCloudKitImportTimer:", 0));
  v38 = self;
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 138543362;
    v53 = v40;
    _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Initial StatusKit CloudKit import timer fired", (uint8_t *)&v52, 0xCu);

  }
  objc_autoreleasePoolPop(v37);
  if (!-[HMDStatusChannel initialStatusKitCloudKitImportOccurred](v38, "initialStatusKitCloudKitImportOccurred"))
  {
    v41 = (void *)MEMORY[0x227676638]();
    v42 = v38;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138543362;
      v53 = v44;
      _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Marking initial StatusKit CloudKit import as has having occurred (even though it didn't yet)", (uint8_t *)&v52, 0xCu);

    }
    objc_autoreleasePoolPop(v41);
    -[HMDStatusChannel setInitialStatusKitCloudKitImportOccurred:](v42, "setInitialStatusKitCloudKitImportOccurred:", 1);
    if (-[HMDStatusChannel started](v42, "started"))
    {
      v27 = v42;
      v28 = 0;
LABEL_20:
      -[HMDStatusChannel _subscribeToStatusKitWithIsRetry:](v27, "_subscribeToStatusKitWithIsRetry:", v28);
    }
  }
LABEL_24:

}

- (id)presencePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMDStatusChannel *v17;
  NSObject *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDStatusChannel appleAccountManager](self, "appleAccountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v5, "UUIDString", CFSTR("statusChannelDeviceIdKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = CFSTR("SC.ck.pt");
    v22[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDStatusChannel localPayload](self, "localPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v12);

    v13 = objc_alloc(MEMORY[0x24BEB1070]);
    v14 = (void *)objc_msgSend(v11, "copy");
    v15 = (void *)objc_msgSend(v13, "initWithDictionary:", v14);

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Attempting to generate presence payload but current device IDS Identifier is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
}

- (void)_handlePresentDevicesChangedForPresence:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *currentRecords;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDStatusChannel _recordsFromPresence:](self, "_recordsFromPresence:", v4);
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  currentRecords = self->_currentRecords;
  self->_currentRecords = v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStatusChannel setLastObserveTimestamp:](self, "setLastObserveTimestamp:", v7);

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[HMDStatusChannel currentRecords](self, "currentRecords");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStatusChannel setLastObserveDeviceCount:](self, "setLastObserveDeviceCount:", v10);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMDStatusChannel statusDelegates](self, "statusDelegates", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HMDStatusChannel currentRecords](self, "currentRecords");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "channel:didObserveRecordUpdate:", self, v17);

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

}

- (void)_assertPresenceWithIsRetry:(BOOL)a3
{
  void *v5;
  void *v6;
  HMDStatusChannel *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDStatusChannel presencePayload](self, "presencePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Asserting presence with payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDStatusChannel presenceChannel](v7, "presenceChannel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __47__HMDStatusChannel__assertPresenceWithIsRetry___block_invoke;
    v14[3] = &unk_24E789500;
    v14[4] = v7;
    v15 = v5;
    v16 = a3;
    objc_msgSend(v11, "assertPresenceWithPresencePayload:completion:", v15, v14);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDStatusChannel localPayload](v7, "localPayload");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Nil presence payload, local payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_deassertPresenceWithIsRetry:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDStatusChannel presenceChannel](self, "presenceChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__HMDStatusChannel__deassertPresenceWithIsRetry___block_invoke;
  v6[3] = &unk_24E77FBE0;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "releasePresenceWithCompletion:", v6);

}

- (void)_publishRecordWithPayload:(id)a3 shouldDebounce:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  HMDStatusChannel *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_storeStrong((id *)&self->_localPayload, a3);
  if (-[HMDStatusChannel initialStatusKitCloudKitImportOccurred](self, "initialStatusKitCloudKitImportOccurred"))
  {
    -[HMDStatusChannel _requestPublishShouldDebounce:](self, "_requestPublishShouldDebounce:", v4);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Delaying request to publish, initial StatusKit CloudKit import has not occurred yet", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_requestPublishShouldDebounce:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  HMDStatusChannel *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDStatusChannel *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v3)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDStatusChannel publishDebounceTimer](v6, "publishDebounceTimer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "isRunning");
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v8;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting publish, debounce timer running: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDStatusChannel publishDebounceTimer](v6, "publishDebounceTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[HMDStatusChannel _createTimerWithTimeout:](v6, "_createTimerWithTimeout:", 5.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDStatusChannel setPublishDebounceTimer:](v6, "setPublishDebounceTimer:", v12);

    }
  }
  else
  {
    -[HMDStatusChannel publishDebounceTimer](self, "publishDebounceTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suspend");

    v14 = (void *)MEMORY[0x227676638](-[HMDStatusChannel setPublishDebounceTimer:](self, "setPublishDebounceTimer:", 0));
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting publish without debounce", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDStatusChannel _assertPresenceWithIsRetry:](v15, "_assertPresenceWithIsRetry:", 0);
  }
}

- (void)_stopPublishing
{
  void *v3;
  HMDStatusChannel *v4;
  NSObject *v5;
  void *v6;
  NSDictionary *localPayload;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping publishing", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  localPayload = v4->_localPayload;
  v4->_localPayload = 0;

  -[HMDStatusChannel _deassertPresenceWithIsRetry:](v4, "_deassertPresenceWithIsRetry:", 0);
}

- (id)_recordsFromPresence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  HMDStatusChannelRecord *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "presentDevices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = -[HMDStatusChannelRecord initWithPresentDevice:]([HMDStatusChannelRecord alloc], "initWithPresentDevice:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_checkForInitialStatusKitCloudKitImportAndSubscribe
{
  void *v3;
  HMDStatusChannel *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[HMDStatusChannel initialStatusKitCloudKitImportOccurred](self, "initialStatusKitCloudKitImportOccurred"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Initial StatusKit CloudKit import has occurred already, subscribing", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDStatusChannel _subscribeToStatusKitWithIsRetry:](v4, "_subscribeToStatusKitWithIsRetry:", 0);
  }
  else
  {
    -[HMDStatusChannel presenceChannel](self, "presenceChannel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __71__HMDStatusChannel__checkForInitialStatusKitCloudKitImportAndSubscribe__block_invoke;
    v8[3] = &unk_24E79B328;
    v8[4] = self;
    objc_msgSend(v7, "hasInitialCloudKitImportOccurredWithCompletion:", v8);

  }
}

- (void)_subscribeToStatusKitWithIsRetry:(BOOL)a3
{
  void *v5;
  HMDStatusChannel *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  BOOL v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Subscribing with isRetry: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDStatusChannel presenceChannel](v6, "presenceChannel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__HMDStatusChannel__subscribeToStatusKitWithIsRetry___block_invoke;
  v11[3] = &unk_24E77FBE0;
  v11[4] = v6;
  v12 = a3;
  objc_msgSend(v10, "retainTransientSubscriptionAssertionWithCompletion:", v11);

}

- (void)_unsubscribeFromStatusKitWithIsRetry:(BOOL)a3
{
  void *v5;
  HMDStatusChannel *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  BOOL v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Unsubscribing with isRetry: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDStatusChannel presenceChannel](v6, "presenceChannel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__HMDStatusChannel__unsubscribeFromStatusKitWithIsRetry___block_invoke;
  v11[3] = &unk_24E77FBE0;
  v11[4] = v6;
  v12 = a3;
  objc_msgSend(v10, "releaseTransientSubscriptionAssertionWithCompletion:", v11);

}

- (void)_informNetworkChange:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HMDStatusChannel *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("NO");
    if (v3)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v23 = v8;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Status Channel saw network connectivity change.  IsConnected: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDStatusChannel statusDelegates](v6, "statusDelegates", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "channel:didObserveConnectionChange:", v6, v3);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)_stopPostRegainNetworkConnectivityTimer
{
  void *v3;

  -[HMDStatusChannel postRegainNetworkConnectivityTimer](self, "postRegainNetworkConnectivityTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDStatusChannel setPostRegainNetworkConnectivityTimer:](self, "setPostRegainNetworkConnectivityTimer:", 0);
}

- (void)_addDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDStatusChannel *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDStatusChannel *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDStatusChannel statusDelegates](self, "statusDelegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  if (-[HMDStatusChannel subscribed](self, "subscribed"))
  {
    if (self->_isConnected && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v9;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling didObserveRecordUpdate on added delegate because isConnected: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      -[HMDStatusChannel currentRecords](v7, "currentRecords");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "channel:didObserveRecordUpdate:", v7, v11);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Calling didObserveConnectionChange on added delegate", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v4, "channel:didObserveConnectionChange:", v13, -[HMDStatusChannel isConnected](v13, "isConnected"));
    }
  }

}

- (void)_setInvitedUsers:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  HMDStatusChannel *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDStatusChannel *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id aBlock;
  void *v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[2];
  _BYTE buf[12];
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  aBlock = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDStatusChannel presenceChannel](self, "presenceChannel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invitedHandles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStatusChannel _urisFromSKHandles:](self, "_urisFromSKHandles:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  v14 = self;
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v57 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v18, "userID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v9, "containsObject:", v19);

        objc_msgSend(v18, "userID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v20 & 1) != 0)
          objc_msgSend(v46, "removeObject:", v21);
        else
          objc_msgSend(v11, "addObject:", v21);
        self = v14;

      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v11, "count") || objc_msgSend(v46, "count"))
  {
    -[HMDStatusChannel _skHandlesFromUserIDs:](self, "_skHandlesFromUserIDs:", v11);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDStatusChannel _skHandlesFromUserIDs:](self, "_skHandlesFromUserIDs:", v46);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v55 = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v55);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F168]), "initWithQueue:", self->_queue);
    v25 = (void *)MEMORY[0x24BE3F180];
    v43 = (void *)v23;
    v44 = (void *)v22;
    v60[0] = v22;
    v60[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allSettled:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = MEMORY[0x24BDAC760];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __52__HMDStatusChannel__setInvitedUsers_withCompletion___block_invoke;
    v53[3] = &unk_24E7776F8;
    v54 = aBlock;
    v40 = v27;
    v29 = (id)objc_msgSend(v27, "inContext:then:", v24, v53);
    if (objc_msgSend(v41, "count"))
    {
      -[HMDStatusChannel presenceChannel](self, "presenceChannel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v28;
      v50[1] = 3221225472;
      v50[2] = __52__HMDStatusChannel__setInvitedUsers_withCompletion___block_invoke_2;
      v50[3] = &unk_24E799FD0;
      v50[4] = self;
      v51 = v12;
      v52 = *(id *)buf;
      objc_msgSend(v30, "removeInvitedHandles:completion:", v41, v50);

    }
    else
    {
      objc_msgSend(*(id *)buf, "fulfillWithNoValue");
    }
    v31 = v42;
    if (objc_msgSend(v42, "count"))
    {
      -[HMDStatusChannel presenceChannel](v14, "presenceChannel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __52__HMDStatusChannel__setInvitedUsers_withCompletion___block_invoke_94;
      v47[3] = &unk_24E799FD0;
      v47[4] = v14;
      v48 = v12;
      v49 = v55;
      objc_msgSend(v32, "inviteHandlesFromPrimaryAccountHandle:completion:", v42, v47);

    }
    else
    {
      objc_msgSend(v55, "fulfillWithNoValue");
    }

    v33 = aBlock;
  }
  else
  {
    v34 = (void *)MEMORY[0x227676638]();
    v35 = self;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDStatusChannel channelName](v35, "channelName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v37;
      v62 = 2112;
      v63 = v38;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@No users detected to add or remove from channel %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v34);
    v33 = aBlock;
    v39 = _Block_copy(aBlock);
    v31 = v39;
    if (v39)
      (*((void (**)(void *, _QWORD))v39 + 2))(v39, 0);
  }

}

- (id)_skHandlesFromUsers:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_96);
}

- (id)_skHandlesFromUserIDs:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_99);
}

- (id)_urisFromSKHandles:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a3, "na_map:", &__block_literal_global_101);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_createTimerWithTimeout:(double)a3
{
  void *v5;
  void *v6;

  -[HMDStatusChannel timerProvider](self, "timerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timerWithTimeInterval:options:", 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setDelegateQueue:", self->_queue);
  objc_msgSend(v6, "resume");
  return v6;
}

- (id)_createBackoffTimerWithMinimumTimeInterval:(double)a3 maximumTimeInterval:(double)a4
{
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  HMDStatusChannel *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDStatusChannel timerProvider](self, "timerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[HMDStatusChannel timerProvider](self, "timerProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backoffTimerWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", 2, 0, a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setDelegate:", self);
    objc_msgSend(v10, "setDelegateQueue:", self->_queue);
    objc_msgSend(v10, "resume");
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@The timerProvider does not implement backoff timer", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }
  return v10;
}

- (void)_startAssertionLogTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  OS_dispatch_queue *queue;
  void *v8;
  id v9;

  -[HMDStatusChannel assertionLogTimer](self, "assertionLogTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HMDStatusChannel timerProvider](self, "timerProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timerWithTimeInterval:options:", 4, 600.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDStatusChannel setAssertionLogTimer:](self, "setAssertionLogTimer:", v5);

    -[HMDStatusChannel assertionLogTimer](self, "assertionLogTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    queue = self->_queue;
    -[HMDStatusChannel assertionLogTimer](self, "assertionLogTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegateQueue:", queue);

    -[HMDStatusChannel assertionLogTimer](self, "assertionLogTimer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resume");

  }
}

- (void)_stopAssertionLogTimer
{
  void *v3;

  -[HMDStatusChannel assertionLogTimer](self, "assertionLogTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDStatusChannel setAssertionLogTimer:](self, "setAssertionLogTimer:", 0);
}

- (void)_handleAssertionLogTimerFired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDStatusChannel *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[HMDStatusChannel appleAccountManager](self, "appleAccountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStatusChannel presenceChannel](self, "presenceChannel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __49__HMDStatusChannel__handleAssertionLogTimerFired__block_invoke;
  v26[3] = &unk_24E7777E0;
  v8 = v5;
  v27 = v8;
  objc_msgSend(v7, "na_any:", v26);
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDStatusChannel localPayload](v10, "localPayload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v23 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDStatusChannel lastPublishTimestamp](v10, "lastPublishTimestamp");
    v24 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDStatusChannel lastStopPublishTimestamp](v10, "lastStopPublishTimestamp");
    v25 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v15 = objc_claimAutoreleasedReturnValue();
    v21 = v7;
    v16 = objc_msgSend(v7, "count");
    -[HMDStatusChannel isConnected](v10, "isConnected");
    HMFBooleanToString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDStatusChannel lastConnectivityChangeTimestamp](v10, "lastConnectivityChangeTimestamp");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    v29 = v20;
    v30 = 2112;
    v31 = v12;
    v32 = 2112;
    v33 = v13;
    v34 = 2112;
    v35 = v14;
    v36 = 2112;
    v37 = v15;
    v19 = (void *)v15;
    v38 = 2048;
    v39 = v16;
    v7 = v21;
    v40 = 2112;
    v41 = v17;
    v42 = 2112;
    v43 = v18;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Asserting: %@, last assertion: %@, last de-assertion: %@, assertion in channel: %@ (%lu), connected: %@, last connection change: %@", buf, 0x52u);

    v4 = v25;
    v9 = v24;

    v8 = v23;
  }

  objc_autoreleasePoolPop(v9);
}

- (NSSet)currentRecords
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)localPayload
{
  return self->_localPayload;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (HMDSKPresence)presenceChannel
{
  return self->_presenceChannel;
}

- (NSString)channelName
{
  return self->_channelName;
}

- (NSString)channelPrefix
{
  return self->_channelPrefix;
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (NSHashTable)statusDelegates
{
  return self->_statusDelegates;
}

- (HMFNetMonitor)netMonitor
{
  return self->_netMonitor;
}

- (HMDAppleAccountManager)appleAccountManager
{
  return self->_appleAccountManager;
}

- (HMDTimerProvider)timerProvider
{
  return self->_timerProvider;
}

- (HMFTimer)subscribeRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSubscribeRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (HMFTimer)unsubscribeRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)setUnsubscribeRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (HMFTimer)publishRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPublishRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (HMFTimer)stopPublishRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setStopPublishRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (HMFTimer)publishDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPublishDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (HMFTimer)initialStatusKitCloudKitImportTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInitialStatusKitCloudKitImportTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (HMFTimer)postRegainNetworkConnectivityTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPostRegainNetworkConnectivityTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (HMFTimer)assertionLogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAssertionLogTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)initialStatusKitCloudKitImportOccurred
{
  return self->_initialStatusKitCloudKitImportOccurred;
}

- (void)setInitialStatusKitCloudKitImportOccurred:(BOOL)a3
{
  self->_initialStatusKitCloudKitImportOccurred = a3;
}

- (BOOL)subscribed
{
  return self->_subscribed;
}

- (void)setSubscribed:(BOOL)a3
{
  self->_subscribed = a3;
}

- (BOOL)receivedInitialChannelState
{
  return self->_receivedInitialChannelState;
}

- (void)setReceivedInitialChannelState:(BOOL)a3
{
  self->_receivedInitialChannelState = a3;
}

- (NSDate)lastObserveTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastObserveTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSNumber)lastObserveDeviceCount
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastObserveDeviceCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSDate)lastPublishTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLastPublishTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSDate)lastStopPublishTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLastStopPublishTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSDate)lastConnectivityChangeTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLastConnectivityChangeTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConnectivityChangeTimestamp, 0);
  objc_storeStrong((id *)&self->_lastStopPublishTimestamp, 0);
  objc_storeStrong((id *)&self->_lastPublishTimestamp, 0);
  objc_storeStrong((id *)&self->_lastObserveDeviceCount, 0);
  objc_storeStrong((id *)&self->_lastObserveTimestamp, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_assertionLogTimer, 0);
  objc_storeStrong((id *)&self->_postRegainNetworkConnectivityTimer, 0);
  objc_storeStrong((id *)&self->_initialStatusKitCloudKitImportTimer, 0);
  objc_storeStrong((id *)&self->_publishDebounceTimer, 0);
  objc_storeStrong((id *)&self->_stopPublishRetryTimer, 0);
  objc_storeStrong((id *)&self->_publishRetryTimer, 0);
  objc_storeStrong((id *)&self->_unsubscribeRetryTimer, 0);
  objc_storeStrong((id *)&self->_subscribeRetryTimer, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_netMonitor, 0);
  objc_storeStrong((id *)&self->_statusDelegates, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
  objc_storeStrong((id *)&self->_channelPrefix, 0);
  objc_storeStrong((id *)&self->_channelName, 0);
  objc_storeStrong((id *)&self->_presenceChannel, 0);
  objc_storeStrong((id *)&self->_localPayload, 0);
  objc_storeStrong((id *)&self->_currentRecords, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __49__HMDStatusChannel__handleAssertionLogTimerFired__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDStatusChannelRecord *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = -[HMDStatusChannelRecord initWithPresentDevice:]([HMDStatusChannelRecord alloc], "initWithPresentDevice:", v3);

  -[HMDStatusChannelRecord idsIdentifier](v4, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v6;
}

uint64_t __39__HMDStatusChannel__urisFromSKHandles___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleString");
}

id __42__HMDStatusChannel__skHandlesFromUserIDs___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEB1028];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithString:", v3);

  return v4;
}

id __40__HMDStatusChannel__skHandlesFromUsers___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BEB1028];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);
  return v6;
}

uint64_t __52__HMDStatusChannel__setInvitedUsers_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(MEMORY[0x24BDBCEF8], "null", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if ((v11 & 1) == 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

  return 1;
}

void __52__HMDStatusChannel__setInvitedUsers_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDStatusChannelManagementLogEvent *v10;
  void *v11;
  HMDStatusChannelManagementLogEvent *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "channelName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@remove users %@ from channel %@ complete with error %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v10 = [HMDStatusChannelManagementLogEvent alloc];
  objc_msgSend(*(id *)(a1 + 32), "channelPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDStatusChannelManagementLogEvent initWithChannelPrefix:isRetry:action:](v10, "initWithChannelPrefix:isRetry:action:", v11, 0, 4);

  if (v3)
  {
    -[HMMLogEvent setError:](v12, "setError:", v3);
    objc_msgSend(*(id *)(a1 + 48), "rejectWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "fulfillWithNoValue");
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitLogEvent:", v12);

}

void __52__HMDStatusChannel__setInvitedUsers_withCompletion___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDStatusChannelManagementLogEvent *v10;
  void *v11;
  HMDStatusChannelManagementLogEvent *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "channelName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Add users %@ to channel %@ complete with error %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v10 = [HMDStatusChannelManagementLogEvent alloc];
  objc_msgSend(*(id *)(a1 + 32), "channelPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDStatusChannelManagementLogEvent initWithChannelPrefix:isRetry:action:](v10, "initWithChannelPrefix:isRetry:action:", v11, 0, 3);

  if (v3)
  {
    -[HMMLogEvent setError:](v12, "setError:", v3);
    objc_msgSend(*(id *)(a1 + 48), "rejectWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "fulfillWithNoValue");
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitLogEvent:", v12);

}

void __57__HMDStatusChannel__unsubscribeFromStatusKitWithIsRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__HMDStatusChannel__unsubscribeFromStatusKitWithIsRetry___block_invoke_2;
  block[3] = &unk_24E799CF0;
  block[4] = v4;
  v8 = v3;
  v9 = *(_BYTE *)(a1 + 40);
  v6 = v3;
  dispatch_async(v5, block);

}

void __57__HMDStatusChannel__unsubscribeFromStatusKitWithIsRetry___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  HMDStatusChannelManagementLogEvent *v7;
  void *v8;
  HMDStatusChannelManagementLogEvent *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v24 = 138543618;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Presence channel unsubscribe completed with error %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = [HMDStatusChannelManagementLogEvent alloc];
  objc_msgSend(*(id *)(a1 + 32), "channelPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDStatusChannelManagementLogEvent initWithChannelPrefix:isRetry:action:](v7, "initWithChannelPrefix:isRetry:action:", v8, *(unsigned __int8 *)(a1 + 48), 2);

  v10 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v10, "logEventSubmitter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "submitLogEvent:error:", v9, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "unsubscribeRetryTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "_createBackoffTimerWithMinimumTimeInterval:maximumTimeInterval:", 5.0, 300.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setUnsubscribeRetryTimer:", v13);

    }
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "unsubscribeRetryTimer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fireDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceNow");
      v20 = *(_QWORD *)(a1 + 40);
      v24 = 138543874;
      v25 = v17;
      v26 = 2048;
      v27 = v21;
      v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to unsubscribe from status kit.  Will retry in %f seconds.  Error %@", (uint8_t *)&v24, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }
  else
  {
    objc_msgSend(v10, "setSubscribed:", 0);
    objc_msgSend(*(id *)(a1 + 32), "unsubscribeRetryTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "suspend");

    objc_msgSend(*(id *)(a1 + 32), "setUnsubscribeRetryTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "submitLogEvent:", v9);

  }
}

void __53__HMDStatusChannel__subscribeToStatusKitWithIsRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HMDStatusChannel__subscribeToStatusKitWithIsRetry___block_invoke_2;
  block[3] = &unk_24E799CF0;
  block[4] = v4;
  v8 = v3;
  v9 = *(_BYTE *)(a1 + 40);
  v6 = v3;
  dispatch_async(v5, block);

}

void __53__HMDStatusChannel__subscribeToStatusKitWithIsRetry___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  HMDStatusChannelManagementLogEvent *v7;
  void *v8;
  HMDStatusChannelManagementLogEvent *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v29 = 138543618;
    v30 = v5;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Presence channel subscribe completed with error %@", (uint8_t *)&v29, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = [HMDStatusChannelManagementLogEvent alloc];
  objc_msgSend(*(id *)(a1 + 32), "channelPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDStatusChannelManagementLogEvent initWithChannelPrefix:isRetry:action:](v7, "initWithChannelPrefix:isRetry:action:", v8, *(unsigned __int8 *)(a1 + 48), 1);

  v10 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v10, "logEventSubmitter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "submitLogEvent:error:", v9, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "subscribeRetryTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "_createBackoffTimerWithMinimumTimeInterval:maximumTimeInterval:", 5.0, 300.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSubscribeRetryTimer:", v13);

    }
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "subscribeRetryTimer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fireDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceNow");
      v20 = *(_QWORD *)(a1 + 40);
      v29 = 138543874;
      v30 = v17;
      v31 = 2048;
      v32 = v21;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to subscribe to status kit.  Will retry in %f seconds.  Error %@", (uint8_t *)&v29, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }
  else
  {
    objc_msgSend(v10, "setSubscribed:", 1);
    objc_msgSend(*(id *)(a1 + 32), "subscribeRetryTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "suspend");

    objc_msgSend(*(id *)(a1 + 32), "setSubscribeRetryTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "submitLogEvent:", v9);

    objc_msgSend(*(id *)(a1 + 32), "localPayload");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting publish now that we are subscribed", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(*(id *)(a1 + 32), "_requestPublishShouldDebounce:", 0);
    }
  }

}

void __71__HMDStatusChannel__checkForInitialStatusKitCloudKitImportAndSubscribe__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__HMDStatusChannel__checkForInitialStatusKitCloudKitImportAndSubscribe__block_invoke_2;
  v4[3] = &unk_24E7968C8;
  v4[4] = v2;
  v5 = a2;
  dispatch_async(v3, v4);
}

void __71__HMDStatusChannel__checkForInitialStatusKitCloudKitImportAndSubscribe__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received completion with initial StatusKit CloudKit import has occurred: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setInitialStatusKitCloudKitImportOccurred:", *(unsigned __int8 *)(a1 + 40));
  v7 = objc_msgSend(*(id *)(a1 + 32), "initialStatusKitCloudKitImportOccurred");
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v8, "_subscribeToStatusKitWithIsRetry:", 0);
  }
  else
  {
    objc_msgSend(v8, "initialStatusKitCloudKitImportTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Initial StatusKit CloudKit import has not occurred, starting timer", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(*(id *)(a1 + 32), "_createTimerWithTimeout:", 300.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setInitialStatusKitCloudKitImportTimer:", v14);

    }
  }
}

void __49__HMDStatusChannel__deassertPresenceWithIsRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__HMDStatusChannel__deassertPresenceWithIsRetry___block_invoke_2;
  block[3] = &unk_24E799CF0;
  block[4] = v4;
  v8 = v3;
  v9 = *(_BYTE *)(a1 + 40);
  v6 = v3;
  dispatch_async(v5, block);

}

void __49__HMDStatusChannel__deassertPresenceWithIsRetry___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  HMDStatusChannelManagementLogEvent *v7;
  void *v8;
  HMDStatusChannelManagementLogEvent *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v24 = 138543618;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Presence channel stop publishing completed with error %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = [HMDStatusChannelManagementLogEvent alloc];
  objc_msgSend(*(id *)(a1 + 32), "channelPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDStatusChannelManagementLogEvent initWithChannelPrefix:isRetry:action:](v7, "initWithChannelPrefix:isRetry:action:", v8, *(unsigned __int8 *)(a1 + 48), 2);

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "submitLogEvent:error:", v9, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "stopPublishRetryTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "_createBackoffTimerWithMinimumTimeInterval:maximumTimeInterval:", 5.0, 300.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setStopPublishRetryTimer:", v12);

    }
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "stopPublishRetryTimer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fireDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceNow");
      v19 = *(_QWORD *)(a1 + 40);
      v24 = 138543874;
      v25 = v16;
      v26 = 2048;
      v27 = v20;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to stop publishing to status kit.  Will retry in %f seconds.  Error %@", (uint8_t *)&v24, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastStopPublishTimestamp:", v21);

    objc_msgSend(*(id *)(a1 + 32), "stopPublishRetryTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "suspend");

    objc_msgSend(*(id *)(a1 + 32), "setStopPublishRetryTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "submitLogEvent:", v9);

  }
}

void __47__HMDStatusChannel__assertPresenceWithIsRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__HMDStatusChannel__assertPresenceWithIsRetry___block_invoke_2;
  v8[3] = &unk_24E796150;
  v8[4] = v4;
  v9 = v5;
  v10 = v3;
  v11 = *(_BYTE *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

void __47__HMDStatusChannel__assertPresenceWithIsRetry___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  HMDStatusChannelPublishLogEvent *v20;
  void *v21;
  HMDStatusChannelPublishLogEvent *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v24 = 138543874;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Set presence payload: %@ completed with error: %@", (uint8_t *)&v24, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "publishRetryTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "_createBackoffTimerWithMinimumTimeInterval:maximumTimeInterval:", 5.0, 300.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setPublishRetryTimer:", v9);

    }
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "publishRetryTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fireDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceNow");
      v24 = 138543874;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v28 = 2048;
      v29 = v17;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to set presence payload %@. Will retry in %f seconds.", (uint8_t *)&v24, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastPublishTimestamp:", v18);

    objc_msgSend(*(id *)(a1 + 32), "publishRetryTimer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "suspend");

    objc_msgSend(*(id *)(a1 + 32), "setPublishRetryTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_startAssertionLogTimer");
  }
  v20 = [HMDStatusChannelPublishLogEvent alloc];
  objc_msgSend(*(id *)(a1 + 32), "channelPrefix");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HMDStatusChannelPublishLogEvent initWithChannelPrefix:isRetry:](v20, "initWithChannelPrefix:isRetry:", v21, *(unsigned __int8 *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "submitLogEvent:error:", v22, *(_QWORD *)(a1 + 48));

}

uint64_t __48__HMDStatusChannel_networkMonitorIsUnreachable___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received network is unreachable from NetMonitor", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  result = objc_msgSend(*(id *)(a1 + 32), "started");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 208);
    *(_QWORD *)(v8 + 208) = v7;

    objc_msgSend(*(id *)(a1 + 32), "postRegainNetworkConnectivityTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v14;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping post regain network connectivity timer because network is unreachable again", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(*(id *)(a1 + 32), "_stopPostRegainNetworkConnectivityTimer");
    }
    return objc_msgSend(*(id *)(a1 + 32), "_informNetworkChange:", 0);
  }
  return result;
}

void __46__HMDStatusChannel_networkMonitorIsReachable___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received network is reachable from NetMonitor", (uint8_t *)&v19, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 32), "started"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_informNetworkChange:", 1);
    if (objc_msgSend(*(id *)(a1 + 32), "receivedInitialChannelState"))
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isConnected") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "postRegainNetworkConnectivityTimer");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v6)
        {
          v7 = (void *)MEMORY[0x227676638]();
          v8 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 138543362;
            v20 = v10;
            _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Starting post network connectivity regain timer", (uint8_t *)&v19, 0xCu);

          }
          objc_autoreleasePoolPop(v7);
          objc_msgSend(*(id *)(a1 + 32), "timerProvider");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timerWithTimeInterval:options:", 0, 60.0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setPostRegainNetworkConnectivityTimer:", v12);

          v13 = *(void **)(a1 + 32);
          objc_msgSend(v13, "postRegainNetworkConnectivityTimer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setDelegate:", v13);

          v15 = *(_QWORD **)(a1 + 32);
          v16 = v15[1];
          objc_msgSend(v15, "postRegainNetworkConnectivityTimer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setDelegateQueue:", v16);

          objc_msgSend(*(id *)(a1 + 32), "postRegainNetworkConnectivityTimer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "resume");

        }
      }
    }
  }
}

uint64_t __51__HMDStatusChannel_setInvitedUsers_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setInvitedUsers:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __32__HMDStatusChannel_addDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addDelegate:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__HMDStatusChannel_stopPublishing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopPublishing");
}

uint64_t __60__HMDStatusChannel_publishRecordWithPayload_shouldDebounce___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_publishRecordWithPayload:shouldDebounce:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __24__HMDStatusChannel_stop__block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "started");
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if ((v2 & 1) != 0)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "channelName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping Presence Channel %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "setStarted:", 0);
    objc_msgSend(*(id *)(a1 + 32), "subscribeRetryTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "suspend");

    objc_msgSend(*(id *)(a1 + 32), "setSubscribeRetryTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "initialStatusKitCloudKitImportTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "suspend");

    objc_msgSend(*(id *)(a1 + 32), "setInitialStatusKitCloudKitImportTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "publishRetryTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "suspend");

    objc_msgSend(*(id *)(a1 + 32), "setPublishRetryTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_stopPostRegainNetworkConnectivityTimer");
    objc_msgSend(*(id *)(a1 + 32), "_stopAssertionLogTimer");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastConnectivityChangeTimestamp:", v12);

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 24);
    *(_QWORD *)(v14 + 24) = v13;

    objc_msgSend(*(id *)(a1 + 32), "_unsubscribeFromStatusKitWithIsRetry:", 0);
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Presence channel already stopped", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

void __25__HMDStatusChannel_start__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "started");
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Presence channel already started", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "channelName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "netMonitor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "isReachable");
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Starting Presence Channel %@ with NetMonitor reachable: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "setStarted:", 1);
    objc_msgSend(*(id *)(a1 + 32), "unsubscribeRetryTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "suspend");

    objc_msgSend(*(id *)(a1 + 32), "setUnsubscribeRetryTimer:", 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastConnectivityChangeTimestamp:", v13);

    objc_msgSend(*(id *)(a1 + 32), "_checkForInitialStatusKitCloudKitImportAndSubscribe");
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22 != -1)
    dispatch_once(&logCategory__hmf_once_t22, &__block_literal_global_17086);
  return (id)logCategory__hmf_once_v23;
}

void __31__HMDStatusChannel_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v23;
  logCategory__hmf_once_v23 = v0;

}

@end
