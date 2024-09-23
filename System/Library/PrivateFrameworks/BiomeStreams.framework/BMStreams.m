@implementation BMStreams

+ (BMDiscoverabilitySignalStream)discoverabilitySignal
{
  return objc_alloc_init(BMDiscoverabilitySignalStream);
}

+ (BMAppLaunchStream)appLaunch
{
  return objc_alloc_init(BMAppLaunchStream);
}

+ (BMSleepModeStream)sleepModeStream
{
  return objc_alloc_init(BMSleepModeStream);
}

+ (BMMediaUsageStream)mediaUsage
{
  return objc_alloc_init(BMMediaUsageStream);
}

+ (BMAppClipLaunchStream)appClipLaunch
{
  return objc_alloc_init(BMAppClipLaunchStream);
}

+ (BMIntentStream)intent
{
  return objc_alloc_init(BMIntentStream);
}

+ (BMPOICategoryStream)poiCategory
{
  return objc_alloc_init(BMPOICategoryStream);
}

+ (BMContextualActionsStream)contextualActions
{
  return objc_alloc_init(BMContextualActionsStream);
}

+ (BMUserFocusComputedModeStream)userFocusComputedMode
{
  return objc_alloc_init(BMUserFocusComputedModeStream);
}

+ (BMUserFocusActivityStream)userFocusActivity
{
  return objc_alloc_init(BMUserFocusActivityStream);
}

+ (BMCarPlayStream)carPlayStream
{
  return objc_alloc_init(BMCarPlayStream);
}

+ (BMDoNotDisturbWhileDrivingStream)doNotDisturbWhileDrivingStream
{
  return objc_alloc_init(BMDoNotDisturbWhileDrivingStream);
}

+ (BMHomeKitClientAccessoryControlStream)homeKitClientAccessoryControlStream
{
  return objc_alloc_init(BMHomeKitClientAccessoryControlStream);
}

+ (BMHomeKitClientMediaAccessoryControlStream)homeKitClientMediaAccessoryControlStream
{
  return objc_alloc_init(BMHomeKitClientMediaAccessoryControlStream);
}

+ (BMHomeKitClientActionSetStream)homeKitClientActionSetStream
{
  return objc_alloc_init(BMHomeKitClientActionSetStream);
}

+ (BMAlarmStream)alarmStream
{
  return objc_alloc_init(BMAlarmStream);
}

+ (BMScreenRecordingStream)screenRecordingStream
{
  return objc_alloc_init(BMScreenRecordingStream);
}

+ (BMScreenSharingStream)screenSharingStream
{
  return objc_alloc_init(BMScreenSharingStream);
}

+ (BMNowPlayingStream)nowPlayingStream
{
  return objc_alloc_init(BMNowPlayingStream);
}

+ (BMNotificationStream)notificationStream
{
  return objc_alloc_init(BMNotificationStream);
}

+ (BMGroupActivitySessionStream)groupActivitySessionStream
{
  return objc_alloc_init(BMGroupActivitySessionStream);
}

+ (BMSemanticLocationStream)semanticLocationStream
{
  return objc_alloc_init(BMSemanticLocationStream);
}

+ (BMBacklightStream)backlightStream
{
  return objc_alloc_init(BMBacklightStream);
}

+ (BMHealthKitWorkoutStream)healthKitWorkoutStream
{
  return objc_alloc_init(BMHealthKitWorkoutStream);
}

+ (BMAskToBuyStream)askToBuyStream
{
  return objc_alloc_init(BMAskToBuyStream);
}

+ (BMFindMyLocationChangeStream)findMyLocationChangeStream
{
  return objc_alloc_init(BMFindMyLocationChangeStream);
}

+ (BMSoundDetectionStream)soundDetection
{
  return objc_alloc_init(BMSoundDetectionStream);
}

+ (BMUserStatusChangeStream)userStatusChangeStream
{
  return objc_alloc_init(BMUserStatusChangeStream);
}

+ (BMTextInputSessionStream)textInputSessionStream
{
  return objc_alloc_init(BMTextInputSessionStream);
}

+ (BMScreenTimeRequestStream)screenTimeRequestStream
{
  return objc_alloc_init(BMScreenTimeRequestStream);
}

+ (BMDeviceMetadataStream)deviceMetadataStream
{
  return objc_alloc_init(BMDeviceMetadataStream);
}

+ (BMSchoolTimeStream)schoolTimeStream
{
  return objc_alloc_init(BMSchoolTimeStream);
}

+ (BMMindfulnessSessionStream)mindfulnessStream
{
  return objc_alloc_init(BMMindfulnessSessionStream);
}

+ (BMSiriIntentEventsStream)siriIntentEventsStream
{
  return objc_alloc_init(BMSiriIntentEventsStream);
}

+ (BMGameControllerStream)gameControllerStream
{
  return objc_alloc_init(BMGameControllerStream);
}

+ (BMSiriUIStream)siriUIStream
{
  return objc_alloc_init(BMSiriUIStream);
}

+ (BMReadMessageStream)readMessageStream
{
  return objc_alloc_init(BMReadMessageStream);
}

+ (BMSiriExecutionStream)siriExecutionStream
{
  return objc_alloc_init(BMSiriExecutionStream);
}

+ (BMPostSiriEngagementStream)postSiriEngagementStream
{
  return objc_alloc_init(BMPostSiriEngagementStream);
}

+ (BMCoreDuetStream)coreDuetStream
{
  BMCoreDuetStream *v2;
  void *v3;
  void *v4;
  BMCoreDuetStream *v5;

  v2 = [BMCoreDuetStream alloc];
  objc_msgSend(get_DKKnowledgeStoreClass_0(), "userKnowledgeStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDClientContextClass_0(), "userContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMCoreDuetStream initWithKnowledgeStore:clientContext:identifier:](v2, "initWithKnowledgeStore:clientContext:identifier:", v3, v4, CFSTR("CoreDuetStream"));

  return v5;
}

+ (BMCoreDuetStream)coreDuetSystemStream
{
  BMCoreDuetStream *v2;
  void *v3;
  void *v4;
  BMCoreDuetStream *v5;

  v2 = [BMCoreDuetStream alloc];
  objc_msgSend(get_DKKnowledgeStoreClass_0(), "knowledgeStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(get_CDClientContextClass_0(), "userContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMCoreDuetStream initWithKnowledgeStore:clientContext:identifier:](v2, "initWithKnowledgeStore:clientContext:identifier:", v3, v4, CFSTR("CoreDuetSystemStream"));

  return v5;
}

@end
