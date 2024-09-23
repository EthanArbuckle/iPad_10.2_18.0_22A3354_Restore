@implementation _HMMutableCameraUserSettings

- (id)copyWithZone:(_NSZone *)a3
{
  _HMCameraUserSettings *v4;
  void *v5;
  _HMCameraUserSettings *v6;
  void *v7;
  void *v8;

  v4 = [_HMCameraUserSettings alloc];
  -[_HMCameraUserSettings UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_HMCameraUserSettings initWithUUID:](v4, "initWithUUID:", v5);

  -[_HMCameraUserSettings setSupportedFeatures:](v6, "setSupportedFeatures:", -[_HMCameraUserSettings supportedFeatures](self, "supportedFeatures"));
  -[_HMCameraUserSettings setAccessModeAtHome:](v6, "setAccessModeAtHome:", -[_HMCameraUserSettings accessModeAtHome](self, "accessModeAtHome"));
  -[_HMCameraUserSettings setAccessModeNotAtHome:](v6, "setAccessModeNotAtHome:", -[_HMCameraUserSettings accessModeNotAtHome](self, "accessModeNotAtHome"));
  -[_HMCameraUserSettings setCurrentAccessMode:](v6, "setCurrentAccessMode:", -[_HMCameraUserSettings currentAccessMode](self, "currentAccessMode"));
  -[_HMCameraUserSettings setRecordingEventTriggers:](v6, "setRecordingEventTriggers:", -[_HMCameraUserSettings recordingEventTriggers](self, "recordingEventTriggers"));
  -[_HMCameraUserSettings setCameraManuallyDisabled:](v6, "setCameraManuallyDisabled:", -[_HMCameraUserSettings isCameraManuallyDisabled](self, "isCameraManuallyDisabled"));
  -[_HMCameraUserSettings notificationSettings](self, "notificationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMCameraUserSettings setNotificationSettings:](v6, "setNotificationSettings:", v7);

  -[_HMCameraUserSettings activityZones](self, "activityZones");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMCameraUserSettings setActivityZones:](v6, "setActivityZones:", v8);

  -[_HMCameraUserSettings setActivityZonesIncludedForSignificantEventDetection:](v6, "setActivityZonesIncludedForSignificantEventDetection:", -[_HMCameraUserSettings areActivityZonesIncludedForSignificantEventDetection](self, "areActivityZonesIncludedForSignificantEventDetection"));
  return v6;
}

@end
