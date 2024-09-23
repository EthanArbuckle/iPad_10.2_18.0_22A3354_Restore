@implementation CNKFeatures

+ (CNKFeatures)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (CNKFeatures *)(id)sharedInstance_sFeatures;
}

void __29__CNKFeatures_sharedInstance__block_invoke()
{
  CNKFeatures *v0;
  void *v1;

  v0 = objc_alloc_init(CNKFeatures);
  v1 = (void *)sharedInstance_sFeatures;
  sharedInstance_sFeatures = (uint64_t)v0;

}

- (BOOL)isSystemApertureEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemApertureEnabled");

  return v3;
}

- (BOOL)isIncomingCallBannerEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIncomingCallBannerEnabled");

  return v3;
}

- (BOOL)isHeroImageEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHeroImageEnabled");

  return v3;
}

- (BOOL)isHeroTitleEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHeroTitleEnabled");

  return v3;
}

- (BOOL)isButtonLayoutEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isButtonLayoutEnabled");

  return v3;
}

- (BOOL)isUIFluidTransitionsEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUIFluidTransitionsEnabled");

  return v3;
}

- (BOOL)isDialPadEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDialPadEnabled");

  return v3;
}

- (BOOL)isEnhancedEmergencyEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnhancedEmergencyEnabled");

  return v3;
}

- (BOOL)shouldEmbedSwapBanner
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldEmbedSwapBanner");

  return v3;
}

- (BOOL)shouldShowFullScreenCallWaiting
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowFullScreenCallWaiting");

  return v3;
}

- (BOOL)callManagerEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "callManagerEnabled");

  return v3;
}

- (BOOL)isDominoEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDominoEnabled");

  return v3;
}

- (BOOL)isNameAndPhotoC3Enabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNameAndPhotoC3Enabled");

  return v3;
}

- (BOOL)buttonRemoteControlEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "buttonRemoteControlEnabled");

  return v3;
}

- (BOOL)callRecordingEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "callRecordingEnabled");

  return v3;
}

- (BOOL)callRecordingDominoEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "callRecordingDominoEnabled");

  return v3;
}

- (BOOL)requestToScreenShareEnabled
{
  void *v2;
  char v3;

  +[_CNKFeatures sharedInstance](_CNKFeatures, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requestToScreenShareEnabled");

  return v3;
}

@end
