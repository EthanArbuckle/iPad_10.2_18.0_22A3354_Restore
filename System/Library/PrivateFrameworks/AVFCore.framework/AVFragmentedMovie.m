@implementation AVFragmentedMovie

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

- (AVFragmentedMovie)initWithURL:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  AVFragmentedMovie *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v9, "setValue:forKey:", *MEMORY[0x1E0C9AE50], 0x1E30399D8);
  v13.receiver = self;
  v13.super_class = (Class)AVFragmentedMovie;
  v11 = -[AVMovie initWithURL:options:](&v13, sel_initWithURL_options_, v6, v10);

  return v11;
}

- (BOOL)_mindsFragments
{
  return 1;
}

- (BOOL)_needsLegacyChangeNotifications
{
  return 1;
}

- (Class)_classForMovieTracks
{
  return (Class)objc_opt_class();
}

- (NSArray)tracks
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedMovie;
  -[AVMovie tracks](&v3, sel_tracks);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (AVFragmentedMovieTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedMovie;
  -[AVMovie trackWithTrackID:](&v4, sel_trackWithTrackID_, *(_QWORD *)&trackID);
  return (AVFragmentedMovieTrack *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedMovie;
  -[AVMovie tracksWithMediaType:](&v4, sel_tracksWithMediaType_, mediaType);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedMovie;
  -[AVMovie tracksWithMediaCharacteristic:](&v4, sel_tracksWithMediaCharacteristic_, mediaCharacteristic);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isAssociatedWithFragmentMinder
{
  void *v2;
  char v3;

  -[AVMovie _assetInspectorLoader](self, "_assetInspectorLoader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAssociatedWithFragmentMinder");

  return v3;
}

- (void)_setIsAssociatedWithFragmentMinder:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AVMovie _assetInspectorLoader](self, "_assetInspectorLoader");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setIsAssociatedWithFragmentMinder:", v3);

}

@end
