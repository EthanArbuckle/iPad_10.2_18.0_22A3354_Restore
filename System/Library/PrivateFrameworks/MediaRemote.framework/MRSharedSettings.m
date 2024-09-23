@implementation MRSharedSettings

+ (MRSharedSettings)currentSettings
{
  if (currentSettings___once_0 != -1)
    dispatch_once(&currentSettings___once_0, &__block_literal_global_71);
  return (MRSharedSettings *)(id)currentSettings___currentSharedSettings;
}

- (BOOL)isMultiplayerHost
{
  int IsAudioAccessory;

  IsAudioAccessory = MSVDeviceIsAudioAccessory();
  if (IsAudioAccessory)
    LOBYTE(IsAudioAccessory) = _os_feature_enabled_impl();
  return IsAudioAccessory;
}

- (BOOL)canHostMultiplayerStream
{
  void *v2;
  BOOL v3;

  if (!-[MRSharedSettings isMultiplayerHost](self, "isMultiplayerHost"))
    return 0;
  +[MRAVClusterController sharedController](MRAVClusterController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "clusterType") != 2;

  return v3;
}

- (BOOL)supportNanoStandalone
{
  return 0;
}

void __35__MRSharedSettings_currentSettings__block_invoke()
{
  MRSharedSettings *v0;
  void *v1;

  v0 = objc_alloc_init(MRSharedSettings);
  v1 = (void *)currentSettings___currentSharedSettings;
  currentSettings___currentSharedSettings = (uint64_t)v0;

}

- (BOOL)supportGroupSession
{
  return _os_feature_enabled_impl();
}

- (BOOL)isMultiplayerAware
{
  return 1;
}

- (BOOL)supportShowMore
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportNowPlayingSessionDataSource
{
  int IsAudioAccessory;

  IsAudioAccessory = MSVDeviceIsAudioAccessory();
  if (IsAudioAccessory)
    LOBYTE(IsAudioAccessory) = _os_feature_enabled_impl();
  return IsAudioAccessory;
}

- (BOOL)supportSessionBasedUI
{
  int v2;

  v2 = _os_feature_enabled_impl();
  if (v2)
    LOBYTE(v2) = MRSupportsSystemUIActivities();
  return v2;
}

- (BOOL)supportSessionBasedLockScreenPlatter
{
  int v2;

  v2 = -[MRSharedSettings supportSessionBasedUI](self, "supportSessionBasedUI");
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

- (BOOL)supportLockScreenBackground
{
  int v2;

  v2 = -[MRSharedSettings supportSessionBasedLockScreenPlatter](self, "supportSessionBasedLockScreenPlatter");
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

- (BOOL)allowSingleRoomExpandedRows
{
  return _os_feature_enabled_impl();
}

- (BOOL)showMembersInsteadOfRooms
{
  return _os_feature_enabled_impl();
}

- (double)quickControlsInactiveTimeout
{
  void *v2;
  double v3;
  double v4;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quickControlsInactiveTimeout");
  v4 = v3;

  return v4;
}

- (double)lockScreenAPLTarget
{
  void *v2;
  double v3;
  double v4;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockScreenAPLTarget");
  v4 = v3;

  return v4;
}

- (double)lockScreenAPLRatio
{
  void *v2;
  double v3;
  double v4;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockScreenAPLRatio");
  v4 = v3;

  return v4;
}

- (BOOL)supportGroupSessionHome
{
  int v2;

  v2 = _os_feature_enabled_impl();
  if (MSVDeviceIsAudioAccessory())
    return v2 & _os_feature_enabled_impl();
  return v2;
}

- (BOOL)supportGroupSessionHomePodBoop
{
  int v2;

  v2 = -[MRSharedSettings supportGroupSessionHome](self, "supportGroupSessionHome");
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

- (BOOL)supportAirPlayLeaderInfoSync
{
  int v2;

  v2 = -[MRSharedSettings supportGroupSessionHomePodBoop](self, "supportGroupSessionHomePodBoop");
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

- (double)oneTapSuggestionInactiveTimeout
{
  void *v2;
  double v3;
  double v4;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oneTapSuggestionInactiveTimeout");
  v4 = v3;

  return v4;
}

- (double)autoRouteInactiveTimeout
{
  void *v2;
  double v3;
  double v4;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoRouteInactiveTimeout");
  v4 = v3;

  return v4;
}

- (BOOL)supportManyRecommendationsPlatters
{
  void *v2;
  char v3;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportManyRecommendationsPlatters");

  return v3;
}

- (BOOL)suppressScreenMirroringErrors
{
  void *v2;
  char v3;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suppressScreenMirroringErrors");

  return v3;
}

- (BOOL)verboseImageLoadingLogging
{
  void *v2;
  char v3;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verboseImageLoadingLogging");

  return v3;
}

- (BOOL)verboseMediaControlLogging
{
  void *v2;
  char v3;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verboseMediaControlLogging");

  return v3;
}

- (BOOL)supportPTOTRefactorPart2
{
  void *v2;
  char v3;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportPTOTRefactorPart2");

  return v3;
}

@end
