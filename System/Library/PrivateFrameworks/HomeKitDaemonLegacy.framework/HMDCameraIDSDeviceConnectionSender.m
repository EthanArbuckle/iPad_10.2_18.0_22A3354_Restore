@implementation HMDCameraIDSDeviceConnectionSender

- (HMDCameraIDSDeviceConnectionSender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 delegate:(id)a6 delegateQueue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  HMDCameraIDSDeviceConnectionSender *v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "proxyService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMDCameraIDSDeviceConnectionSender initWithSessionID:workQueue:device:delegate:delegateQueue:idsProxyStreamService:](self, "initWithSessionID:workQueue:device:delegate:delegateQueue:idsProxyStreamService:", v16, v15, v14, v13, v12, v18);

  return v19;
}

- (HMDCameraIDSDeviceConnectionSender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 idsProxyStreamService:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HMDCameraIDSDeviceConnectionSender *v21;
  HMDCameraIDSDeviceConnectionSender *v22;
  void *v23;
  HMDCameraIDSDeviceConnectionSender *result;
  HMDCameraIDSDeviceConnectionSender *v25;
  SEL v26;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v20 = v19;
  if (!v19)
  {
LABEL_13:
    v25 = (HMDCameraIDSDeviceConnectionSender *)_HMFPreconditionFailure();
    -[HMDCameraIDSDeviceConnectionSender dealloc](v25, v26);
    return result;
  }
  v27.receiver = self;
  v27.super_class = (Class)HMDCameraIDSDeviceConnectionSender;
  v21 = -[HMDCameraIDSDeviceConnection initWithSessionID:workQueue:idsProxyStreamService:](&v27, sel_initWithSessionID_workQueue_idsProxyStreamService_, v14, v15, v19);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_device, a5);
    objc_storeWeak((id *)&v22->_delegate, v17);
    objc_storeStrong((id *)&v22->_delegateQueue, a7);
    +[HMDCameraPowerAssertionHandler sharedHandler](HMDCameraPowerAssertionHandler, "sharedHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerRemoteRequestHandler:forSessionID:", v22, v14);

  }
  return v22;
}

- (void)dealloc
{
  void *v3;
  HMDCameraIDSDeviceConnectionSender *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the IDS connection sender", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraIDSDeviceConnectionSender videoPacketRelay](v4, "videoPacketRelay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stop");

  -[HMDCameraIDSDeviceConnectionSender audioPacketRelay](v4, "audioPacketRelay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stop");

  v9.receiver = v4;
  v9.super_class = (Class)HMDCameraIDSDeviceConnectionSender;
  -[HMDCameraIDSDeviceConnection dealloc](&v9, sel_dealloc);
}

- (void)openRelaySession
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDCameraIDSDeviceConnection workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMDCameraIDSDeviceConnectionSender_openRelaySession__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (NSNumber)mtu
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraIDSDeviceConnection watchVideoConnection](self, "watchVideoConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "mtu"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)startPacketRelayWithIDSDeviceSession:(id)a3 cameraVideoSSRC:(unsigned int)a4 cameraAudioSSRC:(unsigned int)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  unsigned int v13;
  unsigned int v14;

  v8 = a3;
  -[HMDCameraIDSDeviceConnection workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__HMDCameraIDSDeviceConnectionSender_startPacketRelayWithIDSDeviceSession_cameraVideoSSRC_cameraAudioSSRC___block_invoke;
  block[3] = &unk_1E89BE2F0;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(v9, block);

}

- (void)_startPacketRelayWithIDSDeviceSession:(id)a3 cameraVideoSSRC:(unsigned int)a4 cameraAudioSSRC:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  HMDCameraIDSDeviceConnectionSender *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCameraIDSDeviceConnectionSender *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDCameraIDSDeviceConnectionSender *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  HMDCameraIDSDeviceConnectionSender *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  _QWORD v53[3];

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v53[2] = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28628]), "initWithName:", CFSTR("com.apple.homed.packet-relay"));
  -[HMDCameraIDSDeviceConnectionSender setPacketRelayTransaction:](self, "setPacketRelayTransaction:", v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v50 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@IDS Session is present", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2298]), "initWithIncomingSSRC:acceptPacketType:", v6, 0);
  v14 = (void *)MEMORY[0x1E0CF22A8];
  -[HMDCameraIDSDeviceConnection watchVideoConnection](v10, "watchVideoConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "connectionWithSocket:remoteAddress:packetFilter:", (unsigned __int16)objc_msgSend(v15, "socket"), 0, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = v10;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v20;
    v51 = 1024;
    LODWORD(v52) = v6;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Creating video relay connection with SSRC %08x", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v17);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2298]), "initWithIncomingSSRC:acceptPacketType:", v5, 0);
  v22 = (void *)MEMORY[0x1E0CF22A8];
  -[HMDCameraIDSDeviceConnection watchAudioConnection](v18, "watchAudioConnection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "connectionWithSocket:remoteAddress:packetFilter:", (unsigned __int16)objc_msgSend(v23, "socket"), 0, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1D17BA0A0]();
  v26 = v18;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v28;
    v51 = 1024;
    LODWORD(v52) = v5;
    _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Creating audio relay connection with SSRC %08x", buf, 0x12u);

  }
  objc_autoreleasePoolPop(v25);
  v29 = (void *)MEMORY[0x1E0CF22A8];
  v30 = v47;
  objc_msgSend(v47, "destination");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "connectionWithIDSDestination:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 || !v24 || !v32)
  {
    v42 = (void *)MEMORY[0x1D17BA0A0]();
    v38 = v26;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v44;
      _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to create relay objects", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v42);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1017);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v33 = objc_alloc(MEMORY[0x1E0CF22A0]);
  v53[0] = v16;
  v53[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v35 = (void *)objc_msgSend(v33, "initWithConnections:multiplexedConnection:error:", v34, v32, &v48);
  v36 = v48;
  -[HMDCameraIDSDeviceConnectionSender setVideoPacketRelay:](v26, "setVideoPacketRelay:", v35);

  v37 = (void *)MEMORY[0x1D17BA0A0]();
  v38 = v26;
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v36)
  {
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v41;
      v51 = 2114;
      v52 = v36;
      _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video packet relay with error %{public}@", buf, 0x16u);

      v30 = v47;
    }

    objc_autoreleasePoolPop(v37);
LABEL_17:
    -[HMDCameraIDSDeviceConnectionSender _callSessionEndedWithError:](v38, "_callSessionEndedWithError:", v36, v47);
    goto LABEL_18;
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v50 = v45;
    _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_INFO, "%{public}@Starting packet relay", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v37);
  -[HMDCameraIDSDeviceConnectionSender videoPacketRelay](v38, "videoPacketRelay");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "start");

  v36 = 0;
  v30 = v47;
LABEL_18:

}

- (void)startPacketRelayWithVideoSocket:(int)a3 videoNetworkConfig:(id)a4 cameraVideoSSRC:(unsigned int)a5 audioSocket:(int)a6 audioNetworkConfig:(id)a7 cameraAudioSSRC:(unsigned int)a8
{
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;

  v14 = a4;
  v15 = a7;
  -[HMDCameraIDSDeviceConnection workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __152__HMDCameraIDSDeviceConnectionSender_startPacketRelayWithVideoSocket_videoNetworkConfig_cameraVideoSSRC_audioSocket_audioNetworkConfig_cameraAudioSSRC___block_invoke;
  block[3] = &unk_1E89B2C18;
  block[4] = self;
  v20 = v14;
  v22 = a3;
  v23 = a5;
  v21 = v15;
  v24 = a6;
  v25 = a8;
  v17 = v15;
  v18 = v14;
  dispatch_async(v16, block);

}

- (void)_startPacketRelayWithVideoSocket:(int)a3 videoNetworkConfig:(id)a4 cameraVideoSSRC:(unsigned int)a5 audioSocket:(int)a6 audioNetworkConfig:(id)a7 cameraAudioSSRC:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v10;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v8 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a3;
  v12 = (objc_class *)MEMORY[0x1E0D28628];
  v13 = a7;
  v14 = a4;
  v15 = (void *)objc_msgSend([v12 alloc], "initWithName:", CFSTR("com.apple.homed.packet-connection-relay"));
  -[HMDCameraIDSDeviceConnectionSender setPacketRelayTransaction:](self, "setPacketRelayTransaction:", v15);

  objc_msgSend(v14, "ipAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rtpPort");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraIDSDeviceConnectionSender _startVideoPacketRelay:ipAddress:port:](self, "_startVideoPacketRelay:ipAddress:port:", v10, v16, objc_msgSend(v17, "unsignedIntegerValue"));
  objc_msgSend(v13, "ipAddress");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rtpPort");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraIDSDeviceConnectionSender _startAudioPacketRelay:ipAddress:port:](self, "_startAudioPacketRelay:ipAddress:port:", v8, v19, objc_msgSend(v18, "unsignedIntegerValue"));
}

- (void)_startVideoPacketRelay:(int)a3 ipAddress:(id)a4 port:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  HMDCameraIDSDeviceConnectionSender *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  HMDCameraIDSDeviceConnectionSender *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[HMDCameraIDSDeviceConnection watchVideoConnection](self, "watchVideoConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v16 = 0;
    v19 = 0;
LABEL_11:
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v29;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to create relay objects", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1017);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraIDSDeviceConnection watchVideoConnection](v11, "watchVideoConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v34 = v13;
    v35 = 2112;
    v36 = v8;
    v37 = 2048;
    v38 = a5;
    v39 = 1024;
    v40 = a3;
    v41 = 1024;
    v42 = objc_msgSend(v14, "socket");
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating video relay between %@:%tu (%d,%d)", buf, 0x2Cu);

  }
  objc_autoreleasePoolPop(v10);
  v15 = objc_alloc_init(MEMORY[0x1E0CF2290]);
  objc_msgSend(v15, "setIp:", v8);
  objc_msgSend(v15, "setPort:", (unsigned __int16)a5);
  objc_msgSend(MEMORY[0x1E0CF22A8], "connectionWithSocket:remoteAddress:", (unsigned __int16)a3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CF22A8];
  -[HMDCameraIDSDeviceConnection watchVideoConnection](v11, "watchVideoConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "connectionWithSocket:", (unsigned __int16)objc_msgSend(v18, "socket"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 || !v19)
    goto LABEL_11;
  v32 = 0;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF22A0]), "initWithConnection:connection:error:", v16, v19, &v32);
  v21 = v32;
  -[HMDCameraIDSDeviceConnectionSender setVideoPacketRelay:](v11, "setVideoPacketRelay:", v20);

  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = v11;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v21)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v26;
      v35 = 2114;
      v36 = v21;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video packet relay with error %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
LABEL_14:
    -[HMDCameraIDSDeviceConnectionSender _callSessionEndedWithError:](v23, "_callSessionEndedWithError:", v21);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v30;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Starting packet relay for video", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  -[HMDCameraIDSDeviceConnectionSender videoPacketRelay](v23, "videoPacketRelay");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "start");

  v21 = 0;
LABEL_15:

}

- (void)_startAudioPacketRelay:(int)a3 ipAddress:(id)a4 port:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  HMDCameraIDSDeviceConnectionSender *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  HMDCameraIDSDeviceConnectionSender *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[HMDCameraIDSDeviceConnection watchAudioConnection](self, "watchAudioConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v16 = 0;
    v19 = 0;
LABEL_11:
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v29;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to create relay objects", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1017);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraIDSDeviceConnection watchAudioConnection](v11, "watchAudioConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v34 = v13;
    v35 = 2112;
    v36 = v8;
    v37 = 2048;
    v38 = a5;
    v39 = 1024;
    v40 = a3;
    v41 = 1024;
    v42 = objc_msgSend(v14, "socket");
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating audio relay between %@:%tu (%d,%d)", buf, 0x2Cu);

  }
  objc_autoreleasePoolPop(v10);
  v15 = objc_alloc_init(MEMORY[0x1E0CF2290]);
  objc_msgSend(v15, "setIp:", v8);
  objc_msgSend(v15, "setPort:", (unsigned __int16)a5);
  objc_msgSend(MEMORY[0x1E0CF22A8], "connectionWithSocket:remoteAddress:", (unsigned __int16)a3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CF22A8];
  -[HMDCameraIDSDeviceConnection watchAudioConnection](v11, "watchAudioConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "connectionWithSocket:", (unsigned __int16)objc_msgSend(v18, "socket"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 || !v19)
    goto LABEL_11;
  v32 = 0;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF22A0]), "initWithConnection:connection:error:", v16, v19, &v32);
  v21 = v32;
  -[HMDCameraIDSDeviceConnectionSender setAudioPacketRelay:](v11, "setAudioPacketRelay:", v20);

  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = v11;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v21)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v26;
      v35 = 2112;
      v36 = v21;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audio packet relay with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
LABEL_14:
    -[HMDCameraIDSDeviceConnectionSender _callSessionEndedWithError:](v23, "_callSessionEndedWithError:", v21);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v30;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Starting packet relay for audio", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  -[HMDCameraIDSDeviceConnectionSender audioPacketRelay](v23, "audioPacketRelay");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "start");

  v21 = 0;
LABEL_15:

}

- (void)_socketOpenedWithError:(id)a3
{
  id v4;
  void *v5;
  HMDCameraIDSDeviceConnectionSender *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  HMDCameraIDSDeviceConnectionSender *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling didSetup delegate with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraIDSDeviceConnectionSender delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraIDSDeviceConnectionSender delegateQueue](v6, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__HMDCameraIDSDeviceConnectionSender__socketOpenedWithError___block_invoke;
    block[3] = &unk_1E89C20C8;
    v12 = v9;
    v13 = v6;
    v14 = v4;
    dispatch_async(v10, block);

  }
}

- (void)_callSessionEndedWithError:(id)a3
{
  id v4;
  void *v5;
  HMDCameraIDSDeviceConnectionSender *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  HMDCameraIDSDeviceConnectionSender *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling didEndSession delegate with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraIDSDeviceConnectionSender delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraIDSDeviceConnectionSender delegateQueue](v6, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HMDCameraIDSDeviceConnectionSender__callSessionEndedWithError___block_invoke;
    block[3] = &unk_1E89C20C8;
    v12 = v9;
    v13 = v6;
    v14 = v4;
    dispatch_async(v10, block);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraIDSDeviceConnection sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDCameraIDSDeviceConnectionSenderDelegate)delegate
{
  return (HMDCameraIDSDeviceConnectionSenderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HMDDevice)device
{
  return (HMDDevice *)objc_getProperty(self, a2, 120, 1);
}

- (AVCPacketRelay)videoPacketRelay
{
  return (AVCPacketRelay *)objc_getProperty(self, a2, 128, 1);
}

- (void)setVideoPacketRelay:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (AVCPacketRelay)audioPacketRelay
{
  return (AVCPacketRelay *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAudioPacketRelay:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (HMFOSTransaction)packetRelayTransaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPacketRelayTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetRelayTransaction, 0);
  objc_storeStrong((id *)&self->_audioPacketRelay, 0);
  objc_storeStrong((id *)&self->_videoPacketRelay, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __65__HMDCameraIDSDeviceConnectionSender__callSessionEndedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deviceConnectionSender:didEndSessionWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __61__HMDCameraIDSDeviceConnectionSender__socketOpenedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deviceConnectionSender:didSetUpWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __152__HMDCameraIDSDeviceConnectionSender_startPacketRelayWithVideoSocket_videoNetworkConfig_cameraVideoSSRC_audioSocket_audioNetworkConfig_cameraAudioSSRC___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startPacketRelayWithVideoSocket:videoNetworkConfig:cameraVideoSSRC:audioSocket:audioNetworkConfig:cameraAudioSSRC:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 60), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 68));
}

uint64_t __107__HMDCameraIDSDeviceConnectionSender_startPacketRelayWithIDSDeviceSession_cameraVideoSSRC_cameraAudioSSRC___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startPacketRelayWithIDSDeviceSession:cameraVideoSSRC:cameraAudioSSRC:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
}

void __54__HMDCameraIDSDeviceConnectionSender_openRelaySession__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "device");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_createStreamSocketWithDevice:", v2);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17_104721 != -1)
    dispatch_once(&logCategory__hmf_once_t17_104721, &__block_literal_global_104722);
  return (id)logCategory__hmf_once_v18_104723;
}

void __49__HMDCameraIDSDeviceConnectionSender_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v18_104723;
  logCategory__hmf_once_v18_104723 = v0;

}

@end
