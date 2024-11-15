@implementation MRUFeatureFlagProvider

+ (BOOL)isRelativeVolumeUIEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDynamicCoversheetEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAutobahnEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isFavoritesEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isQuickControlsLiveWaveformEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPlatterLiveWaveformEnabled
{
  int v2;

  v2 = objc_msgSend(a1, "isAutobahnEnabled");
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

+ (BOOL)isMediaSuggestionsPushEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isImageCachingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSpatialOnAggregateDevices
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isVolumeInputControlCenterEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isDominoAttentionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNewVolumeControlsMediaControlsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isRoutePickerNotCollapseGroupAutomaticallyEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isArtworkControllerEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMediaSuggestionsDevEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCuminTestUIEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCayenneEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNewControlsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNewControlsRouteExpandAllLayoutsEnabled
{
  return _os_feature_enabled_impl();
}

@end
