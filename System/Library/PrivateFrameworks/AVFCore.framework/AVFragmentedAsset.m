@implementation AVFragmentedAsset

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

+ (AVFragmentedAsset)fragmentedAssetWithURL:(NSURL *)URL options:(NSDictionary *)options
{
  return (AVFragmentedAsset *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:options:", URL, options);
}

- (AVFragmentedAsset)initWithURL:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  if (a4)
    v6 = (id)objc_msgSend(a4, "mutableCopy");
  else
    v6 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = v6;
  objc_msgSend(v6, "setValue:forKey:", *MEMORY[0x1E0C9AE50], 0x1E30399D8);
  v9.receiver = self;
  v9.super_class = (Class)AVFragmentedAsset;
  return -[AVURLAsset initWithURL:options:](&v9, sel_initWithURL_options_, a3, v7);
}

- (BOOL)_mindsFragments
{
  return 1;
}

- (Class)_classForAssetTracks
{
  return (Class)objc_opt_class();
}

- (NSArray)tracks
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedAsset;
  return (NSArray *)-[AVURLAsset tracks](&v3, sel_tracks);
}

- (AVFragmentedAssetTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedAsset;
  return (AVFragmentedAssetTrack *)-[AVAsset trackWithTrackID:](&v4, sel_trackWithTrackID_, *(_QWORD *)&trackID);
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedAsset;
  return -[AVAsset tracksWithMediaType:](&v4, sel_tracksWithMediaType_, mediaType);
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedAsset;
  return -[AVAsset tracksWithMediaCharacteristic:](&v4, sel_tracksWithMediaCharacteristic_, mediaCharacteristic);
}

- (BOOL)isAssociatedWithFragmentMinder
{
  return objc_msgSend(-[AVURLAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "isAssociatedWithFragmentMinder");
}

- (void)_setIsAssociatedWithFragmentMinder:(BOOL)a3
{
  objc_msgSend(-[AVURLAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_setIsAssociatedWithFragmentMinder:", a3);
}

@end
