@implementation HMDCameraMediaParameterSelection

- (BOOL)findBestMatchWithProtocolParameters:(id)a3 streamingCapabilities:(id)a4 videoTierParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDCameraVideoParameterSelection *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCameraVideoParameterSelection *v15;
  HMDCameraAudioParameterSelection *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCameraAudioParameterSelection *v20;
  BOOL v21;
  void *v22;
  HMDCameraMediaParameterSelection *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDCameraMediaParameterSelection *v27;
  NSObject *v28;
  void *v29;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [HMDCameraVideoParameterSelection alloc];
  -[HMDCameraParameterSelection sessionID](self, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "supportedVideoStreamConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "supportedRTPConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDCameraVideoParameterSelection initWithSessionID:videoTierParameters:supportedVideoConfiguration:supportedRTPConfiguration:streamingCapabilities:](v11, "initWithSessionID:videoTierParameters:supportedVideoConfiguration:supportedRTPConfiguration:streamingCapabilities:", v12, v10, v13, v14, v9);

  if (-[HMDCameraVideoParameterSelection selectVideoParameters](v15, "selectVideoParameters"))
  {
    v16 = [HMDCameraAudioParameterSelection alloc];
    -[HMDCameraParameterSelection sessionID](self, "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supportedAudioStreamConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supportedRTPConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HMDCameraAudioParameterSelection initWithSessionID:supportedAudioConfiguration:supportedRTPConfiguration:streamingCapabilities:](v16, "initWithSessionID:supportedAudioConfiguration:supportedRTPConfiguration:streamingCapabilities:", v17, v18, v19, v9);

    v21 = -[HMDCameraAudioParameterSelection selectAudioParameters](v20, "selectAudioParameters");
    if (v21)
    {
      -[HMDCameraMediaParameterSelection setVideoParameterSelection:](self, "setVideoParameterSelection:", v15);
      -[HMDCameraMediaParameterSelection setAudioParameterSelection:](self, "setAudioParameterSelection:", v20);
    }
    else
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543362;
        v32 = v29;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to select audio config", (uint8_t *)&v31, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
    }

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
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to select video config", (uint8_t *)&v31, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v21 = 0;
  }

  return v21;
}

- (void)setSelectedEndPointSetupParameters:(id)a3 videoNetworkConfig:(id)a4 audioNetworkConfig:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDEndPointAddress *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDEndPointAddress *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDSetupEndPointWrite *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  HMDSetupEndPointWrite *v26;
  void *v27;
  HMDCameraMediaParameterSelection *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDCameraMediaParameterSelection *v32;
  NSObject *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [HMDEndPointAddress alloc];
  objc_msgSend(v9, "ipAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "ipv6");
  objc_msgSend(v9, "rtpPort");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rtpPort");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMDEndPointAddress initWithIPAddress:isIPv6Address:videoRTPPort:audioRTPPort:](v11, "initWithIPAddress:isIPv6Address:videoRTPPort:audioRTPPort:", v12, v13, v14, v15);

  -[HMDCameraMediaParameterSelection videoParameterSelection](self, "videoParameterSelection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "createSRTPParamters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HMDCameraMediaParameterSelection audioParameterSelection](self, "audioParameterSelection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createSRTPParamters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [HMDSetupEndPointWrite alloc];
      v22 = objc_alloc(MEMORY[0x24BDD1880]);
      -[HMDCameraParameterSelection sessionID](self, "sessionID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sessionID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v22, "initWithUUIDString:", v24);
      v26 = -[HMDSetupEndPointWrite initWithSessionIdentifier:address:videoSrtpParameters:audioSrtpParameters:](v21, "initWithSessionIdentifier:address:videoSrtpParameters:audioSrtpParameters:", v25, v16, v18, v20);

      objc_msgSend(v8, "setSetupEndPointWrite:", v26);
    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543362;
        v36 = v34;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audio SRTP parameters", (uint8_t *)&v35, 0xCu);

      }
      objc_autoreleasePoolPop(v31);
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543362;
      v36 = v30;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video SRTP parameters", (uint8_t *)&v35, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
  }

}

- (void)setSelectedConfigParameters:(id)a3
{
  id v4;
  HMDSessionControl *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDSelectedStreamConfigurationWrite *v14;
  HMDSessionControl *v15;

  v4 = a3;
  v5 = [HMDSessionControl alloc];
  v6 = objc_alloc(MEMORY[0x24BDD1880]);
  -[HMDCameraParameterSelection sessionID](self, "sessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithUUIDString:", v8);
  v15 = -[HMDSessionControl initWithCommand:sessionIdentifier:](v5, "initWithCommand:sessionIdentifier:", 1, v9);

  -[HMDCameraMediaParameterSelection videoParameterSelection](self, "videoParameterSelection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createSelectedVideoParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraMediaParameterSelection audioParameterSelection](self, "audioParameterSelection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createSelectedAudioParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HMDSelectedStreamConfigurationWrite initWithSessionControl:videoParameters:audioParameters:]([HMDSelectedStreamConfigurationWrite alloc], "initWithSessionControl:videoParameters:audioParameters:", v15, v11, v13);
  objc_msgSend(v4, "setSelectedStreamConfigurationWrite:", v14);

}

- (void)setReselectedConfigParameters:(id)a3 videoTier:(id)a4
{
  id v6;
  id v7;
  HMDSessionControl *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDReselectedStreamConfigurationWrite *v15;
  HMDSessionControl *v16;

  v6 = a4;
  v7 = a3;
  v8 = [HMDSessionControl alloc];
  v9 = objc_alloc(MEMORY[0x24BDD1880]);
  -[HMDCameraParameterSelection sessionID](self, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithUUIDString:", v11);
  v16 = -[HMDSessionControl initWithCommand:sessionIdentifier:](v8, "initWithCommand:sessionIdentifier:", 4, v12);

  -[HMDCameraMediaParameterSelection videoParameterSelection](self, "videoParameterSelection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createReselectedVideoParameters:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HMDReselectedStreamConfigurationWrite initWithSessionControl:videoParameters:]([HMDReselectedStreamConfigurationWrite alloc], "initWithSessionControl:videoParameters:", v16, v14);
  objc_msgSend(v7, "setReselectedStreamConfigurationWrite:", v15);

}

- (HMDCameraAudioParameterSelection)audioParameterSelection
{
  return self->_audioParameterSelection;
}

- (void)setAudioParameterSelection:(id)a3
{
  objc_storeStrong((id *)&self->_audioParameterSelection, a3);
}

- (HMDCameraVideoParameterSelection)videoParameterSelection
{
  return self->_videoParameterSelection;
}

- (void)setVideoParameterSelection:(id)a3
{
  objc_storeStrong((id *)&self->_videoParameterSelection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoParameterSelection, 0);
  objc_storeStrong((id *)&self->_audioParameterSelection, 0);
}

@end
