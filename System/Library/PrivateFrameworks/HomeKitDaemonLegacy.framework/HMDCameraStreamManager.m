@implementation HMDCameraStreamManager

- (HMDCameraStreamManager)initWithSessionID:(id)a3 streamSnapshotHandler:(id)a4 workQueue:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 localVideoNetworkConfig:(id)a8 localAudioNetworkConfig:(id)a9 sessionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  HMDVideoStreamInterface *v24;
  HMDAudioStreamInterface *v25;
  HMDAudioStreamInterface *v26;
  HMDCameraStreamManager *v27;
  HMDCameraStreamManager *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v34;
  void *contexta;
  void *context;
  void *v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v38 = a9;
  v22 = a10;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v17)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v18)
  {
LABEL_19:
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  if (!v19)
  {
LABEL_20:
    _HMFPreconditionFailure();
LABEL_21:
    _HMFPreconditionFailure();
  }
  if (!v20)
    goto LABEL_21;
  v23 = v22;
  v24 = -[HMDVideoStreamInterface initWithSessionID:workQueue:delegate:delegateQueue:sessionHandler:localNetworkConfig:]([HMDVideoStreamInterface alloc], "initWithSessionID:workQueue:delegate:delegateQueue:sessionHandler:localNetworkConfig:", v16, v18, self, v18, v22, v21);
  v37 = v21;
  if (v24)
  {
    v25 = -[HMDAudioStreamInterface initWithSessionID:workQueue:delegate:delegateQueue:sessionHandler:localNetworkConfig:]([HMDAudioStreamInterface alloc], "initWithSessionID:workQueue:delegate:delegateQueue:sessionHandler:localNetworkConfig:", v16, v18, self, v18, v23, v38);
    v26 = v25;
    if (v25)
    {
      v27 = -[HMDCameraStreamManager initWithSessionID:streamSnapshotHandler:workQueue:delegate:delegateQueue:videoStreamInterface:audioStreamInterface:](self, "initWithSessionID:streamSnapshotHandler:workQueue:delegate:delegateQueue:videoStreamInterface:audioStreamInterface:", v16, v17, v18, v19, v20, v24, v25);
      v28 = v27;
    }
    else
    {
      context = (void *)MEMORY[0x1D17BA0A0]();
      v27 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v34;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audio stream interface", buf, 0xCu);

      }
      objc_autoreleasePoolPop(context);
      v28 = 0;
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      contexta = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v31;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video stream interface", buf, 0xCu);

      v29 = contexta;
    }

    objc_autoreleasePoolPop(v29);
    v28 = 0;
  }

  return v28;
}

- (HMDCameraStreamManager)initWithSessionID:(id)a3 streamSnapshotHandler:(id)a4 workQueue:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 videoStreamInterface:(id)a8 audioStreamInterface:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  HMDCameraStreamManager *v24;
  HMDCameraStreamManager *v25;
  HMDCameraStreamManager *result;
  HMDCameraStreamManager *v27;
  SEL v28;
  id obj;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v16 = a3;
  obj = a4;
  v17 = a4;
  v30 = a5;
  v18 = a5;
  v19 = a6;
  v31 = a7;
  v20 = a7;
  v32 = a8;
  v21 = a8;
  v22 = a9;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v19)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v20)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v21)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  v23 = v22;
  if (!v22)
  {
LABEL_17:
    v27 = (HMDCameraStreamManager *)_HMFPreconditionFailure();
    -[HMDCameraStreamManager dealloc](v27, v28);
    return result;
  }
  v33.receiver = self;
  v33.super_class = (Class)HMDCameraStreamManager;
  v24 = -[HMDCameraStreamManager init](&v33, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_sessionID, a3);
    objc_storeStrong((id *)&v25->_streamSnapshotHandler, obj);
    objc_storeStrong((id *)&v25->_workQueue, v30);
    objc_storeWeak((id *)&v25->_delegate, v19);
    objc_storeStrong((id *)&v25->_delegateQueue, v31);
    objc_storeStrong((id *)&v25->_videoStreamInterface, v32);
    objc_storeStrong((id *)&v25->_audioStreamInterface, a9);
  }

  return v25;
}

- (void)dealloc
{
  objc_super v3;

  -[HMDCameraStreamManager _stopStream](self, "_stopStream");
  v3.receiver = self;
  v3.super_class = (Class)HMDCameraStreamManager;
  -[HMDCameraStreamManager dealloc](&v3, sel_dealloc);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraStreamManager sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)audioStreamSetting
{
  void *v2;
  unint64_t v3;

  -[HMDCameraStreamManager audioStreamInterface](self, "audioStreamInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "audioStreamSetting");

  return v3;
}

- (void)startStreamWithVideoConfig:(id)a3 audioConfig:(id)a4
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
  -[HMDCameraStreamManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HMDCameraStreamManager_startStreamWithVideoConfig_audioConfig___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_startStreamWithVideoConfig:(id)a3 audioConfig:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDCameraStreamManager *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  HMDCameraNetworkConfig *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDCameraNetworkConfig *v27;
  HMDCameraNetworkConfig *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  HMDCameraNetworkConfig *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  HMDCameraStreamManager *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[7];
  _QWORD v77[7];
  uint8_t buf[4];
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraStreamManager videoStreamInterface](self, "videoStreamInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EFA946C8))
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  v74 = v6;
  v75 = v11;
  if (v11)
  {
    v16 = v7;
    if (v15)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v17;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Starting packet relay for remote stream", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v18 = [HMDCameraNetworkConfig alloc];
    objc_msgSend(v6, "remoteAddress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ip");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteAddress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isIPv6");
    v72 = v13;
    v23 = v6;
    v24 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v23, "remoteAddress");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "numberWithUnsignedShort:", objc_msgSend(v25, "port"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HMDCameraNetworkConfig initWithAddress:ipv6:rtpPort:](v18, "initWithAddress:ipv6:rtpPort:", v20, v22, v26);

    v28 = [HMDCameraNetworkConfig alloc];
    objc_msgSend(v16, "remoteAddress");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "ip");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "remoteAddress");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isIPv6");
    v33 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "remoteAddress");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "numberWithUnsignedShort:", objc_msgSend(v34, "port"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[HMDCameraNetworkConfig initWithAddress:ipv6:rtpPort:](v28, "initWithAddress:ipv6:rtpPort:", v30, v32, v35);

    v37 = v16;
    -[HMDCameraStreamManager videoStreamInterface](v72, "videoStreamInterface");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "localRTPSocket");
    v40 = objc_msgSend(v23, "deviceLocalSSRC");
    -[HMDCameraStreamManager audioStreamInterface](v72, "audioStreamInterface");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "localRTPSocket");
    v43 = objc_msgSend(v16, "deviceLocalSSRC");
    v44 = v75;
    objc_msgSend(v75, "startPacketRelayWithVideoSocket:videoNetworkConfig:cameraVideoSSRC:audioSocket:audioNetworkConfig:cameraAudioSSRC:", v39, v27, v40, v42, v36, v43);

    -[HMDCameraStreamManager _callRelayStarted](v72, "_callRelayStarted");
  }
  else
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v79 = v45;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Starting local stream", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDCameraStreamManager videoStreamInterface](v13, "videoStreamInterface");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "startStreamWithConfig:", v6);

    -[HMDCameraStreamManager audioStreamInterface](v13, "audioStreamInterface");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "startStreamWithConfig:", v7);

    objc_msgSend(v7, "audio");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "codecType") - 4;
    v71 = v7;
    if (v49 > 6)
    {
      v50 = 0;
      v51 = 0;
    }
    else
    {
      v50 = qword_1CDB8F3D0[v49];
      v51 = qword_1CDB8F408[v49];
    }

    v52 = objc_msgSend(v6, "SRTPCipherSuite");
    v53 = 1;
    if (v52 != 5)
      v53 = -1;
    if (v52 == 3)
      v54 = 0;
    else
      v54 = v53;
    v76[0] = CFSTR("ConfigResolution");
    v55 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "video");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v73, "videoResolution");
    if (v56 < 0xA)
      v57 = v56 + 1;
    else
      v57 = -1;
    objc_msgSend(v55, "numberWithUnsignedInteger:", v57);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v70;
    v76[1] = CFSTR("ConfigFramerate");
    v58 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "video");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "numberWithUnsignedInteger:", objc_msgSend(v69, "framerate"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v59;
    v76[2] = CFSTR("ConfigAudioCodec");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v51);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v60;
    v76[3] = CFSTR("ConfigSampleRate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v50);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v77[3] = v61;
    v76[4] = CFSTR("ConfigCryptoSuite");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v54);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v77[4] = v62;
    v76[5] = CFSTR("ConfigRXMinBitrate");
    v63 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "video");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "numberWithUnsignedInteger:", objc_msgSend(v64, "rxMinBitrate"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v77[5] = v65;
    v76[6] = CFSTR("ConfigRXMaxBitrate");
    v66 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "video");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "numberWithUnsignedInteger:", objc_msgSend(v67, "rxMaxBitrate"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v77[6] = v68;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 7);
    v27 = (HMDCameraNetworkConfig *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraStreamManager sessionID](v13, "sessionID");
    v36 = (HMDCameraNetworkConfig *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraNetworkConfig setParameterFor:value:](v36, "setParameterFor:value:", CFSTR("InitialConfiguration"), v27);
    v37 = v71;
    v44 = 0;
  }

}

- (void)updateReconfigurationMode:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDCameraStreamManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HMDCameraStreamManager_updateReconfigurationMode___block_invoke;
  v6[3] = &unk_1E89C2758;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)updateStreamConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraStreamManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HMDCameraStreamManager_updateStreamConfiguration___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_stopStream
{
  void *v3;
  HMDCameraStreamManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping stream", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraStreamManager streamSnapshotHandler](v4, "streamSnapshotHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamManager videoStreamInterface](v4, "videoStreamInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeVideoStreamInterface:", v8);

  -[HMDCameraStreamManager audioStreamInterface](v4, "audioStreamInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "state");

  if (v10 == 2)
  {
    -[HMDCameraStreamManager audioStreamInterface](v4, "audioStreamInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopStream");

  }
}

- (void)updateAudioSetting:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDCameraStreamManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__HMDCameraStreamManager_updateAudioSetting___block_invoke;
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
  -[HMDCameraStreamManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HMDCameraStreamManager_updateAudioVolume_callback___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_callStreamStarted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraStreamManager *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  HMDCameraStreamManager *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManager:didStartStream:slotIdentifier", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamManager delegateQueue](v7, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HMDCameraStreamManager__callStreamStarted___block_invoke;
    block[3] = &unk_1E89C20C8;
    v12 = v5;
    v13 = v7;
    v14 = v4;
    dispatch_async(v10, block);

  }
}

- (void)_callReceivedFirstFrame
{
  void *v3;
  void *v4;
  HMDCameraStreamManager *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  HMDCameraStreamManager *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDCameraStreamManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidReceiveFirstFrame:", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamManager delegateQueue](v5, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__HMDCameraStreamManager__callReceivedFirstFrame__block_invoke;
    v9[3] = &unk_1E89C2328;
    v10 = v3;
    v11 = v5;
    dispatch_async(v8, v9);

  }
}

- (void)_callRelayStarted
{
  void *v3;
  void *v4;
  HMDCameraStreamManager *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  HMDCameraStreamManager *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDCameraStreamManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidStartRelay:", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamManager delegateQueue](v5, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__HMDCameraStreamManager__callRelayStarted__block_invoke;
    v9[3] = &unk_1E89C2328;
    v10 = v3;
    v11 = v5;
    dispatch_async(v8, v9);

  }
}

- (void)_callStreamStoppedWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraStreamManager *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  HMDCameraStreamManager *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidStopStream", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamManager delegateQueue](v7, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HMDCameraStreamManager__callStreamStoppedWithError___block_invoke;
    block[3] = &unk_1E89C20C8;
    v12 = v5;
    v13 = v7;
    v14 = v4;
    dispatch_async(v10, block);

  }
}

- (void)_callNetworkImproved
{
  void *v3;
  void *v4;
  HMDCameraStreamManager *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  HMDCameraStreamManager *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDCameraStreamManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidNetworkImprove", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamManager delegateQueue](v5, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__HMDCameraStreamManager__callNetworkImproved__block_invoke;
    v9[3] = &unk_1E89C2328;
    v10 = v3;
    v11 = v5;
    dispatch_async(v8, v9);

  }
}

- (void)_callNetworkDeteriorated
{
  void *v3;
  void *v4;
  HMDCameraStreamManager *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  HMDCameraStreamManager *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDCameraStreamManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidNetworkDeteriorate", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamManager delegateQueue](v5, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__HMDCameraStreamManager__callNetworkDeteriorated__block_invoke;
    v9[3] = &unk_1E89C2328;
    v10 = v3;
    v11 = v5;
    dispatch_async(v8, v9);

  }
}

- (void)_callConfigurationUpdated
{
  void *v3;
  void *v4;
  HMDCameraStreamManager *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  HMDCameraStreamManager *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDCameraStreamManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamManagerDidUpdateConfiguration", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraStreamManager delegateQueue](v5, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__HMDCameraStreamManager__callConfigurationUpdated__block_invoke;
    v9[3] = &unk_1E89C2328;
    v10 = v3;
    v11 = v5;
    dispatch_async(v8, v9);

  }
}

- (void)videoStream:(id)a3 didStart:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraStreamManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraStreamManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDCameraStreamManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCameraStreamManager *v34;
  NSObject *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
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
    v37 = 138543362;
    v38 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Synchronizing video and audio streams", (uint8_t *)&v37, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraStreamManager audioStreamInterface](v9, "audioStreamInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamManager videoStreamInterface](v9, "videoStreamInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "streamToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startSynchronizationWithVideoStreamToken:", objc_msgSend(v14, "integerValue"));

  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = v9;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamManager videoStreamInterface](v16, "videoStreamInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "streamToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "unsignedIntegerValue");
    v37 = 138543618;
    v38 = v18;
    v39 = 2048;
    v40 = v21;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Creating AVCRemoteVideoClient with stream token: %lu", (uint8_t *)&v37, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v22 = objc_alloc(MEMORY[0x1E0CF22C8]);
  -[HMDCameraStreamManager videoStreamInterface](v16, "videoStreamInterface");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "streamToken");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v22, "initWithStreamToken:delegate:", objc_msgSend(v24, "unsignedIntegerValue"), v16);
  -[HMDCameraStreamManager setAvcRemoteVideo:](v16, "setAvcRemoteVideo:", v25);

  -[HMDCameraStreamManager avcRemoteVideo](v16, "avcRemoteVideo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "slotForMode:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamManager setSlotIdentifier:](v16, "setSlotIdentifier:", v27);

  v28 = (void *)MEMORY[0x1D17BA0A0]();
  v29 = v16;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamManager slotIdentifier](v29, "slotIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543618;
    v38 = v31;
    v39 = 2112;
    v40 = (uint64_t)v32;
    _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Updated slot identifier to %@", (uint8_t *)&v37, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  v33 = (void *)MEMORY[0x1D17BA0A0]();
  v34 = v29;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543362;
    v38 = v36;
    _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Video stream has started, waiting for the first frame to arrive", (uint8_t *)&v37, 0xCu);

  }
  objc_autoreleasePoolPop(v33);
  -[HMDCameraStreamManager _callStreamStarted:](v34, "_callStreamStarted:", 0);

}

- (void)videoStream:(id)a3 didStop:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraStreamManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Video stream session has stopped with error %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraStreamManager _callStreamStoppedWithError:](v9, "_callStreamStoppedWithError:", v7);

}

- (void)videoStreamDidNetworkImprove:(id)a3
{
  id v4;
  void *v5;
  HMDCameraStreamManager *v6;
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
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Video stream's network has improved", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraStreamManager _callNetworkImproved](v6, "_callNetworkImproved");

}

- (void)videoStreamDidNetworkDeteriorate:(id)a3
{
  id v4;
  void *v5;
  HMDCameraStreamManager *v6;
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
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Video stream's network has deteriorated", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraStreamManager _callNetworkDeteriorated](v6, "_callNetworkDeteriorated");

}

- (void)videoStreamDidUpdateConfiguration:(id)a3
{
  id v4;
  void *v5;
  HMDCameraStreamManager *v6;
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
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Video stream's configuration update complete", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraStreamManager _callConfigurationUpdated](v6, "_callConfigurationUpdated");

}

- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraStreamManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HMDCameraStreamManager_remoteVideoClientDidReceiveFirstFrame___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDCameraStreamManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__HMDCameraStreamManager_remoteVideoClient_remoteVideoAttributesDidChange___block_invoke;
  v8[3] = &unk_1E89C2328;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)remoteVideoClientDidReceiveLastFrame:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraStreamManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HMDCameraStreamManager_remoteVideoClientDidReceiveLastFrame___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)remoteVideoServerDidDie:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraStreamManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HMDCameraStreamManager_remoteVideoServerDidDie___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (NSNumber)slotIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSlotIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSNumber)aspectRatio
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAspectRatio:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (HMDVideoStreamInterface)videoStreamInterface
{
  return (HMDVideoStreamInterface *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAudioStreamInterface)audioStreamInterface
{
  return (HMDAudioStreamInterface *)objc_getProperty(self, a2, 32, 1);
}

- (HMDCameraStreamSessionID)sessionID
{
  return (HMDCameraStreamSessionID *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCameraStreamManagerDelegate)delegate
{
  return (HMDCameraStreamManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (HMDCameraStreamSnapshotHandler)streamSnapshotHandler
{
  return (HMDCameraStreamSnapshotHandler *)objc_getProperty(self, a2, 72, 1);
}

- (AVCRemoteVideoClient)avcRemoteVideo
{
  return (AVCRemoteVideoClient *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAvcRemoteVideo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avcRemoteVideo, 0);
  objc_storeStrong((id *)&self->_streamSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_audioStreamInterface, 0);
  objc_storeStrong((id *)&self->_videoStreamInterface, 0);
  objc_storeStrong((id *)&self->_aspectRatio, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
}

void __50__HMDCameraStreamManager_remoteVideoServerDidDie___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Video server has died", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
}

void __63__HMDCameraStreamManager_remoteVideoClientDidReceiveLastFrame___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Last frame has been received", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
}

void __75__HMDCameraStreamManager_remoteVideoClient_remoteVideoAttributesDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Remote video attributes did change: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
}

void __64__HMDCameraStreamManager_remoteVideoClientDidReceiveFirstFrame___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
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
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@First frame has been received", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "remoteVideoAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ratio");
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8 / v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAspectRatio:", v11);

  objc_msgSend(*(id *)(a1 + 40), "slotForMode:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSlotIdentifier:", v12);

  objc_msgSend(*(id *)(a1 + 32), "_callReceivedFirstFrame");
  objc_msgSend(*(id *)(a1 + 32), "streamSnapshotHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "videoStreamInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addVideoStreamInterface:", v14);

}

uint64_t __51__HMDCameraStreamManager__callConfigurationUpdated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamManagerDidUpdateConfiguration:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__HMDCameraStreamManager__callNetworkDeteriorated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamManagerDidNetworkDeteriorate:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__HMDCameraStreamManager__callNetworkImproved__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamManagerDidNetworkImprove:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__HMDCameraStreamManager__callStreamStoppedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamManagerDidStopStream:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __43__HMDCameraStreamManager__callRelayStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamManagerDidStartRelay:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__HMDCameraStreamManager__callReceivedFirstFrame__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamManagerDidReceiveFirstFrame:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__HMDCameraStreamManager__callStreamStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamManager:didStartStreamWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __53__HMDCameraStreamManager_updateAudioVolume_callback___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "audioStreamInterface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAudioVolume:callback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __45__HMDCameraStreamManager_updateAudioSetting___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "audioStreamInterface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAudioSetting:", *(_QWORD *)(a1 + 40));

}

void __52__HMDCameraStreamManager_updateStreamConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
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
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "videoStreamInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateStreamConfiguration:", *(_QWORD *)(a1 + 40));

  v17[0] = CFSTR("ConfigResolution");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "video");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "videoResolution");
  if (v5 < 0xA)
    v6 = v5 + 1;
  else
    v6 = -1;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v17[1] = CFSTR("ReconfigTimestamp");
  +[HMDCameraSessionID uptimeNumberInMilliseconds](HMDCameraSessionID, "uptimeNumberInMilliseconds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  v17[2] = CFSTR("ConfigRXMinBitrate");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "video");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "rxMinBitrate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  v17[3] = CFSTR("ConfigRXMaxBitrate");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "video");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "rxMaxBitrate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addParameterFor:value:", CFSTR("Reconfigurations"), v15);

}

void __52__HMDCameraStreamManager_updateReconfigurationMode___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "videoStreamInterface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateReconfigurationMode:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __65__HMDCameraStreamManager_startStreamWithVideoConfig_audioConfig___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startStreamWithVideoConfig:audioConfig:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_15669 != -1)
    dispatch_once(&logCategory__hmf_once_t2_15669, &__block_literal_global_15670);
  return (id)logCategory__hmf_once_v3_15671;
}

void __37__HMDCameraStreamManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_15671;
  logCategory__hmf_once_v3_15671 = v0;

}

@end
