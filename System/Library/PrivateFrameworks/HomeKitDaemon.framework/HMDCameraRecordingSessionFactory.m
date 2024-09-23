@implementation HMDCameraRecordingSessionFactory

- (double)maximumClipDuration
{
  double result;

  +[HMDCameraClipManager maximumClipDuration](HMDCameraClipManager, "maximumClipDuration");
  return result;
}

- (double)recordingExtensionDuration
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("cameraRecordingExtensionDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (id)createVideoAnalyzerWithConfiguration:(id)a3 identifier:(id)a4
{
  uint64_t v5;

  v5 = 0;
  objc_msgSend(MEMORY[0x24BE4D220], "analyzerWithConfiguration:identifier:error:", a3, a4, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createSignificantEventManagerWithWorkQueue:(id)a3 faceClassificationResolver:(id)a4 logIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDCameraRecordingSessionSignificantEventManager *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDCameraRecordingSessionSignificantEventManager initWithWorkQueue:faceClassificationResolver:logIdentifier:]([HMDCameraRecordingSessionSignificantEventManager alloc], "initWithWorkQueue:faceClassificationResolver:logIdentifier:", v9, v8, v7);

  return v10;
}

- (id)createTimelapseFragmentManagerWithLogIdentifier:(id)a3
{
  id v3;
  HMDCameraRecordingSessionVariantFragmentManager *v4;

  v3 = a3;
  v4 = -[HMDCameraRecordingSessionVariantFragmentManager initWithLogIdentifier:]([HMDCameraRecordingSessionVariantFragmentManager alloc], "initWithLogIdentifier:", v3);

  return v4;
}

- (id)createUploaderWithClipUUID:(id)a3 startDate:(id)a4 targetFragmentDuration:(double)a5 quality:(int64_t)a6 localZone:(id)a7 workQueue:(id)a8 logIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDCameraClipUploader *v20;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a4;
  v19 = a3;
  v20 = -[HMDCameraClipUploader initWithClipUUID:startDate:targetFragmentDuration:quality:localZone:workQueue:logIdentifier:]([HMDCameraClipUploader alloc], "initWithClipUUID:startDate:targetFragmentDuration:quality:localZone:workQueue:logIdentifier:", v19, v18, a6, v17, v16, v15, a5);

  return v20;
}

- (BOOL)isVideoInitData:(id)a3 combinableWithVideoInitData:(id)a4
{
  return objc_msgSend(MEMORY[0x24BE4D268], "isInitializationSegment:combinableWithInitializationSegment:", a3, a4);
}

@end
