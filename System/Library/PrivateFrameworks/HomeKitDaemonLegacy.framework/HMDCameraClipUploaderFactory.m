@implementation HMDCameraClipUploaderFactory

- (id)createCreateClipOperationForClipModelID:(id)a3 localZone:(id)a4 targetFragmentDuration:(double)a5 clipStartDate:(id)a6 quality:(int64_t)a7 encryptionManager:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDCameraClipCreateClipOperation *v17;

  v13 = a8;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  v17 = -[HMDCameraClipCreateClipOperation initWithClipModelID:localZone:targetFragmentDuration:clipStartDate:quality:encryptionManager:]([HMDCameraClipCreateClipOperation alloc], "initWithClipModelID:localZone:targetFragmentDuration:clipStartDate:quality:encryptionManager:", v16, v15, v14, a7, v13, a5);

  return v17;
}

- (id)createCreateClipWithSignificantEventOperationForClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6 targetFragmentDuration:(double)a7 clipStartDate:(id)a8 quality:(int64_t)a9 encryptionManager:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HMDCameraClipCreateClipWithSignificantEventOperation *v23;

  v17 = a10;
  v18 = a8;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = -[HMDCameraClipCreateClipWithSignificantEventOperation initWithClipModelID:localZone:significantEvent:homePresenceByPairingIdentity:targetFragmentDuration:clipStartDate:quality:encryptionManager:]([HMDCameraClipCreateClipWithSignificantEventOperation alloc], "initWithClipModelID:localZone:significantEvent:homePresenceByPairingIdentity:targetFragmentDuration:clipStartDate:quality:encryptionManager:", v22, v21, v20, v19, v18, a9, a7, v17);

  return v23;
}

- (id)createUploadVideoSegmentOperationForModelID:(id)a3 localZone:(id)a4 data:(id)a5 metadata:(id)a6 encryptionManager:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  HMDCameraClipUploadVideoSegmentOperation *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[HMDCameraClipAppendStreamingAssetOperation initWithClipModelID:localZone:data:metadata:encryptionManager:]([HMDCameraClipUploadVideoSegmentOperation alloc], "initWithClipModelID:localZone:data:metadata:encryptionManager:", v15, v14, v13, v12, v11);

  return v16;
}

- (id)createAddSignificantEventOperationForClipModelID:(id)a3 localZone:(id)a4 significantEvent:(id)a5 homePresenceByPairingIdentity:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  HMDCameraClipAddSignificantEventOperation *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[HMDCameraClipAddSignificantEventOperation initWithClipModelID:localZone:significantEvent:homePresenceByPairingIdentity:]([HMDCameraClipAddSignificantEventOperation alloc], "initWithClipModelID:localZone:significantEvent:homePresenceByPairingIdentity:", v12, v11, v10, v9);

  return v13;
}

- (id)createFinalizeClipOperationForModelID:(id)a3 localZone:(id)a4
{
  id v5;
  id v6;
  HMDCameraClipFinalizeClipOperation *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDCameraClipOperation initWithClipModelID:localZone:]([HMDCameraClipFinalizeClipOperation alloc], "initWithClipModelID:localZone:", v6, v5);

  return v7;
}

@end
