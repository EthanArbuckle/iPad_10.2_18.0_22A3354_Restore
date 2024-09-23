@implementation HMDCameraStreamControlMessageHandlerDataSource

- (BOOL)supportsReceivingRemoteCameraStream
{
  return +[HMDDeviceCapabilities supportsReceivingRemoteCameraStream](HMDDeviceCapabilities, "supportsReceivingRemoteCameraStream");
}

- (BOOL)supportsBidirectionalAudioForCameraStreaming
{
  return +[HMDDeviceCapabilities supportsBidirectionalAudioForCameraStreaming](HMDDeviceCapabilities, "supportsBidirectionalAudioForCameraStreaming");
}

- (BOOL)isResidentCapable
{
  void *v2;
  char v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isResidentCapable");

  return v3;
}

- (HMDCameraNetworkConfig)localNetworkConfig
{
  return (HMDCameraNetworkConfig *)+[HMDCameraNetworkConfig localIPAddress](HMDCameraNetworkConfig, "localIPAddress");
}

- (id)createLocalStreamControlManagerWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 reachabilityPath:(unint64_t)a6 device:(id)a7 delegate:(id)a8 delegateQueue:(id)a9 accessory:(id)a10 streamManagementService:(id)a11 localNetworkConfig:(id)a12 remoteCapabilities:(id)a13 supportedConfigCache:(id)a14 streamPreference:(id)a15
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  HMDCameraLocalStreamControlManager *v23;
  id v25;
  id v26;
  id v27;
  id v29;
  id v30;
  id v33;
  id v35;

  v30 = a15;
  v27 = a14;
  v26 = a13;
  v35 = a12;
  v17 = a11;
  v18 = a10;
  v19 = a9;
  v25 = a8;
  v20 = a7;
  v29 = a5;
  v21 = a4;
  v33 = a3;
  v22 = v20;
  v23 = -[HMDCameraLocalStreamControlManager initWithSessionID:workQueue:streamSnapshotHandler:reachabilityPath:device:delegate:delegateQueue:accessory:streamManagementService:localNetworkConfig:remoteCapabilities:supportedConfigCache:streamPreference:]([HMDCameraLocalStreamControlManager alloc], "initWithSessionID:workQueue:streamSnapshotHandler:reachabilityPath:device:delegate:delegateQueue:accessory:streamManagementService:localNetworkConfig:remoteCapabilities:supportedConfigCache:streamPreference:", v33, v21, v29, a6, v20, v25, v19, v18, v17, v35, v26, v27, v30);

  return v23;
}

- (id)createRemoteStreamControlManagerWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 reachabilityPath:(unint64_t)a6 device:(id)a7 delegate:(id)a8 delegateQueue:(id)a9 accessory:(id)a10 streamManagementService:(id)a11 remoteCapabilities:(id)a12 profileUniqueIdentifier:(id)a13 residentMessageHandler:(id)a14 remoteAccessDevice:(id)a15 streamPreference:(id)a16
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  HMDCameraRemoteStreamControlManager *v23;
  id v25;
  id v26;
  id v27;
  id v29;
  id v30;
  id v32;
  id v33;
  id v35;
  id v37;

  v33 = a16;
  v30 = a15;
  v25 = a14;
  v27 = a13;
  v26 = a12;
  v37 = a11;
  v18 = a10;
  v19 = a9;
  v29 = a8;
  v20 = a7;
  v32 = a5;
  v35 = a4;
  v21 = a3;
  v22 = v20;
  v23 = -[HMDCameraRemoteStreamControlManager initWithSessionID:workQueue:streamSnapshotHandler:reachabilityPath:device:delegate:delegateQueue:accessory:streamManagementService:remoteCapabilities:profileUniqueIdentifier:residentMessageHandler:remoteAccessDevice:streamPreference:]([HMDCameraRemoteStreamControlManager alloc], "initWithSessionID:workQueue:streamSnapshotHandler:reachabilityPath:device:delegate:delegateQueue:accessory:streamManagementService:remoteCapabilities:profileUniqueIdentifier:residentMessageHandler:remoteAccessDevice:streamPreference:", v21, v35, v32, a6, v20, v29, v19, v18, v37, v26, v27, v25, v30, v33);

  return v23;
}

- (id)createStreamManagerSessionWithSessionID:(id)a3 destinationID:(id)a4 streamClientConnection:(id)a5 streamControlManager:(id)a6 setupWaitPeriod:(double)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDCameraStreamManagerSession *v15;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[HMDCameraStreamManagerSession initWithSessionID:destinationID:streamClientConnection:streamControlManager:setupWaitPeriod:]([HMDCameraStreamManagerSession alloc], "initWithSessionID:destinationID:streamClientConnection:streamControlManager:setupWaitPeriod:", v14, v13, v12, v11, a7);

  return v15;
}

- (id)createDynamicActivityAttributionPublisher
{
  return objc_alloc_init(HMDDynamicActivityAttributionPublisher);
}

@end
