@implementation HMDCameraLocalStreamSession

- (HMDCameraLocalStreamSession)initWithSessionID:(id)a3 reachabilityPath:(unint64_t)a4 streamSender:(id)a5 remoteCapabilities:(id)a6 localNetworkConfig:(id)a7 streamPreference:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  HMDCameraLocalStreamSession *v19;
  HMDCameraLocalStreamSession *v20;
  HMDCameraMediaParameterSelection *v21;
  HMDCameraMediaParameterSelection *parameterSelection;
  objc_super v24;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (isWatch())
  {
    v18 = 0;
  }
  else if (isiPadDevice() || isAppleTV())
  {
    v18 = 2;
  }
  else
  {
    v18 = 1;
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDCameraLocalStreamSession;
  v19 = -[HMDCameraStreamSession initWithSessionID:streamingTierType:remoteCapabilities:streamPreference:](&v24, sel_initWithSessionID_streamingTierType_remoteCapabilities_streamPreference_, v13, v18, v15, v17);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_streamSender, a5);
    v20->_streamState = 1;
    v21 = -[HMDCameraParameterSelection initWithSessionID:]([HMDCameraMediaParameterSelection alloc], "initWithSessionID:", v13);
    parameterSelection = v20->_parameterSelection;
    v20->_parameterSelection = v21;

    objc_storeStrong((id *)&v20->_localNetworkConfig, a7);
  }

  return v20;
}

- (void)dealloc
{
  void *v3;
  HMDCameraLocalStreamSession *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@is being deallocated", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraLocalStreamSession;
  -[HMDCameraLocalStreamSession dealloc](&v7, sel_dealloc);
}

- (void)updateState:(int64_t)a3
{
  void *v5;
  HMDCameraLocalStreamSession *v6;
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

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraLocalStreamSession stateAsString](v6, "stateAsString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMDCameraLocalStreamSessionStateAsString(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating state %@ with %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraLocalStreamSession setStreamState:](v6, "setStreamState:", -[HMDCameraLocalStreamSession streamState](v6, "streamState") | a3);
}

- (BOOL)containsState:(int64_t)a3
{
  return (-[HMDCameraLocalStreamSession streamState](self, "streamState") & a3) != 0;
}

- (id)stateAsString
{
  void *v3;
  unint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  do
  {
    if (-[HMDCameraLocalStreamSession containsState:](self, "containsState:", v4))
    {
      HMDCameraLocalStreamSessionStateAsString(v4);
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

- (HMDCameraMediaParameterSelection)parameterSelection
{
  return (HMDCameraMediaParameterSelection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setParameterSelection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (unint64_t)streamState
{
  return self->_streamState;
}

- (void)setStreamState:(unint64_t)a3
{
  self->_streamState = a3;
}

- (HMDCameraNetworkConfig)localNetworkConfig
{
  return (HMDCameraNetworkConfig *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localNetworkConfig, 0);
  objc_storeStrong((id *)&self->_parameterSelection, 0);
  objc_storeStrong((id *)&self->_streamSender, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_158879 != -1)
    dispatch_once(&logCategory__hmf_once_t2_158879, &__block_literal_global_158880);
  return (id)logCategory__hmf_once_v3_158881;
}

void __42__HMDCameraLocalStreamSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_158881;
  logCategory__hmf_once_v3_158881 = v0;

}

@end
