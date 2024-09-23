@implementation ANAnnounceFeatureStatus

+ (BOOL)isEnabled
{
  return +[ANAnnounceFeatureStatus isAnnounceEnabled](ANAnnounceFeatureStatus, "isAnnounceEnabled");
}

+ (BOOL)isAnnounceEnabled
{
  return 1;
}

+ (BOOL)isSiriEndpointsATVEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)shouldStopPlaybackOnSiriActivation
{
  void *v2;
  char v3;

  +[ANDefaults sharedInstance](ANDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForDefault:", CFSTR("siri_interruption_stops_playback"));

  return v3;
}

+ (BOOL)isCommunicationUserNotificationsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isEnabledForPersonalDevices
{
  return 1;
}

@end
