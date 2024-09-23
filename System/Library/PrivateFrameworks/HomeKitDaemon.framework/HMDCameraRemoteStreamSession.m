@implementation HMDCameraRemoteStreamSession

- (HMDCameraRemoteStreamSession)initWithSessionID:(id)a3 reachabilityPath:(unint64_t)a4 streamSender:(id)a5 streamReceiver:(id)a6 remoteCapabilities:(id)a7 streamPreference:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  HMDCameraRemoteStreamSession *v23;
  objc_super v25;

  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a7;
  v19 = a3;
  v20 = isWatch();
  v21 = 4;
  if (a4 != 3)
    v21 = 1;
  if (a4 == 2)
    v21 = 3;
  if (v20)
    v22 = 0;
  else
    v22 = v21;
  v25.receiver = self;
  v25.super_class = (Class)HMDCameraRemoteStreamSession;
  v23 = -[HMDCameraStreamSession initWithSessionID:streamingTierType:remoteCapabilities:streamPreference:](&v25, sel_initWithSessionID_streamingTierType_remoteCapabilities_streamPreference_, v19, v22, v18, v17);

  if (v23)
  {
    objc_storeStrong((id *)&v23->_streamSender, a5);
    objc_storeStrong((id *)&v23->_streamReceiver, a6);
    v23->_streamState = 1;
  }

  return v23;
}

- (void)dealloc
{
  void *v3;
  HMDCameraRemoteStreamSession *v4;
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
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@is being deallocated", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraRemoteStreamSession;
  -[HMDCameraRemoteStreamSession dealloc](&v7, sel_dealloc);
}

- (void)updateState:(int64_t)a3
{
  void *v5;
  HMDCameraRemoteStreamSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRemoteStreamSession stateAsString](v6, "stateAsString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMDCameraRemoteStreamSessionStateAsString(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating state %@ with %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraRemoteStreamSession setStreamState:](v6, "setStreamState:", -[HMDCameraRemoteStreamSession streamState](v6, "streamState") | a3);
}

- (BOOL)containsState:(int64_t)a3
{
  return (-[HMDCameraRemoteStreamSession streamState](self, "streamState") & a3) != 0;
}

- (id)stateAsString
{
  void *v3;
  unint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  do
  {
    if (-[HMDCameraRemoteStreamSession containsState:](self, "containsState:", v4))
    {
      HMDCameraRemoteStreamSessionStateAsString(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), v5);

    }
    v6 = v4 >= 9;
    v4 *= 2;
  }
  while (!v6);
  return v3;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraStreamSession sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDCameraRemoteStreamSenderProtocol)streamSender
{
  return (HMDCameraRemoteStreamSenderProtocol *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCameraRemoteStreamReceiverProtocol)streamReceiver
{
  return (HMDCameraRemoteStreamReceiverProtocol *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)streamState
{
  return self->_streamState;
}

- (void)setStreamState:(unint64_t)a3
{
  self->_streamState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamReceiver, 0);
  objc_storeStrong((id *)&self->_streamSender, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_130353 != -1)
    dispatch_once(&logCategory__hmf_once_t2_130353, &__block_literal_global_130354);
  return (id)logCategory__hmf_once_v3_130355;
}

void __43__HMDCameraRemoteStreamSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_130355;
  logCategory__hmf_once_v3_130355 = v0;

}

@end
