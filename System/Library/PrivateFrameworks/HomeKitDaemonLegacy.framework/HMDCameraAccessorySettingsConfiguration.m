@implementation HMDCameraAccessorySettingsConfiguration

- (HMDCameraAccessorySettingsConfiguration)initWithCameraAccessory:(id)a3
{
  id v4;
  HMDCameraAccessorySettingsConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCameraAccessorySettingsConfiguration;
  v5 = -[HMDCameraAccessorySettingsConfiguration init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "cameraProfileSettingsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_isRecordingCapable = objc_msgSend(v4, "isCameraRecordingFeatureSupported");
    objc_msgSend(v4, "cameraProfileSettingsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isRecordingEnabled = objc_msgSend(v8, "isRecordingEnabled");

    v5->_recordingEventTriggers = objc_msgSend(v7, "recordingEventTriggers");
    objc_msgSend(v7, "activityZones");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numActivityZones = objc_msgSend(v9, "count");

    v5->_inclusionZone = objc_msgSend(v7, "areActivityZonesIncludedForSignificantEventDetection");
    objc_msgSend(v7, "notificationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_smartBulletinBoardNotificationEnabled = objc_msgSend(v10, "isSmartBulletinBoardNotificationEnabled");

    objc_msgSend(v7, "notificationSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_reachabilityNotificationEnabled = objc_msgSend(v11, "isReachabilityEventNotificationEnabled");

  }
  return v5;
}

- (BOOL)isRecordingCapable
{
  return self->_isRecordingCapable;
}

- (BOOL)isRecordingEnabled
{
  return self->_isRecordingEnabled;
}

- (unint64_t)recordingEventTriggers
{
  return self->_recordingEventTriggers;
}

- (unint64_t)numActivityZones
{
  return self->_numActivityZones;
}

- (BOOL)inclusionZone
{
  return self->_inclusionZone;
}

- (BOOL)smartBulletinBoardNotificationEnabled
{
  return self->_smartBulletinBoardNotificationEnabled;
}

- (BOOL)reachabilityNotificationEnabled
{
  return self->_reachabilityNotificationEnabled;
}

@end
