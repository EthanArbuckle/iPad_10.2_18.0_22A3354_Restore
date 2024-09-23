@implementation HMDCameraSnapshotManagerDataSource

- (id)createSnapshotLocalWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 snapshotRequestHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HMDCameraSnapshotLocal *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[HMDCameraSnapshotLocal initWithSessionID:workQueue:accessory:delegate:delegateQueue:snapshotRequestHandler:]([HMDCameraSnapshotLocal alloc], "initWithSessionID:workQueue:accessory:delegate:delegateQueue:snapshotRequestHandler:", v18, v17, v16, v15, v14, v13);

  return v19;
}

- (id)createLocalSnapshotSessionWithID:(id)a3 accessory:(id)a4 snapshotGetter:(id)a5 message:(id)a6 waitPeriod:(double)a7 reachabilityPath:(unint64_t)a8 cameraLocallyReachable:(BOOL)a9 snapshotForNotification:(BOOL)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDSnapshotLocalSession *v20;
  uint64_t v22;

  v10 = a9;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  LOBYTE(v22) = a10;
  v20 = -[HMDSnapshotLocalSession initWithSessionID:accessory:snapshotGetter:message:waitPeriod:reachabilityPath:cameraLocallyReachable:snapshotForNotification:]([HMDSnapshotLocalSession alloc], "initWithSessionID:accessory:snapshotGetter:message:waitPeriod:reachabilityPath:cameraLocallyReachable:snapshotForNotification:", v19, v18, v17, v16, a8, v10, a7, v22);

  return v20;
}

- (BOOL)supportsCameraSnapshotRequestViaRelay
{
  return +[HMDDeviceCapabilities supportsCameraSnapshotRequestViaRelay](HMDDeviceCapabilities, "supportsCameraSnapshotRequestViaRelay");
}

- (id)createSnapshotRemoteRelayReceiverWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 uniqueIdentifier:(id)a8 snapshotRequestHandler:(id)a9 residentMessageHandler:(id)a10 remoteDevice:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  HMDCameraSnapshotRemoteRelayReceiver *v26;

  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = -[HMDCameraSnapshotRemoteRelayReceiver initWithSessionID:workQueue:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:residentMessageHandler:remoteDevice:]([HMDCameraSnapshotRemoteRelayReceiver alloc], "initWithSessionID:workQueue:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:residentMessageHandler:remoteDevice:", v25, v24, v23, v22, v21, v20, v19, v18, v17);

  return v26;
}

@end
