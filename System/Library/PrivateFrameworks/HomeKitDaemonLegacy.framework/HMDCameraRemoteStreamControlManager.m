@implementation HMDCameraRemoteStreamControlManager

- (HMDCameraRemoteStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 reachabilityPath:(unint64_t)a6 device:(id)a7 delegate:(id)a8 delegateQueue:(id)a9 accessory:(id)a10 streamManagementService:(id)a11 remoteCapabilities:(id)a12 profileUniqueIdentifier:(id)a13 residentMessageHandler:(id)a14 remoteAccessDevice:(id)a15 streamPreference:(id)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  HMDCameraIDSDeviceConnectionReceiver *v28;
  HMDCameraIDSSessionInviterDeviceVerifier *v29;
  void *v30;
  HMDCameraIDSSessionInviterDeviceVerifier *v31;
  HMDCameraRemoteStreamControlManager *v32;
  HMDCameraIDSDeviceConnectionSender *v33;
  HMDCameraRemoteStreamSession *v34;
  HMDCameraRemoteStreamControlManager *v36;
  SEL v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v49;
  id v50;
  HMDCameraRemoteStreamControlManager *v52;
  id v53;
  id v54;
  id v55;

  v20 = a3;
  v21 = a4;
  v55 = a5;
  v50 = a7;
  v47 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v26 = a13;
  v53 = a14;
  v54 = a15;
  v27 = a16;
  if (!v20)
  {
    _HMFPreconditionFailure();
    goto LABEL_21;
  }
  if (!v21)
  {
LABEL_21:
    _HMFPreconditionFailure();
    goto LABEL_22;
  }
  if (!v55)
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
  if (!v22)
  {
LABEL_24:
    _HMFPreconditionFailure();
    goto LABEL_25;
  }
  if (!v23)
  {
LABEL_25:
    _HMFPreconditionFailure();
    goto LABEL_26;
  }
  if (!v24)
  {
LABEL_26:
    _HMFPreconditionFailure();
    goto LABEL_27;
  }
  if (!v25)
  {
LABEL_27:
    _HMFPreconditionFailure();
    goto LABEL_28;
  }
  if (!v26)
  {
LABEL_28:
    _HMFPreconditionFailure();
    goto LABEL_29;
  }
  if (!v53)
  {
LABEL_29:
    _HMFPreconditionFailure();
    goto LABEL_30;
  }
  if (!v54)
  {
LABEL_30:
    v36 = (HMDCameraRemoteStreamControlManager *)_HMFPreconditionFailure();
    return -[HMDCameraRemoteStreamControlManager initWithSessionID:workQueue:streamSnapshotHandler:delegate:delegateQueue:accessory:streamManagementService:profileUniqueIdentifier:residentMessageHandler:streamSession:](v36, v37, v38, v39, v40, v41, v42, v43, a9, a10, a11, a12);
  }
  v45 = v27;
  v49 = v25;
  v46 = v23;
  if (isWatch() && objc_msgSend(v53, "isUsingCompanionForRemoteAccessDevice"))
  {
    v28 = -[HMDCameraIDSDeviceConnectionReceiver initWithSessionID:workQueue:delegate:delegateQueue:]([HMDCameraIDSDeviceConnectionReceiver alloc], "initWithSessionID:workQueue:delegate:delegateQueue:", v20, v21, self, v21);
  }
  else
  {
    v29 = [HMDCameraIDSSessionInviterDeviceVerifier alloc];
    objc_msgSend(v20, "sessionID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[HMDCameraIDSSessionInviterDeviceVerifier initWithSessionID:expectedInviter:](v29, "initWithSessionID:expectedInviter:", v30, v54);

    v28 = -[HMDCameraIDSSessionReceiver initWithSessionID:workQueue:sessionInviterDeviceVerifier:delegate:delegateQueue:]([HMDCameraIDSSessionReceiver alloc], "initWithSessionID:workQueue:sessionInviterDeviceVerifier:delegate:delegateQueue:", v20, v21, v31, self, v21);
  }
  v44 = v22;
  if (v50)
  {
    v32 = self;
    v33 = -[HMDCameraIDSDeviceConnectionSender initWithSessionID:workQueue:device:delegate:delegateQueue:]([HMDCameraIDSDeviceConnectionSender alloc], "initWithSessionID:workQueue:device:delegate:delegateQueue:", v20, v21, v50, self, v21);
  }
  else
  {
    v33 = 0;
    v32 = self;
  }
  v34 = -[HMDCameraRemoteStreamSession initWithSessionID:reachabilityPath:streamSender:streamReceiver:remoteCapabilities:streamPreference:]([HMDCameraRemoteStreamSession alloc], "initWithSessionID:reachabilityPath:streamSender:streamReceiver:remoteCapabilities:streamPreference:", v20, a6, v33, v28, v49, v45);
  v52 = -[HMDCameraRemoteStreamControlManager initWithSessionID:workQueue:streamSnapshotHandler:delegate:delegateQueue:accessory:streamManagementService:profileUniqueIdentifier:residentMessageHandler:streamSession:](v32, "initWithSessionID:workQueue:streamSnapshotHandler:delegate:delegateQueue:accessory:streamManagementService:profileUniqueIdentifier:residentMessageHandler:streamSession:", v20, v21, v55, v47, v44, v46, v24, v26, v53, v34);

  return v52;
}

- (HMDCameraRemoteStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 accessory:(id)a8 streamManagementService:(id)a9 profileUniqueIdentifier:(id)a10 residentMessageHandler:(id)a11 streamSession:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  HMDCameraResidentMessageHandler *v24;
  HMDCameraRemoteStreamSession *v25;
  HMDCameraRemoteStreamSession *v26;
  HMDCameraRemoteStreamControlManager *v27;
  uint64_t v28;
  NSUUID *profileUniqueIdentifier;
  HMDCameraResidentMessageHandler *residentMessageHandler;
  HMDCameraResidentMessageHandler *v31;
  HMDCameraRemoteStreamSession *streamSession;
  HMDCameraRemoteStreamSession *v33;
  HMDCameraMediaConfigGenerator *v34;
  HMDCameraMediaConfigGenerator *configGenerator;
  HMDCameraRemoteStreamControlManager *result;
  HMDCameraRemoteStreamControlManager *v37;
  SEL v38;
  void *v40;
  id v41;
  objc_super v42;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v41 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = (HMDCameraResidentMessageHandler *)a11;
  v25 = (HMDCameraRemoteStreamSession *)a12;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v20)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v21)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v22)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v23)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v24)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  v26 = v25;
  if (v25)
  {
    v42.receiver = self;
    v42.super_class = (Class)HMDCameraRemoteStreamControlManager;
    v27 = -[HMDCameraStreamControlManager initWithSessionID:workQueue:streamSnapshotHandler:delegate:delegateQueue:accessory:streamManagementService:isLocal:](&v42, sel_initWithSessionID_workQueue_streamSnapshotHandler_delegate_delegateQueue_accessory_streamManagementService_isLocal_, v17, v18, v19, v41, v20, v21, v22, 0);
    v28 = objc_msgSend(v23, "copy");
    profileUniqueIdentifier = v27->_profileUniqueIdentifier;
    v27->_profileUniqueIdentifier = (NSUUID *)v28;

    v40 = v17;
    residentMessageHandler = v27->_residentMessageHandler;
    v27->_residentMessageHandler = v24;
    v31 = v24;

    streamSession = v27->_streamSession;
    v27->_streamSession = v26;
    v33 = v26;

    v34 = objc_alloc_init(HMDCameraMediaConfigGenerator);
    configGenerator = v27->_configGenerator;
    v27->_configGenerator = v34;

    return v27;
  }
LABEL_19:
  v37 = (HMDCameraRemoteStreamControlManager *)_HMFPreconditionFailure();
  -[HMDCameraRemoteStreamControlManager dealloc](v37, v38);
  return result;
}

- (void)dealloc
{
  void *v3;
  HMDCameraRemoteStreamControlManager *v4;
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
  -[HMDCameraRemoteStreamControlManager _stopCurrentStreamSessionWithError:](v4, "_stopCurrentStreamSessionWithError:", v7);

  v8.receiver = v4;
  v8.super_class = (Class)HMDCameraRemoteStreamControlManager;
  -[HMDCameraRemoteStreamControlManager dealloc](&v8, sel_dealloc);
}

- (NSNumber)slotIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
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

  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
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

  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aspectRatio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)updateAudioSetting:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDCameraStreamControlManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__HMDCameraRemoteStreamControlManager_updateAudioSetting___block_invoke;
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
  block[2] = __66__HMDCameraRemoteStreamControlManager_updateAudioVolume_callback___block_invoke;
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
  block[2] = __54__HMDCameraRemoteStreamControlManager_negotiateStream__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_negotiateStream
{
  void *v3;
  HMDCameraRemoteStreamControlManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[3];
  _QWORD v26[3];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Received a request to relay start stream to resident", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = (void *)MEMORY[0x1E0CB36F8];
  -[HMDCameraRemoteStreamControlManager streamSession](v4, "streamSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "streamingCapabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v10;
  v25[0] = CFSTR("kRemoteStreamCapabilities");
  v25[1] = CFSTR("kCameraSessionID");
  -[HMDCameraStreamControlManager sessionID](v4, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v12;
  v25[2] = CFSTR("kCameraSessionApplicationID");
  -[HMDCameraStreamControlManager sessionID](v4, "sessionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hostProcessBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, v4);
  -[HMDCameraRemoteStreamControlManager residentMessageHandler](v4, "residentMessageHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager sessionID](v4, "sessionID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRemoteStreamControlManager profileUniqueIdentifier](v4, "profileUniqueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager workQueue](v4, "workQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __55__HMDCameraRemoteStreamControlManager__negotiateStream__block_invoke;
  v23[3] = &unk_1E89BF5C0;
  objc_copyWeak(&v24, (id *)buf);
  objc_msgSend(v16, "sendMessageWithName:cameraSessionID:payload:target:responseQueue:responseHandler:", CFSTR("kNegotitateRemoteStreamRequestKey"), v17, v15, v18, v19, v23);

  -[HMDCameraStreamControlManager sessionID](v4, "sessionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "markMilestoneFor:", CFSTR("SentNegotiateRemoteStreamRequest"));

  -[HMDCameraRemoteStreamControlManager streamSession](v4, "streamSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "streamSender");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "openRelaySession");

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

}

- (void)_setParametersSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
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
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDCameraRemoteStreamControlManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDCameraRemoteStreamControlManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDCameraRemoteStreamControlManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  HMDCameraRemoteStreamControlManager *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  HMDCameraRemoteStreamControlManager *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  HMDCameraRemoteStreamControlManager *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  HMDCameraVideoTier *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateState:", 4);

  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("kSelectedStreamParameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("kVideoTierParameters"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v66 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v66);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v66;
    if (v9)
    {
      v65 = v10;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v65);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v65;

      if (v11)
      {
        v60 = v8;
        v61 = v6;
        v62 = v4;
        -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setProtocolParameters:", v9);

        objc_msgSend(v9, "selectedStreamConfigurationWrite");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "videoParameters");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = [HMDCameraVideoTier alloc];
        objc_msgSend(v14, "videoAttributes");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "videoResolution");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "videoAttributes");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "framerate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "rtpParameters");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "minimumBitrate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "rtpParameters");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "maximumBitrate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v14;
        objc_msgSend(v14, "rtpParameters");
        v63 = v11;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "rtcpInterval");
        v21 = v9;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[HMDCameraVideoTier initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:](v56, "initWithVideoResolution:framerate:minBitRate:maxBitRate:rtcpInterval:", v55, v15, v17, v19, v22);

        v9 = v21;
        -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "videoTierParameters");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)v23;
        objc_msgSend(v25, "updateTierParameters:firstPickedParameter:", v63, v23);

        v27 = (void *)MEMORY[0x1D17BA0A0]();
        v28 = self;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setupEndPointWrite");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v30;
          v69 = 2112;
          v70 = v31;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Received protocol parameters with Setup Endpoint Write %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
        v32 = (void *)MEMORY[0x1D17BA0A0]();
        v33 = v28;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setupEndPointRead");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v35;
          v69 = 2112;
          v70 = v36;
          _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Setup Endpoint Read %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
        v37 = (void *)MEMORY[0x1D17BA0A0]();
        v38 = v33;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        v4 = v62;
        v8 = v60;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "selectedStreamConfigurationWrite");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v40;
          v69 = 2112;
          v70 = v41;
          _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Selected stream config %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v37);
        -[HMDCameraRemoteStreamControlManager _idsSessionCreatedAndConfigNegotiated](v38, "_idsSessionCreatedAndConfigNegotiated");

        v6 = v61;
        v11 = v63;
        v42 = v64;
      }
      else
      {
        v51 = (void *)MEMORY[0x1D17BA0A0]();
        v52 = self;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        v42 = v64;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v54;
          v69 = 2112;
          v70 = v64;
          _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive camera video tier parameters from video parameters data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v51);
        -[HMDCameraStreamControlManager _reportErrorCode:](v52, "_reportErrorCode:", 3);
      }

      v10 = v42;
    }
    else
    {
      v47 = (void *)MEMORY[0x1D17BA0A0]();
      v48 = self;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v50;
        v69 = 2112;
        v70 = v10;
        _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive camera protocol parameters from protocol parameters data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v47);
      -[HMDCameraStreamControlManager _reportErrorCode:](v48, "_reportErrorCode:", 3);
    }

  }
  else
  {
    v43 = (void *)MEMORY[0x1D17BA0A0]();
    v44 = self;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v46;
      _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@Did not get protocol or tier parameters data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v43);
    -[HMDCameraStreamControlManager _reportInternalErrorCode:](v44, "_reportInternalErrorCode:", 1047);
  }

}

- (void)_idsSessionCreatedAndConfigNegotiated
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  HMDCameraRemoteStreamControlManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCameraRemoteStreamControlManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsState:", 4) & 1) != 0)
  {
    -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsState:", 8);

    if ((v5 & 1) != 0)
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v9;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Negotiation is completed", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      -[HMDCameraRemoteStreamControlManager streamSession](v7, "streamSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "negotiatedParameters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraStreamControlManager _callStreamNegotiated:](v7, "_callStreamNegotiated:", v11);

      return;
    }
  }
  else
  {

  }
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRemoteStreamControlManager streamSession](v13, "streamSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stateAsString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v15;
    v20 = 2112;
    v21 = v17;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Current state: %@, waiting", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
}

- (void)_relaySessionStarted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraRemoteStreamControlManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDCameraRemoteStreamControlManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v9;
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Relay session failed to start: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      -[HMDCameraRemoteStreamControlManager _cleanUpStreamSessionWithError:](v7, "_cleanUpStreamSessionWithError:", v4);
    }
    else
    {
      -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateState:", 8);

      -[HMDCameraRemoteStreamControlManager _idsSessionCreatedAndConfigNegotiated](self, "_idsSessionCreatedAndConfigNegotiated");
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Stream session is no longer valid, stopping the IDS session", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRemoteStreamControlManager _cleanUpStreamSessionWithError:](v11, "_cleanUpStreamSessionWithError:", v14);

  }
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
  v7[2] = __69__HMDCameraRemoteStreamControlManager_startStreamWithRemoteSettings___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_startStreamWithRemoteSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCameraRemoteStreamControlManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  HMDCameraStreamManager *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDCameraStreamManager *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  HMDCameraRemoteStreamControlManager *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  HMDCameraRemoteStreamControlManager *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "streamSender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Stream sender is set, redispatching the start request to resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kVideoStreamSSRC"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kAudioStreamSSRC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRemoteStreamControlManager streamSession](v8, "streamSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "protocolParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setupEndPointRead");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "videoSSRC");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    -[HMDCameraRemoteStreamControlManager streamSession](v8, "streamSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "protocolParameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setupEndPointRead");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "audioSSRC");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v4;
    v22 = objc_msgSend(v20, "unsignedIntegerValue");

    -[HMDCameraRemoteStreamControlManager streamSession](v8, "streamSession");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "streamSender");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRemoteStreamControlManager streamSession](v8, "streamSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "streamReceiver");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "session");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v22;
    v4 = v21;
    objc_msgSend(v24, "startPacketRelayWithIDSDeviceSession:cameraVideoSSRC:cameraAudioSSRC:", v27, v16, v28);

    -[HMDCameraRemoteStreamControlManager _dispatchStartRequestToResidentWithVideoSSRC:audioSSRC:](v8, "_dispatchStartRequestToResidentWithVideoSSRC:audioSSRC:", v56, v11);
  }
  else
  {
    v29 = [HMDCameraStreamManager alloc];
    -[HMDCameraStreamControlManager sessionID](self, "sessionID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlManager streamSnapshotHandler](self, "streamSnapshotHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlManager workQueue](self, "workQueue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlManager workQueue](self, "workQueue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "streamReceiver");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[HMDCameraStreamManager initWithSessionID:streamSnapshotHandler:workQueue:delegate:delegateQueue:localVideoNetworkConfig:localAudioNetworkConfig:sessionHandler:](v29, "initWithSessionID:streamSnapshotHandler:workQueue:delegate:delegateQueue:localVideoNetworkConfig:localAudioNetworkConfig:sessionHandler:", v30, v31, v32, self, v33, 0, 0, v35);
    -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setStreamManager:", v36);

    -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "streamManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      -[HMDCameraRemoteStreamControlManager configGenerator](self, "configGenerator");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "protocolParameters");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0;
      v58 = 0;
      v43 = objc_msgSend(v40, "extractSelectedConfigFromProtocolParameters:videoStreamConfig:audioStreamConfig:", v42, &v58, &v57);
      v44 = v58;
      v45 = v57;

      if ((v43 & 1) != 0)
      {
        -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "streamManager");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "startStreamWithVideoConfig:audioConfig:", v44, v45);

      }
      else
      {
        v52 = (void *)MEMORY[0x1D17BA0A0]();
        v53 = self;
        HMFGetOSLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v60 = v55;
          _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_ERROR, "%{public}@Could not extract a configuration from the given parameters", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v52);
        -[HMDCameraStreamControlManager _reportInternalErrorCode:](v53, "_reportInternalErrorCode:", 1046);
      }

    }
    else
    {
      v48 = (void *)MEMORY[0x1D17BA0A0]();
      v49 = self;
      HMFGetOSLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v51;
        _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to create stream manager for remote stream", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v48);
      -[HMDCameraStreamControlManager _reportInternalErrorCode:](v49, "_reportInternalErrorCode:", 1015);
    }
  }

}

- (void)_dispatchStartRequestToResidentWithVideoSSRC:(id)a3 audioSSRC:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMDCameraRemoteStreamControlManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDCameraRemoteStreamControlManager *v30;
  NSObject *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[3];
  _QWORD v36[3];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v35[0] = CFSTR("kVideoStreamSSRC");
    v35[1] = CFSTR("kAudioStreamSSRC");
    v36[0] = v6;
    v36[1] = v7;
    v35[2] = CFSTR("kCameraSessionID");
    -[HMDCameraStreamControlManager sessionID](self, "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "streamSender");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mtu");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)objc_msgSend(v11, "mutableCopy");
      -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "streamSender");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mtu");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("kRemoteStreamMTU"));

      v19 = objc_msgSend(v15, "copy");
      v11 = (void *)v19;
    }
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Dispatching the start request to resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_initWeak((id *)buf, v21);
    -[HMDCameraRemoteStreamControlManager residentMessageHandler](v21, "residentMessageHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlManager sessionID](v21, "sessionID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRemoteStreamControlManager profileUniqueIdentifier](v21, "profileUniqueIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlManager workQueue](v21, "workQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __94__HMDCameraRemoteStreamControlManager__dispatchStartRequestToResidentWithVideoSSRC_audioSSRC___block_invoke;
    v33[3] = &unk_1E89BF5C0;
    objc_copyWeak(&v34, (id *)buf);
    objc_msgSend(v24, "sendMessageWithName:cameraSessionID:payload:target:responseQueue:responseHandler:", CFSTR("kStartRemoteStreamRequestKey"), v25, v11, v26, v27, v33);

    -[HMDCameraStreamControlManager sessionID](v21, "sessionID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "markMilestoneFor:", CFSTR("SentStartRemoteStreamRequest"));

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v32;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@No SSRC, cannot start the stream", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    -[HMDCameraStreamControlManager _reportInternalErrorCode:](v30, "_reportInternalErrorCode:", 1045);
  }

}

- (void)_streamStarted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateState:", 16);

  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "streamSender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startKeepAlive");

  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "streamReceiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startKeepAlive");

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
  v7[2] = __57__HMDCameraRemoteStreamControlManager_reconfigureStream___block_invoke;
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
  v7[2] = __58__HMDCameraRemoteStreamControlManager__reconfigureStream___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setUpRemoteConnectionWithDevice:(id)a3
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
  v7[2] = __71__HMDCameraRemoteStreamControlManager_setUpRemoteConnectionWithDevice___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_setUpRemoteConnectionWithDevice:(id)a3
{
  id v4;
  void *v5;
  HMDCameraRemoteStreamControlManager *v6;
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
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Remote side has been setup", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraRemoteStreamControlManager streamSession](v6, "streamSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "streamReceiver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUpRemoteConnectionWithDevice:", v4);

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
  v7[2] = __59__HMDCameraRemoteStreamControlManager_stopStreamWithError___block_invoke;
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
  char v7;
  void *v8;
  HMDCameraRemoteStreamControlManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsState:", 16);

    if ((v7 & 1) != 0)
      -[HMDCameraStreamControlManager _callStreamStoppedWithError:](self, "_callStreamStoppedWithError:", v4);
    else
      -[HMDCameraStreamControlManager _reportErrorCode:](self, "_reportErrorCode:", 23);
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
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@No current stream session to stop", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_sendStopMessageToResident
{
  void *v3;
  HMDCameraRemoteStreamControlManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Sending stop stream message to resident", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraStreamControlManager sessionID](v4, "sessionID", CFSTR("kCameraSessionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraRemoteStreamControlManager residentMessageHandler](v4, "residentMessageHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager sessionID](v4, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRemoteStreamControlManager profileUniqueIdentifier](v4, "profileUniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager workQueue](v4, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendMessageWithName:cameraSessionID:payload:target:responseQueue:responseHandler:", CFSTR("kStopRemoteStreamRequestKey"), v11, v9, v12, v13, &__block_literal_global_32176);

}

- (void)_cleanUpStreamSessionWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraRemoteStreamControlManager *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
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
    -[HMDCameraRemoteStreamControlManager setStreamSession:](v7, "setStreamSession:", 0);
    -[HMDCameraRemoteStreamControlManager _sendStopMessageToResident](v7, "_sendStopMessageToResident");
    -[HMDCameraStreamControlManager _callStreamStoppedWithError:](v7, "_callStreamStoppedWithError:", v4);
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

- (void)sessionReceiver:(id)a3 didSetUpWithError:(id)a4
{
  -[HMDCameraRemoteStreamControlManager _relaySessionStarted:](self, "_relaySessionStarted:", a4);
}

- (void)sessionReceiver:(id)a3 didEndSessionWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraRemoteStreamControlManager *v9;
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Received a callback that IDS session has ended, stopping the stream", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraRemoteStreamControlManager _stopCurrentStreamSessionWithError:](v9, "_stopCurrentStreamSessionWithError:", v7);

}

- (void)deviceConnectionReceiver:(id)a3 didSetUpWithError:(id)a4
{
  -[HMDCameraRemoteStreamControlManager _relaySessionStarted:](self, "_relaySessionStarted:", a4);
}

- (void)deviceConnectionReceiver:(id)a3 didEndSessionWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraRemoteStreamControlManager *v9;
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Received a callback that IDS session has ended, stopping the stream", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraRemoteStreamControlManager _stopCurrentStreamSessionWithError:](v9, "_stopCurrentStreamSessionWithError:", v7);

}

- (void)deviceConnectionSender:(id)a3 didSetUpWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraRemoteStreamControlManager *v9;
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
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to set up IDSDeviceConnection for stream", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraRemoteStreamControlManager _cleanUpStreamSessionWithError:](v9, "_cleanUpStreamSessionWithError:", v7);
  }
  else
  {
    -[HMDCameraStreamControlManager _callStreamRemoteConnectionSetup](self, "_callStreamRemoteConnectionSetup");
  }

}

- (void)deviceConnectionSender:(id)a3 didEndSessionWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraRemoteStreamControlManager *v9;
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Received a callback that IDS initiator session has ended, stopping the stream", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraRemoteStreamControlManager _stopCurrentStreamSessionWithError:](v9, "_stopCurrentStreamSessionWithError:", v7);

}

- (void)streamManager:(id)a3 didStartStreamWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraRemoteStreamControlManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[HMDCameraRemoteStreamControlManager _cleanUpStreamSessionWithError:](self, "_cleanUpStreamSessionWithError:", v7);
  }
  else
  {
    v20 = v6;
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Stream manager did start stream", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraRemoteStreamControlManager streamSession](v9, "streamSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "streamManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "videoStreamInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "syncSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRemoteStreamControlManager streamSession](v9, "streamSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "streamManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "audioStreamInterface");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "syncSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRemoteStreamControlManager _dispatchStartRequestToResidentWithVideoSSRC:audioSSRC:](v9, "_dispatchStartRequestToResidentWithVideoSSRC:audioSSRC:", v15, v19);

    v6 = v20;
  }

}

- (void)streamManagerDidStopStream:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  HMDCameraRemoteStreamControlManager *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsState:", 16);

  if ((v9 & 1) != 0)
  {
    -[HMDCameraStreamControlManager _callStreamStoppedWithError:](self, "_callStreamStoppedWithError:", v7);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Session stopped before starting; cleaning up the stream",
        (uint8_t *)&v14,
        0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDCameraRemoteStreamControlManager _cleanUpStreamSessionWithError:](v11, "_cleanUpStreamSessionWithError:", v7);
  }

}

- (void)streamManagerDidNetworkImprove:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  HMDCameraRemoteStreamControlManager *v9;
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
  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
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
    -[HMDCameraRemoteStreamControlManager _reconfigureStreams](v9, "_reconfigureStreams");
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
    -[HMDCameraRemoteStreamControlManager streamSession](v9, "streamSession");
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
  HMDCameraRemoteStreamControlManager *v9;
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
  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
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
    -[HMDCameraRemoteStreamControlManager _reconfigureStreams](v9, "_reconfigureStreams");
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
    -[HMDCameraRemoteStreamControlManager streamSession](v9, "streamSession");
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
  HMDCameraRemoteStreamControlManager *v6;
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
  -[HMDCameraRemoteStreamControlManager streamSession](v6, "streamSession");
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
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB36F8];
  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoTierParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPickedTier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = CFSTR("kReconfiguredTier");
  v11[1] = CFSTR("kCameraSessionID");
  v12[0] = v7;
  -[HMDCameraStreamControlManager sessionID](self, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraRemoteStreamControlManager _dispatchReconfigureToResident:](self, "_dispatchReconfigureToResident:", v10);
}

- (void)_dispatchReconfigureToResident:(id)a3
{
  id v4;
  void *v5;
  HMDCameraRemoteStreamControlManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Dispatching the reconfigure request to resident", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_initWeak((id *)buf, v6);
  -[HMDCameraRemoteStreamControlManager residentMessageHandler](v6, "residentMessageHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager sessionID](v6, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRemoteStreamControlManager profileUniqueIdentifier](v6, "profileUniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlManager workQueue](v6, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__HMDCameraRemoteStreamControlManager__dispatchReconfigureToResident___block_invoke;
  v13[3] = &unk_1E89BF5C0;
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend(v9, "sendMessageWithName:cameraSessionID:payload:target:responseQueue:responseHandler:", CFSTR("kReconfigureRemoteStreamRequestKey"), v10, v4, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)_sendUpdatedConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  HMDCameraRemoteStreamControlManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCameraRemoteStreamControlManager *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMDCameraRemoteStreamControlManager streamSession](self, "streamSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamSender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDCameraStreamControlManager _callStreamReconfigured](self, "_callStreamReconfigured");
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending updated configuration", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDCameraRemoteStreamControlManager configGenerator](v6, "configGenerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRemoteStreamControlManager streamSession](v6, "streamSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "videoTierParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentPickedTier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v13 = objc_msgSend(v9, "extractReselectedConfigFromVideoTier:videoStreamConfig:", v12, &v21);
    v14 = v21;

    if ((v13 & 1) != 0)
    {
      -[HMDCameraRemoteStreamControlManager streamSession](v6, "streamSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "streamManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateStreamConfiguration:", v14);

    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = v6;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v20;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Reselected config failed to extract", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDCameraStreamControlManager _reportInternalErrorCode:](v18, "_reportInternalErrorCode:", 1046);
    }

  }
}

- (NSUUID)profileUniqueIdentifier
{
  return self->_profileUniqueIdentifier;
}

- (HMDCameraResidentMessageHandler)residentMessageHandler
{
  return self->_residentMessageHandler;
}

- (HMDCameraMediaConfigGenerator)configGenerator
{
  return (HMDCameraMediaConfigGenerator *)objc_getProperty(self, a2, 88, 1);
}

- (HMDCameraRemoteStreamSession)streamSession
{
  return (HMDCameraRemoteStreamSession *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStreamSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamSession, 0);
  objc_storeStrong((id *)&self->_configGenerator, 0);
  objc_storeStrong((id *)&self->_residentMessageHandler, 0);
  objc_storeStrong((id *)&self->_profileUniqueIdentifier, 0);
}

void __70__HMDCameraRemoteStreamControlManager__dispatchReconfigureToResident___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "streamSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = v8;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v13;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Received reply for reconfigure remote stream session for session", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      if (v5)
      {
        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = v11;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v17;
          v20 = 2112;
          v21 = v5;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Relayed reconfigure remote stream session request to resident failed: %@", (uint8_t *)&v18, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v15, "_cleanUpStreamSessionWithError:", v5);
      }
      else
      {
        objc_msgSend(v11, "_sendUpdatedConfiguration");
      }
    }
  }

}

uint64_t __59__HMDCameraRemoteStreamControlManager_stopStreamWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "streamSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return objc_msgSend(*(id *)(a1 + 32), "_stopCurrentStreamSessionWithError:", *(_QWORD *)(a1 + 40));
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@No current stream session to stop", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  return objc_msgSend(*(id *)(a1 + 32), "_reportErrorCode:", 3);
}

void __71__HMDCameraRemoteStreamControlManager_setUpRemoteConnectionWithDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "streamSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setUpRemoteConnectionWithDevice:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_ERROR, "%{public}@No current stream session to remotely set up", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

uint64_t __58__HMDCameraRemoteStreamControlManager__reconfigureStream___block_invoke(uint64_t a1)
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
    return objc_msgSend(*(id *)(a1 + 32), "_dispatchReconfigureToResident:", *(_QWORD *)(a1 + 40));
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
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@No current stream session to reconfigure", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  return objc_msgSend(*(id *)(a1 + 32), "_reportErrorCode:", 3);
}

uint64_t __57__HMDCameraRemoteStreamControlManager_reconfigureStream___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconfigureStream:", *(_QWORD *)(a1 + 40));
}

void __94__HMDCameraRemoteStreamControlManager__dispatchStartRequestToResidentWithVideoSSRC_audioSSRC___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "streamSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = v8;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v13;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Received reply for start remote stream session for session", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      if (v5)
      {
        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = v11;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v17;
          v20 = 2112;
          v21 = v5;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Relayed start remote stream session request to resident failed: %@", (uint8_t *)&v18, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v15, "_cleanUpStreamSessionWithError:", v5);
      }
      else
      {
        objc_msgSend(v11, "_streamStarted");
        objc_msgSend(v11, "_callStreamStarted");
      }
    }
  }

}

uint64_t __69__HMDCameraRemoteStreamControlManager_startStreamWithRemoteSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startStreamWithRemoteSettings:", *(_QWORD *)(a1 + 40));
}

void __55__HMDCameraRemoteStreamControlManager__negotiateStream__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "streamSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = v8;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v13;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Received reply for negotiate remote stream session", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      if (v5)
      {
        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = v11;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v17;
          v20 = 2112;
          v21 = v5;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Relayed negotiate remote stream session request to resident failed: %@", (uint8_t *)&v18, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v15, "_cleanUpStreamSessionWithError:", v5);
      }
      else
      {
        objc_msgSend(v11, "_setParametersSelected:", v6);
      }
    }
  }

}

uint64_t __54__HMDCameraRemoteStreamControlManager_negotiateStream__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_negotiateStream");
}

void __66__HMDCameraRemoteStreamControlManager_updateAudioVolume_callback___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "streamSession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAudioVolume:callback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __58__HMDCameraRemoteStreamControlManager_updateAudioSetting___block_invoke(uint64_t a1)
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
  if (logCategory__hmf_once_t30 != -1)
    dispatch_once(&logCategory__hmf_once_t30, &__block_literal_global_40);
  return (id)logCategory__hmf_once_v31;
}

void __50__HMDCameraRemoteStreamControlManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v31;
  logCategory__hmf_once_v31 = v0;

}

@end
