@implementation HMDCameraRecordingSessionRetryContext

- (HMDCameraRecordingSessionRetryContext)initWithWorkQueue:(id)a3 homePresenceByPairingIdentity:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMDCameraRecordingSessionRetryContext *v10;

  v6 = (void *)MEMORY[0x24BE3F248];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDCameraRecordingSessionRetryContext initWithWorkQueue:homePresenceByPairingIdentity:preferences:](self, "initWithWorkQueue:homePresenceByPairingIdentity:preferences:", v8, v7, v9);

  return v10;
}

- (HMDCameraRecordingSessionRetryContext)initWithWorkQueue:(id)a3 homePresenceByPairingIdentity:(id)a4 preferences:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCameraRecordingSessionRetryContext *v12;
  HMDCameraRecordingSessionRetryContext *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  HMDCameraRecordingSessionRetryContext *v21;
  NSObject *v22;
  void *v23;
  double retryInterval;
  double maxRetryInterval;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HMDCameraRecordingSessionRetryContext;
  v12 = -[HMDCameraRecordingSessionRetryContext init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeStrong((id *)&v13->_homePresenceByPairingIdentity, a4);
    objc_msgSend(v11, "preferenceForKey:", CFSTR("recordingSessionInitialRetryInterval"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v13->_retryInterval = v16;

    objc_msgSend(v11, "preferenceForKey:", CFSTR("recordingSessionMaxRetryInterval"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v13->_maxRetryInterval = v19;

    v20 = (void *)MEMORY[0x227676638]();
    v21 = v13;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      retryInterval = v13->_retryInterval;
      maxRetryInterval = v13->_maxRetryInterval;
      *(_DWORD *)buf = 138543874;
      v29 = v23;
      v30 = 2048;
      v31 = retryInterval;
      v32 = 2048;
      v33 = maxRetryInterval;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Recording session retry interval is: %f and max retry interval is: %f", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
  }

  return v13;
}

- (void)setRetryInterval:(double)a3
{
  NSObject *v5;

  -[HMDCameraRecordingSessionRetryContext workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_retryInterval = a3;
}

- (double)retryInterval
{
  NSObject *v3;

  -[HMDCameraRecordingSessionRetryContext workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_retryInterval;
}

- (void)computeNextRetryInterval
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[HMDCameraRecordingSessionRetryContext workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingSessionRetryContext retryInterval](self, "retryInterval");
  v5 = v4;
  -[HMDCameraRecordingSessionRetryContext maxRetryInterval](self, "maxRetryInterval");
  if (v5 < v6)
  {
    -[HMDCameraRecordingSessionRetryContext retryInterval](self, "retryInterval");
    -[HMDCameraRecordingSessionRetryContext setRetryInterval:](self, "setRetryInterval:", v7 + v7);
  }
}

- (NSDictionary)homePresenceByPairingIdentity
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (double)maxRetryInterval
{
  return self->_maxRetryInterval;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_homePresenceByPairingIdentity, 0);
}

@end
