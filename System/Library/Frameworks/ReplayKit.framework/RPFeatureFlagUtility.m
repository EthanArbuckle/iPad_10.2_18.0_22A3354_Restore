@implementation RPFeatureFlagUtility

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_9);
  return (id)sharedInstance__RPFeatureFlagUtility;
}

void __38__RPFeatureFlagUtility_sharedInstance__block_invoke()
{
  RPFeatureFlagUtility *v0;
  void *v1;

  v0 = objc_alloc_init(RPFeatureFlagUtility);
  v1 = (void *)sharedInstance__RPFeatureFlagUtility;
  sharedInstance__RPFeatureFlagUtility = (uint64_t)v0;

}

- (RPFeatureFlagUtility)init
{
  RPFeatureFlagUtility *v2;
  int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPFeatureFlagUtility;
  v2 = -[RPFeatureFlagUtility init](&v5, sel_init);
  if (v2)
  {
    v2->_stereoAudioControlCenter = _os_feature_enabled_impl();
    v2->_systemBannerEnabled = SBSIsSystemApertureAvailable();
    v3 = _os_feature_enabled_impl();
    if (v3)
      LOBYTE(v3) = MGGetBoolAnswer();
    v2->_alwaysOnDisplayEnabled = v3;
    v2->_screenRecordingCameraPip = _os_feature_enabled_impl();
    v2->_screenCaptureAlertEnabled = 1;
    v2->_independentWindowAlwaysHDEnabled = _os_feature_enabled_impl();
    v2->_coreGraphicsCaptureAPINotificiationEnabled = _os_feature_enabled_impl();
    v2->_coreGraphicsProxyingEnabled = 1;
    v2->_largePresenterOverlayFullHDPlus = _os_feature_enabled_impl();
    v2->_replayKitScreenRecordingHEVC = _os_feature_enabled_impl();
    v2->_audioDSPAutomaticMicModeEnabled = _os_feature_enabled_impl();
    v2->_screenCaptureKitRecordingHDR = _os_feature_enabled_impl();
  }
  return v2;
}

- (BOOL)screenRecordingCameraPip
{
  return self->_screenRecordingCameraPip;
}

- (BOOL)stereoAudioControlCenter
{
  return self->_stereoAudioControlCenter;
}

- (BOOL)systemBannerEnabled
{
  return self->_systemBannerEnabled;
}

- (BOOL)screenCaptureAlertEnabled
{
  return 1;
}

- (BOOL)coreGraphicsCaptureAPINotificiationEnabled
{
  return self->_coreGraphicsCaptureAPINotificiationEnabled;
}

- (BOOL)largePresenterOverlayFullHDPlus
{
  return self->_largePresenterOverlayFullHDPlus;
}

- (BOOL)replayKitScreenRecordingHEVC
{
  return self->_replayKitScreenRecordingHEVC;
}

- (BOOL)screenCaptureKitRecordingHDR
{
  return self->_screenCaptureKitRecordingHDR;
}

- (BOOL)alwaysOnDisplayEnabled
{
  return self->_alwaysOnDisplayEnabled;
}

- (BOOL)independentWindowAlwaysHDEnabled
{
  return self->_independentWindowAlwaysHDEnabled;
}

- (BOOL)coreGraphicsProxyingEnabled
{
  return self->_coreGraphicsProxyingEnabled;
}

- (BOOL)audioDSPAutomaticMicModeEnabled
{
  return self->_audioDSPAutomaticMicModeEnabled;
}

@end
