@implementation AVMovieTrack

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 0;
}

- (AVMediaDataStorage)mediaDataStorage
{
  return 0;
}

- (CMTimeRange)mediaPresentationTimeRange
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMovieTrack;
  return (CMTimeRange *)-[CMTimeRange mediaPresentationTimeRange](&v4, sel_mediaPresentationTimeRange);
}

- (CMTimeRange)mediaDecodeTimeRange
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMovieTrack;
  return (CMTimeRange *)-[CMTimeRange mediaDecodeTimeRange](&v4, sel_mediaDecodeTimeRange);
}

- (NSInteger)alternateGroupID
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMovieTrack;
  return -[AVAssetTrack alternateGroupID](&v3, sel_alternateGroupID);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVAssetTrack trackID](self, "trackID");
  -[AVAssetTrack mediaType](self, "mediaType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, trackID = %d, mediaType = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieTrackInternal, 0);
}

@end
