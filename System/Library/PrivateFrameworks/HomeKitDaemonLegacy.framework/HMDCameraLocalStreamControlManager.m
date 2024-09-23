@implementation HMDCameraLocalStreamControlManager

- (HMDCameraLocalStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 reachabilityPath:(unint64_t)a6 device:(id)a7 delegate:(id)a8 delegateQueue:(id)a9 accessory:(id)a10 streamManagementService:(id)a11 localNetworkConfig:(id)a12 remoteCapabilities:(id)a13 supportedConfigCache:(id)a14 streamPreference:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  HMDCameraLocalStreamControlManager *v29;
  NSObject *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  HMDCameraIDSSessionInitiator *v38;
  HMDCameraIDSSessionInitiator *v39;
  HMDCameraLocalStreamSession *v40;
  id v42;
  void *v43;
  id v44;
  void *v46;
  void *v47;
  id v48;
  HMDCameraLocalStreamControlManager *v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v51 = a4;
  v20 = a5;
  v48 = a7;
  v44 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  v27 = a15;
  if (!v19)
  {
    _HMFPreconditionFailure();
    goto LABEL_21;
  }
  if (!v51)
  {
LABEL_21:
    _HMFPreconditionFailure();
    goto LABEL_22;
  }
  if (!v20)
  {
LABEL_22:
    _HMFPreconditionFailure();
    goto LABEL_23;
  }
  if (!a6)
  {
LABEL_23:
    _HMFPreconditionFailure();
    goto LABEL_24;
  }
  if (!v21)
  {
LABEL_24:
    _HMFPreconditionFailure();
    goto LABEL_25;
  }
  if (!v22)
  {
LABEL_25:
    _HMFPreconditionFailure();
    goto LABEL_26;
  }
  if (!v23)
  {
LABEL_26:
    _HMFPreconditionFailure();
    goto LABEL_27;
  }
  if (!v25)
  {
LABEL_27:
    _HMFPreconditionFailure();
LABEL_28:
    _HMFPreconditionFailure();
  }
  if (!v26)
    goto LABEL_28;
  v43 = v27;
  v46 = v23;
  v47 = v20;
  v28 = (void *)MEMORY[0x1D17BA0A0]();
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = v22;
    v32 = v21;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v33;
    v54 = 2112;
    v55 = v24;
    _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Local network config: %@", buf, 0x16u);

    v21 = v32;
    v22 = v31;
  }

  objc_autoreleasePoolPop(v28);
  if (v48)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isResidentCapable");

    v36 = v22;
    if (v35)
    {
      v37 = v21;
      v38 = -[HMDCameraIDSSessionInitiator initWithSessionID:workQueue:device:localNetworkConfig:delegate:delegateQueue:]([HMDCameraIDSSessionInitiator alloc], "initWithSessionID:workQueue:device:localNetworkConfig:delegate:delegateQueue:", v19, v51, v48, v24, v29, v51);
    }
    else
    {
      if (!isiOSDevice())
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot relay stream from current device"), 0);
        v42 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v42);
      }
      v37 = v21;
      v38 = -[HMDCameraIDSDeviceConnectionSender initWithSessionID:workQueue:device:delegate:delegateQueue:]([HMDCameraIDSDeviceConnectionSender alloc], "initWithSessionID:workQueue:device:delegate:delegateQueue:", v19, v51, v48, v29, v51);
    }
    v39 = v38;
  }
  else
  {
    v36 = v22;
    v37 = v21;
    v39 = 0;
  }
  v40 = -[HMDCameraLocalStreamSession initWithSessionID:reachabilityPath:streamSender:remoteCapabilities:localNetworkConfig:streamPreference:]([HMDCameraLocalStreamSession alloc], "initWithSessionID:reachabilityPath:streamSender:remoteCapabilities:localNetworkConfig:streamPreference:", v19, a6, v39, v25, v24, v43);
  v50 = -[HMDCameraLocalStreamControlManager initWithSessionID:workQueue:streamSnapshotHandler:delegate:delegateQueue:accessory:streamManagementService:supportedConfigCache:streamSession:](v29, "initWithSessionID:workQueue:streamSnapshotHandler:delegate:delegateQueue:accessory:streamManagementService:supportedConfigCache:streamSession:", v19, v51, v47, v44, v37, v36, v46, v26, v40);

  return v50;
}

- (HMDCameraLocalStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 accessory:(id)a8 streamManagementService:(id)a9 supportedConfigCache:(id)a10 streamSession:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  HMDCameraSupportedConfigurationCache *v24;
  HMDCameraLocalStreamSession *v25;
  HMDCameraLocalStreamSession *v26;
  HMDCameraLocalStreamControlManager *v27;
  void *v28;
  HMDCameraSupportedConfigurationCache *supportedConfigCache;
  HMDCameraSupportedConfigurationCache *v30;
  HMDCameraLocalStreamSession *streamSession;
  HMDCameraLocalStreamSession *v32;
  HMDCameraMediaConfigGenerator *v33;
  HMDCameraMediaConfigGenerator *configGenerator;
  HMDCameraLocalStreamControlManager *result;
  HMDCameraLocalStreamControlManager *v36;
  SEL v37;
  void *v38;
  objc_super v39;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = (HMDCameraSupportedConfigurationCache *)a10;
  v25 = (HMDCameraLocalStreamSession *)a11;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v18)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v19)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v21)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v22)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v23)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v24)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  v26 = v25;
  if (v25)
  {
    v39.receiver = self;
    v39.super_class = (Class)HMDCameraLocalStreamControlManager;
    v27 = -[HMDCameraStreamControlManager initWithSessionID:workQueue:streamSnapshotHandler:delegate:delegateQueue:accessory:streamManagementService:isLocal:](&v39, sel_initWithSessionID_workQueue_streamSnapshotHandler_delegate_delegateQueue_accessory_streamManagementService_isLocal_, v17, v18, v19, v20, v21, v22, v23, 1);
    v38 = v17;
    v28 = v20;
    supportedConfigCache = v27->_supportedConfigCache;
    v27->_supportedConfigCache = v24;
    v30 = v24;

    streamSession = v27->_streamSession;
    v27->_streamSession = v26;
    v32 = v26;

    v33 = objc_alloc_init(HMDCameraMediaConfigGenerator);
    configGenerator = v27->_configGenerator;
    v27->_configGenerator = v33;

    return v27;
  }
LABEL_17:
  v36 = (HMDCameraLocalStreamControlManager *)_HMFPreconditionFailure();
  -[HMDCameraLocalStreamControlManager dealloc](v36, v37);
  return result;
}

- (void)dealloc
{
  void *v3;
  HMDCameraLocalStreamControlManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@is being deallocated, stopping stream", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1039);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraLocalStreamControlManager _stopCurrentStreamSessionWithError:](v4, "_stopCurrentStreamSessionWithError:", v7);

  v8.receiver = v4;
  v8.super_class = (Class)HMDCameraLocalStreamControlManager;
  -[HMDCameraLocalStreamControlManager dealloc](&v8, sel_dealloc);
}

- (NSNumber)slotIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slotIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (unint64_t)audioStreamSetting
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "audioStreamSetting");

  return v4;
}

- (NSNumber)aspectRatio
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aspectRatio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (BOOL)isSendingStream
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamSender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setUpRemoteConnectionWithDevice:(id)a3
{
  id v4;
  void *v5;
  HMDCameraLocalStreamControlManager *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Remote setup - this should not be called", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)updateAudioSetting:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDCameraStreamControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HMDCameraLocalStreamControlManager_updateAudioSetting___block_invoke;
  v6[3] = &unk_1E89C0B98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

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
  -[HMDCameraStreamControlManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HMDCameraLocalStreamControlManager_updateAudioVolume_callback___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)negotiateStream
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDCameraStreamControlManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HMDCameraLocalStreamControlManager_negotiateStream__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_negotiateStream
{
  void *v3;
  HMDCameraLocalStreamControlManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCameraLocalStreamControlManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDCameraLocalStreamControlManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCameraLocalStreamControlManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDCameraLocalStreamControlManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 138543362;
    v48 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Received a request to negotiate video stream", (uint8_t *)&v47, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraLocalStreamControlManager streamSession](v4, "streamSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "streamSender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openRelaySession");

  -[HMDCameraLocalStreamControlManager supportedConfigCache](v4, "supportedConfigCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v9, "isValid");

  if ((_DWORD)v8)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v4;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543362;
      v48 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Supported config cache is valid, using it", (uint8_t *)&v47, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDCameraLocalStreamControlManager supportedConfigCache](v11, "supportedConfigCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "supportedVideoStreamConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraLocalStreamControlManager streamSession](v11, "streamSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "protocolParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSupportedVideoStreamConfiguration:", v15);

    -[HMDCameraLocalStreamControlManager supportedConfigCache](v11, "supportedConfigCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "supportedAudioStreamConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraLocalStreamControlManager streamSession](v11, "streamSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "protocolParameters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSupportedAudioStreamConfiguration:", v19);

    -[HMDCameraLocalStreamControlManager supportedConfigCache](v11, "supportedConfigCache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "supportedRTPConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraLocalStreamControlManager streamSession](v11, "streamSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "protocolParameters");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSupportedRTPConfiguration:", v23);

    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = v11;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraLocalStreamControlManager streamSession](v27, "streamSession");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "protocolParameters");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "supportedVideoStreamConfiguration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v29;
      v49 = 2112;
      v50 = v32;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Cached supportedVideoConfiguration: %@", (uint8_t *)&v47, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = v27;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraLocalStreamControlManager streamSession](v34, "streamSession");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "protocolParameters");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "supportedAudioStreamConfiguration");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v36;
      v49 = 2112;
      v50 = v39;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Cached supportedAudioConfiguration: %@", (uint8_t *)&v47, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    v40 = (void *)MEMORY[0x1D17BA0A0]();
    v41 = v34;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraLocalStreamControlManager streamSession](v41, "streamSession");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "protocolParameters");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "supportedRTPConfiguration");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v43;
      v49 = 2112;
      v50 = v46;
      _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Cached supportedRTPConfiguration: %@", (uint8_t *)&v47, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    -[HMDCameraLocalStreamControlManager _writeSetupEndPoint](v41, "_writeSetupEndPoint");
  }
  else
  {
    -[HMDCameraLocalStreamControlManager _getSupportedConfigurations](v4, "_getSupportedConfigurations");
  }
}

- (void)_getSupportedConfigurations
{
  void *v3;
  HMDCameraLocalStreamControlManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Getting Supported Configuration", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraStreamControlManager accessory](v4, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    -[HMDCameraStreamControlManager streamManagementService](v4, "streamManagementService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "findCharacteristicWithType:", *MEMORY[0x1E0D16018]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraStreamControlManager streamManagementService](v4, "streamManagementService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "findCharacteristicWithType:", *MEMORY[0x1E0D16020]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraStreamControlManager streamManagementService](v4, "streamManagementService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "findCharacteristicWithType:", *MEMORY[0x1E0D16010]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v19);

    objc_initWeak((id *)buf, v4);
    -[HMDCameraStreamControlManager workQueue](v4, "workQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__HMDCameraLocalStreamControlManager__getSupportedConfigurations__block_invoke;
    v21[3] = &unk_1E89C17B0;
    objc_copyWeak(&v22, (id *)buf);
    objc_msgSend(v9, "readCharacteristicValues:source:queue:completionHandler:", v16, 7, v20, v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    -[HMDCameraStreamControlManager _reportInternalErrorCode:](v4, "_reportInternalErrorCode:", 1011);
  }

}

- (void)_handleSupportedParameters:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  HMDSupportedVideoStreamConfiguration *v26;
  HMDSupportedAudioStreamConfiguration *v27;
  HMDSupportedRTPConfiguration *v28;
  HMDSupportedRTPConfiguration *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCameraLocalStreamControlManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDCameraLocalStreamControlManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDCameraLocalStreamControlManager *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  HMDCameraLocalStreamControlManager *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  HMDCameraLocalStreamControlManager *v56;
  NSObject *v57;
  void *v58;
  HMDCameraLocalStreamControlManager *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id obj;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  HMDSupportedRTPConfiguration *v74;
  _BYTE v75[128];
  uint64_t v76;

  v59 = self;
  v76 = *MEMORY[0x1E0C80C00];
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (v3)
  {
    v4 = v3;
    v66 = 0;
    v62 = 0;
    v64 = 0;
    v5 = *(_QWORD *)v68;
    v63 = *MEMORY[0x1E0D16020];
    v61 = *MEMORY[0x1E0D16010];
    v60 = *MEMORY[0x1E0D16018];
    while (1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v68 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v7, "value", v59);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v7, "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "request");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "characteristic");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "type");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v63);

          if ((v14 & 1) != 0)
          {
            v15 = v64;
            v16 = v66;
            v64 = v10;
            goto LABEL_12;
          }
          objc_msgSend(v7, "request");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "characteristic");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "type");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", v61);

          if ((v20 & 1) != 0)
          {
            v15 = v62;
            v16 = v66;
            v62 = v10;
            goto LABEL_12;
          }
          objc_msgSend(v7, "request");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "characteristic");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "type");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", v60);

          v15 = v66;
          v16 = v10;
          if (v24)
          {
LABEL_12:
            v25 = v10;

            v66 = v16;
          }

          continue;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      if (!v4)
        goto LABEL_18;
    }
  }
  v66 = 0;
  v62 = 0;
  v64 = 0;
LABEL_18:

  if (v66 && v64 && v62)
  {
    v26 = -[HAPTLVBase initWithTLVData:]([HMDSupportedVideoStreamConfiguration alloc], "initWithTLVData:", v64);
    v27 = -[HAPTLVBase initWithTLVData:]([HMDSupportedAudioStreamConfiguration alloc], "initWithTLVData:", v62);
    v28 = -[HAPTLVBase initWithTLVData:]([HMDSupportedRTPConfiguration alloc], "initWithTLVData:", v66);
    v29 = v28;
    if (v26 && v27 && v28)
    {
      -[HMDCameraLocalStreamControlManager streamSession](v59, "streamSession");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "protocolParameters");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setSupportedVideoStreamConfiguration:", v26);

      -[HMDCameraLocalStreamControlManager supportedConfigCache](v59, "supportedConfigCache");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setSupportedVideoStreamConfiguration:", v26);

      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = v59;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v36;
        v73 = 2112;
        v74 = (HMDSupportedRTPConfiguration *)v26;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Updating supportedVideoConfiguration: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      -[HMDCameraLocalStreamControlManager streamSession](v34, "streamSession");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "protocolParameters");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setSupportedAudioStreamConfiguration:", v27);

      -[HMDCameraLocalStreamControlManager supportedConfigCache](v34, "supportedConfigCache");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setSupportedAudioStreamConfiguration:", v27);

      v40 = (void *)MEMORY[0x1D17BA0A0]();
      v41 = v34;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v43;
        v73 = 2112;
        v74 = (HMDSupportedRTPConfiguration *)v27;
        _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Updating supportedAudioConfiguration: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
      -[HMDCameraLocalStreamControlManager streamSession](v41, "streamSession");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "protocolParameters");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setSupportedRTPConfiguration:", v29);

      -[HMDCameraLocalStreamControlManager supportedConfigCache](v41, "supportedConfigCache");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setSupportedRTPConfiguration:", v29);

      v47 = (void *)MEMORY[0x1D17BA0A0]();
      v48 = v41;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v50;
        v73 = 2112;
        v74 = v29;
        _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_INFO, "%{public}@Updating supportedRTPConfiguration: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v47);
      -[HMDCameraLocalStreamControlManager _writeSetupEndPoint](v48, "_writeSetupEndPoint");
    }
    else
    {
      v55 = (void *)MEMORY[0x1D17BA0A0]();
      v56 = v59;
      HMFGetOSLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v72 = v58;
        _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_ERROR, "%{public}@Response from accessory is not valid for at least one configuration", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v55);
      -[HMDCameraStreamControlManager _reportInternalErrorCode:](v56, "_reportInternalErrorCode:", 1040);
    }

  }
  else
  {
    v51 = (void *)MEMORY[0x1D17BA0A0]();
    v52 = v59;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v54;
      _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_ERROR, "%{public}@Accessory did not respond to all requests", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v51);
    -[HMDCameraStreamControlManager _reportErrorCode:](v52, "_reportErrorCode:", 50);
  }

}

- (void)_writeSetupEndPoint
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCameraStreamManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraStreamManager *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCameraLocalStreamControlManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  HMDCameraLocalStreamControlManager *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  HMDCameraLocalStreamControlManager *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  HMDCameraLocalStreamControlManager *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[5];
  id v72;
  void *v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localNetworkConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");

  v6 = (void *)v5;
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localNetworkConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v8, "copy");

  v9 = [HMDCameraStreamManager alloc];
  -[HMDCameraStreamControlManager sessionID](self, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager streamSnapshotHandler](self, "streamSnapshotHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager workQueue](self, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager workQueue](self, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "streamSender");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMDCameraStreamManager initWithSessionID:streamSnapshotHandler:workQueue:delegate:delegateQueue:localVideoNetworkConfig:localAudioNetworkConfig:sessionHandler:](v9, "initWithSessionID:streamSnapshotHandler:workQueue:delegate:delegateQueue:localVideoNetworkConfig:localAudioNetworkConfig:sessionHandler:", v10, v11, v12, self, v13, v6, v70, v15);
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setStreamManager:", v16);

  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "streamManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "parameterSelection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "protocolParameters");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "streamingCapabilities");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "videoTierParameters");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v6;
    v28 = objc_msgSend(v21, "findBestMatchWithProtocolParameters:streamingCapabilities:videoTierParameters:", v23, v25, v27);

    if ((v28 & 1) != 0)
    {
      -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
      v6 = v69;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "parameterSelection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "protocolParameters");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setSelectedEndPointSetupParameters:videoNetworkConfig:audioNetworkConfig:", v32, v69, v70);

      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraLocalStreamControlManager streamSession](v34, "streamSession");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "protocolParameters");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setupEndPointWrite");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v75 = v36;
        v76 = 2112;
        v77 = v39;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Writing setup endpoint characteristic value: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      -[HMDCameraLocalStreamControlManager streamSession](v34, "streamSession");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "protocolParameters");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setupEndPointWrite");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42 == 0;

      if (v43)
      {
        v65 = (void *)MEMORY[0x1D17BA0A0]();
        v66 = v34;
        HMFGetOSLogHandle();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v75 = v68;
          _os_log_impl(&dword_1CD062000, v67, OS_LOG_TYPE_ERROR, "%{public}@Could not select the end point setup parameters", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v65);
        -[HMDCameraStreamControlManager _reportInternalErrorCode:](v66, "_reportInternalErrorCode:", 1041);
      }
      else
      {
        -[HMDCameraStreamControlManager accessory](v34, "accessory");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v45 = v44;
        else
          v45 = 0;
        v46 = v45;

        if (v46)
        {
          -[HMDCameraStreamControlManager streamManagementService](v34, "streamManagementService");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "findCharacteristicWithType:", *MEMORY[0x1E0D15FF8]);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          -[HMDCameraLocalStreamControlManager streamSession](v34, "streamSession");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "protocolParameters");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setupEndPointWrite");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "tlvData");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v48, v52, 0, 0);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          objc_initWeak((id *)buf, v34);
          v73 = v53;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlManager workQueue](v34, "workQueue");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v71[0] = MEMORY[0x1E0C809B0];
          v71[1] = 3221225472;
          v71[2] = __57__HMDCameraLocalStreamControlManager__writeSetupEndPoint__block_invoke;
          v71[3] = &unk_1E89C18A8;
          objc_copyWeak(&v72, (id *)buf);
          v71[4] = v34;
          objc_msgSend(v46, "writeCharacteristicValues:source:queue:completionHandler:", v54, 7, v55, v71);

          -[HMDCameraLocalStreamControlManager streamSession](v34, "streamSession");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "updateState:", 2);

          objc_destroyWeak(&v72);
          objc_destroyWeak((id *)buf);

        }
        else
        {
          -[HMDCameraStreamControlManager _reportInternalErrorCode:](v34, "_reportInternalErrorCode:", 1011);
        }

      }
    }
    else
    {
      v61 = (void *)MEMORY[0x1D17BA0A0]();
      v62 = self;
      HMFGetOSLogHandle();
      v6 = v69;
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v75 = v64;
        _os_log_impl(&dword_1CD062000, v63, OS_LOG_TYPE_ERROR, "%{public}@Could not find the right match in the supported list", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v61);
      -[HMDCameraStreamControlManager _reportInternalErrorCode:](v62, "_reportInternalErrorCode:", 1044);
    }
  }
  else
  {
    v57 = (void *)MEMORY[0x1D17BA0A0]();
    v58 = self;
    HMFGetOSLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v75 = v60;
      _os_log_impl(&dword_1CD062000, v59, OS_LOG_TYPE_ERROR, "%{public}@Failed to create stream manager for local stream", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v57);
    -[HMDCameraStreamControlManager _reportInternalErrorCode:](v58, "_reportInternalErrorCode:", 1015);
  }

}

- (void)_sendSetupEndPointRead
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCameraLocalStreamControlManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDCameraStreamControlManager accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[HMDCameraStreamControlManager streamManagementService](self, "streamManagementService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findCharacteristicWithType:", *MEMORY[0x1E0D15FF8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Reading setup endpoint characteristic", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_initWeak((id *)buf, v11);
    -[HMDCameraStreamControlManager workQueue](v11, "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__HMDCameraLocalStreamControlManager__sendSetupEndPointRead__block_invoke;
    v15[3] = &unk_1E89C17B0;
    objc_copyWeak(&v16, (id *)buf);
    objc_msgSend(v5, "readCharacteristicValues:source:queue:completionHandler:", v8, 7, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    -[HMDCameraStreamControlManager _reportInternalErrorCode:](self, "_reportInternalErrorCode:", 1011);
  }

}

- (void)_handleSetupEndPointRead:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char isKindOfClass;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  HMDSetupEndPointRead *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDCameraLocalStreamControlManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDCameraLocalStreamControlManager *v27;
  NSObject *v28;
  void *v29;
  HMDSetupEndPointRead *v30;
  void *v31;
  HMDCameraLocalStreamControlManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  HMDCameraLocalStreamControlManager *v36;
  NSObject *v37;
  void *v38;
  HMDCameraLocalStreamControlManager *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDCameraLocalStreamControlManager *v48;
  NSObject *v49;
  void *v50;
  HMDCameraLocalStreamControlManager *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  HMDSetupEndPointRead *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v5)
  {
    v6 = v5;
    v51 = self;
    v53 = 0;
    v7 = *(_QWORD *)v55;
    v52 = *MEMORY[0x1E0D15FF8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v55 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v12 = v4;
          objc_msgSend(v9, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "request");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "characteristic");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "type");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v52);

          if (v17)
          {
            v18 = v13;

            v53 = v18;
          }

          v4 = v12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v6);

    self = v51;
    if (v53)
    {
      v19 = -[HAPTLVBase initWithTLVData:]([HMDSetupEndPointRead alloc], "initWithTLVData:", v53);
      if (v19)
      {
        -[HMDCameraLocalStreamControlManager streamSession](v51, "streamSession");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "protocolParameters");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setSetupEndPointRead:", v19);

        v22 = (void *)MEMORY[0x1D17BA0A0]();
        v23 = v51;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v25;
          v60 = 2112;
          v61 = v19;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Received setup endpoint read response: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        if (-[HMDSetupEndPointRead responseStatus](v19, "responseStatus"))
        {
          v26 = (void *)MEMORY[0x1D17BA0A0]();
          v27 = v23;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            HMDStreamControlPointResponseStatusAsString(-[HMDSetupEndPointRead responseStatus](v19, "responseStatus"));
            v30 = (HMDSetupEndPointRead *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v59 = v29;
            v60 = 2112;
            v61 = v30;
            _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Accessory setup endpoint read failed: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v26);
          -[HMDCameraStreamControlManager _reportErrorCode:](v27, "_reportErrorCode:", 14);
          goto LABEL_33;
        }
        if (-[HMDCameraLocalStreamControlManager _validateSetupEndPointReadWithWrite](v23, "_validateSetupEndPointReadWithWrite"))
        {
          -[HMDCameraLocalStreamControlManager streamSession](v23, "streamSession");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "parameterSelection");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraLocalStreamControlManager streamSession](v23, "streamSession");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "protocolParameters");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setSelectedConfigParameters:", v44);

          -[HMDCameraLocalStreamControlManager streamSession](v23, "streamSession");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "negotiatedParameters");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlManager _callStreamNegotiated:](v23, "_callStreamNegotiated:", v46);

LABEL_33:
          goto LABEL_34;
        }
        v47 = (void *)MEMORY[0x1D17BA0A0]();
        v48 = v23;
        HMFGetOSLogHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v59 = v50;
          _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_ERROR, "%{public}@Validation of setup endpoint failed", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v47);
        v39 = v48;
        v40 = 1043;
      }
      else
      {
        v35 = (void *)MEMORY[0x1D17BA0A0]();
        v36 = v51;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v59 = v38;
          _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to construct setup endpoint", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v35);
        v39 = v36;
        v40 = 1042;
      }
      -[HMDCameraStreamControlManager _reportInternalErrorCode:](v39, "_reportInternalErrorCode:", v40);
      goto LABEL_33;
    }
  }
  else
  {

  }
  v31 = (void *)MEMORY[0x1D17BA0A0]();
  v32 = self;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v59 = v34;
    _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Accessory did not respond to all requests", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v31);
  -[HMDCameraStreamControlManager _reportErrorCode:](v32, "_reportErrorCode:", 50);
LABEL_34:

}

- (BOOL)_validateSetupEndPointReadWithWrite
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  void *v19;
  HMDCameraLocalStreamControlManager *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  HMDCameraLocalStreamControlManager *v24;
  HMDCameraLocalStreamControlManager *v25;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "protocolParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setupEndPointRead");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protocolParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupEndPointWrite");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compatibleWithRemoteEndPoint:", v10);

  if ((v11 & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v22;
    v23 = "%{public}@Addresses are not matching";
LABEL_11:
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v27, 0xCu);

    goto LABEL_12;
  }
  objc_msgSend(v8, "videoSrtpParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoSrtpParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "compatibleWithRemoteEndPoint:", v13);

  if ((v14 & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v22;
    v23 = "%{public}@Video SRTP parameters are not matching";
    goto LABEL_11;
  }
  objc_msgSend(v8, "audioSrtpParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "audioSrtpParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "compatibleWithRemoteEndPoint:", v16);

  if ((v17 & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v22;
      v23 = "%{public}@Audio SRTP parameters are not matching";
      goto LABEL_11;
    }
LABEL_12:

    objc_autoreleasePoolPop(v19);
    v18 = 0;
    goto LABEL_13;
  }
  v18 = 1;
LABEL_13:

  return v18;
}

- (void)startStreamWithRemoteSettings:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraStreamControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HMDCameraLocalStreamControlManager_startStreamWithRemoteSettings___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_addServerStreamSession
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[HMDCameraStreamControlManager accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v5 = v3;

  if (v5)
  {
    HAPStringFromAccessoryServerSession();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerForSessionRestore:", v4);

  }
}

- (void)_removeServerStreamSession
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[HMDCameraStreamControlManager accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v5 = v3;

  if (v5)
  {
    HAPStringFromAccessoryServerSession();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deregisterFromSessionRestore:", v4);

  }
}

- (void)_startStreamWithRemoteSettings:(id)a3
{
  id v4;
  void *v5;
  HMDCameraLocalStreamControlManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDCameraLocalStreamControlManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  HMDCameraLocalStreamControlManager *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  const char *v42;
  void *v43;
  HMDCameraLocalStreamControlManager *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  HMDCameraLocalStreamControlManager *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v64 = v8;
    v65 = 2112;
    v66 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to start stream with remote settings: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDCameraLocalStreamControlManager isSendingStream](v6, "isSendingStream"))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v6;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Using the sync sources from remote settings", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kVideoStreamSSRC"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAudioStreamSSRC"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_14;
  }
  else
  {
    -[HMDCameraLocalStreamControlManager streamSession](v6, "streamSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "streamManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "videoStreamInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "syncSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraLocalStreamControlManager streamSession](v6, "streamSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "streamManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "audioStreamInterface");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "syncSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
LABEL_14:
      v43 = (void *)MEMORY[0x1D17BA0A0](-[HMDCameraStreamControlManager _reportInternalErrorCode:](v6, "_reportInternalErrorCode:", 1045));
      v44 = v6;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v64 = v46;
        _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_INFO, "%{public}@SSRC is nil, cannot select config parameters", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v43);
      goto LABEL_27;
    }
  }
  if (!v14)
    goto LABEL_14;
  -[HMDCameraLocalStreamControlManager streamSession](v6, "streamSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "updateState:", 8);

  -[HMDCameraLocalStreamControlManager _addServerStreamSession](v6, "_addServerStreamSession");
  -[HMDCameraLocalStreamControlManager streamSession](v6, "streamSession");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "protocolParameters");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "selectedStreamConfigurationWrite");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "videoParameters");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rtpParameters");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSynchronizationSource:", v13);

  -[HMDCameraLocalStreamControlManager streamSession](v6, "streamSession");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "protocolParameters");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "selectedStreamConfigurationWrite");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "audioParameters");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rtpParameters");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setSynchronizationSource:", v14);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kRemoteStreamMTU"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraLocalStreamControlManager _calculateMTU](v6, "_calculateMTU");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  v61 = v13;
  v62 = v4;
  if (v32)
  {
    v35 = objc_msgSend(v33, "unsignedIntegerValue");
    v36 = objc_msgSend(v32, "unsignedIntegerValue");
    v37 = (void *)MEMORY[0x1D17BA0A0]();
    v38 = v6;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
    if (v35 >= v36)
    {
      if (v40)
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v64 = v48;
        _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Remote MTU is provided, and is lower than local MTU", buf, 0xCu);

      }
      v47 = v32;
      goto LABEL_24;
    }
    if (v40)
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v41;
      v42 = "%{public}@Remote MTU is provided, but is higher than local MTU";
LABEL_19:
      _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, v42, buf, 0xCu);

    }
  }
  else
  {
    v37 = (void *)MEMORY[0x1D17BA0A0]();
    v38 = v6;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v41;
      v42 = "%{public}@Remote MTU isnt provided, picking local MTU";
      goto LABEL_19;
    }
  }
  v47 = v34;
LABEL_24:
  v49 = v14;

  objc_autoreleasePoolPop(v37);
  v50 = v47;
  v51 = (void *)MEMORY[0x1D17BA0A0]();
  v52 = v6;
  HMFGetOSLogHandle();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v64 = v54;
    v65 = 2112;
    v66 = v32;
    v67 = 2112;
    v68 = v34;
    v69 = 2112;
    v70 = v50;
    _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_INFO, "%{public}@Remote MTU %@, Local MTU %@, Picked MTU %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v51);
  -[HMDCameraLocalStreamControlManager streamSession](v52, "streamSession");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "protocolParameters");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "selectedStreamConfigurationWrite");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "videoParameters");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "rtpParameters");
  v59 = v34;
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setMaxMTU:", v50);

  -[HMDCameraLocalStreamControlManager _startStreamManager](v52, "_startStreamManager");
  v14 = v49;
  v13 = v61;
  v4 = v62;
LABEL_27:

}

- (id)_calculateMTU
{
  void *v3;
  void *v4;
  void *v5;
  HMDCameraLocalStreamControlManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamSender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraLocalStreamControlManager streamSession](v6, "streamSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "streamSender");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mtu");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v8;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Reporting stream sender reported MTU %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDCameraLocalStreamControlManager streamSession](v6, "streamSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "streamSender");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mtu");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
  else
  {
    -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "protocolParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setupEndPointWrite");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "address");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isIPv6Address");

    if (v20)
      v21 = 1228;
    else
      v21 = 1378;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_startStreamManager
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDCameraLocalStreamControlManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCameraLocalStreamControlManager *v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (-[HMDCameraLocalStreamControlManager isSendingStream](self, "isSendingStream"))
  {
    -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsState:", 4);

    if ((v4 & 1) == 0)
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
LABEL_9:
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraLocalStreamControlManager streamSession](v28, "streamSession");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stateAsString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v30;
        v41 = 2112;
        v42 = v32;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Current state: %@, waiting", buf, 0x16u);

      }
LABEL_10:

      objc_autoreleasePoolPop(v27);
      return;
    }
  }
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsState:", 8);

  if ((v6 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    goto LABEL_10;
  }
  -[HMDCameraLocalStreamControlManager configGenerator](self, "configGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "protocolParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = 0;
  v10 = objc_msgSend(v7, "extractSelectedConfigFromProtocolParameters:videoStreamConfig:audioStreamConfig:", v9, &v38, &v37);
  v11 = v38;
  v12 = v37;

  if ((v10 & 1) != 0)
  {
    -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "protocolParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectedStreamConfigurationWrite");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "videoParameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rtpParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "synchronizationSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeviceLocalSSRC:", objc_msgSend(v18, "unsignedIntegerValue"));

    -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "protocolParameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "selectedStreamConfigurationWrite");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "audioParameters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "rtpParameters");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "synchronizationSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDeviceLocalSSRC:", objc_msgSend(v24, "unsignedIntegerValue"));

    -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "streamManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "startStreamWithVideoConfig:audioConfig:", v11, v12);

  }
  else
  {
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v36;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not extract a configuration from the given parameters", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v33);
    -[HMDCameraStreamControlManager _reportInternalErrorCode:](v34, "_reportInternalErrorCode:", 1046);
  }

}

- (void)reconfigureStream:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraStreamControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HMDCameraLocalStreamControlManager_reconfigureStream___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_reconfigureStream:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraStreamControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HMDCameraLocalStreamControlManager__reconfigureStream___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)stopStreamWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraStreamControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HMDCameraLocalStreamControlManager_stopStreamWithError___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_stopCurrentStreamSessionWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCameraLocalStreamControlManager *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateState:", 16);

    -[HMDCameraLocalStreamControlManager _removeServerStreamSession](self, "_removeServerStreamSession");
    -[HMDCameraLocalStreamControlManager _writeStopConfig:](self, "_writeStopConfig:", v4);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Session is not in progress", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)_writeStartConfig
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDCameraLocalStreamControlManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "protocolParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedStreamConfigurationWrite");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Writing start stream configuration: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "tlvData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraLocalStreamControlManager _writeSelectConfig:reconfigure:](v7, "_writeSelectConfig:reconfigure:", v10, 0);

}

- (void)_writeReselectConfig
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDCameraLocalStreamControlManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "protocolParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reselectedStreamConfigurationWrite");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Writing reselect stream configuration: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "tlvData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraLocalStreamControlManager _writeSelectConfig:reconfigure:](v7, "_writeSelectConfig:reconfigure:", v10, 1);

}

- (void)_writeSelectConfig:(id)a3 reconfigure:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMDCameraLocalStreamControlManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  BOOL v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDCameraStreamControlManager accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Writing characteristic for selected stream configuration", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDCameraStreamControlManager streamManagementService](v11, "streamManagementService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "findCharacteristicWithType:", *MEMORY[0x1E0D15FF0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v15, v6, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, v11);
    v22 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlManager workQueue](v11, "workQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__HMDCameraLocalStreamControlManager__writeSelectConfig_reconfigure___block_invoke;
    v19[3] = &unk_1E89B3070;
    objc_copyWeak(&v20, (id *)buf);
    v21 = a4;
    objc_msgSend(v9, "writeCharacteristicValues:source:queue:completionHandler:", v17, 7, v18, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    -[HMDCameraStreamControlManager _reportInternalErrorCode:](self, "_reportInternalErrorCode:", 1011);
  }

}

- (void)_writeStopConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraLocalStreamControlManager *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  HMDSessionControl *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  HMDSessionControl *v21;
  HMDSelectedStreamConfigurationWrite *v22;
  void *v23;
  HMDCameraLocalStreamControlManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  HMDSelectedStreamConfigurationWrite *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping the stream right away", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDCameraLocalStreamControlManager streamSession](v7, "streamSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsState:", 2);

    -[HMDCameraLocalStreamControlManager setStreamSession:](v7, "setStreamSession:", 0);
    if (v12)
    {
      -[HMDCameraStreamControlManager accessory](v7, "accessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      if (!v15)
      {
        -[HMDCameraStreamControlManager _reportInternalErrorCode:](v7, "_reportInternalErrorCode:", 1011);
        goto LABEL_17;
      }
      v16 = [HMDSessionControl alloc];
      v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[HMDCameraStreamControlManager sessionID](v7, "sessionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sessionID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithUUIDString:", v19);
      v21 = -[HMDSessionControl initWithCommand:sessionIdentifier:](v16, "initWithCommand:sessionIdentifier:", 0, v20);

      v22 = -[HMDSelectedStreamConfigurationWrite initWithSessionControl:]([HMDSelectedStreamConfigurationWrite alloc], "initWithSessionControl:", v21);
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = v7;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v26;
        v38 = 2112;
        v39 = v22;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Writing stop stream configuration: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      -[HMDCameraStreamControlManager streamManagementService](v24, "streamManagementService");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "findCharacteristicWithType:", *MEMORY[0x1E0D15FF0]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDSelectedStreamConfigurationWrite tlvData](v22, "tlvData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v28, v29, 0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraStreamControlManager workQueue](v24, "workQueue");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __55__HMDCameraLocalStreamControlManager__writeStopConfig___block_invoke;
      v34[3] = &unk_1E89BA2C0;
      v34[4] = v24;
      objc_msgSend(v15, "writeCharacteristicValues:source:queue:completionHandler:", v31, 7, v32, v34);

    }
    -[HMDCameraStreamControlManager _callStreamStoppedWithError:](v7, "_callStreamStoppedWithError:", v4);
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v33;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@No current stream session to write stop config for", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
LABEL_17:

}

- (void)_cleanUpStreamSessionWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraLocalStreamControlManager *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Cleaning up the stream", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDCameraLocalStreamControlManager _writeStopConfig:](v7, "_writeStopConfig:", v4);
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@No current stream session to clean up", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_streamStarted
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateState:", 8);

  -[HMDCameraLocalStreamControlManager _addServerStreamSession](self, "_addServerStreamSession");
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "streamSender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startKeepAlive");

  -[HMDCameraLocalStreamControlManager _writeStartConfig](self, "_writeStartConfig");
}

- (void)sessionInitiator:(id)a3 didSetUpWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraLocalStreamControlManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCameraLocalStreamControlManager *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to set up IDSSession for stream", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraLocalStreamControlManager _cleanUpStreamSessionWithError:](v9, "_cleanUpStreamSessionWithError:", v7);
  }
  else
  {
    -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateState:", 4);

    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Session initiator is setup", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDCameraLocalStreamControlManager _startStreamManager](v14, "_startStreamManager");
  }

}

- (void)sessionInitiator:(id)a3 didEndSessionWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraLocalStreamControlManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Session stopped, stopping the stream", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraLocalStreamControlManager _stopCurrentStreamSessionWithError:](v9, "_stopCurrentStreamSessionWithError:", v7);

}

- (void)deviceConnectionSender:(id)a3 didSetUpWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraLocalStreamControlManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCameraLocalStreamControlManager *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to set up IDSDeviceConnection for stream", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraLocalStreamControlManager _cleanUpStreamSessionWithError:](v9, "_cleanUpStreamSessionWithError:", v7);
  }
  else
  {
    -[HMDCameraStreamControlManager _callStreamRemoteConnectionSetup](self, "_callStreamRemoteConnectionSetup");
    -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateState:", 4);

    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Device connection sender is set up", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDCameraLocalStreamControlManager _startStreamManager](v14, "_startStreamManager");
  }

}

- (void)deviceConnectionSender:(id)a3 didEndSessionWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraLocalStreamControlManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Session stopped, stopping the stream", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraLocalStreamControlManager _stopCurrentStreamSessionWithError:](v9, "_stopCurrentStreamSessionWithError:", v7);

}

- (void)streamManager:(id)a3 didStartStreamWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraLocalStreamControlManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[HMDCameraLocalStreamControlManager _cleanUpStreamSessionWithError:](self, "_cleanUpStreamSessionWithError:", v7);
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Stream manager did start stream", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraLocalStreamControlManager _streamStarted](v9, "_streamStarted");
  }

}

- (void)streamManagerDidStopStream:(id)a3 error:(id)a4
{
  void *v5;
  int v6;
  id v7;

  v7 = a4;
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsState:", 8);

  if (v6)
    -[HMDCameraStreamControlManager _callStreamStoppedWithError:](self, "_callStreamStoppedWithError:", v7);
  else
    -[HMDCameraLocalStreamControlManager _cleanUpStreamSessionWithError:](self, "_cleanUpStreamSessionWithError:", v7);

}

- (void)streamManagerDidNetworkImprove:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  HMDCameraLocalStreamControlManager *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoTierParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "pickHigherTier");

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Picked a higher tier", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraLocalStreamControlManager _reconfigureStreams](v9, "_reconfigureStreams");
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Already in highest tier, not changing the tier", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraLocalStreamControlManager streamSession](v9, "streamSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "streamManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateReconfigurationMode:", 0);

  }
}

- (void)streamManagerDidNetworkDeteriorate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  HMDCameraLocalStreamControlManager *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoTierParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "pickLowerTier");

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Picked a lower tier", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraLocalStreamControlManager _reconfigureStreams](v9, "_reconfigureStreams");
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Already in lowest tier, not changing the tier", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraLocalStreamControlManager streamSession](v9, "streamSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "streamManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateReconfigurationMode:", 0);

  }
}

- (void)streamManagerDidUpdateConfiguration:(id)a3
{
  id v4;
  void *v5;
  HMDCameraLocalStreamControlManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Stream configuration update complete", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraLocalStreamControlManager streamSession](v6, "streamSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "streamManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateReconfigurationMode:", 0);

}

- (void)_reconfigureStreams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protocolParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraLocalStreamControlManager streamSession](self, "streamSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "videoTierParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPickedTier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReselectedConfigParameters:videoTier:", v6, v9);

  -[HMDCameraLocalStreamControlManager _writeReselectConfig](self, "_writeReselectConfig");
}

- (void)_sendUpdatedConfiguration
{
  void *v3;
  HMDCameraLocalStreamControlManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraLocalStreamControlManager *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[HMDCameraLocalStreamControlManager isSendingStream](self, "isSendingStream"))
  {
    -[HMDCameraStreamControlManager _callStreamReconfigured](self, "_callStreamReconfigured");
  }
  else
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Sending updated configuration", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDCameraLocalStreamControlManager configGenerator](v4, "configGenerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraLocalStreamControlManager streamSession](v4, "streamSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoTierParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentPickedTier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v11 = objc_msgSend(v7, "extractReselectedConfigFromVideoTier:videoStreamConfig:", v10, &v19);
    v12 = v19;

    if ((v11 & 1) != 0)
    {
      -[HMDCameraLocalStreamControlManager streamSession](v4, "streamSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "streamManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateStreamConfiguration:", v12);

    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v4;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Reselected config failed to extract", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDCameraStreamControlManager _reportInternalErrorCode:](v16, "_reportInternalErrorCode:", 1046);
    }

  }
}

- (HMDCameraLocalStreamSession)streamSession
{
  return (HMDCameraLocalStreamSession *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStreamSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (HMDCameraMediaConfigGenerator)configGenerator
{
  return (HMDCameraMediaConfigGenerator *)objc_getProperty(self, a2, 80, 1);
}

- (HMDCameraSupportedConfigurationCache)supportedConfigCache
{
  return (HMDCameraSupportedConfigurationCache *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedConfigCache, 0);
  objc_storeStrong((id *)&self->_configGenerator, 0);
  objc_storeStrong((id *)&self->_streamSession, 0);
}

void __55__HMDCameraLocalStreamControlManager__writeStopConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v11;
    v13 = "%{public}@The stop stream configuration characteristic write contained no response";
    v14 = v10;
    v15 = OS_LOG_TYPE_ERROR;
LABEL_9:
    _os_log_impl(&dword_1CD062000, v14, v15, v13, (uint8_t *)&v16, 0xCu);
    goto LABEL_10;
  }
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v6)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v11;
    v13 = "%{public}@The stop stream configuration characteristic write finished successfully";
    v14 = v10;
    v15 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@The stop stream configuration characteristic write failed: %@", (uint8_t *)&v16, 0x16u);

LABEL_10:
  }
LABEL_11:

  objc_autoreleasePoolPop(v7);
}

void __69__HMDCameraLocalStreamControlManager__writeSelectConfig_reconfigure___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received response for selected stream configuration write characteristic", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v3, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)MEMORY[0x1D17BA0A0]();
        v13 = v6;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "error");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543618;
          v23 = v15;
          v24 = 2114;
          v25 = v16;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Write reply ended in error response: %{public}@", (uint8_t *)&v22, 0x16u);

        }
        objc_autoreleasePoolPop(v12);
        objc_msgSend(v10, "error");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_reportErrorCode:", objc_msgSend(v17, "code"));

      }
      else if (*(_BYTE *)(a1 + 40))
      {
        objc_msgSend(v6, "_sendUpdatedConfiguration");
      }
      else
      {
        objc_msgSend(v6, "_callStreamStarted");
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = v6;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v21;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@The write reply does not contain a response", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(v19, "_reportErrorCode:", 50);
    }

  }
}

uint64_t __58__HMDCameraLocalStreamControlManager_stopStreamWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Received request to stop the stream with session ID %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "streamSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return objc_msgSend(*(id *)(a1 + 32), "_stopCurrentStreamSessionWithError:", *(_QWORD *)(a1 + 40));
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@No current stream session to stop", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  return objc_msgSend(*(id *)(a1 + 32), "_reportErrorCode:", 3);
}

void __57__HMDCameraLocalStreamControlManager__reconfigureStream___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v5;
    v34 = 2112;
    v35 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Received request to reconfigure the stream with session ID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "streamSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "hmf_dataForKey:", CFSTR("kReconfiguredTier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v31 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v31);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v31;
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v9)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "streamSession");
          v30 = v10;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "videoTierParameters");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "currentPickedTier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v33 = v15;
          v34 = 2112;
          v35 = v18;
          v36 = 2112;
          v37 = v9;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating the current picked tier from %@ to %@", buf, 0x20u);

          v10 = v30;
        }

        objc_autoreleasePoolPop(v11);
        objc_msgSend(*(id *)(a1 + 32), "streamSession");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "videoTierParameters");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setCurrentPickedTier:", v9);

        objc_msgSend(*(id *)(a1 + 32), "_reconfigureStreams");
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = v29;
          v34 = 2112;
          v35 = v10;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive camera video tier from video tier data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v11);
        objc_msgSend(*(id *)(a1 + 32), "_reportInternalErrorCode:", 1047);
      }

    }
    else
    {
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v28;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Missing reconfigured tier data", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(*(id *)(a1 + 32), "_reportInternalErrorCode:", 1047);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@No current stream session to reconfigure", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(*(id *)(a1 + 32), "_reportErrorCode:", 3);
  }
}

uint64_t __56__HMDCameraLocalStreamControlManager_reconfigureStream___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconfigureStream:", *(_QWORD *)(a1 + 40));
}

uint64_t __68__HMDCameraLocalStreamControlManager_startStreamWithRemoteSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startStreamWithRemoteSettings:", *(_QWORD *)(a1 + 40));
}

void __60__HMDCameraLocalStreamControlManager__sendSetupEndPointRead__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received response for setup endpoint read", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "_handleSetupEndPointRead:", v3);
  }

}

void __57__HMDCameraLocalStreamControlManager__writeSetupEndPoint__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v33 = WeakRetained;
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Received response for setup endpoint write", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v34 = v3;
    v10 = v3;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v36;
      v14 = *MEMORY[0x1E0D15FF8];
LABEL_6:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
        objc_msgSend(v16, "request");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "characteristic");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "type");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v14);

        if ((v20 & 1) != 0)
          break;
        if (v12 == ++v15)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v12)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      v21 = v16;

      if (!v21)
        goto LABEL_18;
      objc_msgSend(v21, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v33;
      if (!v22)
      {
        objc_msgSend(v33, "_sendSetupEndPointRead");

        goto LABEL_21;
      }
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = v33;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      v3 = v34;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "error");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v26;
        v41 = 2112;
        v42 = v27;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@The setup endpoint write reply errored out: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(v21, "error");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_cleanUpStreamSessionWithError:", v28);

    }
    else
    {
LABEL_12:

LABEL_18:
      v29 = (void *)MEMORY[0x1D17BA0A0]();
      v5 = v33;
      v30 = v33;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v32;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@The setup endpoint write reply does not contain a response", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v29);
      objc_msgSend(v30, "_reportErrorCode:", 50);
LABEL_21:
      v3 = v34;
    }
  }

}

void __65__HMDCameraLocalStreamControlManager__getSupportedConfigurations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received response for supported configurations", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "_handleSupportedParameters:", v3);
  }

}

uint64_t __53__HMDCameraLocalStreamControlManager_negotiateStream__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_negotiateStream");
}

void __65__HMDCameraLocalStreamControlManager_updateAudioVolume_callback___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "streamSession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAudioVolume:callback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __57__HMDCameraLocalStreamControlManager_updateAudioSetting___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "streamSession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAudioSetting:", *(_QWORD *)(a1 + 40));

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t72 != -1)
    dispatch_once(&logCategory__hmf_once_t72, &__block_literal_global_107138);
  return (id)logCategory__hmf_once_v73;
}

void __49__HMDCameraLocalStreamControlManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v73;
  logCategory__hmf_once_v73 = v0;

}

@end
