@implementation HMDCameraStreamSession

- (HMDCameraStreamSession)initWithSessionID:(id)a3 streamingTierType:(unint64_t)a4 remoteCapabilities:(id)a5 streamPreference:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDCameraStreamSession *v14;
  HMDCameraStreamSession *v15;
  HMDCameraProtocolParameters *v16;
  HMDCameraProtocolParameters *protocolParameters;
  HMDStreamingCapabilities *v18;
  HMDStreamingCapabilities *streamingCapabilities;
  void *v20;
  void *v21;
  HMDStreamingCapabilities *v22;
  HMDCameraStreamSession *v23;
  NSObject *v24;
  HMDCameraVideoTierParameters *v25;
  HMDCameraVideoTierParameters *videoTierParameters;
  void *v27;
  HMDCameraStreamSession *v28;
  NSObject *v29;
  void *v30;
  HMDStreamingCapabilities *v31;
  void *v33;
  void *context;
  id v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  HMDStreamingCapabilities *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v36.receiver = self;
  v36.super_class = (Class)HMDCameraStreamSession;
  v14 = -[HMDCameraStreamSession init](&v36, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sessionID, a3);
    v16 = objc_alloc_init(HMDCameraProtocolParameters);
    protocolParameters = v15->_protocolParameters;
    v15->_protocolParameters = v16;

    v18 = -[HMDStreamingCapabilities initWithStreamPreference:]([HMDStreamingCapabilities alloc], "initWithStreamPreference:", v13);
    streamingCapabilities = v15->_streamingCapabilities;
    v15->_streamingCapabilities = v18;

    -[HMDStreamingCapabilities setStreamingTierType:](v15->_streamingCapabilities, "setStreamingTierType:", a4);
    objc_msgSend(v12, "hmf_dataForKey:", CFSTR("kRemoteStreamCapabilities"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v35 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v20, &v35);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (HMDStreamingCapabilities *)v35;
      if (v21)
      {
        -[HMDStreamingCapabilities updateWithRemoteSettings:](v15->_streamingCapabilities, "updateWithRemoteSettings:", v21);
      }
      else
      {
        context = (void *)MEMORY[0x1D17BA0A0]();
        v23 = v15;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v33;
          v39 = 2112;
          v40 = v22;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive remote streaming capabilities from remote capabilities data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
      }

    }
    v25 = -[HMDCameraVideoTierParameters initWithSessionID:streamingCapabilities:]([HMDCameraVideoTierParameters alloc], "initWithSessionID:streamingCapabilities:", v11, v15->_streamingCapabilities);
    videoTierParameters = v15->_videoTierParameters;
    v15->_videoTierParameters = v25;

    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = v15;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v15->_streamingCapabilities;
      *(_DWORD *)buf = 138543618;
      v38 = v30;
      v39 = 2112;
      v40 = v31;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Initialized stream session with capabilities: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);

  }
  return v15;
}

- (id)negotiatedParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB36F8];
  -[HMDCameraStreamSession protocolParameters](self, "protocolParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB36F8];
  -[HMDCameraStreamSession videoTierParameters](self, "videoTierParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v5)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v12[0] = CFSTR("kSelectedStreamParameters");
    v12[1] = CFSTR("kVideoTierParameters");
    v13[0] = v5;
    v13[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
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

- (HMDCameraStreamSessionID)sessionID
{
  return self->_sessionID;
}

- (HMDCameraStreamManager)streamManager
{
  return self->_streamManager;
}

- (void)setStreamManager:(id)a3
{
  objc_storeStrong((id *)&self->_streamManager, a3);
}

- (HMDStreamingCapabilities)streamingCapabilities
{
  return self->_streamingCapabilities;
}

- (HMDCameraProtocolParameters)protocolParameters
{
  return self->_protocolParameters;
}

- (void)setProtocolParameters:(id)a3
{
  objc_storeStrong((id *)&self->_protocolParameters, a3);
}

- (HMDCameraVideoTierParameters)videoTierParameters
{
  return self->_videoTierParameters;
}

- (void)setVideoTierParameters:(id)a3
{
  objc_storeStrong((id *)&self->_videoTierParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoTierParameters, 0);
  objc_storeStrong((id *)&self->_protocolParameters, 0);
  objc_storeStrong((id *)&self->_streamingCapabilities, 0);
  objc_storeStrong((id *)&self->_streamManager, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_168615 != -1)
    dispatch_once(&logCategory__hmf_once_t2_168615, &__block_literal_global_168616);
  return (id)logCategory__hmf_once_v3_168617;
}

void __37__HMDCameraStreamSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_168617;
  logCategory__hmf_once_v3_168617 = v0;

}

@end
