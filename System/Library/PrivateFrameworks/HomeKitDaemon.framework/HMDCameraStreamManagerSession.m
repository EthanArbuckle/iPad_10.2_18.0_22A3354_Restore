@implementation HMDCameraStreamManagerSession

- (HMDCameraStreamManagerSession)initWithSessionID:(id)a3 destinationID:(id)a4 streamClientConnection:(id)a5 streamControlManager:(id)a6 setupWaitPeriod:(double)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  HMDCameraStreamManagerSession *v18;
  HMDCameraStreamManagerSession *v20;
  SEL v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  v16 = v15;
  if (!v15)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (a7 > 0.0)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, a7);
    v18 = -[HMDCameraStreamManagerSession initWithSessionID:destinationID:streamClientConnection:streamControlManager:streamSetupTimer:](self, "initWithSessionID:destinationID:streamClientConnection:streamControlManager:streamSetupTimer:", v12, v13, v14, v16, v17);

    return v18;
  }
LABEL_7:
  v20 = (HMDCameraStreamManagerSession *)_HMFPreconditionFailure();
  return -[HMDCameraStreamManagerSession initWithSessionID:destinationID:streamClientConnection:streamControlManager:streamSetupTimer:](v20, v21, v22, v23, v24, v25, v26);
}

- (HMDCameraStreamManagerSession)initWithSessionID:(id)a3 destinationID:(id)a4 streamClientConnection:(id)a5 streamControlManager:(id)a6 streamSetupTimer:(id)a7
{
  HMDCameraStreamSessionID *v12;
  id v13;
  HMDXPCClientConnection *v14;
  HMDCameraStreamControlManagerProtocol *v15;
  HMFTimer *v16;
  HMFTimer *v17;
  HMDCameraStreamManagerSession *v18;
  HMDCameraStreamSessionID *sessionID;
  HMDCameraStreamSessionID *v20;
  uint64_t v21;
  NSString *destinationID;
  HMDXPCClientConnection *streamClientConnection;
  HMDXPCClientConnection *v24;
  HMDCameraStreamControlManagerProtocol *streamControlManager;
  HMDCameraStreamControlManagerProtocol *v26;
  HMFTimer *streamSetupTimer;
  HMDCameraStreamManagerSession *v29;
  SEL v30;
  id *v31;
  objc_super v32;

  v12 = (HMDCameraStreamSessionID *)a3;
  v13 = a4;
  v14 = (HMDXPCClientConnection *)a5;
  v15 = (HMDCameraStreamControlManagerProtocol *)a6;
  v16 = (HMFTimer *)a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  if (!v15)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v17 = v16;
  if (v16)
  {
    v32.receiver = self;
    v32.super_class = (Class)HMDCameraStreamManagerSession;
    v18 = -[HMDCameraStreamManagerSession init](&v32, sel_init);
    sessionID = v18->_sessionID;
    v18->_sessionID = v12;
    v20 = v12;

    v21 = objc_msgSend(v13, "copy");
    destinationID = v18->_destinationID;
    v18->_destinationID = (NSString *)v21;

    streamClientConnection = v18->_streamClientConnection;
    v18->_streamClientConnection = v14;
    v24 = v14;

    streamControlManager = v18->_streamControlManager;
    v18->_streamControlManager = v15;
    v26 = v15;

    streamSetupTimer = v18->_streamSetupTimer;
    v18->_streamSetupTimer = v17;

    return v18;
  }
LABEL_7:
  v29 = (HMDCameraStreamManagerSession *)_HMFPreconditionFailure();
  return (HMDCameraStreamManagerSession *)-[HMDCameraStreamManagerSession canStartWithError:](v29, v30, v31);
}

- (BOOL)canStartWithError:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  BOOL result;
  void *v11;
  HMDCameraStreamManagerSession *v12;
  NSObject *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  HMDCameraStreamManagerSession *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraStreamManagerSession destinationID](self, "destinationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isResidentCapable");

  if (!v7)
    return 1;
  +[HMDCameraRemoteStreamTracker sharedTracker](HMDCameraRemoteStreamTracker, "sharedTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "startTrackingStreamSession:", self);

  if ((v9 & 1) != 0)
    return 1;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Stream tracker cannot start stream session: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1018);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a3 = v15;
  return result;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraStreamManagerSession sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDCameraStreamSessionID)sessionID
{
  return (HMDCameraStreamSessionID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)destinationID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMDXPCClientConnection)streamClientConnection
{
  return (HMDXPCClientConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStreamClientConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (HMDCameraStreamControlManagerProtocol)streamControlManager
{
  return (HMDCameraStreamControlManagerProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (HMFTimer)streamSetupTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (HMFMessage)currentMessage
{
  return (HMFMessage *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMessage, 0);
  objc_storeStrong((id *)&self->_streamSetupTimer, 0);
  objc_storeStrong((id *)&self->_streamControlManager, 0);
  objc_storeStrong((id *)&self->_streamClientConnection, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_8154 != -1)
    dispatch_once(&logCategory__hmf_once_t1_8154, &__block_literal_global_8155);
  return (id)logCategory__hmf_once_v2_8156;
}

void __44__HMDCameraStreamManagerSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_8156;
  logCategory__hmf_once_v2_8156 = v0;

}

@end
