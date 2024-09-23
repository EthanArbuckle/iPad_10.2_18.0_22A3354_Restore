@implementation HMDCameraIDSSessionInitiator

- (HMDCameraIDSSessionInitiator)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 localNetworkConfig:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HMDCameraIDSSessionInitiator *v21;
  HMDCameraIDSSessionInitiator *v22;
  void *v23;
  HMDCameraIDSSessionInitiator *v25;
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
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v20 = v19;
  if (!v19)
  {
LABEL_13:
    v25 = (HMDCameraIDSSessionInitiator *)_HMFPreconditionFailure();
    return (HMDCameraIDSSessionInitiator *)-[HMDCameraIDSSessionInitiator mtu](v25, v26);
  }
  v27.receiver = self;
  v27.super_class = (Class)HMDCameraIDSSessionInitiator;
  v21 = -[HMDCameraIDSSessionHandler initWithSessionID:workQueue:](&v27, sel_initWithSessionID_workQueue_, v14, v15);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_device, a5);
    objc_storeWeak((id *)&v22->_delegate, v18);
    objc_storeStrong((id *)&v22->_delegateQueue, a8);
    objc_storeStrong((id *)&v22->_localNetworkConfig, a6);
    +[HMDCameraPowerAssertionHandler sharedHandler](HMDCameraPowerAssertionHandler, "sharedHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerRemoteRequestHandler:forSessionID:", v22, v14);

  }
  return v22;
}

- (NSNumber)mtu
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMDCameraIDSSessionInitiator localNetworkConfig](self, "localNetworkConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "ipv6"))
    v4 = 2;
  else
    v4 = 1;

  v5 = (void *)MEMORY[0x24BDD16E0];
  -[HMDCameraIDSSessionHandler idsSession](self, "idsSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "MTUForAddressFamily:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v7;
}

- (void)dealloc
{
  void *v3;
  HMDCameraIDSSessionInitiator *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the IDS session initiator", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraIDSSessionInitiator packetRelay](v4, "packetRelay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stop");

  -[HMDCameraIDSSessionHandler idsSession](v4, "idsSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endSession");

  v9.receiver = v4;
  v9.super_class = (Class)HMDCameraIDSSessionInitiator;
  -[HMDCameraIDSSessionHandler dealloc](&v9, sel_dealloc);
}

- (void)openRelaySession
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDCameraIDSSessionHandler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HMDCameraIDSSessionInitiator_openRelaySession__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_sendInvitation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraIDSSessionInitiator *v16;
  NSObject *v17;
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
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraIDSSessionHandler idsStreamService](self, "idsStreamService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") && (objc_msgSend(v4, "anyObject"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24E96A7C0, *MEMORY[0x24BE4FBA0]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FB98]);
    -[HMDCameraIDSSessionInitiator localNetworkConfig](self, "localNetworkConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "ipv6");

    if ((v9 & 1) == 0)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24E96A7D8, *MEMORY[0x24BE4FB90]);
    v10 = (void *)MEMORY[0x24BE4FCD0];
    -[HMDCameraIDSSessionInitiator device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmd_sessionWithAccount:device:options:", v6, v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraIDSSessionHandler setIdsSession:](self, "setIdsSession:", v12);

    -[HMDCameraIDSSessionHandler idsSession](self, "idsSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraIDSSessionHandler workQueue](self, "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:queue:", self, v14);

    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraIDSSessionHandler idsSession](v16, "idsSession");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraIDSSessionInitiator device](v16, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v18;
      v32 = 2112;
      v33 = v19;
      v34 = 2112;
      v35 = v21;
      v36 = 2112;
      v37 = v7;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending out invitation for IDSSession %@ to device %@ with options: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDCameraIDSSessionHandler sessionID](v16, "sessionID", CFSTR("kCameraSessionID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sessionID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    encodeRootObject();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraIDSSessionHandler idsSession](v16, "idsSession");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sendInvitationWithData:", v25);

    -[HMDCameraIDSSessionHandler sessionID](v16, "sessionID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "markMilestoneFor:", CFSTR("IDSSessionInvitationSent"));

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1024);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraIDSSessionInitiator _callSessionEndedWithError:](self, "_callSessionEndedWithError:", v6);
  }

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
  -[HMDCameraIDSSessionHandler workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __146__HMDCameraIDSSessionInitiator_startPacketRelayWithVideoSocket_videoNetworkConfig_cameraVideoSSRC_audioSocket_audioNetworkConfig_cameraAudioSSRC___block_invoke;
  block[3] = &unk_24E788DE8;
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
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  int v25;

  v14 = a4;
  v15 = a7;
  -[HMDCameraIDSSessionHandler workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __147__HMDCameraIDSSessionInitiator__startPacketRelayWithVideoSocket_videoNetworkConfig_cameraVideoSSRC_audioSocket_audioNetworkConfig_cameraAudioSSRC___block_invoke;
  block[3] = &unk_24E788DE8;
  block[4] = self;
  v20 = v14;
  v22 = a5;
  v23 = a3;
  v21 = v15;
  v24 = a8;
  v25 = a6;
  v17 = v15;
  v18 = v14;
  dispatch_async(v16, block);

}

- (void)packetRelay:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v7 = a5;
  -[HMDCameraIDSSessionHandler workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HMDCameraIDSSessionInitiator_packetRelay_didStart_error___block_invoke;
  block[3] = &unk_24E799CF0;
  v12 = a4;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)packetRelay:(id)a3 didStop:(BOOL)a4 error:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v7 = a5;
  -[HMDCameraIDSSessionHandler workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HMDCameraIDSSessionInitiator_packetRelay_didStop_error___block_invoke;
  block[3] = &unk_24E799CF0;
  v12 = a4;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraIDSSessionInitiator *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v11;
    v14 = 2114;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Invitation for IDSSession %{public}@ has been accepted by: %@, waiting for session to get started", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraIDSSessionInitiator *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Invitation for IDSSession %@ has been declined by: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraIDSSessionInitiator _callSessionEndedWithError:](v9, "_callSessionEndedWithError:", 0);

}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraIDSSessionInitiator *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Invitation for IDSSession %@ was canceled by: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCameraIDSSessionInitiator _callSessionEndedWithError:](v9, "_callSessionEndedWithError:", 0);

}

- (void)sessionStarted:(id)a3
{
  id v4;
  void *v5;
  HMDCameraIDSSessionInitiator *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@IDSSession %{public}@ has started", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraIDSSessionHandler sessionID](v6, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markMilestoneFor:", CFSTR("IDSSessionStartedOnInitiator"));

  -[HMDCameraIDSSessionInitiator _callSessionStarted](v6, "_callSessionStarted");
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDCameraIDSSessionInitiator *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v13;
    v17 = 2114;
    v18 = v8;
    v19 = 1026;
    v20 = a4;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@IDSSession %{public}@ has ended with reason: %{public}u and error %{public}@", (uint8_t *)&v15, 0x26u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:underlyingError:", 1030, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraIDSSessionInitiator _callSessionEndedWithError:](v11, "_callSessionEndedWithError:", v14);

}

- (void)_callSessionStarted
{
  void *v3;
  HMDCameraIDSSessionInitiator *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  HMDCameraIDSSessionInitiator *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Calling didSetUp delegate", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraIDSSessionInitiator delegate](v4, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraIDSSessionInitiator delegateQueue](v4, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__HMDCameraIDSSessionInitiator__callSessionStarted__block_invoke;
    v9[3] = &unk_24E79C268;
    v10 = v7;
    v11 = v4;
    dispatch_async(v8, v9);

  }
}

- (void)_callSessionEndedWithError:(id)a3
{
  id v4;
  void *v5;
  HMDCameraIDSSessionInitiator *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  HMDCameraIDSSessionInitiator *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling didEndSession delegate with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraIDSSessionInitiator delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMDCameraIDSSessionInitiator delegateQueue](v6, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__HMDCameraIDSSessionInitiator__callSessionEndedWithError___block_invoke;
    block[3] = &unk_24E79BBD0;
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

  -[HMDCameraIDSSessionHandler sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDCameraIDSSessionInitiatorDelegate)delegate
{
  return (HMDCameraIDSSessionInitiatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  return self->_device;
}

- (HMDCameraNetworkConfig)localNetworkConfig
{
  return self->_localNetworkConfig;
}

- (AVCPacketRelay)packetRelay
{
  return (AVCPacketRelay *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPacketRelay:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (HMFOSTransaction)packetRelayTransaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPacketRelayTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetRelayTransaction, 0);
  objc_storeStrong((id *)&self->_packetRelay, 0);
  objc_storeStrong((id *)&self->_localNetworkConfig, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __59__HMDCameraIDSSessionInitiator__callSessionEndedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionInitiator:didEndSessionWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __51__HMDCameraIDSSessionInitiator__callSessionStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionInitiator:didSetUpWithError:", *(_QWORD *)(a1 + 40), 0);
}

void __58__HMDCameraIDSSessionInitiator_packetRelay_didStop_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Packet relay did stop: %@ error: %@", (uint8_t *)&v8, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
}

void __59__HMDCameraIDSSessionInitiator_packetRelay_didStart_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Packet relay did start: %{public}@ error: %{public}@", (uint8_t *)&v8, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
}

void __147__HMDCameraIDSSessionInitiator__startPacketRelayWithVideoSocket_videoNetworkConfig_cameraVideoSSRC_audioSocket_audioNetworkConfig_cameraAudioSSRC___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[2];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  _BYTE v65[18];
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F200]), "initWithName:", CFSTR("com.apple.homed.packet-relay"));
  objc_msgSend(*(id *)(a1 + 32), "setPacketRelayTransaction:", v2);

  objc_msgSend(*(id *)(a1 + 32), "idsSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDFD9F8]);
    objc_msgSend(*(id *)(a1 + 40), "ipAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIp:", v5);

    objc_msgSend(v4, "setIsIPv6:", objc_msgSend(*(id *)(a1 + 40), "ipv6"));
    objc_msgSend(*(id *)(a1 + 40), "rtpPort");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPort:", objc_msgSend(v6, "unsignedShortValue"));

    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFDA00]), "initWithIncomingSSRC:acceptPacketType:", *(unsigned int *)(a1 + 56), 0);
    objc_msgSend(MEMORY[0x24BDFDA10], "connectionWithSocket:remoteAddress:packetFilter:", *(unsigned __int16 *)(a1 + 60), v4);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_DWORD *)(a1 + 56);
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v63 = v10;
      v64 = 1024;
      *(_DWORD *)v65 = v11;
      *(_WORD *)&v65[4] = 2112;
      *(_QWORD *)&v65[6] = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Created video relay connection with SSRC %08x and config: %@", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v7);
    v13 = objc_alloc_init(MEMORY[0x24BDFD9F8]);
    objc_msgSend(*(id *)(a1 + 48), "ipAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIp:", v14);

    objc_msgSend(v13, "setIsIPv6:", objc_msgSend(*(id *)(a1 + 48), "ipv6"));
    objc_msgSend(*(id *)(a1 + 48), "rtpPort");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPort:", objc_msgSend(v15, "unsignedShortValue"));

    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFDA00]), "initWithIncomingSSRC:acceptPacketType:", *(unsigned int *)(a1 + 64), 0);
    objc_msgSend(MEMORY[0x24BDFDA10], "connectionWithSocket:remoteAddress:packetFilter:", *(unsigned __int16 *)(a1 + 68), v13);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_DWORD *)(a1 + 64);
      v22 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v63 = v20;
      v64 = 1024;
      *(_DWORD *)v65 = v21;
      *(_WORD *)&v65[4] = 2112;
      *(_QWORD *)&v65[6] = v22;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Created audio relay connection with SSRC %08x and config: %@", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v17);
    v23 = (void *)MEMORY[0x24BDFDA10];
    objc_msgSend(v3, "destination");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "connectionWithIDSDestination:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x227676638]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v16;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "destination");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v29;
      v64 = 2112;
      *(_QWORD *)v65 = v30;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Created IDS relay connection with destination: %@", buf, 0x16u);

      v16 = (uint64_t)v58;
    }

    objc_autoreleasePoolPop(v26);
    if (v59 && v16 && v25)
    {
      v31 = objc_alloc(MEMORY[0x24BDFDA08]);
      v61[0] = v59;
      v61[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0;
      v33 = (void *)objc_msgSend(v31, "initWithConnections:multiplexedConnection:error:", v32, v25, &v60);
      v34 = v60;
      objc_msgSend(*(id *)(a1 + 32), "setPacketRelay:", v33);

      objc_msgSend(*(id *)(a1 + 32), "packetRelay");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = (void *)MEMORY[0x227676638]();
      v37 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v35)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v63 = v40;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Starting packet relay", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v36);
        v41 = *(void **)(a1 + 32);
        objc_msgSend(v41, "packetRelay");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setDelegate:", v41);

        objc_msgSend(*(id *)(a1 + 32), "packetRelay");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "start");

        goto LABEL_25;
      }
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v55;
        v64 = 2112;
        *(_QWORD *)v65 = v34;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video packet relay: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v36);
      v54 = *(void **)(a1 + 32);
    }
    else
    {
      v49 = (void *)MEMORY[0x227676638]();
      v50 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v63 = v52;
        v64 = 2112;
        *(_QWORD *)v65 = v59;
        *(_WORD *)&v65[8] = 2112;
        *(_QWORD *)&v65[10] = v16;
        v66 = 2112;
        v67 = v25;
        _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to start packet relay with relayConnectionCameraVideo: %@, relayConnectionCameraAudio: %@, relayConnectionIDS: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v49);
      v53 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1017);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v54 = v53;
    }
    objc_msgSend(v54, "_callSessionEndedWithError:", v34);
LABEL_25:

    goto LABEL_26;
  }
  v44 = (void *)MEMORY[0x227676638]();
  v45 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v63 = v47;
    _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Cannot start packet relay because no IDS session exists", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v44);
  v48 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1017);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "_callSessionEndedWithError:", v4);
LABEL_26:

}

uint64_t __146__HMDCameraIDSSessionInitiator_startPacketRelayWithVideoSocket_videoNetworkConfig_cameraVideoSSRC_audioSocket_audioNetworkConfig_cameraAudioSSRC___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startPacketRelayWithVideoSocket:videoNetworkConfig:cameraVideoSSRC:audioSocket:audioNetworkConfig:cameraAudioSSRC:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 60), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 68));
}

uint64_t __48__HMDCameraIDSSessionInitiator_openRelaySession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendInvitation");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_26176 != -1)
    dispatch_once(&logCategory__hmf_once_t18_26176, &__block_literal_global_26177);
  return (id)logCategory__hmf_once_v19_26178;
}

void __43__HMDCameraIDSSessionInitiator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19_26178;
  logCategory__hmf_once_v19_26178 = v0;

}

@end
