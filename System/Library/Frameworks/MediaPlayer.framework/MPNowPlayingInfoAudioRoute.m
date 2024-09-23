@implementation MPNowPlayingInfoAudioRoute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteAudioRoute, 0);
}

- (MPNowPlayingInfoAudioRoute)initWithMediaRemoteAudioRoute:(id)a3
{
  id v5;
  MPNowPlayingInfoAudioRoute *v6;
  MPNowPlayingInfoAudioRoute *v7;
  MPNowPlayingInfoAudioRoute *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MPNowPlayingInfoAudioRoute;
    v6 = -[MPNowPlayingInfoAudioRoute init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_mediaRemoteAudioRoute, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)type
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  -[MPNowPlayingInfoAudioRoute mediaRemoteAudioRoute](self, "mediaRemoteAudioRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");
  if ((unint64_t)(v3 - 1) >= 9)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (void)setType:(int64_t)a3
{
  int64_t v3;
  id v4;

  if ((unint64_t)(a3 - 1) >= 9)
    v3 = 0;
  else
    v3 = a3;
  -[MPNowPlayingInfoAudioRoute mediaRemoteAudioRoute](self, "mediaRemoteAudioRoute");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", v3);

}

- (NSString)name
{
  void *v2;
  void *v3;

  -[MPNowPlayingInfoAudioRoute mediaRemoteAudioRoute](self, "mediaRemoteAudioRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPNowPlayingInfoAudioRoute mediaRemoteAudioRoute](self, "mediaRemoteAudioRoute");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v4);

}

- (BOOL)supportsSpatialization
{
  void *v2;
  char v3;

  -[MPNowPlayingInfoAudioRoute mediaRemoteAudioRoute](self, "mediaRemoteAudioRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsSpatialization");

  return v3;
}

- (void)setSupportsSpatialization:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MPNowPlayingInfoAudioRoute mediaRemoteAudioRoute](self, "mediaRemoteAudioRoute");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportsSpatialization:", v3);

}

- (BOOL)isSpatializationEnabled
{
  void *v2;
  char v3;

  -[MPNowPlayingInfoAudioRoute mediaRemoteAudioRoute](self, "mediaRemoteAudioRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSpatializationEnabled");

  return v3;
}

- (void)setSpatializationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MPNowPlayingInfoAudioRoute mediaRemoteAudioRoute](self, "mediaRemoteAudioRoute");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpatializationEnabled:", v3);

}

- (MRContentItemMetadataAudioRoute)mediaRemoteAudioRoute
{
  MRContentItemMetadataAudioRoute *mediaRemoteAudioRoute;
  MRContentItemMetadataAudioRoute *v4;
  MRContentItemMetadataAudioRoute *v5;
  int64_t v6;
  int64_t v7;
  void *v8;

  mediaRemoteAudioRoute = self->_mediaRemoteAudioRoute;
  if (!mediaRemoteAudioRoute)
  {
    v4 = (MRContentItemMetadataAudioRoute *)objc_alloc_init(MEMORY[0x1E0D4C540]);
    v5 = self->_mediaRemoteAudioRoute;
    self->_mediaRemoteAudioRoute = v4;

    v6 = -[MPNowPlayingInfoAudioRoute type](self, "type");
    if ((unint64_t)(v6 - 1) >= 9)
      v7 = 0;
    else
      v7 = v6;
    -[MRContentItemMetadataAudioRoute setType:](self->_mediaRemoteAudioRoute, "setType:", v7);
    -[MPNowPlayingInfoAudioRoute name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadataAudioRoute setName:](self->_mediaRemoteAudioRoute, "setName:", v8);

    -[MRContentItemMetadataAudioRoute setSupportsSpatialization:](self->_mediaRemoteAudioRoute, "setSupportsSpatialization:", -[MPNowPlayingInfoAudioRoute supportsSpatialization](self, "supportsSpatialization"));
    -[MRContentItemMetadataAudioRoute setSpatializationEnabled:](self->_mediaRemoteAudioRoute, "setSpatializationEnabled:", -[MPNowPlayingInfoAudioRoute isSpatializationEnabled](self, "isSpatializationEnabled"));
    mediaRemoteAudioRoute = self->_mediaRemoteAudioRoute;
  }
  return mediaRemoteAudioRoute;
}

@end
