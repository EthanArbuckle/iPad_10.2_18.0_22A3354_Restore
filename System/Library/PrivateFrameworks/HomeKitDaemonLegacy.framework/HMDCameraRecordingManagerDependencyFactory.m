@implementation HMDCameraRecordingManagerDependencyFactory

- (HMDFeaturesDataSource)featuresDataSource
{
  return objc_alloc_init(HMDFeaturesDataSource);
}

- (HMFPreferences)preferences
{
  return (HMFPreferences *)objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
}

- (id)createSettingsControl:(id)a3 accessory:(id)a4 managementService:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDCameraRecordingSettingsControl *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDCameraRecordingSettingsControl initWithWorkQueue:accessory:recordingManagementService:]([HMDCameraRecordingSettingsControl alloc], "initWithWorkQueue:accessory:recordingManagementService:", v9, v8, v7);

  return v10;
}

- (id)createTimelineManagerWithWorkQueue:(id)a3 fragmentDuration:(double)a4 fragmentCreationReferenceDate:(id)a5 logIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  HMDCameraRecordingSessionTimelineManager *v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[HMDCameraRecordingSessionTimelineManager initWithWorkQueue:fragmentDuration:fragmentCreationReferenceDate:logIdentifier:]([HMDCameraRecordingSessionTimelineManager alloc], "initWithWorkQueue:fragmentDuration:fragmentCreationReferenceDate:logIdentifier:", v11, v10, v9, a4);

  return v12;
}

- (id)createLoadBalancingAttemptWithLocalResponseTimeout:(double)a3 logIdentifier:(id)a4
{
  id v5;
  HMDCameraRecordingLoadBalancingAttempt *v6;

  v5 = a4;
  v6 = -[HMDCameraRecordingLoadBalancingAttempt initWithLocalResponseTimeout:logIdentifier:]([HMDCameraRecordingLoadBalancingAttempt alloc], "initWithLocalResponseTimeout:logIdentifier:", v5, a3);

  return v6;
}

- (id)createRecordingSessionWithWorkQueue:(id)a3 camera:(id)a4 hapAccessory:(id)a5 home:(id)a6 localZone:(id)a7 configuredFragmentDuration:(double)a8 timelineManager:(id)a9 homePresenceByPairingIdentity:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  HMDCameraRecordingSession *v24;

  v17 = a10;
  v18 = a9;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = -[HMDCameraRecordingSession initWithWorkQueue:camera:hapAccessory:home:localZone:configuredFragmentDuration:timelineManager:homePresenceByPairingIdentity:]([HMDCameraRecordingSession alloc], "initWithWorkQueue:camera:hapAccessory:home:localZone:configuredFragmentDuration:timelineManager:homePresenceByPairingIdentity:", v23, v22, v21, v20, v19, v18, a8, v17);

  return v24;
}

- (id)createSessionNotificationTrigger:(id)a3 workQueue:(id)a4
{
  id v5;
  id v6;
  HMDCameraRecordingSessionNotificationTrigger *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDCameraRecordingSessionNotificationTrigger initWithCamera:workQueue:]([HMDCameraRecordingSessionNotificationTrigger alloc], "initWithCamera:workQueue:", v6, v5);

  return v7;
}

- (id)createBulkSendSessionInitiatorWithWorkQueue:(id)a3 accessory:(id)a4
{
  id v5;
  id v6;
  HMDCameraRecordingBulkSendSessionInitiator *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDCameraRecordingBulkSendSessionInitiator initWithWorkQueue:accessory:]([HMDCameraRecordingBulkSendSessionInitiator alloc], "initWithWorkQueue:accessory:", v6, v5);

  return v7;
}

- (id)createBulkSendSessionReaderWithWorkQueue:(id)a3 session:(id)a4 readTimeout:(double)a5 logIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  HMDCameraRecordingBulkSendSessionReader *v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[HMDCameraRecordingBulkSendSessionReader initWithWorkQueue:session:readTimeout:logIdentifier:]([HMDCameraRecordingBulkSendSessionReader alloc], "initWithWorkQueue:session:readTimeout:logIdentifier:", v11, v10, v9, a5);

  return v12;
}

- (id)createTimerWithTimeInterval:(double)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, a3);
}

- (id)createRecordingSessionRetryContextWithWorkQueue:(id)a3 homePresenceByPairingIdentity:(id)a4
{
  id v5;
  id v6;
  HMDCameraRecordingSessionRetryContext *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDCameraRecordingSessionRetryContext initWithWorkQueue:homePresenceByPairingIdentity:]([HMDCameraRecordingSessionRetryContext alloc], "initWithWorkQueue:homePresenceByPairingIdentity:", v6, v5);

  return v7;
}

@end
