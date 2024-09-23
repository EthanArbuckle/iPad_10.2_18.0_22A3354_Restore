@implementation _CNKFeatures

- (_CNKFeatures)init
{
  return (_CNKFeatures *)Features.init()();
}

+ (_CNKFeatures)sharedInstance
{
  return (_CNKFeatures *)static Features.shared.getter();
}

- (BOOL)isSystemApertureEnabled
{
  _CNKFeatures *v2;
  char v3;

  v2 = self;
  v3 = Features.isSystemApertureEnabled.getter();

  return v3 & 1;
}

- (BOOL)isIncomingCallBannerEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.isIncomingCallBannerEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isHeroImageEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.isHeroImageEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isHeroTitleEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.isHeroTitleEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isEnhancedEmergencyEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.isEnhancedEmergencyEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isDialPadEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.isDialPadEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isButtonLayoutEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.isButtonLayoutEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isScreeningLiveActivityEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.isScreeningLiveActivityEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)shouldEmbedSwapBanner
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.shouldEmbedSwapBanner.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)shouldShowFullScreenCallWaiting
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.shouldShowFullScreenCallWaiting.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isDominoEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.isDominoEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isNameAndPhotoC3Enabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.isNameAndPhotoC3Enabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)callManagerEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.callManagerEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)hudActivityManagerEnabled
{
  _CNKFeatures *v2;
  char v3;

  v2 = self;
  v3 = Features.hudActivityManagerEnabled.getter();

  return v3 & 1;
}

- (BOOL)requestToScreenShareEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.requestToScreenShareEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)usesModernScreenSharingFromMessages
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.usesModernScreenSharingFromMessages.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isAppProtectionEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.isAppProtectionEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)buttonRemoteControlEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.buttonRemoteControlEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isUIFluidTransitionsEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.isUIFluidTransitionsEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)callRecordingEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.callRecordingEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)callRecordingDominoEnabled
{
  _CNKFeatures *v2;
  char v3;
  char v4;

  v2 = self;
  Features.callRecordingDominoEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

@end
